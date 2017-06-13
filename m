Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4EC20782EF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 08:27:53 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id q97so131414257wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 01:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LMimlpTV5vtzh9XIZ3HGvXblZNwgLSZheGQnEwjtjws=;
	b=F9KQ6N1a9hwAgGMhSemKnXGmWGOh8AVs4NCAaT7iuMUbdTACQlQ3wkdcocHROodUkl
	3VEyP6XdACtc4vCB9/1/dacEIH1ts5L+fZGUvyo9/QZDWpXVaFM+HzU4LB64VUrC7RmM
	mXDH3u2P3IGQMUCmU69k1UY+UFwXgXnHr97S374jrSG82NXny4/rPwLtJWjI0hPV9i3K
	jCx2cxS/4NH2CPp/U9SH5TOTejktgIZHwS9+JwVPSqiXrQPntLBZQ70/7021+GXtcD9q
	r/u8u0cGOQClQw55XybFcz5S8AxM5r4bP8TihKh9bMk0dlCo9wc1rct003raVoag3P2W
	Gzeg==
X-Gm-Message-State: AKS2vOx8jpzNkll9RQHOWj5kmZU2Aqo7SO3O8glxpInUYoxm/CIh1Q0l
	6YgD8lDcAwKRfDuE59I=
X-Received: by 10.223.155.141 with SMTP id d13mr2017700wrc.117.1497342473552; 
	Tue, 13 Jun 2017 01:27:53 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 197sm286326wmm.23.2017.06.13.01.27.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Jun 2017 01:27:52 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 09:27:51 +0100
Message-Id: <20170613082751.1163-1-git@andred.net>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [pyro][PATCH] openssh: allow to override OpenSSL HostKeys when read-only-rootfs
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
X-List-Received-Date: Tue, 13 Jun 2017 08:27:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

With these changes it is possible to have a .bbappend that
- sets SYSCONFDIR to some persistent storage
- modifies SYSCONFDIR/sshd_config to use ssh host keys from
  the (writable) sysconfdir

