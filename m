Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1AB8871CAF
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 May 2017 01:33:10 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id v135so4402814itv.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 May 2017 18:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=JL0r3haTyeywFuPI3jzPz6nPotC+k9TcYsW6iJ64XGY=;
	b=qCwXdD1I8Qggq4GgZlk3jVwiiPaggdGZK91/7Q1l+jefJY2c3HOIruxl15gTTJlsph
	0OogJXejLxo5PSIGfZEWtTIWyMjzaXHjVJEl+2rIsUSPZy6a95K3Vb7/KC3SeY/90j65
	qA57VN3R/vZkK6EMzMkM9fle7YjUfck6AQsTwsTTCEGrm1yko17cZcKymVmp5u/CCv3o
	leqSb8rdRLr8Lorqe87vBuHiYLXqRvpQ3+txmHoC69W5YUIopmtcyu/YVqThiyheBM0p
	z1DMg59frYRjT4j/DCkMX8bkptzng2dtUT+jEu2GNC9dUNn88zirzLVhwPV3jKuc2DCY
	VMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JL0r3haTyeywFuPI3jzPz6nPotC+k9TcYsW6iJ64XGY=;
	b=IQa2gHWkeuv5JWeF1lN6EakO+7Ou4YpQXIPMTvkKHznWHENJGBGc9NAjnoQdgt6keD
	V/PJXsGjQReGyJFH0m7+VQkx11t1HwEiXk1QwE4UR071D6xOWkIyag3SYxkXS0dXkF0u
	vfsl/IcJ2vLLP5B+vSHwUhBiXORT4B2kREnQMJ5qvYBO5ACGbHaO9rY0cUFXs4k6bJqh
	XMygUaZn9NSGaGet2mrdAxbUg6n9VN8B+pllGFsaJKrjS2PUceB7SMcAyPJQ3AryR1MY
	l2gATCKddcqRGDvM7ECVW2T03l9TUlJw6dH/WgciNyvTEUcnEW0txCPgirAJN2t5D1Ir
	DxAg==
X-Gm-Message-State: AN3rC/58CcYE1ZiCEukx9KbzPiDZ69YuaUc/acnrwVGJksMlMWaIpZdn
	ccqj2eAJ50VJhA==
X-Received: by 10.36.57.78 with SMTP id l75mr14806991ita.60.1494120791985;
	Sat, 06 May 2017 18:33:11 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.gmail.com with ESMTPSA id
	v130sm3131562itv.19.2017.05.06.18.33.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 May 2017 18:33:10 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 May 2017 20:33:04 -0500
Message-Id: <20170507013304.30165-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] openssh: Atomically generate host keys
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
X-List-Received-Date: Sun, 07 May 2017 01:33:11 -0000

Generating the host keys atomically prevents power interruptions during
the first boot from leaving the key files incomplete, which often
prevents users from being able to ssh into the device.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh/init     | 21 ++++------------
 .../openssh/openssh/sshd-check-key                 | 28 ++++++++++++++++++++++
 .../openssh/openssh/sshdgenkeys.service            | 16 ++++---------
 meta/recipes-connectivity/openssh/openssh_7.4p1.bb |  8 +++++++
 4 files changed, 44 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/sshd-check-key

diff --git a/meta/recipes-connectivity/openssh/openssh/init b/meta/recipes-connectivity/openssh/openssh/init
index 1f63725..22124a9 100644
--- a/meta/recipes-connectivity/openssh/openssh/init
+++ b/meta/recipes-connectivity/openssh/openssh/init
@@ -45,23 +45,10 @@ check_config() {
 }
 
 check_keys() {
-	# create keys if necessary
-	if [ ! -f $HOST_KEY_RSA ]; then
-		echo "  generating ssh RSA key..."
-		ssh-keygen -q -f $HOST_KEY_RSA -N '' -t rsa
-	fi
-	if [ ! -f $HOST_KEY_ECDSA ]; then
-		echo "  generating ssh ECDSA key..."
-		ssh-keygen -q -f $HOST_KEY_ECDSA -N '' -t ecdsa
-	fi
-	if [ ! -f $HOST_KEY_DSA ]; then
-		echo "  generating ssh DSA key..."
-		ssh-keygen -q -f $HOST_KEY_DSA -N '' -t dsa
-	fi
-	if [ ! -f $HOST_KEY_ED25519 ]; then
-		echo "  generating ssh ED25519 key..."
-		ssh-keygen -q -f $HOST_KEY_ED25519 -N '' -t ed25519
-	fi
+    @LIBEXECDIR@/sshd-check-key $HOST_KEY_RSA rsa
+    @LIBEXECDIR@/sshd-check-key $HOST_KEY_ECDSA ecdsa
+    @LIBEXECDIR@/sshd-check-key $HOST_KEY_DSA dsa
+    @LIBEXECDIR@/sshd-check-key $HOST_KEY_ED25519 ed25519
 }
 
 export PATH="${PATH:+$PATH:}/usr/sbin:/sbin"
