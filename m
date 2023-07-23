Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624C9C001DC
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 11:14:54 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.87])
 by mx.groups.io with SMTP id smtpd.web10.23559.1690110885360994865
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 04:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=PGsjXiu1;
 spf=pass (domain: siemens.com, ip: 40.107.13.87, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOw9/AkjspvqQwjNrcoOiIleu4acpBaY/SnQxc8rOil5gKsicli8bzv0Rdm8LBkaRm4iQcVRs4fd8rIIf+7akEa5+p6Dra8Tl4jgtyg0+S9FjIjCEMStGRRw8/08X7cFBFVWYTqpn8FlFrV6z3upTlX4arHNwvSIUsevsF2ROy/bKJj+/tfiJGCgAJTRyVTtBP6L6435S5yKsjonqyrAOny9n9eZ8FlJ9cVUAnM0jbOxqyv/ehRo2sdRPbltvjn7n9pbGTdIudCogFRMmcGjeAhsdZhsQ16IXe7T9xvL6BJBMyKf/sSRGP0cpBfObP7jdKqV8Lx99+nljoTKP62joA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DO+7e3bzYqovk6qLG6e1UbdrvyHf+fHIIi6pl3pb8Ww=;
 b=fyUcZXlW1FIoOhdwJIAUtSKciDGepfuiPZqix307PSJ/tDormrJW4X9OYebhpBg2efTbl1hPANQtrLX5ag8v4qtwtTyPn+AG+MGRTxgZawB4JKKVy29NWj7XBJ58gCCvT/XfRo1TA9wgUa8lZ/+Hq/Fsrfv1jse8ISEbDr2POwMgH4Nh4dkelo36YXgQU+apKMhsNfHHtzDs5rLUh0j/L42QUXoAPsg8qwiNAXR+SSBeti65CjolOq4u9w5FufnnH2LwM2XDYIyZ0ktJMj0BnviTLwGza5DnWeeXNUzyInHMACOInQBMNsAfJSSYMRUaS8a5wNYm8XEGo6rwVQ9RXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DO+7e3bzYqovk6qLG6e1UbdrvyHf+fHIIi6pl3pb8Ww=;
 b=PGsjXiu1fPxZl0cNDnWTtZOiJZBmpgT3vK9Gkwks8aASmh/SEov9V+UXdy38hCU68oi6yllRnrTQOrgSGjNHb0Yx8g/aHaYV+US5+ZOQ9QD0s8sqXaAxOm4XyJAhPWGDJBbvlS+iUt3Pht6mB6mY4k/QgJe+laTLQFkeui6vO6opVn8ixy5WfoldRkmDLNsVqhgZArJYStmpruH52plghHm6Vjl/amk1rAZhMraWwiYhCIBEc6Wj5+X9CpS+0PTVKHZOiDtFnYj633VPbdvM4qaJ9Eow6aS72GycXHRl627XGEbl3fqCB9gzV2j8z0kG/TX9F05KPe6pq/VVioCorA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS4PR10MB5372.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4bc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Sun, 23 Jul
 2023 11:14:41 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c9fa:bee4:b946:d961]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c9fa:bee4:b946:d961%6]) with mapi id 15.20.6609.031; Sun, 23 Jul 2023
 11:14:41 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][dunfell][PATCH] libjpeg-turbo: patch CVE-2023-2804
Thread-Topic: [OE-core][dunfell][PATCH] libjpeg-turbo: patch CVE-2023-2804
Thread-Index: AQHZvVX7XsMsEvj6xUeKIzkftu2zUq/HMsCw
Date: Sun, 23 Jul 2023 11:14:41 +0000
Message-ID: 
 <AS1PR10MB5697E35C43460D8280B990F4FD3DA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <17747A89D30F956A.25264@lists.openembedded.org>
