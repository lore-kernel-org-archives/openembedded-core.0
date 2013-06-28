Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8A3DC6A4E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:00:02 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id kx10so2920972pab.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=lkAjrlZyMCI1gxcPNvVF5v5JyQma8ghoph73nceaLIE=;
	b=LUSj0HEykWr/u4kvQA/06hPmgv9ljSYBcTlQyGsowakBVoo8M9ybOK/IFbEL1lM9k0
	yH1vZyVBHCLQY1xpCdcLMX7SCFLpfk4/2QDalbl/jNghbdXvKrlyqXI1kS0GZof6ZVNa
	uAug4gCT2vUZTVmz88WB98jeTeiMVxou9PKI0VMmRdvlarGkytMmg2oPu6zuAuZIFvE0
	5yJwBWx5nUaWU+juAYVKOaVi8VJwbUqlu7AeN8Dzc6eKPPLxdOzcVLe03cnvez4kLAT3
	RwnNJT/bYUnaPX7Fr8UzxZkzVCm9tq5o/udEjdMk8R15EE/sFGfHZwrctOR8fCfLYgZ1
	EIHw==
X-Received: by 10.66.136.49 with SMTP id px17mr13524467pab.133.1372456803866; 
	Fri, 28 Jun 2013 15:00:03 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id aj3sm10741739pad.8.2013.06.28.15.00.02
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:00:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 14:59:46 -0700
Message-Id: <cover.1372456294.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 00/24] Add python3 recipes
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
X-List-Received-Date: Fri, 28 Jun 2013 22:00:02 -0000


This patchset adds python3 recipes to metadata in such a way
that they can coexist with python2. The patchset has been
tested quite well and I think is ready for review.

At times it will adjust existing python2 recipes to make
room for itself in a compatible way

To add them to your images

add
       python3 
       python3-modules 
       python3-misc 

to IMAGE_INSTALL


