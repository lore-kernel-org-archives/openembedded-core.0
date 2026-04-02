Return-Path: <pavel@loebl.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173EBD6AB0A
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 20:30:32 +0000 (UTC)
Received: from mxb.seznam.cz (mxb.seznam.cz [77.75.76.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5707.1775161828691095516
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 13:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emailprofi.seznam.cz header.s=szn1 header.b=Ywm24qUb;
 spf=none, err=permanent DNS error (domain: loebl.cz, ip: 77.75.76.89, mailfrom: pavel@loebl.cz)
Received: from email.seznam.cz
	by smtpc-mxb-798b96f97c-dtvjf
	(smtpc-mxb-798b96f97c-dtvjf [2a02:598:128:8a00::1000:904])
	id 25461d683ed490bc21a3a4ea;
	Thu, 02 Apr 2026 22:30:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emailprofi.seznam.cz; s=szn1; t=1775161824;
	bh=5VG4iWkKhcvixp1JHqeU5ICkdYJRaD0tmiOEaByWVrs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=Ywm24qUbDuwIdd7JC0qTF+yRMoGMYwKFjRPrKjOVDgZkRfna42bUTPq0AYPshlGEe
	 Yk+1QtWQiZ/mzSBI2Ipso9JVz9hzKG1zf0OiY8WHWvjNzQjL1n6zYqChsyV/tHZaf/
	 TksQN3WaAp5BH7EGjYWiNAwCOoF1qp1QnsmRvwAcJXI79yi3YAIAYhwFhxxigcpWmi
	 sITPK10UrkyWkm4gEzSCzWru0eg1qKLxSz9rOdX9L+0zf4ytaKMgRioQj8ePYclnDj
	 bwX81VFsBV5bZJaQc8mvpPsP+aOLv2hncJaQ5j3J2Zs5wK5P8xFFG1C8rKvNDkfJsA
	 mjkrrJl8tI5uw==
Received: from localhost ([2a03:a900:1020:47::f71])
	by smtpd-relay-789d8dfb5c-5qc6d (szn-email-smtpd/2.0.71) with ESMTPA
	id f6439073-b3d2-4a62-9a9b-d5d74d8131a3;
	Thu, 02 Apr 2026 22:30:05 +0200
From: =?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
To: openembedded-core@lists.openembedded.org
Cc: Michelle Lin <michelle.linto91@gmail.com>,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	=?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
Subject: [RFC PATCH] uki.bbclass: add multi-profile UKI support
Date: Thu,  2 Apr 2026 22:25:29 +0200
Message-ID: <20260402202616.3177283-1-pavel@loebl.cz>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 20:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234551

Allow generating multi-profile UKI [1]. This is quite usefull for
dual slot A/B deploymets with secureboot active.

Currently only .cmdline sections are supported. But can be easily
extended with others.

[1] https://uapi-group.org/specifications/specs/unified_kernel_image/#multi-profile-ukis

Signed-off-by: Pavel Löbl <pavel@loebl.cz>
---
 meta/classes-recipe/uki.bbclass | 48 +++++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index d16f3c95561e..c2d21304c793 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -59,6 +59,17 @@
 #   - see efi-uki-bootdisk.wks.in how to create ESP partition which hosts systemd-boot,
 #     config file(s) for systemd-boot and the UKI binaries.
 #
+#   - to generate multi-profile UKI (currently only supports .cmdline section)
+#
+#     UKI_PROFILE[0] = "TITLE=Recovery boot"
+#     UKI_PROFILE_CMDLINE[0] = "rootwait recovery"
+#
+#     UKI_PROFILE[1] = "TITLE=Boot from slot A"
+#     UKI_PROFILE_CMDLINE[1] = "rootwait root=LABEL=root_a"
+#
+#     UKI_PROFILE[2] = "TITLE=Boot from slot B"
+#     UKI_PROFILE_CMDLINE[2] = "rootwait root=LABEL=root_b"
+#
 
 DEPENDS += "\
     os-release \
@@ -109,21 +120,46 @@ python do_uki() {
     import glob
     import bb.process
 
-    # base ukify command, can be extended if needed
-    ukify_cmd = d.getVar('UKIFY_CMD')
+    def generate_profiles(ukify_cmd):
+        join_profiles = ""
+        profile_num = 0
+        while (profile := d.getVarFlag("UKI_PROFILE", str(profile_num))):
+            ukify_cmd += " --profile='%s'" % (profile)
+
+            cmdline = d.getVarFlag("UKI_PROFILE_CMDLINE", str(profile_num))
+            if cmdline:
+                ukify_cmd += " --cmdline='%s'" % (cmdline)
+
+            profile_file = "%s/uki-profile%s.efi" % (d.getVar('DEPLOY_DIR_IMAGE') , profile_num)
+            ukify_cmd += " --output=%s" % (profile_file)
+            join_profiles += " --join-profile=%s" % (profile_file)
+
+            bb.debug(2, "uki: running command: %s" % (ukify_cmd))
+            out, err = bb.process.run(ukify_cmd, shell=True)
+            bb.debug(2, "%s\n%s" % (out, err))
+
+            profile_num += 1
+
+        return join_profiles
+
 
     deploy_dir_image = d.getVar('DEPLOY_DIR_IMAGE')
 
+    # base ukify command, can be extended if needed
+    ukify_common_cmd = d.getVar('UKIFY_CMD')
+
     # architecture
     target_arch = d.getVar('EFI_ARCH')
     if target_arch:
-        ukify_cmd += " --efi-arch %s" % (target_arch)
+        ukify_common_cmd += " --efi-arch %s" % (target_arch)
 
-    # systemd stubs
+    # systemd stubs, required even for UKI profile generation
     stub = "%s/linux%s.efi.stub" % (d.getVar('DEPLOY_DIR_IMAGE'), target_arch)
     if not os.path.exists(stub):
         bb.fatal(f"ERROR: cannot find {stub}.")
-    ukify_cmd += " --stub %s" % (stub)
+    ukify_common_cmd += " --stub %s" % (stub)
+
+    ukify_cmd = ukify_common_cmd
 
     # initrd
     uki_fstype = d.getVar("INITRAMFS_FSTYPES").split()[0]
@@ -185,6 +221,8 @@ python do_uki() {
     if cert:
         ukify_cmd += " --secureboot-certificate='%s'" % (cert)
 
+    ukify_cmd += generate_profiles(ukify_common_cmd)
+
     # custom output UKI filename
     output = " --output=%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('UKI_FILENAME'))
     ukify_cmd += " %s" % (output)
-- 
2.53.0


