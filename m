Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25112C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 05:55:23 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web12.20536.1664949316148429506
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 22:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25,
 mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ofxNA-00CbDA-KO; Wed, 05 Oct 2022 08:55:13 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ofxNA-007jkt-7k; Wed, 05 Oct 2022 08:55:12 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: [PATCH v3 1/2] wic: add UEFI kernel as UEFI stub
Date: Wed,  5 Oct 2022 08:55:03 +0300
Message-Id: <20221005055504.1836847-1-mikko.rapeli@linaro.org>
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
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20221005055504.1836847-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 05:55:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171441

From: Maxim Uvarov <maxim.uvarov@linaro.org>

Linux kernel can be compiled as UEFI stub and loaded directly
with UEFI firmware without grub or other UEFI shell.

Tested with wic file:
bootloader  --ptable gpt --timeout=0  --append="rootwait"
part /boot --source bootimg-efi --sourceparams="loader=uefi-kernel" \
 --ondisk sda  --fstype=vfat --label bootfs \
  --active --align 1024 --use-uuid
part / --source rootfs --fstype=ext4 --label rootfs \
  --align 1024 --exclude-path boot/ --use-label

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

v3: rebased

v2: https://lists.openembedded.org/g/openembedded-core/topic/72391438#133479

v1: https://lists.openembedded.org/g/openembedded-core/topic/72390749#133061

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 634a808d78..70c55ce2f0 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -220,6 +220,8 @@ class BootimgEFIPlugin(SourcePlugin):
                 cls.do_configure_grubefi(hdddir, creator, cr_workdir, source_params)
             elif source_params['loader'] == 'systemd-boot':
                 cls.do_configure_systemdboot(hdddir, creator, cr_workdir, source_params)
+            elif source_params['loader'] == 'uefi-kernel':
+                return
             else:
                 raise WicError("unrecognized bootimg-efi loader: %s" % source_params['loader'])
         except KeyError:
@@ -385,6 +387,28 @@ class BootimgEFIPlugin(SourcePlugin):
                 for mod in [x for x in os.listdir(kernel_dir) if x.startswith("systemd-")]:
                     cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[8:])
                     exec_cmd(cp_cmd, True)
+            elif source_params['loader'] == 'uefi-kernel':
+                kernel = get_bitbake_var("KERNEL_IMAGETYPE")
+                if not kernel:
+                    raise WicError("Empty KERNEL_IMAGETYPE %s\n" % target)
+                target = get_bitbake_var("TARGET_SYS")
+                if not target:
+                    raise WicError("Unknown arch (TARGET_SYS) %s\n" % target)
+
+                if re.match("x86_64", target):
+                    kernel_efi_image = "bootx64.efi"
+                elif re.match('i.86', target):
+                    kernel_efi_image = "bootia32.efi"
+                elif re.match('aarch64', target):
+                    kernel_efi_image = "bootaa64.efi"
+                elif re.match('arm', target):
+                    kernel_efi_image = "bootarm.efi"
+                else:
+                    raise WicError("UEFI stub kernel is incompatible with target %s" % target)
+
+                for mod in [x for x in os.listdir(kernel_dir) if x.startswith(kernel)]:
+                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, kernel_efi_image)
+                    exec_cmd(cp_cmd, True)
             else:
                 raise WicError("unrecognized bootimg-efi loader: %s" %
                                source_params['loader'])
-- 
2.17.1


