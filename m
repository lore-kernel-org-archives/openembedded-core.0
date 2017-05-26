Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 249967820F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 01:54:32 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id c15so66620637ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 18:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GZ50c30k+qC4by9UBHza5UCKFQOYDjBNe7Q5Ty5h39U=;
	b=SV7FAxFiZqgJysnrV1c9wTaSVu0hNHEdhtb5pbUkuQWaFmV2z/YLZ6LkoOWuosLQDL
	9cPVcwRUTfvhUYWNVBzs/wBt6FO6O1I+LyEwnac5joed2KczQ+AgnJ5MYAlOHl4fsXC1
	KxmSTeQNIhAoFCMi8fiUmiBwwi188rbIrdmT9gFjP/C0iTF1+eSH9PqSqD2QtQhLREmw
	7c68FLvzZzA/ajKzil0U1Fa2Lx9UtIwtaLEcCP40LHesK01gmfukkvsxWKIHYCLIPDKE
	HnuWyp7fTxEncUbpRCV1f1X6XC4b6m2q0DDhBqRz8mVbvpZK80oOb5v+sK9h8lQ86mKY
	kbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GZ50c30k+qC4by9UBHza5UCKFQOYDjBNe7Q5Ty5h39U=;
	b=l3XiuDWdyVnOT67NH/jvs7E2ZMIPrddtyD2scSlpEa60jwznSwpEhr1LDdKY02TWh7
	DkXP6m1iydwGD7mbHRJyaJXKanFHqtT/Nnm4afrCTW44x6WiI1dvZPwY43Fn+1H4RJ4Y
	xR1lIhs2fIxKPfonfMAgGRoWuEAjOwdG34c8om5OtpyaPjN4wnRcY/5krzgxAHjmtJvo
	XujbPhlOBMuVsLIpQLIw1U80IadShijqNgZEyqyP9B+ucbgtoKw1xPT4RMfYQj93x03Q
	iWMs4jPGSeEDNv3cJJEVktUAVxhd+AxlYNk+4Gedj+PceCsVnhrwNIUz9zuYKNdB94IP
	KsBg==
X-Gm-Message-State: AODbwcC/5+BwAwiFZ2YmRqbJAXqRdAXVoEHtpVvGXfPuRI/V2iQP6XLp
	nXmgCCp68XP6iALCAQ8=
X-Received: by 10.36.252.66 with SMTP id b63mr2354562ith.21.1495763673290;
	Thu, 25 May 2017 18:54:33 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.gmail.com with ESMTPSA id
	e21sm3822002ioj.15.2017.05.25.18.54.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 May 2017 18:54:31 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 May 2017 20:54:28 -0500
Message-Id: <20170526015428.13714-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <CAJdd5GYuBbqarXs38M91atDyQhz17EcPDE9yKme-oiwDjCtaaA@mail.gmail.com>
References: <CAJdd5GYuBbqarXs38M91atDyQhz17EcPDE9yKme-oiwDjCtaaA@mail.gmail.com>
Subject: [meta-oe][PATCH v5] openssh: Atomically generate host keys
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
X-List-Received-Date: Fri, 26 May 2017 01:54:32 -0000

Generating the host keys atomically prevents power interruptions during
the first boot from leaving the key files incomplete, which often
prevents users from being able to ssh into the device.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh/init     | 22 +++----------
 .../openssh/openssh/sshd-check-key                 | 36 ++++++++++++++++++++++
 .../openssh/openssh/sshdgenkeys.service            | 25 +++++++--------
 meta/recipes-connectivity/openssh/openssh_7.5p1.bb |  9 ++++++
 4 files changed, 63 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/sshd-check-key

diff --git a/meta/recipes-connectivity/openssh/openssh/init b/meta/recipes-connectivity/openssh/openssh/init
index 1f63725..e02c479 100644
--- a/meta/recipes-connectivity/openssh/openssh/init
+++ b/meta/recipes-connectivity/openssh/openssh/init
@@ -45,23 +45,11 @@ check_config() {
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
+    @BASE_BINDIR@/sync
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
index 5b96745..c1fcda4 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://openssh-7.1p1-conditional-compile-des-in-cipher.patch \
            file://openssh-7.1p1-conditional-compile-des-in-pkcs11.patch \
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
+           file://sshd-check-key \
            "
 
 PAM_SRC_URI = "file://sshd"
@@ -124,7 +125,15 @@ do_install_append () {
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
+	install -d ${D}${libexecdir}/${BPN}
+	install -m 0755 ${WORKDIR}/sshd-check-key ${D}${libexecdir}/${BPN}
 }
 
 do_install_ptest () {
-- 
2.9.3


