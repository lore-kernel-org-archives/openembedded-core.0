Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QlGcM-0007K0-9u
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 10:34:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6P8UDld003240
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 01:30:14 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 25 Jul 2011 01:30:13 -0700
Message-ID: <0c23fefb55154f9a35ec9e942d011728e6c8f6c1.1311574519.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1311574519.git.xiaofeng.yan@windriver.com>
References: <cover.1311574519.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 25 Jul 2011 13:42:48 +0800
Date: Mon, 25 Jul 2011 16:23:30 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] openssh: Support PAM
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
X-List-Received-Date: Mon, 25 Jul 2011 08:34:26 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Change as follows:
* Adding configuration file "sshd" in /etc/pam.d/ for supporting pam.
* Using four spaces instead of tab

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../openssh/openssh-5.8p2/sshd                     |   10 +++
 meta/recipes-connectivity/openssh/openssh_5.8p2.bb |   77 +++++++++++---------
 2 files changed, 53 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh-5.8p2/sshd

diff --git a/meta/recipes-connectivity/openssh/openssh-5.8p2/sshd b/meta/recipes-connectivity/openssh/openssh-5.8p2/sshd
new file mode 100644
index 0000000..4882e58
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh-5.8p2/sshd
@@ -0,0 +1,10 @@
+#%PAM-1.0
+
+auth       include      common-auth
+account    required     pam_nologin.so
+account    include      common-account
+password   include      common-password
+session    optional     pam_keyinit.so force revoke
+session    include      common-session
+session    required     pam_loginuid.so
+
diff --git a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
index e23069c..d5ccba1 100644
--- a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
@@ -7,13 +7,11 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=bae9a689be41581503bcf95d8fb42c4e"
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "zlib openssl"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-
 RPROVIDES = "ssh sshd"
-
 CONFLICTS_${PN} = "dropbear"
 RCONFLICTS_${PN}-sshd = "dropbear"
 RCONFLICTS_${PN}-keygen = "ssh-keygen"
@@ -23,7 +21,9 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://sshd_config \
            file://ssh_config \
            file://init \
-          "
+           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
+
+PAM_SRC_URI = "file://sshd"
 SRC_URI[md5sum] = "0541579adf9d55abb15ef927048d372e"
 SRC_URI[sha256sum] = "5c35ec7c966ce05cc4497ac59c0b54a556e55ae7368165cc8c4129694654f314"
 
@@ -47,23 +47,32 @@ EXTRA_OECONF = "--with-rand-helper=no \
 EXTRA_OECONF_append_libc-uclibc=" --without-pam"
 
 do_configure_prepend () {
-	if [ ! -e acinclude.m4 -a -e aclocal.m4 ]; then
-		cp aclocal.m4 acinclude.m4
-	fi
+
+    if [ ! -e acinclude.m4 -a -e aclocal.m4 ]; then
+        cp aclocal.m4 acinclude.m4
+    fi
 }
 
 do_compile_append () {
-	install -m 0644 ${WORKDIR}/sshd_config ${S}/
-	install -m 0644 ${WORKDIR}/ssh_config ${S}/
+    install -m 0644 ${WORKDIR}/sshd_config ${S}/
+    install -m 0644 ${WORKDIR}/ssh_config ${S}/
 }
 
 do_install_append () {
-	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
-	mv ${D}${bindir}/scp ${D}${bindir}/scp.${PN}
-	mv ${D}${bindir}/ssh ${D}${bindir}/ssh.${PN}
-	rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin
-	rmdir ${D}/var/run/sshd ${D}/var/run ${D}/var
+    for i in ${DISTRO_FEATURES};
+    do
+        if [ ${i} = "pam" ];  then
+            install -d ${D}${sysconfdir}/pam.d
+            install -m 0755 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
+        fi
+    done
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
+    mv ${D}${bindir}/scp ${D}${bindir}/scp.${PN}
+    mv ${D}${bindir}/ssh ${D}${bindir}/ssh.${PN}
+    rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin
+    rmdir ${D}/var/run/sshd ${D}/var/run ${D}/var
+       
 }
 
 ALLOW_EMPTY_${PN} = "1"
@@ -83,40 +92,40 @@ DEPENDS_${PN}-sshd += "update-rc.d"
 RDEPENDS_${PN}-sshd += "update-rc.d ${PN}-keygen"
 
 pkg_postinst_${PN}-sshd () {
-	if [ "x$D" != "x" ]; then
-		exit 1
-	else
-		addgroup sshd
-		adduser --system --home /var/run/sshd --no-create-home --disabled-password --ingroup sshd -s /bin/false sshd
-		update-rc.d sshd defaults 9
-	fi
+    if [ "x$D" != "x" ]; then
+        exit 1
+    else
+        addgroup sshd
+        adduser --system --home /var/run/sshd --no-create-home --disabled-password --ingroup sshd -s /bin/false sshd
+        update-rc.d sshd defaults 9
+    fi
 }
 
 pkg_postinst_${PN}-scp () {
-	update-alternatives --install ${bindir}/scp scp scp.${PN} 90
+    update-alternatives --install ${bindir}/scp scp scp.${PN} 90
 }
 
 pkg_postinst_${PN}-ssh () {
-	update-alternatives --install ${bindir}/ssh ssh ssh.${PN} 90
+    update-alternatives --install ${bindir}/ssh ssh ssh.${PN} 90
 }
 
 pkg_postrm_${PN}-ssh () {
-	update-alternatives --remove ${bindir}/ssh ssh.${PN}
+    update-alternatives --remove ${bindir}/ssh ssh.${PN}
 }
 
 pkg_postrm_${PN}-scp () {
-	update-alternatives --remove ${bindir}/scp scp.${PN}
+    update-alternatives --remove ${bindir}/scp scp.${PN}
 }
 
 pkg_postrm_${PN}-sshd () {
-	if [ "x$D" != "x" ]; then
-		exit 1
-	else
-		${sysconfdir}/init.d/sshd stop
-		deluser sshd
-		delgroup sshd
-		update-rc.d -f sshd remove
-	fi
+    if [ "x$D" != "x" ]; then
+        exit 1
+    else
+        ${sysconfdir}/init.d/sshd stop
+        deluser sshd
+        delgroup sshd
+        update-rc.d -f sshd remove
+    fi
 }
 
 CONFFILES_${PN}-sshd = "${sysconfdir}/ssh/sshd_config"
-- 
1.7.0.4



