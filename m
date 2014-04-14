Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF1765E5F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Apr 2014 13:56:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,857,1389740400"; d="scan'208";a="49144758"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 14 Apr 2014 15:56:02 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Mon, 14 Apr 2014 15:56:02 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Mon, 14 Apr 2014 15:56:02 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Apr 2014 15:56:05 +0200
Message-ID: <1397483765-28956-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Subject: [PATCH] openssh-sshd: host contamination fix
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
X-List-Received-Date: Mon, 14 Apr 2014 13:56:06 -0000
Content-Type: text/plain

If you do a readelf -x .rodata /path/.../to/openssh/6.5p1-r0/packages-split/openssh-sshd/usr/sbin/sshd

You'll see two references to OE's sysroots/${BUILD_SYS} login and passwd binaries.
First one can be overridden with LOGIN_PROGRAM environment variable (see configure.ac),
second needs a cached variable definition.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/recipes-connectivity/openssh/openssh_6.5p1.bb | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.5p1.bb b/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
index 2c4da70..d19cc5a 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
@@ -7,7 +7,6 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=e326045657e842541d3f35aada442507"
 
-
 DEPENDS = "zlib openssl"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
@@ -55,7 +54,9 @@ inherit autotools-brokensep
 CFLAGS += "-D__FILE_OFFSET_BITS=64"
 export LD = "${CC}"
 
-EXTRA_OECONF = "${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
+# login path is hardcoded in sshd
+EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
+                ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
                 --without-zlib-version-check \
                 --with-privsep-path=/var/run/sshd \
                 --sysconfdir=${sysconfdir}/ssh \
@@ -64,9 +65,11 @@ EXTRA_OECONF = "${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--with
 # Since we do not depend on libbsd, we do not want configure to use it
 # just because it finds libutil.h.  But, specifying --disable-libutil
 # causes compile errors, so...
-#
 CACHED_CONFIGUREVARS += "ac_cv_header_bsd_libutil_h=no ac_cv_header_libutil_h=no"
 
+# passwd path is hardcoded in sshd
+CACHED_CONFIGUREVARS += "ac_cv_path_PATH_PASSWD_PROG=${bindir}/passwd"
+
 # This is a workaround for uclibc because including stdio.h
 # pulls in pthreads.h and causes conflicts in function prototypes.
 # This results in compilation failure, so unless this is fixed,
@@ -97,7 +100,7 @@ do_install_append () {
 	install -d ${D}/${sysconfdir}/default/volatiles
 	install -m 644 ${WORKDIR}/volatiles.99_sshd ${D}/${sysconfdir}/default/volatiles/99_sshd
 
-        # Create config files for read-only rootfs
+	# Create config files for read-only rootfs
 	install -d ${D}${sysconfdir}/ssh
 	install -m 644 ${D}${sysconfdir}/ssh/sshd_config ${D}${sysconfdir}/ssh/sshd_config_readonly
 	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config_readonly
@@ -130,7 +133,6 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
 RDEPENDS_${PN}-sshd += "${PN}-keygen ${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
 
-
 CONFFILES_${PN}-sshd = "${sysconfdir}/ssh/sshd_config"
 CONFFILES_${PN}-ssh = "${sysconfdir}/ssh/ssh_config"
 
-- 
1.8.5.4


