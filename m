Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC80C433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 15:42:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.93528.1638373355071006452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 07:42:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6AB4143B
	for <openembedded-core@lists.openembedded.org>;
 Wed,  1 Dec 2021 07:42:34 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 515093F766
	for <openembedded-core@lists.openembedded.org>;
 Wed,  1 Dec 2021 07:42:34 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] recipetool: handle GitLab URLs like we do GitHub
Date: Wed,  1 Dec 2021 15:42:31 +0000
Message-Id: <20211201154232.25193-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 15:42:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159035

GitHub URLs are automatically transformed to git: fetches, so handle
GitLab URLs too.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/cr=
eate.py
index b6c4564761..4f6e01c639 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -366,7 +366,7 @@ def supports_srcrev(uri):
 def reformat_git_uri(uri):
     '''Convert any http[s]://....git URI into git://...;protocol=3Dhttp[=
s]'''
     checkuri =3D uri.split(';', 1)[0]
-    if checkuri.endswith('.git') or '/git/' in checkuri or re.match('htt=
ps?://github.com/[^/]+/[^/]+/?$', checkuri):
+    if checkuri.endswith('.git') or '/git/' in checkuri or re.match('htt=
ps?://git(hub|lab).com/[^/]+/[^/]+/?$', checkuri):
         # Appends scheme if the scheme is missing
         if not '://' in uri:
             uri =3D 'git://' + uri
--=20
2.25.1


