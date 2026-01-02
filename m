Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C63FA3744
	for <webhook@archiver.kernel.org>; Fri,  2 Jan 2026 12:40:08 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3543.1767353251208820680
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jan 2026 03:27:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=eL5JMktn;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=AzZiF84H;
 spf=pass (domain: mailbox.org, ip: 80.241.56.171, mailfrom: patrick.vogelaar.dev@mailbox.org)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4djLyS41Pnz9sSJ
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Jan 2026 12:27:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767353248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MJsegDWHhLh68btnSBA3JnTfR+NDGsRWuAG3HfLkQmo=;
	b=eL5JMktn8vMRntcub/DyhOj3JI7lxC2AxNVQiWnlSzmq7aVzCVuo5F2yyThqwGCUmvpfKk
	7sBdQ6fuh+LeM4yLrObrw84A39nyxpjEGz+CVJ7p99jHJ1c1YtLMr1fA6qN+gu1IuDcw5H
	lm+wyRbFVeMb73TXslVUzaFO3AJiuY6SRT02293+gLo+yt7fTK6Ak5FZMgsWpA+tsZr5wV
	YnNXVaH5qu0Loup6nmotpRtd2Dp2onsRl7HhWmeKPTuV+T4TtVaGn0xa3A8pXb0TKqO5V+
	S6DD1nu9QzrCZcj4UXlAzl5mDGdr1w7yms3dJS4rs3QfyS4lOugddE3Ad+SHPA==
From: "Patrick Vogelaar" <patrick.vogelaar.dev@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767353246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MJsegDWHhLh68btnSBA3JnTfR+NDGsRWuAG3HfLkQmo=;
	b=AzZiF84Hg1DH2oqsD579XefXqwn5NykkLJX3qk4UeCr2WZJqJU4HF6MlTM3Gw12i/Pq44C
	Dibv1XdmQ5FqWUaY1YxTf5MDixuxueg0D/RrKcStjiG7c3hYzp+dgrQW0FLYitCHQye5xl
	RL/0MP5+9A+FUeJFx22KiQ0sr7weFO59DZSYuLgCOV/dDof/pL6C8b9MtGr81OmJFr80Xv
	1RGdh01vJbF+RjX3qL3evjT67SJfGtxCkNQ3UavZlxnkh6pvYX9P/1Z0737Ku9kAL7wfQe
	Rl2lU83f6b63igEjimb5CFCBqHlFTyHac96J1Qlb/Bkiq81kQIqQu+YT2fs+GA==
To: openembedded-core@lists.openembedded.org
Cc: Patrick Vogelaar <patrick.vogelaar.dev@mailbox.org>
Subject: [PATCH] openssh: add variable for key path
Date: Fri,  2 Jan 2026 12:27:02 +0100
Message-ID: <20260102112702.110486-1-patrick.vogelaar.dev@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 7538287a9fad4d13f39
X-MBO-RS-META: 7hkr4s63x84crzyzfcb17gp7semkwico
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jan 2026 12:40:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228843

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
index 866129573f..e319f4ac24 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.2p1.bb
@@ -99,6 +99,10 @@ CACHED_CONFIGUREVARS +=3D "ac_cv_path_PATH_PASSWD_PROG=
=3D${bindir}/passwd"
 # We don't want to depend on libblockfile
 CACHED_CONFIGUREVARS +=3D "ac_cv_header_maillock_h=3Dno"
=20
+# This allows overriding the key location in a bbappend
+RO_SSH_KEY_DIR ?=3D "/var/run/ssh"
+SSH_KEY_DIR ?=3D "/etc/ssh"
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
+		echo "HostKey ${SSH_KEY_DIR}/ssh_host_rsa_key" >> ${D}${sysconfdir}/ss=
h/sshd_config
 	fi
 	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ecdsa','true','false',=
d)}; then
-		echo "HostKey /etc/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/ss=
hd_config
+		echo "HostKey ${SSH_KEY_DIR}/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/=
ssh/sshd_config
 	fi
 	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ed25519','true','false=
',d)}; then
-		echo "HostKey /etc/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/=
sshd_config
+		echo "HostKey ${SSH_KEY_DIR}/ssh_host_ed25519_key" >> ${D}${sysconfdir=
}/ssh/sshd_config
 	fi
=20
 	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config_readonly
 	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-rsa','true','false',d)=
}; then
-		echo "HostKey /var/run/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/=
sshd_config_readonly
+		echo "HostKey ${RO_SSH_KEY_DIR}/ssh_host_rsa_key" >> ${D}${sysconfdir}=
/ssh/sshd_config_readonly
 	fi
 	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ecdsa','true','false',=
d)}; then
-		echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ss=
h/sshd_config_readonly
+		echo "HostKey ${RO_SSH_KEY_DIR}/ssh_host_ecdsa_key" >> ${D}${sysconfdi=
r}/ssh/sshd_config_readonly
 	fi
 	if ${@bb.utils.contains('PACKAGECONFIG','hostkey-ed25519','true','false=
',d)}; then
-		echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/=
ssh/sshd_config_readonly
+		echo "HostKey ${RO_SSH_KEY_DIR}/ssh_host_ed25519_key" >> ${D}${sysconf=
dir}/ssh/sshd_config_readonly
 	fi
 }
=20
--=20
2.43.0


