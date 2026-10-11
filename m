Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6120BCA9EC7
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 19:50:18 +0000 (UTC)
Received: from mailrelay-egress16.pub.mailoutpod3-cph3.one.com (mailrelay-egress16.pub.mailoutpod3-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30595.1791740591789302519
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 10:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@embetrix.com header.s=rsa1 header.b=TyHDRnYH;
 dkim=pass header.i=@embetrix.com header.s=ed1 header.b=Fu4pLFOZ;
 spf=none, err=permanent DNS error (domain: embetrix.com, ip: 46.30.212.3, mailfrom: ayoub.zaki@embetrix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1791740590; x=1792345390;
	d=embetrix.com; s=rsa1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=6gztZwlNVZ0pCyUXvxVTHIC0dPxLOKMY/o7tkj9peP0=;
	b=TyHDRnYHzYeyt9g4kzWgWLsHdx4gBVJAEVE0TU14+VGNYjLtr6dq5HXIH8hPUm3gn1kGSmhzcb7+N
	 TuXQ6pGCXyaxatUmayiat8QFeW1GGKt8+iIxAmC09YIPg5cH//6LGzNdZyXRcjtEE1Zx3CXbF21Syl
	 X49dXeB8quO5mckv/gnM/FbE6c0h/2wUx0Oru8MVY+hQWoK67fyhlOhn3377sJ1nKb0yBcsj7MuKJc
	 xsEiInU9V5RwHft9jI4DrcjdqeGYUGysgTtuSf6hcmjm5+zijXXORkzEDEiimmUy+PG71M6z98wNYb
	 ot6VBJpkSW/TgYBWH8TWLxG+1LFd1Nw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1791740590; x=1792345390;
	d=embetrix.com; s=ed1;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=6gztZwlNVZ0pCyUXvxVTHIC0dPxLOKMY/o7tkj9peP0=;
	b=Fu4pLFOZuPdzPQVMuK6TnA+Ax+u2OqwiOxDTWXgeR3PhaPg5YPohVEbrGxe/qs3F0GiqXJUREtiF5
	 +Y605R9DQ==
X-HalOne-ID: 38acc813-c59b-11f1-aa68-df8125a0c701
Received: from xps-13.fritz.box (dynamic-2a02-3102-8c10-1ae0-4918-3389-416e-e9a4.310.pool.telefonica.de [2a02:3102:8c10:1ae0:4918:3389:416e:e9a4])
	by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 38acc813-c59b-11f1-aa68-df8125a0c701;
	Sun, 11 Oct 2026 17:43:09 +0000 (UTC)
From: "Ayoub Zaki" <ayoub.zaki@embetrix.com>
To: openembedded-core@lists.openembedded.org
Cc: Ayoub Zaki <ayoub.zaki@embetrix.com>
Subject: [PATCH 2/2] openssh: enable ML-DSA-44/Ed25519 host keys by default
Date: Sun, 11 Oct 2026 19:43:05 +0200
Message-ID: <20261011174305.2610435-3-ayoub.zaki@embetrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261011174305.2610435-1-ayoub.zaki@embetrix.com>
References: <20261011174305.2610435-1-ayoub.zaki@embetrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 19:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247579

OpenSSH 10.6 enables the hybrid ML-DSA-44/Ed25519 signature algorithm.
Enable this PQ host key type by default beside ECDSA for normal and
read-only configurations.
Match the hybrid filename before the Ed25519 suffix to avoid generating 
a classical key for the hybrid key path.

Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
---
 .../recipes-connectivity/openssh/openssh/sshd_check_keys | 5 +++++
 meta/recipes-connectivity/openssh/openssh/sshd_config    | 1 +
 meta/recipes-connectivity/openssh/openssh_10.6p1.bb      | 9 ++++++++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
index bbb6a14908..7eb62b5162 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
+++ b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
@@ -70,6 +70,11 @@ for key in ${HOST_KEYS} ; do
         echo "  generating ssh ECDSA host key..."
         generate_key $key ecdsa
         ;;
+    # match the hybrid key before the generic Ed25519 suffix
+    *_mldsa44_ed25519_key)
+        echo "  generating ssh ML-DSA-44/ED25519 host key..."
+        generate_key $key mldsa44-ed25519
+        ;;
     *_ed25519_key)
         echo "  generating ssh ED25519 host key..."
         generate_key $key ed25519
diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_config b/meta/recipes-connectivity/openssh/openssh/sshd_config
index e9eaf93157..fbeb7ee7b0 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd_config
+++ b/meta/recipes-connectivity/openssh/openssh/sshd_config
@@ -20,6 +20,7 @@ Include /etc/ssh/sshd_config.d/*.conf
 #HostKey /etc/ssh/ssh_host_rsa_key
 #HostKey /etc/ssh/ssh_host_ecdsa_key
 #HostKey /etc/ssh/ssh_host_ed25519_key
+#HostKey /etc/ssh/ssh_host_mldsa44_ed25519_key
 
 # Ciphers and keying
 #RekeyLimit default none
diff --git a/meta/recipes-connectivity/openssh/openssh_10.6p1.bb b/meta/recipes-connectivity/openssh/openssh_10.6p1.bb
index 6043f140b3..bad22b879c 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.6p1.bb
@@ -58,7 +58,7 @@ inherit autotools-brokensep ptest pkgconfig
 
 # systemd-sshd-socket-mode means installing sshd.socket
 # and systemd-sshd-service-mode corresponding to sshd.service
-PACKAGECONFIG ??= "systemd-sshd-socket-mode hostkey-ecdsa"
+PACKAGECONFIG ??= "systemd-sshd-socket-mode hostkey-ecdsa hostkey-mldsa44-ed25519"
 PACKAGECONFIG[fido2] = "--with-security-key-builtin,--disable-security-key,libfido2"
 PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
 PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
@@ -69,6 +69,7 @@ PACKAGECONFIG[systemd-sshd-service-mode] = ""
 PACKAGECONFIG[hostkey-rsa] = ""
 PACKAGECONFIG[hostkey-ecdsa] = ""
 PACKAGECONFIG[hostkey-ed25519] = ""
+PACKAGECONFIG[hostkey-mldsa44-ed25519] = ""
 
 # login path is hardcoded in sshd
 EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
@@ -127,6 +128,9 @@ sshd_hostkey_setup() {
 	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ed25519','true','false',d)}; then
 		echo "HostKey ${OPENSSH_HOST_KEY_DIR}/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config
 	fi
+	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-mldsa44-ed25519','true','false',d)}; then
+		echo "HostKey ${OPENSSH_HOST_KEY_DIR}/ssh_host_mldsa44_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config
+	fi
 
 	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config_readonly
 	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-rsa','true','false',d)}; then
@@ -138,6 +142,9 @@ sshd_hostkey_setup() {
 	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ed25519','true','false',d)}; then
 		echo "HostKey ${OPENSSH_HOST_KEY_DIR_READONLY_CONFIG}/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 	fi
+	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-mldsa44-ed25519','true','false',d)}; then
+		echo "HostKey ${OPENSSH_HOST_KEY_DIR_READONLY_CONFIG}/ssh_host_mldsa44_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
+	fi
 }
 
 do_install:append () {
-- 
2.43.0


