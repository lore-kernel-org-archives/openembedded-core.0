Return-Path: <patrick.vogelaar.dev@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71EA4E63C96
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 09:16:11 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35884.1769332569403825390
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jan 2026 01:16:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=BrbFDyLM;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=EZrq7Lub;
 spf=pass (domain: mailbox.org, ip: 80.241.56.161, mailfrom: patrick.vogelaar.dev@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dzQyH0Pp5z9srX;
	Sun, 25 Jan 2026 10:16:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769332567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cAAF3zk5OKNrS1ISEsBiVTS2O8hEYYXmE3+oNUT8iP4=;
	b=BrbFDyLMhYAohiFLGiXDW2jqtTF0iVy7sEmGHO5FnG9gNdlImtJREDMAdDRc32I3V0zrTV
	JiMA1gkmLPKbi+GcaxW4MvZw3Loh8/i6BnG2xHknFDGTA0GUIrgC5I4Ti6goJk1JnRHnNG
	10SHE0Nef4aQJyzIpcVsWBlOy12kKpovs7MKURs4jeVn1RCsshA8YotTAnEsdmsH39PWM9
	SCOHLBhltrIyCE97HalAhfpWMLaJKFU4O4u0TEPUtJqCJpcGDp1Y685QPMZ17qWZIgUQ9x
	YusPFO0N4IkplyFQVhg3IKa2ycdTI0otGmhlvInaCk+py/DOjWH6xltTX3d9aw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=EZrq7Lub;
	spf=pass (outgoing_mbo_mout: domain of patrick.vogelaar.dev@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=patrick.vogelaar.dev@mailbox.org
From: Patrick Vogelaar <patrick.vogelaar.dev@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1769332565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cAAF3zk5OKNrS1ISEsBiVTS2O8hEYYXmE3+oNUT8iP4=;
	b=EZrq7LubK8bg3wa1yaGHJbGBETUnMvZCBKrJ/kPYm5r2xp9US21jhVtgn/nYZ6MYgMEsoe
	srunlI/GIYnLeX3LwuZKARcC1HOfHzr/ZyYRPIZll/pQ/5zPSX6wmkrrVyZiht8513awWZ
	3LQOdTylKtCquB6N1OjHIxCGYuTeQGFVVhdfVxFVjLVY3b9tdlh+aO5DtyQA0p61k7snbn
	RRNI/BkM2VQKRUpvts7GxHEOet5Vg2h1DzINK0NaO7sdH9Y1W9lX9+/lHtZuvI17gV5y/i
	cYEdaMKyQ4gd9h5quaZFQON5JM3A3L8HA5DxD+L/q6o9RprO1ZDnc9nGDC/hcw==
To: patrick.vogelaar.dev@mailbox.org
Cc: openembedded-core@lists.openembedded.org,
	paul@pbarker.dev
Subject: [PATCH v2] openssh: add variable for key path
Date: Sun, 25 Jan 2026 10:15:40 +0100
Message-ID: <20260125091540.8808-1-patrick.vogelaar.dev@mailbox.org>
In-Reply-To: <20260102112702.110486-1-patrick.vogelaar.dev@mailbox.org>
References: <20260102112702.110486-1-patrick.vogelaar.dev@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: kjjy9ae31xk3tmkgpwge3c1dwt4gp7dz
X-MBO-RS-ID: 6350f9cc1090e7f0a06
X-Rspamd-Queue-Id: 4dzQyH0Pp5z9srX
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jan 2026 09:16:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229928

This patch adds a variable for the key directory path. This is especially
useful when working with a read-only file system where you want to
specify the location e.g. on a r/w partition. To be consistent, the
change was also done for the read write path.

For changing the path simply create a bbappend and override the
variable.

Signed-off-by: Patrick Vogelaar <patrick.vogelaar.dev@mailbox.org>
---
 .../openssh/openssh_10.2p1.bb                    | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_10.2p1.bb b/meta/r=
ecipes-connectivity/openssh/openssh_10.2p1.bb
index 866129573f..d8ea487ae3 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
@@ -99,6 +99,10 @@ CACHED_CONFIGUREVARS +=3D "ac_cv_path_PATH_PASSWD_PROG=
=3D${bindir}/passwd"
 # We don't want to depend on libblockfile
 CACHED_CONFIGUREVARS +=3D "ac_cv_header_maillock_h=3Dno"
=20
+# This allows overriding the key location
+OPENSSH_HOST_KEY_DIR_READONLY_CONFIG ?=3D "/var/run/ssh"
+OPENSSH_HOST_KEY_DIR ?=3D "/etc/ssh"
+
 do_configure:prepend () {
 	export LD=3D"${CC}"
 	install -m 0600 ${UNPACKDIR}/sshd_config ${B}/
@@ -113,24 +117,24 @@ sshd_hostkey_setup() {
 	# Enable specific ssh host keys
 	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config
 	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-rsa','true','false',d)=
}; then
-		echo "HostKey /etc/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/sshd=
_config
+		echo "HostKey ${OPENSSH_HOST_KEY_DIR}/ssh_host_rsa_key" >> ${D}${sysco=
nfdir}/ssh/sshd_config
 	fi
 	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ecdsa','true','false',=
d)}; then
-		echo "HostKey /etc/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/ss=
hd_config
+		echo "HostKey ${OPENSSH_HOST_KEY_DIR}/ssh_host_ecdsa_key" >> ${D}${sys=
confdir}/ssh/sshd_config
 	fi
 	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ed25519','true','false=
',d)}; then
-		echo "HostKey /etc/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/=
sshd_config
+		echo "HostKey ${OPENSSH_HOST_KEY_DIR}/ssh_host_ed25519_key" >> ${D}${s=
ysconfdir}/ssh/sshd_config
 	fi
=20
 	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config_readonly
 	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-rsa','true','false',d)=
}; then
-		echo "HostKey /var/run/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/=
sshd_config_readonly
+		echo "HostKey ${OPENSSH_HOST_KEY_DIR_READONLY_CONFIG}/ssh_host_rsa_key=
" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 	fi
 	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ecdsa','true','false',=
d)}; then
-		echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ss=
h/sshd_config_readonly
+		echo "HostKey ${OPENSSH_HOST_KEY_DIR_READONLY_CONFIG}/ssh_host_ecdsa_k=
ey" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 	fi
 	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ed25519','true','false=
',d)}; then
-		echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/=
ssh/sshd_config_readonly
+		echo "HostKey ${OPENSSH_HOST_KEY_DIR_READONLY_CONFIG}/ssh_host_ed25519=
_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 	fi
 }
=20
--=20
2.43.0


