Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 56403769F8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:47 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id e32so258873522qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Wfj1JOpKdvBOo3gY3y34N8ZFlS9kvjTR+vw3absvNUk=;
	b=V0q/G+Msqh++RBDJrF0klcMBHUlvx3LC6XgAsE7slGm/vJe2oEpY1PszatSxTVHvY5
	wS8NshuMVuUAj5VVNpohDL4+Lj/mrBvSSwdHbsFJimiaYTLs5CcggLUdF7l43xFN/ya7
	TbiMm0V4Op7VnC2wmYb8hcf50UU6boyAtbc7uLOgzy9dXDLzzI65Xp0dECv13LKZXWs9
	WzsUPmXrOF/mZLptYttxRPKE+QjVbGtYOhIe+bmuZ587L4SdyD7rKzqZmzb/CnTPcUpp
	jFohghoOHUwIx4THPvVHM5MNhjrbQQvkLqntuTrurvNGsUXO9HSLti3UuqqhZRe8qNtb
	qJyg==
X-Received: by 10.140.105.36 with SMTP id b33mr144356144qgf.94.1452248388130; 
	Fri, 08 Jan 2016 02:19:48 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:59 +0000
Message-Id: <e95de7c89a0558417efb6c0f4ae6817b1a6fb602.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 31/53] apt: Add support for building for musl targets
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:47 -0000

Turn bzip2 support into a PACKAGECONFIG
zlibs is a must have and therefore add it to DEPENDS will make the build
consistent

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/apt/apt.inc                  |  1 +
 ....mak-musl-based-systems-can-generate-shar.patch | 29 ++++++++++++++++++++++
 meta/recipes-devtools/apt/apt_1.0.10.1.bb          |  3 ++-
 3 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-environment.mak-musl-based-systems-can-generate-shar.patch

diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 312c6a9..78ef5a7 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -11,6 +11,7 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20150805T094928Z/pool/main/
            file://nodoc.patch \
            file://disable-configure-in-makefile.patch \
            file://disable-test.patch \
+           file://0001-environment.mak-musl-based-systems-can-generate-shar.patch \
            "
 SRC_URI[md5sum] = "6505c4297b338adb2087ce87bbc4a276"
 SRC_URI[sha256sum] = "3fb1de9598363c416591d49e3c285458e095b035e6c06d5b944a54e15fc9b543"
diff --git a/meta/recipes-devtools/apt/apt/0001-environment.mak-musl-based-systems-can-generate-shar.patch b/meta/recipes-devtools/apt/apt/0001-environment.mak-musl-based-systems-can-generate-shar.patch
new file mode 100644
index 0000000..042372b
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-environment.mak-musl-based-systems-can-generate-shar.patch
@@ -0,0 +1,29 @@
+From 2f8aa21ace375c18977ed908b291c80a210a93c6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 31 Dec 2015 08:06:12 +0000
+Subject: [PATCH] environment.mak: musl based systems can generate shared
+ objects too
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ buildlib/environment.mak.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/buildlib/environment.mak.in b/buildlib/environment.mak.in
+index b0a8d9d..3a52344 100644
+--- a/buildlib/environment.mak.in
++++ b/buildlib/environment.mak.in
+@@ -68,7 +68,7 @@ NEED_SOCKLEN_T_DEFINE = @NEED_SOCKLEN_T_DEFINE@
+ 
+ # Shared library things
+ HOST_OS = @host_os@
+-ifneq ($(words $(filter gnu% linux-gnu% kfreebsd-gnu% %-gnu,$(HOST_OS))),0)
++ifneq ($(words $(filter gnu% linux-gnu% kfreebsd-gnu% %-gnu linux-musl%,$(HOST_OS))),0)
+    SONAME_MAGIC=-Wl,-soname -Wl,
+    LFLAGS_SO=
+ else
+-- 
+2.6.4
+
diff --git a/meta/recipes-devtools/apt/apt_1.0.10.1.bb b/meta/recipes-devtools/apt/apt_1.0.10.1.bb
index bf77e2a..85c0d56 100644
--- a/meta/recipes-devtools/apt/apt_1.0.10.1.bb
+++ b/meta/recipes-devtools/apt/apt_1.0.10.1.bb
@@ -1,4 +1,4 @@
-DEPENDS = "curl db"
+DEPENDS = "curl db zlib"
 RDEPENDS_${PN} = "dpkg bash debianutils"
 require apt.inc
 
@@ -6,6 +6,7 @@ require apt-package.inc
 
 PACKAGECONFIG ??= "lzma"
 PACKAGECONFIG[lzma] = "ac_cv_lib_lzma_lzma_easy_encoder=yes,ac_cv_lib_lzma_lzma_easy_encoder=no,xz"
+PACKAGECONFIG[bz2] = "ac_cv_lib_bz2_BZ2_bzopen=yes,ac_cv_lib_bz2_BZ2_bzopen=no,bzip2"
 
 FILES_${PN} += "${bindir}/apt-key"
 apt-manpages += "doc/apt-key.8"
-- 
2.7.0


