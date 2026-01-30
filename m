Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40295D49C6A
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 07:41:38 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5836.1769758618614205521
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 23:36:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=x9GkMSnI;
 spf=pass (domain: est.tech, ip: 52.101.70.61, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSmtdpqa9JXbRHuQ9+SoNIFzcouIIr4VaOFSfoHOlUK0jnHJo4XX52Y/Zv9EYbIo62Fk+K0tJmC7FIrIycxqFmScDHNAGTa9K5w2omInciGzj8w5Pu7CdeGA1S3eBlGC2ZT7PkIb5PxWF6X77YDc4TjAtQjNQ2L0jlI9/GZ4W/K4NsjpSUH34TXznbn8b9eB4W21wZyibCkDN/1X6GcmT/45YJXzqt7bWFT5TILNzjMhXpizoBMd1JztycWbn3T+Vp5h0WRXh3aumvdXS+5kHP24dN5i8JOhNNsg/O77eduC7Tp+9GCygiN/DR1SBDu/JxxsKJjrpPYvqLvlRGMH3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDsg4Jc8px/s1Wr4Ifbr0N37ChSasLeWDxr0zc0bn7U=;
 b=hdS+tl5t2aPIPTWvxqi4uTAvPvObKbCMnHz98TtoD7y9O6NGhyvlKSvmfTPg9exFzheBIEqkYpFl4lfrBxG5wq2BOhHruOowIet5hPwtxyzbK6JxB4qLqy38qCPfjM055KPsHnvsgK+j7bsCxqUjCVxcGD3wvphKaLHkdmfbqqRI1HBiuqSrpqKKmIRjn/oZEq6OvspeUKRer9NLD1cFaF49m8EWAe0suyJFjTrS4ehE5uHl/fmqPwLhnGif9Mm/S32OxWsk3LWaA3ZTtjTnCjORfM7WUpI9PWh4MyWK+L2NU0ZqyeY7XWOSCbUCS8rE1tNYPat8O5WnzJvk8Fgq0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDsg4Jc8px/s1Wr4Ifbr0N37ChSasLeWDxr0zc0bn7U=;
 b=x9GkMSnIv9jN2PBqQnBzPlz/UnCtGf7k1eQ0Cp2U2W+OK4C7EOL8oN6yeZ+poot+z9BJX1pFyBwf7QFGWGgWJTTMJp655Fyd5+q1HbAQG17oPvaphDosajWcMsTR6O44yMR+ahmqH7+ZL115UqqP3D0vG8XYcSSuDl/oDqskb94pb5I2iWQsJYQ57Genyj48+B3hBAUJlBJMeOkEvldURq4yRE1qE8goXk/xJ5I2pHSAiO4Da93+uyt/5iIZCLgXE3pTitX/o5ehXUnfokAy5yMZYifsCsgqqv5jPbJU4OuIhaAOrKk9aiYg6DZCun1Sd92I+fyuSIMk/FhBObQ0hw==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV4P189MB3558.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2b4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 07:36:53 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 07:36:52 +0000
From: adarsh.jagadish.kamini@est.tech
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Yoann Congal <yoann.congal@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v3] python-urllib3: Backport fix for CVE-2026-21441
Thread-Topic: [OE-core][scarthgap][PATCH v3] python-urllib3: Backport fix for
 CVE-2026-21441
Thread-Index: AQHckUb/rIF0oxJaNk6GMInraNbP/LVqU1zU
Date: Fri, 30 Jan 2026 07:36:52 +0000
Message-ID: 
 <AS8P189MB16724C3E6043940346924113B39FA@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20260128131610.130399-1-adarsh.jagadish.kamini@est.tech>
 <DG19DJQSLJIV.30935TPXBX2B4@bootlin.com>
