Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B66A66B6D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 09:10:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8D9ABc6004631
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 02:10:11 -0700 (PDT)
Received: from pek-lpgbuild1.wrs.com (128.224.153.21) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Fri, 13 Sep 2013 02:10:09 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 17:10:07 +0800
Message-ID: <1379063407-31988-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] openssh: use volatiles for managing /var/run/sshd
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
X-List-Received-Date: Fri, 13 Sep 2013 09:10:10 -0000
Content-Type: text/plain

It fixes the following failure:
"fatal: Missing privilege separation directory: /var/run/sshd"

when sshd is started through xinetd.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 .../openssh/openssh-6.2p2/volatiles.99_sshd        |    1 +
 meta/recipes-connectivity/openssh/openssh_6.2p2.bb |    8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh-6.2p2/volatiles.99_sshd

diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/volatiles.99_sshd b/meta/recipes-connectivity/openssh/openssh-6.2p2/volatiles.99_sshd
new file mode 100644
index 0000000..86e7f6f
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/volatiles.99_sshd
@@ -0,0 +1 @@
+d sshd sshd 0755 /var/run/sshd none
diff --git a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
index 3a7f50d..bb5c79e 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
@@ -29,7 +29,8 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://sshd.socket \
            file://sshd@.service \
-           file://sshdgenkeys.service "
+           file://sshdgenkeys.service \
+           file://volatiles.99_sshd "
 
 PAM_SRC_URI = "file://sshd"
 
@@ -92,6 +93,9 @@ do_install_append () {
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
 	rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin
 	rmdir ${D}${localstatedir}/run/sshd ${D}${localstatedir}/run ${D}${localstatedir}
+	install -d ${D}/${sysconfdir}/default/volatiles
+	install -m 644 ${WORKDIR}/volatiles.99_sshd ${D}/${sysconfdir}/default/volatiles/99_sshd
+
         # Create config files for read-only rootfs
 	install -d ${D}${sysconfdir}/ssh
 	install -m 644 ${WORKDIR}/sshd_config ${D}${sysconfdir}/ssh/sshd_config_readonly
@@ -116,7 +120,7 @@ PACKAGES =+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp ${PN}-misc $
 FILES_${PN}-scp = "${bindir}/scp.${BPN}"
 FILES_${PN}-ssh = "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config"
 FILES_${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd"
-FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly"
+FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly ${sysconfdir}/default/volatiles/99_sshd"
 FILES_${PN}-sftp = "${bindir}/sftp"
 FILES_${PN}-sftp-server = "${libexecdir}/sftp-server"
 FILES_${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
-- 
1.7.1


