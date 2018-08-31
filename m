Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D4731795DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 15:40:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7VFeixn009812
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 Aug 2018 08:40:45 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 31 Aug 2018 08:40:44 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Aug 2018 23:02:42 +0800
Message-ID: <20180831150242.11124-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180831150242.11124-1-kai.kang@windriver.com>
References: <20180831150242.11124-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] webkit: 2.20.3 -> 2.20.5
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
X-List-Received-Date: Fri, 31 Aug 2018 15:40:45 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade webkitgtk from 2.20.3 to 2.20.5.

* include fix of CVE-2018-12911
* backport patch for fix CVE-2017-17821

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0001-webkitgtk-fix-CVE-2017-17821.patch   | 44 +++++++++++++++++++
 ...ebkitgtk_2.20.3.bb => webkitgtk_2.20.5.bb} |  5 ++-
 2 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-webkitgtk-fix-CVE-2017-17821.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.20.3.bb => webkitgtk_2.20.5.bb} (96%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-webkitgtk-fix-CVE-2017-17821.patch b/meta/recipes-sato/webkit/webkitgtk/0001-webkitgtk-fix-CVE-2017-17821.patch
new file mode 100644
index 0000000000..a3f7599276
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-webkitgtk-fix-CVE-2017-17821.patch
@@ -0,0 +1,44 @@
+Backport patch to fix CVE-2017-17821. Refer to
+https://security-tracker.debian.org/tracker/CVE-2017-17821.
+
+Upstream-Status: Backport [https://trac.webkit.org/changeset/232119/webkit]
+CVE: CVE-2017-17821
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 2a17b15297eb886b0bfb7d098ef607cfad6c3da0 Mon Sep 17 00:00:00 2001
+From: "mcatanzaro@igalia.com"
+ <mcatanzaro@igalia.com@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
+Date: Wed, 23 May 2018 17:54:01 +0000
+Subject: [PATCH] Prohibit shrinking the FastBitVector
+ https://bugs.webkit.org/show_bug.cgi?id=181020
+
+Reviewed by Oliver Hunt.
+
+Prohibit shrinking the FastBitVector. It's not prepared for this and the current usage does
+not require it.
+
+* wtf/FastBitVector.cpp:
+(WTF::FastBitVectorWordOwner::resizeSlow):
+
+git-svn-id: http://svn.webkit.org/repository/webkit/trunk@232119 268f45cc-cd09-0410-ab3c-d52691b4dbfc
+---
+ Source/WTF/wtf/FastBitVector.cpp |  2 ++
+ 2 files changed, 15 insertions(+)
+
+diff --git a/Source/WTF/wtf/FastBitVector.cpp b/Source/WTF/wtf/FastBitVector.cpp
+index eed316975f4..8b019aaa3ed 100644
+--- a/Source/WTF/wtf/FastBitVector.cpp
++++ b/Source/WTF/wtf/FastBitVector.cpp
+@@ -42,6 +42,8 @@ void FastBitVectorWordOwner::setEqualsSlow(const FastBitVectorWordOwner& other)
+ void FastBitVectorWordOwner::resizeSlow(size_t numBits)
+ {
+     size_t newLength = fastBitVectorArrayLength(numBits);
++
++    RELEASE_ASSERT(newLength >= arrayLength());
+     
+     // Use fastCalloc instead of fastRealloc because we expect the common
+     // use case for this method to be initializing the size of the bitvector.
+-- 
+2.17.0
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
similarity index 96%
rename from meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
index a528c5d891..c8d4f94f19 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
@@ -22,10 +22,11 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://detect-gstreamer-gl.patch \
            file://0012-soup-Forward-declare-URL-class.patch \
            file://0001-Fix-PaintingData-has-no-member-named-lightVector-on-.patch \
+           file://0001-webkitgtk-fix-CVE-2017-17821.patch \
            "
 
-SRC_URI[md5sum] = "efb69a0cc3cc67ef2647efec22e44c69"
-SRC_URI[sha256sum] = "579b307d78fa16a73f112790178022166d7ad17d4147492ced9b9fba48f20dd8"
+SRC_URI[md5sum] = "72a05f6a4dc1c78b079590a8fd280401"
+SRC_URI[sha256sum] = "15c0f8d26e9605afe0948d161ba5fd82efee8eda2debd409fd40a440ac3af990"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
-- 
2.18.0


