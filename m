Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C3AC4332F
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.702.1648751363099344739
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA75913D5
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C7793F718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:22 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/23] oeqa/core/decorator: remove redundant code
Date: Thu, 31 Mar 2022 19:29:03 +0100
Message-Id: <20220331182915.22128-11-ross.burton@arm.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/163852

There's no need to wrap *tags in a potential list, as *tags will always
be a tuple.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/core/decorator/__init__.py | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/core/decorator/__init__.py b/meta/lib/oeqa/cor=
e/decorator/__init__.py
index 1a82518ab6a..93efd30e1db 100644
--- a/meta/lib/oeqa/core/decorator/__init__.py
+++ b/meta/lib/oeqa/core/decorator/__init__.py
@@ -5,8 +5,7 @@
 #
=20
 from functools import wraps
-from abc import abstractmethod, ABCMeta
-from oeqa.core.utils.misc import strToList
+from abc import ABCMeta
=20
 decoratorClasses =3D set()
=20
@@ -65,15 +64,11 @@ class OETestDiscover(OETestDecorator):
         return registry['cases']
=20
 def OETestTag(*tags):
-    expandedtags =3D []
-    for tag in tags:
-        expandedtags +=3D strToList(tag)
     def decorator(item):
         if hasattr(item, "__oeqa_testtags"):
             # do not append, create a new list (to handle classes with i=
nheritance)
-            item.__oeqa_testtags =3D list(item.__oeqa_testtags) + expand=
edtags
+            item.__oeqa_testtags =3D list(item.__oeqa_testtags) + list(t=
ags)
         else:
-            item.__oeqa_testtags =3D expandedtags
+            item.__oeqa_testtags =3D tags
         return item
     return decorator
-
--=20
2.25.1


