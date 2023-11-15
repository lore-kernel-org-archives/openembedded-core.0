Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4848C4332F
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 13:21:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12691.1700054511374686962
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 05:21:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NkAw3iy/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=968395276a=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AFALCBr028504
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 13:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=Lk3qUPGxo5kFjIZF+D
	8yL+7vD7XwzvnKfb4frnXFLNM=; b=NkAw3iy/cvp4bcOCgMvVpxhBdal8zh3vvU
	QuKuJ0WfRQPobLX5Lf4gp559Tzsmi3AieBYw84UTnw8L3F2b1KYDN+90XxdYkvKB
	D5i86lESyGhYzHE1LAj4DLQjneZupQUy8v9MVdMJXxT/IKG/uZGOkJrbC3E7JbyR
	UZfsfIbXgUVKiI1iOgiC+pV0keTeKrcoYDyFQCuD9kjUFw1NNHoJ0xf6swrV+3gX
	9wXwYKkZLCff2GAU3q84a1p0FqcJ7izeVXzYoGsZOr1w4GtIyuVFyk1KKHRSwnun
	PuAE9fcUwHQCzEPMGTJ5SDEvx9qRWJkk6Q5WAtRi7RB6YtswpHDQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ua0k6bpx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 13:21:50 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3AFDLniX012572;
	Wed, 15 Nov 2023 13:21:49 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ua0k6bpx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 13:21:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ln7tzZdYYPC3cGC3rWEJ2tCTxlT4afzjLXlOV85mW4vCec70g8lR/bzWrdpF/ZqyVdmc9rZj3yueI5kSySEK+cTxbGHdwn/2KSoWK9w0l6q+iFDT1hCoHe19yNEmowldyGAnxXpPxxfLZykOUIsnNSBwWRncwBnCo+JINPJ+Kmg6VISuRzhLetK4ZvB7YOJMX1RoL9TvleWRXZdCtYT7Hc+0H6X7p/HeRqLtbVIty84OrMbdzTiFM53tDvbOmgmnCu95yoQNkoJDEnvZ5oWICtQa7qNIjUGc9oJMI8Zz3TeqKpE2+zmYi3FngG4Fg7v3pT6xzY2esDnpj+ELdJgT/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lk3qUPGxo5kFjIZF+D8yL+7vD7XwzvnKfb4frnXFLNM=;
 b=eX12d211AzCcfOHNDD4vPncwLuXv5Cvf02UsrWtT1mzR9lR0nx1y8Qsb8a4as+cRBfSTCTe/v+t3qZOSS9LOyE4FtBq2PHPQ3hI+X40nh1Iv+Gaqw4sPoHDrQawxXonBNMw7krq6lvcPjzDge+v81UnDar+v7RBvFyUdpzg7HpzP0ieLYvSWtBpQmRAOD6/27gRtxJtmaooBQdWNoPM4n/1n6oYM2DIAuThoDTI9nDCg6Tv1XZDPuzt1kRdZrmzCrrHVvHznbHkWcu5pFZmus9CUO5hSxajbjccipPY+f7Hzv8dQipiKHSvrO6Bf3uGjzeegqI2466JCeyx+w51hEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by PH8PR11MB6951.namprd11.prod.outlook.com (2603:10b6:510:225::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.25; Wed, 15 Nov
 2023 13:21:37 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::d836:9049:e781:2391]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::d836:9049:e781:2391%4]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 13:21:36 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] vim: Improve locale handling
Thread-Topic: [OE-core] [PATCH 2/2] vim: Improve locale handling
Thread-Index: AQHaF1LttvF1Ev3Hs0+fRc9V05ehbbB7R5DAgAAKvoCAAAvJKg==
Date: Wed, 15 Nov 2023 13:21:36 +0000
Message-ID: 
 <MW4PR11MB5822AB3A5C5F06F2D531215F84B1A@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <20231114233220.2567795-1-richard.purdie@linuxfoundation.org>
	 <20231114233220.2567795-2-richard.purdie@linuxfoundation.org>
	 <MW4PR11MB58224AD271C46B0D27AABBF684B1A@MW4PR11MB5822.namprd11.prod.outlook.com>
 <479f742da1557615f8ce6b30bdeda341f2cdd4b5.camel@linuxfoundation.org>
In-Reply-To: 
 <479f742da1557615f8ce6b30bdeda341f2cdd4b5.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|PH8PR11MB6951:EE_
