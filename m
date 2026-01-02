Return-Path: <patrick.vogelaar.dev@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BB7FA3734
	for <webhook@archiver.kernel.org>; Fri,  2 Jan 2026 11:35:08 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3624.1767353698409913949
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jan 2026 03:34:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=pL5cgySI;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=rrlBQ+g9;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151, mailfrom: patrick.vogelaar.dev@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4djM741Spdz9syY
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Jan 2026 12:34:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767353696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MJsegDWHhLh68btnSBA3JnTfR+NDGsRWuAG3HfLkQmo=;
	b=pL5cgySIIJ3FOuWGV8h1+73xwTywsK/T+358MCpfsZ/78Hqe8rLzv+c5EpZAQh5TKkegOP
	3C/xS8RBHjLjHEAcxmJO1+q2C3nZMRO/u3o1ZABIMIURRpWeJwA3udjSBs3S1soAEXUMZZ
	cFv35d/MYIhcrmieNl+TeNiDCmvuUxKHuLBTEDnqXwodDkIGhb2s5kMN47wSbRGVIVFbQT
	GtuudMUYscH5aM4PBubrdk862cJP+K6IDf6jBQ1RWphoq5IC7zawY+2RYNXnu5nNNVFvHn
	1wxFZxg19GaxiQ33yBs/fZSwhG/dLD3F62wlZ6a/F+IAT9POPA5HNEkZLFQX9Q==
From: Patrick Vogelaar <patrick.vogelaar.dev@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767353695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MJsegDWHhLh68btnSBA3JnTfR+NDGsRWuAG3HfLkQmo=;
	b=rrlBQ+g9K5iQebUhCQrTwNC6X9rzaxkZTsP+V1sHXDEcLYSTJAY9EAjlBALFa+G+3db500
	szt6kgcznZZCl2Eax63iahDcAZuzVLb7Ujjh4oFNzP7Vx3cnSJIFpFOyjTjWNs6JLk/flN
	au4E/6+M2DUUmcBhV2mT7qiIl3G0dPN+igv/n3DRkXzZ9GLu2zwcseA/448QFAtuAEMx3g
	qvIo51DjoU/+HK4eNgG7dRAhQGbx/kJlGiJ7CZc/nGb7gYpKXgZ7FSAo4VAbE9TAoENu64
	YFnv0QZ108wvbJOO1quPsDd566sPUm+g/BnFcfFmur9WucJdKuVDk83o1ienSg==
To: openembedded-core@lists.openembedded.org
Cc: Patrick Vogelaar <patrick.vogelaar.dev@mailbox.org>
Subject: [PATCH] openssh: add variable for key path
Date: Fri,  2 Jan 2026 12:34:31 +0100
Message-ID: <20260102113431.110598-1-patrick.vogelaar.dev@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: awuebutgz69bo7ucodtwrccuak46swni
X-MBO-RS-ID: 2026739f16eccba9356
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jan 2026 11:35:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228835

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


