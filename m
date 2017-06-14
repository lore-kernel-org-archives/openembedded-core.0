Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id D0DF1780F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 03:32:23 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id m47so48819006iti.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 20:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S2yWLU3X1ayLFGI4GFZX+7tu4wZHdNu8OZnRpc3eNWI=;
	b=cQFMRmocl+gZHSBNoeNxiiUWNmUMAiDxylDj7qfILoKIOvsE3ToAzlRAJ9Y561dcaW
	QE55K+WEYWVTfgFe/jUFKwBzQUn9S2rUApw9eXcHuXN1G1b3KfL/9yNdWC0GxXKBs3pe
	0E9vkBSWeL1IJGxfeK28z7dmVPHVIds2Wg9LgkFfERhxI+Rhsxbp4SmbX5ZrAHZKeqYN
	H55oQE60QXaQl+txgIHXB9SwZ0/eHoZmuSdSgbzYbVjMdGCogzRIEXyLpCozA66jygnv
	OBql+1QFVQbVtfLK/HfVykuz64kBDwUxTCspcorATpxCnu7E60ixtrrIFe2AMkPhedPm
	9E9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S2yWLU3X1ayLFGI4GFZX+7tu4wZHdNu8OZnRpc3eNWI=;
	b=lHPXe3ZbWAB+qwQ0bND5m7daWpggTBU0gunrgjfNw8lPv3Cb9Fl+2D8hoCj2L6pVUb
	cxFCyHQl858jbDk4/yW6e1XyYgsSOkUXsLWUiObHNn1FEPM/rhfIePsu/QRjjDk/60dM
	OJ3VmnuJVICaFab66ORJZXAnlCNShJdQ8Usx1yFKXURxOOqxU6pPTkM/yHjmVF4kMQXu
	ZbzxZ8hdX+oIvITxwLBod+ROeaFn2Hmssw+zATB1AJaJfMnBM66FiSGS4dZhrfmN8s/M
	4n/0DdAJXOu4UgPxVLoXmMsLSTHjQcirneV8E7wW9p4MTcY6oGsRoS3r99Tzk7cVfhRV
	3w5A==
X-Gm-Message-State: AKS2vOzbT+mQKGP4NoaunsLTlkR7ibn589Jn1yhRi05hL3iFzQjOYZDX
	GmaTdGFxFo34AjhDAHM=
X-Received: by 10.36.13.16 with SMTP id 16mr116959itx.22.1497411144365;
	Tue, 13 Jun 2017 20:32:24 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.gmail.com with ESMTPSA id
	c77sm7397798iod.24.2017.06.13.20.32.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Jun 2017 20:32:23 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 22:31:34 -0500
Message-Id: <20170614033134.4733-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <CAJdd5GYuBbqarXs38M91atDyQhz17EcPDE9yKme-oiwDjCtaaA@mail.gmail.com>
References: <CAJdd5GYuBbqarXs38M91atDyQhz17EcPDE9yKme-oiwDjCtaaA@mail.gmail.com>
Subject: [PATCH v8] openssh: Atomically generate host keys
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
X-List-Received-Date: Wed, 14 Jun 2017 03:32:24 -0000

Generating the host keys atomically prevents power interruptions during
the first boot from leaving the key files incomplete, which often
prevents users from being able to ssh into the device.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh/init     | 24 +++--------------
 .../openssh/openssh/sshd-check-key                 | 30 ++++++++++++++++++++++
 .../openssh/openssh/sshdgenkeys.service            | 16 +++---------
 meta/recipes-connectivity/openssh/openssh_7.5p1.bb |  8 ++++++
 4 files changed, 46 insertions(+), 32 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/sshd-check-key

diff --git a/meta/recipes-connectivity/openssh/openssh/init b/meta/recipes-connectivity/openssh/openssh/init
index 386628a..acb35c3 100644
--- a/meta/recipes-connectivity/openssh/openssh/init
+++ b/meta/recipes-connectivity/openssh/openssh/init
@@ -80,26 +80,10 @@ check_keys() {
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
 }
 
 export PATH="${PATH:+$PATH:}/usr/sbin:/sbin"
diff --git a/meta/recipes-connectivity/openssh/openssh/sshd-check-key b/meta/recipes-connectivity/openssh/openssh/sshd-check-key
new file mode 100644
index 0000000..4999af2
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/sshd-check-key
@@ -0,0 +1,30 @@
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
+    mkdir -p "$(dirname "$NAME")"
+
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
2.9.4