In-Reply-To: <17747A89D30F956A.25264@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-07-23T11:14:39Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=96284548-c7dc-46ff-959c-81806e06eb8a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS4PR10MB5372:EE_
x-ms-office365-filtering-correlation-id: 2dccde96-3151-4f67-f555-08db8b6e02f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dQkeahtbCTLF02kdFVpXgbU/Ye43bKSrDe5nhIGko1Y2/966yLvQHCuRE7sBWSqO4AqRh8rdArm2+YGyu9HRJmip1Yrn7hysjEuY8bR84ZxijEImao7189PSjji08C12geBhNmgxxvsfqIKcQIrKLvZ3mxb9ZHB+rptfe8BpV2jRikaD2qpz7Jc6xJ6Eoo12kIlvrYTuhdU3peLBqVMXZTvU1tiBRhBIfUz2r6oFZzpZPSzQXYWS5OFoaATzCe+S46nORIIkXLOg5VwqeUrmHe44ENSub9Mq4SMTw5IzpR7QjX1PBXq+/0k5TjqvhPsIt5uFqbuCh0JczglrBk1ZXRJeR5HJg5lunEkbd4fAEFhcMmeovUpmHLCuAfvqcN+/5nMPOv0wAiMBZANxOagyK9Syo8uncgWhIwLBCjx9Snm+hiWhJ9hSHBVxhrLByJhVx1Kp1MCmraUMQ7qJ5YDQN7BjKQQz45at2MTOzToKU3Os4Fa6HG+t0aFA6xyhzMG7q2o2vdmoJWi7hitBgQcppF6vB9/P454bQDQ/mYawupKo+f/KydAYIqJOqQANbwmE+wvdIMA97Z7VpOkflJoL0u+HfiXAHDynbSg+fWzE5QsGu4mohSwXEhwPp0/a6AEPabzP3J6aiD8kYo7KcSM4Vg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(451199021)(5660300002)(52536014)(316002)(8936002)(8676002)(41300700001)(2906002)(66476007)(66446008)(66556008)(64756008)(76116006)(66946007)(26005)(38070700005)(55236004)(53546011)(6506007)(38100700002)(55016003)(83380400001)(9686003)(966005)(86362001)(7696005)(6916009)(478600001)(33656002)(71200400001)(122000001)(82960400001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DNXGYiFN8Oyvmd03GA+hUWq6CUWGurz2tU/QRwx/pvNhYJuPlbEwcG+kPJv8?=
 =?us-ascii?Q?S5RHZSTyT2WrwA+LiZ2qWPOzS+SAaI327WQ1uuwJL9nNXaHCMvqH1/mGCjqI?=
 =?us-ascii?Q?0erPucyqq6sz3rh2/8VDz13INmU1Fne6OnVItx0tRzFu3AA0LgTQ7iPIsPBJ?=
 =?us-ascii?Q?pVGGGsUlMi0kNO0q5Aj3Rdj5tsu+kI4acMuUL9vI19+fMRZkgJsZhIlW5mVe?=
 =?us-ascii?Q?k7DZGIzGEINTmhlI0EcLo7f4NSo4QXhSFsIDt1JlM3M1d1Whv5kqxMcsF8aI?=
 =?us-ascii?Q?bx67aQPcQB1m3Bj11OSGEpqBuaboMuwU7UiPWiIQ3Aw0sHi/iVTteQNYrNLa?=
 =?us-ascii?Q?2eSaUhgBB0/iu2U7cf/cabJYDGsnTm228EBqLO1TmPZxrZMo7jpmGywDmyjD?=
 =?us-ascii?Q?p/FYWLyV6vu+q4o73yjg/0lzzbSWAUwJRi9U+lI3LXPf3IL/Qp88uCEm00qd?=
 =?us-ascii?Q?XacCaKVTVeWaY742c1e3HYLBjUkyAHONND8NvuPkTqrTVg54HOqvwENUxlMy?=
 =?us-ascii?Q?RSl8HPN+YSuCa+p6ZM4cXMt0pr6RoM5xqRSPCqvH+r5iPiOgkeSrJybC1bru?=
 =?us-ascii?Q?hXlWILGgm1Lcq3po75r4rKb+1LhstrtmABFf25BnskZZ+QlCdF+ZCV65xhw1?=
 =?us-ascii?Q?tHy+g6TZg0sZTDezlWY+GjJHBWVngTR5OkryQFjbVtfuJpPF87euhPEwsiy+?=
 =?us-ascii?Q?75QYNz7Z+3KTzwEPIT6oJgQGXwa8Q1i5pXDuxtFhJGI//1yZptnKkngABN0w?=
 =?us-ascii?Q?3qfBE8MovCowEeAAU1e2FeawoSTopVMHeU8USi6iynXqwrBoQDClQ3XSbnHP?=
 =?us-ascii?Q?lAXHSY9JFzhoP3EAwwF0utpdeJFfTX2bGCj60He3DvYlf+dWH4kN7EHNQukE?=
 =?us-ascii?Q?7wgElxCsBcox1ACUwdrtQO6wCIU2kbNbYj9H1EyT642BZaeFFR5J78mwD0HV?=
 =?us-ascii?Q?JROJv1Dj9dI/UMzk6wlbz4Qs/WmpUxKL/SjUD+oQQC31JfykVuGw8gMMC30/?=
 =?us-ascii?Q?lSLmSPvDyjPWpsY/ezANM6RMsxyptLC3HM/AIrz67DXAzMg4q7yZexgsQaf0?=
 =?us-ascii?Q?vEGtVwijol0fzi1l6I2OQ0C1z2gA7vcAD4NK2+HzIONtg8ZuSS5nrrS/9/k6?=
 =?us-ascii?Q?r61nQL+Kgk4vD6q0lRxISqaPXDqvtATTbZ+G4hCXHhcnd0pNbp6GLF2si173?=
 =?us-ascii?Q?pjvBNJM4o41qm09OITZFfSInUEx6iz85sEIwbywircam3fZOuAmaTx/xBh8V?=
 =?us-ascii?Q?dviF1kNtcm5kB34/JxAtSCPcMynp/A0+vxXzl0AZS+ned3bSx5V3r0i4m74T?=
 =?us-ascii?Q?sXQX8vGiM86P1p/wgxUupe0GrtgY3TSwk6U8YTiNPJkAie34LlTecBnnn4/t?=
 =?us-ascii?Q?w4mmzNn4mFHM242SURbjbyc7sLAFC+PPhu/qnFUx8z6E9XwnVtiRdvEqcEBi?=
 =?us-ascii?Q?8/tk690/2O7HBFF4PDLyp2CXo4Dr4NajBx0X766CF8ZyOc+KU15KNFJqzepY?=
 =?us-ascii?Q?j5ID+c7vAlpP84iDQ6XMR1x2mJKDubeHlRtJfpvsjGh7lHZK0/bs3suZNIe/?=
 =?us-ascii?Q?WIW252R1EPGsUr5tgiP2Z2GDLXs8ehvLn+gJZF1t?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dccde96-3151-4f67-f555-08db8b6e02f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2023 11:14:41.4805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lOofUYTUjjfJ8ujz0/AueLJldtfncR+srvC3V8fbvtOJsPpky5WNsxAaRSKOZYomxojNUKqeOFcaD+cxSoe0cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5372
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 11:14:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184747

Please ignore this dunfell patch, I'll send a v2.
Peter

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Peter Marko via lists.openembedded.org
Sent: Sunday, July 23, 2023 13:07
To: openembedded-core@lists.openembedded.org
Cc: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
Subject: [OE-core][dunfell][PATCH] libjpeg-turbo: patch CVE-2023-2804

From: Peter Marko <peter.marko@siemens.com>

Relevant links:
* linked fronm NVD:
  * https://github.com/libjpeg-turbo/libjpeg-turbo/issues/668#issuecomment-=
1492586118
* follow-up analysis:
  * https://github.com/libjpeg-turbo/libjpeg-turbo/issues/668#issuecomment-=
1496473989
  * picked commits fix all issues mentioned in this analysis

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../jpeg/files/CVE-2023-2804-1.patch          | 100 ++++++++++++++++++
 .../jpeg/files/CVE-2023-2804-2.patch          |  75 +++++++++++++
 .../jpeg/libjpeg-turbo_2.0.4.bb               |   2 +
 3 files changed, 177 insertions(+)
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2023-2804-1.patch
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2023-2804-2.patch

diff --git a/meta/recipes-graphics/jpeg/files/CVE-2023-2804-1.patch b/meta/=
recipes-graphics/jpeg/files/CVE-2023-2804-1.patch
new file mode 100644
index 0000000000..b708392d6c
--- /dev/null
+++ b/meta/recipes-graphics/jpeg/files/CVE-2023-2804-1.patch
@@ -0,0 +1,100 @@
+From 9679473547874c472569d54fecce32b463999a9d Mon Sep 17 00:00:00 2001
+From: DRC <information@libjpeg-turbo.org>
+Date: Tue, 4 Apr 2023 19:06:20 -0500
+Subject: [PATCH] Decomp: Don't enable 2-pass color quant w/ RGB565
+
+The 2-pass color quantization algorithm assumes 3-sample pixels. =20
+RGB565 is the only 3-component colorspace that doesn't have 3-sample=20
+pixels, so we need to treat it as a special case when determining=20
+whether to enable 2-pass color quantization.  Otherwise, attempting to=20
+initialize 2-pass color quantization with an RGB565 output buffer could=20
+cause
+prescan_quantize() to read from uninitialized memory and subsequently=20
+underflow/overflow the histogram array.
+
+djpeg is supposed to fail gracefully if both -rgb565 and -colors are=20
+specified, because none of its destination managers (image writers)=20
+support color quantization with RGB565.  However, prescan_quantize()=20
+was called before that could occur.  It is possible but very unlikely=20
+that these issues could have been reproduced in applications other than=20
+djpeg.  The issues involve the use of two features (12-bit precision=20
+and
+RGB565) that are incompatible, and they also involve the use of two=20
+rarely-used legacy features (RGB565 and color quantization) that don't=20
+make much sense when combined.
+
+Fixes #668
+Fixes #671
+Fixes #680
+
+CVE: CVE-2023-2804
+Upstream-Status: Backport=20
+[https://github.com/libjpeg-turbo/libjpeg-turbo/commit/9679473547874c47
+2569d54fecce32b463999a9d]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ ChangeLog.md | 6 ++++++
+ jdmaster.c   | 5 +++--
+ jquant2.c    | 5 +++--
+ 3 files changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/ChangeLog.md b/ChangeLog.md index e605abe73..de0c4d0dd=20
+100644
+--- a/ChangeLog.md
++++ b/ChangeLog.md
+@@ -48,6 +48,12 @@ quality values.
+ input image was not transformed into a progressive JPEG image prior to =20
+decompression.
+=20
++9. Fixed an oversight in 1.4 beta1[8] that caused various segfaults=20
++and buffer overruns when attempting to decompress various=20
++specially-crafted malformed 12-bit-per-component JPEG images using a=20
++12-bit-per-component build of djpeg
++(`-DWITH_12BIT=3D1`) with both color quantization and RGB565 color=20
++conversion enabled.
++
+=20
+ 2.0.8 ESR
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D
+diff --git a/jdmaster.c b/jdmaster.c
+index b20906438..8d8ef9956 100644
+--- a/jdmaster.c
++++ b/jdmaster.c
+@@ -5,7 +5,7 @@
+  * Copyright (C) 1991-1997, Thomas G. Lane.
+  * Modified 2002-2009 by Guido Vollbeding.
+  * libjpeg-turbo Modifications:
+- * Copyright (C) 2009-2011, 2016, D. R. Commander.
++ * Copyright (C) 2009-2011, 2016, 2023, D. R. Commander.
+  * Copyright (C) 2013, Linaro Limited.
+  * Copyright (C) 2015, Google, Inc.
+  * For conditions of distribution and use, see the accompanying=20
+README.ijg @@ -492,7 +492,8 @@ master_selection(j_decompress_ptr cinfo)
+     if (cinfo->raw_data_out)
+       ERREXIT(cinfo, JERR_NOTIMPL);
+     /* 2-pass quantizer only works in 3-component color space. */
+-    if (cinfo->out_color_components !=3D 3) {
++    if (cinfo->out_color_components !=3D 3 ||
++        cinfo->out_color_space =3D=3D JCS_RGB565) {
+       cinfo->enable_1pass_quant =3D TRUE;
+       cinfo->enable_external_quant =3D FALSE;
+       cinfo->enable_2pass_quant =3D FALSE; diff --git a/jquant2.c=20
+b/jquant2.c index 6570613bb..c760380fb 100644
+--- a/jquant2.c
++++ b/jquant2.c
+@@ -4,7 +4,7 @@
+  * This file was part of the Independent JPEG Group's software:
+  * Copyright (C) 1991-1996, Thomas G. Lane.
+  * libjpeg-turbo Modifications:
+- * Copyright (C) 2009, 2014-2015, 2020, D. R. Commander.
++ * Copyright (C) 2009, 2014-2015, 2020, 2023, D. R. Commander.
+  * For conditions of distribution and use, see the accompanying=20
+README.ijg
+  * file.
+  *
+@@ -1230,7 +1230,8 @@ jinit_2pass_quantizer(j_decompress_ptr cinfo)
+   cquantize->error_limiter =3D NULL;
+=20
+   /* Make sure jdmaster didn't give me a case I can't handle */
+-  if (cinfo->out_color_components !=3D 3)
++  if (cinfo->out_color_components !=3D 3 ||
++      cinfo->out_color_space =3D=3D JCS_RGB565)
+     ERREXIT(cinfo, JERR_NOTIMPL);
+=20
+   /* Allocate the histogram/inverse colormap storage */
diff --git a/meta/recipes-graphics/jpeg/files/CVE-2023-2804-2.patch b/meta/=
recipes-graphics/jpeg/files/CVE-2023-2804-2.patch
new file mode 100644
index 0000000000..e32418ae1e
--- /dev/null
+++ b/meta/recipes-graphics/jpeg/files/CVE-2023-2804-2.patch
@@ -0,0 +1,75 @@
+From 0deab87e24ab3106d5332205f829d1846fa65001 Mon Sep 17 00:00:00 2001
+From: DRC <information@libjpeg-turbo.org>
+Date: Thu, 6 Apr 2023 18:33:41 -0500
+Subject: [PATCH] jpeg_crop_scanline: Fix calc w/sclg + 2x4,4x2 samp
+
+When computing the downsampled width for a particular component,
+jpeg_crop_scanline() needs to take into account the fact that the=20
+libjpeg code uses a combination of IDCT scaling and upsampling to=20
+implement 4x2 and 2x4 upsampling with certain decompression scaling=20
+factors.  Failing to account for that led to incomplete upsampling of
+4x2- or 2x4-subsampled components, which caused the color converter to=20
+read from uninitialized memory.  With 12-bit data precision, this=20
+caused a buffer overrun or underrun and subsequent segfault if the=20
+uninitialized memory contained a value that was outside of the valid=20
+sample range (because the color converter uses the value as an array
+index.)
+
+Fixes #669
+
+CVE: CVE-2023-2804
+Upstream-Status: Backport=20
+[https://github.com/libjpeg-turbo/libjpeg-turbo/commit/0deab87e24ab3106
+d5332205f829d1846fa65001]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ ChangeLog.md |  8 ++++++++
+ jdapistd.c   | 10 ++++++----
+ 2 files changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/ChangeLog.md b/ChangeLog.md index de0c4d0dd..159bd1610=20
+100644
+--- a/ChangeLog.md
++++ b/ChangeLog.md
+@@ -54,6 +54,14 @@ overruns when attempting to decompress various=20
+specially-crafted malformed
+ (`-DWITH_12BIT=3D1`) with both color quantization and RGB565 color=20
+conversion  enabled.
+=20
++10. Fixed an issue whereby `jpeg_crop_scanline()` sometimes=20
++miscalculated the downsampled width for components with 4x2 or 2x4=20
++subsampling factors if decompression scaling was enabled.  This caused=20
++the components to be upsampled incompletely, which caused the color=20
++converter to read from uninitialized memory.  With 12-bit data=20
++precision, this caused a buffer overrun or underrun and subsequent=20
++segfault if the sample value read from unitialized memory was outside of =
the valid sample range.
++
+=20
+ 2.0.8 ESR
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D
+diff --git a/jdapistd.c b/jdapistd.c
+index 628626254..eb577928c 100644
+--- a/jdapistd.c
++++ b/jdapistd.c
+@@ -4,7 +4,7 @@
+  * This file was part of the Independent JPEG Group's software:
+  * Copyright (C) 1994-1996, Thomas G. Lane.
+  * libjpeg-turbo Modifications:
+- * Copyright (C) 2010, 2015-2018, 2020, 2022, D. R. Commander.
++ * Copyright (C) 2010, 2015-2018, 2020, 2022-2023, D. R. Commander.
+  * Copyright (C) 2015, Google, Inc.
+  * For conditions of distribution and use, see the accompanying=20
+README.ijg
+  * file.
+@@ -236,9 +236,11 @@ jpeg_crop_scanline(j_decompress_ptr cinfo, JDIMENSION=
 *xoffset,
+     /* Set downsampled_width to the new output width. */
+     orig_downsampled_width =3D compptr->downsampled_width;
+     compptr->downsampled_width =3D
+-      (JDIMENSION)jdiv_round_up((long)(cinfo->output_width *
+-                                       compptr->h_samp_factor),
+-                                (long)cinfo->max_h_samp_factor);
++      (JDIMENSION)jdiv_round_up((long)cinfo->output_width *
++                                (long)(compptr->h_samp_factor *
++                                       compptr->_DCT_scaled_size),
++                                (long)(cinfo->max_h_samp_factor *
++                                       cinfo->_min_DCT_scaled_size));
+     if (compptr->downsampled_width < 2 && orig_downsampled_width >=3D 2)
+       reinit_upsampler =3D TRUE;
+=20
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb b/meta/recip=
es-graphics/jpeg/libjpeg-turbo_2.0.4.bb
index 630b20300f..fda425c219 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
@@ -16,6 +16,8 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.ta=
r.gz \
            file://CVE-2021-46822.patch \
            file://CVE-2020-35538-1.patch \
            file://CVE-2020-35538-2.patch \
+           file://CVE-2023-2804-1.patch \
+           file://CVE-2023-2804-2.patch \
            "
=20
 SRC_URI[md5sum] =3D "d01d9e0c28c27bc0de9f4e2e8ff49855"
--
2.30.2


