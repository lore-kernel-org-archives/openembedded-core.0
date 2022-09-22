Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F86AC6FA82
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 09:04:45 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.63])
 by mx.groups.io with SMTP id smtpd.web10.5037.1663837468232307870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 02:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=lq4Tb5tC;
 spf=pass (domain: kpit.com, ip: 40.107.239.63,
 mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PghnzKdBy7VOTS1LRl2BAZtTgv/q4kYshC5cyWB9EG71I5K0C9GpC24rOwrF+2eSvRz734xizQVRDGvnF9R+bI1VJiehO6HmiRdVdIlb3+0SaAkFjqcHvr0J3h6o0P45YxYf0kdUfzTeFglvaBjj0obUM1PelApr2FLrqm0gmGwOAydxPEyIRTw2BG/fX9KcpEdpgx88Y0xP8IhWhsq1Tlh3uFKszMqBSLUhlSamA2+DXkuF8yH7JdLF+9BV/VyyM7yPpAY0lU9gxSrkmlIIHQWbEysj2c9Bd53rA06xCpehXOm1T0pwfbDVrUDNt+0Fnzzh2S1/+DeZARn4IuKQQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbceOTwhEUnImz3Yr0zBQZ/Kcmxm8ned8vTVUl652mA=;
 b=UT4YQUHH2tDjwAZ9++Sl5Pi039knO0t0aX1oeppcy9fBGS76rDZhu36t+jtVUQ1fGi6VoRh1YGeD0/Ny6wgChZMtGidwwnL3VkHvH5smeLB7NqT6SLwYsnPo538KWgkLenPgOs45rJTp8O4Qye69BUawZO1mMIj7DIrfeid+1bxeJRNaF1YTObAG6H4MCsrLX/kgRjReQuuujdfkCUBR+SIhVJR3yZcgpsTMgr7JINmWutAk6vfCfIuH0hnbAEkL39iMqqhiem5XBqvobrTantFUJL7mtt6U1jewu2BrHB0iji2w9EOGAVye1qQyLejZvP40zwk8zWdR45NY3XqNnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbceOTwhEUnImz3Yr0zBQZ/Kcmxm8ned8vTVUl652mA=;
 b=lq4Tb5tCqpbata3WYpFqcVmIAKL2ykFnUpOKuHVFHeP8hI4Ij4l0qPOwKGUPX+PUfQJZHgWD+uEZ+5TIlCbKFG4PM4dS03VkhC0ycY9cbdJ/qitwWUg2atw5hcnn2f5W5gXXhpLP392k3QTFdQKymoJsPLpDzuZ4bHuUOigk3h4=
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3::12)
 by PN0PR01MB6209.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:76::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Thu, 22 Sep
 2022 09:04:22 +0000
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b]) by MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b%3]) with mapi id 15.20.5654.018; Thu, 22 Sep 2022
 09:04:22 +0000
From: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Steve Sakoman <steve@sakoman.com>
CC: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
Subject: Re: [OE-Core][dunfell][PATCH] expat: Fix CVE-2022-40674
Thread-Topic: [OE-Core][dunfell][PATCH] expat: Fix CVE-2022-40674
Thread-Index: AQHYzmIBaQy26OO++kiinaQkTdsKjK3rJ2fG
Date: Thu, 22 Sep 2022 09:04:22 +0000
Message-ID: 
 <MAXPR01MB4327C1717B03551D15F32EE69D4E9@MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM>
