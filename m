Return-Path: <nora.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A91103E19E
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 15:25:24 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16913.1773847521891001696
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 08:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=XrCtdwdY;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: nora.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=X75r6vyNbdfHw4IajiaR1S+lzNQOJjMusct2bR2tb8g=; b=XrCtdwdYUQmqde/lwgLm1N06Q4
	zLAC5jIaLsxC0WMUqj2g2cPWlJJRp+vnA0BLCEqxU0Q6WVSo+mYITxe0tlsuJc+/+0mF/Ibr64dbN
	zSVxf7vebj9hbsv2faRopXJ6G2OFtQjDkrONo07pgOuoGmUCJH0HrYijdM2ke9pqA/Ns4SR3dLVyb
	ruvzMfRRBTeCn3wZ68EtWOU8C9xPoXhay+VeTbc5Q7fySGPDU7K7zTpMrTIth/WSP5BRqo2VoBhgL
	efEC3+OXT9fq+UsMqEmzhY/RH5Mw03eufXmY4WrgWefJFHT5tHNTaYcLPc7sKO9YiR9OmvKE7E7xC
	RfLNWFvA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w2slr-0002r5-1c;
	Wed, 18 Mar 2026 16:25:19 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w2slr-000N5g-1L;
	Wed, 18 Mar 2026 16:25:19 +0100
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH] systemd-bootconf: do not modify build directory in do_install
Date: Wed, 18 Mar 2026 16:24:36 +0100
Message-ID: <20260318152436.27416-1-nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27944/Wed Mar 18 07:24:13 2026)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 15:25:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233407

do_install should only modify ${D}, otherwise rerunning the task will
have inconsistent results. In the case of systemd-bootconf, a second run
of do_install without rerunning do_configure (for example after modifying
it in a bbappend) fails altogether, as loader.conf would be missing.

Rather than fixing this up by deleting loader.conf from ${D} instead of
${S} after copying *.conf, clean up systemd-boot-cfg.bbclass not to
store loader.conf at the same location as the individual entries in the
first place, so they can be copied separately. While we're at it, also
change the recipe to make use of the variables defined by the class.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 meta/classes-recipe/systemd-boot-cfg.bbclass       | 10 ++++++----
 meta/recipes-core/systemd/systemd-bootconf_1.00.bb |  5 ++---
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/systemd-boot-cfg.bbclass b/meta/classes-recipe/systemd-boot-cfg.bbclass
index 12da41ebad7..66403ff5524 100644
--- a/meta/classes-recipe/systemd-boot-cfg.bbclass
+++ b/meta/classes-recipe/systemd-boot-cfg.bbclass
@@ -5,6 +5,7 @@
 #
 
 SYSTEMD_BOOT_CFG ?= "${S}/loader.conf"
+SYSTEMD_BOOT_ENTRIES_DIR ?= "${S}/entries"
 SYSTEMD_BOOT_ENTRIES ?= ""
 SYSTEMD_BOOT_TIMEOUT ?= "10"
 
@@ -15,7 +16,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit fs-uuid
 
 python build_efi_cfg() {
-    s = d.getVar("S")
     labels = d.getVar('LABELS')
     if not labels:
         bb.debug(1, "LABELS not defined, nothing to do")
@@ -43,12 +43,14 @@ python build_efi_cfg() {
         cfgfile.write('timeout 10\n')
     cfgfile.close()
 
+    entries_dir = d.getVar('SYSTEMD_BOOT_ENTRIES_DIR')
+    if not os.path.exists(entries_dir):
+        os.makedirs(entries_dir)
+
     for label in labels.split():
         localdata = d.createCopy()
 
-        entryfile = "%s/%s.conf" % (s, label)
-        if not os.path.exists(s):
-            os.makedirs(s)
+        entryfile = "%s/%s.conf" % (entries_dir, label)
         d.appendVar("SYSTEMD_BOOT_ENTRIES", " " + entryfile)
         try:
             entrycfg = open(entryfile, "w")
diff --git a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
index 5efac3e4106..53b634ddc2f 100644
--- a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
+++ b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
@@ -24,9 +24,8 @@ do_install() {
 	install -d ${D}/boot
 	install -d ${D}/boot/loader
 	install -d ${D}/boot/loader/entries
-	install loader.conf ${D}/boot/loader/
-	rm loader.conf
-	install *.conf ${D}/boot/loader/entries/
+	install ${SYSTEMD_BOOT_CFG} ${D}/boot/loader/
+	install ${SYSTEMD_BOOT_ENTRIES_DIR}/*.conf ${D}/boot/loader/entries/
 }
 
 FILES:${PN} = "/boot/loader/* /boot/loader/entries/*"
-- 
2.53.0


