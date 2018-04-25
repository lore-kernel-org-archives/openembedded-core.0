Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5D26672EA2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 06:42:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3P6g2hx021973
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2018 23:42:02 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 24 Apr 2018 23:42:02 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Apr 2018 14:13:03 +0800
Message-ID: <b5fe785e20912e151178454e2e94931c414b2ba4.1524636386.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1524636386.git.kai.kang@windriver.com>
References: <cover.1524636386.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] gst-validate: 1.12.4 -> 1.14.0
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
X-List-Received-Date: Wed, 25 Apr 2018 06:42:01 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade gst-validate from 1.12.4 to 1.14.0:

* fix out of source tree build error

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../gstreamer/gst-validate/out-of-tree-build.patch | 30 ++++++++++++++++++++++
 ...t-validate_1.12.4.bb => gst-validate_1.14.0.bb} |  8 +++---
 2 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-validate/out-of-tree-build.patch
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.12.4.bb => gst-validate_1.14.0.bb} (81%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate/out-of-tree-build.patch b/meta/recipes-multimedia/gstreamer/gst-validate/out-of-tree-build.patch
new file mode 100644
index 0000000000..2fed18149f
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-validate/out-of-tree-build.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Submitted
+
+https://bugzilla.gnome.org/show_bug.cgi?id=795531
+
+Fix build error when out of source tree build.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ gst/validate/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gst/validate/Makefile.am b/gst/validate/Makefile.am
+index 342730a..0e6ed28 100644
+--- a/gst/validate/Makefile.am
++++ b/gst/validate/Makefile.am
+@@ -50,12 +50,12 @@ nodist_libgstvalidate_@GST_API_VERSION@include_HEADERS = $(built_header_make)
+ 
+ gst-validate-enum-types.h: $(source_h)
+ 	$(AM_V_GEN)$(GLIB_MKENUMS) \
+-	--template gst-validate-enum-types.h.template \
++	--template $(top_srcdir)/gst/validate/gst-validate-enum-types.h.template \
+ 	$^ > gst-validate-enum-types.h
+ 
+ gst-validate-enum-types.c: $(source_h)
+ 	$(AM_V_GEN)$(GLIB_MKENUMS) \
+-	--template gst-validate-enum-types.c.template \
++	--template $(top_srcdir)/gst/validate/gst-validate-enum-types.c.template \
+ 	$^ > gst-validate-enum-types.c
+ 
+ EXTRA_DIST= \
diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.14.0.bb
similarity index 81%
rename from meta/recipes-multimedia/gstreamer/gst-validate_1.12.4.bb
rename to meta/recipes-multimedia/gstreamer/gst-validate_1.14.0.bb
index 0f2585a459..b2fd03d1c6 100644
--- a/meta/recipes-multimedia/gstreamer/gst-validate_1.12.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.14.0.bb
@@ -6,9 +6,11 @@ SECTION = "multimedia"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "bc074d49677081f9c27de11a09165746"
-SRC_URI[sha256sum] = "f9da9dfe6e5d6f5ba3b38c5752b42d3f927715904942b405c2924d3cb77afba1"
+SRC_URI = "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz \
+           file://out-of-tree-build.patch \
+           "
+SRC_URI[md5sum] = "deb8654c912b189388fe585b0fc5bc8f"
+SRC_URI[sha256sum] = "33df08bf77f2895d64b7e8a957de3b930b4da0a8edabfbefcff2eab027eeffdf"
 
 DEPENDS = "json-glib glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
-- 
2.14.1


