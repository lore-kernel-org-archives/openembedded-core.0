Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFBCC43219
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.659.1648751365453213846
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2317F13D5
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:25 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C94773F718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:24 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/23] oeqa/core/decorators/data: improve has_* logic
Date: Thu, 31 Mar 2022 19:29:07 +0100
Message-Id: <20220331182915.22128-15-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331182915.22128-1-ross.burton@arm.com>
References: <20220331182915.22128-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:29:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163856

has_feature() should be splitting the feature string into substrings and
then looking for membership instead of looking for simple substrings.

has_machine() should be using equality instead of substrings.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/core/decorator/data.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/de=
corator/data.py
index bc4939e87c5..12197be246e 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -13,8 +13,8 @@ def has_feature(td, feature):
         Checks for feature in DISTRO_FEATURES or IMAGE_FEATURES.
     """
=20
-    if (feature in td.get('DISTRO_FEATURES', '') or
-        feature in td.get('IMAGE_FEATURES', '')):
+    if (feature in td.get('DISTRO_FEATURES', '').split() or
+        feature in td.get('IMAGE_FEATURES', '').split()):
         return True
     return False
=20
@@ -23,7 +23,7 @@ def has_machine(td, machine):
         Checks for MACHINE.
     """
=20
-    if (machine in td.get('MACHINE', '')):
+    if (machine =3D=3D td.get('MACHINE', '')):
         return True
     return False
=20
--=20
2.25.1


