Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93DC2C77B61
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 08:48:40 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.46349.1682326115532777681
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 01:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHPmbmCO/jQn+ipfMLPWgyt2Xie9Fb1DUsiGlGrg/+UBbfHGcCIpvxUYI9oy1cD06tvi3knD/AZEL5bXUZ+CoJzNQ9SWw1Z0DDILO7yaUi0R7trLjN/D7zH0szNXw8Azq16iAfBoQVzvS1Rof5UFwgqGH0nTkhLX78n0Vdm4ARWXy+5DPWSeYpS2781hDVuwAGmcrzAG4Vpx/lwJv41YxirN39NTdKZpXNq3Zuqzqc2RkwK6JSG91xtN448k22BIAyuEdilkEYn6SwfckaKak1kXQxs2PFuMOpMBlS9cxnlEBgSoA6PJXqCvR6ip2e6rxrYPwFHI2fyoddUBl6KitQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDsU6A4EJEd668YgjzVbqjb0jA0HkWSWy2RUJfSHhhQ=;
 b=nlYUK6PS+w/rTT3PlSmnYHbThadKR/XJqc8lp6H1vd0B34DhI2zMQbSc2taO735UdVUFlKRDjn/3V+zaA5Y5URGYVhhzeuj53YgCXUKnlKhuUfBwcpL6QzTrdE06iJ/Mkz+lJKbpJK+9+18lBVGXQiN/uu1I9kfoLYVcz+psA5QjGhoH/AHx0tyCtQ5JE+VED0uQH7+Y507tMiMf0RQ9ziQUjazaUllV+R5trYE47bsLJsXz0lRR+G/6wETrSACiDCTlQ59OSy2jQZluO3SHat9KjMKPqd6xdxDEAYH098LsHbpfXONikrSezFTTYNjKvdu9BNXmZws77tbHSsmocA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=2n.com; dmarc=pass action=none header.from=2n.com; dkim=pass
 header.d=2n.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDsU6A4EJEd668YgjzVbqjb0jA0HkWSWy2RUJfSHhhQ=;
 b=Qom5n1D5xjaC/T4MBiqA327AwO/FCi0noDl2Z/NBaua87UqjZN6DsZSp4TRGL2Yeikk8WgC81X/Yh23PO/IqHKTk1nbjp/zNJhE0wjkJxbZeD4qbg0J3snRx5rzRpxG78p2bTOSTsoL9nC8Qfqm1u/sHBLQ9RLkkBwFXmdc/+kc=
From: =?iso-8859-2?Q?Petr_Kubiz=F2=E1k_-_2N?= <Kubiznak@2n.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v3] devicetree.bbclass: Allow selection of dts
 files to build
Thread-Topic: [OE-core][PATCH v3] devicetree.bbclass: Allow selection of dts
 files to build
Thread-Index: AQHZdGVkBFd0mGlDoEyhyvVXubTn/a835LyAgAIzArg=
Date: Mon, 24 Apr 2023 08:48:24 +0000
Message-ID: <DB4PR02MB10030466D2D61356D80758E22E2679@DB4PR02MB10030.eurprd02.prod.outlook.com>
References: <20230421152325.3327461-1-kubiznak@2n.com>
 <20230422220701.GD9226@denix.org>
