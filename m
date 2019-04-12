Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id CD3967D6B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 16:58:35 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 4so12101621wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 09:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=evrRjSe+z/f+e10GFzG6aev4QjsDwbJsOTONAPgXpcg=;
	b=rdfiU2wubX+LKsf3xqjm50uf4ZaWmdu78RIO52DLzs0Qzn9IzKSs2TdCRVeOM67+of
	ydgjwCb7VRMvtL9iPxyOcV6DNAJh7Rw6GSpxxj+44kponz+iGvFBXASaAECzmYRUDhgr
	n2sJRID4XMst0+HIQ/CBslfwnWi4cqdvF8Ry3fukSpxLpqeqD0sgYbJZozdPIK9UIoNo
	lh8OoWwHbl/zXVntVcRUFhKhdDB3yoc2nJWilqqN0qmnIzCCFiL/XoVhNC1cxzya4yAc
	LvAV+iMxU3JUAQB8I2cGdFQlD4xeN8P7qBdIfRCkiWmF633z09vJ6FARKMrGxLPk0jfL
	5TLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=evrRjSe+z/f+e10GFzG6aev4QjsDwbJsOTONAPgXpcg=;
	b=kuMdDHj9z+MdaWS007htb9EKzTVW5k5Ic6JEJOhwNW+Ja+AHOeDU/+AGYptfy8ZF9h
	XOUFZsEEE4eoeK6k/Feql9paYQjc6cVxp3H29i6diRcZXYyz2HFI2qpM+QbiHvcrZw1o
	0gTSk1BtofFZLQ9AfNa5TPFlCSWRPEnzcrcqzSsJzZs5GK43kTfHAApj6xrmZ78xpXeO
	RhOoIJcyvuymYiIkUFZAhhQcEKjoIzuVmZKxK7kXvZmyoAJGlaAHdVnGNrrN2lT4K0IN
	VLK1d2DE6z+j170TXWmhJxNwipgIknE+41DQelUoS9Zdw0csOVnLgbFarPSwdPDT7AMJ
	qkqQ==
X-Gm-Message-State: APjAAAUnY+KgJLQRuWIFAlIqLpGpuhPv6B/T89NDgZ+RknroePhdEtMU
	IrUIXiqUii2r0DiW9LYy5FR2XSWQ
X-Google-Smtp-Source: APXvYqxBTqWpAWdsGNMcKTj5LRqXjuogKMmiQBmxp3wG2h//qWyJZAAjWCMOVDl2fmk01eG2T37qtg==
X-Received: by 2002:a1c:4187:: with SMTP id o129mr11747659wma.57.1555088316166;
	Fri, 12 Apr 2019 09:58:36 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	u17sm16012116wmu.36.2019.04.12.09.58.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Apr 2019 09:58:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Apr 2019 16:58:34 +0000
Message-Id: <20190412165834.1944-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [morty][PATCH] libtool-cross: remove host specific paths to native sysroot from sstate archive
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
X-List-Received-Date: Fri, 12 Apr 2019 16:58:36 -0000

* when you build libtool-cross on one builder in some directory
  and then reuse the same libtool-cross on another builder in
  different directory, you'll have some variables still pointing
  to wrong directory (it's a bit worse when it's on the same
  builder, just in different workspace, because then the directory
  might exist and not exist depending on the state of the other
  workspace and then the failures are even more random)

