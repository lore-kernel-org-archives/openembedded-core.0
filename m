Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QlejJ-0000XD-Cp
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 12:19:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6QAEwPm003007
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 03:14:59 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 26 Jul 2011 03:14:58 -0700
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jul 2011 18:08:07 +0800
Message-ID: <56e22b9037112577328c2495ad625c9ccf8a4d39.1311671726.git.xiaofeng.yan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311671726.git.xiaofeng.yan@windriver.com>
References: <cover.1311671726.git.xiaofeng.yan@windriver.com>
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
X-List-Received-Date: Tue, 26 Jul 2011 10:19:13 -0000
Content-Type: text/plain

Adding configuration file "sshd" in /etc/pam.d/ for supporting pam.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../openssh/openssh-5.8p2/sshd                     |   10 ++++++++++
 meta/recipes-connectivity/openssh/openssh_5.8p2.bb |   13 +++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)
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
index e23069c..89b011d 100644
--- a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
@@ -7,7 +7,7 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=bae9a689be41581503bcf95d8fb42c4e"
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "zlib openssl"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -23,7 +23,9 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://sshd_config \
            file://ssh_config \
            file://init \
-          "
+           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
+
+PAM_SRC_URI = "file://sshd"
 SRC_URI[md5sum] = "0541579adf9d55abb15ef927048d372e"
 SRC_URI[sha256sum] = "5c35ec7c966ce05cc4497ac59c0b54a556e55ae7368165cc8c4129694654f314"
 
@@ -58,6 +60,13 @@ do_compile_append () {
 }
 
 do_install_append () {
+	for i in ${DISTRO_FEATURES};
+	do
+		if [ ${i} = "pam" ];  then
+			install -d ${D}${sysconfdir}/pam.d
+			install -m 0755 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
+		fi
+	done
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
 	mv ${D}${bindir}/scp ${D}${bindir}/scp.${PN}
-- 
1.7.0.4



