Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E5EC433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 13:13:36 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.9216.1646918014562522492
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 05:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=GMknQYfh;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-017.002.205.pools.vodafone-ip.de
 [2.205.233.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id BEB1583AAD;
	Thu, 10 Mar 2022 14:13:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1646918012;
	bh=7uyqnZnwMCLaZRUNF+mOEyPP3+YzZCnemd1tOu+lGJc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GMknQYfhQ1ZWY8sveZ5WN3JNirgZpb3PZUfL7FtDun62iU63hnZw9fAwtC1SVSyox
	 i9F+tfrxZpr7sMo/+j2eluPwpPC4B1k//RNxZQAKcEnrFVTbDc4lHQKNhEer7GlZwb
	 OgcStu8uTCL0fLGrDowTWjWuiLPJhpF2eHepyytOuxeS1n8JQYcFxOSUCoT1TZRSjc
	 i49X81nnYHuE+h1HM8Rri4F86Oed0XeBoCt1SvZX/J1KIW0zaZ8zVo0S6xQXCkwKak
	 BFKwIT3r3h0LD8PSYriYJT2A3oou4rQcFrGYAefq01PPE6YGZg4TFJNCHbqN5BJtbI
	 Kzf0UMBaQtp4w==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH v2 2/4] overlayfs: add systemd unit path prefix to FILES:${PN}
 array
Date: Thu, 10 Mar 2022 14:13:27 +0100
Message-Id: <20220310131329.1906537-3-ch@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310131329.1906537-1-ch@denx.de>
References: <20220310131329.1906537-1-ch@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 13:13:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163018

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
index 4a860f7308..25e30aee83 100644
--- a/meta/classes/overlayfs.bbclass
+++ b/meta/classes/overlayfs.bbclass
@@ -103,7 +103,8 @@ python () {
     unitList =3D unitFileList(d)
     for unit in unitList:
         d.appendVar('SYSTEMD_SERVICE:' + d.getVar('PN'), ' ' + unit)
-        d.appendVar('FILES:' + d.getVar('PN'), ' ' + strForBash(unit))
+        d.appendVar('FILES:' + d.getVar('PN'), ' ' +
+        d.getVar('systemd_system_unitdir') + '/' + strForBash(unit))
=20
     d.setVar('OVERLAYFS_UNIT_LIST', ' '.join([strForBash(s) for s in uni=
tList]))
 }
--=20
2.35.1


