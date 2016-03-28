Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AB6FD6018C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 08:19:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2S8J5jo011170
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 28 Mar 2016 01:19:05 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 28 Mar 2016 01:19:03 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<mark.hatle@windriver.com>
Date: Mon, 28 Mar 2016 04:18:44 -0400
Message-ID: <cover.1459147231.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V7 00/17] fix buildpaths QA issue && dbp package source generation
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
X-List-Received-Date: Mon, 28 Mar 2016 08:19:08 -0000
Content-Type: text/plain

Changed in V7:
- Improve -fdebug-prefix-map to support to remap relative path 

- Improve dbg package sources generation from work-shared

- Fix ifupdown do_compile failed while GCCVERSION = "4.9%"

- Rebase to latest master

Changed in V6:
- Drop kernel build path fix

- Tweak debug location to /usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}
  to keep syn with past

- Tweak PACKAGE_BUILDPATH_TEXT_PATTERNS in fix_buildpaths.bbclass to
  adapt the above fix;


Test steps:

1. vim local.conf
------
IMAGE_INSTALL_append = " gdb gcc gzip"
EXTRA_IMAGE_FEATURES_append = " dbg-pkgs"
------

2. bitbake core-image-minimal

3. runqemu qemux86-64 slirp nographic

4. gdb gzip
(gdb) list
387	    printf ("Written by Jean-loup Gailly.\n");
388	}
389	
390	local void progerror (char const *string)
391	{
392	    int e = errno;
393	    fprintf (stderr, "%s: ", program_name);
394	    errno = e;
395	    perror(string);
396	    exit_code = ERROR;

5. gdb x86_64-poky-linux-gcc
(gdb) list
38	extern int main (int, char **);
39	
40	int
41	main (int argc, char **argv)
42	{
43	  driver d;
44	
45	  return d.main (argc, argv);
46	}
(gdb) b 45
Breakpoint 1 at 0x402ce7: file /usr/src/debug/gcc/5.3.0-r0/work-shared/gcc-5.3.0-r0/gcc-5.3.0/gcc/gcc-main.c, line 45.
(gdb) r
Starting program: /usr/bin/x86_64-poky-linux-gcc 

Breakpoint 1, main (argc=1, argv=0x7fffffffecf8) at /usr/src/debug/gcc/5.3.0-r0/work-shared/gcc-5.3.0-r0/gcc-5.3.0/gcc/gcc-main.c:45
45	  return d.main (argc, argv);
(gdb) step
driver::main (this=this@entry=0x7fffffffebf0, argc=1, argv=0x7fffffffecf8)
    at /usr/src/debug/gcc/5.3.0-r0/work-shared/gcc-5.3.0-r0/gcc-5.3.0/gcc/gcc.c:6935
6935	{
(gdb) bt
#0  driver::main (this=this@entry=0x7fffffffebf0, argc=1, argv=0x7fffffffecf8)
    at /usr/src/debug/gcc/5.3.0-r0/work-shared/gcc-5.3.0-r0/gcc-5.3.0/gcc/gcc.c:6935
#1  0x0000000000402cf1 in main (argc=<optimized out>, argv=<optimized out>)
    at /usr/src/debug/gcc/5.3.0-r0/work-shared/gcc-5.3.0-r0/gcc-5.3.0/gcc/gcc-main.c:45

//Hongxu

The following changes since commit 5005cab723bc488bcf3f982a6401ecf49bdb9ca3:

  add !meta-poky to .gitignore file (2016-03-26 08:06:58 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-buildpath
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-buildpath

Hongxu Jia (17):
  conf/bitbake.conf package.bbclass: fix dbg package not contain sources
    while -fdebug-prefix-map used
  gcc-5.3/gcc-4.9: -fdebug-prefix-map support to remap relative path
  conf/bitbake.conf package.bbclass: improve dbg package sources
    generation from work-shared
  dtc.inc: fix buildpaths QA issue
  fix_buildpaths.bbclass: add bbclass to fix build path
  icu: fix buildpaths QA issue
  tcl: fix buildpath QA issue
  python2/3: fix buildpath QA issue
  bbclass distutils/distutils3: fix .pyc/.pyo buildpath
  bbclass distutils/distutils3/setuptools/setuptools3: clean up
    DISTUTILS_INSTALL_ARGS
  python-setuptools/python3-setuptools: use old-style install
  python3-pip: use old-style install
  waf.bbclass: support do patch on extracted files
  python-pycairo: fix buildpath QA issue
  openssl: fix buildpath QA issue
  epiphany: fix buildpaths QA issue
  ifupdown: fix do_compile failed while GCCVERSION = "4.9%"

 meta/classes/distutils.bbclass                     |   8 +-
 meta/classes/distutils3.bbclass                    |   8 +-
 meta/classes/fix_buildpaths.bbclass                |  66 +++++++++++++
 meta/classes/package.bbclass                       | 106 ++++++++++++++++-----
 meta/classes/setuptools.bbclass                    |   5 -
 meta/classes/setuptools3.bbclass                   |   5 -
 meta/classes/waf.bbclass                           |  11 ++-
 meta/conf/bitbake.conf                             |   4 +-
 .../openssl/remove-build-path-in-source-code.patch |  44 +++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2g.bb |   7 ++
 meta/recipes-core/ifupdown/ifupdown_0.8.2.bb       |   2 +-
 meta/recipes-devtools/gcc/gcc-4.9.inc              |   1 +
 ...prefix-map-support-to-remap-relative-path.patch |  51 ++++++++++
 meta/recipes-devtools/gcc/gcc-5.3.inc              |   1 +
 ...prefix-map-support-to-remap-relative-path.patch |  51 ++++++++++
 ...trip-off-build-path-in-purported-filename.patch |  62 ++++++++++++
 .../python/python-pycairo_1.10.0.bb                |  25 ++---
 .../python/python-setuptools_19.4.bb               |   2 -
 meta/recipes-devtools/python/python3-pip_8.0.0.bb  |  12 ---
 .../python/python3-setuptools_19.4.bb              |   8 +-
 meta/recipes-devtools/python/python3_3.5.1.bb      |  20 +++-
 meta/recipes-devtools/python/python_2.7.11.bb      |  29 +++++-
 meta/recipes-devtools/tcltk/tcl_8.6.4.bb           |   9 +-
 meta/recipes-gnome/epiphany/epiphany_3.18.4.bb     |   8 +-
 .../files/use-relative-path-for-build-dir.patch    |  57 +++++++++++
 meta/recipes-kernel/dtc/dtc.inc                    |   3 +
 .../dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch       |  30 ++++++
 .../icu/icu/add-variable-U_CC-and-U_CXX.patch      |  61 ++++++++++++
 meta/recipes-support/icu/icu_56.1.bb               |  12 +++
 29 files changed, 613 insertions(+), 95 deletions(-)
 create mode 100644 meta/classes/fix_buildpaths.bbclass
 create mode 100644 meta/recipes-connectivity/openssl/openssl/remove-build-path-in-source-code.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0074-fdebug-prefix-map-support-to-remap-relative-path.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0056-fdebug-prefix-map-support-to-remap-relative-path.patch
 create mode 100644 meta/recipes-devtools/python/python-pycairo/strip-off-build-path-in-purported-filename.patch
 create mode 100644 meta/recipes-gnome/epiphany/files/use-relative-path-for-build-dir.patch
 create mode 100644 meta/recipes-kernel/dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch
 create mode 100644 meta/recipes-support/icu/icu/add-variable-U_CC-and-U_CXX.patch

-- 
1.9.1


