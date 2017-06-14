Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 83734780F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 03:55:33 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id m47so48992604iti.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 20:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zRRbyECD4Cmt49H4ueg9Ed7jJBKZB0XvLMS74upKv+Y=;
	b=NyPKu6aNNYqTf9CxaQJqy8frGJ3i5FMcM6/naYj9e32kv1KVE88QbvPg7eKiw73eEb
	B5dRDccsewmM2HBEOcjGKS2s7rWBFwRyQBXX4XBKgb5IibHaMmIDMJVdLWnfBYLG3c/E
	O2Irx7sZD+DmX1YoJ8GKRWsYSQiaYMl3fi/J52CA9uyiPjmb3Ta/liKa8ozx5pyibdqn
	0RD1rGve0XXlTCzIGcvKnpxf3cQfMKMN4aGyhNrmlqcRKEKdnQfZ60VfbxGfoalWHRjp
	FXD+gHXyKeDj4qV0IfDFOdMesbeH9owA9s3Fzt3JE3RyK+maFmKHmTh7NquvzX+I4jTR
	ueVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zRRbyECD4Cmt49H4ueg9Ed7jJBKZB0XvLMS74upKv+Y=;
	b=tzwOdSgxPWRMuNrcMKpg2vD96TqeX2yqaFrL5/2vcXAXGLMZdaAm0MoyFgRvQsgaoZ
	IXWoHhkVT2IifmHKQ46nZbG26ti/SF9JPV0u+9Ad8+4/B7CaDYdpoKX63zMbQqgQvpRf
	/u7fYX8bsWPMnCbOnwkPKoReSmQ738q7xe30q/PyTDoopImh4Y4p43jG46FT4biSi31F
	4/STKF5zQkurwq6N1A+31QPGbLNwEc3sAyB5IYxrrzmErpgX84WoPyO2ZBmaqIE5ePE9
	rpG7GJdYCBucGTYXd7W5SEcVDnFZ4qqSXG0wD6+6Iin9Qfqj6fVrn0en+ufs0opxw5db
	zlfQ==
X-Gm-Message-State: AODbwcAZk9CK0HfUWK4x5/aeX9HzIFWByjYBrjykShJ0uAx8QAmMWr0/
	WxQZf9CpboH0GuMK1Ls=
X-Received: by 10.36.204.69 with SMTP id x66mr22473762itf.101.1497412535000;
	Tue, 13 Jun 2017 20:55:35 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.gmail.com with ESMTPSA id a11sm7407486ioj.4.2017.06.13.20.55.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Jun 2017 20:55:33 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 22:55:31 -0500
Message-Id: <20170614035531.8036-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <CAJdd5GYuBbqarXs38M91atDyQhz17EcPDE9yKme-oiwDjCtaaA@mail.gmail.com>
References: <CAJdd5GYuBbqarXs38M91atDyQhz17EcPDE9yKme-oiwDjCtaaA@mail.gmail.com>
Subject: [PATCH v9] openssh: Atomically generate host keys
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
X-List-Received-Date: Wed, 14 Jun 2017 03:55:34 -0000

Generating the host keys atomically prevents power interruptions during
the first boot from leaving the key files incomplete, which often
prevents users from being able to ssh into the device.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh/init     | 25 +++------------
 .../openssh/openssh/sshd-check-key                 | 37 ++++++++++++++++++++++
 .../openssh/openssh/sshdgenkeys.service            | 25 ++++++++-------
 meta/recipes-connectivity/openssh/openssh_7.5p1.bb |  8 +++++
 4 files changed, 63 insertions(+), 32 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/sshd-check-key

diff --git a/meta/recipes-connectivity/openssh/openssh/init b/meta/recipes-connectivity/openssh/openssh/init
index 386628a..2832e67 100644
--- a/meta/recipes-connectivity/openssh/openssh/init
+++ b/meta/recipes-connectivity/openssh/openssh/init
@@ -80,26 +80,11 @@ check_keys() {
 	[ -z "${HOST_KEY_ED25519}" ] && HOST_KEY_ED25519=$SYSCONFDIR/ssh_host_ed25519_key
 
 	# create keys if necessary
-	if [ ! -f $HOST_KEY_RSA ]; then
-		echo "  generating ssh RSA key..."
-		mkdir -p $(dirname $HOST_KEY_RSA)
-		ssh-keygen -q -f $HOST_KEY_RSA -N '' -t rsa
-	fi
-	if [ ! -f $HOST_KEY_ECDSA ]; then
-		echo "  generating ssh ECDSA key..."
-		mkdir -p $(dirname $HOST_KEY_ECDSA)
-		ssh-keygen -q -f $HOST_KEY_ECDSA -N '' -t ecdsa
-	fi
-	if [ ! -f $HOST_KEY_DSA ]; then
-		echo "  generating ssh DSA key..."
-		mkdir -p $(dirname $HOST_KEY_DSA)
-		ssh-keygen -q -f $HOST_KEY_DSA -N '' -t dsa
-	fi
-	if [ ! -f $HOST_KEY_ED25519 ]; then
-		echo "  generating ssh ED25519 key..."
-		mkdir -p $(dirname $HOST_KEY_ED25519)
-		ssh-keygen -q -f $HOST_KEY_ED25519 -N '' -t ed25519
-	fi
+	@LIBEXECDIR@/sshd-check-key $HOST_KEY_RSA rsa
+	@LIBEXECDIR@/sshd-check-key $HOST_KEY_ECDSA ecdsa
+	@LIBEXECDIR@/sshd-check-key $HOST_KEY_DSA dsa
+	@LIBEXECDIR@/sshd-check-key $HOST_KEY_ED25519 ed25519
+	@BASE_BINDIR@/sync
 }
 
 export PATH="${PATH:+$PATH:}/usr/sbin:/sbin"
diff --git a/meta/recipes-connectivity/openssh/openssh/sshd-check-key b/meta/recipes-connectivity/openssh/openssh/sshd-check-key
new file mode 100644
index 0000000..56c500d
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/sshd-check-key
@@ -0,0 +1,37 @@
+#! /bin/sh
+NAME="$1"
+TYPE="$2"
+
+if [ -z "$NAME" ] || [ -z "$TYPE" ]; then
+    echo "Usage: $0 NAME TYPE"
+    exit 1
+fi
+
+
+if [ ! -f "$NAME" ]; then
+    DIR="$(dirname "$NAME")"
+
+    mkdir -p "$DIR"
+
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
+    mv "${NAME}.tmp" "$NAME"
+fi
+
diff --git a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
index 148e6ad..23fd351 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
+++ b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
@@ -1,22 +1,23 @@
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
+ExecStart=@BASE_BINDIR@/sync
 Type=oneshot
 RemainAfterExit=yes
diff --git a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
index 5b96745..cdca7ee 100644
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
+		-e 's,@BASE_BINDIR@,${base_bindir},g' \
+		${D}${sysconfdir}/init.d/sshd
+
+	install -D -m 0755 ${WORKDIR}/sshd-check-key ${D}${libexecdir}/${BPN}/sshd-check-key
 }
 
 do_install_ptest () {
-- 
2.9.4


