Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id DF61D6CDF2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 04:08:49 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id lf10so2645177pab.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 20:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1RwMLMlGdgPBssWJ3gpxhP2zgo3HdtsHHRQtrhbsaG0=;
	b=wHe8Xu/LzEmbzTs+OR06gGJGzTODIHPteIOixcbu8m9QAoPm2z/vEpExXtFHDOHHWV
	zcz8MYLNDwz9GFY06Wr8HEi+eY+YcMwrA1MGuOUh90CwBQ/KTzZyfPNG86dbbKvaEz4M
	NGyA+Sly0iNH4TMDJc4f5jsn3gDnhIt3Al0C00hC0hwf19bdb/KWO2eYgN+Zak1CI/xU
	dJ8/MHKwq3RcKsljJK0iIAVfT20gcoVvTdn4rsar/ATTSynQOg2bqazJDO5kCrZALgMw
	QtpB1WR30TKyLjd484k/AGMI2Y2QMF6Byd4dBRhqL8PShCZ3J8iEimC7shcv8F5kcvyR
	G5fg==
X-Received: by 10.66.222.234 with SMTP id qp10mr12114978pac.156.1391054930864; 
	Wed, 29 Jan 2014 20:08:50 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	kk1sm12381108pbd.22.2014.01.29.20.08.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Jan 2014 20:08:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 20:09:38 -0800
Message-Id: <cover.1391054829.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH 00/15] Add python 3 support
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
X-List-Received-Date: Thu, 30 Jan 2014 04:08:50 -0000

Post V5

Upgrade to 3.3.3

Fix the warnings like

WARNING: The recipe python3 is trying to install files into a shared
area when those files already exist. Those files and their manifest
location are:

/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/include/python3.3m/pyconfig.h

/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/libpython3.3m.so.1.0

/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/libpython3.3m.so

/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/python3.3/config/Makefile

and

WARNING: The recipe python-setuptools is trying to install files into a 
shared area when those files already exist. Those files and their 
manifest location are:
 
/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/python2.7/site-packages/setuptools.pth
    Matched in manifest-qemux86-64-python-distribute
 
/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/python2.7/site-packages/site.pyc
    Matched in manifest-qemux86-64-python-distribute
 
/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/python2.7/site-packages/site.py
    Matched in manifest-qemux86-64-python-distribute


