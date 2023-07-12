Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0CCEB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 11:23:22 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.87])
 by mx.groups.io with SMTP id smtpd.web10.4878.1689160996580881039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 04:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "windows-1250";
 spf=pass (domain: welotec.com, ip: 40.107.14.87, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlbrWkcJf/O84H8yF+f8eNwaUwte0rW8CYd9eNqjHZas6bJMpTsq1FuLY94sVoIVLCB/7RU3Mec/DVeL9CP2ZdSFn/RhPQlGo0JpZ+FZ4baxC9FDtev6J2Gp3/hVuzK0Cr/VjetYS2HsFxLGZv67ExK/36dE10bibiF/5DIBowtvrl0ujXaMwF3NnQXZIo4muJJ5qj2xqZ8MBHIdQf4jUQ3cfv1DeHUMn2V+BJjQNFC65hWFGksk96MmTatFiNj+aGtCot7bq25aJaupKUTUKStbVFNg4Eq3Z7smsNotTQw7wFmwMMo4f6wXuCuDJ2xEb0vidJW0w8qBdNgjyD17vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgUv6YdM/65GLrbE85KDUnNBLthqiaqB47wcSQ0e6/A=;
 b=n/cEKHVgwytcgqzEa2qZb2KMZnC1iBJHXRtYEiIz1ZTzGc4fKu7tqWC8IxJ/5tNVCGNE2kY5/qPev3/+Ev3UKfjPUMlrleRu/OPfNQYkdqmbKM1PA8ZYSheJMDo402EBCKjCSnDbYCdbCCJCrPVEpSXYp1X11bM+BOFTDVs1gJirgMzm8I60jeRA68OgivzBeEc1UtmP0hyVZ0kV06NLuwbN7rmWJGRbIC+7fQRd9ack7Qo0/6GzsTkLEMi6/sEDux/ABdHP2ARwUnJVcQXW3YT7pGtXo24Ega0REMmAryYNY/sKSlEooe5Ti4YQw2GX3UjZKM6ytDrDBfwLuk2XJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgUv6YdM/65GLrbE85KDUnNBLthqiaqB47wcSQ0e6/A=;
 b=PR3faVQSsuL5ea9PRUZQ9yLx2ZcVHVs5GgDhdwL4Ot52Yt1Ssrv0W1qiqeiQUv91+fql9h0TuZnupJ28G303XcBqAKVYETYKLQAP0Xl78M7FRtHjGqUO8CWDPptXz4cGNO72yF3b9lKyH3/fT8Ou1VUuc7NYrsusOdf8VoJNVpU=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM8PR04MB7907.eurprd04.prod.outlook.com (2603:10a6:20b:237::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 11:23:13 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 11:23:13 +0000
From: =?windows-1250?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: [OE-Core][PATCH 1/2] opkg-utils: add acl and xattr support
Thread-Topic: [OE-Core][PATCH 1/2] opkg-utils: add acl and xattr support
Thread-Index: AQHZtE40iM9ARyQSgk2FxEXco1C4wq+170wAgAAN7Rk=
Date: Wed, 12 Jul 2023 11:23:13 +0000
Message-ID: 
 <VI1PR04MB5373335EEE7F848007D4D95B9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230711231847.2211186-1-p.lobacz@welotec.com>
 <384B4554-E449-490C-888D-FDC111366FF3@arm.com>
In-Reply-To: <384B4554-E449-490C-888D-FDC111366FF3@arm.com>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|AM8PR04MB7907:EE_
x-ms-office365-filtering-correlation-id: 993cef8f-0ad3-48d9-3956-08db82ca6158
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hqtJ03WGToexieejM+UfKO2FvNPtW52YPzuWvSjJFY01QD/EKkVDO7wzjQFs59mB49OSd10mkdAr1qhx+nk/mZTT4pNGfNkj5XpFhV2VhqgTicOVSF+xOcoXjyBYerRXJ0xzRU9647kvIlEGthaleWM4djfJtp8xLnEobTyYFKKCkr+7kE3L84CBdrcGnZvfuPzcpIuAqd/vN+bhqMRBA123xXg394KbXxq/K7temnM5eJGjprMgymHhyghiINkGPpW3N0KTvBuaJ9s51CtiO9/5TblDvOuteap+Q2ENHrNFiQI8nT/CywudSaczh2A3qzdDNqY7m9rabRioKf9WWwGKE92hYFPbSOhEx3KO6pVZbWuTSaU6KyDgKCppfRQdpuCzi4aq6369Ftuf9+GswPf8f/mIKbn4EatQOwuj3t8VopxWZf79o0Xz81GdRmIRdoXBZs8tQ/uMl2n1Pf5Lg1DJMNACvQBDhP6bfvcquqfQ2gTF67/MfbbN6OyRQsVOqCxThAdumRpky26B7TqaFH7ATV7ecQK5NFV/VV6U2Zzt+Zv7oEhuJirRRlRoSaPrgvSr2gG5kues7BwbNyeWqFf675KrU0voGV/idNVFjPw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(39840400004)(346002)(136003)(451199021)(2906002)(83380400001)(66574015)(33656002)(38070700005)(86362001)(38100700002)(122000001)(55016003)(41300700001)(4326008)(6916009)(316002)(7696005)(8676002)(8936002)(478600001)(5660300002)(71200400001)(76116006)(66946007)(66446008)(66476007)(91956017)(64756008)(19627405001)(66556008)(186003)(6506007)(53546011)(9686003)(26005)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?windows-1250?Q?69P2lKbU/lVt/Uy+ywh7qFLxDDnYHYEnUSzQZa3pxTIr8kbWQUJpe2j+?=
 =?windows-1250?Q?LgIchg4u6ddznQP+6vD7GpiJNx/SLLvCd6HjpIzI/Hb0FYV3D4cTBlAS?=
 =?windows-1250?Q?F24lvTMcmjsJHcyLjRtZDuiEV10d1bOcOWRk9nXjfr6KJ/SL/4shW8MD?=
 =?windows-1250?Q?EinY8TNeDia1NqUMjXMEDgRXLJeB/HuheiKNjTQ5z96kA8pbom37+O0C?=
 =?windows-1250?Q?5RwsSwqTpw+ciRRKDjbwzQoA61LBRKOgMKvywW9Igxby0vj/OWWZSycU?=
 =?windows-1250?Q?1M3H/P3ubtp0pUD5N0UV7p4jvpKPxsN5IYrxiaJl04KzeAaiU8yeC8+z?=
 =?windows-1250?Q?mEywClAQktP+lRNkdE3JVTyWHyCFy+dHyFgiCmYbZHb/qahbUUXqj1X0?=
 =?windows-1250?Q?PnOzK1S1UFa2971x+hA3ENLAMb4jgR6xhur8ndK1ay0u1Afc+5Q/Sfq/?=
 =?windows-1250?Q?dj5kSY3Rmpn92SxToAKXtM7dxl2wkYAxOZCA3l8okTR+6QHkpXU58bnj?=
 =?windows-1250?Q?yAPtw3QFfDKz2kawqbVwVaITbdnojJncA0qdqnfcuSZqvO1VXA5NdN3P?=
 =?windows-1250?Q?dRXCRpzPxPH2iqmjnPyiwdt4YPhAnZY4qE1EHbnq+zLp39BXrvqm12ea?=
 =?windows-1250?Q?T83YumQEtnTu1RWaZD1oUkGH23GpYi/1P5szCHLv+CrtE7V47sFcNU5+?=
 =?windows-1250?Q?uOIth1XhzgECHe7RA55WgtrUPCzptctm8r4HcEXCmdgbRnzNAN+WR1r9?=
 =?windows-1250?Q?wGWF0EJrjyKRjyVucWARuLMueyFOxoAk5aYwEmtlH9I6HkBcyZtSQ9cJ?=
 =?windows-1250?Q?CTz6rwE8zwPk0WMMl/oR/uAdFWRcPBDNuV/1qV8XYDZK5NxsuBSTIGUl?=
 =?windows-1250?Q?9tl9mH7kaDfwbWufEIsW4tU7sbfF++wy3k0h9pUXFASzh+bFg6gHTUqc?=
 =?windows-1250?Q?9NcxUeo6N5olPjyzAmD63u0FbRqkqyiT95sVjDqcFEnJSLaNKlLevuG2?=
 =?windows-1250?Q?DhV7rq9xjdadH6ULWbKuKo8S0VsT+oiXVHBPZ7qmAPQCTKmY+WsOwVTl?=
 =?windows-1250?Q?43/9zeR+iWtZhgPURlmYIGmfpG0Z7X6+COQOebSomYNVZNMUv/Yrs+KA?=
 =?windows-1250?Q?q+Bnb5GMGJ/c1n85SqJuRh3qnVZ2oP+r4JlqI+Apo/hW5y49U6C7TAUg?=
 =?windows-1250?Q?BePBrF+jd7yizO/gg7N0PAEaUDKnicP199I8E0M7QGpWdD5oKq1WFyws?=
 =?windows-1250?Q?xqq9JuNUNGV+usSAhtiPGZbs9wODyRGwLCl246gb0g+IS/ijxjwqtnVV?=
 =?windows-1250?Q?sA2iwX3TvhrDA+S8e1T8yIFi3A6GdTLh7YLKL4N6kTpFfOnC8579qAUv?=
 =?windows-1250?Q?dASoujYplIaqtk2rkviaYzvU2TkTvwc6b3JK86PYa8Al0byYeGrAWPZW?=
 =?windows-1250?Q?LFFFVuMQQQlB2qKOmnfeprZ4IfZuD7AmJ8WGYQVRUhRvwGj8pxdURgU4?=
 =?windows-1250?Q?G7c9K3JTjZBj0wkycsPthuIOx9APNIDEueOINbq/IV5v9TicaN5NfYYU?=
 =?windows-1250?Q?OFl726lwJWSF7AjgStNFsbxdUrP3vrU8LInr3UVFmGqM5pNGHqLwDFHy?=
 =?windows-1250?Q?gjy0ZVHWKMCg0T/hgn7hsz+Olx2A5lWjAiMuwBj2yIhDGvbTYUvY+fCR?=
 =?windows-1250?Q?s0eQECmG1MZ5hi1Yd7ZTcyzp3OX3ybv8?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB5373335EEE7F848007D4D95B9136AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 993cef8f-0ad3-48d9-3956-08db82ca6158
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 11:23:13.1012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iG/9ytW2djyFEL8xXkMTlFpdOH3Ikzjk0UMvyQxSLzm/rM0Uj70helVomhoj6BhoVXV6WbUHkhHfsSRWuLsQ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7907
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 11:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184182

--_000_VI1PR04MB5373335EEE7F848007D4D95B9136AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

I have added v3 and merged them as one feature/patch change. Additionaly ho=
w this Upstream-Status should look like? Could you please give me an exampl=
e?

Thx
Piotr
________________________________
Od: Ross Burton <Ross.Burton@arm.com>
Wys=B3ane: =9Croda, 12 lipca 2023 12:31
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: [OE-Core][PATCH 1/2] opkg-utils: add acl and xattr support

On 12 Jul 2023, at 00:18, Piotr =A3obacz via lists.openembedded.org <p.loba=
cz=3Dwelotec.com@lists.openembedded.org> wrote:
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Add-acl=
s-and-xattrs-support.patch
> @@ -0,0 +1,70 @@
> +From f177abcba7d72fa1afd0bc23f38beb4fe88fc040 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Piotr=3D20=3DC5=3D81obacz?=3D <p.lobacz@welotec.com>
> +Date: Wed, 5 Jul 2023 10:31:13 +0200
> +Subject: [PATCH] opkg-build: add acl and xattr support
> +
> +Add support for tar archives created with --acls and/or --xattrs options=
,
> +PAX header format.
> +
> +GNU tar and libarchive already supports ACLs and extended attributes.
> +We can now add this support as well to opkg-build script in order to use
> +fsetattr or setcap inside do_install command and end up with a file in
> +an image with the relevant ACLs and xattrs.


This patch needs to have your S-o-b and an Upstream-Status (Submitted, unle=
ss it=92s already been applied in which case Backport).

Thanks,
Ross


--_000_VI1PR04MB5373335EEE7F848007D4D95B9136AVI1PR04MB5373eurp_
Content-Type: text/html; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
250">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I have added v3 and merged them as one feature/patch change. Additionaly ho=
w this Upstream-Status should look like? Could you please give me an exampl=
e?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thx</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Piotr<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Ross Burton &lt;Ross.Bu=
rton@arm.com&gt;<br>
<b>Wys=B3ane:</b> =9Croda, 12 lipca 2023 12:31<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH 1/2] opkg-utils: add acl and xattr suppor=
t</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 12 Jul 2023, at 00:18, Piotr =A3obacz via lists=
.openembedded.org &lt;p.lobacz=3Dwelotec.com@lists.openembedded.org&gt; wro=
te:<br>
&gt; +++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Add-=
acls-and-xattrs-support.patch<br>
&gt; @@ -0,0 +1,70 @@<br>
&gt; +From f177abcba7d72fa1afd0bc23f38beb4fe88fc040 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Piotr=3D20=3DC5=3D81obacz?=3D &lt;p.lobacz@welotec.=
com&gt;<br>
&gt; +Date: Wed, 5 Jul 2023 10:31:13 +0200<br>
&gt; +Subject: [PATCH] opkg-build: add acl and xattr support<br>
&gt; +<br>
&gt; +Add support for tar archives created with --acls and/or --xattrs opti=
ons,<br>
&gt; +PAX header format.<br>
&gt; +<br>
&gt; +GNU tar and libarchive already supports ACLs and extended attributes.=
<br>
&gt; +We can now add this support as well to opkg-build script in order to =
use<br>
&gt; +fsetattr or setcap inside do_install command and end up with a file i=
n<br>
&gt; +an image with the relevant ACLs and xattrs.<br>
<br>
<br>
This patch needs to have your S-o-b and an Upstream-Status (Submitted, unle=
ss it=92s already been applied in which case Backport).<br>
<br>
Thanks,<br>
Ross<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB5373335EEE7F848007D4D95B9136AVI1PR04MB5373eurp_--

