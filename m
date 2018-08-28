Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 26CD278FB7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 05:58:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7S5wvSf002890
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 22:58:57 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 27 Aug 2018 22:58:56 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Aug 2018 13:58:55 +0800
Message-ID: <1535435935-440809-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libid3tag: patch for CVE-2004-2779
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
X-List-Received-Date: Tue, 28 Aug 2018 05:58:56 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libid3tag/libid3tag/10_utf16.dpatch            | 33 ++++++++++++++++++++++
 .../libid3tag/libid3tag_0.15.1b.bb                 |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.dpatch

diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.dpatch b/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.dpatch
new file mode 100644
index 0000000..8d09ce7
--- /dev/null
+++ b/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.dpatch
@@ -0,0 +1,33 @@
+libid3tag: patch for CVE-2004-2779
+
+The patch comes from
+https://sources.debian.org/patches/libid3tag/0.15.1b-13/10_utf16.dpatch
+
+Upstream-Status: Pending
+
+CVE: CVE-2004-2779
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+diff -urNad libid3tag-0.15.1b/utf16.c /tmp/dpep.tKvO7a/libid3tag-0.15.1b/utf16.c
+--- libid3tag-0.15.1b/utf16.c	2006-01-13 15:26:29.000000000 +0100
++++ /tmp/dpep.tKvO7a/libid3tag-0.15.1b/utf16.c	2006-01-13 15:27:19.000000000 +0100
+@@ -282,5 +282,18 @@
+ 
+   free(utf16);
+ 
++  if (end == *ptr && length % 2 != 0)
++  {
++     /* We were called with a bogus length.  It should always
++      * be an even number.  We can deal with this in a few ways:
++      * - Always give an error.
++      * - Try and parse as much as we can and
++      *   - return an error if we're called again when we
++      *     already tried to parse everything we can.
++      *   - tell that we parsed it, which is what we do here.
++      */
++     (*ptr)++;
++  }
++
+   return ucs4;
+ }
diff --git a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
index f6139d6..fe31646 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
+++ b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
@@ -13,6 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/mad/libid3tag-${PV}.tar.gz \
            file://addpkgconfig.patch \
            file://obsolete_automake_macros.patch \
            file://0001-Fix-gperf-3.1-incompatibility.patch \
+           file://10_utf16.dpatch \
            "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mad/files/libid3tag/"
 UPSTREAM_CHECK_REGEX = "/projects/mad/files/libid3tag/(?P<pver>.*)/$"
-- 
2.7.4