References: <1717233984F37DC8.30869@lists.openembedded.org>
In-Reply-To: <1717233984F37DC8.30869@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAXPR01MB4327:EE_|PN0PR01MB6209:EE_
x-ms-office365-filtering-correlation-id: 4156856d-fa9f-44dd-bf0a-08da9c79709f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vtZ2r4fFvEDto5xpDPbS84e2AOqkvvQGZoWSetq1Gh07H5lMqscNvQoX3BX06WjtEnNgwrzBPbEVnickqU1vJ/60jLtJdQg6soy4NWqD+t0BbLqYTOflNTWv6qyA9VjFuUIXYhCdApDJz/WFvMdTBv1srj2n+8Nz+FkImFDk0vRDnLB7t9gQjKzUUYfdBHlj7AmDCjM9qpyJT2C4N55LEfh3j00arA/FEY91lGG5E+OEXk4WPoa64G+wogYELOMROoJb8pP/xAZBal/Y0oUOvuurDtTDGD/HjkO+vnL9D1mpP7mVyyheza+/GLeUlLORzvr8YdS/4nlmXzbSAs/qnr33igZf6OyonkFxvo6Wyo7XIkvgf29S+0G+c0D/c0QoBTQ9M50ZBZQt3+6tkTjk4f7f9dS9OhPh2dDTzv2O0NYf73AA0eRiVkIOUdDBaLQc4QL/D7Ftjzka6Jbucc17CutFchjOf+iPzdqX0VcGNwaS+fAjkv6BNmNjHDXf/wGqCyGVF07BzkCbQCdKluMUV6IzCh5knMGSh6EaKX58+WCBRZEUys63AhDxsxlJlaIT+tvECMpQ8JTM03eyCvLZ7I+F5PUbAyyK7e+BflskUIylTOqXR2ZnYnroDvqSSSprgRHo8ubHCFQCgP1mt2YIjW1HZjTf3MSX3mbfZOyFR6qb89zuTn7PACL/rln10OjwuvP+lFTFVWIuolmK1bSUDZGMmqbpL3dGtCt51luhJePB4YFoo34JKwRtAphe/DFdbMMcW9HqG2rMeVqGARiJ5ey+wrX/G2Dlh0LdGPxzk8N6LL1aE3dAU8TkzsdwbgQpUH92pw2elI8zkxKdXAP+9g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199015)(9686003)(26005)(110136005)(4326008)(166002)(52536014)(66574015)(99936003)(186003)(71200400001)(316002)(2906002)(7696005)(966005)(478600001)(107886003)(8676002)(91956017)(64756008)(66946007)(66476007)(66446008)(76116006)(66556008)(41300700001)(38070700005)(86362001)(6506007)(45080400002)(55016003)(33656002)(19627405001)(66899012)(38100700002)(122000001)(5660300002)(83380400001)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DFPa/EnLAKQIlXyrcAFaOJm0lNsBoqVHRZ/VTTgrgLYV4lSOZear7u5sWgoT?=
 =?us-ascii?Q?b7o69JHRopZFJO6EgIiyKYD+t1TMarisYtVt717BAgbCt9NH7jP+tAm3Z2wT?=
 =?us-ascii?Q?QmO7ZFXtgOZnWVrclmpwz+umIITBkTl4r6eHXJ0g0a+t0hPcX+KRJxnuwReK?=
 =?us-ascii?Q?WCyZxh/AeW/SJZ+FtaavY4/UL4V6r/6e0aFb6VR4qFSTnAEJn3WghGK39sgu?=
 =?us-ascii?Q?79khStZaAAcxTepc4h0MJdxnOTC+6i42NJ7SJqUXLqi4rV20pD+7BFjBAMBz?=
 =?us-ascii?Q?G33It2VZYfLXlvy6Ay/jI1Wy1a2Az1JLoeas1+F399mrhnqCtCnLgJ1k7asb?=
 =?us-ascii?Q?Yc4Fj0GXITJcKNLKc2MKHSSfSYOn4aftXeAnLeZYGeuRc/4MAYzEl51lpCP0?=
 =?us-ascii?Q?3gv9SfWij63tacNiVH7VUxFYhJjX8Z3T9/NnCPWEiVw3bFyIU39u7KMQLvdp?=
 =?us-ascii?Q?PA6GzR4kB0hRsqkiH3Z+jVdTm2+9H6kvNVpgC5BBtZqdriZiezGaRNCMmZGi?=
 =?us-ascii?Q?ve6KdYM9J4oRcE2S4zLrvxRio35ThWFUNpOQ/1GrYzTrAJYJaD42slOsvt9y?=
 =?us-ascii?Q?CyGix7/9eyDqwpY0X7BgEOwYYMGwio4O1xmHrSMoULfwSjlr1NNcREjzpO6U?=
 =?us-ascii?Q?6ZV31g99f/PTTH3y9d8GwLzU+J1kDOuxapp7s0bIT400XOLGTG1Rhj1HjUu3?=
 =?us-ascii?Q?l4ddFB1NwiCxJJzC8ab+7mmRoNu9E2eQgrTz2pIf7hDT6nftKvR7eId9LlMb?=
 =?us-ascii?Q?OW12j208/B7z6F9v/YqzDai3V1NEucwHt/hHtSX2KPDro2+6S940tlCR4UHI?=
 =?us-ascii?Q?ngk5zcIoPyM6kqL4k74oJyHG7Y7S53s+2tb/traY5KBBRP3z4rwwTo+b47Iv?=
 =?us-ascii?Q?PyOqDm5klUfeezCoUVX1Ycx7a0aapcIdHMUhGe1h7UOjBUJLxc2pNfJT4l0o?=
 =?us-ascii?Q?9fJ6OFk1CSRFE+F0Vr1ZCUKr1ojIGT+aOTdEIO7smzvJ3Ldsf6qKwd+lfPN1?=
 =?us-ascii?Q?XQ6h/qQoMflpdz35B7fasHs5nfH81g1fe5SCLDCGkohhIKEjkBYDRI8NPA8x?=
 =?us-ascii?Q?+XFim/QYJCfG0+ickTvcbQmkqgn7/MlTAyEy6DzMCZOV4gzhA989s6qjS5sL?=
 =?us-ascii?Q?5dZji/B/51K9d1a0x5yi/i9U54Y/lsPV1GBBObLsRVBBbDhv/+vYJP2L6z80?=
 =?us-ascii?Q?pLb4RgsgZ+NugpnmxzOlK73MexF9PkyuW1rg08MC9J2ZP/8LPHOYYp5QeL3q?=
 =?us-ascii?Q?WbVkxaOuL8II71r6EKVEDzz/xSgldczLS2pJvDsbfNMiH9YlSHdfeynhjXy+?=
 =?us-ascii?Q?V5SEv8JCYeFo0uoRenXbJ9wnzpXQZ+DEUS5xZ/RsWuSOvUX+e9/jvqEbBPYh?=
 =?us-ascii?Q?9ReHSPh9fQIOaYjOi8rTNPaUeZQ0VFpVYWaYHrCNFGTPmn30fcdmBG2e39ll?=
 =?us-ascii?Q?gtpSglgno36YRjnjmrKII35Hh+73Xtr4orTbBH7eLJ/tSAMQSb/kYLX9a8eQ?=
 =?us-ascii?Q?ANcCAREwKADCPON1aNW0QhZLkuic4/Q40B1dtf0ZYtAoiXdXQH4E1LHJjbnD?=
 =?us-ascii?Q?iWe1bMCRdIOFuoerfzU=3D?=
