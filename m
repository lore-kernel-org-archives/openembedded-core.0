Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTTbL-0005m5-9K
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 08:47:52 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jun 2011 23:44:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,325,1304319600"; 
   d="scan'208";a="7609007"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.187])
	by azsmga001.ch.intel.com with ESMTP; 05 Jun 2011 23:44:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Jun 2011 23:44:17 -0700
Message-Id: <e4f3339779161666ab3cd3328811ee08b8a7840b.1307342214.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [CONSOLIDATED PULL 13/20] shadow: recipe and patch cleanup
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
X-List-Received-Date: Mon, 06 Jun 2011 06:47:52 -0000

From: Scott Garman <scott.a.garman@intel.com>

Taking over maintenance of the shadow recipe. Cleaning it up in
preparation of adding a -native version that will be used to add
users/groups during preinstall.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../files/shadow-4.1.3-dots-in-usernames.patch     |    4 +
 .../shadow-4.1.4.2-env-reset-keep-locale.patch     |    4 +
 .../files/shadow-4.1.4.2-groupmod-pam-check.patch  |    4 +
 .../files/shadow-4.1.4.2-su_no_sanitize_env.patch  |    4 +
 .../shadow/files/shadow.automake-1.11.patch        |    4 +
 meta/recipes-extended/shadow/shadow.inc            |  123 -----------------
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |  139 ++++++++++++++++++-
 7 files changed, 151 insertions(+), 131 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/shadow.inc

diff --git a/meta/recipes-extended/shadow/files/shadow-4.1.3-dots-in-usernames.patch b/meta/recipes-extended/shadow/files/shadow-4.1.3-dots-in-usernames.patch
index 7a2ff2e..a7bb0a9 100644
--- a/meta/recipes-extended/shadow/files/shadow-4.1.3-dots-in-usernames.patch
+++ b/meta/recipes-extended/shadow/files/shadow-4.1.3-dots-in-usernames.patch
@@ -9,6 +9,10 @@
 #
 # comment added by Kevin Tian <kevin.tian@intel.com>, 2010-08-11
 
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 Index: shadow-4.1.4.2/libmisc/chkname.c
 ===================================================================
 --- shadow-4.1.4.2.orig/libmisc/chkname.c	2009-04-28 12:14:04.000000000 -0700
diff --git a/meta/recipes-extended/shadow/files/shadow-4.1.4.2-env-reset-keep-locale.patch b/meta/recipes-extended/shadow/files/shadow-4.1.4.2-env-reset-keep-locale.patch
index 124065c..6514746 100644
--- a/meta/recipes-extended/shadow/files/shadow-4.1.4.2-env-reset-keep-locale.patch
+++ b/meta/recipes-extended/shadow/files/shadow-4.1.4.2-env-reset-keep-locale.patch
@@ -12,6 +12,10 @@
 http://bugs.gentoo.org/283725
 https://alioth.debian.org/tracker/index.php?func=detail&aid=311740&group_id=30580&atid=411480
 
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 Index: shadow-4.1.4.2/libmisc/env.c
 ===================================================================
 --- shadow-4.1.4.2.orig/libmisc/env.c	2009-04-27 13:07:56.000000000 -0700
diff --git a/meta/recipes-extended/shadow/files/shadow-4.1.4.2-groupmod-pam-check.patch b/meta/recipes-extended/shadow/files/shadow-4.1.4.2-groupmod-pam-check.patch
index 6682fe8..640200b 100644
--- a/meta/recipes-extended/shadow/files/shadow-4.1.4.2-groupmod-pam-check.patch
+++ b/meta/recipes-extended/shadow/files/shadow-4.1.4.2-groupmod-pam-check.patch
@@ -17,6 +17,10 @@ http://lists.alioth.debian.org/pipermail/pkg-shadow-devel/2009-November/007850.h
 	* NEWS, src/groupmod.c: Fixed groupmod when configured with
 	--enable-account-tools-setuid.
 
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 Index: shadow-4.1.4.2/src/groupmod.c
 ===================================================================
 --- shadow-4.1.4.2.orig/src/groupmod.c	2009-06-05 15:16:58.000000000 -0700
