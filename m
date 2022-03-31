Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D551BC433FE
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.701.1648751362549868474
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4402C139F
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA2563F718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:21 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/23] oeqa/runtime/decorator/package.py: remove use of
 strToSet
Date: Thu, 31 Mar 2022 19:29:02 +0100
Message-Id: <20220331182915.22128-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331182915.22128-1-ross.burton@arm.com>
References: <20220331182915.22128-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:29:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163851

There's no need to use a series of over-generalised functions to just
wrap a string in a tuple.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/runtime/decorator/package.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/decorator/package.py b/meta/lib/oeqa/r=
untime/decorator/package.py
index 2d7e174dbfd..8aba3f325bc 100644
--- a/meta/lib/oeqa/runtime/decorator/package.py
+++ b/meta/lib/oeqa/runtime/decorator/package.py
@@ -5,7 +5,6 @@
 #
=20
 from oeqa.core.decorator import OETestDecorator, registerDecorator
-from oeqa.core.utils.misc import strToSet
=20
 @registerDecorator
 class OEHasPackage(OETestDecorator):
@@ -34,8 +33,12 @@ class OEHasPackage(OETestDecorator):
     def setUpDecorator(self):
         need_pkgs =3D set()
         unneed_pkgs =3D set()
-        pkgs =3D strToSet(self.need_pkgs)
-        for pkg in pkgs:
+
+        # Turn literal strings into a list so we can just iterate over i=
t
+        if isinstance(self.need_pkgs, str):
+            self.need_pkgs =3D [self.need_pkgs,]
+
+        for pkg in self.need_pkgs:
             if pkg.startswith('!'):
                 unneed_pkgs.add(pkg[1:])
             else:
--=20
2.25.1


