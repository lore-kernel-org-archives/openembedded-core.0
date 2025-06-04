Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB20C61CE7
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 14:03:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17363.1749045811442298593
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 07:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3A8D1758
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 07:03:13 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9F9E63F5A1
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 07:03:30 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] recipetool/create: show more of the license path when it can't be identified
Date: Wed,  4 Jun 2025 15:03:22 +0100
Message-ID: <20250604140326.2214919-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 14:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217947

If there are multiple source trees in a project (incredibly common with
go-mod, for example) then the relative path of the LICENSE file from
the source tree could just be "LICENSE", which is not useful when there
are tens of files across the recipe with that name.

Show the parent directory name too, to clarify which file is unknown.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/cr=
eate.py
index ea2ef5be637..94d52d60772 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1250,7 +1250,7 @@ def match_licenses(licfiles, srctree, d):
                 license =3D 'Unknown'
                 logger.info("Please add the following line for '%s' to a=
 'lib/recipetool/licenses.csv' " \
                     "and replace `Unknown` with the license:\n" \
-                    "%s,Unknown" % (os.path.relpath(licfile, srctree), m=
d5value))
+                    "%s,Unknown" % (os.path.relpath(licfile, srctree + "=
/.."), md5value))
         if license:
             licenses.append((license, os.path.relpath(licfile, srctree),=
 md5value))
=20
--=20
2.43.0


