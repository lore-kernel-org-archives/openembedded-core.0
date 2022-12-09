Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDEFDC4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 04:10:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4400.1670559035304052427
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 20:10:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qHIKam5T;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9342dfa444=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B93pMek005989
	for <openembedded-core@lists.openembedded.org>; Fri, 9 Dec 2022 04:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=jUPhyinWy1hmjlgFbFO4nk37jS8a67kbRApimYAzb48=;
 b=qHIKam5TLko9SeArDe/v9G1Uu+hmNTV9Dfiak5j6A+hrqb7LNbRo+ZFJdaIZomt8MyRT
 kAM3ZoJvQ2kXILabwHHPAYAopWtSLqTp/XKn2kXLq0nZqU6RttT/n9pa771UWZPNrb6e
 zvWHCcrIeXXmICd/fvRW9Ef++bxfvGojzfmejREwxT8M7UlbeSVh4FwC3TZwOjJ5e7Ke
 5HXioeAo3QgUVSe29zmTTfhgtcKuV8zQ8cqbFE2zapGWE9eAGAQ4+shqHBT3LLkVQ/6O
 DtkGiwOaXUP4zuK124FPBmxvesitVW8C5y8NAYWhC0f2LOtuxl9OxfURPKCb/NuDroY7 3g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m7up0d5a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 04:10:34 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B94AX4d009477
	for <openembedded-core@lists.openembedded.org>; Fri, 9 Dec 2022 04:10:33 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m7up0d5a7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Dec 2022 04:10:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DoSzw2KViVUdA7sTMVTaHrJLUiKgQ59nLDluyT2lam2Hud86q7qbBY4Z+Xvq6YSmCzKH9n13K8Pr/T0nyVgXw9HOh2CoXkNJI2vxfR5oRAVDHkkC5MATeMM4/Er5hYUMcVPAulU3U7Y8gNDg7OiLD30VQwgUrqAe5S41SGOrN3K8Bffj3BE/TvhX7vi0dREz6+9VmFXudFOO4m3+JSP+9YByOLbknOkFSzNDR7ld3kjjf78ncb0cLd++U/pAa0imeKc8AgvJ2czvcL4xzoam3md2HC+eyZMxzG8BZeYpREty0oEleRuYWrUHE6cQMTlKfSI/9x+F1/xspdIfMC7yNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUPhyinWy1hmjlgFbFO4nk37jS8a67kbRApimYAzb48=;
 b=L2rZTSGdhcvvQV/vFaRZqVF31Naj99HIOwoO0dPy1gy6xvi1DpnjObzZmLMuwTqwlXFmnsoy08cI3iOZ2FpdElopIg7hw8Q1y+tdP1jFNjKWz+U/pHuJg9u32ZjdVcXTiSoIs3iP9MjMjG0qT2pXVrcyAs6kfryytZUv90trPcxibyXTvDfqnWHHf79wz+NhFtOzw/FlzlQjoJsIIqZAO0booa5zSnx+TnEv1/0FFomxpbfIOilnVWzrtT6RDGmErQh0Tk7uEQ8PFVY424FJ5NpuBhzfoaciW7/xPv7b4OQ8nSvukfA6GaQutrmTDNQbByycYXJN5UYJIdtxVqL73Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CH0PR11MB5330.namprd11.prod.outlook.com (2603:10b6:610:bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.16; Fri, 9 Dec
 2022 04:10:31 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c0fd:6b71:8808:4c21]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c0fd:6b71:8808:4c21%2]) with mapi id 15.20.5880.013; Fri, 9 Dec 2022
 04:10:31 +0000
From: "Yu, Mingli" <Mingli.Yu@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] xorg-driver-common: add opengl to
 REQUIRED_DISTRO_FEATURES
Thread-Topic: [OE-core] [PATCH 1/2] xorg-driver-common: add opengl to
 REQUIRED_DISTRO_FEATURES
Thread-Index: AQHZCJEP7y3aX3R1Uku0R27KTi2Pxa5k9wUs
Date: Fri, 9 Dec 2022 04:10:30 +0000
Message-ID: 
 <CO1PR11MB5009CDFE37A343FF56CC29CAF11C9@CO1PR11MB5009.namprd11.prod.outlook.com>
References: <20221205095151.3820258-1-mingli.yu@eng.windriver.com>
 <CANNYZj9RXtEWM_NoQJsC7Ej9W4k97BenfaPWccyypAxme0eobw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9RXtEWM_NoQJsC7Ej9W4k97BenfaPWccyypAxme0eobw@mail.gmail.com>
