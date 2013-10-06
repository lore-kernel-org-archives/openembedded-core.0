Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6D51F610F7
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Oct 2013 13:01:27 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so2679609eek.15
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Oct 2013 06:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kFVizoGmAZCMF302nbIndTimybm9tEmwXvSdzTfVkD4=;
	b=sfG/TvNtvKHQob6nOPjvgh5PSsO6hG50jfthKbSAhFyM478RARNxTPp1EI8jR5Y0kh
	FrhT1RD36YQ9+q44nb+sQLFjKpObDxIEqwBda4fBVknJb99McQ+Ax000J6JsnmKL3SXb
	oR3lIq5pbnWKr3YH6F+3xNgSdF2Yap5dZTs657Vv/LMz2NT7rjZSZHBXfy91ZQ8a+VQm
	eX0c4dRyNHD7i/o2CEg434HOpvfm7BBEMdmlwcdG3oYUbqifXVlZFB3RBJbVDrOADDO1
	vkofvA+ONmUDv9xTi0rQ3n5uzyuOabKqeDO2nJaMlgabW1nTdj7re9mFTTV0seIaREk6
	YH6g==
X-Received: by 10.15.36.9 with SMTP id h9mr40160065eev.30.1381064488409;
	Sun, 06 Oct 2013 06:01:28 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm51052990eeh.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 06 Oct 2013 06:01:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Oct 2013 15:01:33 +0200
Message-Id: <1381064493-21427-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] bitbake.conf: Remove double slash from PATH_prepend and PKG_CONFIG_DIR
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
X-List-Received-Date: Sun, 06 Oct 2013 13:01:28 -0000

* we correctly have
  ${STAGING_DIR_NATIVE}${base_sbindir_native}
  and then double slash in
  ${STAGING_DIR_NATIVE}/${base_bindir_native}
* similar in PKG_CONFIG_DIR where libdir also starts with slash
  ${STAGING_DIR_HOST}/${libdir}/pkgconfig
* also fix double slash in insane.bbclass and staging.bbclass
* I was a bit nervous about staging change (in case the / was important
  in some weird use-case, but the extra slash is there since following
  commit where other extra slashes were removed only the one before
  libdir was kept:

  commit 6ea78d648951e5bbe9669412c0863daaf7f49ca5
  Author: Richard Purdie <rpurdie@linux.intel.com>
  Date:   Mon Nov 2 17:10:51 2009 +0000

  autotools.bbclass: Separate out useful staging functions into
                     base.bbclass and call from autotools classes
* this isn't fixing any real-world issue AFAIK, I was just trying to
  debug one weird case where debugedit fails with
  canonicalization unexpectedly shrank by one character
  and it's easier to grep for '//' without many harmless instances
  already in run* scripts etc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/insane.bbclass  | 2 +-
 meta/classes/staging.bbclass | 2 +-
 meta/conf/bitbake.conf       | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index a784aff..7ef3d8e 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -861,7 +861,7 @@ python do_package_qa () {
 python do_qa_staging() {
     bb.note("QA checking staging")
 
-    if not package_qa_check_staged(d.expand('${SYSROOT_DESTDIR}/${STAGING_LIBDIR}'), d):
+    if not package_qa_check_staged(d.expand('${SYSROOT_DESTDIR}${STAGING_LIBDIR}'), d):
         bb.fatal("QA staging was broken by the package built above")
 }
 
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index b522c7d..ac9028c 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -40,7 +40,7 @@ sysroot_stage_dirs() {
 	fi
 	if [ -d $from${libdir} ]
 	then
-		sysroot_stage_libdir $from/${libdir} $to${libdir}
+		sysroot_stage_libdir $from${libdir} $to${libdir}
 	fi
 	if [ -d $from${base_libdir} ]
 	then
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 47d2171..5146808 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -426,7 +426,7 @@ EXTRA_IMAGEDEPENDS = ""
 # Toolchain info.
 ##################################################################
 
-PATH_prepend = "${COREBASE}/scripts:${STAGING_BINDIR_TOOLCHAIN}:${STAGING_BINDIR_CROSS}:${STAGING_DIR_NATIVE}${sbindir_native}:${STAGING_BINDIR_NATIVE}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}/${base_bindir_native}:"
+PATH_prepend = "${COREBASE}/scripts:${STAGING_BINDIR_TOOLCHAIN}:${STAGING_BINDIR_CROSS}:${STAGING_DIR_NATIVE}${sbindir_native}:${STAGING_BINDIR_NATIVE}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}${base_bindir_native}:"
 export PATH
 
 ##################################################################
@@ -643,7 +643,7 @@ BUILDCFG_NEEDEDVARS[type] = "list"
 
 # Other
 
-export PKG_CONFIG_DIR = "${STAGING_DIR_HOST}/${libdir}/pkgconfig"
+export PKG_CONFIG_DIR = "${STAGING_DIR_HOST}${libdir}/pkgconfig"
 export PKG_CONFIG_PATH = "${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconfig"
 export PKG_CONFIG_LIBDIR = "${PKG_CONFIG_DIR}"
 export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
-- 
1.8.3.2


