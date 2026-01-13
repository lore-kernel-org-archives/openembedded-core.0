Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1934C9EC8C
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:04:40 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55617.1768298670197985787
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:04:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=nmecsgvD;
 spf=pass (domain: est.tech, ip: 52.101.69.5, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HvmgnI2qimB9epo4+ow4b1s629dNOuApUyoDhiHqXoB+UXR1bATQva1dU58MXk+xSfgSaC6YKzDQN9vCTryMSbqc+U/8WkhiFHkJsVhjs3GS60SUzGIkmAcDJ/U8GjMq1KStpkkYliWyzkaICN6xPeUl1R25rlYxH8sAtXrkCyYAapuWY4Dq8QTrjuHc7n2SElMDbLDd53j75HVdHcD5yAvw/YK4txNrRlJhzWe5eldyV2Tb/EwfoJlHltIUUzwmP1+teolGuKgwnicdjbBJkDRg/hcO4z4n16cxanL6GqC+NTiB31xoLcg0t8BaxSO1gYGA7rD3rgEx00Mh8g6kPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/Alpji5BFzG6ejx+Zan9CF81WmUCJE2QwQok69QcG8=;
 b=rPzuIHOJCuw3tQH4QIJZXPmhwbKQA+PNzJTdzPpWEY0s3/eoNL61IERPI5GUxplVOpI+Aoly1aEeMMPqv0QpqlyN1PnBQer9XkIMhT0GsT1r82/3D9lZln0OdfjFQOtDfBBVUiPc9KsuqdHijmqlxTt/UnA4pwU5uqT1kKK21WIaxXvgZH2je1K8BFvvwsIOoWpZg8y32UfGtqK2yxor+eC7WbzwtXex2QomxfP/GDx35nALv2+bVlgtML/qanLNMlphBkqTkHlM/DiaoBvuMhgGUCi1B8mWfBMhTM7gzYQiQGmwJS1YPF/FXHm1De4W5nB/9Qn1J9NPIwoyMFNP3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/Alpji5BFzG6ejx+Zan9CF81WmUCJE2QwQok69QcG8=;
 b=nmecsgvDzANmEzZnBKJg/iSM9/GxaWKtokLM625Di04/Mz3/OyS5oz1+84YVj/kGXLvrL+4UTKIqDrBZgDGJzQIClsAzJJPpU+4iTqvWA7OCQqflHU95s3UOvaW+YTKHzgQCd3x+W+V8d5hgZphVayWrc5HMM9KYMKFTLZA+WQQZDW7159HhB376g5ckdS7DUDdl80Sh6ZuFhZ53+rOht6J0nt/ZEWMMniTweJtb1Mft6HInG5af0l38dkwpv4SZXM6NxxiGXbCAsKE2iy6gDjPbQXHS07YSj1zgKlQOMCBW5zxeNU7hIp6RbezF60MaTxiO7Z6NAm16VvmMAS0bjw==
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by FRWP189MB3200.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:17c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 10:04:25 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::3cc6:ccd5:b124:2a6a]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::3cc6:ccd5:b124:2a6a%7]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 10:04:25 +0000
From: Amaury Couderc <amaury.couderc@est.tech>
To: Quentin Schulz <quentin.schulz@cherry.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [review][OE-core][scarthgap][PATCH] libtasn1:
 Stack-based_buffer_overflow_fix
Thread-Topic: [review][OE-core][scarthgap][PATCH] libtasn1:
 Stack-based_buffer_overflow_fix
Thread-Index: AQHcg9yZiTcxFKlbe0qsbGjsTxK5+rVOsvQAgAEOpNGAABX7AIAACG70
Date: Tue, 13 Jan 2026 10:04:25 +0000
Message-ID: 
 <AMBP189MB3196CE3D32E2EC81F77BBB54F88EA@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
References: <20260112160031.71913-1-amaury.couderc@est.tech>
 <22438428-9339-4abe-a7ce-59524ca33cac@cherry.de>
 <AMBP189MB3196A11C869915431C0CE336F88EA@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
 <cad6d36c-6b13-41c5-86c9-e63c65d09304@cherry.de>
