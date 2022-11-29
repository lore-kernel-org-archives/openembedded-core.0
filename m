Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24500C433FE
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 07:49:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.144044.1669708152144888477
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 23:49:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JLRL5kl0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9332ad9ffb=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AT7LMPq010020
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 23:49:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=JbYsq7quzB2qUSuesnRxJPx+DUFtnQC2/gyxQpjnopc=;
 b=JLRL5kl0yW4Xr4wXzvq2MAslcVsYqQu3AgKeGhs7SFb3ztM3mraeWi5jZ1NzE1vsIbay
 RAvploPtrFt2EVsQ2TbYh4Xjp86bBJThuEk7+m6pmBOvVQoPSCNvOL7iSd7ZjZDrAP/f
 HdnnPQEBTkE5fAb671r6l1A/GvyL89h4eVf/XZnl/yFciN3yExMF+XfIVS/MYcbtRm+0
 IWMhJ7IQ0+HiQcSyTbKaMVTJSqegih1qY70OclP4huT9XYUl5wcF0FoZm4RW79Cggpfe
 s+IArt/BC2MyX5FmRG/2H2cV2QoefN3I6VmjouB4+9hrWPmAHWhvXBh8mhlFTRtKMzLf BA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m3k6r9y7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 23:49:11 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AT7nAck010203
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 23:49:10 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m3k6r9y7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 23:49:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHbnuooFXU/8QFxqIMNqkEHdnFVpipC42e/35sJnboppLJhxIiTtvEL64bkJS2p7+9Mvuo8cTtK2Ua6MS1cKBpgYOlZ0ojYxZKd+OJ0DPhYTX8RJn5T2279+Nni+OSNKWF7pRC1PGRlU9c4ihGkMT4OWUC5aFNbmJac1tT6j3Hh0Rv8BcQdHvJ203YMyLF+UWvU6846973ZSrTauFNlNWXQq4VpCOQxrV0REli7Zu20B3T9jGM44jeshivT2hBUsH2aiFp7FTeARsUidrWKitAoB98Gt/HgvE96KykCWDVD24obOXfrtfOQJ0JA0ByvENdfoOmGSzS/kp7GEScGrcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbYsq7quzB2qUSuesnRxJPx+DUFtnQC2/gyxQpjnopc=;
 b=RLXkfQ+MjUzVzcoxvzqfUEY3ZLEBGoozG6WcFtQcUru8tcCnX7VppsfTt5kdmQUzj2TtBL0v9XTpYqyoAfr0xVMStnD4SOQ6BFQSH5uv2ebujb3G9ucmxb2IlGwrD4MOcIlEZWWyOT8MaxExs21OudPIQRsHUrG4MT+2tyU0pX1d5+NB/1eymoYxp8+CtJlY3EcgDz9XfFTJvo9V+4iTRAoVtSPsHS0dKUcVb5Uy+ji8Bp3gxiYVfa+tRY6RjKH8ui6qxOjdSZsx9Kfo3/MtWKYDhSACWTgeI/lsjGmKBW/Xy4GOSyaLi41ptc/VgSkDiXJ1n1UMSuFfFs7v8Vujdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by MW4PR11MB5935.namprd11.prod.outlook.com (2603:10b6:303:18a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 07:49:06 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::7d38:cbb6:a886:3b70]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::7d38:cbb6:a886:3b70%6]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 07:49:06 +0000
From: "Mali, Narpat" <Narpat.Mali@windriver.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>,
        "G Pillai, Hari"
	<Hari.GPillai@windriver.com>
Subject: RE: [OE-core][PATCH 1/2] ffmpeg: fix for CVE-2022-3964
Thread-Topic: [OE-core][PATCH 1/2] ffmpeg: fix for CVE-2022-3964
Thread-Index: AQHY/0bCD9b24jJoxEGRlqFmsbwm5a5UoLeAgADuF0g=
Date: Tue, 29 Nov 2022 07:49:06 +0000
Message-ID: 
 <DM4PR11MB5550E919066CC47698276611E4129@DM4PR11MB5550.namprd11.prod.outlook.com>
References: <20221123142022.136114-1-narpat.mali@windriver.com>
 <9B7572D4-F1B3-4A23-B280-FB7A99808E84@arm.com>
