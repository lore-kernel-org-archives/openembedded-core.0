Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0B5B471ADA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 02:24:39 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id o12so33745465iod.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 May 2017 19:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jv6TQ8iAYdkR53ggGUFQuNY8M8ulHI0AXLla5R+nijg=;
	b=XrLKpWGCoo85jh2aDFRi0c+WLEZuuUO93iH1n+k0gLAPQUaBg+QYzCZmejR7eMJUtB
	TFI0XwoMAmm43dlw11RdmGhyY+hBPEO1rwYjOxGbRrfX0seTHDIrKgH7iFDlV3ua/+d4
	dcCX2gLNdPDQIvy7WrZgfgkRL0NyKGM0GBK3nRuCtdQnJ54XPxsX7Y1AkVJ/121jGuyy
	8HjXQjrGXLld2d75gfFFUlwLjt7EHGMsAAUXMXaeSaHIUct8Wm9l3ARDuXDHCvUPDnsD
	dcevKnvKL/RdMmIyU1uItHt4oP7ehIfO5RjVCVYeP9+KTVSdI5VfrZcPETIxfp0pwNTP
	+aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jv6TQ8iAYdkR53ggGUFQuNY8M8ulHI0AXLla5R+nijg=;
	b=VxqaTRrcDMU1KDpJsg0z8EZZzpO3EjmaU8DQEAbh3wbVs9dnZv4wMMxD9P7AbQiLFM
	wRm9s9ePlICKS2i/qL8QhGVfDQHx0gQWp4U7wRCiO1kMOOsjSdS8iK6jcPy3NcBKqfCM
	5hSK3PoDJZK3ANBuGf84aYlVanmsLCmdotYM3QFc3Poh9pFY6T8bPJgMofF/fkPSZAoI
	Ki0wfkd1tY/np+8Y9eNGizZ/+imyJsUke5/2ULBrWnDH9pR/HqmQmTdls9mGHY9eKsa2
	O92uriZioRYR7HjSupAlSk/95oBjXjEPwPY+IhICq0WieYJObrRj8/JTQGNmIcYuQ97A
	oORw==
X-Gm-Message-State: AODbwcDJBn8vRhOSMlmgyXT9r2cxmZ1gtk7IjlOOe00iBbdLFN6b4syv
	3GO4kP3ypw/ozw==
X-Received: by 10.107.170.201 with SMTP id g70mr13749700ioj.187.1494296680725; 
	Mon, 08 May 2017 19:24:40 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.gmail.com with ESMTPSA id
	l136sm5467988itb.15.2017.05.08.19.24.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 May 2017 19:24:39 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 May 2017 21:24:32 -0500
Message-Id: <20170509022432.23274-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170509022432.23274-1-JPEWhacker@gmail.com>
References: <20170507013304.30165-1-JPEWhacker@gmail.com>
	<20170509022432.23274-1-JPEWhacker@gmail.com>
Subject: [PATCH v2] openssh: Atomically generate host keys
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
X-List-Received-Date: Tue, 09 May 2017 02:24:40 -0000

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
index c8093d4..ad27342 100644
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
+	install -d ${D}${libexecdir}/${BPN}
+	install -m 0755 ${WORKDIR}/sshd-check-key ${D}${libexecdir}/${BPN}
 }
 
 do_install_ptest () {
-- 
2.9.3