The following changes since commit c3f3fed1b397b6ee6d44e7d39e63d084e4a88e30:

  toaster.bbclass: save original package name (2014-01-29 17:40:29 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/python3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/python3

Khem Raj (15):
  generate-manifest-3.3.py: Add script to generate python 3.3 manifests
  python-3.3-manifest: Add python3 manifest file
  python3native.bbclass: Add python3 abstraction class
  package_rpm.bbclass: Trigger the regexp on exact keyword match
  classes/distutils: Introduce PYTHON_PN
  classes: Add distutils for python3
  distutils: Introduce PYTHON_ABI variable
  distutils3: Do build_ext as separate step during compile
  python3: Add target and native recipes
  python_2.7.3.bb: Inherit python-dir
  python-distribute: Add recipes for python2 and python3
  distutils3.bbclass: Fix typo and use proper values for target sysroot
  distutils3.bbclass: Use MACHINE for sysroot when not building for
    build host
  python3: Fix staging warnings due to duplicate install
  python-setuptools: Remove its provided by python-distribute

 meta/classes/distutils-base.bbclass                |    5 +-
 meta/classes/distutils-native-base.bbclass         |    4 +-
 meta/classes/distutils-tools.bbclass               |   77 ++++
 meta/classes/distutils.bbclass                     |   23 +-
 meta/classes/distutils3-base.bbclass               |    8 +
 meta/classes/distutils3-native-base.bbclass        |    4 +
 meta/classes/distutils3.bbclass                    |   98 +++++
 meta/classes/package_rpm.bbclass                   |    2 +-
 meta/classes/python-dir.bbclass                    |    2 +
 meta/classes/python3native.bbclass                 |    7 +
 meta/classes/pythonnative.bbclass                  |    9 +-
 meta/classes/setuptools.bbclass                    |    3 +-
 meta/classes/setuptools3.bbclass                   |    8 +
 .../python/python-3.3-manifest.inc                 |  260 ++++++++++++++
 .../python/python-distribute_0.6.32.bb             |   50 +++
 .../python/python-setuptools_1.4.bb                |   40 ---
 .../python/python3-distribute_0.6.32.bb            |   49 +++
 .../python/python3-native_3.3.3.bb                 |   70 ++++
 .../python/python3/000-cross-compile.patch         |   83 +++++
 ...sue-13032-where-it-fails-with-UnicodeDeco.patch |   37 ++
 .../python3/020-dont-compile-python-files.patch    |   37 ++
 .../python/python3/03-fix-tkinter-detection.patch  |   42 +++
 .../python/python3/030-fixup-include-dirs.patch    |   33 ++
 .../python/python3/04-default-is-optimized.patch   |   58 +++
 .../python3/06-ctypes-libffi-fix-configure.patch   |   44 +++
 .../python3/070-dont-clean-ipkg-install.patch      |   36 ++
 .../python3/080-distutils-dont_adjust_files.patch  |   92 +++++
 .../python/python3/110-enable-zlib.patch           |   21 ++
 ...2-distutils-prefix-is-inside-staging-area.patch |   78 ++++
 .../python/python3/130-readline-setup.patch        |   55 +++
 .../python/python3/150-fix-setupterm.patch         |   17 +
 .../python3/avoid_warning_about_tkinter.patch      |   25 ++
 meta/recipes-devtools/python/python3/cgi_py.patch  |   23 ++
 .../python3/fix_for_using_different_libdir.patch   |   54 +++
 .../python3/host_include_contamination.patch       |   28 ++
 .../python/python3/python-3.3-multilib.patch       |  336 +++++++++++++++++
 .../python/python3/remove_sqlite_rpath.patch       |   19 +
 .../python/python3/setuptweaks.patch               |   57 +++
 .../python/python3/shutil-follow-symlink-fix.patch |   17 +
 .../python/python3/sitecustomize.py                |   37 ++
 .../sys_platform_is_now_always_linux2.patch        |   29 ++
 .../python/python3/sysroot-include-headers.patch   |   35 ++
 .../python/python3/unixccompiler.patch             |   33 ++
 meta/recipes-devtools/python/python3_3.3.3.bb      |  197 ++++++++++
 meta/recipes-devtools/python/python_2.7.3.bb       |    2 +-
 .../packagegroups/packagegroup-toolset-native.bb   |    2 +-
 scripts/contrib/python/generate-manifest-3.3.py    |  376 ++++++++++++++++++++
 47 files changed, 2558 insertions(+), 64 deletions(-)
 create mode 100644 meta/classes/distutils-tools.bbclass
 create mode 100644 meta/classes/distutils3-base.bbclass
 create mode 100644 meta/classes/distutils3-native-base.bbclass
 create mode 100644 meta/classes/distutils3.bbclass
 create mode 100644 meta/classes/python3native.bbclass
 create mode 100644 meta/classes/setuptools3.bbclass
 create mode 100644 meta/recipes-devtools/python/python-3.3-manifest.inc
 create mode 100644 meta/recipes-devtools/python/python-distribute_0.6.32.bb
 delete mode 100644 meta/recipes-devtools/python/python-setuptools_1.4.bb
 create mode 100644 meta/recipes-devtools/python/python3-distribute_0.6.32.bb
 create mode 100644 meta/recipes-devtools/python/python3-native_3.3.3.bb
 create mode 100644 meta/recipes-devtools/python/python3/000-cross-compile.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch
 create mode 100644 meta/recipes-devtools/python/python3/020-dont-compile-python-files.patch
 create mode 100644 meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
 create mode 100644 meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
 create mode 100644 meta/recipes-devtools/python/python3/04-default-is-optimized.patch
 create mode 100644 meta/recipes-devtools/python/python3/06-ctypes-libffi-fix-configure.patch
 create mode 100644 meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch
 create mode 100644 meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
 create mode 100644 meta/recipes-devtools/python/python3/110-enable-zlib.patch
 create mode 100644 meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
 create mode 100644 meta/recipes-devtools/python/python3/130-readline-setup.patch
 create mode 100644 meta/recipes-devtools/python/python3/150-fix-setupterm.patch
 create mode 100644 meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
 create mode 100644 meta/recipes-devtools/python/python3/cgi_py.patch
 create mode 100644 meta/recipes-devtools/python/python3/fix_for_using_different_libdir.patch
 create mode 100644 meta/recipes-devtools/python/python3/host_include_contamination.patch
 create mode 100644 meta/recipes-devtools/python/python3/python-3.3-multilib.patch
 create mode 100644 meta/recipes-devtools/python/python3/remove_sqlite_rpath.patch
 create mode 100644 meta/recipes-devtools/python/python3/setuptweaks.patch
 create mode 100644 meta/recipes-devtools/python/python3/shutil-follow-symlink-fix.patch
 create mode 100644 meta/recipes-devtools/python/python3/sitecustomize.py
 create mode 100644 meta/recipes-devtools/python/python3/sys_platform_is_now_always_linux2.patch
 create mode 100644 meta/recipes-devtools/python/python3/sysroot-include-headers.patch
 create mode 100644 meta/recipes-devtools/python/python3/unixccompiler.patch
 create mode 100644 meta/recipes-devtools/python/python3_3.3.3.bb
 create mode 100755 scripts/contrib/python/generate-manifest-3.3.py

-- 
1.7.10.4


