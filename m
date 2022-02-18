Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F457C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 07:35:50 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web08.8097.1645169749314391375
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 23:35:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout07.t-online.de (Postfix) with SMTP id AD78B1094F
	for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 08:35:47 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.45.78]) by fwd73.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nKxnv-3e1NMv0; Fri, 18 Feb 2022 08:35:47 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [OE-core][PATCH] bitbake.conf: add ssh-keygen to HOSTTOOLS_NONFATAL
Date: Fri, 18 Feb 2022 08:35:35 +0100
Message-Id: <20220218073535.5097-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1645169747-0000C4DD-0E7BEC38/0/0 CLEAN NORMAL
X-TOI-MSGID: 1493cc83-9c99-414f-8e23-a9ea0e12f3f4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 07:35:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161883

Gnome Seahorse needs an external ssh-keygen to build and there is no prov=
ider
for it in yocto/oe. openssh-native is not allowed to build and if allowed=
 there
are problems building it with '--enable-pam'.

'ssh' is already set to be added as a HOSTTOOL when it is found.
This commit also adds ssh-keygen.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index fba99e8f0c..15ea0bc29e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -499,7 +499,7 @@ HOSTTOOLS +=3D " \
 HOSTTOOLS +=3D "${@'ip ping ps scp ssh stty' if (bb.utils.contains_any('=
IMAGE_CLASSES', 'testimage testsdk', True, False, d) or any(x in (d.getVa=
r("BBINCLUDED") or "") for x in ["testimage.bbclass", "testsdk.bbclass"])=
) else ''}"
=20
 # Link to these if present
-HOSTTOOLS_NONFATAL +=3D "aws gcc-ar gpg gpg-agent ld.bfd ld.gold nc pigz=
 sftp socat ssh sudo"
+HOSTTOOLS_NONFATAL +=3D "aws gcc-ar gpg gpg-agent ld.bfd ld.gold nc pigz=
 sftp socat ssh ssh-keygen sudo"
=20
 # Temporary add few more detected in bitbake world
 HOSTTOOLS_NONFATAL +=3D "join nl size yes zcat"
--=20
2.25.1


