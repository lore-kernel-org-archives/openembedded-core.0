Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZsIR-0003rc-J1
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 23:55:04 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2011 14:48:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208,217";a="86045469"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.46])
	by orsmga002.jf.intel.com with ESMTP; 11 Dec 2011 14:48:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Dec 2011 14:47:53 -0800
Message-Id: <0dbe9368cda9aeb9c6cb90a034722221b7e71b3c.1323643434.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 26/26] eglibc: Generate cross testing script during install
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 11 Dec 2011 22:59:33 -0000

From: Khem Raj <raj.khem@gmail.com>

EGLIBC has long had cross testing capability, so use
that there are few steps needed on setting up the target
as well as the build host. This patch tries to generate
a script with all the needed environment on build host system

To use this script one needs to setup the target as described
in the testing intructions of eglibc and then this script
can directly interface to the target and run the tests from
eglibc's build directory. To run this script

bash <script> username@testing_hostname/ip

The output can be dumped into a log file for later viewing
and checked for "Error " to see the failed tests

Removes INC_PR its not used anywhere

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-common.inc  |    1 -
 meta/recipes-core/eglibc/eglibc-testing.inc |   47 +++++++++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc.inc         |    1 +
 meta/recipes-core/eglibc/eglibc_2.13.bb     |   11 +++---
 meta/recipes-core/eglibc/eglibc_2.14.bb     |   10 +++--
 5 files changed, 60 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-testing.inc

diff --git a/meta/recipes-core/eglibc/eglibc-common.inc b/meta/recipes-core/eglibc/eglibc-common.inc
index 4fa6488..d18786a 100644
--- a/meta/recipes-core/eglibc/eglibc-common.inc
+++ b/meta/recipes-core/eglibc/eglibc-common.inc
@@ -3,7 +3,6 @@ DESCRIPTION = "Embedded GLIBC (EGLIBC) is a variant of the GNU C Library (GLIBC)
 HOMEPAGE = "http://www.eglibc.org/home"
 SECTION = "libs"
 LICENSE = "GPLv2 & LGPLv2.1"
-INC_PR = "r11"
 LIC_FILES_CHKSUM ?= "file://LICENSES;md5=07a394b26e0902b9ffdec03765209770 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
diff --git a/meta/recipes-core/eglibc/eglibc-testing.inc b/meta/recipes-core/eglibc/eglibc-testing.inc
new file mode 100644
index 0000000..fb632ba
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-testing.inc
@@ -0,0 +1,47 @@
+do_compile_append () {
+	# now generate script to drive testing
+	echo "#!/usr/bin/env sh" >${B}/${HOST_PREFIX}testeglibc
+	set >> ${B}/${HOST_PREFIX}testeglibc
+	# prune out the unneeded vars
+	sed -i -e "/^BASH/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^USER/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^OPT/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^DIRSTACK/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^EUID/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^FUNCNAME/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^GROUPS/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^HOST/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^HOME/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^IFS/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^LC_ALL/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^LOGNAME/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^MACHTYPE/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^OSTYPE/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^PIPE/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^SHELL/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^'/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^UID/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^TERM/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^PATCH_GET/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^PKG_/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^POSIXLY_/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^PPID/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^PS4/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^Q/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^SHLVL/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^STAGING/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^LD_LIBRARY_PATH/d" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "/^PSEUDO/d" ${B}/${HOST_PREFIX}testeglibc
+	# append execution part script
+cat >> ${B}/${HOST_PREFIX}testeglibc << STOP
+target="\$1"
+if [ "x\$target" = "x" ]
+then
+	echo "Please specify the target machine and remote user in for of user@target"
+	exit 1;
+fi
+wrapper="${S}/scripts/cross-test-ssh.sh \$target"
+localedef="${STAGING_BINDIR_NATIVE}/cross-localedef --little-endian --uint32-align=4"
+make cross-localedef="\$localedef" cross-test-wrapper="\$wrapper" -k check
+STOP
+}
diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 272fcb6..64694a0 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -1,5 +1,6 @@
 require eglibc-common.inc
 require eglibc-ld.inc
+require eglibc-testing.inc
 
 STAGINGCC = "gcc-cross-intermediate"
 STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-intermediate"
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index 955c4ec..9d3ec85 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "15508"
 
 DEPENDS += "gperf-native"
-PR = "r18"
+PR = "r19"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
@@ -207,10 +207,11 @@ do_compile () {
 		done
 	)
 	echo "Adjust ldd script"
-	[ -z "${RTLDLIST}" ] && return
-	sed -i ${B}/elf/ldd -e 's#^\(RTLDLIST=\)"\(.*\)"$#\1\2#'
-	sed -i ${B}/elf/ldd -e 's#^\(RTLDLIST=\)\(.*\)$#\1"${RTLDLIST} \2"#'
-
+	if [ -n "${RTLDLIST}" ]
+	then
+		sed -i ${B}/elf/ldd -e 's#^\(RTLDLIST=\)"\(.*\)"$#\1\2#'
+		sed -i ${B}/elf/ldd -e 's#^\(RTLDLIST=\)\(.*\)$#\1"${RTLDLIST} \2"#'
+	fi
 }
 
 require eglibc-package.inc
diff --git a/meta/recipes-core/eglibc/eglibc_2.14.bb b/meta/recipes-core/eglibc/eglibc_2.14.bb
index fd384f4..8553106 100644
--- a/meta/recipes-core/eglibc/eglibc_2.14.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.14.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "15870"
 
 DEPENDS += "gperf-native"
-PR = "r1"
+PR = "r2"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_14"
@@ -209,9 +209,11 @@ do_compile () {
 		done
 	)
 	echo "Adjust ldd script"
-	[ -z "${RTLDLIST}" ] && return
-	sed -i ${B}/elf/ldd -e 's#^\(RTLDLIST=\)"\(.*\)"$#\1\2#'
-	sed -i ${B}/elf/ldd -e 's#^\(RTLDLIST=\)\(.*\)$#\1"${RTLDLIST} \2"#'
+	if [ -n "${RTLDLIST}" ]
+	then
+		sed -i ${B}/elf/ldd -e 's#^\(RTLDLIST=\)"\(.*\)"$#\1\2#'
+		sed -i ${B}/elf/ldd -e 's#^\(RTLDLIST=\)\(.*\)$#\1"${RTLDLIST} \2"#'
+	fi
 
 }
 
-- 
1.7.6.4



