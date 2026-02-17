Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F4BE68173
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 11:29:45 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9016.1771322769060522394
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 02:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=QiG0PnKp;
 spf=pass (domain: est.tech, ip: 40.107.130.67, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fq/iIdOy1kmL1PZPH/VUKfr1a0m62v0ngCrDIMXYamYpuutKdOZwfFgOPKiVzgmzEC0U26Y3SSMoRUTZrM2+UstlDQO6TXFDdHqNnJo3SBO7/pu5YMazUdhtvV3uJv2xTFhfoOVIXTGgO3ZCnDwJe9Cg5avuuYlDzokDnYI4/QCj5M5JJxOk0swpDVt4dm/QoXaL3YQnnFdNqCNga8H9xRMBLQU5YoYhKS1oEaTTKgjQuyoBzfR6lRoSkNJY2zD4y3qdKPIh2bkuFLVy5RsQOgjJUojBBo3i0+smsH0fnUdIu9bMx76M3giw6NsRUX0KVnDykuxXF1IfMY85odkwCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkt1xoNsxva83n6KWkIs5gK2NruFjsg5MotCC9br+jQ=;
 b=WybZ4i5M0mkZCR/kQiZbeK+ykcUzLn6pee687k+QCxTcPsWIfjfQbb1GYyna5txHdRIdrfCz9/6hwz0O3ueZKFsvC2mfxpbEiJJooLi/XPVQ+JhMx0BMUDf/2PPDsx1dWzn1zYa3SIoJqbG/Qej8sRk/tmm/eQkippfjp044RHf4AICreK2XPRnlV6F9l+orvEQ2pB9jlMJ1vBlCGKA5a9DIrKpg5XZasXGeuqryQZcz59kndEv9dZ7LdnXQpEudmUjiEvPw2DRih+NHD7Jg+dz1jouoUBHRwD6ObpcI/LxlCAZdZ4MQGRowWCGbv+jzczhLKbSTLU4Y+rLT0vcVtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkt1xoNsxva83n6KWkIs5gK2NruFjsg5MotCC9br+jQ=;
 b=QiG0PnKpy+0yk88x3ozR6w0tBF0CK2Xx0JIf+sSBnaigEb+oa3mJX0+D5npRHt4SkGwcyPfpKdICcQam4cNZvZPUvHBvpry3NTA9UbL9y0f/JMkI9OIlGZ2L3WZ6Tf62oE4ecb/566DpbRfakZrNpjZKoN4I43EYUl67KV23ly7voFX9Kxk72Dzb9oaLvC/gQ1QrW62qZ7H7Rrh6XNBqFOi2BrMpIjinZwUm+c/3qHKaPH2zC9XZRFAzhftU8QzDDnPxy4SVHQI7uIwKVULcKv2jKAOenSauF4tci2jAb8DnMLNtIb3aXG3Oo5SyzDl8OCg78Hui5jW34Xtz3CNIEA==
Received: from AM9P189MB1666.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:305::16)
 by GV1P189MB3049.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:25b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Tue, 17 Feb
 2026 10:06:02 +0000
Received: from AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 ([fe80::806f:3b74:7216:3e92]) by AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
 ([fe80::806f:3b74:7216:3e92%4]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 10:06:00 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH v4] python3-pip: Backport fix CVE-2026-1703
Thread-Topic: [OE-core][master][PATCH v4] python3-pip: Backport fix
 CVE-2026-1703
Thread-Index: AQHcnPWVFfwAFS8orkiZ1aHK3yADmbWGmy8AgAAUYK4=
Date: Tue, 17 Feb 2026 10:05:59 +0000
Message-ID: 
 <AM9P189MB1666F553B34FF4E105A3B48FB36DA@AM9P189MB1666.EURP189.PROD.OUTLOOK.COM>
References: <20260213143222.102757-1-adarsh.jagadish.kamini@est.tech>
 <DGH3X63VQ28Q.3SWTIURXLCY6X@bootlin.com>