In-Reply-To: <DG19DJQSLJIV.30935TPXBX2B4@bootlin.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|GV4P189MB3558:EE_
x-ms-office365-filtering-correlation-id: 1a308a9e-0915-45e9-cd2f-08de5fd2564e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|8096899003|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?8/2Ou4saWlWPa/KoJmO9QRWCldR+MObOTZu1xz4sB3eTFUTBU/2X8gNRYzFm?=
 =?us-ascii?Q?QNqjecEvSo8cZokQpFzn6treNiOQq4ngLx3rBZea609mxPPGtXk1udfwZWsy?=
 =?us-ascii?Q?IudxiRlSYyaVA3M8Lz7ETAgZTYsPoK+7fJiGYJQDY/TRmyVtkk5UHsZqfoeJ?=
 =?us-ascii?Q?+9MKwbB1lZmf1jfO4w26YiDim3wEZ9niGL75OMrt8NYNsCgUyZKDfGU+Hb6Y?=
 =?us-ascii?Q?hvKkqIXsBlWSkObVV9o/gR6GZOAAO1WF9BsGVyKpzo0QSmw3DaNiEkPMMtrN?=
 =?us-ascii?Q?MNfsGAn9rfHWq+KS4xHLBqFRtbZ0stwhfs3/KmWtNal7yD+DRn9jQ4DQqsXM?=
 =?us-ascii?Q?vvjrF8FAr6IEXOmOHThZaX54esQ/d/maB63CjxhH8a1cMRy6biaonOiOD8Ig?=
 =?us-ascii?Q?ANTQelVSMR4QIKZ/UR78MUoFzAl8KrFBLMgYckzz1CC2OqjA1ciuj3bLJnkc?=
 =?us-ascii?Q?nSKJVVYCucluvShIRWBdTdH+6Yng4jJoWPYsdnFu6cDSH7uOQv5KM/Rl51g2?=
 =?us-ascii?Q?BIEoDLxmZbvyH1ven8b+RlBUWJcw19DOpqduaUMpNlMFohbl3xnB2ESKz3x9?=
 =?us-ascii?Q?KIwtYo0HvCUlkFy4UI17xtPG/th+tYmymN2kCoNAzsCABgjUvPrnV3RkybzC?=
 =?us-ascii?Q?5kkHdg+/kgoPG9bS87npu9EoRPsfmNBxjNatlazXzcLN2eBTpyszcKIqv9Yw?=
 =?us-ascii?Q?sLx9VfiFTQDMVCX63zttadtHp51pPcYWXtlq5rBHsu1SW0al8I2pIqGGSe6f?=
 =?us-ascii?Q?JleKqT3AbwjpqNWW9fkJ7LLEbCAAIhDVP7yhxa1TUgmldc4D18Xa/bgRieUm?=
 =?us-ascii?Q?2VwvvOJawkdBWLjirDwtgTnSCpZbDZh9tOBHq4QOsyIqW1UHN4p5Tf7J7Q2A?=
 =?us-ascii?Q?YlzAF41YWq2JHpdKGYp/C/+cZl4TU6us25DeYLlpK/1Fr5GWEFsdQD6KAM/p?=
 =?us-ascii?Q?PD9EVp19zUWRGDH4bN8bNU4GTVx43T6XozXdFmDDPfdZprI5fUujRjEKMGRk?=
 =?us-ascii?Q?BGGZ/XpYFM5br9E6rUX5ERdjXZnw+qvy14SZ50W2WSx6E+3FWdu+0mHPk14I?=
 =?us-ascii?Q?DGqqIHFu9PJHEbBeEL3+lnclmRTWvlSYSmUx5U45UNAp1KJ0uFfJPlftq6We?=
 =?us-ascii?Q?aPYgMmacPLlMBCDYRv5cDve3BB8tR5WTfHQCDYrk2b0Q6jsIaNB51YEff/Ey?=
 =?us-ascii?Q?mmue5TQLsKKKMWNH2tWVArd2QDeEQFK/IorqvKzmv/rFhG7O6q3Auv66Yqp0?=
 =?us-ascii?Q?KYKUshvCEMCa0trGK+NmVjgbxdU2CDV8cXKhIJ21lKYt39c1aWBI4Cf6sJ8/?=
 =?us-ascii?Q?SC/sQQ+UalOWwz+/bVk+ZqpAIbiiVc6EnUL4ZoTb6zwyXDncn6Fe9RvMBpKl?=
 =?us-ascii?Q?/mxkUuu+dTMZ/Y+whYm2NWCC/QCc7qBsEIWBrsjdcdjF6P1ebOcdWbQMKQQv?=
 =?us-ascii?Q?0UOqywhwKeK4WiM6XWEPbMEDY9IopKKhfIIXjkei9+b11UHyYbvSjKy0hGh8?=
 =?us-ascii?Q?MmjheM9eM1Nx8U3ihNQms4/EKJfUa6y45nKb/B4H7lew8KKH/BKRpAMILFsR?=
 =?us-ascii?Q?01pH8ZqPrNjl8mO0bgc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(8096899003)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?vd2Pz+nkTbnXNZnoz3OYUU6oK/qd4t3dESSbmEFbvbeTh2oMv2/0VRG9ynWz?=
 =?us-ascii?Q?kqhfwkuUeZ4W+eWm1MhQFmN2+pYkXABLx34sw9u+nzb+7mYUKE6LGSkKqR42?=
 =?us-ascii?Q?NfYA8TVta48nY388uNqtyY++eEQGdfQIT7i+PTcqmvaUba+h0pS3te0EMSJh?=
 =?us-ascii?Q?iwCqYvWez9XW+nli7Yy1Q+Y3hIJ0mlbD5OyoZRTzt0Xt51LIKrlW95mZ7b/5?=
 =?us-ascii?Q?+cBvP1bIkjIxC5W4GpFhQH7ZXyX/c2fX5+bk4l5AtTSsamkzyfA6w4QSae0C?=
 =?us-ascii?Q?O1HbD8knxNYs6VlNE0O0MxT2GRtOWpedw7RjU9iUhr3RP+l1Xq7Tg4mRP22D?=
 =?us-ascii?Q?qPSKE27IKfNEz6wL5WU3CEt5qDFBbM1qcnV+QghGF3M7eho7vvSAUZ0NQkMs?=
 =?us-ascii?Q?qMhWCxHMrFoQy3IO6siS/XEilEVRVuNfzd0oHyfBAqtVdBf73tbONbOUwIt8?=
 =?us-ascii?Q?HAQwlQ4WbgbanIdA7Sk09HUeFJ9tLNB5NmdaneefaXNVNJAtPVwdMeGoXHzg?=
 =?us-ascii?Q?oOYhkhP88o57fnGY3itMxfCP9fh3AX6huP70+AFZdo7tS7J3YJq7jFAUStJq?=
 =?us-ascii?Q?RhDIoREp9tmBGNh0xMouyFz3oMA6qu0+KCQMxYT+hR8n588Czyj8WnsZfFUO?=
 =?us-ascii?Q?VsqWdALc79//d1xH+DlZCYt5tjMdb+eQUcz02o9HRJPLLLsXnEYNUPB+eIdN?=
 =?us-ascii?Q?G8ygwTCD3K74OkOxXMvitQANm5TPu4CSXOTEHSYpw9NrhCZW87d2a3pLguP7?=
 =?us-ascii?Q?6OUW22b8Arui98ZHrWVU8p8cGCrX3Tt/sjwbsZ0a97xXUR6iwOZNQ5AExa+c?=
 =?us-ascii?Q?KhrBPyTCidAMEHk+4QAd0YWRWdXG4x/Uw8CqmJgWQOYdz0gil0KGa9/n9pej?=
 =?us-ascii?Q?3r5UHl+52sulx4E8CBhWAj8nFxVrGriDXUrJdYDFTP69ASjNnE87A7AzWgzN?=
 =?us-ascii?Q?zNLr9wRZeAhbKH0mZAHm9Om7DsHwcY/f9SbQn11oYh73uSDNWZ52xmGqz93O?=
 =?us-ascii?Q?L5DacxhcJzSyCcqAKOthTkb5KiiJUxpoDzSGLuq/HamqwEZI4Btvl64qykns?=
 =?us-ascii?Q?Buv9Zcx2afsaN7ivc0mqTpLPUP3P6xDoZ2ZYvoxa92rMbMS60Io2uyJY1phW?=
 =?us-ascii?Q?j3WtWJuc0tNFFbb8D1BefNvjmGoLm4reoekYGPkAiSpO+8TOeOcteEB2RFBV?=
 =?us-ascii?Q?Ro15IqFdMQYnAdjsgjJurrPeNNKyiX94Xvs33Z7kpEyQ4NGzxQezVhEe3hUl?=
 =?us-ascii?Q?1CB0Ph9Qe//P3kPMBKohHO/fSAGbVqsZ1jgtY9Ndg6m556sHVqZQIlcntiAQ?=
 =?us-ascii?Q?dJ/Y666TldAStt4B9YVMzS2K23r2XbekLIZX9gIv0ymvbHuFb3TnobfIS5DT?=
 =?us-ascii?Q?lBM5qZ4qAQG9LY0yLaPa3UF06qxinuFccnPuvBk9/I20dw20MIpbgi8CkPFK?=
 =?us-ascii?Q?lw+Ai3xAA2ppzd16oIvqEolGsMXMZRnJu0HOis/JNnfKbTzuBUhGh4cuE434?=
 =?us-ascii?Q?EqgrvQM/m3WJkjW6c55FpM+xUcX8/UAt5GhJk36z/0wJbBOMyry6QMugPFh2?=
 =?us-ascii?Q?EIZLZDDN83fZeIKac0LXJB10bbh6rz84I2ELboWh6NkSGVYlDlDcg9VSzavx?=
 =?us-ascii?Q?CG2rlPIgpjvrsCxQ9j3q7pHaS9Swzdsjx1UhHlp3Hv8wiV6BWa4zBx5nsEz8?=
 =?us-ascii?Q?HUauyhzWsQrPNnvjwmVTyxvZWvns8nEqrZB4qjFNqrIfJxbFkorwIc85wcQQ?=
 =?us-ascii?Q?eyigWtc8MQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a308a9e-0915-45e9-cd2f-08de5fd2564e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 07:36:52.8908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LOlIle8AJIeeLCnAAXemL80BG/0fSLyZ0Ax8OPaHIt+2dnAXVGN1Y5ZN8pXAbhjnVgI79bCKxhI3aUIaF+psk+hcu4SIWU21cRmc93rZQUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3558
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS8P189MB16724C3E6043940346924113B39FAAS8P189MB1672EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 07:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230180

