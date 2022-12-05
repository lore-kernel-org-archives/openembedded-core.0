Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95971C4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 14:59:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17324.1670252375709290779
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 06:59:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B99D923A;
	Mon,  5 Dec 2022 06:59:41 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 932A73F71A;
	Mon,  5 Dec 2022 06:59:34 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] lib/buildstats: fix parsing of trees with reduced_proc_pressure directories
Date: Mon,  5 Dec 2022 14:59:32 +0000
Message-Id: <20221205145932.679819-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 14:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174292

The /proc/pressure support in buildstats is creating directories in the
buildstats tree called reduced_proc_pressure, which confuses the parsing
logic as that cannot be parsed as a name-epoc-version-revision tuple.

Explicitly skip this directory to solve the problem.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/buildstats.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/buildstats.py b/scripts/lib/buildstats.py
index c69b5bf4d75..3b76286ba57 100644
--- a/scripts/lib/buildstats.py
+++ b/scripts/lib/buildstats.py
@@ -8,7 +8,7 @@ import json
 import logging
 import os
 import re
-from collections import namedtuple,OrderedDict
+from collections import namedtuple
 from statistics import mean
=20
=20
@@ -238,7 +238,7 @@ class BuildStats(dict):
         subdirs =3D os.listdir(path)
         for dirname in subdirs:
             recipe_dir =3D os.path.join(path, dirname)
-            if not os.path.isdir(recipe_dir):
+            if dirname =3D=3D "reduced_proc_pressure" or not os.path.isd=
ir(recipe_dir):
                 continue
             name, epoch, version, revision =3D cls.split_nevr(dirname)
             bsrecipe =3D BSRecipe(name, epoch, version, revision)
--=20
2.34.1