Content-Type: multipart/mixed;
	boundary="_004_MAXPR01MB4327C1717B03551D15F32EE69D4E9MAXPR01MB4327INDP_"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4156856d-fa9f-44dd-bf0a-08da9c79709f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2022 09:04:22.0684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 cdp/R5M9xddOeoB011misjnDVrbeMWNpE7q2JT6STmL+eDznNdhukkAmU9XNLQQYNLwNp/0zxUCMexEOS304Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6209
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 09:04:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170967

--_004_MAXPR01MB4327C1717B03551D15F32EE69D4E9MAXPR01MB4327INDP_
Content-Type: multipart/alternative;
	boundary="_000_MAXPR01MB4327C1717B03551D15F32EE69D4E9MAXPR01MB4327INDP_"

--_000_MAXPR01MB4327C1717B03551D15F32EE69D4E9MAXPR01MB4327INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi ,

attaching patch file.


________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Virendra Thakur via lists.openembedded.org <vir=
endra.thakur=3Dkpit.com@lists.openembedded.org>
Sent: Thursday, September 22, 2022 2:31 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
Subject: [OE-Core][dunfell][PATCH] expat: Fix CVE-2022-40674

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.

From: Virendra Thakur <virendrak@kpit.com>

Add patch file to fix CVE-2022-40674

Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
ithub.com%2Flibexpat%2Flibexpat%2Fpull%2F629%2Fcommits%2F4a32da87e931ba5439=
3d465bb77c40b5c33d343b&amp;data=3D05%7C01%7Cvirendra.thakur%40kpit.com%7C03=
38ba3a60a043d9e69008da9c791e4d%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7=
C637994341333711717%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l=
uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D4iNThkUMhS1=
QrEtMVirTug3OBYlGhwuP5dGZ6YXhBJw%3D&amp;reserved=3D0

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 .../expat/expat/CVE-2022-40674.patch          | 53 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.9.bb        |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-40674.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-40674.patch b/meta/reci=
pes-core/expat/expat/CVE-2022-40674.patch
new file mode 100644
index 0000000000..8b95f5f198
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-40674.patch
@@ -0,0 +1,53 @@
+From 4a32da87e931ba54393d465bb77c40b5c33d343b Mon Sep 17 00:00:00 2001
+From: Rhodri James <rhodri@wildebeest.org.uk>
+Date: Wed, 17 Aug 2022 18:26:18 +0100
+Subject: [PATCH] Ensure raw tagnames are safe exiting internalEntityParser
+
+It is possible to concoct a situation in which parsing is
+suspended while substituting in an internal entity, so that
+XML_ResumeParser directly uses internalEntityProcessor as
+its processor.  If the subsequent parse includes some unclosed
+tags, this will return without calling storeRawNames to ensure
+that the raw versions of the tag names are stored in memory other
+than the parse buffer itself.  If the parse buffer is then changed
+or reallocated (for example if processing a file line by line),
+badness will ensue.
+
+This patch ensures storeRawNames is always called when needed
+after calling doContent.  The earlier call do doContent does
+not need the same protection; it only deals with entity
+substitution, which cannot leave unbalanced tags, and in any
+case the raw names will be pointing into the stored entity
+value not the parse buffer.
+
+Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fgithub.com%2Flibexpat%2Flibexpat%2Fcommit%2F4a32da87e9=
31ba54393d465bb77c40b5c33d343b&amp;data=3D05%7C01%7Cvirendra.thakur%40kpit.=
com%7C0338ba3a60a043d9e69008da9c791e4d%7C3539451eb46e4a26a242ff61502855c7%7=
C0%7C0%7C637994341333711717%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D%2F=
m7O1i8VGUJdh3WmVla5D93KiGtjYeoDvYy7cVps%2Flg%3D&amp;reserved=3D0]
+CVE: CVE-2022-40674
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+---
+ expat/lib/xmlparse.c | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+Index: expat/lib/xmlparse.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5657,10 +5657,15 @@ internalEntityProcessor(XML_Parser parse
+   {
+     parser->m_processor =3D contentProcessor;
+     /* see externalEntityContentProcessor vs contentProcessor */
+-    return doContent(parser, parser->m_parentParser ? 1 : 0, parser->m_en=
coding,
+-                     s, end, nextPtr,
+-                     (XML_Bool)! parser->m_parsingStatus.finalBuffer,
+-                     XML_ACCOUNT_DIRECT);
++    result =3D doContent(parser, parser->m_parentParser ? 1 : 0,
++                       parser->m_encoding, s, end, nextPtr,
++                       (XML_Bool)! parser->m_parsingStatus.finalBuffer,
++                       XML_ACCOUNT_DIRECT);
++    if (result =3D=3D XML_ERROR_NONE) {
++      if (! storeRawNames(parser))
++        return XML_ERROR_NO_MEMORY;
++    }
++    return result;
+   }
+ }
+
diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/exp=
at/expat_2.2.9.bb
index f50e535922..578edfcbff 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -20,6 +20,7 @@ SRC_URI =3D "git://github.com/libexpat/libexpat.git;proto=
col=3Dhttps;branch=3Dmaster \
            file://CVE-2022-25314.patch \
            file://CVE-2022-25315.patch \
            file://libtool-tag.patch \
