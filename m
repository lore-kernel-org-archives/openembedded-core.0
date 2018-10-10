Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D62186FF78
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 07:06:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9A76coE007107
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Oct 2018 00:06:38 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 10 Oct 2018 00:06:38 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<raj.khem@gmail.com>, <alex.kanavin@gmail.com>, <armccurdy@gmail.com>
Date: Wed, 10 Oct 2018 15:16:48 +0800
Message-ID: <1539155808-29595-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20181010055606.12668-1-hongxu.jia@windriver.com>
References: <20181010055606.12668-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V4] webkitgtk/epiphany: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 10 Oct 2018 07:06:39 -0000
Content-Type: text/plain

They can't be built without opengl in DISTRO_FEATURES.
[snip]
|webkitgtk-2.20.3/Source/WebCore/platform/graphics/OpenGLShims.h:23:10:
fatal error: GL/gl.h: No such file or directory
[snip]

Some sort of GL is needed yes. We indicate that with opengl loosely in OE

The epiphany depends on webkitgtk, add opengl to REQUIRED_DISTRO_FEATURES also.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.28.3.1.bb | 2 +-
 meta/recipes-sato/webkit/webkitgtk_2.20.5.bb     | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.28.3.1.bb b/meta/recipes-gnome/epiphany/epiphany_3.28.3.1.bb
index 8837b9c..b46c9d3 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.28.3.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.28.3.1.bb
@@ -8,7 +8,7 @@ DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr \
 
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gsettings distro_features_check upstream-version-is-even gettext
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
index c8d4f94..7f1ffce 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
@@ -30,8 +30,7 @@ SRC_URI[sha256sum] = "15c0f8d26e9605afe0948d161ba5fd82efee8eda2debd409fd40a440ac
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
-# depends on libxt
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
            gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \
-- 
2.7.4


