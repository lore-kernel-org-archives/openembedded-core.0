Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8C5C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 14:30:00 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.773.1646836197712793709
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 06:29:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=kmaszxv1;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-017.002.205.pools.vodafone-ip.de
 [2.205.233.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6D82A8393E;
	Wed,  9 Mar 2022 15:29:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1646836194;
	bh=9p8gyc0vguKO4DQ14or5p9zbodQVx5mN4Tl0MRzo2Do=;
	h=From:To:Cc:Subject:Date:From;
	b=kmaszxv1LC2R6zXptdVWykT6u3a35guKV7g7LU6Wy1FdcQ23uKJlCg+tyzo5x2CFA
	 PHM1Y55JI5xzfZ8ll+AwsRixKrTubdBaAa2wNfVeQlflzMbgnha23qW3aBc1zOjE9f
	 nkB2uSs8AOymKBXpvpNYBxvCFo2sv+WgVGkZyyKxaIqf3pVyVo5hzOAgAfQnbPq9dD
	 EM42pG0sMKz2Ruy22QWJ9AZUAazV+UMAWRLf/WZbrLLtNsHaOCYq0qr9K1x6jsrhEH
	 kQYUX1EXWRb7TAxO0XQbclaB6XDOm6HWzVIktSfF5Cbl4cZD1bdLQkH6w+CmTMjJmF
	 OXTkc1e9ykMqg==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH] overlayfs: add systemd unit path prefix to FILES:${PN} array
Date: Wed,  9 Mar 2022 15:29:46 +0100
Message-Id: <20220309142946.3028564-1-ch@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 14:30:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162963

The 'FILES:${PN}' array is missing the systemd unit dir prefix causing
them to not be packaged and the build fails with the
`installed-vs-shipped` error.

This adds the `systemd_system_unitdir` variable in front of every unit
file added with this class.

Signed-off-by: Claudius Heine <ch@denx.de>
---
 meta/classes/overlayfs.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbcl=
ass
index 4a860f7308..f525ea6625 100644
--- a/meta/classes/overlayfs.bbclass
+++ b/meta/classes/overlayfs.bbclass
@@ -103,7 +103,8 @@ python () {
     unitList =3D unitFileList(d)
     for unit in unitList:
         d.appendVar('SYSTEMD_SERVICE:' + d.getVar('PN'), ' ' + unit)
-        d.appendVar('FILES:' + d.getVar('PN'), ' ' + strForBash(unit))
+        d.appendVar('FILES:' + d.getVar('PN'), ' ' +
+		d.getVar('systemd_system_unitdir') + '/' + strForBash(unit))
=20
     d.setVar('OVERLAYFS_UNIT_LIST', ' '.join([strForBash(s) for s in uni=
tList]))
 }
--=20
2.35.1