+           file://CVE-2022-40674.patch \
          "

 SRCREV =3D "a7bc26b69768f7fb24f0c7976fae24b157b85b13"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MAXPR01MB4327C1717B03551D15F32EE69D4E9MAXPR01MB4327INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi ,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
attaching patch file.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Virendra Thakur via lists.openembedded.org
 &lt;virendra.thakur=3Dkpit.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Thursday, September 22, 2022 2:31 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Virendra Kumar Thakur &lt;Virendra.Thakur@kpit.com&gt;<br>
<b>Subject:</b> [OE-Core][dunfell][PATCH] expat: Fix CVE-2022-40674</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Caution: This email originated from outside of the=
 KPIT. Do not click links or open attachments unless you recognize the send=
er and know the content is safe.<br>
<br>
From: Virendra Thakur &lt;virendrak@kpit.com&gt;<br>
<br>
Add patch file to fix CVE-2022-40674<br>
<br>
Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fgithub.com%2Flibexpat%2Flibexpat%2Fpull%2F629%2Fcommits%2F4a32da8=
7e931ba54393d465bb77c40b5c33d343b&amp;amp;data=3D05%7C01%7Cvirendra.thakur%=
40kpit.com%7C0338ba3a60a043d9e69008da9c791e4d%7C3539451eb46e4a26a242ff61502=
855c7%7C0%7C0%7C637994341333711717%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw=
MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;=
sdata=3D4iNThkUMhS1QrEtMVirTug3OBYlGhwuP5dGZ6YXhBJw%3D&amp;amp;reserved=3D0=
">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Flibexpat%2Flibexpat%2Fpull%2F629%2Fcommits%2F4a32da87e931ba54393d465b=
b77c40b5c33d343b&amp;amp;data=3D05%7C01%7Cvirendra.thakur%40kpit.com%7C0338=
ba3a60a043d9e69008da9c791e4d%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6=
37994341333711717%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM=
zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3D4iNThkUMh=
S1QrEtMVirTug3OBYlGhwuP5dGZ6YXhBJw%3D&amp;amp;reserved=3D0</a><br>
<br>
Signed-off-by: Virendra Thakur &lt;virendrak@kpit.com&gt;<br>
---<br>
&nbsp;.../expat/expat/CVE-2022-40674.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 53 +++++++++++++++++++<br>
&nbsp;meta/recipes-core/expat/expat_2.2.9.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 1 +<br>
&nbsp;2 files changed, 54 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-core/expat/expat/CVE-2022-40674.patch=
<br>
<br>
diff --git a/meta/recipes-core/expat/expat/CVE-2022-40674.patch b/meta/reci=
pes-core/expat/expat/CVE-2022-40674.patch<br>
new file mode 100644<br>
index 0000000000..8b95f5f198<br>
--- /dev/null<br>
+++ b/meta/recipes-core/expat/expat/CVE-2022-40674.patch<br>
@@ -0,0 +1,53 @@<br>
+From 4a32da87e931ba54393d465bb77c40b5c33d343b Mon Sep 17 00:00:00 2001<br>
+From: Rhodri James &lt;rhodri@wildebeest.org.uk&gt;<br>
+Date: Wed, 17 Aug 2022 18:26:18 +0100<br>
+Subject: [PATCH] Ensure raw tagnames are safe exiting internalEntityParser=
<br>
+<br>
+It is possible to concoct a situation in which parsing is<br>
+suspended while substituting in an internal entity, so that<br>
+XML_ResumeParser directly uses internalEntityProcessor as<br>
+its processor.&nbsp; If the subsequent parse includes some unclosed<br>
+tags, this will return without calling storeRawNames to ensure<br>
+that the raw versions of the tag names are stored in memory other<br>
+than the parse buffer itself.&nbsp; If the parse buffer is then changed<br=
>
+or reallocated (for example if processing a file line by line),<br>
+badness will ensue.<br>
+<br>
+This patch ensures storeRawNames is always called when needed<br>
+after calling doContent.&nbsp; The earlier call do doContent does<br>
+not need the same protection; it only deals with entity<br>
+substitution, which cannot leave unbalanced tags, and in any<br>
+case the raw names will be pointing into the stored entity<br>
+value not the parse buffer.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Flibexpat%2Flibexpat%2Fcommit%2=
F4a32da87e931ba54393d465bb77c40b5c33d343b&amp;amp;data=3D05%7C01%7Cvirendra=
.thakur%40kpit.com%7C0338ba3a60a043d9e69008da9c791e4d%7C3539451eb46e4a26a24=
2ff61502855c7%7C0%7C0%7C637994341333711717%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&=
amp;amp;sdata=3D%2Fm7O1i8VGUJdh3WmVla5D93KiGtjYeoDvYy7cVps%2Flg%3D&amp;amp;=
reserved=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Fgithub.com%2Flibexpat%2Flibexpat%2Fcommit%2F4a32da87e931ba54393d465b=
b77c40b5c33d343b&amp;amp;data=3D05%7C01%7Cvirendra.thakur%40kpit.com%7C0338=
ba3a60a043d9e69008da9c791e4d%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6=
37994341333711717%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM=
zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;amp;sdata=3D%2Fm7O1i8=
VGUJdh3WmVla5D93KiGtjYeoDvYy7cVps%2Flg%3D&amp;amp;reserved=3D0</a>]<br>
+CVE: CVE-2022-40674<br>
+Signed-off-by: Virendra Thakur &lt;virendrak@kpit.com&gt;<br>
+---<br>
+ expat/lib/xmlparse.c | 13 +++++++++----<br>
+ 1 file changed, 9 insertions(+), 4 deletions(-)<br>
+<br>
+Index: expat/lib/xmlparse.c<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- a/lib/xmlparse.c<br>
++++ b/lib/xmlparse.c<br>
+@@ -5657,10 +5657,15 @@ internalEntityProcessor(XML_Parser parse<br>
+&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; parser-&gt;m_processor =3D contentProcessor;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; /* see externalEntityContentProcessor vs contentP=
rocessor */<br>
+-&nbsp;&nbsp;&nbsp; return doContent(parser, parser-&gt;m_parentParser ? 1=
 : 0, parser-&gt;m_encoding,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s, end, nextPtr,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (XML_Bool)! parser-&gt;m_pa=
rsingStatus.finalBuffer,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XML_ACCOUNT_DIRECT);<br>
++&nbsp;&nbsp;&nbsp; result =3D doContent(parser, parser-&gt;m_parentParser=
 ? 1 : 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; parser-&gt;m_en=
coding, s, end, nextPtr,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (XML_Bool)! par=
ser-&gt;m_parsingStatus.finalBuffer,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XML_ACCOUNT_DIR=
ECT);<br>
++&nbsp;&nbsp;&nbsp; if (result =3D=3D XML_ERROR_NONE) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (! storeRawNames(parser))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XML_ERROR_NO_MEMORY;<br=
>
++&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp; return result;<br>
+&nbsp;&nbsp; }<br>
+ }<br>
+<br>
diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/exp=
at/expat_2.2.9.bb<br>
index f50e535922..578edfcbff 100644<br>
--- a/meta/recipes-core/expat/expat_2.2.9.bb<br>
+++ b/meta/recipes-core/expat/expat_2.2.9.bb<br>
@@ -20,6 +20,7 @@ SRC_URI =3D &quot;git://github.com/libexpat/libexpat.git;=
protocol=3Dhttps;branch=3Dmaster \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-25314.patch">file://CVE-2022-25314.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-25315.patch">file://CVE-2022-25315.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://libtool-tag.patch">file://libtool-tag.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2022-40674.patch">file://CVE-2022-40674.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
<br>
&nbsp;SRCREV =3D &quot;a7bc26b69768f7fb24f0c7976fae24b157b85b13&quot;<br>
--<br>
2.17.1<br>
<br>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_MAXPR01MB4327C1717B03551D15F32EE69D4E9MAXPR01MB4327INDP_--

