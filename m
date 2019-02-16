Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4CE2F7C7A8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 21:46:48 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id v16so14029461wrn.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 13:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=4s1ETKMJc+W87dwKBUgesoGy9IIY6BvQc1VDsRL3l1w=;
	b=VDWSr32gJbJ1OiHJnRwK5jDXP8FUd9SqV4koCGRxupq28hjCKO83g9vDW/znYUnPTB
	fcA8rbXSS+JviyW2/YZK1u3oLXNM4iehvP+ro+evZENWJPj5QbJASMFgpEVFn/PBFf2w
	PKKu87WJlI+4AsCa8tTx3AcbDa/96153m35PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4s1ETKMJc+W87dwKBUgesoGy9IIY6BvQc1VDsRL3l1w=;
	b=tz+fiBRrnnLMsp3yxLSJ1gP/SwDKVFG2EdoJL7RgjWHEM4oHM8Ez+nFEN9VOSChG6D
	3qtkzmVgPlNDDS+PxNhqK0u0gbeIJ/NHYxijc5grSI6s8D2uKU2DN0SAi6T4ZcTq30dS
	cgkCbcBqPZ/uGJs9hFn+0XX6gPkBJso8nONEzz1zwH5PGeioqLQMFjiDFJZZbvn/Knyz
	omMxU7GPSwTY9X3pSwkC8fmvBQLeW9hqs1Eji3xyLUI/ubC1M85fiXK1/E9h8QY7Ml4F
	KdSjBUQXVYHQxAeaTmdVUEL2bV0u0NGiMs917SV4xMMtu6/wGYifv+BMjHcKwOpDliUt
	g5zQ==
X-Gm-Message-State: AHQUAuZuAUnqQkejnzng3nT1WXUxLnFrkpnVbN69KluPInpDCF9t1y6e
	hkhu1/3kHSnQs9NoXcl4a9gPM+KXtMM=
X-Google-Smtp-Source: AHgI3IZ4mBaN+4O+OBZUV6fFNQcHa2+UlzQAK1iYcEXR8zoZwS2dp4S0noFI9L1SPQQea42BfXYPuA==
X-Received: by 2002:a5d:6207:: with SMTP id y7mr347340wru.60.1550353608417;
	Sat, 16 Feb 2019 13:46:48 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n6sm7147773wmk.9.2019.02.16.13.46.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Feb 2019 13:46:47 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Feb 2019 21:46:38 +0000
Message-Id: <20190216214638.11456-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190216214638.11456-1-richard.purdie@linuxfoundation.org>
References: <20190216214638.11456-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 7/7] quilt: Merge recipe files into a more coherent form
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
X-List-Received-Date: Sat, 16 Feb 2019 21:46:48 -0000
Content-Transfer-Encoding: 8bit

The style of this recipe is dated, move most of the code into the main
shared include file, making some of the configuration much clearer using
modern overrides to do so.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/quilt/quilt-native.inc  | 18 ----------------
 .../quilt/quilt-native_0.65.bb                |  2 +-
 meta/recipes-devtools/quilt/quilt.inc         | 21 ++++++++++++++++++-
 meta/recipes-devtools/quilt/quilt_0.65.bb     |  6 ------
 4 files changed, 21 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-devtools/quilt/quilt-native.inc

diff --git a/meta/recipes-devtools/quilt/quilt-native.inc b/meta/recipes-devtools/quilt/quilt-native.inc
deleted file mode 100644
index f6b1bd53afa..00000000000
--- a/meta/recipes-devtools/quilt/quilt-native.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-RDEPENDS_${PN} = "diffstat-native patch-native bzip2-native"
-
-INHIBIT_AUTOTOOLS_DEPS = "1"
-
-inherit native
-
-PATCHTOOL = "patch"
-EXTRA_OECONF_append = " --disable-nls"
-
-do_configure () {
-	oe_runconf
-}
-
-do_install_append () {
-	# Dummy quiltrc file for patch.bbclass
-	install -d ${D}${sysconfdir}/
-	touch ${D}${sysconfdir}/quiltrc
-}
diff --git a/meta/recipes-devtools/quilt/quilt-native_0.65.bb b/meta/recipes-devtools/quilt/quilt-native_0.65.bb
index 6bc7dcdb7a7..22374425fa9 100644
--- a/meta/recipes-devtools/quilt/quilt-native_0.65.bb
+++ b/meta/recipes-devtools/quilt/quilt-native_0.65.bb
@@ -1,2 +1,2 @@
 require quilt.inc
