Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B7BF37F160
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 04:47:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Jul 2019 21:47:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,309,1559545200"; d="scan'208";a="172069557"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga007.fm.intel.com with ESMTP; 25 Jul 2019 21:47:39 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2019 12:47:26 +0800
Message-Id: <1564116449-69248-4-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564116449-69248-1-git-send-email-anuj.mittal@intel.com>
References: <1564116449-69248-1-git-send-email-anuj.mittal@intel.com>
Subject: [warrior][PATCH 4/7] wget: fix CVE-2019-5953
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
X-List-Received-Date: Fri, 26 Jul 2019 04:47:38 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-extended/wget/wget/CVE-2019-5953.patch | 34 ++++++++++++++++++++++
 meta/recipes-extended/wget/wget_1.20.1.bb          |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2019-5953.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2019-5953.patch b/meta/recipes-extended/wget/wget/CVE-2019-5953.patch
new file mode 100644
index 0000000..00efe20
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2019-5953.patch
@@ -0,0 +1,34 @@
+From 692d5c5215de0db482c252492a92fc424cc6a97c Mon Sep 17 00:00:00 2001
+From: Tim Ruehsen <tim.ruehsen@gmx.de>
+Date: Fri, 5 Apr 2019 11:50:44 +0200
+Subject: Fix a buffer overflow vulnerability
+
+* src/iri.c(do_conversion): Reallocate the output buffer to a larger
+  size if it is already full
+Upstream-Status: Backport
+CVE: CVE-2019-5953
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+--- a/src/iri.c
++++ b/src/iri.c
+@@ -188,11 +191,14 @@ do_conversion (const char *tocode, const char *fromcode, char const *in_org, siz
+         }
+       else if (errno == E2BIG) /* Output buffer full */
+         {
++          logprintf (LOG_VERBOSE,
++                    _("Reallocate output buffer len=%d outlen=%d inlen=%d\n"), len, outlen, inlen);
+           tooshort++;
+           done = len;
+-          len = outlen = done + inlen * 2;
+-          s = xrealloc (s, outlen + 1);
+-          *out = s + done;
++          len = done + inlen * 2;
++          s = xrealloc (s, len + 1);
++          *out = s + done - outlen;
++          outlen += inlen * 2;
+         }
+       else /* Weird, we got an unspecified error */
+         {
+-- 
+cgit v1.0-41-gc330
+
diff --git a/meta/recipes-extended/wget/wget_1.20.1.bb b/meta/recipes-extended/wget/wget_1.20.1.bb
index d176bd0..e852a0c 100644
--- a/meta/recipes-extended/wget/wget_1.20.1.bb
+++ b/meta/recipes-extended/wget/wget_1.20.1.bb
@@ -1,5 +1,6 @@
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
+           file://CVE-2019-5953.patch \
           "
 
 SRC_URI[md5sum] = "f6ebe9c7b375fc9832fb1b2028271fb7"
-- 
2.7.4


