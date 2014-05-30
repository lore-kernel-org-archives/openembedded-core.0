Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6A0136FD9D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 12:33:10 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4UCX5mr006603 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 13:33:05 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tiBnX7Hh3LKk
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 13:33:05 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4UCX2Y7006590
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 13:33:04 +0100
Message-ID: <1401453174.31309.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 30 May 2014 13:32:54 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gcc: Clean up configure_prepend and fix for mingw
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
X-List-Received-Date: Fri, 30 May 2014 12:33:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The do_configure_prepend was duplicated in gcc-4.X.inc and
gcc-configure-common.inc leading to confusion when reading the resulting
do_configure task where the file was processed twice.

The only difference was the removal of the include line for gcc 4.8/4.9.

On mingw were were seeing two issues, firstly that the if statements meant
the values we wanted weren't being set, the second that the include
paths were still wrong as there was no header path set.

To fix the first issue, the #ifdef conditionals were removed, we want
to set these things unconditionally. The second issue is addressed by
setting the NATIVE_SYSTEM_HEADER_DIR variable here (it was already
set in t-oe).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index aa822cf..9f2928b 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -119,21 +119,4 @@ EXTRA_OECONF_PATHS = " \
                       --with-sysroot=${STAGING_DIR_TARGET} \ 
                       --with-build-sysroot=${STAGING_DIR_TARGET}"
 
-do_configure_prepend () {
-        # teach gcc to find correct target includedir when checking libc ssp support
-        mkdir -p ${B}/gcc
-        echo "NATIVE_SYSTEM_HEADER_DIR = ${SYSTEMHEADERS}" > ${B}/gcc/t-oe
-        cat ${S}/gcc/defaults.h | grep -v "\#endif.*GCC_DEFAULTS_H" > ${B}/gcc/defaults.h.new
-        cat >>${B}/gcc/defaults.h.new <<_EOF
-#ifndef STANDARD_STARTFILE_PREFIX_1
-#define STANDARD_STARTFILE_PREFIX_1 "${SYSTEMLIBS}"
-#endif
-#ifndef STANDARD_STARTFILE_PREFIX_2
-#define STANDARD_STARTFILE_PREFIX_2 "${SYSTEMLIBS1}"
-#endif
-#define SYSTEMLIBS_DIR "${SYSTEMLIBS}"
-#endif /* ! GCC_DEFAULTS_H */
-_EOF
-        mv ${B}/gcc/defaults.h.new ${B}/gcc/defaults.h
-}
 
diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index a409430..155be14 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -114,21 +114,4 @@ EXTRA_OECONF_PATHS = " \
                       --with-sysroot=${STAGING_DIR_TARGET} \ 
                       --with-build-sysroot=${STAGING_DIR_TARGET}"
 
-do_configure_prepend () {
-        # teach gcc to find correct target includedir when checking libc ssp support
-        mkdir -p ${B}/gcc
-        echo "NATIVE_SYSTEM_HEADER_DIR = ${SYSTEMHEADERS}" > ${B}/gcc/t-oe
-        cat ${S}/gcc/defaults.h | grep -v "\#endif.*GCC_DEFAULTS_H" > ${B}/gcc/defaults.h.new
-        cat >>${B}/gcc/defaults.h.new <<_EOF
-#ifndef STANDARD_STARTFILE_PREFIX_1
-#define STANDARD_STARTFILE_PREFIX_1 "${SYSTEMLIBS}"
-#endif
-#ifndef STANDARD_STARTFILE_PREFIX_2
-#define STANDARD_STARTFILE_PREFIX_2 "${SYSTEMLIBS1}"
-#endif
-#define SYSTEMLIBS_DIR "${SYSTEMLIBS}"
-#endif /* ! GCC_DEFAULTS_H */
-_EOF
-        mv ${B}/gcc/defaults.h.new ${B}/gcc/defaults.h
-}
 
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 31e3cc4..4a10554 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -78,15 +78,9 @@ do_configure_prepend () {
 	echo "NATIVE_SYSTEM_HEADER_DIR = ${SYSTEMHEADERS}" > ${B}/gcc/t-oe
 	cat ${S}/gcc/defaults.h | grep -v "\#endif.*GCC_DEFAULTS_H" > ${B}/gcc/defaults.h.new
 	cat >>${B}/gcc/defaults.h.new <<_EOF
-#ifndef STANDARD_INCLUDE_DIR
-#define STANDARD_INCLUDE_DIR "${SYSTEMHEADERS}"
-#endif
-#ifndef STANDARD_STARTFILE_PREFIX_1
+#define NATIVE_SYSTEM_HEADER_DIR "${SYSTEMHEADERS}"
 #define STANDARD_STARTFILE_PREFIX_1 "${SYSTEMLIBS}"
-#endif
-#ifndef STANDARD_STARTFILE_PREFIX_2
 #define STANDARD_STARTFILE_PREFIX_2 "${SYSTEMLIBS1}"
-#endif
 #define SYSTEMLIBS_DIR "${SYSTEMLIBS}"
 #endif /* ! GCC_DEFAULTS_H */
 _EOF



