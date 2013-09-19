Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id D1D576C962
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 20:48:57 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id k15so3978143qaq.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 13:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding:organization;
	bh=qtJ7cyKyOSUYnyOxXBXzfC1+TyP4gB/xj1GT333jCaw=;
	b=EkC195QkUktYv6jA7c3uFZ+d1Fn+7/WCSGnN65O8Px9CnITIEJE/CLqhuuS60NJrKj
	yF6uREECrdWnS8XyEkkji3pAZd9UuxnhScPQv0bSGKq87cZLJVAEw2DcdO+8cVwayGX9
	bMK5j8sElK52t64Lb1VUgFNQau41PRVbE40s2tF7EjIYGK2WCib92jivPpj6t1b5XUw8
	4yHi6qPjQJyXe6EVdB3+FSHxR/xZjiS5WRA2rFik9NPWJXHEf1+r8QdxPf0iSKnoyXIK
	SbIoOO2OLd293yzG7J85/Vj6maSmV5LKMs1s1XUVMPS+u6hEObUGdCbcSHdeNkM1rMxi
	qvHg==
X-Received: by 10.224.47.9 with SMTP id l9mr1012769qaf.120.1379623739334;
	Thu, 19 Sep 2013 13:48:59 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.209.11])
	by mx.google.com with ESMTPSA id h20sm13258086qen.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 13:48:58 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Sep 2013 17:48:37 -0300
Message-Id: <1379623718-29690-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <1379623718-29690-1-git-send-email-otavio@ossystems.com.br>
References: <1379623718-29690-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 2/3] uboot-config.bbclass: Handle UBOOT_MACHINE setting
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
X-List-Received-Date: Thu, 19 Sep 2013 20:48:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The class now consolidate the handle of UBOOT_MACHINE and UBOOT_CONFIG
variables and handle possible mistakes done by user when using these
variables.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes in v2:
- Fix grammar in messages (added 'the' and dropped 'are') - Hans Beckérus

 meta/classes/uboot-config.bbclass | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index 44b46ff..09a0c0f 100644
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
+        raise bb.parse.SkipPackage("Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the %s machine configuration." % d.getVar("MACHINE", True))
+
+    if ubootmachine and ubootconfigflags:
+        raise bb.parse.SkipPackage("You cannot use UBOOT_MACHINE and UBOOT_CONFIG at the same time.")
+
     if not ubootconfigflags:
         return
 
-- 
1.8.4.rc3


