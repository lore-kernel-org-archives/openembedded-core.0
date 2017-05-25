Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4157560017
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 02:18:29 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id a10so13869070itg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 19:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pYk9EGDDNkLA95MPSvvE5aUafxAMUtjGNGKcuuLyL4M=;
	b=oVl5BeZi2QQfmqd1yc/Tf3ccfyY/xUmiN0mNFJTJ9/76nSjnrBw6ySDOkmNy6Mdlit
	8QcCBmyUkvPTFhfMoJJtkomZ1j055P/iT9BHqP+XXJT7kDmIYXvhIO08O769nGLXkDVt
	BuzQ7Ryqg3KU5lAovZlUrOnAL167/GnfZDKTgjlUPFy094wrxey7GuqjZsc383Xz+3TG
	Cmg9syIGay18PQIB276cUIuGSQNV3KosZigK2G/qXBxHVToaD2kXZ51+Jdql/vqYf4q/
	VY8h/bZlOR7r2a2+PH6ErFg2J5oi8GhP0vqenyNyL0Al0DU4+trERisKtC+Eh8GWt7ga
	fg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pYk9EGDDNkLA95MPSvvE5aUafxAMUtjGNGKcuuLyL4M=;
	b=br/U7dhnC7EqxudfMahLsPpKrm7dF/IlMcFmdW/n29IhTaZbH3cnwX3nE0yfobWYKy
	lhbGcmOTG8wlOuICpWd/YNzNs3OAf5UrW+Lm7mx7g7jZfu/20AOXLLs8IIjTkYC7WA5t
	9UDanmkKHW+qfAaX8Gj/0xXWQqaB3C3xC93HkLqSsMmXJTn+8oMDMT8S+GFMva5jBWIS
	ZAcdawhpskjoTKmkcBeW2Lvn5egIdHwjHHqo7f1vjrRGQseW7bQYyst3y1Hn9asUfsDD
	XvcEHZMlPD+BB+rhybPWPYT+MyS8kvXlnWB7ecpzoebbPvhZKtdK3PSxUkaGAUzS/uBB
	YjEQ==
X-Gm-Message-State: AODbwcD0NUMAze78ZEZY9p3nOx3rxwMUkdVxpqPALQqQSjBysFUGdPyR
	ddJO8ZG+7q4En0/BlFo=
X-Received: by 10.36.237.201 with SMTP id r192mr11097831ith.84.1495678710641; 
	Wed, 24 May 2017 19:18:30 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.gmail.com with ESMTPSA id 11sm2479926itk.27.2017.05.24.19.18.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 May 2017 19:18:29 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 May 2017 21:17:17 -0500
Message-Id: <20170525021717.394-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <CAJdd5GYuBbqarXs38M91atDyQhz17EcPDE9yKme-oiwDjCtaaA@mail.gmail.com>
References: <CAJdd5GYuBbqarXs38M91atDyQhz17EcPDE9yKme-oiwDjCtaaA@mail.gmail.com>
Subject: [meta-oe][PATCH v3] openssh: Atomically generate host keys
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
X-List-Received-Date: Thu, 25 May 2017 02:18:30 -0000

Generating the host keys atomically prevents power interruptions during
the first boot from leaving the key files incomplete, which often
prevents users from being able to ssh into the device.
---
 meta/recipes-connectivity/openssh/openssh/init     | 21 +++----------
 .../openssh/openssh/sshd-check-key                 | 36 ++++++++++++++++++++++
 .../openssh/openssh/sshdgenkeys.service            | 24 +++++++--------
 meta/recipes-connectivity/openssh/openssh_7.5p1.bb |  8 +++++
 4 files changed, 60 insertions(+), 29 deletions(-)
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
index 0000000..d2613af
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/sshd-check-key
@@ -0,0 +1,36 @@
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
+DIR="$(dirname "$NAME")"
+
+if [ ! -f "$NAME" ]; then
+    echo "  generating ssh $TYPE key..."
+    ssh-keygen -q -f "${NAME}.tmp" -N '' -t $TYPE
+
+    # Move (Atomically rename) files
+    mv -f "${NAME}.tmp.pub" "${NAME}.pub"
+
+    # This sync does double duty: Ensuring that the data in the temporary
+    # private key file is on disk before the rename, and ensuring that the
+    # public key rename is completed before the private key rename, since we
+    # switch on the existence of the private key to trigger key generation.
+    # This does mean it is possible for the public key to exist, but be garbage
+    # but this is OK because in that case the private key won't exist and the
+    # keys will be regenerated.
+    #
+    # In the event that sync understands arguments that limit what it tries to
+    # fsync(), we provided them. If it does not, it will simply call sync()
+    # which is just as well
+    sync "${NAME}.pub" "$DIR" "${NAME}.tmp"
+
+    mv -f "${NAME}.tmp" "${NAME}"
+fi
+
diff --git a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
index 148e6ad..5d08b53 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
+++ b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
@@ -1,22 +1,22 @@
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
+ConditionPathExists=|!/var/run/ssh/ssh_host_rsa_key
+ConditionPathExists=|!/var/run/ssh/ssh_host_dsa_key
+ConditionPathExists=|!/var/run/ssh/ssh_host_ecdsa_key
+ConditionPathExists=|!/var/run/ssh/ssh_host_ed25519_key
+ConditionPathExists=|!/etc/ssh/ssh_host_rsa_key
+ConditionPathExists=|!/etc/ssh/ssh_host_dsa_key
+ConditionPathExists=|!/etc/ssh/ssh_host_ecdsa_key
+ConditionPathExists=|!/etc/ssh/ssh_host_ed25519_key
 
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
diff --git a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
index 5b96745..ede8823 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
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
+	install -d ${D}${libexecdir}/${BPN}
+	install -m 0755 ${WORKDIR}/sshd-check-key ${D}${libexecdir}/${BPN}
 }
 
 do_install_ptest () {
-- 
2.9.3


