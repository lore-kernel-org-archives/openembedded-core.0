Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TinK6-0007GF-67
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 15:30:14 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 12 Dec 2012 06:15:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,266,1355126400"; d="scan'208";a="179929219"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.189])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Dec 2012 06:15:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2012 14:15:25 +0000
Message-Id: <1355321725-18167-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] eglibc: remove dependency of eglibc-utils on bash
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Dec 2012 14:30:14 -0000

Adapt a patch from Peter Seebach <peter.seebach@windriver.com> to remove
the non-POSIX elements from the tzselect script, and add a separate
patch to work around a bug in the current version of busybox's awk
command. This replaces the /bin/bash reference in the script header with
/bin/sh and thus eliminates the dependency on bash picked up during
packaging.

Fixes [YOCTO #3551].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../eglibc/eglibc-2.16/tzselect-awk.patch          |   42 +++++
 .../eglibc/eglibc-2.16/tzselect-sh.patch           |  160 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    4 +-
 3 files changed, 205 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/tzselect-awk.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/tzselect-sh.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.16/tzselect-awk.patch b/meta/recipes-core/eglibc/eglibc-2.16/tzselect-awk.patch
new file mode 100644
index 0000000..dc9949b
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/tzselect-awk.patch
@@ -0,0 +1,42 @@
+tzselect: workaround bug in busybox awk
+
+busybox's version of awk in version 1.20.2 and lower doesn't support
+escape sequences in conjunction with the -F option. Use -v FS= instead
+as a workaround until the bug is fixed.
+
+Reference:
+https://bugs.busybox.net/show_bug.cgi?id=5126
+
+Upstream-Status: Inappropriate [other]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+--- libc/timezone/tzselect.ksh
++++ libc/timezone/tzselect.ksh
+@@ -208,7 +208,7 @@ while
+ 		TZ_for_date=$TZ;;
+ 	*)
+ 		# Get list of names of countries in the continent or ocean.
+-		countries=$($AWK -F'\t' \
++		countries=$($AWK -v FS="\t" \
+ 			-v continent="$continent" \
+ 			-v TZ_COUNTRY_TABLE="$TZ_COUNTRY_TABLE" \
+ 		'
+@@ -252,7 +252,7 @@ while
+ 
+ 
+ 		# Get list of names of time zone rule regions in the country.
+-		regions=$($AWK -F'\t' \
++		regions=$($AWK -v FS="\t" \
+ 			-v country="$country" \
+ 			-v TZ_COUNTRY_TABLE="$TZ_COUNTRY_TABLE" \
+ 		'
+@@ -289,7 +289,7 @@ while
+ 		esac
+ 
+ 		# Determine TZ from country and region.
+-		TZ=$($AWK -F'\t' \
++		TZ=$($AWK -v FS="\t" \
+ 			-v country="$country" \
+ 			-v region="$region" \
+ 			-v TZ_COUNTRY_TABLE="$TZ_COUNTRY_TABLE" \
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/tzselect-sh.patch b/meta/recipes-core/eglibc/eglibc-2.16/tzselect-sh.patch
new file mode 100644
index 0000000..c173ae2
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/tzselect-sh.patch
@@ -0,0 +1,160 @@
+tzselect: eliminate ksh-dependency
+
+This is an adapted version of a patch originally
+by Peter Seebach <peter.seebach@windriver.com> found here:
+http://www.eglibc.org/archives/patches/msg00671.html
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+--- libc/timezone/tzselect.ksh
++++ libc/timezone/tzselect.ksh
+@@ -1,6 +1,6 @@
+-#! @KSH@
++#!/bin/sh
+ 
+-VERSION='@(#)tzselect.ksh	8.2'
++VERSION='@(#)tzselect.sh	8.2'
+ PKGVERSION='@PKGVERSION@'
+ REPORT_BUGS_TO='@REPORT_BUGS_TO@'
+ 
+@@ -11,19 +11,10 @@ REPORT_BUGS_TO='@REPORT_BUGS_TO@'
+ 
+ # Porting notes:
+ #
+-# This script requires several features of the Korn shell.
+-# If your host lacks the Korn shell,
+-# you can use either of the following free programs instead:
++# func_select allows this script to run on shells (such as busybox ash)
++# which lack the ksh "select" builtin.
+ #
+-#	<a href=ftp://ftp.gnu.org/pub/gnu/>
+-#	Bourne-Again shell (bash)
+-#	</a>
+-#
+-#	<a href=ftp://ftp.cs.mun.ca/pub/pdksh/pdksh.tar.gz>
+-#	Public domain ksh
+-#	</a>
+-#
+-# This script also uses several features of modern awk programs.
++# This script uses several features of modern awk programs.
+ # If your host lacks awk, or has an old awk that does not conform to Posix.2,
+ # you can use either of the following free programs instead:
+ #
+@@ -35,6 +26,70 @@ REPORT_BUGS_TO='@REPORT_BUGS_TO@'
+ #	mawk
+ #	</a>
+ 
++# Implement ksh-style select in POSIX shell
++
++# We need a mostly-portable echo-n.
++case `echo -n "foo\c"` in
++*n*c*)  func_echo_n() { echo "$*"; } ;;
++*n*)    func_echo_n() { echo "$*\c"; } ;;
++*)      func_echo_n() { echo -n "$*"; } ;;
++esac
++
++# Synopsis: Replace "select foo in list" with "while func_select foo in list"
++# and this works just like ksh, so far as I know.
++func_select () {
++	func_select_args=0
++	if expr "$1" : "[_a-zA-Z][_a-zA-Z0-9]*$" > /dev/null; then
++		func_select_var=$1
++	else
++		echo >&2 "func_select: '$1' is not a valid variable name."
++		return 1
++	fi
++	shift 1
++	case $1 in
++		in) shift 1;;
++ *) echo >&2 "func_select: usage: func_select var in ... (you must provide
++arguments)"; return 1;;
++	esac
++	case $# in
++		0) echo >&2 "func_select: usage: func_select var in ..."; return 1;;
++	esac
++	for func_select_arg
++	do
++		func_select_args=`expr $func_select_args + 1`
++		eval func_select_a_$func_select_args=\$func_select_arg
++	done
++	REPLY=""
++	while :
++	do
++		if test -z "$REPLY"; then
++			func_select_i=1
++			while test $func_select_i -le $func_select_args
++			do
++				eval echo "\"\$func_select_i) \$func_select_a_$func_select_i\""
++				func_select_i=`expr $func_select_i + 1`
++			done
++		fi
++		func_echo_n "${PS3-#? }" >&2
++		if read REPLY; then
++			if test -n "${REPLY}"; then
++				if expr "$REPLY" : '[1-9][0-9]*$' > /dev/null; then
++					if test "$REPLY" -ge 1 && test "$REPLY" -le $func_select_args; then
++						eval $func_select_var=\$func_select_a_$REPLY
++					else
++						eval $func_select_var=
++					fi
++				else
++					eval $func_select_var=
++				fi
++				return 0
++			fi
++		else
++			eval $func_select_var=
++			return 1
++		fi
++	done
++}
+ 
+ # Specify default values for environment variables if they are unset.
+ : ${AWK=awk}
+@@ -80,7 +135,7 @@ IFS=$newline
+ 
+ 
+ # Work around a bug in bash 1.14.7 and earlier, where $PS3 is sent to stdout.
+-case $(echo 1 | (select x in x; do break; done) 2>/dev/null) in
++case $(echo 1 | (while func_select x in x; do break; done) 2>/dev/null) in
+ ?*) PS3=
+ esac
+ 
+@@ -100,7 +155,7 @@ while
+ 
+ 	echo >&2 'Please select a continent or ocean.'
+ 
+-	select continent in \
++	while func_select continent in \
+ 	    Africa \
+ 	    Americas \
+ 	    Antarctica \
+@@ -180,7 +235,7 @@ while
+ 		case $countries in
+ 		*"$newline"*)
+ 			echo >&2 'Please select a country.'
+-			select country in $countries
++			while func_select country in $countries
+ 			do
+ 			    case $country in
+ 			    '') echo >&2 'Please enter a number in range.';;
+@@ -219,7 +274,7 @@ while
+ 		*"$newline"*)
+ 			echo >&2 'Please select one of the following' \
+ 				'time zone regions.'
+-			select region in $regions
++			while func_select region in $regions
+ 			do
+ 				case $region in
+ 				'') echo >&2 'Please enter a number in range.';;
+@@ -296,7 +351,7 @@ Universal Time is now:	$UTdate."
+ 	echo >&2 "Is the above information OK?"
+ 
+ 	ok=
+-	select ok in Yes No
++	while func_select ok in Yes No
+ 	do
+ 	    case $ok in
+ 	    '') echo >&2 'Please enter 1 for Yes, or 2 for No.';;
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index aa9256c..d676b09 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -1,7 +1,7 @@
 require eglibc.inc
 
 DEPENDS += "gperf-native kconfig-frontends-native"
-PR = "r17"
+PR = "r18"
 
 SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr21224.tar.bz2 \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
@@ -27,6 +27,8 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr21
            file://0001-Add-name_to_handle_at-open_by_handle-etc.-to-PowerPC.patch \
            file://fsl-ppc-no-fsqrt.patch \
            file://0001-R_ARM_TLS_DTPOFF32.patch \
+           file://tzselect-sh.patch \
+           file://tzselect-awk.patch \
           "
 
 SRC_URI[md5sum] = "88894fa6e10e58e85fbd8134b8e486a8"
-- 
1.7.10.4