Accept-Language: en-US, en-AS, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5009:EE_|CH0PR11MB5330:EE_
x-ms-office365-filtering-correlation-id: bb1150cb-cb1e-4ee0-6196-08dad99b4fdb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gEvsoD4WHutnY3nboXxdaESmhmMiy0pgmmvnO8tLCl6AziS222t2dlIhA1LW3Hed/H2V3O6egKKYnqbFEdpd6d6gxi3tAItl9QVYD8vmz1Z9obqSofXN9SFIVYq0WwQMOZ7E39YLg6U3GrCEsy/i5pxAcfPuXmOWQ6aHLBZAUPJUYAoM0UC5CamuVsnSEoZXNaHrbptbqoN/dnis0EpZyUlChAo0uaz3jy9+d1jfZparBTxm6fwDnx0GeI14PYsibjNtHHFKNw//Ur1t04NyLJJfiPnmIUxeYoBrzdFhflXfxnPwZiibACSZKuxTd0l4naDCve2YWIFn0p7FXUqlo3Rgo5s71h9OhObwZU2ZZGAT5ukx4pOV9abTqOhw7c7p4wxUspEasmps2Lw/8W0J0IobomOv4FfTN8MyZ8VMsqHNBn6Qv5kfnu7iu6cvb4sHEDWkiSKnifsHU/I1cGZKX7hPdgp5sEVqDLZ2Mjhg+ROztrYnR60duUHnDFwpu2WN/+bhKYXnpjni5LtT1K1ovTBfQhNJ5pwYuATtW+RnGuTljhUQjjwr6eCXhKK5xpavWD5gvKKwL/H4IB6YW4Uo8luR1YdRiZPgEugMGEpr4lgQEYHyXK3CDXsZkIaeopP17KLtNbGdBlL8EOr5fBQZhfgP3h5dPW79FzRQBYjNLuElCMXp9Z/MjLGcgMVmRnEy7VToaaEc6NUQhXlEHtaUfA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39850400004)(366004)(396003)(136003)(451199015)(55016003)(186003)(5660300002)(86362001)(83380400001)(122000001)(52536014)(8936002)(41300700001)(38100700002)(38070700005)(2906002)(71200400001)(6506007)(26005)(9686003)(53546011)(478600001)(19627405001)(316002)(6916009)(8676002)(66556008)(64756008)(66476007)(66446008)(4326008)(7696005)(66946007)(76116006)(91956017)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?yQc8rYmdVj/WIITPkgxZE0rLGecspp87333l8UK7oHtbc0yHWD6GHe5osiRe?=
 =?us-ascii?Q?P9qihF0weK9eTxi5SiGq1YRPngxgx9baDGa0ubwYJQtbphmqCOPhQlXNIS4d?=
 =?us-ascii?Q?79v8AN6X2cNGirysS57jDTxJ8y6xc6Mwrb0jsEVOTZVxPG+pCuEV8AB3fabO?=
 =?us-ascii?Q?gU+1qfoyu76p0WaDQ31OOfjHaiHXTaDWP+faWfReI9joiTI+FcrV2ONxnevO?=
 =?us-ascii?Q?ZHIu6t6M64WwMGOCrx7Pf1jqIiW8S8tIsryVCC8o4dTQDN7+oyIfLbj8Jp6X?=
 =?us-ascii?Q?/GZsouJxEhRxoKRXMs2uWfLzM9ZOi2dVx+G9R3FzKmk+qqf4L5nmHg0KL3en?=
 =?us-ascii?Q?1O6GF5zzlizj/x26+ltjf/KDK9A4gpDTeeQyiCwjD9I2SHU38w5lvOlrNKxv?=
 =?us-ascii?Q?ggVOQVe1M3hg0Q/eBwMj33e33ekWCr4jWhPejOX1YOpB1PwjRhZ2OFCme5Zn?=
 =?us-ascii?Q?o7i5XhCOxL8BZ5a2s7OWBtakC2WbnP6IkbEyueMDI60tMmlHhOzD/CrLMG/a?=
 =?us-ascii?Q?qTM3KzW0OvL5TMhrDdcAyu5y/fX6CEzI0YI7AbjXhehDM870OUps5xlsQ6pm?=
 =?us-ascii?Q?pZgzMeuwKa3XIVnTiPKyzoAiDNFNRLYA0rRGuwaWC4kbbOln/6h/IgkyscDf?=
 =?us-ascii?Q?Dz2mJtljXv52heXYl0lb6quh7lAzQQK6Rvq2HjP9WdAfDGlSqRcdpI2js4PJ?=
 =?us-ascii?Q?aY+NDa6ftpu8MOjc9zC2pY2H4+h6VQ8MxGqo2FIsHlfI4CkVjuBT+buimeY8?=
 =?us-ascii?Q?hGhKb3DcJNO7NuTXSBPSaIArsSekRs7Y5r+n4F27l7qRs8NYQMz11j1WJEeM?=
 =?us-ascii?Q?+YmhEwwajumhrcqyFFDsRUYsTYf0gvqcokzZeGMjcySbkfQZOv84imzT0gXH?=
 =?us-ascii?Q?5scmC0EEfG5XlyhkW3qxCOIxdNnwCJ1/2G2i8Kvq5ev3A26/3ocmXdkBpwIM?=
 =?us-ascii?Q?8TilbDLsv4VsACAq1bsGARi7b4S1vdIWOMfvRSrestbssWCCfsyL4+d6CVAS?=
 =?us-ascii?Q?JtJ+U1vdItSCal/CsD88EoChAbHza7GraAGP+9X9Rn7XiXLPWKmUVYRyGDVB?=
 =?us-ascii?Q?xgxaKkdeDBhb9ATolR9gTLC8kU2IL34KhfeISmn1ILuhsYTC6YVGeXGN5wer?=
 =?us-ascii?Q?xqXREiPIFm0JLE+CZtq148y9sqjXoU6SAZJnveUT209o0WhDlqO3KPFgBxEM?=
 =?us-ascii?Q?txn6bgYdSS07OaYRQ5eExdRxpFYoDqqec1EfrdwOuhHRPf5HdP2MQMnxXU3z?=
 =?us-ascii?Q?pusxm4Zhq/KvvJWaozDmjlwgaU3J8jXjwksZWZiwc7Ld3Rg/f7fq/TR0aPTE?=
 =?us-ascii?Q?v/OpOqXws+j2DW8fPlzxFZpotVqU106QpWs52Zzn2pr+g5+6t/9FC8GlgpaY?=
 =?us-ascii?Q?cG9ZtIIA6CdHw9KwNK/XvHNIrMNqKY/fGAEHWV2IsqDupcIJIff1Giolqj0i?=
 =?us-ascii?Q?gYLmsAo+YpZ0NDRzr8IE/+RRryWpLZQfa7yUAPyQ0Sh1vD0BCm6ZT6lFBpIX?=
 =?us-ascii?Q?c7IkDkStwLCNtF3f6ZnZBCidmVPMI1CkAaqtTlt22lcj358BR6KPnomY5HkG?=
 =?us-ascii?Q?F35IJwPREe0VJlLFTvEcQxsU3zjdvxLIwFRJ+0Wt?=