--_004_MAXPR01MB4327C1717B03551D15F32EE69D4E9MAXPR01MB4327INDP_
Content-Type: text/x-patch; name="0001-expat-Fix-CVE-2022-40674.patch"
Content-Description: 0001-expat-Fix-CVE-2022-40674.patch
Content-Disposition: attachment;
	filename="0001-expat-Fix-CVE-2022-40674.patch"; size=3798;
	creation-date="Thu, 22 Sep 2022 09:04:16 GMT";
	modification-date="Thu, 22 Sep 2022 09:04:17 GMT"
Content-Transfer-Encoding: base64

RnJvbSBhNTA2MDRlZTYyMGJlZGFhZDhkN2U0MjE0M2Y4ODY3NWQwNDdmYjUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBWaXJlbmRyYSBUaGFrdXIgPHZpcmVuZHJha0BrcGl0LmNvbT4K
RGF0ZTogV2VkLCAyMSBTZXAgMjAyMiAxODoyNzowNSArMDUzMApTdWJqZWN0OiBbUEFUQ0hdIGV4
cGF0OiBGaXggQ1ZFLTIwMjItNDA2NzQKCkFkZCBwYXRjaCBmaWxlIHRvIGZpeCBDVkUtMjAyMi00
MDY3NAoKTGluazogaHR0cHM6Ly9naXRodWIuY29tL2xpYmV4cGF0L2xpYmV4cGF0L3B1bGwvNjI5
L2NvbW1pdHMvNGEzMmRhODdlOTMxYmE1NDM5M2Q0NjViYjc3YzQwYjVjMzNkMzQzYgoKU2lnbmVk
LW9mZi1ieTogVmlyZW5kcmEgVGhha3VyIDx2aXJlbmRyYWtAa3BpdC5jb20+Ci0tLQogLi4uL2V4
cGF0L2V4cGF0L0NWRS0yMDIyLTQwNjc0LnBhdGNoICAgICAgICAgIHwgNTMgKysrKysrKysrKysr
KysrKysrKwogbWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXRfMi4yLjkuYmIgICAgICAgIHwg
IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXQvQ1ZFLTIwMjItNDA2NzQucGF0Y2gKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9leHBhdC9leHBhdC9DVkUtMjAyMi00MDY3NC5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2V4cGF0L2V4cGF0L0NWRS0yMDIyLTQwNjc0LnBhdGNo
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjhiOTVmNWYxOTgKLS0tIC9k
ZXYvbnVsbAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9leHBhdC9leHBhdC9DVkUtMjAyMi00MDY3
NC5wYXRjaApAQCAtMCwwICsxLDUzIEBACitGcm9tIDRhMzJkYTg3ZTkzMWJhNTQzOTNkNDY1YmI3
N2M0MGI1YzMzZDM0M2IgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBSaG9kcmkgSmFt
ZXMgPHJob2RyaUB3aWxkZWJlZXN0Lm9yZy51az4KK0RhdGU6IFdlZCwgMTcgQXVnIDIwMjIgMTg6
MjY6MTggKzAxMDAKK1N1YmplY3Q6IFtQQVRDSF0gRW5zdXJlIHJhdyB0YWduYW1lcyBhcmUgc2Fm
ZSBleGl0aW5nIGludGVybmFsRW50aXR5UGFyc2VyCisKK0l0IGlzIHBvc3NpYmxlIHRvIGNvbmNv
Y3QgYSBzaXR1YXRpb24gaW4gd2hpY2ggcGFyc2luZyBpcworc3VzcGVuZGVkIHdoaWxlIHN1YnN0
aXR1dGluZyBpbiBhbiBpbnRlcm5hbCBlbnRpdHksIHNvIHRoYXQKK1hNTF9SZXN1bWVQYXJzZXIg
ZGlyZWN0bHkgdXNlcyBpbnRlcm5hbEVudGl0eVByb2Nlc3NvciBhcworaXRzIHByb2Nlc3Nvci4g
IElmIHRoZSBzdWJzZXF1ZW50IHBhcnNlIGluY2x1ZGVzIHNvbWUgdW5jbG9zZWQKK3RhZ3MsIHRo
aXMgd2lsbCByZXR1cm4gd2l0aG91dCBjYWxsaW5nIHN0b3JlUmF3TmFtZXMgdG8gZW5zdXJlCit0
aGF0IHRoZSByYXcgdmVyc2lvbnMgb2YgdGhlIHRhZyBuYW1lcyBhcmUgc3RvcmVkIGluIG1lbW9y
eSBvdGhlcgordGhhbiB0aGUgcGFyc2UgYnVmZmVyIGl0c2VsZi4gIElmIHRoZSBwYXJzZSBidWZm
ZXIgaXMgdGhlbiBjaGFuZ2VkCitvciByZWFsbG9jYXRlZCAoZm9yIGV4YW1wbGUgaWYgcHJvY2Vz
c2luZyBhIGZpbGUgbGluZSBieSBsaW5lKSwKK2JhZG5lc3Mgd2lsbCBlbnN1ZS4KKworVGhpcyBw
YXRjaCBlbnN1cmVzIHN0b3JlUmF3TmFtZXMgaXMgYWx3YXlzIGNhbGxlZCB3aGVuIG5lZWRlZAor
YWZ0ZXIgY2FsbGluZyBkb0NvbnRlbnQuICBUaGUgZWFybGllciBjYWxsIGRvIGRvQ29udGVudCBk
b2VzCitub3QgbmVlZCB0aGUgc2FtZSBwcm90ZWN0aW9uOyBpdCBvbmx5IGRlYWxzIHdpdGggZW50
aXR5CitzdWJzdGl0dXRpb24sIHdoaWNoIGNhbm5vdCBsZWF2ZSB1bmJhbGFuY2VkIHRhZ3MsIGFu
ZCBpbiBhbnkKK2Nhc2UgdGhlIHJhdyBuYW1lcyB3aWxsIGJlIHBvaW50aW5nIGludG8gdGhlIHN0
b3JlZCBlbnRpdHkKK3ZhbHVlIG5vdCB0aGUgcGFyc2UgYnVmZmVyLgorCitVcHN0cmVhbS1TdGF0
dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGh1Yi5jb20vbGliZXhwYXQvbGliZXhwYXQvY29tbWl0
LzRhMzJkYTg3ZTkzMWJhNTQzOTNkNDY1YmI3N2M0MGI1YzMzZDM0M2JdCitDVkU6IENWRS0yMDIy
LTQwNjc0CitTaWduZWQtb2ZmLWJ5OiBWaXJlbmRyYSBUaGFrdXIgPHZpcmVuZHJha0BrcGl0LmNv
bT4KKy0tLQorIGV4cGF0L2xpYi94bWxwYXJzZS5jIHwgMTMgKysrKysrKysrLS0tLQorIDEgZmls
ZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCisKK0luZGV4OiBleHBh
dC9saWIveG1scGFyc2UuYworPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PQorLS0tIGEvbGliL3htbHBhcnNlLmMKKysrKyBi
L2xpYi94bWxwYXJzZS5jCitAQCAtNTY1NywxMCArNTY1NywxNSBAQCBpbnRlcm5hbEVudGl0eVBy
b2Nlc3NvcihYTUxfUGFyc2VyIHBhcnNlCisgICB7CisgICAgIHBhcnNlci0+bV9wcm9jZXNzb3Ig
PSBjb250ZW50UHJvY2Vzc29yOworICAgICAvKiBzZWUgZXh0ZXJuYWxFbnRpdHlDb250ZW50UHJv
Y2Vzc29yIHZzIGNvbnRlbnRQcm9jZXNzb3IgKi8KKy0gICAgcmV0dXJuIGRvQ29udGVudChwYXJz
ZXIsIHBhcnNlci0+bV9wYXJlbnRQYXJzZXIgPyAxIDogMCwgcGFyc2VyLT5tX2VuY29kaW5nLAor
LSAgICAgICAgICAgICAgICAgICAgIHMsIGVuZCwgbmV4dFB0ciwKKy0gICAgICAgICAgICAgICAg
ICAgICAoWE1MX0Jvb2wpISBwYXJzZXItPm1fcGFyc2luZ1N0YXR1cy5maW5hbEJ1ZmZlciwKKy0g
ICAgICAgICAgICAgICAgICAgICBYTUxfQUNDT1VOVF9ESVJFQ1QpOworKyAgICByZXN1bHQgPSBk
b0NvbnRlbnQocGFyc2VyLCBwYXJzZXItPm1fcGFyZW50UGFyc2VyID8gMSA6IDAsCisrICAgICAg
ICAgICAgICAgICAgICAgICBwYXJzZXItPm1fZW5jb2RpbmcsIHMsIGVuZCwgbmV4dFB0ciwKKysg
ICAgICAgICAgICAgICAgICAgICAgIChYTUxfQm9vbCkhIHBhcnNlci0+bV9wYXJzaW5nU3RhdHVz
LmZpbmFsQnVmZmVyLAorKyAgICAgICAgICAgICAgICAgICAgICAgWE1MX0FDQ09VTlRfRElSRUNU
KTsKKysgICAgaWYgKHJlc3VsdCA9PSBYTUxfRVJST1JfTk9ORSkgeworKyAgICAgIGlmICghIHN0
b3JlUmF3TmFtZXMocGFyc2VyKSkKKysgICAgICAgIHJldHVybiBYTUxfRVJST1JfTk9fTUVNT1JZ
OworKyAgICB9CisrICAgIHJldHVybiByZXN1bHQ7CisgICB9CisgfQorIApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXRfMi4yLjkuYmIgYi9tZXRhL3JlY2lwZXMtY29y
ZS9leHBhdC9leHBhdF8yLjIuOS5iYgppbmRleCBmNTBlNTM1OTIyLi41NzhlZGZjYmZmIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9leHBhdC9leHBhdF8yLjIuOS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtY29yZS9leHBhdC9leHBhdF8yLjIuOS5iYgpAQCAtMjAsNiArMjAsNyBAQCBTUkNf
VVJJID0gImdpdDovL2dpdGh1Yi5jb20vbGliZXhwYXQvbGliZXhwYXQuZ2l0O3Byb3RvY29sPWh0
dHBzO2JyYW5jaD1tYXN0ZXIgXAogICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjItMjUzMTQucGF0
Y2ggXAogICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjItMjUzMTUucGF0Y2ggXAogICAgICAgICAg
ICBmaWxlOi8vbGlidG9vbC10YWcucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjIt
NDA2NzQucGF0Y2ggXAogICAgICAgICAgIgogCiBTUkNSRVYgPSAiYTdiYzI2YjY5NzY4ZjdmYjI0
ZjBjNzk3NmZhZTI0YjE1N2I4NWIxMyIKLS0gCjIuMTcuMQoK

--_004_MAXPR01MB4327C1717B03551D15F32EE69D4E9MAXPR01MB4327INDP_--

