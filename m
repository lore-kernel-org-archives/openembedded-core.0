Return-Path: <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 279B9C48BF3
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:04:39 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web10.19293.1708016671244985336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:04:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=sM4TnhYd;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 862109C3372;
	Thu, 15 Feb 2024 12:04:30 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id mJzyoblpFUDY; Thu, 15 Feb 2024 12:04:30 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id F058A9C3675;
	Thu, 15 Feb 2024 12:04:29 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com F058A9C3675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1708016669; bh=89v4BL4ZKytGdzL/ASr+Kkb7NTcWmglXbwvllQzAoYY=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=sM4TnhYdchUmq8jVmUVdMpmPL13BM0fq+Gw6O+7RkQM31eyiLGck2DeIBsOyElHMJ
	 GVMoADk1YfZuqle4Ged1FISZhMJcvGWRBR4/nEyDZZKTeJXC4tlxoKVxQ2JA4nTXtz
	 ICCtVwyVGOYLGLpbhh5JyH4VIGr5kfxeIkVIkWE5bBricR60/VtPVRiQh7Pxsn4flO
	 7xWpEXPgDOKDROFlXKY5jT/kQI2PPGSGEYF/f0ZXZ83FKPaMOytbJI6/3JUh05EQ0B
	 mntP9zN6M7kH4MRmVZYKTxBGDwYVcWQVift6jKtCCAfzNV6JAws3jgBRMzttEf2bke
	 PDNLZPNaRBm3w==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id BzIr_vlWzrLy; Thu, 15 Feb 2024 12:04:29 -0500 (EST)
Received: from sfl-deribaucourt.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 41B0E9C2A5D;
	Thu, 15 Feb 2024 12:04:29 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: adrian.freihofer@gmail.com,
	Ross.Burton@arm.com,
	mohammed.raza@savoirfairelinux.com,
	Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Subject: [PATCH 2/6] devtool: ide_sdk: Use bitbake's python3 for generated scripts
Date: Thu, 15 Feb 2024 18:04:18 +0100
Message-Id: <20240215170422.659073-3-enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215170422.659073-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
References: <20240215170422.659073-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195550

The generated scripts use the sys.path configuration found inside
bitbake. It can be a different python version than the one used on the
host through the IDE.

For instance, when running the generated script
deploy_target_cmake-example-core2-64 from an eSDK generated on another
machine, I got the following exception:
    AssertionError: SRE module mismatch

We need to match the sys.executable to the sys.path.
---
 scripts/lib/devtool/ide_sdk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk=
.py
index db2e95616be..a82ab572998 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -751,7 +751,7 @@ class RecipeModified:
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


