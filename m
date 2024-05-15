Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A8AC25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 11:56:31 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.12947.1715774184842544966
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 04:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E7bQ15rB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4200ee47de7so29608645e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715774183; x=1716378983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cP8ez5MoQANd1qSbOvXq0OcBffD1oKaPQo8HXPrapG0=;
        b=E7bQ15rBRfPvi0K9ILEaYuvLcVn0ohDpKEq7c8zmenqYrf+grMqNgmu0JUgIzcPJQx
         hvgk5K3zuA9KN1u1dMakI97wO7emfHzzX6czWOuPxx80KOoXdSbs7Mlobyl/5KNDRpfz
         DdvRmW/KEgh+47H/Um5KEoHqkZ4CFk8+tZPb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715774183; x=1716378983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cP8ez5MoQANd1qSbOvXq0OcBffD1oKaPQo8HXPrapG0=;
        b=Xvypc15mfiqkKz8Ykr2cpiNryhcPpAnNGtHIWKLQJUddTjvwd1TkVSJhLJjJLh4Vse
         tUuLaNkAbCGE3hNPmpxERN5I+r3peSoR6PScTO5SYG5AVrnp6kh8PJnm3s+NOKem4q2c
         LbNfSFmPPCTBzUjPtOVwmtP7sJVhlzn/rS/Tyv0YbiwFB+xHsq+0JCDpz9Qu6zLhZexb
         az6iu14BEFsWj1KaKQGbDKR1SgemnqpsssUePQoW22TxRI8o2Zztv6OKNlEy/nObBkdt
         tOz3oi3U265AlwJlY1qTA3Tec7KSNldG+dU2Ao2h0hn+tmW+NRuu2M9dw342B+ZUFzAw
         NJZw==
X-Gm-Message-State: AOJu0Yxm7Kf0WCAGWcVOFIxlYiXYjYATU2Owtt2dCrQPdCTm9PoeR+e0
	BNzbjRzvOmpAqs01N5jiSnUsxaMJl4/Fu0MeuO5YeIQpUhCupo0Dm4ryUUn8O+vRn9pheHF5lzR
	65qA=
X-Google-Smtp-Source: AGHT+IHoOmquui771wPcIYUUfKOrO4fu8Cz9prAwDtE2TyuPRK/hvzNuyuQzF9/pcbO0Cwl5Y+v4Lg==
X-Received: by 2002:a05:600c:5008:b0:41b:dca6:a3fa with SMTP id 5b1f17b1804b1-41fead6dc7amr114115715e9.39.1715774182343;
        Wed, 15 May 2024 04:56:22 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:13b6:dedd:c8fc:b915])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce2449sm232555825e9.16.2024.05.15.04.56.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 04:56:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/10] recipes: Start WORKDIR -> UNPACKDIR transition
Date: Wed, 15 May 2024 12:56:11 +0100
Message-Id: <20240515115620.420558-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 11:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199277

Replace references of WORKDIR with UNPACKDIR where it makes sense to do
so in preparation for changing the default value of UNPACKDIR.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipeutils/recipeutils-test_1.2.bb       |  2 +-
 meta/classes-recipe/cargo_common.bbclass      |  4 ++--
 meta/classes-recipe/kernel-yocto.bbclass      | 10 ++++----
 meta/classes-recipe/ptest-perl.bbclass        |  2 +-
 meta/lib/oe/recipeutils.py                    |  2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |  6 ++---
 meta/lib/oeqa/selftest/cases/layerappend.py   |  2 +-
 meta/lib/oeqa/selftest/cases/recipetool.py    | 20 ++++++++--------
 meta/recipes-bsp/grub/grub-efi_2.12.bb        |  2 +-
 meta/recipes-bsp/u-boot/u-boot.inc            |  4 ++--
 .../openssh/openssh_9.7p1.bb                  | 16 ++++++-------
 .../gettext/gettext-minimal-native_0.22.5.bb  |  2 +-
 .../glibc/glibc-testsuite_2.39.bb             |  4 ++--
 .../images/build-appliance-image_15.0.0.bb    | 12 +++++-----
 meta/recipes-core/musl/libc-test_git.bb       |  2 +-
 meta/recipes-core/psplash/psplash_git.bb      |  6 ++---
 meta/recipes-devtools/apt/apt_2.6.1.bb        |  2 +-
 .../cdrtools/cdrtools-native_3.01.bb          |  2 +-
 meta/recipes-devtools/lua/lua_5.4.6.bb        |  2 +-
 .../perl-cross/perlcross_1.5.2.bb             |  2 +-
 meta/recipes-devtools/perl/perl_5.38.2.bb     |  2 +-
 .../python/python3-cryptography_42.0.5.bb     |  2 +-
 .../python/python3-hypothesis_6.100.1.bb      |  4 ++--
 .../python/python3-pyyaml_6.0.1.bb            |  2 +-
 meta/recipes-devtools/quilt/quilt.inc         |  2 +-
 meta/recipes-devtools/rust/cargo_1.75.0.bb    |  2 +-
 meta/recipes-devtools/rust/rust_1.75.0.bb     |  2 +-
 .../valgrind/valgrind_3.23.0.bb               |  6 ++---
 meta/recipes-extended/bash/bash.inc           |  2 +-
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    | 24 +++++++++----------
 meta/recipes-extended/cpio/cpio_2.15.bb       |  2 +-
 .../net-tools/net-tools_2.10.bb               |  4 ++--
 meta/recipes-rt/rt-tests/rt-tests_git.bb      |  2 +-
 meta/recipes-support/curl/curl_8.7.1.bb       |  2 +-
 meta/recipes-support/libpcre/libpcre_8.45.bb  |  2 +-
 meta/recipes-support/lzop/lzop_1.04.bb        |  2 +-
 meta/recipes-support/numactl/numactl_git.bb   |  2 +-
 37 files changed, 84 insertions(+), 84 deletions(-)

