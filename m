Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 20E2E6D5A0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2013 13:52:20 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id k15so257920eaj.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2013 05:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Yd9MHu0BVnNg0bA7Ims3vWaFsp7zBR/qZMB8StmgAkI=;
	b=uWjT6pOTapLrH7IWZ+drs1z/yJkmGRqFu9na89SzOY0f6ya5HWao2fId5+4wMTtujJ
	8fCD+e2UaP0N4BPRD4wFTLIm7cKlc/QZL6yI3dO4zB5uZmhRiu+BiahznUDvwlkDPq4h
	tBOPk8T/KMDvS4qDhrHNNZhslBv/6OUeLUsOqnH5ftrl8FqqX8tGAvlhpimjA/ZVduns
	9LZoPIt/JcHi8iHPbJvnusmF4jZjd9dbMVzJQq2/aQNONIeRrODX79JisTBmz9I+p7rY
	SKJp6jm5t5wZm4VtLHid7GQVBPyyw5y5aGu/dIg3PdVb8a4UHsqlt2q10do1N7HCmnWE
	CXzQ==
X-Received: by 10.14.203.70 with SMTP id e46mr4555342eeo.33.1384696341832;
	Sun, 17 Nov 2013 05:52:21 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id g8sm27429580eep.20.2013.11.17.05.52.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Nov 2013 05:52:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Nov 2013 14:52:12 +0100
Message-Id: <1384696338-5390-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1383307932-4041-1-git-send-email-Martin.Jansa@gmail.com>
References: <1383307932-4041-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 1/7] allarch: Always inhibit default dependencies and set empty TARGET_PREFIX
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
X-List-Received-Date: Sun, 17 Nov 2013 13:52:22 -0000

* typical case where we inherit allarch and override PACKAGE_ARCH
  are packagegroup recipes, but those need default dependencies
  inhibited even when they are MACHINE_ARCH or TUNE_PKGARCH.
  I don't know about any recipe which inherits allarch and needs
  default dependencies.
* set empty TARGET_PREFIX
  This has a bit weird reason caused by unsupported setup where
  external-toolchain is used in some DISTRO only for some MACHINEs
  and internal is used for other MACHINEs.
  Because external-toolchain usually comes with different TARGET_PREFIX
  it was causing allarch recipes to have different signatures even
  when they don't use toolchain at all.
  Empty TARGET_PREFIX also helps to find allarch recipes which still
  have default dependency on e.g. virtual/${TARGET_PREFIX}gcc.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/allarch.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 5e13a5b..4a65f77 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -9,12 +9,13 @@ STAGING_DIR_HOST := "${STAGING_DIR_HOST}"
 PACKAGE_ARCH = "all"
 
 python () {
+    # No need for virtual/libc or a cross compiler even for recipes which
+    # change PACKAGE_ARCH e.g. to MACHINE_ARCH
+    d.setVar("INHIBIT_DEFAULT_DEPS","1")
+
     # Allow this class to be included but overridden - only set
     # the values if we're still "all" package arch.
     if d.getVar("PACKAGE_ARCH") == "all":
-        # No need for virtual/libc or a cross compiler
-        d.setVar("INHIBIT_DEFAULT_DEPS","1")
-
         # Set these to a common set of values, we shouldn't be using them other that for WORKDIR directory
         # naming anyway
         d.setVar("TARGET_ARCH", "allarch")
@@ -23,6 +24,7 @@ python () {
         d.setVar("TARGET_LD_ARCH", "none")
         d.setVar("TARGET_AS_ARCH", "none")
         d.setVar("PACKAGE_EXTRA_ARCHS", "")
+        d.setVar("TARGET_PREFIX", "")
 
         # No need to do shared library processing or debug symbol handling
         d.setVar("EXCLUDE_FROM_SHLIBS", "1")
-- 
1.8.4.3