In-Reply-To: <cad6d36c-6b13-41c5-86c9-e63c65d09304@cherry.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBP189MB3196:EE_|FRWP189MB3200:EE_
x-ms-office365-filtering-correlation-id: 0685f0ed-6c32-424b-0ae6-08de528b21de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|7053199007|13003099007|8096899003;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?GqjkU4S2t1i3ho4Gkb2qkEotfLjQBHN14sgX0Yrg0k1SfKyzcqpgF+PVx8Dz?=
 =?us-ascii?Q?vk95cJBS/Bj2ZrRIzCmIoh4/mghymX7V5rA7rJ5q/0J5ZGZAWa5rwxN4PLg5?=
 =?us-ascii?Q?z9+LAAw992lRpTSLXVLW3tjuijuu6lo48bwVRoVk7FND9PCIgzG4zpk5B1A9?=
 =?us-ascii?Q?/94iN28jtXnAhWhYMyxD278c8IIMw686vI8XVIiRoSbbyBPRK8lqlr38Bq3U?=
 =?us-ascii?Q?5ENJe+dcQPSO4fNEPH+offyBeqYaiUv/raVRz1lXxPAcwG5xGcAZELF3ogsz?=
 =?us-ascii?Q?arVKBnD5MLQqd0oFGKL+2xlPbwkn9Uf6gUPfTlgWk5Et23jiq5Nehu7pLjAq?=
 =?us-ascii?Q?06+Owyji08+KuG6uTkJbxkrKpY+M/ka8xRTKbyEnYsIR1TQmc3xh/njFmnIi?=
 =?us-ascii?Q?61YvHQQA0OTzfypgmBDzJWvmrYsfoJ8C7fuOJhgo5TJnhfYiQwpVrse8MCrt?=
 =?us-ascii?Q?4XBx2XagnUVfRRbhmZTxu1bFLV47qbyx4+4WKspBO6kllTnE4b9X0Y+Re8jZ?=
 =?us-ascii?Q?MA6/FIf2mgt9GYmqN4N2cnmmzvtURMtNFEXE2U8H7vhnyCyIfSE1RMh6rzCS?=
 =?us-ascii?Q?F0/9bEKsefbbK6WnD/SsisKgiej5JGc7TYG+hOk75QV3GAaGIPp05vepKUAB?=
 =?us-ascii?Q?yfXk0V8HBtNlJjSf6QRAu3I0HwkFxoIFmxlIIhwJ7eGntbmVjAXgUFp4zQUN?=
 =?us-ascii?Q?64FL1z+ISIItnjCIfPrdWbr/XC/DSraHAx0qGX2H/VEO61DtHniw2ownz+TH?=
 =?us-ascii?Q?Qj9MtvnPvxRxUbD9FsY8uZIAfzkPUM0GfXMaFBg9bvkCJW9Nj5sD+VP/CWI4?=
 =?us-ascii?Q?cnyCYw55+q3nnI3ieUg2GAWEKjPuUfOVWDMLao0+N3BHqqQyILKywD1HINYz?=
 =?us-ascii?Q?zynWFF9iL+3puxsFCOM+3Rc2yeTWycLrlpbLe9LXz57jRWlRgQ6VNJc47XPw?=
 =?us-ascii?Q?Ngh7jBV8H2X9Bu86K8C8s6HXlj14yf7MlCZuRgYV7dtS+nAJq7T+qqFe5nGP?=
 =?us-ascii?Q?tv3oiQzru0GVLeBAajoj/6hUe5fXZiGanhRi2j4n/LNACb3P1l7M8X5PcNzo?=
 =?us-ascii?Q?MSutsbb4A7nJYugNnsqKEZ8a1zaqjice55YaI8+wGAIF3gzyx/T4NFHrtShd?=
 =?us-ascii?Q?rj2MYd3R/d6f2ohD0qG+2Wd5Z2xN1wklXZVNY37Wcz7JrCxcuLpNB9sSiLKs?=
 =?us-ascii?Q?8LsF9hYdelyZbT6BjpObm30SAAyC1VqKIl+fpVvyAH2XdlcXFvGcbTfnNHH3?=
 =?us-ascii?Q?95gYmAbhifP0JadQaSYCdCCakggu0QSIv4NzUi0qGTQXOJwnEOqpS4lhrAVc?=
 =?us-ascii?Q?Jxt+SHJL6+kykKQuJiWb4Ahdxr3bNd52eCnKE7RVmKUTsaH9rAs/WyNsffvz?=
 =?us-ascii?Q?9/PjKlWIbV5Ir+LMuraZQ5dmY/WV/HZH9sCKMcAqQR6p7Kg+/VhkSSIdaFOd?=
 =?us-ascii?Q?uSxh2C/kxtlZ5myVLhfW2eJJ2XfOfv89?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007)(13003099007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?W8BixWXUf1ke+vmGPt5e/0vGCZOqJI72+VFwZXWO0GFUuzAf2bZ8MljYy+OC?=
 =?us-ascii?Q?DimOjSQFUjZeL+tw4V1xQKw0mktdXVQT3oRzctZZycp/U1/cDo7wP+7PPzEv?=
 =?us-ascii?Q?y5NrdssRw4zfz1sFUsdNQmk+Lah/FdOL0+5kdDFUK1TZEELFzqqfwQCR+pyb?=
 =?us-ascii?Q?rFWoUAOWNRuDdc+QSnrEExAQ9jGym0dw95uhRqaOwL7HhSGAfrJP/xUXMn9t?=
 =?us-ascii?Q?hbsp8oRl066NDG3sEJDs/Dcv5p1Ot3PA5hEL8YzDiNqnb6H8/HuAZgdO6J5G?=
 =?us-ascii?Q?w/7UH/oBV1iM30gLACH4xfW1bMHBgD/mojtfmvttqUoOgiECIzJo1pfOo/ZI?=
 =?us-ascii?Q?OfnQwnpjXjSMUMXJJBR3kAQf8BhLueApUi/cX+4nO6zyrvH/lL8XAYpU65+C?=
 =?us-ascii?Q?wExwLSex+mKPetRZIoxJNtlTsi+K10FwdZ/0Hb07KWf1wP0wTRJrDdSNZUzS?=
 =?us-ascii?Q?X+AN0yYEQ/3QLyFZDmOFNr7f0o+w2FNdlfMyDOx3YUeA2w16maAGkd4hBw71?=
 =?us-ascii?Q?CytdYi2x6Rft1lmAnq/oMSvfRgZraM63GU2WvBGJat8XPfN+FdG15o5c5PEa?=
 =?us-ascii?Q?cPc70DozXdb6+AXIaww8cCbClLBkzxmMv0WJd2HBSpNriZ5rYUo9r+4BVXLV?=
 =?us-ascii?Q?/Z9Up6EWmX2rGyghbRgnw0bdh3eI5XgN559I2ce/yltex7ZByJv+zRqTKL74?=
 =?us-ascii?Q?w5UnzsSTQaKJ3GIKKdUgo4aSUwvZogc/cF/fUfoNqe2K0mLfVWWeGlNFqlwh?=
 =?us-ascii?Q?TrSKa2D1dN9O7rMUu5za1087tClurvicsKwqQe6x2FK6AXodRbuD+PFKrcls?=
 =?us-ascii?Q?lMF/hUW6tuW0ACUuvb+pQPpjiR+ULURVq232BsAnAWyAeQyTvblC5VQ5YRkg?=
 =?us-ascii?Q?V7Hz+JtJPj6UkTQUjKXnm268z3dIREYoATyY7A/72hsKxJ6z68H4X28jWr7D?=
 =?us-ascii?Q?d58bUY0dnNxclqot9AdYGiuorEv8CiPMGaTu8q/TypvPqg1mAWkqHOjPkzpj?=
 =?us-ascii?Q?Yys3r13FJyVgaKWL5equ5Ej4rH76nLiDhgUfYWmcPA/Rr4MZ58l5psNkJCBr?=
 =?us-ascii?Q?wnAEND5jA6LZ1LOMZrjU6ei3svO5ICMkdvVBKMGKP78izxctWGoohwmN3REZ?=
 =?us-ascii?Q?U3k+glOQ0E8pLzRoCkEMY/W8dCQPWr7NSEnJ5TbcVKWvTi1QF/0ODLMis0Mi?=
 =?us-ascii?Q?Y1nhj30X9eG+cws3hGmO7ghDlksXeg8t1ipIkz5ZO3a0C660/7UzC9OdmEDo?=
 =?us-ascii?Q?Z1sCKv6OmlmQxw1Ro9N1UuVUg0XSz/l8KAn/FS0xlwBcL3+kruNyooOZRfAO?=
 =?us-ascii?Q?xsg4tJfm1LOSthRsz9q0apoCiaw14QeQ3nhhzUKgYUQa6jemPbldiw5Qq4Lh?=
 =?us-ascii?Q?np6DktVRYMjj4QavbQpVBLtI2jdmPmLRlNPSHHorULLtJDN00npnNqABMEhQ?=
 =?us-ascii?Q?Wv+y29zsXWsMXvoMCrQPf7+HFN7fbdXofq76iGAIv6d2AmhVZtqXYKsSniQ6?=
 =?us-ascii?Q?HBVVb2N6sLqFdMC3qnWk2tPJb09s8QIWA0KEjjdCASNc3yoTu0C3+pAFGNRE?=
 =?us-ascii?Q?/Q3OSLnd+hx01AloWQjRmVfye+RaBWL4lu7bjk8L8TlUxC5YQYSxR8cNS4sp?=
 =?us-ascii?Q?6g4BqUGMFi79jdYohUYGmM3Ziym9/0GI6pRPWkRnMz5AVHIPU1oNBpMyZ7Eg?=
 =?us-ascii?Q?Ih4fgWJmv58xJ7+sByGpUX8ZAygQS2rD+JuQelqRk6w94mPv0p2v2+6UlsCQ?=
 =?us-ascii?Q?d1gp2O+pyQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AMBP189MB3196CE3D32E2EC81F77BBB54F88EAAMBP189MB3196EURP_"
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0685f0ed-6c32-424b-0ae6-08de528b21de
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 10:04:25.5096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nVjjg6x80+olurYy+VvsKcQpNbPf2yEbT3lYGJ1e13GBHI4Sf6ptdDBVPKRdjDXjRdwNeQPeVHYupxxiA6nMwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3200
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229238

--_000_AMBP189MB3196CE3D32E2EC81F77BBB54F88EAAMBP189MB3196EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Quentin,

My bad, I will do that for future emails.

Kind Regards,

Amaury
________________________________
From: Quentin Schulz <quentin.schulz@cherry.de>
Sent: Tuesday, January 13, 2026 10:33 AM
To: Amaury Couderc <amaury.couderc@est.tech>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [review][OE-core][scarthgap][PATCH] libtasn1: Stack-based_buff=
er_overflow_fix

Hi Amaury,

Please use "Reply All" when answering to mails on the mailing list so
that the conversation stays public and is archived, adding the ML back
in Cc myself.

On 1/13/26 10:10 AM, Amaury Couderc wrote:
> Hi Quentin,
>
> I tested the patch on scarthgap, but I think it should be applicable on a=
ll the releases.
>

https://docs.yoctoproject.org/contributor-guide/submit-changes.html#submitt=
ing-changes-to-stable-release-branches

This is then clearly matching the description in point 2.2. It must be
tested and sent against master first and then it can be backported to
older-but-still-supported releases afterwards.

Thanks,
Quentin

--_000_AMBP189MB3196CE3D32E2EC81F77BBB54F88EAAMBP189MB3196EURP_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Quentin,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
My bad, I will do that for future emails.</div>
<div class=3D"elementToProof" id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Kind Regards,</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, &quot;Aptos_EmbeddedFont&quot;, &quot;Apt=
os_MSFontService&quot;, Calibri, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);" class=3D"elementToProof">
Amaury</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Quentin Schulz &lt;qu=
entin.schulz@cherry.de&gt;<br>
<b>Sent:</b> Tuesday, January 13, 2026 10:33 AM<br>
<b>To:</b> Amaury Couderc &lt;amaury.couderc@est.tech&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [review][OE-core][scarthgap][PATCH] libtasn1: Stack-bas=
ed_buffer_overflow_fix</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Amaury,<br>
<br>
Please use &quot;Reply All&quot; when answering to mails on the mailing lis=
t so <br>
that the conversation stays public and is archived, adding the ML back <br>
in Cc myself.<br>
<br>
On 1/13/26 10:10 AM, Amaury Couderc wrote:<br>
&gt; Hi Quentin,<br>
&gt; <br>
&gt; I tested the patch on scarthgap, but I think it should be applicable o=
n all the releases.<br>
&gt; <br>
<br>
<a href=3D"https://docs.yoctoproject.org/contributor-guide/submit-changes.h=
tml#submitting-changes-to-stable-release-branches">https://docs.yoctoprojec=
t.org/contributor-guide/submit-changes.html#submitting-changes-to-stable-re=
lease-branches</a><br>
<br>
This is then clearly matching the description in point 2.2. It must be <br>
tested and sent against master first and then it can be backported to <br>
older-but-still-supported releases afterwards.<br>
<br>
Thanks,<br>
Quentin<br>
</div>
</span></font></div>
</body>
</html>

--_000_AMBP189MB3196CE3D32E2EC81F77BBB54F88EAAMBP189MB3196EURP_--