In-Reply-To: <9B7572D4-F1B3-4A23-B280-FB7A99808E84@arm.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5550:EE_|MW4PR11MB5935:EE_
x-ms-office365-filtering-correlation-id: 2c7dc480-82bc-49cf-86d1-08dad1de3155
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 EVLC/OHQ8I/b1EhKhSMOR86LjjywC32c9DIBZhs5qKN3yd7OTaxycI9Zlh4jRE5aW2RTat07lnbtTh3Jg7YT2OQL7JYDDGX9iAGRsgy1ViajbsVeSsAalvJLJC1x5Ua2FRhZzJcMOT8+3HutH/V1yVSffV5y0Fb2R6FMQMwGUaZT7yNoaj6mfZ0k9PXGtCxaFc0h8zSJEnwoqC1AN2ti0Z8jNiDY1NO+I0maEq95BPJkWl9luCId16YxtFeZHtzcJ253l+f6P1AeERC+DtQPI1f3/0ASGe6Xl4Vf0beYYJdPO1jlNl5UK90qmTlXOHv09YlnLBEMmgOh1E7r87WaTI2VVhZlyIuasHcteu8TCsqAAtr31YQuC6sSknphjURMKbmSNci1IIbNoo9IOi3vBRTorIKX+FLjz6xxwtJDN+QatnP+tUkYt+RRart/IPbpL0J4DyunGfbCKeodwEGH14zf9dFZdAwNi2LbkGGKOwVhHsU7hs3IrLXCLjlx9XuX1iEP4JYKvhtfK/mXJRXaJKs1QcLxzylvyEhh98sRKUqR9UiXUXHEBvJO6KNQlU9o45A1cijeB5BsP0RvL62TfAIsfF8n+UrQ/QHID/ibWd8tf4zMLgPGOvAqUTCmH12pvBFb6iV4KAUqD+efpLKBaWjRVAxDVUHqREL1aygnDdeQedz1cuNHY3ahuxSgj86QpUWOcubjJdOPTanbJ8lsUq9yXDpxx5DHSiWpqfa6eWvX65I+19FWnYvu68vpKeVF12Z3E0zeFftEb1GafvOy+6/lUmPK5r7jVEE8UZC0L/Y=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(376002)(136003)(346002)(396003)(366004)(451199015)(2906002)(66899015)(66946007)(41300700001)(4326008)(66476007)(6916009)(66556008)(54906003)(186003)(64756008)(8676002)(316002)(52536014)(8936002)(76116006)(91956017)(71200400001)(5660300002)(33656002)(9686003)(26005)(86362001)(966005)(107886003)(7696005)(66446008)(478600001)(53546011)(6506007)(83380400001)(18265965005)(38100700002)(122000001)(55016003)(166002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?6WmOpNYUXFhpqIElbFTZRP1zHzSaio3M14Zr2E4vpYQ50+wqgM5NwY1MLP/u?=
 =?us-ascii?Q?CxpBMXFBMzux5Am8B0Yn+JigNnd8PRC9TkgqbAaX1eAW9MXu5EH6hjk5xZL7?=
 =?us-ascii?Q?4PnSW5qMiiNminD3F/HJd80lkfMKmdXLX2Iq1t1BqUAp6RwHhRZKDnzpSnAH?=
 =?us-ascii?Q?vsFHiOwFLIpXfXA2TP2XQDtw31m8WZnrebl1I1U5+TVrTENgAV+OVtDTGQh9?=
 =?us-ascii?Q?ZWe+4QzdEXjh0JQ6fBtpzOhPdecFgvlXdC+pAokTkyMI98wBjasL60btRDnb?=
 =?us-ascii?Q?oBOaWNwTH4P21L83EOVQgT+o0md/PfFl4Neu3U1T9pXHiHiCX6N9OukNZyme?=
 =?us-ascii?Q?cNb8L/bvU3hhIL7vo1y9/3fZORAdW+4g6/TwXKqh9tF0a8jOpnp25NyzYqrz?=
 =?us-ascii?Q?mQ0/EYv/WVCa6arNxE1H76hVQHqlgXTPvYBSBG1TJrAMOUUk0fv8pndZLSpH?=
 =?us-ascii?Q?Hwi7NVY/rdvfjey6HK0EL14Ba9O398hK8Snbd7i3XzTO/6WVCR8mU7tPcKM6?=
 =?us-ascii?Q?7MBIUdFl1k85Upk0GLACgkKqDtP8Gd2mHPEZ80L2ThSXB06bt2VYQ4YLDfFT?=
 =?us-ascii?Q?baQ2ZL+FTEjyfZ5LpKPPXtYs+0NCylac1gIdC6ldtcsOSEOagEGG2/CPBOQo?=
 =?us-ascii?Q?Z/yIVNun6XWdSdriDTVPqfGHcMwXAVPVqWi0ML/fTcB0mD/6pH70I4a9MbJj?=
 =?us-ascii?Q?3W5jHJXAzF1J1QRBUBAbZI6e68TSOrDo0oY8qhOnxpJ3mYFDE1jpXVSFdL11?=
 =?us-ascii?Q?SqG7Qb8Zgu0SJy+5/3aSlxh718Tonbtt/MgXANjhyvtKOb+/mv1H8pvgEpSP?=
 =?us-ascii?Q?3184pfvL9ZzbZLDH7m0VKurZ/8s0GlUa5x1t47lXcrP/Wplzmx2+5p/MOJfQ?=
 =?us-ascii?Q?3mR3MFGYW8FTyjAn1/zBL9ABCj2tt93lv1r6t7IRcpTtHdi1/+K9MfebTbp3?=
 =?us-ascii?Q?DYL75pcYOuYbF6HXEB0I7GEnYi0W7bzpQIG+T+ZKwWPCg68mh/8Fh3iB+rVD?=
 =?us-ascii?Q?WzzJ7AyZuyRnz/i3KZVU5VmMf+a0evxeWH5bAzZRc1Q9aCxG7qDOHsAfGORw?=
 =?us-ascii?Q?b1iSeoVNYb8a70gJQlim56JpCK7p/sVzk/Lhfao9i/F0DgHL2E9b6JlubsR7?=
 =?us-ascii?Q?vjzB811Wdynigl7LkvHmAhjF7koZJHYVYRFqvRcDqPFP/ROX5ntiav419ui6?=
 =?us-ascii?Q?vmLmiIehV9KLyzCqjWHNkzsO3/2amPcnL6lsu93DSmsFyCNtVNQEEx3+oBnr?=
 =?us-ascii?Q?/YbaMJh0IMm0lM9poiDjVAHlXvCyigrbTLl1ukASUXqLAMCEgwymv5ho9YAm?=
 =?us-ascii?Q?CwMESbdox23Yb0n+6D6ozCyPaa0GX/YLdDqTvPyVhfBoR02izT8zGs8nQcYb?=
 =?us-ascii?Q?r8xA0P8etANcvDUYtQpSnukaJfQPbTLiODzRxgEdLcWkjrTWICS1kpk4Oz0A?=
 =?us-ascii?Q?K0BlylgO3csfg1OvtyjBfUnCwhD2pvvWn4WoK0rqZBlsq8gICD9Fn8lxYrNj?=
 =?us-ascii?Q?JOItVHD2NCJdBkM+6ThJFErU5nny+/q/pPEeMLKt8TBIxjrP+KFznNTV/orn?=
 =?us-ascii?Q?Ki3v1wPR7UwipDK0fD7OD8hQZ+FglogWofRCZedjyH9I7OFCHQEFc5rsa9pM?=
 =?us-ascii?Q?n6mAmO32eFacw90Bx1SxiXk=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB5550E919066CC47698276611E4129DM4PR11MB5550namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c7dc480-82bc-49cf-86d1-08dad1de3155
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 07:49:06.6511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OcaRce1PuHBjnMZqr23cTnNtOTtejF3NOvo3JxYZ8FF48WJ68oH1UNrb37v3M56QB6V28hWI6D1FQ7409pmJiToCFIqgii7PLhXHRIliv5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5935
X-Proofpoint-ORIG-GUID: bsQM95QCIG-j3pChU8FHkphpwvUe5UV2
X-Proofpoint-GUID: 4JyPj4RfI4QF9RA6aPFlPChW6PEd_V2T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_06,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 07:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173962

--_000_DM4PR11MB5550E919066CC47698276611E4129DM4PR11MB5550namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sure Ross, will make sure to add CVE tag in the patch header.

Do I need to send again this patch with CVE tag ?

Best Regards,
Narpat

________________________________
From: Ross Burton <Ross.Burton@arm.com>
Sent: Monday, November 28, 2022 11:04:15 PM
To: Mali, Narpat <Narpat.Mali@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Polampalli, Archana <Archana.Polampalli@windriver.com>; G Pil=
lai, Hari <Hari.GPillai@windriver.com>
Subject: Re: [OE-core][PATCH 1/2] ffmpeg: fix for CVE-2022-3964

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Can you put a CVE tag in the patch header alongside your Upstream-Status an=
d Signed-off-by?

We need this to track in an automated way that this patch deals with a spec=
ific CVE.

eg CVE: CVE-2022-3964

Ross

> On 23 Nov 2022, at 14:20, Narpat Mali via lists.openembedded.org <narpat.=
mali=3Dwindriver.com@lists.openembedded.org> wrote:
>
> A vulnerability classified as problematic has been found in ffmpeg. This =
affects an unknown part of the file
> libavcodec/rpzaenc.c of the component QuickTime RPZA Video Encoder. The m=
anipulation of the argument y_size
> leads to out-of-bounds read. It is possible to initiate the attack remote=
ly. The name of the patch is
> 92f9b28ed84a77138105475beba16c146bdaf984. It is recommended to apply a pa=
tch to fix this issue. The associated
> identifier of this vulnerability is VDB-213543.
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2022-3964
>
> Upstream Fix:
> https://github.com/FFmpeg/FFmpeg/commit/92f9b28ed84a77138105475beba16c146=
bdaf984
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
> ...c-stop-accessing-out-of-bounds-frame.patch | 89 +++++++++++++++++++
> .../recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb |  4 +-
> 2 files changed, 92 insertions(+), 1 deletion(-)
> create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpz=
aenc-stop-accessing-out-of-bounds-frame.patch
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-s=
top-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg/ff=
mpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
> new file mode 100644
> index 0000000000..2775a81cc8
> --- /dev/null
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-acc=
essing-out-of-bounds-frame.patch
> @@ -0,0 +1,89 @@
> +From 92f9b28ed84a77138105475beba16c146bdaf984 Mon Sep 17 00:00:00 2001
> +From: Paul B Mahol <onemda@gmail.com>
> +Date: Sat, 12 Nov 2022 16:12:00 +0100
> +Subject: [PATCH] avcodec/rpzaenc: stop accessing out of bounds frame
> +
> +Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/92f9b=
28ed84a77138105475beba16c146bdaf984]
> +
> +Signed-off-by: <narpat.mali@windriver.com>
> +
> +---
> + libavcodec/rpzaenc.c | 22 +++++++++++++++-------
> + 1 file changed, 15 insertions(+), 7 deletions(-)
> +
> +diff --git a/libavcodec/rpzaenc.c b/libavcodec/rpzaenc.c
> +index d710eb4f82..4ced9523e2 100644
> +--- a/libavcodec/rpzaenc.c
> ++++ b/libavcodec/rpzaenc.c
> +@@ -205,7 +205,7 @@ static void get_max_component_diff(const BlockInfo *=
bi, const uint16_t *block_pt
> +
> +     // loop thru and compare pixels
> +     for (y =3D 0; y < bi->block_height; y++) {
> +-        for (x =3D 0; x < bi->block_width; x++){
> ++        for (x =3D 0; x < bi->block_width; x++) {
> +             // TODO:  optimize
> +             min_r =3D FFMIN(R(block_ptr[x]), min_r);
> +             min_g =3D FFMIN(G(block_ptr[x]), min_g);
> +@@ -278,7 +278,7 @@ static int leastsquares(const uint16_t *block_ptr, c=
onst BlockInfo *bi,
> +         return -1;
> +
> +     for (i =3D 0; i < bi->block_height; i++) {
> +-        for (j =3D 0; j < bi->block_width; j++){
> ++        for (j =3D 0; j < bi->block_width; j++) {
> +             x =3D GET_CHAN(block_ptr[j], xchannel);
> +             y =3D GET_CHAN(block_ptr[j], ychannel);
> +             sumx +=3D x;
> +@@ -325,7 +325,7 @@ static int calc_lsq_max_fit_error(const uint16_t *bl=
ock_ptr, const BlockInfo *bi
> +     int max_err =3D 0;
> +
> +     for (i =3D 0; i < bi->block_height; i++) {
> +-        for (j =3D 0; j < bi->block_width; j++){
> ++        for (j =3D 0; j < bi->block_width; j++) {
> +             int x_inc, lin_y, lin_x;
> +             x =3D GET_CHAN(block_ptr[j], xchannel);
> +             y =3D GET_CHAN(block_ptr[j], ychannel);
> +@@ -420,7 +420,9 @@ static void update_block_in_prev_frame(const uint16_=
t *src_pixels,
> +                                        uint16_t *dest_pixels,
> +                                        const BlockInfo *bi, int block_c=
ounter)
> + {
> +-    for (int y =3D 0; y < 4; y++) {
> ++    const int y_size =3D FFMIN(4, bi->image_height - bi->row * 4);
> ++
> ++    for (int y =3D 0; y < y_size; y++) {
> +         memcpy(dest_pixels, src_pixels, 8);
> +         dest_pixels +=3D bi->rowstride;
> +         src_pixels +=3D bi->rowstride;
> +@@ -730,14 +732,15 @@ post_skip :
> +
> +             if (err > s->sixteen_color_thresh) { // DO SIXTEEN COLOR BL=
OCK
> +                 uint16_t *row_ptr;
> +-                int rgb555;
> ++                int y_size, rgb555;
> +
> +                 block_offset =3D get_block_info(&bi, block_counter);
> +
> +                 row_ptr =3D &src_pixels[block_offset];
> ++                y_size =3D FFMIN(4, bi.image_height - bi.row * 4);
> +
> +-                for (int y =3D 0; y < 4; y++) {
> +-                    for (int x =3D 0; x < 4; x++){
> ++                for (int y =3D 0; y < y_size; y++) {
> ++                    for (int x =3D 0; x < 4; x++) {
> +                         rgb555 =3D row_ptr[x] & ~0x8000;
> +
> +                         put_bits(&s->pb, 16, rgb555);
> +@@ -745,6 +748,11 @@ post_skip :
> +                     row_ptr +=3D bi.rowstride;
> +                 }
> +
> ++                for (int y =3D y_size; y < 4; y++) {
> ++                    for (int x =3D 0; x < 4; x++)
> ++                        put_bits(&s->pb, 16, 0);
> ++                }
> ++
> +                 block_counter++;
> +             } else { // FOUR COLOR BLOCK
> +                 block_counter +=3D encode_four_color_block(min_color, m=
ax_color,
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_5.1.2.bb
> index a0c98d4ae0..43b858984b 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
> @@ -22,7 +22,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING.GPLv2;md5=3Db234ee=
4d69f5fce4486a80fdaf4a4263 \
>                     file://COPYING.LGPLv2.1;md5=3Dbd7a443320af8c812e4c18d=
1b79df004 \
>                     file://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d983680=
233ad02"
>
> -SRC_URI =3D "https://www.ffmpeg.org/releases/${BP}.tar.xz"
> +SRC_URI =3D "https://www.ffmpeg.org/releases/${BP}.tar.xz \
> +           file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-fram=
e.patch"
> +
> SRC_URI[sha256sum] =3D "619e706d662c8420859832ddc259cd4d4096a48a2ce1eefd0=
52db9e440eef3dc"
>
> # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/sh=
ow_bug.cgi?id=3D7717
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173715): https://lists.openembedded.org/g/openembedde=
d-core/message/173715
> Mute This Topic: https://lists.openembedded.org/mt/95218376/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--_000_DM4PR11MB5550E919066CC47698276611E4129DM4PR11MB5550namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Sure Ross, will make sure to add CVE tag in the patc=
h header.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Do I need to send again this patch with CVE tag ?</p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Narpat<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ross Burton &lt;Ross.=
Burton@arm.com&gt;<br>
<b>Sent:</b> Monday, November 28, 2022 11:04:15 PM<br>
<b>To:</b> Mali, Narpat &lt;Narpat.Mali@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; Polampalli, Archana &lt;Archana.Polampalli@windr=
iver.com&gt;; G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;<br>
<b>Subject:</b> Re: [OE-core][PATCH 1/2] ffmpeg: fix for CVE-2022-3964</fon=
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
Can you put a CVE tag in the patch header alongside your Upstream-Status an=
d Signed-off-by?<br>
<br>
We need this to track in an automated way that this patch deals with a spec=
ific CVE.<br>
<br>
eg CVE: CVE-2022-3964<br>
<br>
Ross<br>
<br>
&gt; On 23 Nov 2022, at 14:20, Narpat Mali via lists.openembedded.org &lt;n=
arpat.mali=3Dwindriver.com@lists.openembedded.org&gt; wrote:<br>
&gt;<br>
&gt; A vulnerability classified as problematic has been found in ffmpeg. Th=
is affects an unknown part of the file<br>
&gt; libavcodec/rpzaenc.c of the component QuickTime RPZA Video Encoder. Th=
e manipulation of the argument y_size<br>
&gt; leads to out-of-bounds read. It is possible to initiate the attack rem=
otely. The name of the patch is<br>
&gt; 92f9b28ed84a77138105475beba16c146bdaf984. It is recommended to apply a=
 patch to fix this issue. The associated<br>
&gt; identifier of this vulnerability is VDB-213543.<br>
&gt;<br>
&gt; Reference:<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-3964">https://nvd=
.nist.gov/vuln/detail/CVE-2022-3964</a><br>
&gt;<br>
&gt; Upstream Fix:<br>
&gt; <a href=3D"https://github.com/FFmpeg/FFmpeg/commit/92f9b28ed84a7713810=
5475beba16c146bdaf984">
https://github.com/FFmpeg/FFmpeg/commit/92f9b28ed84a77138105475beba16c146bd=
af984</a><br>
&gt;<br>
&gt; Signed-off-by: Narpat Mali &lt;narpat.mali@windriver.com&gt;<br>
&gt; ---<br>
&gt; ...c-stop-accessing-out-of-bounds-frame.patch | 89 +++++++++++++++++++=
<br>
&gt; .../recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb |&nbsp; 4 +-<br>
&gt; 2 files changed, 92 insertions(+), 1 deletion(-)<br>
&gt; create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-=
rpzaenc-stop-accessing-out-of-bounds-frame.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaen=
c-stop-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg=
/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..2775a81cc8<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-=
accessing-out-of-bounds-frame.patch<br>
&gt; @@ -0,0 +1,89 @@<br>
&gt; +From 92f9b28ed84a77138105475beba16c146bdaf984 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Paul B Mahol &lt;onemda@gmail.com&gt;<br>
&gt; +Date: Sat, 12 Nov 2022 16:12:00 +0100<br>
&gt; +Subject: [PATCH] avcodec/rpzaenc: stop accessing out of bounds frame<=
br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/FFmpeg/FFmpe=
g/commit/92f9b28ed84a77138105475beba16c146bdaf984">https://github.com/FFmpe=
g/FFmpeg/commit/92f9b28ed84a77138105475beba16c146bdaf984</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: &lt;narpat.mali@windriver.com&gt;<br>
&gt; +<br>
&gt; +---<br>
&gt; + libavcodec/rpzaenc.c | 22 +++++++++++++++-------<br>
&gt; + 1 file changed, 15 insertions(+), 7 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/libavcodec/rpzaenc.c b/libavcodec/rpzaenc.c<br>
&gt; +index d710eb4f82..4ced9523e2 100644<br>
&gt; +--- a/libavcodec/rpzaenc.c<br>
&gt; ++++ b/libavcodec/rpzaenc.c<br>
&gt; +@@ -205,7 +205,7 @@ static void get_max_component_diff(const BlockInf=
o *bi, const uint16_t *block_pt<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; // loop thru and compare pixels<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (y =3D 0; y &lt; bi-&gt;block_height; y+=
+) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (x =3D 0; x &lt; bi-&=
gt;block_width; x++){<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (x =3D 0; x &lt; bi-&=
gt;block_width; x++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; // TODO:&nbsp; optimize<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; min_r =3D FFMIN(R(block_ptr[x]), min_r);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; min_g =3D FFMIN(G(block_ptr[x]), min_g);<br>
&gt; +@@ -278,7 +278,7 @@ static int leastsquares(const uint16_t *block_ptr=
, const BlockInfo *bi,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; bi-&gt;block_height; i+=
+) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (j =3D 0; j &lt; bi-&=
gt;block_width; j++){<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (j =3D 0; j &lt; bi-&=
gt;block_width; j++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; x =3D GET_CHAN(block_ptr[j], xchannel);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; y =3D GET_CHAN(block_ptr[j], ychannel);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; sumx +=3D x;<br>
&gt; +@@ -325,7 +325,7 @@ static int calc_lsq_max_fit_error(const uint16_t =
*block_ptr, const BlockInfo *bi<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int max_err =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; bi-&gt;block_height; i+=
+) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (j =3D 0; j &lt; bi-&=
gt;block_width; j++){<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (j =3D 0; j &lt; bi-&=
gt;block_width; j++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; int x_inc, lin_y, lin_x;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; x =3D GET_CHAN(block_ptr[j], xchannel);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; y =3D GET_CHAN(block_ptr[j], ychannel);<br>
&gt; +@@ -420,7 +420,9 @@ static void update_block_in_prev_frame(const uint=
16_t *src_pixels,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; uint16_t *dest_pixels,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; const BlockInfo *bi, int block_counter)<br>
&gt; + {<br>
&gt; +-&nbsp;&nbsp;&nbsp; for (int y =3D 0; y &lt; 4; y++) {<br>
&gt; ++&nbsp;&nbsp;&nbsp; const int y_size =3D FFMIN(4, bi-&gt;image_height=
 - bi-&gt;row * 4);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; for (int y =3D 0; y &lt; y_size; y++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(dest_pixels, =
src_pixels, 8);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dest_pixels +=3D bi-=
&gt;rowstride;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; src_pixels +=3D bi-&=
gt;rowstride;<br>
&gt; +@@ -730,14 +732,15 @@ post_skip :<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (err &gt; s-&gt;sixteen_color_thresh) { // DO SIXTEEN COLOR BLOCK<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; uint16_t *row_ptr;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; int rgb555;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; int y_size, rgb555;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; block_offset =3D get_block_info(&amp;bi, block_=
counter);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; row_ptr =3D &amp;src_pixels[block_offset];<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; y_size =3D FFMIN(4, bi.image_height - bi.row * 4);<b=
r>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; for (int y =3D 0; y &lt; 4; y++) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int x =3D 0; x &lt; 4; =
x++){<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; for (int y =3D 0; y &lt; y_size; y++) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int x =3D 0; x &lt; 4; =
x++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 rgb555 =3D row_ptr[x] &amp; ~0x8000;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 put_bits(&amp;s-&gt;pb, 16, rgb555);<br>
&gt; +@@ -745,6 +748,11 @@ post_skip :<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; row_ptr +=3D bi.rowstri=
de;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; for (int y =3D y_size; y &lt; 4; y++) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int x =3D 0; x &lt; 4; =
x++)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; put_=
bits(&amp;s-&gt;pb, 16, 0);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; block_counter++;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; } else { // FOUR COLOR BLOCK<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; block_counter +=3D encode_four_color_block(min_=
color, max_color,<br>
&gt; +--<br>
&gt; +2.34.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb b/meta/rec=
ipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb<br>
&gt; index a0c98d4ae0..43b858984b 100644<br>
&gt; --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb<br>
&gt; +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb<br>
&gt; @@ -22,7 +22,9 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://C=
OPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://COPYING=
.LGPLv2.1;md5=3Dbd7a443320af8c812e4c18d1b79df004">
file://COPYING.LGPLv2.1;md5=3Dbd7a443320af8c812e4c18d1b79df004</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://COPYING=
.LGPLv3;md5=3De6a600fd5e1d9cbde2d983680233ad02&quot;">
file://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d983680233ad02&quot;</a><br>
&gt;<br>
&gt; -SRC_URI =3D &quot;<a href=3D"https://www.ffmpeg.org/releases/${BP}.ta=
r.xz">https://www.ffmpeg.org/releases/${BP}.tar.xz</a>&quot;<br>
&gt; +SRC_URI =3D &quot;<a href=3D""></a>https://www.ffmpeg.org/releases/${=
BP}.tar.xz \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch&qu=
ot;">
file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch&quot;<=
/a><br>
&gt; +<br>
&gt; SRC_URI[sha256sum] =3D &quot;619e706d662c8420859832ddc259cd4d4096a48a2=
ce1eefd052db9e440eef3dc&quot;<br>
&gt;<br>
&gt; # Build fails when thumb is enabled: <a href=3D"https://bugzilla.yocto=
project.org/show_bug.cgi?id=3D7717">
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7717</a><br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#173715): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/173715">
https://lists.openembedded.org/g/openembedded-core/message/173715</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95218376=
/6875888">https://lists.openembedded.org/mt/95218376/6875888</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [ross.burton@a=
rm.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM4PR11MB5550E919066CC47698276611E4129DM4PR11MB5550namp_--