diff --git a/meta/recipes-extended/shadow/files/shadow-4.1.4.2-su_no_sanitize_env.patch b/meta/recipes-extended/shadow/files/shadow-4.1.4.2-su_no_sanitize_env.patch
index f67251c..0dc4d75 100644
--- a/meta/recipes-extended/shadow/files/shadow-4.1.4.2-su_no_sanitize_env.patch
+++ b/meta/recipes-extended/shadow/files/shadow-4.1.4.2-su_no_sanitize_env.patch
@@ -12,6 +12,10 @@
 http://bugs.gentoo.org/show_bug.cgi?id=301957
 https://alioth.debian.org/scm/browser.php?group_id=30580
 
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 Index: shadow-4.1.4.2/src/su.c
 ===================================================================
 --- shadow-4.1.4.2.orig/src/su.c	2009-07-23 13:38:56.000000000 -0700
diff --git a/meta/recipes-extended/shadow/files/shadow.automake-1.11.patch b/meta/recipes-extended/shadow/files/shadow.automake-1.11.patch
index 36d7be6..a793f09 100644
--- a/meta/recipes-extended/shadow/files/shadow.automake-1.11.patch
+++ b/meta/recipes-extended/shadow/files/shadow.automake-1.11.patch
@@ -11,6 +11,10 @@
 
 man_nopan is for !USE_PAM already included in man_MANS and automake-1.11 hates to install some file twice
 
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 diff -uNr shadow-4.1.4.2.orig/man/Makefile.am shadow-4.1.4.2/man/Makefile.am
 --- shadow-4.1.4.2.orig/man/Makefile.am	2009-03-14 15:40:10.000000000 +0100
 +++ shadow-4.1.4.2/man/Makefile.am	2010-04-02 07:31:17.000000000 +0200
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
deleted file mode 100644
index 35bd6a8..0000000
--- a/meta/recipes-extended/shadow/shadow.inc
+++ /dev/null
@@ -1,123 +0,0 @@
-DESCRIPTION = "Tools to change and administer password and group data."
-HOMEPAGE = "http://pkg-shadow.alioth.debian.org/"
-BUGTRACKER = "https://alioth.debian.org/tracker/?group_id=30580"
-SECTION = "base utils"
-LICENSE = "BSD | Artistic"
-LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
-                    file://src/passwd.c;firstline=8;endline=30;md5=2899a045e90511d0e043b85a7db7e2fe"
-
-PR = "r1"
-
-PAM_PLUGINS = "  libpam-runtime \
-                 pam-plugin-faildelay \
-                 pam-plugin-securetty \
-                 pam-plugin-nologin \
-                 pam-plugin-env \
-                 pam-plugin-group \
-                 pam-plugin-limits \
-                 pam-plugin-lastlog \
-                 pam-plugin-motd \
-                 pam-plugin-mail \
-                 pam-plugin-shells \
-                 pam-plugin-rootok"
-                 
-DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)}"
-
-# since we deduce from ${SERIAL_CONSOLE}
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-# Additional Policy files for PAM
-PAM_SRC_URI = "file://pam.d/chfn \
-               file://pam.d/chpasswd \
-               file://pam.d/chsh \
-               file://pam.d/login \
-               file://pam.d/newusers \
-               file://pam.d/passwd \
-               file://pam.d/su"
-
-SRC_URI = "ftp://pkg-shadow.alioth.debian.org/pub/pkg-shadow/shadow-${PV}.tar.bz2 \
-           file://login_defs_pam.sed \
-           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
-           file://securetty"
-
-inherit autotools gettext
-
-EXTRA_OECONF += "--without-audit \
-                 --without-libcrack \
-                 ${@base_contains('DISTRO_FEATURES', 'pam', '--with-libpam', '--without-libpam', d)} \
-                 --without-selinux"
-
-do_install_append() {
-	# Ensure that the image has as /var/spool/mail dir so shadow can put mailboxes there if the user
-	# reconfigures Shadow to default (see sed below).
-	install -d ${D}${localstatedir}/spool/mail
-
-	if [ -e ${WORKDIR}/pam.d ]; then
-		install -d ${D}${sysconfdir}/pam.d/
-		install -m 0644 ${WORKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
-		# Remove defaults that are not used when supporting PAM
-		sed -i -f ${WORKDIR}/login_defs_pam.sed ${D}${sysconfdir}/login.defs
-	fi
-
-	# Enable CREATE_HOME by default.
-	sed -i 's/#CREATE_HOME/CREATE_HOME/g' ${D}${sysconfdir}/login.defs
-
-	# As we are on an embedded system ensure the users mailbox is in ~/ not
-	# /var/spool/mail by default as who knows where or how big /var is.
-	# The system MDA will set this later anyway.
-	sed -i 's/MAIL_DIR/#MAIL_DIR/g' ${D}${sysconfdir}/login.defs
-	sed -i 's/#MAIL_FILE/MAIL_FILE/g' ${D}${sysconfdir}/login.defs
-
-	# disable checking emails at all
-	sed -i 's/MAIL_CHECK_ENAB/#MAIL_CHECK_ENAB/g' ${D}${sysconfdir}/login.defs
-
-	# now we don't have a mail system. disable mail creation for now
-	sed -i 's:/bin/bash:/bin/sh:g' ${D}${sysconfdir}/default/useradd
-	sed -i '/^CREATE_MAIL_SPOOL/ s:^:#:' ${D}${sysconfdir}/default/useradd
-
-	install -d ${D}${sbindir} ${D}${base_sbindir} ${D}${base_bindir} 
-	for i in passwd chfn newgrp chsh ; do
-		mv ${D}${bindir}/$i ${D}${bindir}/$i.${PN}
-	done
-
-	mv ${D}${sbindir}/chpasswd ${D}${sbindir}/chpasswd.${PN}
-	mv ${D}${sbindir}/vigr ${D}${base_sbindir}/vigr.${PN}
-	mv ${D}${sbindir}/vipw ${D}${base_sbindir}/vipw.${PN}
-	mv ${D}${bindir}/login ${D}${base_bindir}/login.${PN}
-
-	# Ensure we add a suitable securetty file to the package that has most common embedded TTYs defined.
-	if [ ! -z "${SERIAL_CONSOLE}" ]; then
-	# our SERIAL_CONSOLE contains baud rate too and sometime -L option as well.
-	# the following pearl :) takes that and converts it into newline sepated tty's and appends
-	# them into securetty. So if a machine has a weird looking console device node (e.g. ttyAMA0) that securetty
-	# does not know then it will get appended to securetty and root login will be allowed on
-	# that console.
-		echo "${SERIAL_CONSOLE}" | sed -e 's/[0-9][0-9]\|\-L//g'|tr "[ ]" "[\n]"  >> ${WORKDIR}/securetty
-	fi
-	install -m 0400 ${WORKDIR}/securetty ${D}${sysconfdir}/securetty 
-}
-
-pkg_postinst_${PN} () {
-	update-alternatives --install ${bindir}/passwd passwd passwd.${PN} 200
-	update-alternatives --install ${sbindir}/chpasswd chpasswd chpasswd.${PN} 200
-	update-alternatives --install ${bindir}/chfn chfn chfn.${PN} 200
-	update-alternatives --install ${bindir}/newgrp newgrp newgrp.${PN} 200
-	update-alternatives --install ${bindir}/chsh chsh chsh.${PN} 200
-	update-alternatives --install ${base_bindir}/login login login.${PN} 200
-	update-alternatives --install ${base_sbindir}/vipw vipw vipw.${PN} 200
-	update-alternatives --install ${base_sbindir}/vigr vigr vigr.${PN} 200
-
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi  
-
-	pwconv
-	grpconv
-}
-
-pkg_prerm_${PN} () {
-	for i in passwd chpasswd chfn newgrp chsh login vipw vigr ; do
-		update-alternatives --remove $i $i.${PN}
-	done
-}
diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index c8aa223..930ef3d 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -1,14 +1,137 @@
-require shadow.inc
+SUMMARY = "Tools to change and administer password and group data"
+DESCRIPTION = "Tools to change and administer password and group data"
+HOMEPAGE = "http://pkg-shadow.alioth.debian.org"
+BUGTRACKER = "https://alioth.debian.org/tracker/?group_id=30580"
+SECTION = "base utils"
+PRIORITY = "optional"
+LICENSE = "BSD | Artistic"
+LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
+                    file://src/passwd.c;firstline=8;endline=30;md5=2899a045e90511d0e043b85a7db7e2fe"
 
-PR = "r1"
+DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)}"
+PR = "r2"
 
