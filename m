Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4147D60125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Oct 2015 07:40:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Oct 2015 00:40:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,648,1437462000"; d="scan'208";a="805376140"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 07 Oct 2015 00:40:11 -0700
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 4C3426A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Oct 2015 00:39:14 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Oct 2015 05:53:38 +0300
Message-Id: <1444186418-30587-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
MIME-Version: 1.0
Subject: [PATCH] screen: fix CVE-2015-6806
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
X-List-Received-Date: Wed, 07 Oct 2015 07:40:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backport a patch to fix CVE-2015-6806

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...-stack-overflow-due-to-too-deep-recursion.patch | 57 ++++++++++++++++++++++
 meta/recipes-extended/screen/screen_4.3.1.bb       |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/0001-Fix-stack-overflow-due-to-too-deep-recursion.patch

diff --git a/meta/recipes-extended/screen/screen/0001-Fix-stack-overflow-due-to-too-deep-recursion.patch b/meta/recipes-extended/screen/screen/0001-Fix-stack-overflow-due-to-too-deep-recursion.patch
new file mode 100644
index 0000000..2bc9a59
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/0001-Fix-stack-overflow-due-to-too-deep-recursion.patch
@@ -0,0 +1,57 @@
+Bug: 45713
+
+How to reproduce:
+Run this command inside screen
+$ printf '\x1b[10000000T'
+
+screen will recursively call MScrollV to depth n/256.
+This is time consuming and will overflow stack if n is huge.
+
+Fixes CVE-2015-6806
+
+Upstream-Status: Backport
+
+Signed-off-by: Kuang-che Wu <kcwu@csie.org>
+Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+diff -Naur screen-4.3.1-orig/ansi.c screen-4.3.1/ansi.c
+--- screen-4.3.1-orig/ansi.c	2015-06-29 00:22:55.000000000 +0300
++++ screen-4.3.1/ansi.c	2015-10-06 13:13:58.297648039 +0300
+@@ -2502,13 +2502,13 @@
+     return;
+   if (n > 0)
+     {
++      if (ye - ys + 1 < n)
++	  n = ye - ys + 1;
+       if (n > 256)
+ 	{
+ 	  MScrollV(p, n - 256, ys, ye, bce);
+ 	  n = 256;
+ 	}
+-      if (ye - ys + 1 < n)
+-	n = ye - ys + 1;
+ #ifdef COPY_PASTE
+       if (compacthist)
+ 	{
+@@ -2562,15 +2562,15 @@
+     }
+   else
+     {
+-      if (n < -256)
+-	{
+-	  MScrollV(p, n + 256, ys, ye, bce);
+-	  n = -256;
+-	}
+       n = -n;
+       if (ye - ys + 1 < n)
+ 	n = ye - ys + 1;
+ 
++      if (n > 256)
++      {
++        MScrollV(p, - (n - 256), ys, ye, bce);
++        n = 256;
++      }
+       ml = p->w_mlines + ye;
+       /* Clear lines */
+       for (i = ye; i > ye - n; i--, ml--)
diff --git a/meta/recipes-extended/screen/screen_4.3.1.bb b/meta/recipes-extended/screen/screen_4.3.1.bb
index 92457af..00d878b 100644
--- a/meta/recipes-extended/screen/screen_4.3.1.bb
+++ b/meta/recipes-extended/screen/screen_4.3.1.bb
@@ -24,6 +24,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://Avoid-mis-identifying-systems-as-SVR4.patch \
            file://0001-fix-for-multijob-build.patch \
            file://0002-comm.h-now-depends-on-term.h.patch \
+           file://0001-Fix-stack-overflow-due-to-too-deep-recursion.patch \
           "
 
 SRC_URI[md5sum] = "5bb3b0ff2674e29378c31ad3411170ad"
-- 
2.4.0