-require quilt-native.inc
+inherit native
diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index 48ed9babf7e..150df3d572f 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -11,14 +11,21 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quilt/quilt-${PV}.tar.gz \
         file://0001-tests-Allow-different-output-from-mv.patch \
 "
 
+SRC_URI_append_class-target = " file://gnu_patch_test_fix_target.patch"
+
 SRC_URI[md5sum] = "c67ba0228f5b7b8bbe469474661f92d6"
 SRC_URI[sha256sum] = "f6cbc788e5cbbb381a3c6eab5b9efce67c776a8662a7795c7432fd27aa096819"
 
 inherit autotools-brokensep ptest
 
+INHIBIT_AUTOTOOLS_DEPS_class-native = "1"
+PATCHTOOL_class-native = "patch"
+
 CLEANBROKEN = "1"
 
 EXTRA_OECONF = "--with-perl='${USRBINPATH}/env perl' --with-patch=patch"
+EXTRA_OECONF_append_class-native = " --disable-nls"
+EXTRA_AUTORECONF += "--exclude=aclocal"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_BASH=/bin/bash"
 
@@ -33,6 +40,10 @@ do_configure_append () {
 	sed -e 's,^COMPAT_SYMLINKS.*:=.*,COMPAT_SYMLINKS	:=,' -i ${S}/Makefile
 }
 
+do_configure_class-native () {
+    oe_runconf
+}
+
 # quilt Makefiles install to BUILD_ROOT instead of DESTDIR
 do_install () {
 	oe_runmake 'BUILD_ROOT=${D}' install
@@ -40,6 +51,12 @@ do_install () {
 	rm -rf ${D}/${datadir}/emacs
 }
 
+do_install_append_class-native () {
+    # Dummy quiltrc file for patch.bbclass
+    install -d ${D}${sysconfdir}/
+    touch ${D}${sysconfdir}/quiltrc
+}
+
 do_compile_ptest() {
 	oe_runmake bin/patch-wrapper test/.depend
 }
@@ -61,7 +78,9 @@ FILES_guards = "${bindir}/guards"
 FILES_${PN}-doc = "${mandir}/man1/quilt.1 ${docdir}/${BPN}"
 FILES_guards-doc = "${mandir}/man1/guards.1"
 
-RDEPENDS_${PN} = "bash"
+RDEPENDS_${PN} = "bash patch diffstat bzip2 util-linux"
+RDEPENDS_${PN}_class-native = "diffstat-native patch-native bzip2-native"
+
 RDEPENDS_${PN}-ptest = "make file sed gawk diffutils findutils ed perl \
                         perl-module-filehandle perl-module-getopt-std \
                         perl-module-posix perl-module-file-temp \
diff --git a/meta/recipes-devtools/quilt/quilt_0.65.bb b/meta/recipes-devtools/quilt/quilt_0.65.bb
index 5bf818d0bbc..ff9726576ec 100644
--- a/meta/recipes-devtools/quilt/quilt_0.65.bb
+++ b/meta/recipes-devtools/quilt/quilt_0.65.bb
@@ -1,8 +1,2 @@
 require quilt.inc
 inherit gettext
-
-SRC_URI += "file://gnu_patch_test_fix_target.patch"
-
-EXTRA_AUTORECONF += "--exclude=aclocal"
-
-RDEPENDS_${PN} += "patch diffstat bzip2 util-linux"
-- 
2.20.1


