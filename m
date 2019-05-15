Return-Path: <liu.ming50@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id C80AD7DEB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 19:22:43 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id b8so1344629edm.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 12:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=r22cN/Y5mc5++WPZreLfzuZ4mj7Am2r7CgdDSy2Jiw8=;
	b=ktpzcLmbmycGuXc//IG3qVSlTSMHx9F4PkteQ6wa+iWr52u5RnJOtovIovFDn+CPbW
	L2GFJ79ij5Kp262ZWH7atZOdjO/clsrudlpIxakV3WPqeEXOGILT1dC5iiftj93V/YI9
	smeEvz2BICpkL9QjSZ6nXprNQvI/g6X2HDalYcL0h3IpYZJbZhpEcFTftoJn7+VJ7YlH
	JmtAZ3ssbzf4ZJjs70PHrMJnRMzWzzfbvPIbOtwp6b+4NrhDLcA0oi87rj3vjsW4JNHJ
	WuL1FQNXI++ZDQECME/u9jucwCv6I/D9qV+jh/6q7G/eSDYp//V8QinyyDnuQEdlcm9h
	V7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=r22cN/Y5mc5++WPZreLfzuZ4mj7Am2r7CgdDSy2Jiw8=;
	b=R1J9y0a9aTUeYYz6p1FI5SH0DVEhumTKuM5dtqTolnk+uJKMxjIamj1PaJFHk8rTbL
	9SJelce/Y3y8MKcReiFOMEWoQwt+Ia9xaH4/qqZiss39tJgChOpfm0+nrtn8DvU06GTg
	5mwzBXrMm+7n6r+BfxvRtOELcoXZQAohuQL4S4InzeuS+hDvqhV+7lY4wf3kAML+oTMR
	1ph+jAhTM3Ae1qc0Wg1x7E9CsNW4oMDw8lT79ulow4DWYsJ/r+VWymNr0RMLPgXnnyAK
	+OBKHibUe08eX/RR8xyWHAIiydEV6ILgkL/fo6+XEFJxgrtC5qHqgIYCFJZM/3jK0S/O
	QbAA==
X-Gm-Message-State: APjAAAXqFj4e0LqFPCNUBUqHiOVieacUS2oWfWsDF3r9h4lvsGvaz6NO
	Bgdcp7V20VRX4kJ89tdLkKMO52yNmJA1gg==
X-Google-Smtp-Source: APXvYqzsx/xoeGLza9zOVb20T7aleUVfkGH4tDeq4i8l3rjqL3Qx5TrsUeE+RvwTZzpfWMwlUGDDGA==
X-Received: by 2002:a50:982f:: with SMTP id g44mr45839847edb.278.1557948164311;
	Wed, 15 May 2019 12:22:44 -0700 (PDT)
Received: from peterliu-Precision-M4800.toradex.int
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id i5sm630225ejb.24.2019.05.15.12.22.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 May 2019 12:22:43 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 May 2019 21:22:36 +0200
Message-Id: <1557948156-10879-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: luka.pivk@toradex.com, stefan.agner@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] meta: handle UBOOT_CONFIG in image.bbclass
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
X-List-Received-Date: Wed, 15 May 2019 19:22:44 -0000

From: Ming Liu <liu.ming50@gmail.com>

The code dealing with IMAGE_FSTYPES in uboot-config.bbclass would not
take any effect since it's in a uboot particular class, but it's not
being inherited by any image recipes.

Move the IMAGE_FSTYPES handling part to image.bbclass would make it
really work.

