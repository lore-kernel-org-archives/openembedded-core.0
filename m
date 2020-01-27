Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 67BBC7FC2E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 15:43:32 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id d16so11881250wre.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 07:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ayvmig4Mf0MD1mhMlkWreDUhZczLoYtQBDZ2g9i8iGg=;
	b=gU077XxMBdxhhYLIhtSYCYLW4KqfhsZu1f3bu9SREjy5gF3r+o7/NXo8t4YE2kFCFI
	rE5S8Kq8JSOAFE8G+NU+a+TUroWCa2dA3+kVjYAnKm+mJAMCsNnEd+e/HrG211wmExWe
	TDmDmQnMs/RD8WDfb41oLyNJhp6C3ejHumI9w8OaO0CEf8mRnOPdM2UygSAPWRI7Mc1F
	J6tB5VFwZJd7GPCrczNAT/xrnVks08cq0XdCdIrwSI8Xw8Wxpcw4o+ufp6Oc+zwjXAnf
	vwGPWxQ4HwbEM5pZBl9yhKTxkWtBPKOHZ6n3Bbhsnt+ybzt96CMBJ0PxEz4DWiX2doJc
	7Lgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ayvmig4Mf0MD1mhMlkWreDUhZczLoYtQBDZ2g9i8iGg=;
	b=KGxp28atPZYA53s2yMVjyfoCQCjChBdCOwrHk2qn8QvRA5UYZffBesZOFbJqQD/9x5
	Eiu141HUgg1S4dm1JHfDvww+/gi1a9ehWNZWy45bT3Cqu1FpETUGbLC0q1nL5NXMMi6N
	Bydjrsyp8Gb7dPQgIMxC6lC4whqJL4IOTPVU0t+21SOh4FWkAyQ/Hat8vnJ324TvdQ5g
	Qb7Nt18BGVuskNxrRMbBSx+qrIH1IzahYeH3e8soB0levsJBmVaPPQ/RuawDlIVoIU1j
	JVteH5vhKW48fIyEhzBz8zKy40Gt3814ZhmSeo645EHWqG3O8r8IbnSmJBcApkPdcznX
	+SDA==
X-Gm-Message-State: APjAAAWDGDqChAxypaayFEZEE0I/D0Ick2Wb5nu4eIeulFRdXPZzi4XQ
	VhzO+mrd6LqD9stnAAUnXHGfZaLz
X-Google-Smtp-Source: APXvYqwmwiKKUdSxqKrUFN6CylqWvLtL+QimOliVjGtDjsYI1ziQQyLfA7xSy409pNr8+8APWEq26A==
X-Received: by 2002:adf:fe43:: with SMTP id m3mr23901895wrs.213.1580139813071; 
	Mon, 27 Jan 2020 07:43:33 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id 16sm18867143wmi.0.2020.01.27.07.43.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 07:43:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jan 2020 16:43:30 +0100
Message-Id: <20200127154330.32269-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] nspr, nss: use ${includedir}/nspr like e.g. ubuntu does
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
X-List-Received-Date: Mon, 27 Jan 2020 15:43:33 -0000
Content-Transfer-Encoding: 8bit

* instead of installing all 51 nspr header files directly in ${includedir}

* ubuntu uses /usr/include/nspr as well as shown in:
  https://packages.ubuntu.com/xenial/amd64/libnspr4-dev/filelist
  and some components assume the same path

* update nss configure to find them, similar change might be needed in
  mozjs and ecryptfs-utils

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/nspr/nspr/nspr.pc.in | 2 +-
 meta/recipes-support/nspr/nspr_4.24.bb    | 4 ++++
 meta/recipes-support/nss/nss/nss.pc.in    | 2 +-
 meta/recipes-support/nss/nss_3.49.1.bb    | 4 +++-
 4 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/nspr/nspr/nspr.pc.in b/meta/recipes-support/nspr/nspr/nspr.pc.in
index d74caabe4c..1f15d19cfa 100644
--- a/meta/recipes-support/nspr/nspr/nspr.pc.in
+++ b/meta/recipes-support/nspr/nspr/nspr.pc.in
@@ -8,4 +8,4 @@ Name: NSPR
 Description: The Netscape Portable Runtime
 Version: NSPRVERSION
 Libs: -L${libdir} -lplds4 -lplc4 -lnspr4 -lpthread -ldl
-Cflags:
+Cflags: -I${includedir}/nspr
diff --git a/meta/recipes-support/nspr/nspr_4.24.bb b/meta/recipes-support/nspr/nspr_4.24.bb
index 5f823f8941..e98fe83ed3 100644
--- a/meta/recipes-support/nspr/nspr_4.24.bb
+++ b/meta/recipes-support/nspr/nspr_4.24.bb
@@ -156,6 +156,10 @@ MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/nspr-config"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
+# Do not install nspr in usr/include, but in usr/include/nspr, the
+# preferred path upstream.
+EXTRA_OECONF += "--includedir=${includedir}/nspr"
+
 do_compile_prepend() {
 	oe_runmake CROSS_COMPILE=1 CFLAGS="-DXP_UNIX ${BUILD_CFLAGS}" LDFLAGS="" CC="${BUILD_CC}" -C config export
 }
diff --git a/meta/recipes-support/nss/nss/nss.pc.in b/meta/recipes-support/nss/nss/nss.pc.in
index 200f635c65..402b4ecb33 100644
--- a/meta/recipes-support/nss/nss/nss.pc.in
+++ b/meta/recipes-support/nss/nss/nss.pc.in
@@ -7,5 +7,5 @@ Name: NSS
 Description: Network Security Services
 Version: %NSS_VERSION%
 Requires: nspr >= %NSPR_VERSION%
-Libs: -lssl3 -lsmime3 -lnss3 -lsoftokn3 -lnssutil3
+Libs: -L${libdir} -lssl3 -lsmime3 -lnss3 -lsoftokn3 -lnssutil3
 Cflags: -IOEINCDIR
diff --git a/meta/recipes-support/nss/nss_3.49.1.bb b/meta/recipes-support/nss/nss_3.49.1.bb
index 94f4b88fa5..b16ade9f62 100644
--- a/meta/recipes-support/nss/nss_3.49.1.bb
+++ b/meta/recipes-support/nss/nss_3.49.1.bb
@@ -52,7 +52,7 @@ do_configure_prepend_libc-musl () {
 }
 
 do_compile_prepend_class-native() {
-    export NSPR_INCLUDE_DIR=${STAGING_INCDIR_NATIVE}
+    export NSPR_INCLUDE_DIR=${STAGING_INCDIR_NATIVE}/nspr
     export NSPR_LIB_DIR=${STAGING_LIBDIR_NATIVE}
     export NSS_ENABLE_WERROR=0
 }
@@ -67,6 +67,8 @@ do_compile_prepend_class-native() {
 }
 
 do_compile() {
+    export NSPR_INCLUDE_DIR=${STAGING_INCDIR}/nspr
+
     export CROSS_COMPILE=1
     export NATIVE_CC="${BUILD_CC}"
     # Additional defines needed on Centos 7
-- 
2.20.1