* in my case I'm building libtool-cross in /jenkins/mjansa/build-nodistro-morty/
  and you can see the paths to native sysroot in:
  LTCFLAGS, sys_lib_search_path_spec, compiler_lib_search_dirs, compiler_lib_search_path
  after this change, there is only one case in LTCFLAGS -fdebug-prefix-map
  which points to the old WORKDIR:

  # grep build-nodistro-morty sstate-*/sysroot-destdir/usr/bin/crossscripts/i586-oe-linux-libtool
  sstate-bad/sysroot-destdir/usr/bin/crossscripts/i586-oe-linux-libtool:LTCFLAGS=" -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=/jenkins/mjansa/build-nodistro-morty/BUILD/work/i586-oe-linux/libtool-cross/2.4.6-r0=/usr/src/debug/libtool-cross/2.4.6-r0 -fdebug-prefix-map=/jenkins/mjansa/build-nodistro-morty/BUILD/sysroots/x86_64-linux= -fdebug-prefix-map=FIXMESTAGINGDIRHOST= "
  sstate-bad/sysroot-destdir/usr/bin/crossscripts/i586-oe-linux-libtool:sys_lib_search_path_spec="/jenkins/mjansa/build-nodistro-morty/BUILD/sysroots/x86_64-linux/usr/lib/i586-oe-linux/gcc/i586-oe-linux/6.4.0 FIXMESTAGINGDIRHOST/lib FIXMESTAGINGDIRHOST/usr/lib/i586-oe-linux/6.4.0 FIXMESTAGINGDIRHOST/usr/lib "
  sstate-bad/sysroot-destdir/usr/bin/crossscripts/i586-oe-linux-libtool:compiler_lib_search_dirs="/jenkins/mjansa/build-nodistro-morty/BUILD/sysroots/x86_64-linux/usr/lib/i586-oe-linux/gcc/i586-oe-linux/6.4.0 FIXMESTAGINGDIRHOST/lib FIXMESTAGINGDIRHOST/usr/lib/i586-oe-linux/6.4.0 FIXMESTAGINGDIRHOST/usr/lib"
  sstate-bad/sysroot-destdir/usr/bin/crossscripts/i586-oe-linux-libtool:compiler_lib_search_path="-L/jenkins/mjansa/build-nodistro-morty/BUILD/sysroots/x86_64-linux/usr/lib/i586-oe-linux/gcc/i586-oe-linux/6.4.0 -LFIXMESTAGINGDIRHOST/lib -LFIXMESTAGINGDIRHOST/usr/lib/i586-oe-linux/6.4.0 -LFIXMESTAGINGDIRHOST/usr/lib"

  sstate-better/sysroot-destdir/usr/bin/crossscripts/i586-oe-linux-libtool:LTCFLAGS=" -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=/jenkins/mjansa/build-nodistro-morty/BUILD/work/i586-oe-linux/libtool-cross/2.4.6-r0=/usr/src/debug/libtool-cross/2.4.6-r0 -fdebug-prefix-map=FIXME_STAGING_DIR_NATIVE= -fdebug-prefix-map=FIXMESTAGINGDIRHOST= "