Signed-off-by: André Draszik <adraszik@tycoint.com>
Reviewed-by: Stephane Ayotte <sayotte@tycoint.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 106b59d9f96f70d133fa1421091ad280d27a5b6a)
---
 meta/classes/rootfs-postcommands.bbclass       |  4 +--
 meta/recipes-connectivity/openssh/openssh/init | 46 +++++++++++++++++++++++---
 2 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 498174a664..abf4e14f4c 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -91,10 +91,10 @@ read_only_rootfs_hook () {
 	# and the keys under /var/run/ssh.
 	if [ -d ${IMAGE_ROOTFS}/etc/ssh ]; then
 		if [ -e ${IMAGE_ROOTFS}/etc/ssh/ssh_host_rsa_key ]; then
-			echo "SYSCONFDIR=/etc/ssh" >> ${IMAGE_ROOTFS}/etc/default/ssh
+			echo "SYSCONFDIR=\${SYSCONFDIR:-/etc/ssh}" >> ${IMAGE_ROOTFS}/etc/default/ssh
 			echo "SSHD_OPTS=" >> ${IMAGE_ROOTFS}/etc/default/ssh
 		else
-			echo "SYSCONFDIR=/var/run/ssh" >> ${IMAGE_ROOTFS}/etc/default/ssh
+			echo "SYSCONFDIR=\${SYSCONFDIR:-/var/run/ssh}" >> ${IMAGE_ROOTFS}/etc/default/ssh
 			echo "SSHD_OPTS='-f /etc/ssh/sshd_config_readonly'" >> ${IMAGE_ROOTFS}/etc/default/ssh
 		fi
 	fi
diff --git a/meta/recipes-connectivity/openssh/openssh/init b/meta/recipes-connectivity/openssh/openssh/init
index 1f63725cc0..386628afc8 100644
--- a/meta/recipes-connectivity/openssh/openssh/init
+++ b/meta/recipes-connectivity/openssh/openssh/init
@@ -19,10 +19,24 @@ fi
 [ -z "$SYSCONFDIR" ] && SYSCONFDIR=/etc/ssh
 mkdir -p $SYSCONFDIR
 
-HOST_KEY_RSA=$SYSCONFDIR/ssh_host_rsa_key
-HOST_KEY_DSA=$SYSCONFDIR/ssh_host_dsa_key
-HOST_KEY_ECDSA=$SYSCONFDIR/ssh_host_ecdsa_key
-HOST_KEY_ED25519=$SYSCONFDIR/ssh_host_ed25519_key
+parse_sshd_opts() {
+    set -- ${SSHD_OPTS} --
+    sshd_config=/etc/ssh/sshd_config
+    while true ; do
+        case "$1" in
+        -f*) if [ "$1" = "-f" ] ; then
+                 sshd_config="$2"
+                 shift
+             else
+                 sshd_config="${1#-f}"
+             fi
+             shift
+             ;;
+        --) shift; break;;
+        *) shift;;
+        esac
+    done
+}
 
 check_for_no_start() {
     # forget it if we're trying to start, and /etc/ssh/sshd_not_to_be_run exists
@@ -45,21 +59,45 @@ check_config() {
 }
 
 check_keys() {
+	# parse location of keys
+	local HOST_KEY_RSA
+	local HOST_KEY_DSA
+	local HOST_KEY_ECDSA
+	local HOST_KEY_ED25519
+
+	parse_sshd_opts
+	HOST_KEY_RSA=$(grep ^HostKey "${sshd_config}" | grep _rsa_ | tail -1 | awk ' { print $2 } ')
+	[ -z "${HOST_KEY_RSA}" ] && HOST_KEY_RSA=$(grep HostKey "${sshd_config}" | grep _rsa_ | tail -1 | awk ' { print $2 } ')
+	[ -z "${HOST_KEY_RSA}" ] && HOST_KEY_RSA=$SYSCONFDIR/ssh_host_rsa_key
+	HOST_KEY_DSA=$(grep ^HostKey "${sshd_config}" | grep _dsa_ | tail -1 | awk ' { print $2 } ')
+	[ -z "${HOST_KEY_DSA}" ] && HOST_KEY_DSA=$(grep HostKey "${sshd_config}" | grep _dsa_ | tail -1 | awk ' { print $2 } ')
+	[ -z "${HOST_KEY_DSA}" ] && HOST_KEY_DSA=$SYSCONFDIR/ssh_host_dsa_key
+	HOST_KEY_ECDSA=$(grep ^HostKey "${sshd_config}" | grep _ecdsa_ | tail -1 | awk ' { print $2 } ')
+	[ -z "${HOST_KEY_ECDSA}" ] && HOST_KEY_ECDSA=$(grep HostKey "${sshd_config}" | grep _ecdsa_ | tail -1 | awk ' { print $2 } ')
+	[ -z "${HOST_KEY_ECDSA}" ] && HOST_KEY_ECDSA=$SYSCONFDIR/ssh_host_ecdsa_key
+	HOST_KEY_ED25519=$(grep ^HostKey "${sshd_config}" | grep _ed25519_ | tail -1 | awk ' { print $2 } ')
+	[ -z "${HOST_KEY_ED25519}" ] && HOST_KEY_ED25519=$(grep HostKey "${sshd_config}" | grep _ed25519_ | tail -1 | awk ' { print $2 } ')
+	[ -z "${HOST_KEY_ED25519}" ] && HOST_KEY_ED25519=$SYSCONFDIR/ssh_host_ed25519_key
+
 	# create keys if necessary
 	if [ ! -f $HOST_KEY_RSA ]; then
 		echo "  generating ssh RSA key..."
+		mkdir -p $(dirname $HOST_KEY_RSA)
 		ssh-keygen -q -f $HOST_KEY_RSA -N '' -t rsa
 	fi
 	if [ ! -f $HOST_KEY_ECDSA ]; then
 		echo "  generating ssh ECDSA key..."
+		mkdir -p $(dirname $HOST_KEY_ECDSA)
 		ssh-keygen -q -f $HOST_KEY_ECDSA -N '' -t ecdsa
 	fi
 	if [ ! -f $HOST_KEY_DSA ]; then
 		echo "  generating ssh DSA key..."
+		mkdir -p $(dirname $HOST_KEY_DSA)
 		ssh-keygen -q -f $HOST_KEY_DSA -N '' -t dsa
 	fi
 	if [ ! -f $HOST_KEY_ED25519 ]; then
 		echo "  generating ssh ED25519 key..."
+		mkdir -p $(dirname $HOST_KEY_ED25519)
 		ssh-keygen -q -f $HOST_KEY_ED25519 -N '' -t ed25519
 	fi
 }
-- 
2.11.0