--_000_AS8P189MB16724C3E6043940346924113B39FAAS8P189MB1672EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,
I will now send a v4 patch for scarthgap branch.

Thanks,
Adarsh
________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Thursday, January 29, 2026 6:44 PM
To: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>; openembedded-=
core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v3] python-urllib3: Backport fix fo=
r CVE-2026-21441

On Wed Jan 28, 2026 at 2:16 PM CET, adarsh.jagadish.kamini wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---

Hi Adarsh,

Thanks for your patch.

Based on urllib version, I suspect this patch is not for master but for
the Scarthgap branch, is that right?

Adding Yoann in copy, so he can handle it.

Please make sure to add [scarthgap] tag in the mail subject for such a
patch, as described here:
https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#sub=
mitting-changes-to-stable-release-branches

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--_000_AS8P189MB16724C3E6043940346924113B39FAAS8P189MB1672EURP_
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
Hi Mathieu,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I will now send a v4 patch for scarthgap branch.<br>
<br>
Thanks,<br>
Adarsh</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mathieu Dubois-Briand=
 &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>Sent:</b> Thursday, January 29, 2026 6:44 PM<br>
<b>To:</b> Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;; =
openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openem=
bedded.org&gt;<br>
<b>Cc:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH v3] python-urllib3: Backport=
 fix for CVE-2026-21441</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed Jan 28, 2026 at 2:16 PM CET, adarsh.jagadis=
h.kamini wrote:<br>
&gt; From: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;<b=
r>
&gt;<br>
&gt; Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.t=
ech&gt;<br>
&gt; ---<br>
<br>
Hi Adarsh,<br>
<br>
Thanks for your patch.<br>
<br>
Based on urllib version, I suspect this patch is not for master but for<br>
the Scarthgap branch, is that right?<br>
<br>
Adding Yoann in copy, so he can handle it.<br>
<br>
Please make sure to add [scarthgap] tag in the mail subject for such a<br>
patch, as described here:<br>
<a href=3D"https://docs.yoctoproject.org/dev/contributor-guide/submit-chang=
es.html#submitting-changes-to-stable-release-branches">https://docs.yoctopr=
oject.org/dev/contributor-guide/submit-changes.html#submitting-changes-to-s=
table-release-branches</a><br>
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

--_000_AS8P189MB16724C3E6043940346924113B39FAAS8P189MB1672EURP_--