Content-Type: multipart/alternative;
	boundary="_000_CO1PR11MB5009CDFE37A343FF56CC29CAF11C9CO1PR11MB5009namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1150cb-cb1e-4ee0-6196-08dad99b4fdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2022 04:10:30.8657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R+n2Jn9MBmzT4P2qF0kFFAXlswRmBStK9pUKg2Wi4KAQXftUW3lM1bmFSDiOd+wf6ACmVb2Y+wOqm9FUrruHZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5330
X-Proofpoint-ORIG-GUID: JIkoUe6dZiy6IaF-DfmxUITRNuzgldFS
X-Proofpoint-GUID: dd_qp3GMyLaTjwfko_A5LMiDKWWRMGc_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-09_01,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212090034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 04:10:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174427

--_000_CO1PR11MB5009CDFE37A343FF56CC29CAF11C9CO1PR11MB5009namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

The error as below:
ERROR: Nothing PROVIDES 'virtual/libgbm' (but /build/layers/meta-openembedd=
ed/meta-oe/recipes-graphics/xorg-driver/xf86-video-amdgpu_22.0.0.bb DEPENDS=
 on or otherwise requires it). Close matches:
  virtual/libc
  virtual/libomxil
  virtual/libusb0
ERROR: Required build target 'meta-world-pkgdata' has no buildable provider=
s.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'xf86-v=
ideo-amdgpu', 'virtual/libgbm']

Thanks,
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Monday, December 5, 2022 18:04
To: Yu, Mingli <Mingli.Yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: Re: [OE-core] [PATCH 1/2] xorg-driver-common: add opengl to REQUIR=
ED_DISTRO_FEATURES

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Both of these patches seem very wrong. X11 definitely does not require
opengl. I just confirmed it by building xf86-input-synaptics without
opengl in DISTRO_FEATURES.