Also drop some trivial debug code.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/image.bbclass        | 12 ++++++++++++
 meta/classes/uboot-config.bbclass | 17 ++++-------------
 meta/conf/documentation.conf      |  2 +-
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index d2b2fb9..b1d63c6 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -365,6 +365,18 @@ python () {
 
         return basetype
 
+    # Check UBOOT_CONFIG
+    ubootconfig = (d.getVar('UBOOT_CONFIG') or "").split()
+    ubootconfigflags = d.getVarFlags('UBOOT_CONFIG')
+    ubootconfigflags.pop('doc', None)
+    if len(ubootconfig) > 0:
+        for config in ubootconfig:
+            for f, v in ubootconfigflags.items():
+                if config == f:
+                    items = v.split(',')
+                    if len(items) > 1 and items[1]:
+                        d.appendVar('IMAGE_FSTYPES', ' ' + items[1])
+
     basetypes = {}
     alltypes = d.getVar('IMAGE_FSTYPES').split()
     typedeps = {}
diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index 89ff970..59dcd04 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -15,18 +15,15 @@ UBOOT_BINARY ?= "u-boot.${UBOOT_SUFFIX}"
 
 python () {
     ubootmachine = d.getVar("UBOOT_MACHINE")
-    ubootconfigflags = d.getVarFlags('UBOOT_CONFIG')
     ubootbinary = d.getVar('UBOOT_BINARY')
     ubootbinaries = d.getVar('UBOOT_BINARIES')
+    ubootconfig = (d.getVar('UBOOT_CONFIG') or "").split()
+    ubootconfigflags = d.getVarFlags('UBOOT_CONFIG')
+
     # The "doc" varflag is special, we don't want to see it here
     ubootconfigflags.pop('doc', None)
-    ubootconfig = (d.getVar('UBOOT_CONFIG') or "").split()
 
     if not ubootmachine and not ubootconfig:
-        PN = d.getVar("PN")
-        FILE = os.path.basename(d.getVar("FILE"))
-        bb.debug(1, "To build %s, see %s for instructions on \
-                 setting up your machine config" % (PN, FILE))
         raise bb.parse.SkipRecipe("Either UBOOT_MACHINE or UBOOT_CONFIG must be set in the %s machine configuration." % d.getVar("MACHINE"))
 
     if ubootmachine and ubootconfig:
@@ -40,18 +37,12 @@ python () {
             for f, v in ubootconfigflags.items():
                 if config == f: 
                     items = v.split(',')
-                    if items[0] and len(items) > 3:
+                    if len(items) == 0 or len(items) > 3:
                         raise bb.parse.SkipRecipe('Only config,images,binary can be specified!')
                     d.appendVar('UBOOT_MACHINE', ' ' + items[0])
-                    # IMAGE_FSTYPES appending
-                    if len(items) > 1 and items[1]:
-                        bb.debug(1, "Appending '%s' to IMAGE_FSTYPES." % items[1])
-                        d.appendVar('IMAGE_FSTYPES', ' ' + items[1])
                     if len(items) > 2 and items[2]:
-                        bb.debug(1, "Appending '%s' to UBOOT_BINARIES." % items[2])
                         d.appendVar('UBOOT_BINARIES', ' ' + items[2])
                     else:
-                        bb.debug(1, "Appending '%s' to UBOOT_BINARIES." % ubootbinary)
                         d.appendVar('UBOOT_BINARIES', ' ' + ubootbinary)
                     break
 }
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 550df20..048ce12 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -439,7 +439,7 @@ TUNEVALID[doc] = "Descriptions, stored as flags, of valid tuning features."
 
 #U
 
-UBOOT_CONFIG[doc] = "Configures the UBOOT_MACHINE and can also define IMAGE_FSTYPES for individual cases."
+UBOOT_CONFIG[doc] = "Configures the UBOOT_MACHINE and can also define IMAGE_FSTYPES, UBOOT_BINARIES for individual cases."
 UBOOT_ENTRYPOINT[doc] = "Specifies the entry point for the U-Boot image."
 UBOOT_LOADADDRESS[doc] = "Specifies the load address for the U-Boot image."
 UBOOT_LOCALVERSION[doc] = "Appends a string to the name of the local version of the U-Boot image."
-- 
2.7.4


