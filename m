Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 266D1CD8C97
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 14:38:00 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.133])
 by mx.groups.io with SMTP id smtpd.web10.93439.1696948673824505189
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 07:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=YlIudp3t;
 spf=pass (domain: prevas.dk, ip: 40.107.7.133, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VPQJnQyNEGEM8TbFub+jkXLcluFR8arQkXSKbuxOgQHi4RNKjuNoukXIHU6eQklPTm82d+Nrij/OIWotHYs9woQGLs2K+9UjTX3YnWcp8QNJV4u7Sf84OOQOGygio957ypcP8A1Jcqe72R7ZJbnrRJtNTF1BXqNoF8UJo8P4qNB3YfmLsWsk1PLVmwo7Aa6W3EOJ6MR4bZkT94ot20XFaaucZYaYLcnIMLsn/CMAIf4r11koBDdSeeW5VsPnbBaqq2xjnFycWPajoaVx1mCMHcQSKdF+JrrnCWcVQgETCa1SYK817M8E1HDqsUpvkqOxMYiQVJrRIhbUYNI8i1tbnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8wMO3BdM2WygBFW+FlkSI7NM3Ca7B/9BxX9vZIZYuQ=;
 b=ibeq/tdo72UUGJbRQZ9ESOrqS1O9bkER/rd6mWOTdAfWpgyrAaMXeueurcCkU8PxdbIIfbbUglZw06kyivU6ykaUwvQiAmmyCBiJosAZKtn51U/wB+0OTp/KfCRim1ZP8MQMKwmGg4sGCE1lkt8p3pxSHUI16scq0pyA38u6nfz1oxgTit5iG27NLj092mYRre/7+OSUi6TtIHOPN0WY5ozktyk1wC0dLynwLBdHyV2rxe0hBaf9ZZOuz9RDXupJJPYU11szUT1tYAnSbIq0tkALkPdcPX3W2ASHRDgUTOOQzFbrx1JW4UXUhyqEXKwXuOdge5+QvtqNHLgdD2VsBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8wMO3BdM2WygBFW+FlkSI7NM3Ca7B/9BxX9vZIZYuQ=;
 b=YlIudp3t/ioGDZdCU0Wmb5zHnOQ2+Q9l0BizbFPyBNP9A95mvPhiyxuu9sB045/IKEzN3bBVhyp7qsTFZ/j0QUyaEWKgdK0u3wxnJ+j1BswJY8sXwQCFcnsnNcZZZLVGVnzm5/Xv65tLsMQTKpfObbsTryzSDKifYZlubZCyVRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS2PR10MB7082.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5ea::10)
 by AS8PR10MB7730.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:63c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 14:37:49 +0000
Received: from AS2PR10MB7082.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2f42:739f:7713:5e99]) by AS2PR10MB7082.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2f42:739f:7713:5e99%3]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 14:37:49 +0000
Message-ID: <dfeeb982-555e-8195-3dde-ef621ba66a1f@prevas.dk>
Date: Tue, 10 Oct 2023 16:37:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [OE-core] [PATCH 04/15] perf: fix buildpaths QA warning in 6.4+
Content-Language: en-US, da
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
 <1c4a47b33bed622c5b7c137a830e359302293887.1688958789.git.bruce.ashfield@gmail.com>
 <ca1963d9-39aa-d00f-6ac9-9ee919db7d32@prevas.dk>
 <CADkTA4N1A1DGi1Kde+Muaq_pHB=XXRPiHui74PD24pVwf1-SAw@mail.gmail.com>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <CADkTA4N1A1DGi1Kde+Muaq_pHB=XXRPiHui74PD24pVwf1-SAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR10CA0067.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::20) To AS2PR10MB7082.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5ea::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR10MB7082:EE_|AS8PR10MB7730:EE_
