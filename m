Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D3BCA6087D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 00:57:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s630vrG8021917
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Jul 2014 17:57:53 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 2 Jul 2014 17:57:52 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Jul 2014 19:57:45 -0500
Message-ID: <b8036b2d6e9d4d1f411cc64780abea4ab4dc9b4a.1404348351.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1404348351.git.mark.hatle@windriver.com>
References: <cover.1404348351.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [v2 PATCH 5/7] rpm: Replace patch with backport from SCM version of RPM5
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
X-List-Received-Date: Thu, 03 Jul 2014 00:57:52 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../rpm/rpm/rpm-verify-files.patch                 | 22 -------------
 ...broken-logic-for-ghost-avoidance-Mark-Hat.patch | 38 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |  2 +-
 3 files changed, 39 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-verify-files.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-verify-files.patch b/meta/recipes-devtools/rpm/rpm/rpm-verify-files.patch
deleted file mode 100644
index 3492da5..0000000
--- a/meta/recipes-devtools/rpm/rpm/rpm-verify-files.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-lib/verify.c: Fix rpm -V file processing
-
-rpm -V should verify the md5sum and other values on individual files.
-A logic error in the query for GHOST files prevented this from working.
-
-[ Upstream-Status: Submitted ]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Index: rpm-5.4.14/lib/verify.c
-===================================================================
---- rpm-5.4.14.orig/lib/verify.c
-+++ rpm-5.4.14/lib/verify.c
-@@ -589,7 +589,7 @@ uint32_t fc = rpmfiFC(fi);
- 
- 	/* If not verifying %ghost, skip ghost files. */
- 	/* XXX the broken!!! logic disables %ghost queries always. */
--	if (!(FF_ISSET(qva->qva_fflags, GHOST) && FF_ISSET(fflags, GHOST)))
-+	if (!(FF_ISSET(qva->qva_fflags, GHOST)) && FF_ISSET(fflags, GHOST))
- 	    continue;
- 
- 	/* Gather per-file data into a carrier. */
diff --git a/meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch b/meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch
new file mode 100644
index 0000000..5a70f14
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch
@@ -0,0 +1,38 @@
+From 9e7b72ee0c994609975981e135fc18d0387aefb6 Mon Sep 17 00:00:00 2001
+From: jbj <jbj>
+Date: Wed, 14 May 2014 21:19:41 +0000
+Subject: [PATCH] - verify: fix: broken logic for %ghost avoidance (Mark
+ Hatle).
+
+Upstream-status: backport
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+---
+ CHANGES      | 1 +
+ lib/verify.c | 3 +--
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: rpm-5.4.14/CHANGES
+===================================================================
+--- rpm-5.4.14.orig/CHANGES
++++ rpm-5.4.14/CHANGES
+@@ -1,3 +1,5 @@
++    - jbj: verify: fix: broken logic for %ghost avoidance (Mark Hatle).
++
+ 5.4.13 -> 5.4.14:
+     - mooney: use __sun instead of __sun__ in #define (lp#1243472).
+     - mooney: rpmconstant: ensure linkage w Oracle Studio 12.3 (lp#1243469).
+Index: rpm-5.4.14/lib/verify.c
+===================================================================
+--- rpm-5.4.14.orig/lib/verify.c
++++ rpm-5.4.14/lib/verify.c
+@@ -588,8 +588,7 @@ uint32_t fc = rpmfiFC(fi);
+ 	    continue;
+ 
+ 	/* If not verifying %ghost, skip ghost files. */
+-	/* XXX the broken!!! logic disables %ghost queries always. */
+-	if (!(FF_ISSET(qva->qva_fflags, GHOST) && FF_ISSET(fflags, GHOST)))
++	if (!FF_ISSET(qva->qva_fflags, GHOST) && FF_ISSET(fflags, GHOST))
+ 	    continue;
+ 
+ 	/* Gather per-file data into a carrier. */
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index e1c6abb..cc836be 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -86,7 +86,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
 	   file://rpm-platform-file-fix.patch \
 	   file://rpm-lsb-compatibility.patch \
 	   file://rpm-tag-generate-endian-conversion-fix.patch \
-	   file://rpm-verify-files.patch \
+	   file://verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch \
 	   file://rpm-hardlink-segfault-fix.patch \
 	   file://rpm-payload-use-hashed-inode.patch \
 	   file://rpm-fix-logio-cp.patch \
-- 
1.9.3


