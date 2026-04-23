Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2A7F589AB
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:12:04 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17888.1776946282659292080
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=e55wnmBH;
 spf=pass (domain: est.tech, ip: 52.101.69.69, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntlj4/6Ja5dY+t3qUWsLQoCKz7PMscJGLgOLmnCtZt3hVYwgUL1AvyitoKJ7wb7TTxABuwsBRQZj3A8dkyKttFTzn/B5ALTAgADPgvtlco+Om3iFBD40nM5jIyizd0WbMkE3glAlt40pMD6r3kN/bR/0Ei/CMb6H8/3n1/yaSdvSbAXX6HGR52rY5/LEVVbwk50yDNWhDqT6VSE2fdDVpJFebZGBn7kadlII7fnobfCrhndgb0uJiJBV7eAPNrLtinKeF7z8Pd0OoeZCEtPLDEAf2FSUZg1IHgyXcuiFCWfyYK+MHTjsaoYXgfoivXV4mmlFr/LbYQFPg6DmjERyWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6J6CnaMDIJHYT/onb89wqSDDrTE6aQSLJczcIb67drg=;
 b=RBdtR4t7M1oJXqDjZ4CeDZJNv7cbyI4+UnR37+Fknv/wwFrpxpIcheahDvU5ZWT1q0K2qkRrvjCYkk3Emzf5e2b6aeb87u+xmFaeVEEkMPnIUzUMmYmiws9+k2RCmheTmpHngHviPMaJLpq1qB9RY0U0tkNmdS0QlT9bxSlfonzr7JsS+bbSpLTt5gvcco0i1gFvAB9AUDeP2ZPnjnv6RkXkgXljlnO7H5Tw0n+Vx9SzqZFplPNXo1nFTj6VrMKc0UoJS4oRX2Hmu77KTqn4B0JjkYWaeJFZdn2w4yjg4UrEdxeOhT56TN/suwTG/ePGd1d1FGmf2pgD4vTqrF1aIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6J6CnaMDIJHYT/onb89wqSDDrTE6aQSLJczcIb67drg=;
 b=e55wnmBHl+s0/zvo/XiC6MYiMvfvfwiwCvCaduSxC8QDUX8JSiltW0CPeol+LzAXNQn7UUxf1j6vh262ALHkRJNRb1rMi5thfqRpHC/spSvhTk2rjItKF9viDJeFj3CoOdOYyvGT1x5rpJC1S4XhzEydudJBAFnudlEphrJeOz6trlaYh6sWDXA9llzhR0Fsx5DLCN4CMNmwUNoz5doz4sN39voinAQCYhACfGfESskGzoHzzcPkcL2Au0qmjGqycSf46cSthofm4hpvbtFf0T0LPuXOU2bhJh0+mDWkn7/SkQ+o5Gl5TlCM7s5bWn/Yy46V1/JIAEZIuIfFpk3dog==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by PA4P189MB1166.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.17; Thu, 23 Apr
 2026 12:11:17 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 12:11:16 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: Re: [OE-core][scarthgap][PATCH] expat: mark CVE-2025-66382 as vulnerable-investigating
Thread-Topic: [OE-core][scarthgap][PATCH] expat: mark CVE-2025-66382 as
 vulnerable-investigating
Thread-Index: AQHc0jZyYnc9qLZuvUeOhCiXS9rHbbXqzLYAgAHA0Sg=
Date: Thu, 23 Apr 2026 12:11:16 +0000
Message-ID: 
 <AS8P189MB1672AAA7507956AF93323523B32A2@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20260422090017.322293-1-adarsh.jagadish.kamini@est.tech>
 <DHZKIQHF6ZKC.18K6QJ6J7WXH3@smile.fr>
In-Reply-To: <DHZKIQHF6ZKC.18K6QJ6J7WXH3@smile.fr>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|PA4P189MB1166:EE_
x-ms-office365-filtering-correlation-id: d2cd0c6a-00ad-43fd-ab29-08dea1316beb
x-ld-processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|13003099007|18002099003|22082099003|56012099003|8096899003;
x-microsoft-antispam-message-info: 
 aXKDsZsWfI+2Qefrkyud3IkSxxgUtWyIPBNw/QBYf74JV2ekKuD4oaDtpiXx2c5pr3m4Yfn3TBYfVk1KXCTvcxQ4vKiWMuzRLFdY5T9Ypf4ibihoISl8K6UI7zA2GNQZJGwGdMksEkELbUiRcAo2oIuLpYY+M/TTWmgkcaB/1/Q7IixWumStTfJTEVbgwEZbEnd78F8uUg84MQxklt/8QlG3Sx09mco8XJk6agisHmpS5O4IyhsuGKxbglTYc1iJft9K8fmrLvIwrn3YdVmyDayO02TdpYJHRoy7U80UfIk6zpfi5vpYaSCBADEsnlr3mAoYVnzHdUoFM08jHDpuBT9GTHAddvW9Jzd2FKiBBCSaE+9qJrUd9onwtErn9s3YEyZGcTS9YgA2tMGoGvcPUvWIY5okHkNIwIq1YxBevOm+3kB+lagF3cxCzyYFzsqbnFPHPR6KxzV0jLbE7Ycf955YiNTm7J9IoFhxdsQe2UC8VvLEbyDLSxNFk309HRz0AdIHmcEv/dKiLv2IMRLzgXwKGDb1QpLT18nnSsyqfBKz16QL30LSTIA+x+zvjZW6lUccgUAeAEsVq8OW/Inu5PE0hbzZ/qDkUB4zRfxFyWOC+MtF9YobAFO1Yg4Ju9k9Zxv9asQFP8ZmcpF1xOEMWYWPDjCi3D8usZIkeqZZ0baRkXvxuJxuSokp/ezg3Z2WE3vlp8hBt+WFwc5kTSxN1SLay6j8q8Dla/eQNFvOajGww8djxfHfsme1PWMqgrSEMKHMEtABs6drkkcEHCXLJFeotR2GWjqWjWCwIceYFpE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(13003099007)(18002099003)(22082099003)(56012099003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?odMHBIqRc1dh/P+Po1N3sR82jVkQs6y0fT0vYi5eHdKe59I7qdT2tjzAfiSv?=
 =?us-ascii?Q?S3MNpk6eIpHcI+znLrNR2Hph98+AU5TjAEB0Y7LpOyEZgSlGIHLArFDjcA0f?=
 =?us-ascii?Q?q3lQcMhIufHCvmMhwLv5RC+Xfygkr/xDq2mGaXHGT/3T3jnhrcWCV2MCetSq?=
 =?us-ascii?Q?0AQnp/CYMfzuH7hJeaqwjOOOUcx0CnATPpR0+aN83NCYyjDxClQmiIEDCI4a?=
 =?us-ascii?Q?MD93TIR0PJ200ugVUf8lfnoYOfzSNMHvtiTMCYv34ZMlZCVrjqrdsPIQ94da?=
 =?us-ascii?Q?woWT9nxCNj48/E9zZhI+O8dpThlW/NDwX4R9ST9GU6JBXRZ/50iWA6o5Ff7I?=
 =?us-ascii?Q?4VC7wz+BBFxolUTWD7eseKh9HeuazPhhVbYzjITqYEn+FHOLRxGF+3M5ju0G?=
 =?us-ascii?Q?1CQowdOy0crMWFjCxIK0J6hAROfVq4dFwGSFdQM7OjNkNJRI3pyfFMhVKdWo?=
 =?us-ascii?Q?TNVQRhgqXHxDoJap7/NjGLW7mTLClhhCrvOqM421aTx3kqsbNKarPdIWRQ1b?=
 =?us-ascii?Q?ETB02F0fkE+STfkm5Z+X+P4mBtGgZWTqUAEScP1D5qrlI2k+ioPnFfIpAnAm?=
 =?us-ascii?Q?BRHXP0E4bm9bDgtsVmmNjqJaG4ydot3DDLe38+5K/k0/kqVUBTpLkVJom/wX?=
 =?us-ascii?Q?V9A9pY4cnyC80CrmDPxCBtmEZEyqd3UCTja0j8lni2ZxhWdgPUgb/bdrOEJJ?=
 =?us-ascii?Q?1K2+Z7Fy1ZPgXOy894t5VGsdCmqEU9UVNE2QBOmb/3Yc1bmHC63k3/TmwvrG?=
 =?us-ascii?Q?xbBaVMo9juf4xyMY4A0LOj7FlcvMPL/ncVdtHVj1OjvPTpn65rUfEt2vzKZX?=
 =?us-ascii?Q?bcTGGRxiYw1LaHLxMdGkh+l5wchEfAi4jYLYCm5VyHt0SBuC+pjUuQNUUM7z?=
 =?us-ascii?Q?27hhk/lHfJCfIQNO8KGX/+VGLw+ruPTKz+h+1y4mUWPJrHCvpx6qbBChuMUY?=
 =?us-ascii?Q?CpsCUc/OY84/H/djQmQwk6SeylP5g2WG3JirQNbAYPx1whWLjzlOctOxk9ez?=
 =?us-ascii?Q?QyxEtX1o+msNHfHb2M9nFMgfg+d9K0vwR8nrwVS/omompGgZerbCi5d3hu0u?=
 =?us-ascii?Q?qfiGmXREKBcGM8P1pI27h5x998ZjA8xBSYoebqbVmbKCAUqWjLWTCiHNPsLg?=
 =?us-ascii?Q?P8zcFnsd+QbENr4yon+3uu4NcYQk5yuUkbQZxNaDms0hkxiLbYQDIFZrTjUK?=
 =?us-ascii?Q?XhyK83dW09SjSYXvNeO15CvftNNxOxCPMqmiAtwIxPo0xJantVBTKq8uU152?=
 =?us-ascii?Q?1ECWVfq/pMGeobs/cvclKmxuKbWY99WvOhXAbfmGPvV805C9AAdBMBnYXtkL?=
 =?us-ascii?Q?2vC4UBW2U8RVS1wzEU3UN4GpCbPQHVanUlnqsau1nzD4+YhwHu91RPF9nkk9?=
 =?us-ascii?Q?vnS8F1J4DzkOCqTdoNsh5rM0SvAC6ZCYiLxtOMmlKCAMZUvhaWxwbTDnfMk+?=
 =?us-ascii?Q?6cyp7sJlX8xrHkz6v7CMvDyc1XhpGdjcnXbN8UBl0Yaes8oNz9vrA4tcKixu?=
 =?us-ascii?Q?l2kEInDiP5SsqM3WWsVU4tcj+y9OXgFh8Jo8k7c2xQ+fKFjESJs80jWKbluw?=
 =?us-ascii?Q?vc4yHRRx+eZjanrxH2wyMkSLXX5kf8bL4gTDIjaZtR9fgyGg0/dHLhwiLEO7?=
 =?us-ascii?Q?k+8lUWIaLvD3JPxlhhKElVe/SvJSgfVqUdsNOJwaK807hQZ+RXfK1h0GFkW3?=
 =?us-ascii?Q?hj5kDggaxYNOiBwh3GuYS3DBQPFtXXGJHsWXOfvEpJsBQpegUMSuPjDcgIvJ?=
 =?us-ascii?Q?Du8+1krIJ+EVtqJmfLNysuJP7Ayv4D8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d2cd0c6a-00ad-43fd-ab29-08dea1316beb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2026 12:11:16.8747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cle3zaHPfek0YqxHb3EKAM+My9aFS1mXYyOCHArMwFk1z0LU1B3/EZyE8pxpMy1VwrLwB7pI9bHUwZrZv7ekR+Zhp7aX9GG8MCtAlRXBTLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1166
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS8P189MB1672AAA7507956AF93323523B32A2AS8P189MB1672EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 12:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235762

--_000_AS8P189MB1672AAA7507956AF93323523B32A2AS8P189MB1672EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
Please drop this patch.

I assumed that when a backport fix is included for this CVE, that would ove=
rride the CVE_STATUS, but local test on an already backported CVE proves th=
at wrong.
This patch will not be needed.

Thanks!
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Wednesday, April 22, 2026 11:15
To: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>; openembedded-=
core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH] expat: mark CVE-2025-66382 as vuln=
erable-investigating

On Wed Apr 22, 2026 at 11:00 AM CEST, Adarsh Jagadish Kamini via lists.open=
embedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> No fix is available yet for CVE-2025-66382 [1].
>
> CVE_STATUS[CVE-2025-66382] =3D "vulnerable-investigating: no fix availabl=
e yet"
>
> [1] https://www.cve.org/CVERecord?id=3DCVE-2025-66382
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  meta/recipes-core/expat/expat_2.6.4.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/e=
xpat/expat_2.6.4.bb
> index 048093f010..81dbb6a687 100644
> --- a/meta/recipes-core/expat/expat_2.6.4.bb
> +++ b/meta/recipes-core/expat/expat_2.6.4.bb
> @@ -67,3 +67,4 @@ do_install_ptest:class-target() {
>  BBCLASSEXTEND +=3D "native nativesdk"
>
>  CVE_PRODUCT =3D "expat libexpat"

Hello,

> +CVE_STATUS[CVE-2025-66382] =3D "vulnerable-investigating: no fix availab=
le yet"

We don't usually add "vulnerable-investigating" CVE_STATUS. So I have
some questions:
* What is the point of this change?
* Wouldn't that apply to most of other applicable CVEs?
* What does that change in the CVE reports?

Thanks,
--
Yoann Congal
Smile ECS


--_000_AS8P189MB1672AAA7507956AF93323523B32A2AS8P189MB1672EURP_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Please drop this patch.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I assumed that when a backport fix is included for this CVE, that would ove=
rride the CVE_STATUS, but local test on an already backported CVE proves th=
at wrong.&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
This patch will not be needed.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks!</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Wednesday, April 22, 2026 11:15<br>
<b>To:</b> Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;; =
openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openem=
bedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][scarthgap][PATCH] expat: mark CVE-2025-66382 =
as vulnerable-investigating</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed Apr 22, 2026 at 11:00 AM CEST, Adarsh Jagad=
ish Kamini via lists.openembedded.org wrote:<br>
&gt; From: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;<b=
r>
&gt;<br>
&gt; No fix is available yet for CVE-2025-66382 [1].<br>
&gt;<br>
&gt; CVE_STATUS[CVE-2025-66382] =3D &quot;vulnerable-investigating: no fix =
available yet&quot;<br>
&gt;<br>
&gt; [1] <a href=3D"https://www.cve.org/CVERecord?id=3DCVE-2025-66382">http=
s://www.cve.org/CVERecord?id=3DCVE-2025-66382</a><br>
&gt;<br>
&gt; Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.t=
ech&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-core/expat/expat_2.6.4.bb | 1 +<br>
&gt;&nbsp; 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-cor=
e/expat/expat_2.6.4.bb<br>
&gt; index 048093f010..81dbb6a687 100644<br>
&gt; --- a/meta/recipes-core/expat/expat_2.6.4.bb<br>
&gt; +++ b/meta/recipes-core/expat/expat_2.6.4.bb<br>
&gt; @@ -67,3 +67,4 @@ do_install_ptest:class-target() {<br>
&gt;&nbsp; BBCLASSEXTEND +=3D &quot;native nativesdk&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; CVE_PRODUCT =3D &quot;expat libexpat&quot;<br>
<br>
Hello,<br>
<br>
&gt; +CVE_STATUS[CVE-2025-66382] =3D &quot;vulnerable-investigating: no fix=
 available yet&quot;<br>
<br>
We don't usually add &quot;vulnerable-investigating&quot; CVE_STATUS. So I =
have<br>
some questions:<br>
* What is the point of this change?<br>
* Wouldn't that apply to most of other applicable CVEs?<br>
* What does that change in the CVE reports?<br>
<br>
Thanks,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AS8P189MB1672AAA7507956AF93323523B32A2AS8P189MB1672EURP_--

