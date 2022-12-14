Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7F3C4167B
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 09:20:53 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.98404.1671009643307484868
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Dec 2022 01:20:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1p5MvO-00D394-8Y; Wed, 14 Dec 2022 10:15:34 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1p5MvN-006lnM-Q3; Wed, 14 Dec 2022 10:15:33 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] runqemu: add QB_SETUP_CMD and QB_CLEANUP_CMD
Date: Wed, 14 Dec 2022 10:15:22 +0200
Message-Id: <20221214081522.1611782-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20221214081522.1611782-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Dec 2022 09:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174551

These enable running custom shell setup and cleanup commands
before and after qemu. Enables machine configurations to for
example run qemu with swtpm to emulate TPM devices.

Example config with meta-tpm2 based swtpm in machine config:

 * image recipe depens on swtpm-native to get the native tools to PATH,
   same handling as qemu itself

do_testimage[depends] += "swtpm-native:do_populate_sysroot"

 * startup commands for swtpm daemon, note that swtpm
   socket file has 107 character limit and absolute paths to build environment
   will not work

QB_SETUP_CMD = " \
   test -d '${IMAGE_BASENAME}_swtpm' || ( mkdir -p '${IMAGE_BASENAME}_swtpm' && \
       swtpm_setup --tpmstate '${IMAGE_BASENAME}_swtpm' --tpm2 --pcr-banks sha256 ); \
   swtpm socket --tpmstate dir='${IMAGE_BASENAME}_swtpm' \
         --ctrl type=unixio,path='${IMAGE_BASENAME}_swtpm/swtpm-sock' \
         --log level=40 --tpm2 -t -d \
"

 * qemu startup command in machine config is configured enable swtpm device

QB_OPT_APPEND += "-chardev socket,id=chrtpm,path='${IMAGE_BASENAME}_swtpm/swtpm-sock' -tpmdev emulator,id=tpm0,chardev=chrtpm -device tpm-tis-device,tpmdev=tpm0"

 * in this case, swtpm daemon stops automatically with qemu machine, but
   QB_CLEANUP_CMD could be used to kill a specific process and wipe
   temporary files

Now runqemu and testimage.bbclass can be used with swtpm.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 scripts/runqemu | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 04728673de..ccc557f308 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1058,6 +1058,13 @@ class BaseConfig(object):
 
         self.nfs_running = True
 
+    def setup_cmd(self):
+        cmd = self.get('QB_SETUP_CMD')
+        if cmd != '':
+            logger.info('Running setup command %s' % str(cmd))
+            if subprocess.call(cmd, shell=True) != 0:
+                raise RunQemuError('Failed to run %s' % cmd)
+
     def setup_net_bridge(self):
         self.set('NETWORK_CMD', '-netdev bridge,br=%s,id=net0,helper=%s -device virtio-net-pci,netdev=net0 ' % (
             self.net_bridge, os.path.join(self.bindir_native, 'qemu-oe-bridge-helper')))
@@ -1526,6 +1533,13 @@ class BaseConfig(object):
             else:
                 logger.error("Failed to run qemu: %s", process.stderr.read().decode())
 
+    def cleanup_cmd(self):
+        cmd = self.get('QB_CLEANUP_CMD')
+        if cmd != '':
+            logger.info('Running cleanup command %s' % str(cmd))
+            if subprocess.call(cmd, shell=True) != 0:
+                raise RunQemuError('Failed to run %s' % cmd)
+
     def cleanup(self):
         if self.cleaned:
             return
@@ -1654,6 +1668,7 @@ def main():
         config.setup_network()
         config.setup_rootfs()
         config.setup_final()
+        config.setup_cmd()
         config.start_qemu()
     except RunQemuError as err:
         logger.error(err)
@@ -1663,6 +1678,7 @@ def main():
         traceback.print_exc()
         return 1
     finally:
+        config.cleanup_cmd()
         config.cleanup()
         # Deliberately ignore the return code of 'tput smam'.
         subprocess.call(["tput", "smam"])
-- 
2.35.1