In-Reply-To: <20230422220701.GD9226@denix.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=2n.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR02MB10030:EE_|AS8PR02MB6551:EE_
x-ms-office365-filtering-correlation-id: aa53dc23-129e-4c5a-67ef-08db44a0aa32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c4wXrS6CZbAZNajQgJnJEM7lgHN2UlMMCJFOJa8qoPth6XhW6Vh0cxrOJL/GGEc7Ab8OYaYh1Jq58GMF/vOJWAtRZvu1HaAahEMBGh9D3u1d6+6jHJZ+61IxRxUPvVo/oHJEBs6g5az0MzaF6BjZK5VF7ARgSluanCBVy8qLYkOxWyP+PCzUpH11nFwWfHa2dUAAG/IB1zxg19TO3CvOY+4UZ5XyPDmpwFm03q+NZr4WXH+5gKJ5gd0Q/XTaIfFy+nWkHH90A5Hh17URFOKaRz0baI7/isOddK7ZvqqAMIS+ps6xRd/2jMlSAuZKk0NQTXyPmsAz33nec7wZD/WZm/0Hc9N/oMMgdBCBjlxZWGQJfcnN5JgqJ73fXaCm5PJZmXZPokv61NaHRlTKRmXvVPXdvKKHKBzhJKjtfvy0Fqg97EwIckrKkaNHFsUafAwrhm0a5ZaAQfGXk/dgrjTLC60lFdJLNybIW+xnVzxqul8PJsbPpcetfQ3ksnzQdzjtP/UZx/p1WyB6cJEk5jkjn7qw62YZP0Vfl0ELCumn0PVHwfpUu+hVKymRx6kItbC4la3LjUnjo4/uVo56oYxHj/Kn9jnrZ406tSy+I9fDIPFLZc7GBVTtn1ushgZRQHlp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR02MB10030.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(478600001)(86362001)(186003)(53546011)(7696005)(26005)(9686003)(6506007)(55016003)(33656002)(71200400001)(4326008)(6916009)(64756008)(66446008)(66476007)(66556008)(316002)(83380400001)(91956017)(66946007)(76116006)(2906002)(38100700002)(19627405001)(122000001)(41300700001)(8676002)(8936002)(38070700005)(5660300002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?XHNs7GfGlHgpCEgVx7i2lv6oiBkNhCxf3VYqnZyBbL9XWF3mu+6CiEkokV?=
 =?iso-8859-2?Q?vSHjs3cwQ5lfuic+wlswD0xKo4HJC2i/AqhOjgJrQe1A7YpaZyauAnm6Ri?=
 =?iso-8859-2?Q?cSPBUYZhlSt2vaqisa3+RWgAB27l7gDAO+JFvrhobJRmVHoGEGPJr4sGzM?=
 =?iso-8859-2?Q?us+USwL6rWODXY1BKgHkoTFPhBo7cBPXrvEJ1yseHcv/t9Gk+e2T8OwwEq?=
 =?iso-8859-2?Q?yxrHSwv/S5g+OISiSKSmxouT4G52POAMG6oh0J3nk8HA+3k5rjNxePPl/z?=
 =?iso-8859-2?Q?uBeoyIprS8HGz6SZjSbNo0e70ZI3+gQD8VxrvOIEIcJfMgkBUGvkBWxnZ3?=
 =?iso-8859-2?Q?HdEpme3evw+qzQNvn5spgx+rEnY5vtIB7MRt10hwzE7jTOZvdAMyY80sOB?=
 =?iso-8859-2?Q?rpNTJbEO1Qo6wa1vBmHjHlQWenrnriWa/36DD8xFRILDWxKoVyz9WFCm9J?=
 =?iso-8859-2?Q?SGDwX0vCjjLIXoU5tFOkmH1oYDrxpuZxijjFYnbU5QTLZF1sOU5QMltVAC?=
 =?iso-8859-2?Q?WwT7BmQ7H0bdR5pKj+o+Hz8++fC52CJtB7A1+L7Zwnx8CGNss68xuQMB5A?=
 =?iso-8859-2?Q?tATYAzN8zYxn2Pq/yAA1hno3FrXdA8CLg/F1NPwFtlj15B3iBA38WSOmhh?=
 =?iso-8859-2?Q?NSuvQ8UVd6s74jhomAa+IeNPQnTwJXgwHuOOPgTE3a+Gq1OEnu+y4QwXT3?=
 =?iso-8859-2?Q?vkyogCoqqZR70S+HpIQX8HnuV/tKfoCgm4vYlE5SMVaJh3l++h44wMQ6bd?=
 =?iso-8859-2?Q?biIVj0EcPgMD7Ry19oq6WYuJGJOO+fSp4XCFn4dLbAS558TIYUbeQBzmo7?=
 =?iso-8859-2?Q?7K23kK/HJPa66PlEyWqylmmfOk4FpMbn5B/yV35BndwW5CmBWzPYJ5yTjK?=
 =?iso-8859-2?Q?v6bLuL8i6yTsJuQ16ekydL83lRSOOh6Az3BW92iXq4JVG8fUR/gp9F4X5s?=
 =?iso-8859-2?Q?gfN6vKqq4nfcGS1036bnB9tBqOQnO8DyXOW8+t8x+iGYpCg85OmVrLS5cp?=
 =?iso-8859-2?Q?G6Ez/EjMZN2riLu8D/Hg5bD6H4VxK5/jtQGejS+HuwCWE1/JAAfquvcu5X?=
 =?iso-8859-2?Q?psBiTTSU2P8zV2kqjfsL2giQFarshgXsToVW6+8B8B8IRENXdNl2Y8xWcF?=
 =?iso-8859-2?Q?AW3jYjZx24th8ALGZFxETSuw7leJckj4XlITrOStGrmPQNXqan77xNAKjE?=
 =?iso-8859-2?Q?f9fnBHtPbXyIiUKu1WY2NQ3yXf2Pi2dzN0jndTKSoHfEy8kVwEx+vNH+PR?=
 =?iso-8859-2?Q?YFqzz/2Kk2haN3xTjKIxbOvkx4b0ngyQFh6AkTIupCVNntxN//r/sJ8Me2?=
 =?iso-8859-2?Q?YECdDbHb1LwJphLRGNcq6jsJCAe0RTga78qKpi+Dp4oLBBl4Xp2PA5dZOp?=
 =?iso-8859-2?Q?QUB9puPVcELe1l8HvLrAd0Imyd7SgoP+SWs1/ohYFIA3fq/fqosuv0XoYg?=
 =?iso-8859-2?Q?aQPCAS+h8mFWufIJmUvDJ5/BAnjd4QdtuzNiDqXM9W9mwf0lsoz2RUH+pE?=
 =?iso-8859-2?Q?tgs9CSx1+Fi8siJHu78+gzk3JnTW/UR3EbOkyQvLXiA0yrAQ79yP8vvPu+?=
 =?iso-8859-2?Q?ebD80P0c4hp+uPo1OBMfD/Gg9PurpNmh3iU2qWdZdcdcdaoOYAnZ1GPPLJ?=
 =?iso-8859-2?Q?mTkwWbyDP06kY=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DB4PR02MB10030466D2D61356D80758E22E2679DB4PR02MB10030eu_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR02MB10030.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa53dc23-129e-4c5a-67ef-08db44a0aa32
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 08:48:24.3620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p35JCDfLOXOFva1iyGpeFy7rFjbzyRiwX6oyDeChTwPDbv/87Ui/CuXmH7W1Ri76
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6551
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 08:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180344

--_000_DB4PR02MB10030466D2D61356D80758E22E2679DB4PR02MB10030eu_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

> Any examples of this being used? Not really clear from the description wh=
at's
> this really used for...

I'm not sure what is unclear to you - just the commit message, or the patch=
 itself?

An example could be beaglebone-yocto.conf. If someone decides to move the d=
evice tree files from kernel to a standalone repository, then it is enough =
(e.g.) to rename KERNEL_DEVICETREE to EXTERNAL_DEVICETREE in the machine co=
nf, and make an assignment DT_FILES =3D "${EXTERNAL_DEVICETREE}" in the dev=
icetree recipe.

So how about to replace the unclear sentence by:
To make DT_FILES consistent with KERNEL_DEVICETREE, the list works with bot=
h dts and dtb files.

Would that make more sense to you? Or do you think the example should be pa=
rt of that commit message, too?

Cheers,
Petr

________________________________________
From: Denys Dmytriyenko <denis@denix.org>
Sent: Sunday, April 23, 2023 12:07 AM
To: Petr Kubiz=F2=E1k - 2N
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v3] devicetree.bbclass: Allow selection of dts=
 files to build

