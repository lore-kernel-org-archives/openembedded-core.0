Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 620127829D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 13:38:15 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id g76so33422331wrd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 06:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VwrJ6vfHK4kDB89jStza1QfvgY+i7gPOcKAGa9LCh8w=;
	b=bHgIRp1qrBQ+llmnGyhlN/DcGhfXcoS2TIJJC9CgbeDHc3aqBdkr7mpql99iEa4WPF
	PDr6bJoheZIjTp4yiNiOfGaujy02WHXj+u4GYwqmTPMku8Mhg0w+kLywcp/pZVLAMQfk
	cSlzG0mnqY3TSE+kKxZNoQpL/4RJpKCUA6sT0IMrbnGn4bpJGWhUzGS0fmH4QUol6mu9
	KZYGDjvt/vinBhkQ4A5EG4pI0Ne7KRiWpld8UBDjLLITJR/q3z8Vi828un8vcDS/BaJ+
	gjdZaUQl+RNR3KB4HxOBPhF1qVnZs/LMm3zd5zN1YNKtbhLNEt3nBwOv2j68X8Ky8/5q
	U6hA==
X-Gm-Message-State: AKS2vOw+r0JpL+nSE0yG04+w/2HycOUzyD/AONhSgwc+/skKxADCpR4i
	mVWG98BMqrKLnjk1RjU=
X-Received: by 10.28.47.138 with SMTP id v132mr4318157wmv.77.1497015496382;
	Fri, 09 Jun 2017 06:38:16 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	q77sm1666141wmd.31.2017.06.09.06.38.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Jun 2017 06:38:15 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 14:38:14 +0100
Message-Id: <20170609133814.6172-1-git@andred.net>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] openssh: allow to override OpenSSL HostKeys when read-only-rootfs
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
X-List-Received-Date: Fri, 09 Jun 2017 13:38:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

With these changes it is possible to have a .bbappend that
- sets SYSCONFDIR to some persistent storage
- modifies SYSCONFDIR/sshd_config to use ssh host keys from
  the (writable) sysconfdir

Signed-off-by: André Draszik <adraszik@tycoint.com>
Reviewed-by: Stephane Ayotte <sayotte@tycoint.com>
---
 meta/classes/rootfs-postcommands.bbclass       |  4 +--
 meta/recipes-connectivity/openssh/openssh/init | 46 +++++++++++++++++++++++---
 2 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 1d66a42953..78f7c55933 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -93,10 +93,10 @@ read_only_rootfs_hook () {
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