Can you show how the issue can be reproduced on plain poky? It seems
like your local config or distro or BSP layer does something which
triggers this.

Alex



On Mon, 5 Dec 2022 at 10:51, Yu, Mingli <mingli.yu@eng.windriver.com> wrote=
:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> xf86-input-synaptics depends on virtual/xserver which needs opengl
> DISTRO_FEATURES, so add opengl distro check also for xf86-input-synaptics=
.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-graphics/xorg-driver/xorg-driver-common.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/m=
eta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> index 8b3f19426b..3fc54af3e4 100644
> --- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> +++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
> @@ -17,7 +17,7 @@ XORGBUILDCLASS ??=3D "autotools"
>  inherit ${XORGBUILDCLASS} pkgconfig features_check
>
>  # depends on virtual/xserver
> -REQUIRED_DISTRO_FEATURES =3D "x11"
> +REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
>
>  # FIXME: We don't want to include the libtool archives (*.la) from modul=
es
>  # directory, as they serve no useful purpose. Upstream should fix Makefi=
le.am
> --
> 2.25.1
>
>
>
>

--_000_CO1PR11MB5009CDFE37A343FF56CC29CAF11C9CO1PR11MB5009namp_
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
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"ContentPasted0 elementToProof">Hi Alex,</s=
pan></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"ContentPasted0 elementToProof"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"ContentPasted0 elementToProof">The error a=
s below:<br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"ContentPasted0">ERROR: Nothing PROVIDES 'v=
irtual/libgbm' (but /build/layers/meta-openembedded/meta-oe/recipes-graphic=
s/xorg-driver/xf86-video-amdgpu_22.0.0.bb
 DEPENDS on or otherwise requires it). Close matches:
<div class=3D"ContentPasted0">&nbsp; virtual/libc</div>
<div class=3D"ContentPasted0">&nbsp; virtual/libomxil</div>
<div class=3D"ContentPasted0">&nbsp; virtual/libusb0</div>
<div class=3D"ContentPasted0">ERROR: Required build target 'meta-world-pkgd=
ata' has no buildable providers.</div>
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'xf86-v=
ideo-amdgpu', 'virtual/libgbm']<br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"ContentPasted0"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"ContentPasted0">Thanks,<br>
</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Monday, December 5, 2022 18:04<br>
<b>To:</b> Yu, Mingli &lt;Mingli.Yu@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH 1/2] xorg-driver-common: add opengl to=
 REQUIRED_DISTRO_FEATURES</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
Both of these patches seem very wrong. X11 definitely does not require<br>
opengl. I just confirmed it by building xf86-input-synaptics without<br>
opengl in DISTRO_FEATURES.<br>
<br>
Can you show how the issue can be reproduced on plain poky? It seems<br>
like your local config or distro or BSP layer does something which<br>
triggers this.<br>
<br>
Alex<br>
<br>
<br>
<br>
On Mon, 5 Dec 2022 at 10:51, Yu, Mingli &lt;mingli.yu@eng.windriver.com&gt;=
 wrote:<br>
&gt;<br>
&gt; From: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt;<br>
&gt; xf86-input-synaptics depends on virtual/xserver which needs opengl<br>
&gt; DISTRO_FEATURES, so add opengl distro check also for xf86-input-synapt=
ics.<br>
&gt;<br>
&gt; Signed-off-by: Mingli Yu &lt;mingli.yu@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-graphics/xorg-driver/xorg-driver-common.inc | 2 +-<=
br>
&gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc =
b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc<br>
&gt; index 8b3f19426b..3fc54af3e4 100644<br>
&gt; --- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc<br>
&gt; +++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc<br>
&gt; @@ -17,7 +17,7 @@ XORGBUILDCLASS ??=3D &quot;autotools&quot;<br>
&gt;&nbsp; inherit ${XORGBUILDCLASS} pkgconfig features_check<br>
&gt;<br>
&gt;&nbsp; # depends on virtual/xserver<br>
&gt; -REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
&gt; +REQUIRED_DISTRO_FEATURES =3D &quot;x11 opengl&quot;<br>
&gt;<br>
&gt;&nbsp; # FIXME: We don't want to include the libtool archives (*.la) fr=
om modules<br>
&gt;&nbsp; # directory, as they serve no useful purpose. Upstream should fi=
x Makefile.am<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR11MB5009CDFE37A343FF56CC29CAF11C9CO1PR11MB5009namp_--

