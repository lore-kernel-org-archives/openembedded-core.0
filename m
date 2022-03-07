Return-Path: <bill.pittman@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC2FC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 16:38:34 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web08.46.1646671113265124167
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 08:38:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=jpKs9JnY;
 spf=pass (domain: ni.com, ip: 148.163.158.57,
 mailfrom: prvs=0065ecdf95=bill.pittman@ni.com)
Received: from pps.filterd (m0239463.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 227F4Lvq027569
	for <openembedded-core@lists.openembedded.org>;
 Mon, 7 Mar 2022 10:38:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS11062020;
 bh=0PmfuUUGrND+PHc8nPCQCjXJrG+3QcvDaUqpwGfiv2Q=;
 b=jpKs9JnYIkeEhKKAGIuLZ3jK/rCMxQA0OGudq+ka+jt0K9+Z2nouee9byYnypVWMmYu1
 xGr7v3+J8lNbt7abNzbdIimc7RAqZXDMOs1s1WsV9Dxy5nHJ9LJWHsOE/+lcqk2Qp+Rb
 rHNPcvrzgfOLsYqN45fcgv0KoeUZl2cB8XnxB2R8wQZttpzATkk/yCCnlLIh6VxLWF3y
 uibUKXZP0bM4PR98OF0xUF+jQwSOMU/gVAD6WWd2F9GhMbmlhaHHRCOFT0GXYGHciYsh
 M/MUHtJbqpXDMar/91iwKOyakVg5MeLaOClwc5ScBxdIcOprhMBUd9oE/b8xz2uJAvWQ Pg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3em44jbhmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 10:38:31 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pe6QsuhF01ndCUE7bEu1JHh1k2iG8pCdl0J2x5Str1wgPUgk+M7iTKUBrX3eStiADjYPyfP3OsuPLYPMBCcfuhPvEVvdzubD4u8bPH9f+YoWtvOuZ6LFgvYbd4seEdcN9+R3bYf0xmRUkgfAfplYLOIDNQJjMJ0xhKOHUYZO06bnx1GEJMlpdel9qETafGY7QL/+1m7COMqQt9puPBp/YCpmUdRDKp2HMJ2ynGD2D/3TJfEH0/+FxQl//JvvdeGpiaTaAnbvwItsEOcIHD3bCc9wJGK2NsLttG+/P6mC3zcYRSR2k8stpq1gVh6mtXgV0AwDYXgcy7L8etZaEf0uSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PmfuUUGrND+PHc8nPCQCjXJrG+3QcvDaUqpwGfiv2Q=;
 b=NOqOm5Z/uOaQD0IMosHHZE3cIkqIRH/wAAIAqnDVqgxpIVtc8PBNucTtTB81y+4p8H3oGS8uOZAxBK0AgEaIP6UQe5mQYMg16qjPrTWBiaQlHY22sq7cq6ZMaZfjyyy6O6+1qotHgOAmhnJtdywClWzLyeVyO2rjV6+LoHDZc3rRbUipp9PWmeL8+4UmuaHx+oVGb/duyvJqVeGKIbZN9ZkhzuXnwXr61frYFS/h1fb5FHu5ev29vXxnXB43b+a+vvfHnajWSu/rSspHw13J12pGyYleigdrv7w9DfPp3krCx/BBR6dsWXsVtTQ4dWOQLAu2RUyyAyqH9qUQOP7BRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PmfuUUGrND+PHc8nPCQCjXJrG+3QcvDaUqpwGfiv2Q=;
 b=rLW4lkVbZSz/OXzYUXyoGakjIBGgwVpax8reuDKa0B25Azdzx47eqe/ocZ//OuiL1+7ytPDiDo8xoJiAt5qITSxt5OAXk6ODrWH84UQK0shfz55UYLsYQ0GzO51mhzn2m5JKdtO0gFUqWgr5OLul0jqCa6GeV5fXpBkmfdbw4ig=
Received: from SN6PR04MB4909.namprd04.prod.outlook.com (2603:10b6:805:95::25)
 by CO6PR04MB7811.namprd04.prod.outlook.com (2603:10b6:5:35e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 16:38:29 +0000
Received: from SN6PR04MB4909.namprd04.prod.outlook.com
 ([fe80::d939:c66:be10:4323]) by SN6PR04MB4909.namprd04.prod.outlook.com
 ([fe80::d939:c66:be10:4323%5]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 16:38:29 +0000
From: Bill Pittman <bill.pittman@ni.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] wic: Use custom kernel path if provided
Thread-Topic: [OE-core] [PATCH] wic: Use custom kernel path if provided
Thread-Index: AQHYMkHGDTiPLBJ/NUKWyzpgQh9UJQ==
Date: Mon, 7 Mar 2022 16:38:29 +0000
Message-ID: 
 <SN6PR04MB490954026B270D62EBDA29F5EC089@SN6PR04MB4909.namprd04.prod.outlook.com>
References: 
 <SN6PR04MB49095E1D789819C9E3CEC881EC349@SN6PR04MB4909.namprd04.prod.outlook.com>
 <e790ba26401bfca4d526588e88d4c0318a40ddcc.camel@linuxfoundation.org>
 <SN6PR04MB4909394161091073345E1ACBEC089@SN6PR04MB4909.namprd04.prod.outlook.com>
In-Reply-To: 
 <SN6PR04MB4909394161091073345E1ACBEC089@SN6PR04MB4909.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Enabled=True;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_SiteId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_SetDate=2022-03-07T16:38:28.846Z;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Name=Internal;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_ContentBits=0;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Method=Standard;
suggested_attachment_session_id: 7400c8ad-e22a-37ec-10eb-77ddf1c20e1b
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e3b2981-dabb-4cf5-8d18-08da0058e92b
x-ms-traffictypediagnostic: CO6PR04MB7811:EE_
x-microsoft-antispam-prvs: 
 <CO6PR04MB781198D85FFF789151726F67EC089@CO6PR04MB7811.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 T4Iu0aYrxaR0ubgnp9zZIaKtVNMiMmEf8lq38yiElTl5r25WPzUHDyek32ne84LjqfWr5pzGjRTI28KMgQSmZRtusf2pQKh6pzOWL3oiy+tD3wgMhRkyL5y5o/4heI46sAegMRWsB758npzOzIkGdvdoK0ENBGEm4AXMXdQL6wIFTjWYRU2NFH9kZNJr5LQ12ExlAsHI5IzcLR48rLK1vMfnaIbnimPZfUt7RTFfvkJYIcHS1/6dnXJLdZEpHS0fh3r+1vh29djBmmqzV1ejHAL1Yqer1vcWTGUrP7tCPefkgeMbd+jESjie2q7wt0o73LxL5Tae9uuvEoWvbGash7Ntnnb8JWI6mfW8R1PJ9KmJSUT+3w5XZphs+FgF+lr83dO4qc5HErikVF7TGHmGTHzyCDBrzrzVcZ4P/WIdxlZsM8PEdkIderfAZvBHRliaIxy5RHtPU+rTO0lKjSGje48YxbUjrvacY4jtFjCYzQqhA96N2vM/LDLtMnk7oma+Enk8yqGABFLFlvZ9YCFwtn8YEhsPCaBq1LBEGUKWNrD494HY+F1D6MtZqC/Le5O+EkUps4zMM/ugn5Yi0JHwfa4bRlcEpD9XB4T4IwAT9Vf+1M/+ABCgZ6hBFHQSMt/Baz4D3PFkYv4m4pHJiR5hIaEM5Ag5MSmySfHsT69QDWcrh2NtXjJ1xt1is4VmMrFi9sYuUbnu/ls1HEpCZ1HpZA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4909.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(71200400001)(6916009)(2906002)(5660300002)(44832011)(8936002)(52536014)(33656002)(19627405001)(8676002)(66476007)(186003)(64756008)(66446008)(66946007)(26005)(66556008)(76116006)(122000001)(38100700002)(7696005)(53546011)(6506007)(2940100002)(316002)(9686003)(38070700005)(86362001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?IoQOnWtmY7kAmkK9mK0oof0CMrrJoU8rMRh1jQNxciuoJSwUjlgkheOjPY?=
 =?iso-8859-1?Q?iROLEnm6Sm8apGfB31OmyJmRbcrPZiqbD/SWWOfAKoLzU0l/+fUApJH3E7?=
 =?iso-8859-1?Q?GWSuHqY6mx31JNPUCI/fOO5VqAEzMM+47jo+o0Gyw69+xMhe4CR4OYRPvc?=
 =?iso-8859-1?Q?Qwj256BlGXy9I/NW6Jr9zApBW9ynapTMQLRcH1iCxKiOoVPf2pKi5oYm67?=
 =?iso-8859-1?Q?TmvTnPoZpA70xl+8Vvnl2Q9tJakiCz5R0IAHQESocC6+2/6ug/lND9h8Q7?=
 =?iso-8859-1?Q?mfNZrRuLWa+gg9JTjgHRgl4qd9+aO8q3216Ha8yMq8dxMfZG4Fd2NqVwe5?=
 =?iso-8859-1?Q?GTslSq6YcDyL0yBkmCxzBGXbRMwjzGAaVHoyMWxkhsxEXVEGSSn2jMdD1u?=
 =?iso-8859-1?Q?0dT3tGhSUhrP6kbXbhqI6G6J2GIlTLLKxnsH75aZY8o/s0QT5ibPdShfkr?=
 =?iso-8859-1?Q?aaKSHGuppbUos7EzVURoxqJXH3VCw4zKiBa/qWbowcuft6aOiT+qlxaF/T?=
 =?iso-8859-1?Q?VezCDjIKUkR/7BNHlSHWEP1o7pophm6wyBGkSU93p7tlosHnT8ow/nnADD?=
 =?iso-8859-1?Q?BWX98Dwfyrnjuf5dB9xhF0TL/0PGOSrQ0cukX11/EXYBfcLOpNOYnA4/QA?=
 =?iso-8859-1?Q?DA/opsJPzkvs/xFr26rCGU6TZrWlgQPXx0XydkSxvl3XWykbcs1BolmLeL?=
 =?iso-8859-1?Q?7x1UAlrvqNddEF+z9xwJ+BOMCRu+ZUwuVznBgSfeRgyt5ZRUSNgswtTx2Z?=
 =?iso-8859-1?Q?WC3mh/vPiIWc8n0uKy9duGP6M/Qfs5wiT+Im1gJR1uSnTezetJPcsaTZoL?=
 =?iso-8859-1?Q?UXLU4NAyY7h3sUWLuJogOGXhN8PFvldCFRINtPZosUrAp63UwL0UJgGkU5?=
 =?iso-8859-1?Q?IATmCAl3xFQESZxlMX6ZgIulkXGJNZZ2qINGpaTWEwd3wCdG24fZhbTS70?=
 =?iso-8859-1?Q?UTG3YufwYuF0BhkSq8r12/FYodaACwXdM2gOC3+Ylavty5pC3oFr74UX1G?=
 =?iso-8859-1?Q?tkjo9yjDgOsJXDClU75fMXSCtMusCE6g88Gv5ohrwvqEuvMhb+5k0sdg8S?=
 =?iso-8859-1?Q?Mr/tLiASm3keiP5r4o+Z5UZVKcMgU7NoRRNd4mKBTWSgnr0Ys7oqOabpV7?=
 =?iso-8859-1?Q?cFcAmk+xseCqa/HqeUzeB2Or2xk0CW2B7fyGQWGaSdov3lGhaUAzUAOGO4?=
 =?iso-8859-1?Q?eoUv4VWhJkPIM8dYbQxeXXtUW0aljskS30tvid4NbmynyOQkBzx+HaXIzH?=
 =?iso-8859-1?Q?fT7TT1oBQjgd6WNLREsRgBsEHo1XJ7r5oYvIyYCBg0o2KntSVV9Yt/bIk/?=
 =?iso-8859-1?Q?4P6X/QfeJHoDiw9+hgQemcFijBgcw/Tj6eGZPQ96eQsU50jx+6UVIt2UlC?=
 =?iso-8859-1?Q?nWddiuymptlMn/OU26JfbWp//VeHIxuhf0+qxLT120UMAiqi/FBws03yPS?=
 =?iso-8859-1?Q?GvUZCrSSElylRPeEJ46WQe/15Wdsw2sKcxaH8PDCOWpUOTA4WobygzB8ie?=
 =?iso-8859-1?Q?qs+XqGYlVjGswAQF8lIwKEdrfXkgmBKbvvOjaFf9x8B1Fhfbpyszlvav7q?=
 =?iso-8859-1?Q?3dLgvS6YyucWgy1Nno4ORcQly0AHQ/UlJp7k00jJhgUsjR/VNafxbPHoOU?=
 =?iso-8859-1?Q?XJS9Lp6ENc5UGSvldzunqfpTbjQdMOCEpJ9c+f6k/GARZ3FQPkMWontw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SN6PR04MB490954026B270D62EBDA29F5EC089SN6PR04MB4909namp_"
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4909.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8e3b2981-dabb-4cf5-8d18-08da0058e92b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 16:38:29.4476
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 YUixeP41sAqLUOk3/HvW6y34R4P05iwUuPtSO/9eGjlaW/z/8NYKUKFoTwfqQ5mw6x2zae6Kc7ICHO1DstsmGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7811
X-Proofpoint-GUID: uXpt-YL2OaPd4EDkBkw-pX7Xl6P_hd2I
X-Proofpoint-ORIG-GUID: uXpt-YL2OaPd4EDkBkw-pX7Xl6P_hd2I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-07_08,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=947 classifier=spam adjust=30
 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203070096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 16:38:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162855

--_000_SN6PR04MB490954026B270D62EBDA29F5EC089SN6PR04MB4909namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Richard,

I don't think there are any additional test cases that need to be created f=
or this condition.  It is a fairly unique set of circumstances that cause a=
n error in our build system and would be difficult to reproduce outside of =
it.

As for your concern about this being the right thing to do, honestly I'm no=
t sure, but it does seem wrong to me that there is a code path that ignores=
 the value in options.kernel_dir, which is why I proposed the patch (and of=
 course our build system was being affected by it).  I'm not sure if it is =
right or not, but it seems "more right" to me.

Hope that helps,
Bill


________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: Wednesday, March 2, 2022 5:02 PM
To: Bill Pittman <bill.pittman@ni.com>; openembedded-core@lists.openembedde=
d.org <openembedded-core@lists.openembedded.org>
Subject: [EXTERNAL] Re: [OE-core] [PATCH] wic: Use custom kernel path if pr=
ovided

On Tue, 2022-02-15 at 16:54 +0000, Bill Pittman wrote:
> If the custom kernel path is provided in options, then
> use that path instead of the default path.
>
> Signed-off-by: Bill Pittman <bill.pittman@ni.com>
> ---
>  scripts/wic | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/wic b/scripts/wic
> index a741aed364..29a157bf37 100755
> --- a/scripts/wic
> +++ b/scripts/wic
> @@ -159,6 +159,9 @@ def wic_create_subcommand(options, usage_str):
>                             "(Use -e/--image-name to specify it)")
>          native_sysroot =3D options.native_sysroot
>
> +    if options.kernel_dir:
> +        kernel_dir =3D options.kernel_dir
> +
>      if not options.vars_dir and (not native_sysroot or not
> os.path.isdir(native_sysroot)):
>          logger.info("Building wic-tools...\n")
>          subprocess.check_call(["bitbake", "wic-tools"])


The concern with these kinds of changes is I can't really test it or tell i=
f it
is the right thing to do and I worry about it regressing in the future.

Is there part of the test coverage we should be improving too? wic does hav=
e
fairly good coverage from oe-selftest -r wic

Cheers,

Richard



INTERNAL - NI CONFIDENTIAL

--_000_SN6PR04MB490954026B270D62EBDA29F5EC089SN6PR04MB4909namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
Richard,
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
I don't think there are any additional test cases that need to be created f=
or this condition.&nbsp; It is a fairly unique set of circumstances that ca=
use an error in our build system and would be difficult to reproduce outsid=
e of it.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
As for your concern about this being the right thing to do, honestly I'm no=
t sure, but it does seem wrong to me that there is a code path that ignores=
 the value in options.kernel_dir, which is why I proposed the patch (and of=
 course our build system was being
 affected by it).&nbsp; I'm not sure if it is right or not, but it seems &q=
uot;more right&quot; to me.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hope that helps,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Bill<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<br>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Richard Purdie &lt;=
richard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> Wednesday, March 2, 2022 5:02 PM<br>
<b>To:</b> Bill Pittman &lt;bill.pittman@ni.com&gt;; openembedded-core@list=
s.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> [EXTERNAL] Re: [OE-core] [PATCH] wic: Use custom kernel pat=
h if provided</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">On Tue, 2022-02-15 at 16:54 +0000, Bill Pittman =
wrote:<br>
&gt; If the custom kernel path is provided in options, then<br>
&gt; use that path instead of the default path.<br>
&gt; <br>
&gt; Signed-off-by: Bill Pittman &lt;bill.pittman@ni.com&gt;<br>
&gt; ---<br>
&gt; &nbsp;scripts/wic | 3 +++<br>
&gt; &nbsp;1 file changed, 3 insertions(+)<br>
&gt; <br>
&gt; diff --git a/scripts/wic b/scripts/wic<br>
&gt; index a741aed364..29a157bf37 100755<br>
&gt; --- a/scripts/wic<br>
&gt; +++ b/scripts/wic<br>
&gt; @@ -159,6 +159,9 @@ def wic_create_subcommand(options, usage_str):<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &quot;(Use -e/--image-name to specify it)&quot;=
)<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;native_sysroot =3D options.native_sy=
sroot<br>
&gt; &nbsp;<br>
&gt; + &nbsp; &nbsp;if options.kernel_dir:<br>
&gt; + &nbsp; &nbsp; &nbsp; &nbsp;kernel_dir =3D options.kernel_dir<br>
&gt; +<br>
&gt; &nbsp; &nbsp; &nbsp;if not options.vars_dir and (not native_sysroot or=
 not<br>
&gt; os.path.isdir(native_sysroot)):<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;logger.info(&quot;Building wic-tools=
...\n&quot;)<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;subprocess.check_call([&quot;bitbake=
&quot;, &quot;wic-tools&quot;])<br>
<br>
<br>
The concern with these kinds of changes is I can't really test it or tell i=
f it<br>
is the right thing to do and I worry about it regressing in the future.<br>
<br>
Is there part of the test coverage we should be improving too? wic does hav=
e<br>
fairly good coverage from oe-selftest -r wic<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</div>
</span></font></div>
</div>
<br>
<p style=3D"font-family:Calibri;font-size:10pt;color:#000000;margin:5pt;" a=
lign=3D"Right">
INTERNAL - NI CONFIDENTIAL<br>
</p>
</body>
</html>

--_000_SN6PR04MB490954026B270D62EBDA29F5EC089SN6PR04MB4909namp_--

