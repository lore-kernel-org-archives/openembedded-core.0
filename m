Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RZ6GS-00071o-SC
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:37:49 +0100
Received: by mail-iy0-f175.google.com with SMTP id j38so4678110iad.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 11:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8NL4q0Bk9AuShUcQVv3Vgod7+kaMjDpjq0guwC9bzZ8=;
	b=I4q54PM8pRWBzh6Zq13GwkF5/C5CYeXq9FmOwf5h9OSUTUwRL68LOoWQGGwtybJVnb
	vebPwQDtpur77Ezr5o3jhz+2h4B68Lp2lo8+llx/RO4aomU9HtLPy9Vvq0kUcaJerTIO
	GFrB8dfVsoHf3c5shVBq4CiGF6+RdDVJcjqc4=
Received: by 10.43.131.196 with SMTP id hr4mr3549868icc.55.1323459059428;
	Fri, 09 Dec 2011 11:30:59 -0800 (PST)
Received: from localhost.localdomain (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id wo4sm19305554igc.5.2011.12.09.11.30.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 11:30:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2011 11:30:47 -0800
Message-Id: <a1f4521a3761c786e8c460943ac62c6f32bb4dbc.1323458858.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <66bfa997b04bc6dc4c77c5e87f38c86ac3f30d0a.1323458858.git.raj.khem@gmail.com>
References: <66bfa997b04bc6dc4c77c5e87f38c86ac3f30d0a.1323458858.git.raj.khem@gmail.com>
In-Reply-To: <cover.1323458858.git.raj.khem@gmail.com>
References: <cover.1323458858.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] eglibc: Generate cross testing script during install
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
X-List-Received-Date: Fri, 09 Dec 2011 19:37:49 -0000

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
 meta/recipes-core/eglibc/eglibc-package.inc |   46 +++++++++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
 meta/recipes-core/eglibc/eglibc_2.14.bb     |    2 +-
 4 files changed, 48 insertions(+), 3 deletions(-)

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
diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 020f558..df1924f 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -73,6 +73,52 @@ do_install_append () {
 	rm -f ${D}${sysconfdir}/localtime
 
 	oe_multilib_header bits/syscall.h
+
+	# now generate script to drive testing
+	echo "#!/usr/bin/env bash" >${B}/${HOST_PREFIX}testeglibc
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
 }
 
 do_install_locale () {
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index 955c4ec..ee16340 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "15508"
 
 DEPENDS += "gperf-native"
-PR = "r18"
+PR = "r19"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
diff --git a/meta/recipes-core/eglibc/eglibc_2.14.bb b/meta/recipes-core/eglibc/eglibc_2.14.bb
index fd384f4..e517cc2 100644
--- a/meta/recipes-core/eglibc/eglibc_2.14.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.14.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "15870"
 
 DEPENDS += "gperf-native"
-PR = "r1"
+PR = "r2"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_14"
-- 
1.7.5.4



