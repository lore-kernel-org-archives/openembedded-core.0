Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9ED556B52E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 02:09:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6V29qQC017866
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 19:09:52 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 30 Jul 2013 19:09:51 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Jul 2013 10:09:43 +0800
Message-ID: <1f3158d6cbdfbec033f08a7a8d724eddb7796505.1375236274.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375236274.git.Qi.Chen@windriver.com>
References: <cover.1375236274.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 9/9] openssh: fix for read-only rootfs
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
X-List-Received-Date: Wed, 31 Jul 2013 02:09:51 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

If the rootfs is read-only and the ssh keys are not available at system
start-up, the init script will generate ssh keys into /etc/ssh, thus
causing a 'read-only file system' error.

In order for Yocto based image to work correctly for read-only rootfs,
we use the following logic for openssh.

If the rootfs is read-only and there are pre-generated keys under /etc/ssh,
we use the pre-generated keys. Note the pre-generated keys are mainly for
debugging or development purpose.
If the rootfs is read-only and there are no pre-generated keys under
/etc/ssh, we use /var/run/ssh as the location for ssh keys. That is, at
system boot-up, the generated ssh keys will put into /var/run/ssh.

[YOCTO #4887]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass                         |   12 +++++++++++
 .../openssh/openssh-6.2p2/init                     |   22 +++++++++++++-------
 meta/recipes-connectivity/openssh/openssh_6.2p2.bb |    9 +++++++-
 3 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 15fe51a..769cf81 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -264,6 +264,18 @@ read_only_rootfs_hook () {
 		if [ -x ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then
 			${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
 		fi
+		# If we're using openssh and the /etc/ssh directory has no pre-generated keys,
+		# we should configure openssh to use the configuration file /etc/ssh/sshd_config_readonly
+		# and the keys under /var/run/ssh.
+		if [ -d ${IMAGE_ROOTFS}/etc/ssh ]; then
+			if [ -e ${IMAGE_ROOTFS}/etc/ssh/ssh_host_rsa_key ]; then
+				echo "SYSCONFDIR=/etc/ssh" >> ${IMAGE_ROOTFS}/etc/default/ssh
+				echo "SSHD_OPTS=" >> ${IMAGE_ROOTFS}/etc/default/ssh
+			else
+				echo "SYSCONFDIR=/var/run/ssh" >> ${IMAGE_ROOTFS}/etc/default/ssh
+				echo "SSHD_OPTS='-f /etc/ssh/sshd_config_readonly'" >> ${IMAGE_ROOTFS}/etc/default/ssh
+			fi
+		fi
 	fi
 }
 
diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/init b/meta/recipes-connectivity/openssh/openssh-6.2p2/init
index 6beec84..12fb79b 100644
--- a/meta/recipes-connectivity/openssh/openssh-6.2p2/init
+++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/init
@@ -6,14 +6,22 @@ set -e
 test -x /usr/sbin/sshd || exit 0
 ( /usr/sbin/sshd -\? 2>&1 | grep -q OpenSSH ) 2>/dev/null || exit 0
 
+# /etc/default/ssh may set SYSCONFDIR and SSHD_OPTS
 if test -f /etc/default/ssh; then
     . /etc/default/ssh
 fi
 
+[ -z "$SYSCONFDIR" ] && SYSCONFDIR=/etc/ssh
+mkdir -p $SYSCONFDIR
+
+HOST_KEY_RSA=$SYSCONFDIR/ssh_host_rsa_key
+HOST_KEY_DSA=$SYSCONFDIR/ssh_host_dsa_key
+HOST_KEY_ECDSA=$SYSCONFDIR/ssh_host_ecdsa_key
+
 check_for_no_start() {
     # forget it if we're trying to start, and /etc/ssh/sshd_not_to_be_run exists
-    if [ -e /etc/ssh/sshd_not_to_be_run ]; then 
-	echo "OpenBSD Secure Shell server not in use (/etc/ssh/sshd_not_to_be_run)"
+    if [ -e $SYSCONFDIR/sshd_not_to_be_run ]; then
+	echo "OpenBSD Secure Shell server not in use ($SYSCONFDIR/sshd_not_to_be_run)"
 	exit 0
     fi
 }
@@ -32,17 +40,17 @@ check_config() {
 
 check_keys() {
 	# create keys if necessary
-	if [ ! -f /etc/ssh/ssh_host_rsa_key ]; then
+	if [ ! -f $HOST_KEY_RSA ]; then
 		echo "  generating ssh RSA key..."
-		ssh-keygen -q -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
+		ssh-keygen -q -f $HOST_KEY_RSA -N '' -t rsa
 	fi
-	if [ ! -f /etc/ssh/ssh_host_ecdsa_key ]; then
+	if [ ! -f $HOST_KEY_ECDSA ]; then
 		echo "  generating ssh ECDSA key..."
-		ssh-keygen -q -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa
+		ssh-keygen -q -f $HOST_KEY_ECDSA -N '' -t ecdsa
 	fi
 	if [ ! -f /etc/ssh/ssh_host_dsa_key ]; then
 		echo "  generating ssh DSA key..."
-		ssh-keygen -q -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
+		ssh-keygen -q -f $HOST_KEY_DSA -N '' -t dsa
 	fi
 }
 
diff --git a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
index ab2eefb..c76f9ac 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
@@ -86,6 +86,13 @@ do_install_append () {
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
 	rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin
 	rmdir ${D}${localstatedir}/run/sshd ${D}${localstatedir}/run ${D}${localstatedir}
+        # Create config files for read-only rootfs
+	install -d ${D}${sysconfdir}/ssh
+	install -m 644 ${WORKDIR}/sshd_config ${D}${sysconfdir}/ssh/sshd_config_readonly
+	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config_readonly
+	echo "HostKey /var/run/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
+	echo "HostKey /var/run/ssh/ssh_host_dsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
+	echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 }
 
 ALLOW_EMPTY_${PN} = "1"
@@ -94,7 +101,7 @@ PACKAGES =+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp ${PN}-misc $
 FILES_${PN}-scp = "${bindir}/scp.${BPN}"
 FILES_${PN}-ssh = "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config"
 FILES_${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd"
-FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config"
+FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly"
 FILES_${PN}-sftp = "${bindir}/sftp"
 FILES_${PN}-sftp-server = "${libexecdir}/sftp-server"
 FILES_${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
-- 
1.7.9.5