X-MS-Office365-Filtering-Correlation-Id: ba7262bf-ae3b-4f66-38e1-08dbc99e79fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7SBgfJ0DFHtsCeVXApm/K4+oFcYJrHGZctmlgaluBpdIPKVSVwynYoOW/UmYF8qT1l1YzM7mx7oXuIips4caUlyL+fil5T+K+Me6O+fnbr2HNqMWGZ4M9nCTEj8ujNAxTxfHhv1i/k555m0CWFmVcy01x1qHI1Dcmgscs7I7TjI+DVAmQFsIngoc0d3DBhzm9bM2s9MsKQZM0ZPh8QD91ussgCm652CCSUpNbYYDEmhcKf2ht8qkfE7ns/vmwc4BTfos6ogFceWrjqkLyQQR4C5KXlofYdvCmhNk+11gTZH/tRsQ73YlffsYHZzjpFIvyN55RFZWIqkSnn9UDxWtoaPJvgwyygRGzS3qzRLq3GyFDQ/lQ9xOrI3IyPBDFuLLJM6PMxiocQR89dmOLV10Jm/gnFRQTDBQyiKfto67muB6RinKkrpT64PV2LMlKIC0GjnZcD/XspEUJHzp9YZjwM3twtvLzCe+aFgGSUrmetc3P6v4LSzbZeh5qCR9RFruupJ4R2cWkG7nbBqkXfPiWA0lKC/m1fVxGwcIyjM0Mrjs1mpSxKGJzChALiAU9rwWABjSpNdmOIV+c8vmcRLhzMXoifn9fCblyUd6K9LFb01A0RADI4Rak97abMBpZvOfkQsXVT2A7iOOeJbf2AAg7q2A/XN/KyetNK17SPX1wcE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR10MB7082.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39850400004)(136003)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(478600001)(6486002)(66899024)(2616005)(52116002)(36756003)(26005)(6506007)(6512007)(83380400001)(316002)(66556008)(66476007)(6916009)(66946007)(41300700001)(86362001)(31696002)(44832011)(4326008)(8936002)(8676002)(8976002)(5660300002)(38100700002)(38350700002)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DleIbcsCalMYKG72nn6ntrGqW0ek02ehuzmhQ2+F038ugjcUjOmTlYL7zgN1?=
 =?us-ascii?Q?B8ShQGMF0rDBykGZZKa/+wqQB9bnObjrRJDU7O6hj539VnMI9NLWUREKIAP4?=
 =?us-ascii?Q?3B4SiFUzRg9CyYzyFtCP5KQK0lBHLmmwk2UgRPIEPf/T6r3b9nU0bXPHwTIC?=
 =?us-ascii?Q?f67ZkYQiS89F68ONrbEdzXLBJLQrPcYDNiWG3zV3Pt906gKcNjrXTI25bgZl?=
 =?us-ascii?Q?/KrQtENrntIGdsglFQbXpJc1MkEWSYuCEp/yuEg31P/6WWEYK2tNF1+tOUUw?=
 =?us-ascii?Q?YGfriFx4YxhgO9u/JUcfEvcYElnxg17tSZ7qvFbDYcHdzjv2nf1/SJUwVNGT?=
 =?us-ascii?Q?P/qEZMGo/mhnoh+zqPPrkJ2iGFZrI1c3xWSCKAYbXMoX0cY1GxmAM0nKRceQ?=
 =?us-ascii?Q?I6YEryqIiKRKq8WQw3XT5baTOdXR2SEi0DtuoEuFNYRm6CoCxqcoIf3Wftxn?=
 =?us-ascii?Q?Kif+tZ+d2S2JlK4mD8dNvH4m7CYWq5Fuf6a5oURtld1O9MxCkaALIePEGwI6?=
 =?us-ascii?Q?XbTdE8Bg3N8O4567wMvJvvrLX6bM/lrKdn7HKj5b7wAG6M/i0tC1E2gJS/KO?=
 =?us-ascii?Q?zkfh1jESscGCuLEY5j6jBey3o0wcgnIcMip3gSu3eB2TbbVLj4cTP+r1/31J?=
 =?us-ascii?Q?PIhmOZBKPCjMIEwx8lip2afRs2bqVDK62O4bgnnbH90r0rnx/Q887NyI1Gbl?=
 =?us-ascii?Q?SuwZC2ZwnevvsvVSnJwUmydeTdRWWBtNAsOJYc1n3usU5vp6kNGWGvurGy20?=
 =?us-ascii?Q?iQhV4jpJcP9cXXCFXLVgMNRWS3gw1sqgplqDxBlWt15am7/xP36uIa7Gz/GY?=
 =?us-ascii?Q?BbFJciEBrDWKhmoBgznHhXvUA/tRSLltya907TOQ2W4EbqWrdxtaLSu60IUo?=
 =?us-ascii?Q?fVFrLgFt8BFTl5R5NGTgPdjgC6pKGlPZLGSCBiow1XOT59AIVUinaNrG9wgE?=
 =?us-ascii?Q?aOYjNGtJ6Pj/QCs2GPJeVfaQOcSaiKmupqqsAcH8DkQCGmeYJ8Txs/1CCa/1?=
 =?us-ascii?Q?ZW2GEeFG10n/bkJjkxe55aVPrTRiDmDZDjtHcdZ37HzHWNsc0/MgP1QjADTp?=
 =?us-ascii?Q?ahMZ0GZ+BNvrNC88VOlYh0XecBO28jdmQ1eQ55lNxAUrklUpnHbBL0ppM5Vf?=
 =?us-ascii?Q?Gbok1tXvsBjYmg21A/1ZTO8KHBKS1uBV63B3wrXjUS5fTuyJMJ8Y96OyAra3?=
 =?us-ascii?Q?YxMqKTGHyiDiHuYcO7o5H6hvk54M7o0W/4SDF7/iNFsI0zW+qq/gbLONtv/G?=
 =?us-ascii?Q?uHqxug8HUo+RRHMOAbKm6F/3HJWAo4wgk3cULdRR1KpwksZJpLaYs4gDttv3?=
 =?us-ascii?Q?eJO0tDvt2vNarrEiBAUB72vf1ph9GH76ePhdrg3W6wALjD/Qxl91gfK62W34?=
 =?us-ascii?Q?sO12QGWF6QTr1ZPeUfVD6eyfCgGljz1cqg575AlidhlvLYtCNXJr1VRMbug0?=
 =?us-ascii?Q?L3fjDwkf1suqcLWdr27V8oyD9u+piP7u5/2XWaiNuChDX8mqwkfta++tbDtl?=
 =?us-ascii?Q?eFLD5jHFh0xJPL/Su7CnbQvb9+YpeGpBQQKEOhFH1yekIFgMccYiNWztjkS/?=
 =?us-ascii?Q?RUYEu7A6Rmvl2GBoG+NvTMLp0cnV4p9RpxdNBPqxJdgJyu6nma3sOS3SVL2s?=
 =?us-ascii?Q?fg=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: ba7262bf-ae3b-4f66-38e1-08dbc99e79fd