x-ms-office365-filtering-correlation-id: 73232daf-a396-4086-7e23-08dbe5ddcb9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LwXjwKPZZq4a5c3EDWh9nayDkrJPnbw2M4GVCOa2R2exHq7UaIm0miIV1qdcEbfLvmi/FluNBz76+woj9PUxWfjT6RROrp5qHb5c9sN3sIUNkNpsW6oZVBHWxvJwQechG0iQxPJvGRmAodHtPbD45S/TamUkw1+lnRaYjn/vHKHWLrs7AV5DurLyjfx6tEtSxKyUMgyKJa6nXUJYe5ZV1ZPbnFNQEOpOvSNEiqqxYtpdVSx4kqxh5kqn5eMCNL0cZU2vINx1Ch+0bWFxx/qIMICMttC7GvjLP0z2VYr1lPOS+8yCO39ljUSnaBk2x9d4uqYIKJ/OsTCdBlSDgyZEmzqdClbNRphKWuvTnf+XwQ9EEErA6YQHnzzIf7PGOGyxzPJrnJA9QDpDQdyPsyZ977B6of7U/Uiej3+r/9kSGtkfKBK1bLsKZvjD/P1QcVmb0nv74C7B4KJTlkjntY//sk2uMulakdfK14PTAPScELOGKMHObKlCDQmKBMRD51I2haKnPwPEzlc6KIfgtyW960t2+S+iZkVoe6tircckoykp19LdUPKt7C5B8y1LR/X++oebx4rao07JghMdkHj7B8XCxanoVYWaISadNiBNR2bOb7u4qAsH9kCSGog5JiC3baqYk4fpJAMIPgtBmQizPNY0ppVRZ7/Ulbuf5jqhJ5c=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(39850400004)(346002)(376002)(230173577357003)(230922051799003)(230273577357003)(1800799009)(64100799003)(451199024)(186009)(52536014)(19627405001)(66446008)(76116006)(2906002)(8676002)(66556008)(64756008)(91956017)(66476007)(8936002)(66946007)(55016003)(71200400001)(4001150100001)(478600001)(316002)(5660300002)(9686003)(41300700001)(33656002)(53546011)(86362001)(110136005)(6506007)(26005)(83380400001)(7696005)(122000001)(38100700002)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?MQTQB+vLi8X7cYgtYF9uQo602tW9yOj2w8tdX3+3XddVkOsa02SOggSPDF6S?=
 =?us-ascii?Q?Y+g8rIZ5Yw7dwQ5uw96+VjW9y8iQvQ8DMxbI3SOkX/wBc7ij/4b9P8pSLsLZ?=
 =?us-ascii?Q?Zd626FCh3cQRkOQrnRBnyUpAKxbC10EzVaa8df/DSASc7+2+PtKbe21IfAVz?=
 =?us-ascii?Q?6vRDAkxUalkMm0QJq4jFjNioxq2Nzkv3M/cB2yV6AnDheiMkeQVcIxlm00ct?=
 =?us-ascii?Q?ulkZ3TejjQE0/+JQtiF7u39YnvjiEYt9LRqBwmyUqd3qY3jSysxJQ1Z4LuCv?=
 =?us-ascii?Q?PaR+q/gE1iCZBILPosN3JA1t0x2EC/brHKpZtueVuPyl4fzf0HOXc6AKAbey?=
 =?us-ascii?Q?Smdsst3Qhj97JztvgOCFE878eRnzpcdvtm+024fm2hORCEFG1WBVgQqSbjnm?=
 =?us-ascii?Q?XGX22Du0jyNqR43EQOOSv16FQjL6MAYufOoqmqEDvwavsTgQBfCTn202nYgZ?=
 =?us-ascii?Q?AoPao5iNahvg1PAtbIQguintZYvf7ZNS0zqka2nsAfGag24V01pX0y1Tpmkp?=
 =?us-ascii?Q?AVumwP7QukGCJb7TcC/xBFONIOshTNHffnTbYRoG2FtkezrjNmWn08hKBwXg?=
 =?us-ascii?Q?gqgxNf932I6s04sEV7MjGpbUWsWM8qq1rPgTgqTxDyHi89y2QOfXGO1+Vin+?=
 =?us-ascii?Q?SpB5fYKx/UG2KI77BhJBisk/djVktCD4bOmes3EW7R3zeNJpEwlIeTfK+2fV?=
 =?us-ascii?Q?DmBWmiM13iAZT5wzQ/N8o316eM1tui+53PR9cxeGQ/zt6QYRzJcP5ebMnZ+H?=
 =?us-ascii?Q?b2Cu/KwZxkzC6nzRMgoZS3PkqotNOvn9lrA5Sip3fWEwot0q+i361SfC5xiA?=
 =?us-ascii?Q?8ETtFjvlDWotbZn6HoyVUFOaStHyZN6LeANTy4W/B18/khqIjIOY2xihjytx?=
 =?us-ascii?Q?lApXwML4dU+XjYKfE/e3n6bGU0bwb+V6sOkQ87H1Opxf8mOqldhdAk3yXyia?=
 =?us-ascii?Q?k2+WIQ0ewPpZGJZrJtB5KxYD30+wBQBjVvnABCzyuhzzLqvEhZJ/+4U7+tIY?=
 =?us-ascii?Q?4UdybuS3qWNbZL1g7/AmJ+FIizEo3qV66pz69DDm+sRjRNGOxh7RN3M7jTur?=
 =?us-ascii?Q?P0CagvXvWNAFRBh+N9rlHVZn7NQ7QCjJSeH0FqrPZ0LLYLRI53EXYoVXtrcD?=
 =?us-ascii?Q?f751Rcitl37qSltOezQtAzULXP/gWEhx5pj0GLKGs6FNgDrMb/vrNaVMcJLF?=
 =?us-ascii?Q?Vtv4wmGNeQlUtDiOrGHx235pjfTrRcdUY0JetZ+zN4am782Pg5OglvRZo0zs?=
 =?us-ascii?Q?jfGKF27y1gZp/CW/Eux8wtfbPAhdPxj0zCqs6Q1T2zyYWJWgS5Gb0x9bkNG9?=
 =?us-ascii?Q?PxPPRT/3pykA8GhnAMZRf2V67Oq9onxszvml/yfBbGzJnGBxs/83LoACPdmC?=
 =?us-ascii?Q?CQnnzWF5RWOjAo45YIdCmT4mOWBNfwgORaT7xAvpyooN/LCxrbRgmOgEFhrK?=
 =?us-ascii?Q?CR+wXcbcq9Dp9LaBP3qmRX6dIgPhFj8ucb2veYRQ8mRjf6jeYu5SajImkxsv?=
 =?us-ascii?Q?AsORXvaTD/mOdLGWHCMtYNgs82XQcyKa2EaJ+6iJWLmuprXdlRwigLrD6Si3?=
 =?us-ascii?Q?c/zAVeSE/v2qvvOixO8jUywNro/ID5ZUQXF1MV3uRS/Hvi7e/lMNoO7wApX/?=
 =?us-ascii?Q?lw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB5822AB3A5C5F06F2D531215F84B1AMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73232daf-a396-4086-7e23-08dbe5ddcb9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2023 13:21:36.9370
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xrKpn/Ne77VmpVh9WhVg+hbYlkoARE+gGJL5K2nSUxC0DCMu/nzgTa0C9Dlm9sRpMgK2Iwkl7ONPO7neOh1ZzgqnNzFMOQBwFk1DJEZgtmB0io1K0s/cUGT0vyqTwdkd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6951
X-Proofpoint-GUID: kq3YNcwQ4NdBBzm6CgjfK3O40nwVtlvm
X-Proofpoint-ORIG-GUID: KJJ2iJ0jvIQvTRFzMEfySkTbRJKXunDk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_12,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=618 spamscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311150103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 13:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190594

