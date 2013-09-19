Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 816AE6C9D7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 13:28:58 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id c9so5546193qcz.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 06:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=qMJtT9sdSVMAiRvgBvIOQpn83S/UK93rJC+i0Hc52WI=;
	b=Emot8cTliXMT3TeBcqe3nnmrwRGO/dAuVxWTLXMzTFlBD5VV9EDFjDvqM0WwZypcAm
	dbswSThg1ndJk4LaAMR5tto2hmbXBvX5duhZmQLuX6mG1/ppbOr2+V/ZNaWKoT5LIT0e
	JYQsj9grxkGS8xElOCusQi0dL4qxETaGjDa6yonBX6O8gH6Nq1utma2EZ56CYf/NzYw+
	PnnVi6+Xjyx7GXE1n50cnd2qRzMgnnJwVwY111nCRy5U+u/t4Mc1ri+yO97RWT3bQROP
	rgiMi+UlsfF4kyvtBHPCIy2aLZjNz4X2rct8Mih0xE5lUIRk+pDLpWCDK4Hf6Jp0GyEW
	5S3g==
X-Received: by 10.49.25.41 with SMTP id z9mr3597258qef.72.1379597340027;
	Thu, 19 Sep 2013 06:29:00 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.209.11])
	by mx.google.com with ESMTPSA id fy7sm10866448qeb.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 06:28:59 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Sep 2013 10:28:40 -0300
Message-Id: <1379597321-5447-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1379597321-5447-1-git-send-email-otavio@ossystems.com.br>
References: <1379597321-5447-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/3] uboot-config.bbclass: Handle UBOOT_MACHINE setting
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Sep 2013 13:28:58 -0000

The class now consolidate the handle of UBOOT_MACHINE and UBOOT_CONFIG
variables and handle possible mistakes done by user when using these
variables.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/uboot-config.bbclass | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index 44b46ff..b81cc60 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -1,14 +1,30 @@
-# Allow easy override of U-Boot config for a machine
+# Handle U-Boot config for a machine
 #
 # The format to specify it, in the machine, is:
 #
 # UBOOT_CONFIG ??= <default>
 # UBOOT_CONFIG[foo] = "config,images"
 #
+# or
+#
+# UBOOT_MACHINE = "config"
+#
 # Copyright 2013 (C) O.S. Systems Software LTDA.
 
 python () {
+    ubootmachine = d.getVar("UBOOT_MACHINE", True)
     ubootconfigflags = d.getVarFlags('UBOOT_CONFIG')
+
+    if not ubootmachine and not ubootconfigflags:
+        PN = d.getVar("PN", True)
+        FILE = os.path.basename(d.getVar("FILE", True))
+        bb.debug(1, "To build %s, see %s for instructions on \
+                 setting up your machine config" % (PN, FILE))
+        raise bb.parse.SkipPackage("Either UBOOT_MACHINE or UBOOT_CONFIG are must be set in the %s machine configuration." % d.getVar("MACHINE", True))
+
+    if ubootmachine and ubootconfigflags:
+        raise bb.parse.SkipPackage("You cannot use UBOOT_MACHINE and UBOOT_CONFIG at same time.")
+
     if not ubootconfigflags:
         return
 
-- 
1.8.4.rc3


