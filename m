Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 244BB6FE5C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 05:53:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6H5rObi003919
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Jul 2014 22:53:24 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 16 Jul 2014 22:53:24 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jul 2014 13:53:10 +0800
Message-ID: <68c1591a93ebcb982a24424b021b7218aefad269.1405575611.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1405575611.git.hongxu.jia@windriver.com>
References: <cover.1405575611.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/2] eglibc: rewritten tzselect as posix sh and move it to tzcode package
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
X-List-Received-Date: Thu, 17 Jul 2014 05:53:26 -0000
Content-Type: text/plain

The problem is that this would cause bash installed to meta-toolchain,
the dependencies chain is:
meta-toolchain -> eglibc-utils -> bash
We should eliminate bash dependencies in anything core to a tiny system.

The eglibc-utils also provides eglibc-utils/usr/bin/zdump,
eglibc-utils/usr/bin/zic which all of them belonged to tzcode, so we
should split these three utils as tzcode package.

[YOCTO #6544]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../timezone-re-written-tzselect-as-posix-sh.patch | 40 ++++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc-package.inc        |  6 ++--
 meta/recipes-core/eglibc/eglibc_2.19.bb            |  1 +
 3 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.19/timezone-re-written-tzselect-as-posix-sh.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.19/timezone-re-written-tzselect-as-posix-sh.patch b/meta/recipes-core/eglibc/eglibc-2.19/timezone-re-written-tzselect-as-posix-sh.patch
new file mode 100644
index 0000000..1477ea2
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.19/timezone-re-written-tzselect-as-posix-sh.patch
@@ -0,0 +1,40 @@
+timezone: re-written tzselect as posix sh
+
+To avoid the bash dependency.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ timezone/Makefile     | 2 +-
+ timezone/tzselect.ksh | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/timezone/Makefile b/timezone/Makefile
+--- a/timezone/Makefile
++++ b/timezone/Makefile
+@@ -113,7 +113,7 @@ $(testdata)/Asia/Tokyo: asia $(zic-deps)
+ 
+ 
+ $(objpfx)tzselect: tzselect.ksh $(common-objpfx)config.make
+-	sed -e 's|/bin/bash|$(KSH)|g' \
++	sed -e 's|/bin/bash|/bin/sh|g' \
+ 	    -e '/TZDIR=/s|\$$(pwd)|$(zonedir)|' \
+ 	    -e '/TZVERSION=/s|see_Makefile|"$(version)"|' \
+ 	    -e '/PKGVERSION=/s|=.*|="$(PKGVERSION)"|' \
+diff --git a/timezone/tzselect.ksh b/timezone/tzselect.ksh
+index 9d70691..25f45a8 100644
+--- a/timezone/tzselect.ksh
++++ b/timezone/tzselect.ksh
+@@ -35,7 +35,7 @@ REPORT_BUGS_TO=tz@iana.org
+ 
+ # Specify default values for environment variables if they are unset.
+ : ${AWK=awk}
+-: ${TZDIR=`pwd`}
++: ${TZDIR=$(pwd)}
+ 
+ # Check for awk Posix compliance.
+ ($AWK -v x=y 'BEGIN { exit 123 }') </dev/null >/dev/null 2>&1
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index d5d407f..c357a13 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -17,7 +17,7 @@ python __anonymous () {
 # Set this to zero if you don't want ldconfig in the output package
 USE_LDCONFIG ?= "1"
 
-PACKAGES = "${PN}-dbg catchsegv sln nscd ldd ${PN}-utils eglibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN} eglibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
+PACKAGES = "${PN}-dbg catchsegv sln nscd ldd tzcode ${PN}-utils eglibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN} eglibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
 
 # The ld.so in this eglibc supports the GNU_HASH
 RPROVIDES_${PN} = "glibc rtld(GNU_HASH)"
@@ -47,6 +47,7 @@ FILES_${PN}-dev += "${bindir}/rpcgen ${libdir}/*_nonshared.a ${base_libdir}/*_no
 FILES_${PN}-staticdev += "${libdir}/*.a ${base_libdir}/*.a"
 FILES_nscd = "${sbindir}/nscd*"
 FILES_${PN}-mtrace = "${bindir}/mtrace"
+FILES_tzcode = "${bindir}/tzselect ${sbindir}/zic ${sbindir}/zdump"
 FILES_${PN}-utils = "${bindir}/* ${sbindir}/*"
 FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/audit/.debug"
 FILES_catchsegv = "${bindir}/catchsegv"
@@ -65,8 +66,9 @@ DESCRIPTION_eglibc-extra-nss = "eglibc: nis, nisplus and hesiod search services.
 SUMMARY_ldd = "print shared library dependencies"
 DESCRIPTION_ldd = "${bindir}/ldd prints shared library dependencies for each program or shared library specified on the command line."
 SUMMARY_${PN}-utils = "Miscellaneous utilities provided by eglibc"
-DESCRIPTION_${PN}-utils = "Miscellaneous utilities including getconf, iconf, locale, gencat, tzselect, zic, rpcinfo, ..."
+DESCRIPTION_${PN}-utils = "Miscellaneous utilities including getconf, iconf, locale, gencat, rpcinfo, ..."
 DESCRIPTION_libsotruss = "Library to support sotruss which traces calls through PLTs"
+DESCRIPTION_tzcode = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
 
 inherit libc-common multilib_header
 
diff --git a/meta/recipes-core/eglibc/eglibc_2.19.bb b/meta/recipes-core/eglibc/eglibc_2.19.bb
index 2d354cb..19bd52d 100644
--- a/meta/recipes-core/eglibc/eglibc_2.19.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.19.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr25
            file://ppce6500-32b_slow_ieee754_sqrt.patch \
            file://grok_gold.patch \
            file://fix_am_rootsbindir.patch;striplevel=2 \
+           file://timezone-re-written-tzselect-as-posix-sh.patch \
           "
 SRC_URI[md5sum] = "197836c2ba42fb146e971222647198dd"
 SRC_URI[sha256sum] = "baaa030531fc308f7820c46acdf8e1b2f8e3c1f40bcd28b6e440d1c95d170d4c"
-- 
1.8.1.2