--_000_MW4PR11MB5822AB3A5C5F06F2D531215F84B1AMW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank you for the confirmation.

Regards,
Archana
________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: Wednesday, November 15, 2023 18:07
To: Polampalli, Archana <Archana.Polampalli@windriver.com>; openembedded-co=
re@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] vim: Improve locale handling

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Wed, 2023-11-15 at 12:11 +0000, Polampalli, Archana wrote:
>
> Hi Richard,
>
>
> I am planning to send Vim upgrade patch for all branches.
>
>
> Could you please confirm Is it applicable to other branches as well,
> if yes please confirm are you planning to send other branches also It
> will avoid patch conflicts to further vim patches.

It is applicable to all branches and I believe our LTS maintainer has
it queued for them already.

Cheers,

Richard

--_000_MW4PR11MB5822AB3A5C5F06F2D531215F84B1AMW4PR11MB5822namp_
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
Thank you for the confirmation.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Archana</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Richard Purdie &lt;ri=
chard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> Wednesday, November 15, 2023 18:07<br>
<b>To:</b> Polampalli, Archana &lt;Archana.Polampalli@windriver.com&gt;; op=
enembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembe=
dded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH 2/2] vim: Improve locale handling</fon=
t>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Wed, 2023-11-15 at 12:11 +0000, Polampalli, Archana wrote:<br>
&gt;<br>
&gt; Hi Richard,<br>
&gt;<br>
&gt;<br>
&gt; I am planning to send Vim upgrade patch for all branches.<br>
&gt;<br>
&gt;<br>
&gt; Could you please confirm Is it applicable to other branches as well,<b=
r>
&gt; if yes please confirm are you planning to send other branches also It<=
br>
&gt; will avoid patch conflicts to further vim patches.<br>
<br>
It is applicable to all branches and I believe our LTS maintainer has<br>
it queued for them already.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB5822AB3A5C5F06F2D531215F84B1AMW4PR11MB5822namp_--

