Return-Path: <christoph.lauer@email.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A2DC43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 22:30:32 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by mx.groups.io with SMTP id smtpd.web12.15538.1657665028822147192
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 15:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=hkL1Iie7;
 spf=pass (domain: email.de, ip: 212.227.17.12,
 mailfrom: christoph.lauer@email.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1657665026;
	bh=ZjJkDF0vn6CgOU8pD8fQCjb8CwShlKatB/KDKWak+lo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=hkL1Iie7NjgQP7K378tekH9C1KQDiBl5kRWyQfL+xHVsxaMUAeB2z2L/HMgJUIn8K
	 +tiS6QiaCz2tKC0/fAisDF3Oq9YkJLvLSA9B39j35GS6HGMA2svSpdIRzcc+VB80aY
	 aTQS4xEN9ZYz7hvPEZdvHLdvdKBFfRG0AUoOF8eU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from XTR-ACUYOCTO-P01.xtronic-net.com ([178.251.90.190]) by
 smtp.web.de (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MTOha-1nzC982F9I-00U6Ie; Wed, 13 Jul 2022 00:30:26 +0200
From: Christoph Lauer <christoph.lauer@email.de>
To: openembedded-core@lists.openembedded.org
Cc: Christoph Lauer <christoph.lauer@xtronic.de>
Subject: [PATCH v2] package.bbclass: Avoid stripping signed kernel modules in
 splitdebuginfo
Date: Wed, 13 Jul 2022 00:29:37 +0200
Message-Id: <20220712222937.62542-1-christoph.lauer@email.de>
X-Mailer: git-send-email 2.17.1
X-Provags-ID: V03:K1:jqA3OQXq+nFtwgcL4vG3nXAJY1toi25nGtpZKIiq/vj1++HzpN3
 eWdS8HjnEFIMp+6HpgFeEH9Po/yq1wSQjeQtu3iakLHBHE+U5FHMgjuVmGVObFk40ZQmZJs
 6XT0cu8oZ9Ab1OVXIS4MLAwksWGkj5rlITLkcp5h8c7DvABu218UFu3w54cH5tNevVLuH0P
 wLchkBROg1VyL0nfBzyVg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DZBnbct604s=:uSUS22H14ymwaN8TJ3FAXW
 1sMOjv6q77rFDmYeQHYy+PLDLAbo2ldpMB0TysffzBMXGUcJ1mH7VShALBO6u4VIDlOuHdKOy
 7pBTrCxIO42CoR5IWuL81VQHc39RJ2HhFymlD37ExeQkuyC9kxk1r+2w+da/HAtxC3DCFsu8P
 UYmuPz1RDFbd/Y3Ot5AzvL8xWzETm6PJykOKkLQyFRxg71lb0w7x7E03xq9Pm4SSpISQ3SXCq
 QD63vLAb8aBqno/+2pz5G555r/gpbnJTn/Nn/mtiMdhX/lMdeaSxY4cPK60M1iYpb2uUueClO
 nkbapFe1cdQVISVwuRIduNvQozThtR72kVRyYf3qOiENviYZLYuuQzaIXPwGXfa75hKg7mi30
 k7wiPr4fyxhSOsUeMu1ui0RiTY4lCBdTsju0Y0sD3Ez+DtgNsOPPz6fr8IbhQjfCJ0W4/ZP+c
 U4L3kzRFmH4fH4Jai/r6tYRWqhzXJGKaZ7whyechVoqpbnIUuSHv7mQrlP+BbJRu0+H0RrqPT
 iMum5G8xaCzlmFgi3zivml8L41G0drKcIoddTYB51vnnw4nIVtR0P9GkyzhO1BytishVE6zNd
 wsmnu8Ng9QH+avoYBuXUOG2hVQ6wovtFgW9lAwP8qPJ1H+JMOJ/S3UFzPT1uhfSl651zRBc8U
 6of7sg0cV/j6ftGm+Hn1dMzyp/2xCXIA/JNMOXPyA+CtX9pSA3BZPAAN+bql2qfs0BN6IqblY
 v1wHS3BSQ15kI1TTApgtIPW84i3dSkFCl9p6/ux4XTxbASYizJuxxMpzW66xjw3tKdchuShwN
 p18tkYrp4ck2RchFhKUBTRUkTfDpaawKEj30Mm4ep0KRHC/x/kdJwNxl77hEbbZ5J0DEJ1VYi
 Cct065Y3or3gto51eHQjOu1sOfMetuTYb0F9bKIg7PcaZQS6TR6eNddwPPQII//A7e85N3Z5P
 gNdGUeIlqPGPPkjhl0K/6Ep5EqCKeOARPGVhy+BH5brwsa5u2KykCGOGm3X/CP7BhW7YSzOX9
 CYzW0v2kRyPTB3LR4H44vAqCYUMRRFFjFZVZp72B2vkbN9D5A/HCF91pTi3CvbEnpS+oKUn5e
 IdBGGgMFxREnPCik0P+7VO6j9Rw1xeXnjos0e99T4d7JZLvaSG0Jh18WQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 22:30:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167945

From: Christoph Lauer <christoph.lauer@xtronic.de>

Since commit d756b346f248df47b0540644adb1d0f17bcc4b6e kernel modules are s=
tripped by the functions 'runstrip' and 'splitdebuginfo'. Signed modules m=
ust not be stripped. Function 'runstrip' avoids this by running is_kernel_=
module_signed. Apply the same check to splitdebuginfo.

Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
=2D--
 meta/classes/package.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4850134022..78ec96df85 100644
=2D-- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -382,6 +382,11 @@ def splitdebuginfo(file, dvar, dv, d):
     debugfile =3D dvar + dest
     sources =3D []

+    if oe.package.is_elf(file)[1] & 16:
+        if oe.package.is_kernel_module_signed(file):
+            bb.debug(1, "Skip strip on signed module %s" % file)
+            return (file, sources)
+
     # Split the file...
     bb.utils.mkdirhier(os.path.dirname(debugfile))
     #bb.note("Split %s -> %s" % (file, debugfile))
=2D-
2.17.1