On Fri, Apr 21, 2023 at 05:23:25PM +0200, Petr Kubiz=F2=E1k wrote:
> Add DT_FILES variable to allow the user of the class to select specific
> dts files to build. This is useful for packages featuring dts files
> for multiple machines.
>
> Since many machine configs contain a list of dtb files
> (e.g. KERNEL_DEVICETREE), DT_FILES works with both dts and dtb files.

Any examples of this being used? Not really clear from the description what=
's
this really used for...


> Signed-off-by: Petr Kubiz=F2=E1k <kubiznak@2n.com>
> ---
>  meta/classes-recipe/devicetree.bbclass | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe=
/devicetree.bbclass
> index ed2a92e447..bd50d7fa1d 100644
> --- a/meta/classes-recipe/devicetree.bbclass
> +++ b/meta/classes-recipe/devicetree.bbclass
> @@ -53,8 +53,10 @@ KERNEL_INCLUDE ??=3D " \
>
>  DT_INCLUDE[doc] =3D "Search paths to be made available to both the devic=
e tree compiler and preprocessor for inclusion."
>  DT_INCLUDE ?=3D "${DT_FILES_PATH} ${KERNEL_INCLUDE}"
> -DT_FILES_PATH[doc] =3D "Defaults to source directory, can be used to sel=
ect dts files that are not in source (e.g. generated)."
> +DT_FILES_PATH[doc] =3D "Path to the directory containing dts files to bu=
ild. Defaults to source directory."
>  DT_FILES_PATH ?=3D "${S}"
> +DT_FILES[doc] =3D "Space-separated list of dts or dtb files (relative to=
 DT_FILES_PATH) to build. If empty, all dts files are built."
