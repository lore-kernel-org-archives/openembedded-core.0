Return-Path: <dl9pf@gmx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44152EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 13:04:00 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by mx.groups.io with SMTP id smtpd.web10.21602.1688648632945700250
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 06:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=dl9pf@gmx.de header.s=s31663417 header.b=IkfhW1BX;
 spf=pass (domain: gmx.de, ip: 212.227.17.21, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1688648625; x=1689253425; i=dl9pf@gmx.de;
 bh=3+hUd2TiYoCZN/QSM0IAFGsVwN55+wwrQn2Sdkevcb4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=IkfhW1BXq99cKgwoTZO6Qpye+xj/M4xV2/iaYtbkEzGlx76YU2bxXf6DmlmTyM/kOTwmdEg
 k1TWl7b/LX+QPUqWjso9NrUgUv0ow2YjBjCa5a2aepqoc6/tiNhcvqfXDyAOoh/hVChJpMzQ8
 Zo0AWg7uDes8RMHfH29ScjShQwg3SO04EAf4yJ8eH6J3tpxuIgfpb3ioX9+eAjO5IQmyQllL1
 YJcPEaeQmJQoxCqok8/QI5lowWWy+sLyrdQc6Pf1wyPRpYTxnmzADdDTmXDfycGEyCSn/HpQW
 D5RQZVefDWX2R1VuGHEF54Q3mublk96N+J4S3LZUOHSbdG2tCN0w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from gmx.de ([77.23.145.57]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdvmY-1pgPfb0Tw6-00b58J; Thu, 06
 Jul 2023 15:03:45 +0200
From: dl9pf@gmx.de
To: openembedded-core@lists.openembedded.org
Cc: dl9pf@gmx.de,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 2/2] selftest/reproducible: Allow chose the package manager
Date: Thu,  6 Jul 2023 15:01:05 +0200
Message-ID: <20230706130338.7144-3-dl9pf@gmx.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706130338.7144-1-dl9pf@gmx.de>
References: <20230706130338.7144-1-dl9pf@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DdmUm83sRR1mSyQ5R4igC8Bo65B3ZDpMuTYdXEx1SXBchJjJDo2
 BM1u3AaGrwpYAvOabYyKrBktr/qbjc1ezwMEd5twKeNqPNVXQF+0o8+YTd/vl5A/7hjVKrK
 2qH4dMvUVVs2GZnlTtN6GM6WB9HJHOBNNFkz/TVjmeIw94XvKBynWjUCyIeHaFNDOZNbeAi
 FXbTB9bosK3/xW4B8zoag==
UI-OutboundReport: notjunk:1;M01:P0:4YBNwmjoeWU=;aJg5d7DZbqF+myJNrIQ5n5Hl35d
 R5L57hpwjHTokFBw4g9BRIFWj3Axlxl7BqYfg/trtge7B5AbCpmentiMjSQSOdSv0iiGCcz9g
 nwEHVH2Y3h96yQr3nKi+BQ9n7p1SNXzJJrMck3GmumOm6Q7EVR5aAfFexnZ65meWgrOpDal/g
 8w61rcLigjXtBrl4pFyFCHjXqW1jgsq65a5p/+erGFm8J4koXMxupXkpNFtrYKhDiconY1lbC
 utK/H+YmcMKOsdrjUUcoK/hhx+TT3LjD3/rxz/kcDaPa8h1XYBTXtSjTQlt/3fbgXsD4u2vwW
 rF1FM1Ayxrsj57gH2rVx3Q5pMDQyx84mnz79NZ5fK5GM8JFpM581AEJ/fkXtMpUHPUcSI5ztZ
 WypwgIEjSrsxe5pvUmMcV07Zsl3ZVP7XzrkhFIb5bBBRA+zzcRJ77LDkcforeqsHHsbo+qw4v
 sgU43KiSkoq8crtLj8+IEjM3sI8DwPN1/IwkX2Wsj7OWeHqOzMISamX0EZyODP7pRnCIwqEhr
 oe+72EfAWYPo0TGWP0xYLpyHSI6ck+gP31nuJb4KA2QIOQ2/at3jWNU0Yb/qHY2G/hSsjpv7G
 VKE6v8/qpRENuW1UEKihfGg71JZUV3bEK735xlo+/CFoestgj5C+nF3kmqeF6BuxwiaV244jh
 ai9L1SP+IP79NDrLvgyj2haJtIEnGLyrlD456dpZNadjoDo53cta5E55gzuRYkCOgEsNiwpJh
 xlBKJq/Et17X3xHL/FwnrAQbTtsQ409a+gxYdCRKKHytkJSfK2sL0spWZBEwy62J4cu6zfLK/
 iQVSd7mdX9ACNDVhxq09ackNzL9f/Wt05pQ//UcjOqKRbAJTSFMEjgE7qZ7rFbykeco2WoLzg
 2r/NOThTm/vABmk8pZvC/bjah52N/lRvHQdCg3MGNTvkNDeYsZ5A43foeH4GLwp0lXKEyYpDf
 IY/MIA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 13:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183942

From: Jose Quaresma <quaresma.jose@gmail.com>

This is a follow-up of 76e5fcb2 that also allow users to chose
the package manager using OEQA_REPRODUCIBLE_TEST_PACKAGE

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3d414d85b44077bac57aba36707b0fc699a73e97)
=2D--
 meta/lib/oeqa/selftest/cases/reproducible.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/=
selftest/cases/reproducible.py
index 98259ae515..49318be43a 100644
=2D-- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -126,7 +126,11 @@ class DiffoscopeTests(OESelftestTestCase):
 class ReproducibleTests(OESelftestTestCase):
     # Test the reproducibility of whatever is built between sstate_target=
s and targets

-    package_classes =3D ['deb', 'ipk', 'rpm']
+    package_classes =3D get_bb_var("OEQA_REPRODUCIBLE_TEST_PACKAGE")
+    if package_classes:
+        package_classes =3D package_classes.split()
+    else:
+        package_classes =3D ['deb', 'ipk', 'rpm']

     # Maximum report size, in bytes
     max_report_size =3D 250 * 1024 * 1024
=2D-
2.41.0


