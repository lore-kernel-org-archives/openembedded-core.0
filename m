Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84331C7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 13:49:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14134.1751032139090447382
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 06:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 788E71A00
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 06:48:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4F7013F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 06:48:58 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 8/9] oeqa/sefltest/devtool: improve assignment matching in _test_recipe_contents
Date: Fri, 27 Jun 2025 14:48:49 +0100
Message-ID: <20250627134850.152269-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250627134850.152269-1-ross.burton@arm.com>
References: <20250627134850.152269-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 13:49:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219420

This function assumed that all assignments are done with just "=3D".

However, being able to check +=3D or ?=3D is also useful, so use a regex =
to
split the line and be more flexible about what an assignment operator
looks like.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/self=
test/cases/devtool.py
index 74a7727cc00..05f228f03e7 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -154,7 +154,7 @@ class DevtoolTestCase(OESelftestTestCase):
                         value =3D invalue
                         invar =3D None
                 elif '=3D' in line:
-                    splitline =3D line.split('=3D', 1)
+                    splitline =3D re.split(r"[?+:]*=3D[+]?", line, 1)
                     var =3D splitline[0].rstrip()
                     value =3D splitline[1].strip().strip('"')
                     if value.endswith('\\'):
--=20
2.43.0