> +DT_FILES ?=3D ""
>
>  DT_PADDING_SIZE[doc] =3D "Size of padding on the device tree blob, used =
as extra space typically for additional properties during boot."
>  DT_PADDING_SIZE ??=3D "0x3000"
> @@ -125,9 +127,12 @@ def devicetree_compile(dtspath, includes, d):
>      subprocess.run(dtcargs, check =3D True, stdout=3Dsubprocess.PIPE, st=
derr=3Dsubprocess.STDOUT)
>
>  python devicetree_do_compile() {
> +    import re
>      includes =3D expand_includes("DT_INCLUDE", d)
> +    dtfiles =3D d.getVar("DT_FILES").split()
> +    dtfiles =3D [ re.sub(r"\.dtbo?$", ".dts", dtfile) for dtfile in dtfi=
les ]
>      listpath =3D d.getVar("DT_FILES_PATH")
> -    for dts in os.listdir(listpath):
> +    for dts in dtfiles or os.listdir(listpath):
>          dtspath =3D os.path.join(listpath, dts)
>          try:
>              if not(os.path.isfile(dtspath)) or not(dts.endswith(".dts") =
or devicetree_source_is_overlay(dtspath)):
> --
> 2.30.2

--_000_DB4PR02MB10030466D2D61356D80758E22E2679DB4PR02MB10030eu_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<font size=3D"2"><span style=3D"font-size:11pt">
<div class=3D"PlainText">Hi Denys,<br>
</div>
<div class=3D"PlainText elementToProof"><br>
&gt; Any examples of this being used? Not really clear from the description=
 what's<br>
&gt; this really used for...<br>
<br>
I'm not sure what is unclear to you - just the commit message, or the patch=
 itself?<br>
<br>
An example could be beaglebone-yocto.conf. If someone decides to move the d=
evice tree files from kernel to a standalone repository, then it is enough =
(e.g.) to rename KERNEL_DEVICETREE to EXTERNAL_DEVICETREE in the machine co=
nf, and make an assignment DT_FILES
 =3D &quot;${EXTERNAL_DEVICETREE}&quot; in the devicetree recipe.<br>
<br>
So how about to replace the unclear sentence by:<br>
To make DT_FILES consistent with KERNEL_DEVICETREE, the list works with bot=
h dts and dtb files.</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">Would that make more sense to you? =
Or do you think the example should be part of that commit message, too?</di=
v>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">Cheers,</div>
<div class=3D"PlainText elementToProof">Petr<br>
<br>
________________________________________<br>
From: Denys Dmytriyenko &lt;denis@denix.org&gt;<br>
Sent: Sunday, April 23, 2023 12:07 AM<br>
To: Petr Kubiz=F2=E1k - 2N<br>
Cc: openembedded-core@lists.openembedded.org<br>
Subject: Re: [OE-core][PATCH v3] devicetree.bbclass: Allow selection of dts=
 files to build<br>
<br>
On Fri, Apr 21, 2023 at 05:23:25PM +0200, Petr Kubiz=F2=E1k wrote:<br>
&gt; Add DT_FILES variable to allow the user of the class to select specifi=
c<br>
&gt; dts files to build. This is useful for packages featuring dts files<br=
>
&gt; for multiple machines.<br>
&gt;<br>
&gt; Since many machine configs contain a list of dtb files<br>
&gt; (e.g. KERNEL_DEVICETREE), DT_FILES works with both dts and dtb files.<=
br>
<br>
Any examples of this being used? Not really clear from the description what=
's<br>
this really used for...<br>
<br>
<br>
&gt; Signed-off-by: Petr Kubiz=F2=E1k &lt;kubiznak@2n.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/classes-recipe/devicetree.bbclass | 9 +++++++--<br>
&gt;&nbsp; 1 file changed, 7 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-rec=
ipe/devicetree.bbclass<br>
&gt; index ed2a92e447..bd50d7fa1d 100644<br>
&gt; --- a/meta/classes-recipe/devicetree.bbclass<br>
&gt; +++ b/meta/classes-recipe/devicetree.bbclass<br>
&gt; @@ -53,8 +53,10 @@ KERNEL_INCLUDE ??=3D &quot; \<br>
&gt;<br>
&gt;&nbsp; DT_INCLUDE[doc] =3D &quot;Search paths to be made available to b=
oth the device tree compiler and preprocessor for inclusion.&quot;<br>
&gt;&nbsp; DT_INCLUDE ?=3D &quot;${DT_FILES_PATH} ${KERNEL_INCLUDE}&quot;<b=
r>
&gt; -DT_FILES_PATH[doc] =3D &quot;Defaults to source directory, can be use=
d to select dts files that are not in source (e.g. generated).&quot;<br>
&gt; +DT_FILES_PATH[doc] =3D &quot;Path to the directory containing dts fil=
es to build. Defaults to source directory.&quot;<br>
&gt;&nbsp; DT_FILES_PATH ?=3D &quot;${S}&quot;<br>
&gt; +DT_FILES[doc] =3D &quot;Space-separated list of dts or dtb files (rel=
ative to DT_FILES_PATH) to build. If empty, all dts files are built.&quot;<=
br>
&gt; +DT_FILES ?=3D &quot;&quot;<br>
&gt;<br>
&gt;&nbsp; DT_PADDING_SIZE[doc] =3D &quot;Size of padding on the device tre=
e blob, used as extra space typically for additional properties during boot=
.&quot;<br>
&gt;&nbsp; DT_PADDING_SIZE ??=3D &quot;0x3000&quot;<br>
&gt; @@ -125,9 +127,12 @@ def devicetree_compile(dtspath, includes, d):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; subprocess.run(dtcargs, check =3D True, =
stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.STDOUT)<br>
&gt;<br>
&gt;&nbsp; python devicetree_do_compile() {<br>
&gt; +&nbsp;&nbsp;&nbsp; import re<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; includes =3D expand_includes(&quot;DT_IN=
CLUDE&quot;, d)<br>
&gt; +&nbsp;&nbsp;&nbsp; dtfiles =3D d.getVar(&quot;DT_FILES&quot;).split()=
<br>
&gt; +&nbsp;&nbsp;&nbsp; dtfiles =3D [ re.sub(r&quot;\.dtbo?$&quot;, &quot;=
.dts&quot;, dtfile) for dtfile in dtfiles ]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; listpath =3D d.getVar(&quot;DT_FILES_PAT=
H&quot;)<br>
&gt; -&nbsp;&nbsp;&nbsp; for dts in os.listdir(listpath):<br>
&gt; +&nbsp;&nbsp;&nbsp; for dts in dtfiles or os.listdir(listpath):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dtspath =3D os.p=
ath.join(listpath, dts)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if not(os.path.isfile(dtspath)) or not(dts.endswith(&quot;.dts&quot=
;) or devicetree_source_is_overlay(dtspath)):<br>
&gt; --<br>
&gt; 2.30.2<br>
</div>
</span></font>
</body>
</html>

--_000_DB4PR02MB10030466D2D61356D80758E22E2679DB4PR02MB10030eu_--

