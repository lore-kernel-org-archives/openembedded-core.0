Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CF3C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 10:14:04 +0000 (UTC)
Received: from TWMBX02.aspeed.com (TWMBX02.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web11.14593.1704276835307813838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 02:13:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 3 Jan
 2024 18:13:53 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Jan 2024 18:13:53 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] devtool: modify: fix exception
Date: Wed, 3 Jan 2024 18:13:44 +0800
Message-ID: <20240103101345.2873033-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=twmbx02.aspeed.com;
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 10:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193279

Root Cause:
initial_revs is an empty dictionary and do not have "." key.

Traceback (most recent call last):
  File "scripts/devtool", line 349, in <module>
    ret =3D main()
  File "scripts/devtool", line 336, in main
    ret =3D args.func(args, config, basepath, workspace)
  File "scripts/lib/devtool/standard.py", line 922, in modify
    if not initial_revs["."]:
KeyError: '.'

Solution:
check key exists, then get its value.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index 559fd45676..2e56cd3050 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -921,7 +921,7 @@ def modify(args, config, basepath, workspace):
                     if line.startswith('*'):
                         (stdout, _) =3D bb.process.run('git rev-parse devt=
ool-base', cwd=3Dsrctree)
                         initial_revs["."] =3D stdout.rstrip()
-                if not initial_revs["."]:
+                if "." not in initial_revs:
                     # Otherwise, just grab the head revision
                     (stdout, _) =3D bb.process.run('git rev-parse HEAD', c=
wd=3Dsrctree)
                     initial_revs["."] =3D stdout.rstrip()
--=20
2.25.1


