Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55D7C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 17:41:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.452.1634319692897957774
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 10:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8A8411D4
	for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 10:41:31 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F4153F70D
	for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 10:41:31 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] testimage: fix unclosed testdata file
Date: Fri, 15 Oct 2021 18:41:20 +0100
Message-Id: <20211015174120.1465848-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 17:41:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157006

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/testimage.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbcl=
ass
index a76e773853..4db05a4af4 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -235,9 +235,10 @@ def testimage_main(d):
=20
     tdname =3D "%s.testdata.json" % image_name
     try:
-        td =3D json.load(open(tdname, "r"))
-    except (FileNotFoundError) as err:
-         bb.fatal('File %s Not Found. Have you built the image with INHE=
RIT+=3D"testimage" in the conf/local.conf?' % tdname)
+        with open(tdname, "r") as f:
+            td =3D json.load(f)
+    except FileNotFoundError as err:
+        bb.fatal('File %s not found (%s).\nHave you built the image with=
 INHERIT +=3D "testimage" in the conf/local.conf?' % (tdname, err))
=20
     # Some variables need to be updates (mostly paths) with the
     # ones of the current environment because some tests require them.
--=20
2.25.1