In-Reply-To: <DGH3X63VQ28Q.3SWTIURXLCY6X@bootlin.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9P189MB1666:EE_|GV1P189MB3049:EE_
x-ms-office365-filtering-correlation-id: 372a0484-3766-465f-d7e4-08de6e0c267f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|7053199007|8096899003|13003099007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?nzMW2ECoXJ9MCT+jhc5lJA+0jcsC0h29CPW4S4hOmKnWYTj9am2QY8MyZoR6?=
 =?us-ascii?Q?NlPIXhHqbdM8/EBmLTq8DGUs275sum2lMWONipVpbucioHOQf7fNSN1dQW3K?=
 =?us-ascii?Q?YkzHUeTtQK26MnZBZbZezpVUwWfzCj92V41KMpc29gxaVhF2SYph+x8stg+H?=
 =?us-ascii?Q?Qx7aARyk+t3RQHJAMx2Qutc6Qrb234EOTODCrqou93KHnrrzDaEQJMdxHVDe?=
 =?us-ascii?Q?qfbxAH2GHwQZ7R/6IpypAdAnD7T3SQxt+tOJxGosBhddRdWevxJ6HhWQAdpQ?=
 =?us-ascii?Q?hwk06xvrJ7QFJ/S6uki58+Ai302CpPE6pXowPLSvUWp0iS5JhaWJRnWzKY/t?=
 =?us-ascii?Q?OJHKReeBLwPeRVVgTbs/xfPWgIddNAreRdYKsWBifQi6APZzJlg+U9m+4DxW?=
 =?us-ascii?Q?tGn/K5eUTwkpQmDyzP+S64zs1WsYmEeZxg006VACkFQUhHFCp4NXRd5YnnK1?=
 =?us-ascii?Q?bCHI3w7Gnkl/e/cmwHKyy05N/xRe6ky398rMQyJIlgccrmmVaOpjal7X7d8X?=
 =?us-ascii?Q?p3k7qX46A21KNOy2r09uHS68CQmoBnjqRIAWSFuWO3+kWSJsoP65NhtOAmLz?=
 =?us-ascii?Q?xuuHg7BZepRxSFENJuqZ9wK3eLp+8WsQd7PNVu7zEIZp1bCVYLpe+V4sWu6R?=
 =?us-ascii?Q?w8ZY6okt4HiCSW0jZjtIOvyVObLimxcUqSaYzOKE5pvBjbbdsVawDhy/3W/B?=
 =?us-ascii?Q?qlpnOFRcBl1m6qEIKSoh71Cjswpda/TVOiI81UQBja3LmnN7GW86FZ+t317s?=
 =?us-ascii?Q?84XSsYPMoh3+N99CJNVB5HihcL7sV1H9tK9TZipnEVAvUOVPr+mhzZ9VKUtr?=
 =?us-ascii?Q?ZxjcJn9F1+j1js7JY99qmFoVyc13AN9BUzZQBTLW7XC95HBC14wHE+2Wuege?=
 =?us-ascii?Q?o5grM610z8sEDiJqte3gSGl+g3Pc9QcUiuNTAOY/dDcO6vs0NtThsMarVOIK?=
 =?us-ascii?Q?J00+SFKrMk+UhZvddUnPjMliFttZlgkNljegRCAD2Id+Z6hfmKkLU6RUvfIx?=
 =?us-ascii?Q?GzJjIRNAN5z8mSqKcNrtz35zjQHMGi86PJIRMIXozLSCeRwyNTIt6Es3/e3G?=
 =?us-ascii?Q?METg2jjc6jqDCdS7VG9JygKf8AyDwaqzlmLfwjxPGZn8o2cjZXamceJ2ENsO?=
 =?us-ascii?Q?B/UyzlGbUGO+WXk/JV4mtHykWju/w7mtbvD+FzcACgRnmox9EnEHaLcBIOfe?=
 =?us-ascii?Q?UkABv5TPTZaF5loTUiKFES9HWPIznVEShI3QlHJwxZNhhoVuySlYNL8K+cde?=
 =?us-ascii?Q?vvgFuvwVH4ZqiOFwTcPSheLdyGSYztpMt1d8rW2Nz2DdFIiOrNPyFc2ewE2x?=
 =?us-ascii?Q?JZQBVQ2+rdWtvrQ6RiKO8DCo7flKtw7H7xX6vSWD9BUc07EhR19uanEN5CUB?=
 =?us-ascii?Q?92D15SEaaBxmkRkK8qTt0W9MUAohNQeIB5iDQf02QUuxD2tZnjWv9AjTMeQw?=
 =?us-ascii?Q?6kgxpLg7bTChfQm3jOWm0nW+aFEsSeYmLaUZrxAfTuF2JtwhBNesWgI8YFt9?=
 =?us-ascii?Q?r4T8NY56VcXqa7PTWPsBVTrpChWoWdyISxUkQRVJ5iWziE9ZZZACULNJoEb/?=
 =?us-ascii?Q?2hY2USL86IeIHG42wTY=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1666.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007)(8096899003)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?pylP+IT1v6ukiJ0KlfrQZpvqA0Dz50XJdZ1KYljskXstnDDVemSyoCEt1wf7?=
 =?us-ascii?Q?jVyVEmrvuRNN4XX8ZESfuKb8mSF40+f4LNJwbXWjf1dfFA1o4DP0aA42AwzJ?=
 =?us-ascii?Q?MLOLAnAzjC4m2HJ8RD8vyUFciSbyIsxkayTp3R7f0Gf0WQyqrDsEUVgEL8Y6?=
 =?us-ascii?Q?Y/R0zMX/Ut3V+1er5uRFsr2EveHd2MtTLgx4Hcyv8Pzb3rn3sUItmCvqhnDR?=
 =?us-ascii?Q?3U1QdVson9naKXW+nXyb5Zk8AEcfeBpm08h00vrt1cDHcZ9TAzMxSGjNZhg3?=
 =?us-ascii?Q?XjlxUBpCmffGU5ZgUuPhUvwi0cMSw3Apqxvk776biAYqVrmTd6/s37H/Dfox?=
 =?us-ascii?Q?X17nuX19p09kVjX2YWFDhoBGfGE3N8EfTyX069tUVmiqS4wiq5XitN4Unj+V?=
 =?us-ascii?Q?tb6/35nHC+P1QqFUgfQ4BWF38ZB+VGh2J2DoptbUtUg0JOVwWZHrU9r5A8AG?=
 =?us-ascii?Q?d99WGCR+BPfeYMPYWBR1CMOZ0G0iSF9W3YflUMtDZ5Q2eZFCpn9NjVbybncn?=
 =?us-ascii?Q?E6FcjLeh0sMprH/MB/ZX0dnVXSvQCHB3bAf4iNswmQxl6d/ldhldX/9rui95?=
 =?us-ascii?Q?eT1Vifcy37q+VG9gxYsJBrW15c2x5xnuz1zVUyZW+atUIGSr0wNqr192K5Yw?=
 =?us-ascii?Q?zSeRjz/VskknRBTnsVZPLCu3ni+QKLHAIsLbmw6cnCQ72miYLq1HmZG36tkz?=
 =?us-ascii?Q?Lfk8I3uchIx8nmvjWCnnB5AFssUvNmeZ4GtOprM8NilMl54cJoY97vBk1VQP?=
 =?us-ascii?Q?62FUWJK/IfuWpwoxm1hau2qXyTJKDMZIBj8T1Dd1iKqt/B4TAdwOtco1vafW?=
 =?us-ascii?Q?DO1XsBjY1CdvtmCDtBtoYgX1AjsTVLi/tAUvzwHu3m1SnQr3+PPw6cjcUjRT?=
 =?us-ascii?Q?NhIYdCegjFakdksKv5rT3QWHdea4pnaYPIfeEQkR8bAwkzWFHVtLDRuBN1/W?=
 =?us-ascii?Q?kSKIkfLO/Rz/jolRcA3RYTsEyjPFVlnPNez531D1LwCSXPKBIODdVYoph6yf?=
 =?us-ascii?Q?qn4pHzlyYb05+noGqo6ceCjF7Y93TQIZFDT5oF9mAwjwcUesxw475D/GRfuk?=
 =?us-ascii?Q?PVQe3r0w7HnPagYjCsOC1NOzP5+A9siXiOV2HqWnvrX69wWCaFQ8xzrXLBIJ?=
 =?us-ascii?Q?1VwVLfTagp3p4pfkHelU+LAKfFg6mOQOrOQ58EXAIABQQjtLkpGqn/eVuX92?=
 =?us-ascii?Q?1IwzOXGEqK468CYnkixF8wOYcMI0QY6mxPd92jwUwAaPblPcnmMVxpN0uN+a?=
 =?us-ascii?Q?w4K3/qBdaa1tSmr4CP1ZBnaBWJAPqWLMSJWgdaeSpZniEP5q05N86ZTRvlef?=
 =?us-ascii?Q?gajQFPGIlJyOzlLcIKxPpw1tDSlul4BeBUW2GIbeDFWOybLeI0vM5cucvwoA?=
 =?us-ascii?Q?Qctlu+La9awkXJ3F6bdH+KO7Hnsia4hsaZRRoGIxQqsjEmIhrLOXNmDzaxVv?=
 =?us-ascii?Q?vI+8qAstA2bzi+ivTAOi8Aa4UM41Wyird+SCuf/u1nN4O5m1pRr1rFj2+Xj6?=
 =?us-ascii?Q?kdW1ryMs2kcTSk04mr/zgnn02eRWJ0hdT1Qkfc65utQXf8kJ6+rOxukmb1pX?=
 =?us-ascii?Q?ny9aYpBgDyFjUE9+mPMga1hzanG9xSYtLmftKbpRbNtlQS/9vAwBePF2J9Hr?=
 =?us-ascii?Q?zgm2IIAeGIoOzB66ocXOyIjwKah0WorCoXdMj7DMTKFfARlY31qeINO7wY+z?=
 =?us-ascii?Q?oLUuxkjqKYX9+pw/FxQu4iRlSqJv0/wu1L41VUmPVBrxxJCQrbec2zTpmvKU?=
 =?us-ascii?Q?M0PAw8Dz/g=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1666.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 372a0484-3766-465f-d7e4-08de6e0c267f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 10:05:59.7305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1TV9jf1bE9JZgjr2RB6mBWXFjpENC1Dkv0E5BseFi79Fv5mhAxTWjAC6IR8+p9y8hS8tbgkDGYpz4U1oxp687NAG+MX9WYxv7KrkE0E0zBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB3049
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM9P189MB1666F553B34FF4E105A3B48FB36DAAM9P189MB1666EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 11:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231244