X-MS-Exchange-CrossTenant-AuthSource: AS2PR10MB7082.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 14:37:49.5163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KNUK6XLVnAGzCssxhCM6q6dChskpoC8SwRYZ1uHk91pqeW5ZkDjaZBgkUee8HU1iOPEbL5z79S+7BxvLTN8svomnk9wwZU2xGl9z9IydTiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7730
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 14:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188910

On 10/10/2023 14.31, Bruce Ashfield wrote:
>=20
>=20
> On Tue, Oct 10, 2023 at 7:44=E2=80=AFAM Rasmus Villemoes
>     It seems we can fix it with
>=20
>     $ git diff
>     diff --git a/meta/recipes-kernel/perf/perf.bb <http://perf.bb>
>     b/meta/recipes-kernel/perf/perf.bb <http://perf.bb>
>     index 420286e..59c0c10 100644
>     --- a/meta/recipes-kernel/perf/perf.bb <http://perf.bb>
>     +++ b/meta/recipes-kernel/perf/perf.bb <http://perf.bb>
>     @@ -81,7 +81,7 @@ EXTRA_OEMAKE =3D '\
>     =C2=A0 =C2=A0 =C2=A0LDSHARED=3D"${CC} -shared" \
>     =C2=A0 =C2=A0 =C2=A0AR=3D"${AR}" \
>     =C2=A0 =C2=A0 =C2=A0LD=3D"${LD}" \
>     -=C2=A0 =C2=A0 EXTRA_CFLAGS=3D"-ldw -I${S}" \
>     +=C2=A0 =C2=A0 EXTRA_CFLAGS=3D"-ldw -I${S} ${DEBUG_PREFIX_MAP}" \
>     =C2=A0 =C2=A0 =C2=A0YFLAGS=3D'-y
>     --file-prefix-map=3D${WORKDIR}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV=
}-${PR}' \
>     =C2=A0 =C2=A0 =C2=A0EXTRA_LDFLAGS=3D"${PERF_EXTRA_LDFLAGS}" \
>     =C2=A0 =C2=A0 =C2=A0perfexecdir=3D${libexecdir} \
>=20
>     but I'm quite curious what the difference between our setups is, sinc=
e
>     apparently the only problem oe-core has/had was that new file introdu=
ced
>     in v6.4.
>=20
>=20
> You can see any patches that we have against perf in the kernel-cache
> repository (https://git.yoctoproject.org/yocto-kernel-cache/
> <https://git.yoctoproject.org/yocto-kernel-cache/>). That being
> said, we unfortunately cannot really patch perf, since the recipe is
> supported against more than our reference kernels.

I didn't suggest to patch perf, I suggested to patch the perf recipe.
>=20
> Other than that, there's no special setup (in particular no setup that
> I have) as it is the autobuilder infrastructure that typically finds and
> reports these issues.

So I found the difference, and those autobuilder builds do in fact make
the compiler use all the right -f*-prefix-map options. It's because
meta/conf/distro/include/security_flags.inc contains

TARGET_CC_ARCH:append:pn-perf =3D " ${SELECTED_OPTIMIZATION}"

and that includes the DEBUG_PREFIX_MAP setting, and in turn gets
included in the CC setting via HOST_CC_ARCH. And of course the poky
distro includes that security_flags.inc file, while our custom distro
does not (up until five minutes ago, I never knew that file existed).

Of course one wonders why those :append:pn-* settings that don't
actually append any security related flags, but do affect stuff like the
recipes passing QA, are hidden away in a file called security_flags.inc
instead of those settings just being directly in the recipes themselves.
There's no explanation in oe-core e93765ffb57 ; it removed a whole bunch
of append_pn-* stuff which had apparently become redundant (the commit
log hints as much), but doesn't offer any explanation as to why pn-perf
should grow that setting. And AFAICT that long predates the invention of
the -f*-prefix-map flags, so it seems to be mostly by accident that
perf, with the poky distro, actually does build with those flags.

Rasmus


