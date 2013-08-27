Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 29B456BB34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 17:12:45 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id w10so5093287pde.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 10:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=l1W2glUpv0vkvrMntsKHcOq7zXHRc2hjHAk/kWT0Xd4=;
	b=UyPLQ+aVR5nZJJ0d30Q4+xNDr4ye5Om8Yk38xvijKdUSi96uPq5lWZI0+hjTH76PGX
	22gRorZRylWz/eHyU8pxFIycKNtMCc7RrAzr//VcEOBl20AK0GmVmbqJsH2BgosfXTxx
	5Z0ZSVA+dGzGxvWYd3S7mfU79kcgq4QZwqRXGA+uOy4UvoxXQjnfwOMrSGU5GRYwxodG
	956gXEUR17zz4kQyeWmXVJ/NsO0X7RmIsaTd5nyFidbNfOf87UyrBnEFCzNIflGHtP+z
	b3S4iQSejmjsyeeIbF6NTISoWqC7gWkXtGh76VflkMbJDQ61RF1JjREo6d4sWqIAhN0a
	kENA==
X-Received: by 10.66.27.143 with SMTP id t15mr10095983pag.171.1377623566034;
	Tue, 27 Aug 2013 10:12:46 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	qv4sm25802261pbc.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 10:12:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 10:11:56 -0700
Message-Id: <cover.1377623208.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH V4 00/20] Add python 3 support
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
X-List-Received-Date: Tue, 27 Aug 2013 17:12:46 -0000

This patchset adds python3 recipes on the same lines as python2
I have hopefully addressed all issues reported and review comments
if not please let me know. One issue that I have not been able to
reproduce is compiling python3 as 32bit package on x86_64 (multilib)
that Saul reported.

We can mark python3 as multilib broken in meantime until the issue
is reproduced and fixed.

The following changes since commit e4582a51a2500ad3b418e53170f5fb6b2cbd98a5:

  gcc-4.8.inc: Allow lto to be configurable (2013-08-27 13:48:44 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/python3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/python3

Khem Raj (20):
  generate-manifest-3.3.py: Add script to generate python 3.3 manifests
  python-3.3-manifest: Add python3 manifest file
  python3native.bbclass: Add python3 abstraction class
  package_rpm.bbclass:Make the regexp less greedy
  classes/distutils: Introduce PYTHON_PN
  classes: Add distutils for python3
  distutils: Introduce PYTHON_ABI variable
  distutils3: Do build_ext as separate step during compile
  python3: Add recipes
  python3: Add native recipe
  python_2.7.3.bb: Inherit python-dir
  python-distribute: Add recipes for python2 and python3
  python3: Upgrade to 3.3.2
  distutils3.bbclass: Fix typo and use proper values for target sysroot
  python3, python3-native: Consider OE staging installation
  python3: Fix host include contamination issue
  distutils3.bbclass: Use MACHINE for sysroot when not building for
    build host
  python3: Fix the compiler invocation and linker flags when cross
    compiling
  python: Add Patch description and status information
  python3_3.3.2.bb: Add liblzma to RDEPENDS for python3-misc

 meta/classes/distutils-base.bbclass                |   5 +-
 meta/classes/distutils-native-base.bbclass         |   4 +-
 meta/classes/distutils-tools.bbclass               |  77 +++++
 meta/classes/distutils.bbclass                     |  23 +-
 meta/classes/distutils3-base.bbclass               |   8 +
 meta/classes/distutils3-native-base.bbclass        |   4 +
 meta/classes/distutils3.bbclass                    |  98 ++++++
 meta/classes/package_rpm.bbclass                   |   2 +-
 meta/classes/python-dir.bbclass                    |   2 +
 meta/classes/python3native.bbclass                 |   7 +
 meta/classes/pythonnative.bbclass                  |   9 +-
 meta/classes/setuptools.bbclass                    |   3 +-
 meta/classes/setuptools3.bbclass                   |   8 +
 .../python/python-3.3-manifest.inc                 | 260 ++++++++++++++
 .../python/python-distribute_0.6.32.bb             |  47 +++
 .../python/python3-distribute_0.6.32.bb            |  47 +++
 .../python/python3-native_3.3.2.bb                 |  70 ++++
 .../python/python3/000-cross-compile.patch         |  83 +++++
 ...sue-13032-where-it-fails-with-UnicodeDeco.patch |  37 ++
 .../python3/020-dont-compile-python-files.patch    |  37 ++
 .../python/python3/03-fix-tkinter-detection.patch  |  42 +++
 .../python/python3/030-fixup-include-dirs.patch    |  33 ++
 .../python/python3/04-default-is-optimized.patch   |  58 ++++
 .../python3/06-ctypes-libffi-fix-configure.patch   |  44 +++
 .../python3/070-dont-clean-ipkg-install.patch      |  36 ++
 .../python3/080-distutils-dont_adjust_files.patch  |  92 +++++
 .../python/python3/110-enable-zlib.patch           |  21 ++
 ...2-distutils-prefix-is-inside-staging-area.patch |  78 +++++
 .../python/python3/130-readline-setup.patch        |  55 +++
 .../python/python3/150-fix-setupterm.patch         |  17 +
 .../python3/avoid_warning_about_tkinter.patch      |  25 ++
 meta/recipes-devtools/python/python3/cgi_py.patch  |  23 ++
 .../python3/fix_for_using_different_libdir.patch   |  54 +++
 .../python3/host_include_contamination.patch       |  28 ++
 .../python/python3/python-3.3-multilib.patch       | 336 ++++++++++++++++++
 .../python/python3/remove_sqlite_rpath.patch       |  19 ++
 .../python/python3/setuptweaks.patch               |  57 ++++
 .../python/python3/shutil-follow-symlink-fix.patch |  17 +
 .../python/python3/sitecustomize.py                |  37 ++
 .../sys_platform_is_now_always_linux2.patch        |  29 ++
 .../python/python3/sysroot-include-headers.patch   |  35 ++
 .../python/python3/unixccompiler.patch             |  33 ++
 meta/recipes-devtools/python/python3_3.3.2.bb      | 206 +++++++++++
 meta/recipes-devtools/python/python_2.7.3.bb       |   2 +-
 scripts/contrib/python/generate-manifest-3.3.py    | 376 +++++++++++++++++++++
 45 files changed, 2561 insertions(+), 23 deletions(-)
 create mode 100644 meta/classes/distutils-tools.bbclass
 create mode 100644 meta/classes/distutils3-base.bbclass
 create mode 100644 meta/classes/distutils3-native-base.bbclass
 create mode 100644 meta/classes/distutils3.bbclass
 create mode 100644 meta/classes/python3native.bbclass
 create mode 100644 meta/classes/setuptools3.bbclass
 create mode 100644 meta/recipes-devtools/python/python-3.3-manifest.inc
 create mode 100644 meta/recipes-devtools/python/python-distribute_0.6.32.bb
 create mode 100644 meta/recipes-devtools/python/python3-distribute_0.6.32.bb
 create mode 100644 meta/recipes-devtools/python/python3-native_3.3.2.bb
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
 create mode 100644 meta/recipes-devtools/python/python3_3.3.2.bb
 create mode 100755 scripts/contrib/python/generate-manifest-3.3.py

-- 
1.8.3.4


