Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0E3C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:04:38 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.19501.1708016670356532656
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:04:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=nk7OMqjf;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 96E2F9C32FC;
	Thu, 15 Feb 2024 12:04:29 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 8RWSnjyu2-g2; Thu, 15 Feb 2024 12:04:29 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 1F6B89C45A3;
	Thu, 15 Feb 2024 12:04:29 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 1F6B89C45A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1708016669; bh=xI79Lqi0pVGl99CZV1mLrqT29R5y1YeOz6nigbiJeSM=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=nk7OMqjf5VSqrWzsvSf3ydMvbOHZymiI1vOjkt+i8a7pJHJZYDLCUH27ancET0DvT
	 iUOt/sYBt042VueNBmVT1m090vsBADmQ3rqwe1cZufRgg8fCtyP8xZtPxUu511+MpK
	 sRAwIMUk83tPmNDcZi5EV965feXZ462zKo7SjwqITRMxJ66MRwbmr43oxrGKrhy8oo
	 SmbLuE3vKPXtwFO0JaV99YpaloxUO42Hn4EisS97GLAoGcX72FO6dXN4Twnh+iICw/
	 +M9vL5Gi0FD7abHUhGd3qGVE1vWlw5ynPJS5qeagQnLQvqmdBnwF3lCZH12Ecc5t5h
	 KtrpF72CiGndA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 8ji0Sr7pwADl; Thu, 15 Feb 2024 12:04:29 -0500 (EST)
Received: from sfl-deribaucourt.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 5D6879C32FC;
	Thu, 15 Feb 2024 12:04:28 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: adrian.freihofer@gmail.com,
	Ross.Burton@arm.com,
	mohammed.raza@savoirfairelinux.com,
	Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Subject: [PATCH 1/6] devtool: ide: Fix topdir exception for fallback mode
Date: Thu, 15 Feb 2024 18:04:17 +0100
Message-Id: <20240215170422.659073-2-enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215170422.659073-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
References: <20240215170422.659073-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195548

An exception was raised because we did not have the topdir attribute
which was used in fallback mode (non cmake/meson recipes).

Already in the merge queue in Adrian's latest patches.
---
 scripts/lib/devtool/ide_sdk.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk=
.py
index 3986dc1436a..db2e95616be 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -366,6 +366,7 @@ class RecipeModified:
         self.target_arch =3D recipe_d.getVar('TARGET_ARCH')
         self.topdir =3D recipe_d.getVar('TOPDIR')
         self.workdir =3D os.path.realpath(recipe_d.getVar('WORKDIR'))
+        self.topdir =3D os.path.realpath(recipe_d.getVar('TOPDIR'))
=20
         self.__init_exported_variables(recipe_d)
=20
--=20
2.34.1