--_000_AM9P189MB1666F553B34FF4E105A3B48FB36DAAM9P189MB1666EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
Alright, I will drop the patch for master, I will check if it is needed for=
 scarthgap.

Thanks!
________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Tuesday, February 17, 2026 09:51
To: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>; openembedded-=
core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH v4] python3-pip: Backport fix CVE-2026=
-1703

On Fri Feb 13, 2026 at 3:32 PM CET, Adarsh Jagadish Kamini wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Include the patch linked in the NVD report: https://github.com/pypa/pip/c=
ommit/8e227a9be4faa9594e05d02ca05a413a2a4e7735
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---

Hi Adarsh,

Thanks for your patch. However python3-pip was recently upgraded to
version 26.0 which includes this fix.

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--_000_AM9P189MB1666F553B34FF4E105A3B48FB36DAAM9P189MB1666EURP_
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
Hi,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Alright, I will drop the patch for master, I will check if it is needed for=
 scarthgap.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks!</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mathieu Dubois-Briand=
 &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>Sent:</b> Tuesday, February 17, 2026 09:51<br>
<b>To:</b> Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;; =
openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openem=
bedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][master][PATCH v4] python3-pip: Backport fix C=
VE-2026-1703</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Fri Feb 13, 2026 at 3:32 PM CET, Adarsh Jagadis=
h Kamini wrote:<br>
&gt; From: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;<b=
r>
&gt;<br>
&gt; Include the patch linked in the NVD report: <a href=3D"https://github.=
com/pypa/pip/commit/8e227a9be4faa9594e05d02ca05a413a2a4e7735">
https://github.com/pypa/pip/commit/8e227a9be4faa9594e05d02ca05a413a2a4e7735=
</a><br>
&gt;<br>
&gt; Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.t=
ech&gt;<br>
&gt; ---<br>
<br>
Hi Adarsh,<br>
<br>
Thanks for your patch. However python3-pip was recently upgraded to<br>
version 26.0 which includes this fix.<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AM9P189MB1666F553B34FF4E105A3B48FB36DAAM9P189MB1666EURP_--