-SRC_URI += "file://shadow.automake-1.11.patch \
-	    file://shadow-4.1.3-dots-in-usernames.patch \
-	    file://shadow-4.1.4.2-env-reset-keep-locale.patch \
-	    file://shadow-4.1.4.2-groupmod-pam-check.patch \
-	    file://shadow-4.1.4.2-su_no_sanitize_env.patch"
+SRC_URI = "ftp://pkg-shadow.alioth.debian.org/pub/pkg-shadow/shadow-${PV}.tar.bz2 \
+           file://login_defs_pam.sed \
+           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+           file://securetty \
+           file://shadow.automake-1.11.patch \
+           file://shadow-4.1.3-dots-in-usernames.patch \
+           file://shadow-4.1.4.2-env-reset-keep-locale.patch \
+           file://shadow-4.1.4.2-groupmod-pam-check.patch \
+           file://shadow-4.1.4.2-su_no_sanitize_env.patch"
 
 SRC_URI[md5sum] = "b8608d8294ac88974f27b20f991c0e79"
 SRC_URI[sha256sum] = "633f5bb4ea0c88c55f3642c97f9d25cbef74f82e0b4cf8d54e7ad6f9f9caa778"
 
-EXTRA_OECONF_libc-uclibc += " --with-nscd=no "
+inherit autotools gettext
+
+# Since we deduce our arch from ${SERIAL_CONSOLE}
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+EXTRA_OECONF += "--without-audit \
+                 --without-libcrack \
+                 ${@base_contains('DISTRO_FEATURES', 'pam', '--with-libpam', '--without-libpam', d)} \
+                 --without-selinux"
+EXTRA_OECONF_libc-uclibc += "--with-nscd=no"
+
+PAM_PLUGINS = "libpam-runtime \
+               pam-plugin-faildelay \
+               pam-plugin-securetty \
+               pam-plugin-nologin \
+               pam-plugin-env \
+               pam-plugin-group \
+               pam-plugin-limits \
+               pam-plugin-lastlog \
+               pam-plugin-motd \
+               pam-plugin-mail \
+               pam-plugin-shells \
+               pam-plugin-rootok"
+
+# Additional Policy files for PAM
+PAM_SRC_URI = "file://pam.d/chfn \
+               file://pam.d/chpasswd \
+               file://pam.d/chsh \
+               file://pam.d/login \
+               file://pam.d/newusers \
+               file://pam.d/passwd \
+               file://pam.d/su"
+
+do_install_append() {
+	# Ensure that the image has as a /var/spool/mail dir so shadow can
+	# put mailboxes there if the user reconfigures shadow to its
+	# defaults (see sed below).
+	install -d ${D}${localstatedir}/spool/mail
+
+	if [ -e ${WORKDIR}/pam.d ]; then
+		install -d ${D}${sysconfdir}/pam.d/
+		install -m 0644 ${WORKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/
+		# Remove defaults that are not used when supporting PAM.
+		sed -i -f ${WORKDIR}/login_defs_pam.sed ${D}${sysconfdir}/login.defs
+	fi
+
+	# Enable CREATE_HOME by default.
+	sed -i 's/#CREATE_HOME/CREATE_HOME/g' ${D}${sysconfdir}/login.defs
+
+	# As we are on an embedded system, ensure the users mailbox is in
+	# ~/ not /var/spool/mail by default, as who knows where or how big
+	# /var is. The system MDA will set this later anyway.
+	sed -i 's/MAIL_DIR/#MAIL_DIR/g' ${D}${sysconfdir}/login.defs
+	sed -i 's/#MAIL_FILE/MAIL_FILE/g' ${D}${sysconfdir}/login.defs
+
+	# Disable checking emails.
+	sed -i 's/MAIL_CHECK_ENAB/#MAIL_CHECK_ENAB/g' ${D}${sysconfdir}/login.defs
+
+	# Now we don't have a mail system. Disable mail creation for now.
+	sed -i 's:/bin/bash:/bin/sh:g' ${D}${sysconfdir}/default/useradd
+	sed -i '/^CREATE_MAIL_SPOOL/ s:^:#:' ${D}${sysconfdir}/default/useradd
+
+	install -d ${D}${sbindir} ${D}${base_sbindir} ${D}${base_bindir} 
+	for i in passwd chfn newgrp chsh ; do
+		mv ${D}${bindir}/$i ${D}${bindir}/$i.${PN}
+	done
+
+	mv ${D}${sbindir}/chpasswd ${D}${sbindir}/chpasswd.${PN}
+	mv ${D}${sbindir}/vigr ${D}${base_sbindir}/vigr.${PN}
+	mv ${D}${sbindir}/vipw ${D}${base_sbindir}/vipw.${PN}
+	mv ${D}${bindir}/login ${D}${base_bindir}/login.${PN}
+
+	# Ensure we add a suitable securetty file to the package that has
+	# most common embedded TTYs defined.
+	if [ ! -z "${SERIAL_CONSOLE}" ]; then
+		# Our SERIAL_CONSOLE contains a baud rate and sometimes a -L
+		# option as well. The following pearl :) takes that and converts
+		# it into newline-separated tty's and appends them into
+		# securetty. So if a machine has a weird looking console device
+		# node (e.g. ttyAMA0) that securetty does not know, it will get
+		# appended to securetty and root logins will be allowed on that
+		# console.
+		echo "${SERIAL_CONSOLE}" | sed -e 's/[0-9][0-9]\|\-L//g'|tr "[ ]" "[\n]"  >> ${WORKDIR}/securetty
+	fi
+	install -m 0400 ${WORKDIR}/securetty ${D}${sysconfdir}/securetty 
+}
+
+pkg_postinst_${PN} () {
+	update-alternatives --install ${bindir}/passwd passwd passwd.${PN} 200
+	update-alternatives --install ${sbindir}/chpasswd chpasswd chpasswd.${PN} 200
+	update-alternatives --install ${bindir}/chfn chfn chfn.${PN} 200
+	update-alternatives --install ${bindir}/newgrp newgrp newgrp.${PN} 200
+	update-alternatives --install ${bindir}/chsh chsh chsh.${PN} 200
+	update-alternatives --install ${base_bindir}/login login login.${PN} 200
+	update-alternatives --install ${base_sbindir}/vipw vipw vipw.${PN} 200
+	update-alternatives --install ${base_sbindir}/vigr vigr vigr.${PN} 200
+
+	if [ "x$D" != "x" ]; then
+		exit 1
+	fi  
+
+	pwconv
+	grpconv
+}
+
+pkg_prerm_${PN} () {
+	for i in passwd chpasswd chfn newgrp chsh login vipw vigr ; do
+		update-alternatives --remove $i $i.${PN}
+	done
+}
-- 
1.7.3.4