diff --git a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
index ad9f475d151..c64c4693964 100644
--- a/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
+++ b/meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
@@ -3,7 +3,7 @@ SUMMARY = "Test recipe for recipeutils.patch_recipe()"
 require recipeutils-test.inc
 
 LICENSE = "HPND"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/somefile;md5=d41d8cd98f00b204e9800998ecf8427e"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/somefile;md5=d41d8cd98f00b204e9800998ecf8427e"
 DEPENDS += "zlib"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index 0fb443edbdd..78440c810b3 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -18,7 +18,7 @@
 inherit rust-common
 
 # Where we download our registry and dependencies to
-export CARGO_HOME = "${WORKDIR}/cargo_home"
+export CARGO_HOME = "${UNPACKDIR}/cargo_home"
 
 # The pkg-config-rs library used by cargo build scripts disables itself when
 # cross compiling unless this is defined. We set up pkg-config appropriately
@@ -138,7 +138,7 @@ python cargo_common_do_patch_paths() {
         return
 
     patches = dict()
-    workdir = d.getVar('WORKDIR')
+    workdir = d.getVar('UNPACKDIR')
     fetcher = bb.fetch2.Fetch(src_uri, d)
     for url in fetcher.urls:
         ud = fetcher.ud[url]
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 6468e8aa903..c4ed3f1ca2e 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -379,19 +379,19 @@ do_kernel_checkout() {
 	set +e
 
 	source_dir=`echo ${S} | sed 's%/$%%'`
-	source_workdir="${WORKDIR}/git"
-	if [ -d "${WORKDIR}/git/" ]; then
+	source_workdir="${UNPACKDIR}/git"
+	if [ -d "${UNPACKDIR}/git/" ]; then
 		# case: git repository
 		# if S is WORKDIR/git, then we shouldn't be moving or deleting the tree.
 		if [ "${source_dir}" != "${source_workdir}" ]; then
 			if [ -d "${source_workdir}/.git" ]; then
 				# regular git repository with .git
 				rm -rf ${S}
-				mv ${WORKDIR}/git ${S}
+				mv ${UNPACKDIR}/git ${S}
 			else
 				# create source for bare cloned git repository
 				git clone ${WORKDIR}/git ${S}
-				rm -rf ${WORKDIR}/git
+				rm -rf ${UNPACKDIR}/git
 			fi
 		fi
 		cd ${S}
@@ -434,7 +434,7 @@ do_kernel_checkout() {
 
 	set -e
 }
-do_kernel_checkout[dirs] = "${S} ${WORKDIR}"
+do_kernel_checkout[dirs] = "${S} ${UNPACKDIR}"
 
 addtask kernel_checkout before do_kernel_metadata after do_symlink_kernsrc
 addtask kernel_metadata after do_validate_branches do_unpack before do_patch
diff --git a/meta/classes-recipe/ptest-perl.bbclass b/meta/classes-recipe/ptest-perl.bbclass
index c283fdd1fc4..a4a9d40d52d 100644
--- a/meta/classes-recipe/ptest-perl.bbclass
+++ b/meta/classes-recipe/ptest-perl.bbclass
@@ -13,7 +13,7 @@ SRC_URI += "file://ptest-perl/run-ptest"
 do_install_ptest_perl() {
 	install -d ${D}${PTEST_PATH}
 	if [ ! -f ${D}${PTEST_PATH}/run-ptest ]; then
-		install -m 0755 ${WORKDIR}/ptest-perl/run-ptest ${D}${PTEST_PATH}
+		install -m 0755 ${UNPACKDIR}/ptest-perl/run-ptest ${D}${PTEST_PATH}
 	fi
 	cp -r ${B}/t ${D}${PTEST_PATH}
 	chown -R root:root ${D}${PTEST_PATH}
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index de1fbdd3a8c..2d69a331132 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -818,7 +818,7 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
                     instdirline = 'install -d ${D}%s' % os.path.dirname(instdestpath)
                     if not instdirline in instfunclines:
                         instfunclines.append(instdirline)
-                    instfunclines.append('install -m %s ${WORKDIR}/%s ${D}%s' % (perms, os.path.basename(srcfile), instdestpath))
+                    instfunclines.append('install -m %s ${UNPACKDIR}/%s ${D}%s' % (perms, os.path.basename(srcfile), instdestpath))
         if instfunclines:
             bbappendlines.append(('do_install:append%s()' % appendoverride, '', instfunclines))
 
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 882225dde34..8ce1c65a388 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -956,9 +956,9 @@ class DevtoolModifyTests(DevtoolBase):
         #    others git:// in SRC_URI
         #    cointains a patch
         testrecipe = 'hello-rs'
-        bb_vars = get_bb_vars(['SRC_URI', 'FILE', 'WORKDIR', 'CARGO_HOME'], testrecipe)
+        bb_vars = get_bb_vars(['SRC_URI', 'FILE', 'UNPACKDIR', 'CARGO_HOME'], testrecipe)
         recipefile = bb_vars['FILE']
-        workdir = bb_vars['WORKDIR']
+        unpackdir = bb_vars['UNPACKDIR']
         cargo_home = bb_vars['CARGO_HOME']
         src_uri = bb_vars['SRC_URI'].split()
         self.assertTrue(src_uri[0].startswith('git://'),
@@ -1029,7 +1029,7 @@ class DevtoolModifyTests(DevtoolBase):
             self.assertEqual(parms['type'], 'git-dependency', 'git dependencies uri should have "type=git-dependency"')
             raw_url = raw_url.replace("git://", '%s://' % parms['protocol'])
             patch_line = '[patch."%s"]' % raw_url
-            path_patched = os.path.join(workdir, parms['destsuffix'])
+            path_patched = os.path.join(unpackdir, parms['destsuffix'])
             path_override_line = '%s = { path = "%s" }' % (parms['name'], path_patched)
             # Would have been better to use tomllib to read this file :/
             self.assertIn(patch_line, cargo_config_contents)
diff --git a/meta/lib/oeqa/selftest/cases/layerappend.py b/meta/lib/oeqa/selftest/cases/layerappend.py
index 379ed589ad9..64b17117cc2 100644
--- a/meta/lib/oeqa/selftest/cases/layerappend.py
+++ b/meta/lib/oeqa/selftest/cases/layerappend.py
@@ -37,7 +37,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 SRC_URI:append = " file://appendtest.txt"
 
 sysroot_stage_all:append() {
-	install -m 644 ${WORKDIR}/appendtest.txt ${SYSROOT_DESTDIR}/
+	install -m 644 ${UNPACKDIR}/appendtest.txt ${SYSROOT_DESTDIR}/
 }
 
 """
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 126906df502..42202b78312 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -138,7 +138,7 @@ class RecipetoolAppendTests(RecipetoolBase):
                          '\n',
                          'do_install:append() {\n',
                          '    install -d ${D}${%s}\n' % dirname,
-                         '    install -m 0755 ${WORKDIR}/%s ${D}${%s}/ls\n' % (testfile2name, dirname),
+                         '    install -m 0755 ${UNPACKDIR}/%s ${D}${%s}/ls\n' % (testfile2name, dirname),
                          '}\n']
         self._try_recipetool_appendfile('coreutils', lspath, testfile2, '-r coreutils', expectedlines, [testfile2name])
         # Now try bbappending the same file again, contents should not change
@@ -164,7 +164,7 @@ class RecipetoolAppendTests(RecipetoolBase):
                          '\n',
                          'do_install:append() {\n',
                          '    install -d ${D}${datadir}\n',
-                         '    install -m 0644 ${WORKDIR}/testfile ${D}${datadir}/something\n',
+                         '    install -m 0644 ${UNPACKDIR}/testfile ${D}${datadir}/something\n',
                          '}\n']
         self._try_recipetool_appendfile('netbase', '/usr/share/something', self.testfile, '-r netbase', expectedlines, ['testfile'])
         # Try adding another file, this time where the source file is executable
@@ -179,8 +179,8 @@ class RecipetoolAppendTests(RecipetoolBase):
                          '\n',
                          'do_install:append() {\n',
                          '    install -d ${D}${datadir}\n',
-                         '    install -m 0644 ${WORKDIR}/testfile ${D}${datadir}/something\n',
-                         '    install -m 0755 ${WORKDIR}/%s ${D}${datadir}/scriptname\n' % testfile2name,
+                         '    install -m 0644 ${UNPACKDIR}/testfile ${D}${datadir}/something\n',
+                         '    install -m 0755 ${UNPACKDIR}/%s ${D}${datadir}/scriptname\n' % testfile2name,
                          '}\n']
         self._try_recipetool_appendfile('netbase', '/usr/share/scriptname', testfile2, '-r netbase', expectedlines, ['testfile', testfile2name])
 
@@ -192,7 +192,7 @@ class RecipetoolAppendTests(RecipetoolBase):
                          '\n',
                          'do_install:append() {\n',
                          '    install -d ${D}${bindir}\n',
-                         '    install -m 0755 ${WORKDIR}/testfile ${D}${bindir}/selftest-recipetool-testbin\n',
+                         '    install -m 0755 ${UNPACKDIR}/testfile ${D}${bindir}/selftest-recipetool-testbin\n',
                          '}\n']
         _, output = self._try_recipetool_appendfile('netbase', '/usr/bin/selftest-recipetool-testbin', self.testfile, '-r netbase', expectedlines, ['testfile'])
         self.assertNotIn('WARNING: ', output)
@@ -207,7 +207,7 @@ class RecipetoolAppendTests(RecipetoolBase):
                          '\n',
                          'do_install:append:mymachine() {\n',
                          '    install -d ${D}${datadir}\n',
-                         '    install -m 0644 ${WORKDIR}/testfile ${D}${datadir}/something\n',
+                         '    install -m 0644 ${UNPACKDIR}/testfile ${D}${datadir}/something\n',
                          '}\n']
         _, output = self._try_recipetool_appendfile('netbase', '/usr/share/something', self.testfile, '-r netbase -m mymachine', expectedlines, ['mymachine/testfile'])
         self.assertNotIn('WARNING: ', output)
@@ -241,7 +241,7 @@ class RecipetoolAppendTests(RecipetoolBase):
                          '\n',
                          'do_install:append() {\n',
                          '    install -d ${D}${datadir}\n',
-                         '    install -m 0644 ${WORKDIR}/testfile ${D}${datadir}/selftest-replaceme-subdir\n',
+                         '    install -m 0644 ${UNPACKDIR}/testfile ${D}${datadir}/selftest-replaceme-subdir\n',
                          '}\n']
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-subdir', self.testfile, '', expectedlines, ['testfile'])
         self.assertNotIn('WARNING: ', output)
@@ -268,7 +268,7 @@ class RecipetoolAppendTests(RecipetoolBase):
                          '\n',
                          'do_install:append() {\n',
                          '    install -d ${D}${sysconfdir}\n',
-                         '    install -m 0644 ${WORKDIR}/testfile ${D}${sysconfdir}/selftest-replaceme-patched\n',
+                         '    install -m 0644 ${UNPACKDIR}/testfile ${D}${sysconfdir}/selftest-replaceme-patched\n',
                          '}\n']
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/etc/selftest-replaceme-patched', self.testfile, '', expectedlines, ['testfile'])
         for line in output.splitlines():
@@ -286,7 +286,7 @@ class RecipetoolAppendTests(RecipetoolBase):
                          '\n',
                          'do_install:append() {\n',
                          '    install -d ${D}${datadir}\n',
-                         '    install -m 0644 ${WORKDIR}/testfile ${D}${datadir}/selftest-replaceme-scripted\n',
+                         '    install -m 0644 ${UNPACKDIR}/testfile ${D}${datadir}/selftest-replaceme-scripted\n',
                          '}\n']
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-scripted', self.testfile, '', expectedlines, ['testfile'])
         self.assertNotIn('WARNING: ', output)
@@ -309,7 +309,7 @@ class RecipetoolAppendTests(RecipetoolBase):
                          '\n',
                          'do_install:append() {\n',
                          '    install -d ${D}${datadir}\n',
-                         '    install -m 0644 ${WORKDIR}/testfile ${D}${datadir}/selftest-replaceme-postinst\n',
+                         '    install -m 0644 ${UNPACKDIR}/testfile ${D}${datadir}/selftest-replaceme-postinst\n',
                          '}\n']
         _, output = self._try_recipetool_appendfile('selftest-recipetool-appendfile', '/usr/share/selftest-replaceme-postinst', self.testfile, '-r selftest-recipetool-appendfile', expectedlines, ['testfile'])
 
diff --git a/meta/recipes-bsp/grub/grub-efi_2.12.bb b/meta/recipes-bsp/grub/grub-efi_2.12.bb
index 9857e8e036d..7df77deca36 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.12.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.12.bb
@@ -58,7 +58,7 @@ do_mkimage() {
 
 	# Search for the grub.cfg on the local boot media by using the
 	# built in cfg file provided via this recipe
-	grub-mkimage -v -c ../cfg -p ${EFIDIR} -d ./grub-core/ \
+	grub-mkimage -v -c ${UNPACKDIR}/cfg -p ${EFIDIR} -d ./grub-core/ \
 	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} \
 	               ${GRUB_MKIMAGE_MODULES}
 }
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 3a7afb81c85..45d700fbdd4 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -259,8 +259,8 @@ do_deploy () {
         fi
     fi
 
-    if [ -e ${WORKDIR}/fw_env.config ] ; then
-        install -D -m 644 ${WORKDIR}/fw_env.config ${DEPLOYDIR}/fw_env.config-${MACHINE}-${PV}-${PR}
+    if [ -e ${UNPACKDIR}/fw_env.config ] ; then
+        install -D -m 644 ${UNPACKDIR}/fw_env.config ${DEPLOYDIR}/fw_env.config-${MACHINE}-${PV}-${PR}
         cd ${DEPLOYDIR}
         ln -sf fw_env.config-${MACHINE}-${PV}-${PR} fw_env.config-${MACHINE}
         ln -sf fw_env.config-${MACHINE}-${PV}-${PR} fw_env.config
diff --git a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
index 36ffa493983..82da92f63fc 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
@@ -112,7 +112,7 @@ do_compile_ptest() {
 
 do_install:append () {
 	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
-		install -D -m 0644 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
+		install -D -m 0644 ${UNPACKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
 		sed -i -e 's:#UsePAM no:UsePAM yes:' ${D}${sysconfdir}/ssh/sshd_config
 	fi
 
@@ -121,11 +121,11 @@ do_install:append () {
 	fi
 
 	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
+	install -m 0755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/sshd
 	rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin
 	rmdir ${D}${localstatedir}/run/sshd ${D}${localstatedir}/run ${D}${localstatedir}
 	install -d ${D}/${sysconfdir}/default/volatiles
-	install -m 644 ${WORKDIR}/volatiles.99_sshd ${D}/${sysconfdir}/default/volatiles/99_sshd
+	install -m 644 ${UNPACKDIR}/volatiles.99_sshd ${D}/${sysconfdir}/default/volatiles/99_sshd
 	install -m 0755 ${S}/contrib/ssh-copy-id ${D}${bindir}
 
 	# Create config files for read-only rootfs
@@ -138,8 +138,8 @@ do_install:append () {
 
 	install -d ${D}${systemd_system_unitdir}
 	if ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-socket-mode','true','false',d)}; then
-	    install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_system_unitdir}
-	    install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_system_unitdir}
+	    install -c -m 0644 ${UNPACKDIR}/sshd.socket ${D}${systemd_system_unitdir}
+	    install -c -m 0644 ${UNPACKDIR}/sshd@.service ${D}${systemd_system_unitdir}
 	    sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
 		    -e 's,@SBINDIR@,${sbindir},g' \
 		    -e 's,@BINDIR@,${bindir},g' \
@@ -147,9 +147,9 @@ do_install:append () {
             ${D}${systemd_system_unitdir}/sshd.socket
 	fi
 	if ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-service-mode','true','false',d)}; then
-	    install -c -m 0644 ${WORKDIR}/sshd.service ${D}${systemd_system_unitdir}
+	    install -c -m 0644 ${UNPACKDIR}/sshd.service ${D}${systemd_system_unitdir}
 	fi
-	install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_system_unitdir}
+	install -c -m 0644 ${UNPACKDIR}/sshdgenkeys.service ${D}${systemd_system_unitdir}
 	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
 		-e 's,@SBINDIR@,${sbindir},g' \
 		-e 's,@BINDIR@,${bindir},g' \
@@ -159,7 +159,7 @@ do_install:append () {
 	sed -i -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
 		${D}${sysconfdir}/init.d/sshd
 
-	install -D -m 0755 ${WORKDIR}/sshd_check_keys ${D}${libexecdir}/${BPN}/sshd_check_keys
+	install -D -m 0755 ${UNPACKDIR}/sshd_check_keys ${D}${libexecdir}/${BPN}/sshd_check_keys
 }
 
 do_install_ptest () {
diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb
index db1bbb7e687..96acf9bb9fc 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb
@@ -13,7 +13,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 INHIBIT_AUTOTOOLS_DEPS = "1"
 
 LICENSE = "FSF-Unlimited"
-LIC_FILES_CHKSUM = "file://../COPYING;md5=4bd090a20bfcd1a18f1f79837b5e3e91"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/COPYING;md5=4bd090a20bfcd1a18f1f79837b5e3e91"
 
 inherit native
 
diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.39.bb b/meta/recipes-core/glibc/glibc-testsuite_2.39.bb
index 2e076f4b0f4..3a2764e40b0 100644
--- a/meta/recipes-core/glibc/glibc-testsuite_2.39.bb
+++ b/meta/recipes-core/glibc/glibc-testsuite_2.39.bb
@@ -18,7 +18,7 @@ TOOLCHAIN_TEST_HOST_PORT ??= "2222"
 do_check[nostamp] = "1"
 do_check[network] = "1"
 do_check:append () {
-    chmod 0755 ${WORKDIR}/check-test-wrapper
+    chmod 0755 ${UNPACKDIR}/check-test-wrapper
 
     oe_runmake -i \
         QEMU_SYSROOT="${RECIPE_SYSROOT}" \
@@ -26,7 +26,7 @@ do_check:append () {
         SSH_HOST="${TOOLCHAIN_TEST_HOST}" \
         SSH_HOST_USER="${TOOLCHAIN_TEST_HOST_USER}" \
         SSH_HOST_PORT="${TOOLCHAIN_TEST_HOST_PORT}" \
-        test-wrapper="${WORKDIR}/check-test-wrapper ${TOOLCHAIN_TEST_TARGET}" \
+        test-wrapper="${UNPACKDIR}/check-test-wrapper ${TOOLCHAIN_TEST_TARGET}" \
         check
 }
 
diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 4cf55519ccc..dbb257eda1b 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -44,10 +44,10 @@ IMAGE_CMD:ext4:append () {
 fakeroot do_populate_poky_src () {
 	# Because fetch2's git's unpack uses -s cloneflag, the unpacked git repo
 	# will become invalid in the target.
-	rm -rf ${WORKDIR}/git/.git
-	rm -f ${WORKDIR}/git/.gitignore
+	rm -rf ${UNPACKDIR}/git/.git
+	rm -f ${UNPACKDIR}/git/.gitignore
 
-	cp -R ${WORKDIR}/git ${IMAGE_ROOTFS}/home/builder/poky
+	cp -R ${UNPACKDIR}/git ${IMAGE_ROOTFS}/home/builder/poky
 
 	mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/conf
 	mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/downloads
@@ -58,10 +58,10 @@ fakeroot do_populate_poky_src () {
 	fi
 
 	# Place the README_VirtualBox_Guest_Additions file in builders home folder.
-	cp ${WORKDIR}/README_VirtualBox_Guest_Additions.txt ${IMAGE_ROOTFS}/home/builder/
+	cp ${UNPACKDIR}/README_VirtualBox_Guest_Additions.txt ${IMAGE_ROOTFS}/home/builder/
 
 	# Place the README_VirtualBox_Toaster file in builders home folder.
-	cp ${WORKDIR}/README_VirtualBox_Toaster.txt ${IMAGE_ROOTFS}/home/builder/
+	cp ${UNPACKDIR}/README_VirtualBox_Toaster.txt ${IMAGE_ROOTFS}/home/builder/
 
 	echo "INHERIT += \"rm_work\"" >> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
 	echo "export LC_ALL=en_US.utf8" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
@@ -132,7 +132,7 @@ python () {
 create_bundle_files () {
 	cd ${WORKDIR}
 	mkdir -p Yocto_Build_Appliance
-	cp *.vmx* Yocto_Build_Appliance
+	cp ${UNPACKDIR}/*.vmx* Yocto_Build_Appliance
 	ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic.vmdk Yocto_Build_Appliance/Yocto_Build_Appliance.vmdk
 	ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic.vhdx Yocto_Build_Appliance/Yocto_Build_Appliance.vhdx
 	ln -sf ${IMGDEPLOYDIR}/${IMAGE_NAME}.wic.vhd Yocto_Build_Appliance/Yocto_Build_Appliance.vhd
diff --git a/meta/recipes-core/musl/libc-test_git.bb b/meta/recipes-core/musl/libc-test_git.bb
index 619a959fd29..f55a125a89a 100644
--- a/meta/recipes-core/musl/libc-test_git.bb
+++ b/meta/recipes-core/musl/libc-test_git.bb
@@ -50,7 +50,7 @@ do_install () {
 }
 
 do_install_ptest_base:append() {
-    install -Dm 0755 ${WORKDIR}/run-libc-ptests ${D}${PTEST_PATH}/run-libc-ptests
+    install -Dm 0755 ${UNPACKDIR}/run-libc-ptests ${D}${PTEST_PATH}/run-libc-ptests
 }
 
 COMPATIBLE_HOST = "null"
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index c7b96bc6a7b..30cf61a2cb5 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -103,7 +103,7 @@ python do_compile () {
 do_install:append() {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/init.d/
-		install -m 0755 ${WORKDIR}/psplash-init ${D}${sysconfdir}/init.d/psplash.sh
+		install -m 0755 ${UNPACKDIR}/psplash-init ${D}${sysconfdir}/init.d/psplash.sh
 
 		# make fifo for psplash
 		install -d ${D}/mnt
@@ -112,8 +112,8 @@ do_install:append() {
 
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		install -d ${D}${systemd_system_unitdir}
-		install -m 644 ${WORKDIR}/psplash-start.service ${D}/${systemd_system_unitdir}
-		install -m 644 ${WORKDIR}/psplash-systemd.service ${D}/${systemd_system_unitdir}
+		install -m 644 ${UNPACKDIR}/psplash-start.service ${D}/${systemd_system_unitdir}
+		install -m 644 ${UNPACKDIR}/psplash-systemd.service ${D}/${systemd_system_unitdir}
 	fi
 
 	install -d ${D}${bindir}
diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtools/apt/apt_2.6.1.bb
index fb4ff899d20..68bd7c54076 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
@@ -49,7 +49,7 @@ DEPENDS += "db gnutls lz4 zlib bzip2 xz libgcrypt xxhash"
 
 EXTRA_OECMAKE:append = " -DCURRENT_VENDOR=debian -DWITH_DOC=False \
     -DDPKG_DATADIR=${datadir}/dpkg \
-    -DTRIEHASH_EXECUTABLE=${WORKDIR}/triehash \
+    -DTRIEHASH_EXECUTABLE=${UNPACKDIR}/triehash \
     -DCMAKE_DISABLE_FIND_PACKAGE_ZSTD=True \
     -DCMAKE_DISABLE_FIND_PACKAGE_SECCOMP=True \
     -DWITH_TESTS=False \
diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index bf8be1ad0c0..98308e5d376 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -29,7 +29,7 @@ inherit native
 do_configure() {
         install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/autoconf
         install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/autoconf
-        install -m 0644 ${WORKDIR}/riscv64-linux-gcc.rul ${S}/RULES/
+        install -m 0644 ${UNPACKDIR}/riscv64-linux-gcc.rul ${S}/RULES/
 }
 
 do_install() {
diff --git a/meta/recipes-devtools/lua/lua_5.4.6.bb b/meta/recipes-devtools/lua/lua_5.4.6.bb
index 65f19ae2479..17dc8fb17df 100644
--- a/meta/recipes-devtools/lua/lua_5.4.6.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.6.bb
@@ -51,7 +51,7 @@ do_install () {
 }
 
 do_install_ptest () {
-        cp -R --no-dereference --preserve=mode,links -v ${WORKDIR}/lua-${PV_testsuites}-tests ${D}${PTEST_PATH}/test
+        cp -R --no-dereference --preserve=mode,links -v ${UNPACKDIR}/lua-${PV_testsuites}-tests ${D}${PTEST_PATH}/test
 }
 
 do_install_ptest:append:libc-musl () {
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb b/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
index b41c182fad2..48bda7e4b6f 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.5.2.bb
@@ -6,7 +6,7 @@ SECTION = "devel"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 # README.md is taken from https://github.com/arsv/perl-cross/blob/master/README.md
 # but is not provided inside the release tarballs
-LIC_FILES_CHKSUM = "file://${WORKDIR}/README.md;md5=252fcce2026b765fee1ad74d2fb07a3b"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/README.md;md5=252fcce2026b765fee1ad74d2fb07a3b"
 
 inherit allarch github-releases
 
diff --git a/meta/recipes-devtools/perl/perl_5.38.2.bb b/meta/recipes-devtools/perl/perl_5.38.2.bb
index b6c9cda7aea..63909c242d4 100644
--- a/meta/recipes-devtools/perl/perl_5.38.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.2.bb
@@ -331,7 +331,7 @@ python split_perl_packages () {
     d.setVar(d.expand("RDEPENDS:${PN}-modules"), ' '.join(packages))
 
     # Read the pre-generated dependency file, and use it to set module dependecies
-    for line in open(d.expand("${WORKDIR}") + '/perl-rdepends.txt').readlines():
+    for line in open(d.getVar("UNPACKDIR") + '/perl-rdepends.txt').readlines():
         splitline = line.split()
         # Filter empty lines and comments
         if len(splitline) == 0 or splitline[0].startswith("#"):
diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb b/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
index 732f925d926..0300330c603 100644
--- a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
@@ -49,7 +49,7 @@ RDEPENDS:${PN}-ptest += " \
 inherit ptest
 
 do_install_ptest() {
-    install -D ${WORKDIR}/check-memfree.py ${D}${PTEST_PATH}/
+    install -D ${UNPACKDIR}/check-memfree.py ${D}${PTEST_PATH}/
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
     # remove test_x509.py as it needs benchmark and we don't
diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.100.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.100.1.bb
index af7facfe7e0..a689be9a1aa 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.100.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.100.1.bb
@@ -32,8 +32,8 @@ RDEPENDS:${PN}-ptest += " \
 
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/examples
-    install -m 0755 ${WORKDIR}/test_binary_search.py ${D}${PTEST_PATH}/examples/
-    install -m 0755 ${WORKDIR}/test_rle.py ${D}${PTEST_PATH}/examples/
+    install -m 0755 ${UNPACKDIR}/test_binary_search.py ${D}${PTEST_PATH}/examples/
+    install -m 0755 ${UNPACKDIR}/test_rle.py ${D}${PTEST_PATH}/examples/
 }
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb b/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
index 33883125570..6e2022719c1 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
@@ -34,7 +34,7 @@ RDEPENDS:${PN}-ptest += " \
 
 do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${WORKDIR}/test_dump_load.py ${D}${PTEST_PATH}/tests/
+	cp -rf ${UNPACKDIR}/test_dump_load.py ${D}${PTEST_PATH}/tests/
 }
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index 3374f4dfbf3..1d90d3d84d7 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -67,7 +67,7 @@ DEPENDS:append:class-target = "${@bb.utils.contains('PTEST_ENABLED', '1', ' ptes
 PACKAGE_WRITE_DEPS += "ptest-runner"
 
 do_install_ptest() {
-	install ${WORKDIR}/test.sh ${D}${PTEST_PATH}
+	install ${UNPACKDIR}/test.sh ${D}${PTEST_PATH}
     mkdir ${D}${PTEST_PATH}/test
     install ${S}/test/* ${D}${PTEST_PATH}/test
     # mail needs a MTA, and the patch-wrapper is disabled
diff --git a/meta/recipes-devtools/rust/cargo_1.75.0.bb b/meta/recipes-devtools/rust/cargo_1.75.0.bb
index 50b7e7c7b49..123032cdf7f 100644
--- a/meta/recipes-devtools/rust/cargo_1.75.0.bb
+++ b/meta/recipes-devtools/rust/cargo_1.75.0.bb
@@ -22,7 +22,7 @@ inherit cargo pkgconfig
 DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${RUSTSRC}/vendor=${TARGET_DBGSRC_DIR}"
 
 do_cargo_setup_snapshot () {
-	${WORKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
+	${UNPACKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
 	# Need to use uninative's loader if enabled/present since the library paths
 	# are used internally by rust and result in symbol mismatches if we don't
 	if [ ! -z "${UNINATIVE_LOADER}" -a -e "${UNINATIVE_LOADER}" ]; then
diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
index 76e1fe2d84a..662117c92c3 100644
--- a/meta/recipes-devtools/rust/rust_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
@@ -48,7 +48,7 @@ setup_cargo_environment () {
 inherit rust-target-config
 
 do_rust_setup_snapshot () {
-    for installer in "${WORKDIR}/rust-snapshot-components/"*"/install.sh"; do
+    for installer in "${UNPACKDIR}/rust-snapshot-components/"*"/install.sh"; do
         "${installer}" --prefix="${WORKDIR}/rust-snapshot" --disable-ldconfig
     done
 
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.23.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.23.0.bb
index 46719bf8a1a..ad9e26cb6ba 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.23.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.23.0.bb
@@ -194,9 +194,9 @@ do_install_ptest() {
 
     # The scripts reference config.h so add it to the top ptest dir.
     cp ${B}/config.h ${D}${PTEST_PATH}
-    install -D ${WORKDIR}/remove-for-aarch64 ${D}${PTEST_PATH}
-    install -D ${WORKDIR}/remove-for-all ${D}${PTEST_PATH}
-    install -D ${WORKDIR}/taskset_nondeterministic_tests ${D}${PTEST_PATH}
+    install -D ${UNPACKDIR}/remove-for-aarch64 ${D}${PTEST_PATH}
+    install -D ${UNPACKDIR}/remove-for-all ${D}${PTEST_PATH}
+    install -D ${UNPACKDIR}/taskset_nondeterministic_tests ${D}${PTEST_PATH}
 
     # Add an executable need by none/tests/bigcode
     mkdir ${D}${PTEST_PATH}/perf
diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index e541161c757..66058feff38 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -108,7 +108,7 @@ do_install_ptest () {
 	cp ${B}/config.h ${D}${PTEST_PATH}
 	cp ${B}/version.h ${D}${PTEST_PATH}
 	cp ${S}/y.tab.[ch] ${D}${PTEST_PATH}
-	install -D ${WORKDIR}/run-bash-ptests ${D}${PTEST_PATH}/run-bash-ptests
+	install -D ${UNPACKDIR}/run-bash-ptests ${D}${PTEST_PATH}/run-bash-ptests
         sed -i -e 's/^Makefile/_Makefile/' -e "s,--sysroot=${STAGING_DIR_TARGET},,g" \
 	    -e 's|${DEBUG_PREFIX_MAP}||g' \
 	    -e 's|${BUILD_LDFLAGS}||g' \
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index 4e3a06f2408..7d7ab3856b4 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -14,11 +14,11 @@ LICENSE:libbz2 = "bzip2-1.0.6"
 LICENSE:${PN}-ptest = "bzip2-1.0.6 & GPL-3.0-or-later & Apache-2.0 & MS-PL & BSD-3-Clause & Zlib"
 
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664 \
-                    file://${WORKDIR}/git/commons-compress/LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327 \
-                    file://${WORKDIR}/git/dotnetzip/License.txt;md5=9cb56871eed4e748c3bc7e8ff352a54f \
-                    file://${WORKDIR}/git/dotnetzip/License.zlib.txt;md5=cc421ccd22eeb2e5db6b79e6de0a029f \
-                    file://${WORKDIR}/git/go/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707 \
-                    file://${WORKDIR}/git/lbzip2/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://${UNPACKDIR}/git/commons-compress/LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327 \
+                    file://${UNPACKDIR}/git/dotnetzip/License.txt;md5=9cb56871eed4e748c3bc7e8ff352a54f \
+                    file://${UNPACKDIR}/git/dotnetzip/License.zlib.txt;md5=cc421ccd22eeb2e5db6b79e6de0a029f \
+                    file://${UNPACKDIR}/git/go/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707 \
+                    file://${UNPACKDIR}/git/lbzip2/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 "
 
 SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
@@ -52,13 +52,13 @@ do_configure:prepend () {
 
 do_install_ptest () {
 	install -d ${D}${PTEST_PATH}/bzip2-tests
-	cp -r ${WORKDIR}/git/commons-compress ${D}${PTEST_PATH}/bzip2-tests/commons-compress
-	cp -r ${WORKDIR}/git/dotnetzip ${D}${PTEST_PATH}/bzip2-tests/dotnetzip
-	cp -r ${WORKDIR}/git/go ${D}${PTEST_PATH}/bzip2-tests/go
-	cp -r ${WORKDIR}/git/lbzip2 ${D}${PTEST_PATH}/bzip2-tests/lbzip2
-	cp -r ${WORKDIR}/git/pyflate ${D}${PTEST_PATH}/bzip2-tests/pyflate
-	cp ${WORKDIR}/git/README ${D}${PTEST_PATH}/bzip2-tests/
-	cp ${WORKDIR}/git/run-tests.sh ${D}${PTEST_PATH}/bzip2-tests/
+	cp -r ${UNPACKDIR}/git/commons-compress ${D}${PTEST_PATH}/bzip2-tests/commons-compress
+	cp -r ${UNPACKDIR}/git/dotnetzip ${D}${PTEST_PATH}/bzip2-tests/dotnetzip
+	cp -r ${UNPACKDIR}/git/go ${D}${PTEST_PATH}/bzip2-tests/go
+	cp -r ${UNPACKDIR}/git/lbzip2 ${D}${PTEST_PATH}/bzip2-tests/lbzip2
+	cp -r ${UNPACKDIR}/git/pyflate ${D}${PTEST_PATH}/bzip2-tests/pyflate
+	cp ${UNPACKDIR}/git/README ${D}${PTEST_PATH}/bzip2-tests/
+	cp ${UNPACKDIR}/git/run-tests.sh ${D}${PTEST_PATH}/bzip2-tests/
 	sed -i -e "s|^Makefile:|_Makefile:|" ${D}${PTEST_PATH}/Makefile
 }
 
diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-extended/cpio/cpio_2.15.bb
index 95f82cdf3ab..bfaf5c31c37 100644
--- a/meta/recipes-extended/cpio/cpio_2.15.bb
+++ b/meta/recipes-extended/cpio/cpio_2.15.bb
@@ -51,7 +51,7 @@ do_install_ptest() {
     install --mode=755 ${B}/tests/atlocal ${D}${PTEST_PATH}/tests/
     install --mode=755 ${B}/tests/genfile ${D}${PTEST_PATH}/tests/
     install --mode=755 ${S}/tests/testsuite ${D}${PTEST_PATH}/tests/
-    install --mode=755 ${WORKDIR}/test.sh ${D}${PTEST_PATH}/test.sh
+    install --mode=755 ${UNPACKDIR}/test.sh ${D}${PTEST_PATH}/test.sh
     sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/test.sh
 }
 
diff --git a/meta/recipes-extended/net-tools/net-tools_2.10.bb b/meta/recipes-extended/net-tools/net-tools_2.10.bb
index 33304297ec4..7facc0cc8da 100644
--- a/meta/recipes-extended/net-tools/net-tools_2.10.bb
+++ b/meta/recipes-extended/net-tools/net-tools_2.10.bb
@@ -31,8 +31,8 @@ PACKAGECONFIG[plipconfig] = ""
 do_configure() {
 	# net-tools has its own config mechanism requiring "make config"
 	# we pre-generate desired options and copy to source directory instead
-	cp ${WORKDIR}/net-tools-config.h    ${S}/config.h
-	cp ${WORKDIR}/net-tools-config.make ${S}/config.make
+	cp ${UNPACKDIR}/net-tools-config.h    ${S}/config.h
+	cp ${UNPACKDIR}/net-tools-config.make ${S}/config.make
 
 	if [ "${USE_NLS}" = "no" ]; then
 		sed -i -e 's/^I18N=1/# I18N=1/' ${S}/config.make
diff --git a/meta/recipes-rt/rt-tests/rt-tests_git.bb b/meta/recipes-rt/rt-tests/rt-tests_git.bb
index ef082131e20..1f48e143d47 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_git.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_git.bb
@@ -27,7 +27,7 @@ do_install() {
 }
 
 do_install_ptest() {
-        cp ${WORKDIR}/rt_bmark.py ${D}${PTEST_PATH}
+        cp ${UNPACKDIR}/rt_bmark.py ${D}${PTEST_PATH}
 }
 
 RDEPENDS:${PN}-ptest += " stress-ng python3 python3-multiprocessing python3-datetime python3-misc"
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 3fdad6a4cf8..23b7c50a86a 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -103,7 +103,7 @@ do_compile_ptest() {
 }
 
 do_install_ptest() {
-	cat  ${WORKDIR}/disable-tests >> ${S}/tests/data/DISABLED
+	cat  ${UNPACKDIR}/disable-tests >> ${S}/tests/data/DISABLED
 	rm -f ${B}/tests/configurehelp.pm
 	cp -rf ${B}/tests ${D}${PTEST_PATH}
         rm -f ${D}${PTEST_PATH}/tests/libtest/.libs/libhostname.la
diff --git a/meta/recipes-support/libpcre/libpcre_8.45.bb b/meta/recipes-support/libpcre/libpcre_8.45.bb
index 46fedbae489..17fb6846a52 100644
--- a/meta/recipes-support/libpcre/libpcre_8.45.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.45.bb
@@ -56,7 +56,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 do_install_ptest() {
 	t=${D}${PTEST_PATH}
-	cp ${WORKDIR}/Makefile $t
+	cp ${UNPACKDIR}/Makefile $t
 	cp -r ${S}/testdata $t
 	for i in pcre_stringpiece_unittest pcregrep pcretest; \
 	  do cp ${B}/.libs/$i $t; \
diff --git a/meta/recipes-support/lzop/lzop_1.04.bb b/meta/recipes-support/lzop/lzop_1.04.bb
index d9b3524b678..2b83aa06d9d 100644
--- a/meta/recipes-support/lzop/lzop_1.04.bb
+++ b/meta/recipes-support/lzop/lzop_1.04.bb
@@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "7e72b62a8a60aff5200a047eea0773a8fb205caf7acbe1774d95147f30
 inherit autotools
 
 do_configure:prepend () {
-    install -Dm 0644 ${WORKDIR}/acinclude.m4 ${S}/acinclude.m4
+    install -Dm 0644 ${UNPACKDIR}/acinclude.m4 ${S}/acinclude.m4
 }
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_git.bb
index bd16df91ecb..6c853f1966e 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -52,7 +52,7 @@ do_install_ptest() {
         install -m 0755 ${B}/test/$i ${D}${PTEST_PATH}/test
     done
 
-    install -m 0755 ${WORKDIR}/Makefile ${D}${PTEST_PATH}/
+    install -m 0755 ${UNPACKDIR}/Makefile ${D}${PTEST_PATH}/
     install -m 0755 ${B}/.libs/numactl ${D}${PTEST_PATH}/
 }
 
-- 
2.40.1