diff --git a/meta/recipes-connectivity/openssh/openssh/sshd-check-key b/meta/recipes-connectivity/openssh/openssh/sshd-check-key
new file mode 100644
index 0000000..3495d98
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/sshd-check-key
@@ -0,0 +1,28 @@
+#! /bin/sh
+set -e
+
+NAME="$1"
+TYPE="$2"
+
+if [ -z "$NAME" ] || [ -z "$TYPE" ]; then
+    echo "Usage: $0 NAME TYPE"
+    exit 1;
+fi
+
+if [ ! -f "$NAME" ]; then
+    echo "  generating ssh $TYPE key..."
+    ssh-keygen -q -f "${NAME}.tmp" -N '' -t $TYPE
+
+    # Sync to ensure data is written to temp file before renaming
+    sync
+
+    # Move (Atomically rename) files
+    # Rename the .pub file first, since the check that triggers a
+    # key generation is based on the private file.
+    mv -f "${NAME}.tmp.pub" "${NAME}.pub"
+    sync
+
+    mv -f "${NAME}.tmp" "${NAME}"
+    sync
+fi
+
diff --git a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
index 148e6ad..af56404 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
+++ b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
@@ -1,22 +1,14 @@
 [Unit]
 Description=OpenSSH Key Generation
 RequiresMountsFor=/var /run
-ConditionPathExists=!/var/run/ssh/ssh_host_rsa_key
-ConditionPathExists=!/var/run/ssh/ssh_host_dsa_key
-ConditionPathExists=!/var/run/ssh/ssh_host_ecdsa_key
-ConditionPathExists=!/var/run/ssh/ssh_host_ed25519_key
-ConditionPathExists=!/etc/ssh/ssh_host_rsa_key
-ConditionPathExists=!/etc/ssh/ssh_host_dsa_key
-ConditionPathExists=!/etc/ssh/ssh_host_ecdsa_key
-ConditionPathExists=!/etc/ssh/ssh_host_ed25519_key
 
 [Service]
 Environment="SYSCONFDIR=/etc/ssh"
 EnvironmentFile=-/etc/default/ssh
 ExecStart=@BASE_BINDIR@/mkdir -p $SYSCONFDIR
-ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_rsa_key -N '' -t rsa
-ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_dsa_key -N '' -t dsa
-ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_ecdsa_key -N '' -t ecdsa
-ExecStart=@BINDIR@/ssh-keygen -q -f ${SYSCONFDIR}/ssh_host_ed25519_key -N '' -t ed25519
+ExecStart=@LIBEXECDIR@/sshd-check-key ${SYSCONFDIR}/ssh_host_rsa_key rsa
+ExecStart=@LIBEXECDIR@/sshd-check-key ${SYSCONFDIR}/ssh_host_dsa_key dsa
+ExecStart=@LIBEXECDIR@/sshd-check-key ${SYSCONFDIR}/ssh_host_ecdsa_key ecdsa
+ExecStart=@LIBEXECDIR@/sshd-check-key ${SYSCONFDIR}/ssh_host_ed25519_key ed25519
 Type=oneshot
 RemainAfterExit=yes
diff --git a/meta/recipes-connectivity/openssh/openssh_7.4p1.bb b/meta/recipes-connectivity/openssh/openssh_7.4p1.bb
index c8093d4..ccd7a02 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.4p1.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://openssh-7.1p1-conditional-compile-des-in-cipher.patch \
            file://openssh-7.1p1-conditional-compile-des-in-pkcs11.patch \
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
+           file://sshd-check-key \
            "
 
 PAM_SRC_URI = "file://sshd"
@@ -124,7 +125,14 @@ do_install_append () {
 	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
 		-e 's,@SBINDIR@,${sbindir},g' \
 		-e 's,@BINDIR@,${bindir},g' \
+		-e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
 		${D}${systemd_unitdir}/system/sshd.socket ${D}${systemd_unitdir}/system/*.service
+
+	sed -i -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
+		${D}${sysconfdir}/init.d/sshd
+
+	install -d 644 ${D}${libexecdir}/${BPN}
+	install -m 0755 ${WORKDIR}/sshd-check-key ${D}${libexecdir}/${BPN}
 }
 
 do_install_ptest () {
-- 
2.9.3


