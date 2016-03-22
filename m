Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 998846011C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 12:12:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2MCCmMf030990
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 22 Mar 2016 05:12:48 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 22 Mar 2016 05:12:47 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<raj.khem@gmail.com>, <mark.hatle@windriver.com>
Date: Tue, 22 Mar 2016 08:12:28 -0400
Message-ID: <cover.1458638728.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V5 00/16] fix buildpaths QA issue
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
X-List-Received-Date: Tue, 22 Mar 2016 12:12:51 -0000
Content-Type: text/plain

Changed in V5:

- Fix dbg package not contain sources while -fdebug-prefix-map used;

- Tweak fix_buildpaths.bbclass to adapt the above fix;

- gconf: remove duplicated option;

Test case to verify patch 01/16:

1. Modify recipe service in meta-skeleton,
   execute it caused segment fault

diff --git a/meta-skeleton/recipes-skeleton/service/service/skeleton_test.c b/meta-skeleton/recipes-skeleton/service/service/skeleton_test.c
index 96c67ac..0862882 100644
--- a/meta-skeleton/recipes-skeleton/service/service/skeleton_test.c
+++ b/meta-skeleton/recipes-skeleton/service/service/skeleton_test.c
@@ -1,12 +1,10 @@
-#include <unistd.h>
-
-/* This demo does nothing except for testing /etc/init.d/skeleton */
+#include <stdio.h>
 
 int main(int argc, char *argv[])
 {
-       daemon(0, 0);
-       while (1) {
-               sleep(1);
-       }
+       printf("hello world\n");
+
+       char *p = NULL;
+       *p = 1;
        return 0;
 }

diff --git a/meta-skeleton/recipes-skeleton/service/service_0.1.bb b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
index c5cd7a9..c4b43f0 100644
--- a/meta-skeleton/recipes-skeleton/service/service_0.1.bb
+++ b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
@@ -3,29 +3,16 @@ SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYRIGHT;md5=349c872e0066155e1818b786938876a4"
 
-SRC_URI = "file://skeleton \
-          file://skeleton_test.c \
+SRC_URI = "file://skeleton_test.c \
           file://COPYRIGHT \
           "
 
 do_compile () {
-       ${CC} ${WORKDIR}/skeleton_test.c -o ${WORKDIR}/skeleton-test
+       ${CC} ${WORKDIR}/skeleton_test.c ${DEBUG_FLAGS}  -o ${WORKDIR}/skeleton-test
 }
 
 do_install () {
-       install -d ${D}${sysconfdir}/init.d
-       cat ${WORKDIR}/skeleton | \
-         sed -e 's,/etc,${sysconfdir},g' \
-             -e 's,/usr/sbin,${sbindir},g' \
-             -e 's,/var,${localstatedir},g' \
-             -e 's,/usr/bin,${bindir},g' \
-             -e 's,/usr,${prefix},g' > ${D}${sysconfdir}/init.d/skeleton
-       chmod a+x ${D}${sysconfdir}/init.d/skeleton
-
        install -d ${D}${sbindir}
        install -m 0755 ${WORKDIR}/skeleton-test ${D}${sbindir}/
 }
 
-RDEPENDS_${PN} = "initscripts"
-
-CONFFILES_${PN} += "${sysconfdir}/init.d/skeleton"

2. Install service, gdb and *-dbg to core-image-minimal

vim local.conf
...
IMAGE_INSTALL_append = " service gdb"
EXTRA_IMAGE_FEATURES_append = " dbg-pkgs"
...

vim conf/bblayers.conf
...
BBLAYERS ?= " \ 
  /buildarea/raid0/hjia/poky/meta \
  /buildarea/raid0/hjia/poky/meta-poky \
  /buildarea/raid0/hjia/poky/meta-skeleton \
  /buildarea/raid0/hjia/poky/meta-yocto-bsp \
  "
...

bitbake core-image-minimal

3. Run qemu and invoke gdb to execute skeleton-test,
   while segment fault, the source printed correctly.

runqemu qemux86-64 slirp nographic
...
root@qemux86-64:~# gdb skeleton-test

(gdb) r
Starting program: /usr/sbin/skeleton-test 
hello world

Program received signal SIGSEGV, Segmentation fault.
0x000000000040056b in main (argc=1, argv=0x7fffffffed08) at /usr/src/debug/skeleton_test.c:8
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

...

//Hongxu

The following changes since commit 2f2f784727a1617c2b9ce0bb86730ba301238e06:

  parselogs: add new whitelist entries to address 4.4.3 issues (2016-03-22 08:54:34 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-buildpath
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-buildpath

Hongxu Jia (16):
  conf/bitbake.conf package.bbclass: fix dbg package not contain sources
    while -fdebug-prefix-map used
  kernel.bbclass: fix buildpath QA issue
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
 meta/classes/kernel.bbclass                        |  4 +-
 meta/classes/package.bbclass                       | 31 ++++++++---
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
 26 files changed, 442 insertions(+), 80 deletions(-)
 create mode 100644 meta/classes/fix_buildpaths.bbclass
 create mode 100644 meta/recipes-connectivity/openssl/openssl/remove-build-path-in-source-code.patch
 create mode 100644 meta/recipes-devtools/python/python-pycairo/strip-off-build-path-in-purported-filename.patch
 create mode 100644 meta/recipes-gnome/epiphany/files/use-relative-path-for-build-dir.patch
 create mode 100644 meta/recipes-kernel/dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch
 create mode 100644 meta/recipes-support/icu/icu/add-variable-U_CC-and-U_CXX.patch

-- 
1.9.1


