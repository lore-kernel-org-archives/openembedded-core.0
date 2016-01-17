Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3EC0676102
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:26 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id cy9so418761194pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Wfj1JOpKdvBOo3gY3y34N8ZFlS9kvjTR+vw3absvNUk=;
	b=Z8TegyonTwkYMTgdiJ8qGfkJmgJgN1Y7GYpSIw4XlPXnQNwwlm/Drj1IkSIQMbI+GU
	/0Dr2ZlGIQqOCpjSVxHUeQ5dO675Wycx/eMqnO4vNFatqfkEpNNMKvMSXpihchdsBTnz
	4j6JBOBLFVWnY/LMPh5HEh6asSZeqMgjJz3sWUu41XYqnFNah1EJ4vKcrdayTg3o4Gkp
	TxUKvfXHBnE0z4QKoUW9roS8ljwJz3VceDVb867hKUD2m6FU0ARMxHT3yeLfCJkWY0ry
	a94uCfT/EBM5sOk2O9P770gOUSobnGTpgddPCnD9ynNV1xeayRutpEf+Ge4fPhfn33GA
	JMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Wfj1JOpKdvBOo3gY3y34N8ZFlS9kvjTR+vw3absvNUk=;
	b=PnBzAuVe3y7auPJ8wrkSAFrEneB007bojQS8iCZXBPcSzKo5mKluhn0lAh9richoxA
	cGu7xXP/Vgwhdi2AoasVOscZTdPd+f881g1yjduBXHdxTDAeRBgguSGgjQXUaPOsAx9+
	mVRzEG3UubfON3qRKv6bU9MGsA6L2Hvs4p4eSzcggS5f5oGaXFnDqs5HRpLIsZUJFCFB
	5a/LDsPYac7FhQXBW5BSACqvPSg3d+3Z6p/emVov2oVLIJsDae1sfSnrfd6xrZ3zxi6g
	/eQeNYqOB5ama+HJKrByOn+zcM5ShxHP8GaPF/cGGz2GXJYqP1E7wRPAAJjwQZoGbswc
	QuAw==
X-Gm-Message-State: ALoCoQlx9mJwsV+QjYbZOj67b/ysSsJ3l/fl0bzBE997dyatCIc/+GnltI/cwaOCR9UGuHAU7TXJLuBvYVA3yMD6HV2MkHbeZA==
X-Received: by 10.66.142.201 with SMTP id ry9mr28957276pab.89.1453030647040;
	Sun, 17 Jan 2016 03:37:27 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:02 -0800
Message-Id: <99d1de2ab8d83e5b10dfbd809f90ea7280b4aa24.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 29/73] apt: Add support for building for musl targets
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:26 -0000

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