The following changes since commit ff65497cd9a96d5ab49b16ba1f7e30a216ff4a42:

  classes/insane: remove la2 check which no longer exists from ERROR_QA (2013-06-28 16:33:05 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/python3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/python3

Khem Raj (24):
  generate-manifest-3.3.py: Add script to generate python 3.3 manifests
  python3native.bbclass: Add python3 abstraction class
  package_rpm.bbclass:Make the regexp less greedy
  classes/distutils: Introduce PYTHON_PN
  classes: Add distutils for python3
  setuptools.bbclass: Use python-distribute instead of
    python-setuptools
  distutils3.bbclass: Port the distutils class fix to handle filenames
    with spaces
  setuptools3.bbclass: Remove useless multiline comment
  distutils: Introduce PYTHON_ABI variable
  distutils3: Do build_ext as separate step during compile
  python-3.3-manifest: Add python3 manifest file
  python3: Add recipes
  python3: Add native recipe
  python_2.7.3.bb: Inherit python-dir
  ipython: Add recipes for ipython2 and ipython3
  python-distribute: Add recipes for python2 and python3
  zeromq: Add recipe
  pyzmq: Add recipes using python3
  python3-pycurl: Add recipe
  python3-docutils: Add recipe
  python3-jinja: Recipe for python3 templating system
  python3-nose: Testing tools for python
  python3-sphinx: New recipe for documentation system
  python3: Upgrade to 3.3.2

 meta/classes/distutils-base.bbclass                |    5 +-
 meta/classes/distutils-native-base.bbclass         |    4 +-
 meta/classes/distutils-tools.bbclass               |   77 +++
 meta/classes/distutils.bbclass                     |   24 +-
 meta/classes/distutils3-base.bbclass               |    8 +
 meta/classes/distutils3-native-base.bbclass        |    4 +
 meta/classes/distutils3.bbclass                    |   82 +++
 meta/classes/package_rpm.bbclass                   |    2 +-
 meta/classes/python-dir.bbclass                    |    2 +
 meta/classes/python3native.bbclass                 |    7 +
 meta/classes/pythonnative.bbclass                  |    9 +-
 meta/classes/setuptools.bbclass                    |    3 +-
 meta/classes/setuptools3.bbclass                   |    8 +
 .../ipython/001-completer-across-raw-types.patch   |  562 ++++++++++++++++++++
 .../ipython3/001-completer-across-raw-types.patch  |  562 ++++++++++++++++++++
 meta/recipes-devtools/python/ipython3_0.13.1.bb    |   71 +++
 meta/recipes-devtools/python/ipython_0.13.1.bb     |   48 ++
 .../python/python-3.3-manifest.inc                 |  260 +++++++++
 .../python/python-distribute_0.6.32.bb             |   47 ++
 .../python/python3-distribute_0.6.32.bb            |   46 ++
 .../python/python3-docutils_0.10.bb                |   37 ++
 meta/recipes-devtools/python/python3-jinja_1.2.bb  |   37 ++
 .../python/python3-native_3.3.2.bb                 |   67 +++
 meta/recipes-devtools/python/python3-nose_1.2.1.bb |   34 ++
 .../python/python3-pycurl/no-static-link.patch     |   16 +
 .../python/python3-pycurl_7.19.0.bb                |   35 ++
 .../0001-Fixed-just-zmq-detection.patch            |   56 ++
 .../python/python3-pyzmq_13.0.0.bb                 |   46 ++
 .../python/python3-sphinx_1.1.3.bb                 |   39 ++
 .../python/python3/000-cross-compile.patch         |   76 +++
 ...sue-13032-where-it-fails-with-UnicodeDeco.patch |   37 ++
 .../python3/020-dont-compile-python-files.patch    |   31 ++
 .../python/python3/03-fix-tkinter-detection.patch  |   42 ++
 .../python/python3/030-fixup-include-dirs.patch    |   27 +
 .../python/python3/04-default-is-optimized.patch   |   58 ++
 .../python3/06-ctypes-libffi-fix-configure.patch   |   44 ++
 .../python3/070-dont-clean-ipkg-install.patch      |   30 ++
 .../python3/080-distutils-dont_adjust_files.patch  |   86 +++
 .../python/python3/110-enable-zlib.patch           |   15 +
 .../python/python3/130-readline-setup.patch        |   49 ++
 .../python/python3/150-fix-setupterm.patch         |   11 +
 .../python3/avoid_warning_about_tkinter.patch      |   25 +
 meta/recipes-devtools/python/python3/cgi_py.patch  |   23 +
 .../python3/fix_for_using_different_libdir.patch   |   54 ++
 .../python3/host_include_contamination.patch       |   28 +
 .../python/python3/python-3.3-multilib.patch       |  348 ++++++++++++
 .../python/python3/remove_sqlite_rpath.patch       |   19 +
 .../python/python3/setuptweaks.patch               |   57 ++
 .../python/python3/shutil-follow-symlink-fix.patch |   11 +
 .../python/python3/sitecustomize.py                |   37 ++
 .../sys_platform_is_now_always_linux2.patch        |   29 +
 meta/recipes-devtools/python/python3_3.3.2.bb      |  202 +++++++
 meta/recipes-devtools/python/python_2.7.3.bb       |    2 +-
 meta/recipes-devtools/python/zeromq_3.2.2.bb       |   24 +
 scripts/contrib/python/generate-manifest-3.3.py    |  376 +++++++++++++
 55 files changed, 3916 insertions(+), 23 deletions(-)
 create mode 100644 meta/classes/distutils-tools.bbclass
 create mode 100644 meta/classes/distutils3-base.bbclass
 create mode 100644 meta/classes/distutils3-native-base.bbclass
 create mode 100644 meta/classes/distutils3.bbclass
 create mode 100644 meta/classes/python3native.bbclass
 create mode 100644 meta/classes/setuptools3.bbclass
 create mode 100644 meta/recipes-devtools/python/ipython/001-completer-across-raw-types.patch
 create mode 100644 meta/recipes-devtools/python/ipython3/001-completer-across-raw-types.patch
 create mode 100644 meta/recipes-devtools/python/ipython3_0.13.1.bb
 create mode 100644 meta/recipes-devtools/python/ipython_0.13.1.bb
 create mode 100644 meta/recipes-devtools/python/python-3.3-manifest.inc
 create mode 100644 meta/recipes-devtools/python/python-distribute_0.6.32.bb
 create mode 100644 meta/recipes-devtools/python/python3-distribute_0.6.32.bb
 create mode 100644 meta/recipes-devtools/python/python3-docutils_0.10.bb
 create mode 100644 meta/recipes-devtools/python/python3-jinja_1.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-native_3.3.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-nose_1.2.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycurl/no-static-link.patch
 create mode 100644 meta/recipes-devtools/python/python3-pycurl_7.19.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pyzmq/0001-Fixed-just-zmq-detection.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyzmq_13.0.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-sphinx_1.1.3.bb
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
 create mode 100644 meta/recipes-devtools/python/python3_3.3.2.bb
 create mode 100644 meta/recipes-devtools/python/zeromq_3.2.2.bb
 create mode 100755 scripts/contrib/python/generate-manifest-3.3.py

-- 
1.7.9.5


