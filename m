Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3E3C5478A
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 16:55:42 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.46410.1708361734842495914
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 08:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=cVcAWMnm;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 2333E9C4165;
	Mon, 19 Feb 2024 11:55:34 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id vrC-r774zUUO; Mon, 19 Feb 2024 11:55:33 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 8D4B39C4B14;
	Mon, 19 Feb 2024 11:55:33 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 8D4B39C4B14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1708361733; bh=BKXaBXOoNpO7d5LxHTOiUSMNlSyT9qkwhf7K/5etkqA=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=cVcAWMnmO6qafautOaGPffxDqjRwd2CEunWAvvyZ9wx67STReQEP3CJkzR6PPUiIV
	 30ifGjOCgl1jdk/9UH/Z1cgeTy3Hrhnw/nIAJpkjBvaGbKMmRYZT2fY385Ji3lZyOM
	 y+HNsc03S30lCkdaW0eZYNPAVVwHVco8B3TktzF1xb+JqShgrRB1bdlGR4IBnSVcAH
	 0Zf01OTv5fJH39Vl8oPpOO0xeROoiSvhQO37urTX1+1BM/Sejsu+MOtK8OLmI4e9yi
	 E4x8LoVqm+Z6ptMSg32orEU0k3W6AGACyXNfVn9EhC0LFy5WQRZ2cxSUa3q016SdtT
	 k8hB6NBmnGgcg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id qIgBZ8JoOU97; Mon, 19 Feb 2024 11:55:33 -0500 (EST)
Received: from sfl-deribaucourt.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id A8D0A9C4165;
	Mon, 19 Feb 2024 11:55:32 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: adrian.freihofer@gmail.com,
	Ross.Burton@arm.com,
	mohammed.raza@savoirfairelinux.com,
	Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Subject: [PATCH v2 1/5] devtool: ide_sdk: Use bitbake's python3 for generated scripts
Date: Mon, 19 Feb 2024 17:55:21 +0100
Message-Id: <20240219165525.714512-2-enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219165525.714512-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
References: <20240219165525.714512-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 16:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195886

The generated scripts use the sys.path configuration found inside
bitbake. It can be a different python version than the one used on the
host through the IDE.

For instance, when running the generated script
deploy_target_cmake-example-core2-64 from an eSDK generated on another
machine, I got the following exception:
    AssertionError: SRE module mismatch

We need to match the sys.executable to the sys.path.

Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirf=
airelinux.com>
---
 scripts/lib/devtool/ide_sdk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk=
.py
index 3986dc1436a..14679744807 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -750,7 +750,7 @@ class RecipeModified:
         does not need to start a bitbake server. All information from ti=
nfoil
         is hard-coded in the generated script.
         """
-        cmd_lines =3D ['#!/usr/bin/env python3']
+        cmd_lines =3D ['#!%s' % str(sys.executable)]
         cmd_lines.append('import sys')
         cmd_lines.append('devtool_sys_path =3D %s' % str(sys.path))
         cmd_lines.append('devtool_sys_path.reverse()')
--=20
2.34.1


