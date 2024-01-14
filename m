Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815EDC4707B
	for <webhook@archiver.kernel.org>; Sun, 14 Jan 2024 17:19:39 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web10.42796.1705252776795875088
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jan 2024 09:19:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=Ar50gjAY;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 70A0424002A
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 18:19:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1705252774; bh=9i4RC7QeSW8DKbwO608Hrso4NUBbXFCVhvX1mE5Jf3c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=Ar50gjAYOBLQ+2vc+ErPu9jBu9UZZfHZMrboLSUU4bbK/DdtHi7VSeiMc9CqWj9Nh
	 ZYfGJoqJmaC8TEaQ7Sle/QvNiXrFjWBV41+nLgtR0FJN29cgBy3z8UWwB7hsc8eOwt
	 3f8uEofnDpHuqnJ1quBADMNrSsdDCFtIRa3hnm+eXY0lcHSQI6MrnWFDMftuTHJN1Q
	 4lEfZH8OZRxrXi6IlNVP7xoGNXsmFcC12XETmlc51PZATxnY2nOGPub8fbOzAvLgwR
	 cI1Y6trMgZfB5TB8hqO35xcRoWCzVbSY4F3OYFlw7Qy0uma51JLInQ5rrhQWZEtYvM
	 J0ISfnEi9AzEA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TChpG4wfXz9rxP;
	Sun, 14 Jan 2024 18:19:18 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] classes-global/insane: Add check for "virtual/" in RPROVIDES and RDEPENDS
Date: Sun, 14 Jan 2024 17:19:03 +0000
Message-Id: <20240114171903.10264-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 17:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193617

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Fixes [YOCTO #14538]

Recipes shouldn't use "virtual/" in RPROVIDES and RDEPENDS. This was
addressed already in recipes in meta-oe and oe-core. Add a test for
this in insane.bbclass to ensure no regressions occur.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/classes-global/insane.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
index d625fd82f7..9e8e35e0f7 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1606,6 +1606,12 @@ python () {
     if (d.getVar(d.expand('DEPENDS:${PN}'))):
         oe.qa.handle_error("pkgvarcheck", "recipe uses DEPENDS:${PN}, sh=
ould use DEPENDS", d)
=20
+    # virtual/ is meaningless for those variables
+    for k in ['RDEPENDS', 'RPROVIDES']:
+        for var in bb.utils.explode_deps(d.getVar(k + ':' + pn) or ""):
+            if var.startswith("virtual/"):
+                bb.warn("%s is set to %s, the substring 'virtual/' holds=
 no meaning in this context. It is suggested to use the 'virtual-' instea=
d." % (k, var))
+
     issues =3D []
     if (d.getVar('PACKAGES') or "").split():
         for dep in (d.getVar('QADEPENDS') or "").split():
--=20
2.39.2