* It seems there aren't many cases where the above variables cause big issues,
  but it gets worse when you build "dd" in native sysroot (coreutils-native),
  before libtool-cross (this is why this is bad only with Yocto 2.2 Morty and
  older before RSS, with Pyro and newer you won't detect bin/dd in
  native sysroot without explicit dependency on coreutils-native and you'll
  always use dd from HOSTTOOLS)

  without coreutils-native in sysroot:
  sstate-better/sysroot-destdir/usr/bin/crossscripts/i586-oe-linux-libtool:lt_truncate_bin="/bin/dd bs=4096 count=1"

  with coreutils-native in sysroot before and after this change:
  sstate-bad-with-dd/sysroot-destdir/usr/bin/crossscripts/i586-oe-linux-libtool:lt_truncate_bin="/jenkins/mjansa/build-nodistro-morty/BUILD/sysroots/x86_64-linux/usr/bin/dd bs=4096 count=1"
  sstate-better-with-dd/sysroot-destdir/usr/bin/crossscripts/i586-oe-linux-libtool:lt_truncate_bin="FIXME_STAGING_DIR_NATIVE/usr/bin/dd bs=4096 count=1"

  this issue was already resolved for target libtool, but not for
  libtool-cross in:
  http://git.openembedded.org/openembedded-core/commit/meta/recipes-devtools/libtool?h=morty&id=5e83a72f1ec834063d27b924bc7f9a047204cec6

  and the HOSTTOOLS_DIR and DEBUG_PREFIX_MAP a bit later in rocko (but
  again only for target libtool, not libtool-cross:
  http://git.openembedded.org/openembedded-core/commit/meta/recipes-devtools/libtool?h=rocko&id=04db02138e363898e040e33557f1296e8a43c3fd

  the above still isn't ideal, because now FIXME_STAGING_DIR_NATIVE/usr/bin/dd will be
  replaced with correct path to native sysroot when unpacking libtool-cross from sstate
  but it will still need coreutils-native dependency to find /usr/bin/dd there.
  Add ac_cv_path_lt_DD=dd to CACHED_CONFIGUREVARS to prevent using absolute path to
  dd (like we already do for grep) to prevent this issue as well, now we have:

  sstate-best-with-dd/sysroot-destdir/usr/bin/crossscripts/i586-oe-linux-libtool:lt_truncate_bin="dd bs=4096 count=1"

* I've noticed this in a build which was failing with:
  ERROR: lib32-db-5.3.28-r1 do_package_qa: QA Issue: /usr/bin/db_verify contained in package lib32-db-bin requires /bin/bash, but no providers found in RDEPENDS_lib32-db-bin? [file-rdeps]
  and strengly enough, this was cased by all /usr/bin/db_* files being the libtool
  linker scripts instead of the actual binaries, in the log.do_install you can notice
  only small warning and different path when installing the utilities:
  working case:
  x86_64-oe-linux-libtool: warning: 'libdb-5.3.la' has not been installed in '/usr/lib64'
  x86_64-oe-linux-libtool: install: cp -p .libs/db_checkpoint /jenkins/mjansa/build-nodistro-morty/BUILD/work/qemux86-oe-linux/db/5.3.28-r1/image/usr/bin/db_checkpoint
  broken case:
  x86_64-oe-linux-libtool: install: cp -p db_checkpoint /jenkins/mjansa/build-nodistro-morty/BUILD/work/qemux86-oe-linux/db/5.3.28-r1/image/usr/bin/db_checkpoint

  this was caused by the invalid path to "dd" mentioned above, comparing
  libtool --mode-install --debug shows:

  diff -uNr log.install.db_archive.libtool.{ape,raven}
  --- log.install.db_archive.libtool.ape  2019-04-12 13:36:07.127370425 +0000
  +++ log.install.db_archive.libtool.raven        2019-04-12 13:36:25.847821004 +0000
  @@ -202,9 +202,125 @@
   + wrapper=db_archive
   + func_ltwrapper_script_p db_archive
   + test -f db_archive
  ++ /bin/dd bs=4096 count=1
   + func_generated_by_libtool_p
  -+ /home/jenkins/anaconda/build-nodistro-morty/build/BUILD/sysroots/x86_64-linux/usr/bin/dd bs=4096 count=1
   + grep '^# Generated by .*libtool'
  ++ notinst_deplibs=
  ...
  func_ltwrapper_script_p, calls lt_truncate_bin and pipes the result to
  func_generated_by_libtool_p, but with non-existent path to dd this fails
  and libtool installs the db_archive script, instead of sourcing it and installing
  the actual binary .libs/db_checkpoint

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb b/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
index b268310468..40530b3cfa 100644
--- a/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
+++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
@@ -38,3 +38,7 @@ do_install () {
 SYSROOT_DIRS += "${bindir_crossscripts} ${target_datadir}"
 
 SSTATE_SCAN_FILES += "libtoolize *-libtool"
+
+# Replace native sysroot as well, it's used in
+# LTCFLAGS, sys_lib_search_path_spec, compiler_lib_search_dirs, compiler_lib_search_path variables
+EXTRA_STAGING_FIXMES = "STAGING_DIR_NATIVE"
-- 
2.17.1


