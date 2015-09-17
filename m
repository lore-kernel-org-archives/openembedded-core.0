Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A3C5F77000
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 07:53:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8H7r7gR013990
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:53:07 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 17 Sep 2015 00:53:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Sep 2015 00:53:06 -0700
Message-ID: <17f258ff059b4abb6c54e075c9d878c1480bd13a.1442476310.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1442476310.git.liezhi.yang@windriver.com>
References: <cover.1442476310.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] ccache: fix file name too long
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
X-List-Received-Date: Thu, 17 Sep 2015 07:53:07 -0000
Content-Type: text/plain

The all_cppflags change paths to filename which cause file name too long
error when the path is longer than NAME_MAX (usually 255). Strip srcdir
to fix the problem.

[YOCTO #8313]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/ccache/ccache_3.2.3.bb       |    4 ++-
 .../0002-dev.mk.in-fix-file-name-too-long.patch    |   32 ++++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/ccache/files/0002-dev.mk.in-fix-file-name-too-long.patch

diff --git a/meta/recipes-devtools/ccache/ccache_3.2.3.bb b/meta/recipes-devtools/ccache/ccache_3.2.3.bb
index 357df75..97f557a 100644
--- a/meta/recipes-devtools/ccache/ccache_3.2.3.bb
+++ b/meta/recipes-devtools/ccache/ccache_3.2.3.bb
@@ -5,4 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b3c337e7664559a789d9f7a93e5283c1"
 
 SRCREV = "4cad46e8ee0053144bb00919f0dadd20c1f87013"
 
-SRC_URI += "file://0001-Fix-regression-in-recent-change-related-to-zlib-in-n.patch"
+SRC_URI += "file://0001-Fix-regression-in-recent-change-related-to-zlib-in-n.patch \
+            file://0002-dev.mk.in-fix-file-name-too-long.patch \
+"
diff --git a/meta/recipes-devtools/ccache/files/0002-dev.mk.in-fix-file-name-too-long.patch b/meta/recipes-devtools/ccache/files/0002-dev.mk.in-fix-file-name-too-long.patch
new file mode 100644
index 0000000..837cfad
--- /dev/null
+++ b/meta/recipes-devtools/ccache/files/0002-dev.mk.in-fix-file-name-too-long.patch
@@ -0,0 +1,32 @@
+From 71bd0082c6edcf73f054a8a4fa34bd8dd4de7cd7 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 16 Sep 2015 19:45:40 -0700
+Subject: [PATCH] dev.mk.in: fix file name too long
+
+The all_cppflags change paths to filename which cause file name too long
+error when the path is longer than NAME_MAX (usually 255). Strip srcdir
+to fix the problem.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ dev.mk.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dev.mk.in b/dev.mk.in
+index 1261ad3..ec55ac4 100644
+--- a/dev.mk.in
++++ b/dev.mk.in
+@@ -1,7 +1,7 @@
+ # GNU make syntax reigns in this file.
+ 
+ all_cflags += -Werror
+-all_cppflags += -MD -MP -MF .deps/$(subst .._,,$(subst /,_,$<)).d
++all_cppflags += -MD -MP -MF .deps/$(subst .._,,$(subst /,_,$(subst $(srcdir)/,,$<))).d
+ 
+ ASCIIDOC = asciidoc
+ GPERF = gperf
+-- 
+1.7.9.5
+
-- 
1.7.9.5


