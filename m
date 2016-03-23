Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AC45D6012C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 06:15:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2N6Flho011935
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Mar 2016 23:15:47 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 22 Mar 2016 23:15:46 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<bruce.ashfield@gmail.com>, <mark.hatle@windriver.com>
Date: Wed, 23 Mar 2016 02:15:41 -0400
Message-ID: <cover.1458713426.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458638728.git.hongxu.jia@windriver.com>
References: <cover.1458638728.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V6 00/15] fix buildpaths QA issue
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
X-List-Received-Date: Wed, 23 Mar 2016 06:15:50 -0000
Content-Type: text/plain

Changed in V6:
- Drop kernel build path fix

- Tweak debug location to /usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}
  to keep syn with past

- Tweak PACKAGE_BUILDPATH_TEXT_PATTERNS in fix_buildpaths.bbclass to
  adapt the above fix;

Follow test case in V5:
-----------
root@qemux86-64:~# ls /usr/src/debug/
acl           bash          e2fsprogs     glibc         libcap        libxcb        ncurses       service       util-linux    zlib
attr          busybox       expat         kbd           libx11        libxdmcp      opkg-utils    shadow        v86d
base-passwd   dbus          gdb           kmod          libxau        libxkbcommon  readline      systemd       xz

root@qemux86-64:~# gdb skeleton-test 
(gdb) r
Starting program: /usr/sbin/skeleton-test 
hello world

Program received signal SIGSEGV, Segmentation fault.
0x000000000040056b in main (argc=1, argv=0x7fffffffed08) at /usr/src/debug/service/0.1-r0/skeleton_test.c:8
8		*p = 1;
(gdb) list
3	int main(int argc, char *argv[])
4	{
5		printf("hello world\n");
6	
7		char *p = NULL;
8		*p = 1;
9		return 0;
10	}

-----------

//Hongxu

The following changes since commit 2f2f784727a1617c2b9ce0bb86730ba301238e06:

  parselogs: add new whitelist entries to address 4.4.3 issues (2016-03-22 08:54:34 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-buildpath
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-buildpath

Hongxu Jia (15):
  conf/bitbake.conf package.bbclass: fix dbg package not contain sources
    while -fdebug-prefix-map used
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
  gconf: fix buildpaths QA issue

 meta/classes/distutils.bbclass                     |  8 +--
 meta/classes/distutils3.bbclass                    |  8 +--
 meta/classes/fix_buildpaths.bbclass                | 55 +++++++++++++++++++
 meta/classes/package.bbclass                       | 24 +++++++--
 meta/classes/setuptools.bbclass                    |  5 --
 meta/classes/setuptools3.bbclass                   |  5 --
 meta/classes/waf.bbclass                           | 11 +++-
 meta/conf/bitbake.conf                             |  3 +-
 .../openssl/remove-build-path-in-source-code.patch | 44 +++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2g.bb |  7 +++
 ...trip-off-build-path-in-purported-filename.patch | 62 ++++++++++++++++++++++
 .../python/python-pycairo_1.10.0.bb                | 25 +++------
 .../python/python-setuptools_19.4.bb               |  2 -
 meta/recipes-devtools/python/python3-pip_8.0.0.bb  | 12 -----
 .../python/python3-setuptools_19.4.bb              |  8 +--
 meta/recipes-devtools/python/python3_3.5.1.bb      | 20 +++++--
 meta/recipes-devtools/python/python_2.7.11.bb      | 29 ++++++++--
 meta/recipes-devtools/tcltk/tcl_8.6.4.bb           |  9 +++-
 meta/recipes-gnome/epiphany/epiphany_3.18.4.bb     |  8 ++-
 .../files/use-relative-path-for-build-dir.patch    | 57 ++++++++++++++++++++
 meta/recipes-gnome/gnome/gconf_3.2.6.bb            |  3 +-
 meta/recipes-kernel/dtc/dtc.inc                    |  3 ++
 .../dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch       | 30 +++++++++++
 .../icu/icu/add-variable-U_CC-and-U_CXX.patch      | 61 +++++++++++++++++++++
 meta/recipes-support/icu/icu_56.1.bb               | 12 +++++
 25 files changed, 435 insertions(+), 76 deletions(-)
 create mode 100644 meta/classes/fix_buildpaths.bbclass
 create mode 100644 meta/recipes-connectivity/openssl/openssl/remove-build-path-in-source-code.patch
 create mode 100644 meta/recipes-devtools/python/python-pycairo/strip-off-build-path-in-purported-filename.patch
 create mode 100644 meta/recipes-gnome/epiphany/files/use-relative-path-for-build-dir.patch
 create mode 100644 meta/recipes-kernel/dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch
 create mode 100644 meta/recipes-support/icu/icu/add-variable-U_CC-and-U_CXX.patch

-- 
1.9.1


