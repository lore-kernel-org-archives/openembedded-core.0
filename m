Return-Path: <rob.woolley@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31678C55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 11:14:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17389.1786014845897975557
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 04:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JE4pt3fe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2678be15ee=rob.woolley@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6766N1v13988483
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Aug 2026 04:14:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=SvNbruw7rZyAcVqsS78+5S
	fjp/uv3+oTqbLLc1EsdAU=; b=JE4pt3fe/ItkStztiuNo4bm8Ct2ewZ3psryT5x
	GSGzUCNdHPbWzLyESjbLbIYMKum1RSGRbgWWq+t/E6DN6+QlkBXZq99q49kQKcx3
	9gC57oA3uMzGBfOvw4Hzd6sLKvNltLBSBiEGTREGvqkq/51iPJazidsk2url45xL
	aqCTROYGpmcxHkpAmdgKfLTLyo9ALRbTJuwcfkLFSDqxBK6exciPorpM0TyuYfaV
	2VsQw6Bb56XSgNhEoy/hhoUtL5FKMkSGlkBhMl76PK5oL+/IxXqGWUxh2gLN1i2A
	NIKmv5ShO/fcd/DXUYDVYLqzstQnVFi5WuGKW+WfhcmqHfhw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012058.outbound.protection.outlook.com [52.101.53.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fsgah8jex-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 04:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKrQRIrL0Arl2bwv4esKrHTurFTUcW/eMAzwed/RU3XnOQPNj0L/rhpvl0q1pfbSWpfNBRg6skrVGCTaDhy56PyWN5JomzKxyNbHUI9BNgCFxXYPy/71YSS6yjxjYlZh5jtzAW2I9fSYe2G0Z6t0uH606GOkMFlGQ6hhqDc0fDTjr3aW1YDvDMIKObO/PZmzbV2abC9GOAcgZU4B0vueabCsRXZOTvWSFgboQ3gbUrqrH5ylmcw9Cpj8ohCVLeeDZTbRuFn7IZuVolgPZJWdjSFC+Pe/bUYy/wCKLmAzEdJYRIOqPuggW0Orsj1tiTVB2anpZ/TrrKzbBaermQtUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvNbruw7rZyAcVqsS78+5Sfjp/uv3+oTqbLLc1EsdAU=;
 b=p1e79AvPeVVjCGiHmk0/raFE9lo/sK/+MuoUDTNO0Z534FNElpxqR1aBGoodD9Y4wTC7OHsMq01uKJK4oDb6qYLe8XAaPU+GH9e5RkXmmlS2mn4rLU/+xxeWBJxM74qvwHDhuE5BI28JsuKzIgiJZa/IkVh1qyq34ogeN7e/xrKrKWO8rwMSdkIF5tCVGcFNTNAIrLNzYc0ai09OVWGeYLLMTPKpGLQqdFtUwLSDaBPV1XBly8tpw+VHXnhCm7jqxUVRkl2h/scRCJcsahkKarQlaCqePIwtreBKyg5HEISUkK8512HspfkBea9cCAzZBeiRpJlIOwSWkdwj4+Wi0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 SA3PR11MB8001.namprd11.prod.outlook.com (2603:10b6:806:2f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 11:14:01 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::ce1b:9c1d:d571:9eb8]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::ce1b:9c1d:d571:9eb8%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 11:14:01 +0000
From: "Woolley, Rob" <Rob.Woolley@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Yocto-mailing-list
	<yocto@lists.yoctoproject.org>
CC: ",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: bitbake-setup in pip (was: [OE-core] Yocto Project Status 4
 August 2026 (WW32))
Thread-Topic: bitbake-setup in pip (was: [OE-core] Yocto Project Status 4
 August 2026 (WW32))
Thread-Index: AQHdJZGCxwksSyH4ekqbZJtMo1pOSbaQ2qwX
Date: Thu, 6 Aug 2026 11:14:01 +0000
Message-ID: 
 <DM8PR11MB565590EF93CAAE1E7B5269D8E1D22@DM8PR11MB5655.namprd11.prod.outlook.com>
References: 
 <CAK5yBb8f7Tnxyebp7o3Pkwdp2R4RbfZ2sVo-3fjh6MUGzvcESQ@mail.gmail.com>
 <CANNYZj8MbUcOadseSfWcZzGxXaSC30DxE7HM1=oGrbpz4vpj=w@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8MbUcOadseSfWcZzGxXaSC30DxE7HM1=oGrbpz4vpj=w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-08-06T11:01:16.9682175Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard
x-ms-reactions: allow
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|SA3PR11MB8001:EE_
x-ms-office365-filtering-correlation-id: 5b84f59b-efab-4e8f-0ed3-08def3abd18c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|13003099007|38070700021|6133799003|8096899003|56012099006|11063799006|4143699003|10067099003;
x-microsoft-antispam-message-info: 
 77ZQRD7b1L2FOOtpwoQzvHUFOidJLDVjHbceEXyHUbQhF4PU97md8g6ZS+Z+v/b2NQOxhsRnQAS3H1YukBV1W3gVUKfG1w0emDoZIQYduwY0DYsE2Y4qPkD+7h3E3QPQ0EYCOBj8gi1EEj0Ok/6dBvM46BhM9YPzFOyxKz4nD9WoKJiN7QJNuH8V4LPfXQzeWmLImZruGV8yQVPpD7ues+aQehmEgLAHAS6qOlMOD1VzVAhUm1ATuSWcHsiJm9WFA4VECLZwRmh4t6V5zmXyarGIU2rfI/0rXh70aVkQEz3Z/IX+7yEiyOQSmPj/uukxKTOC39A6s3oOgjDAVT+EcgoXu1seN9N19V9bbN8nGB4SpKjzUhRsMPBwjcv1G8GV666Zkrc4HGPWUNRXqIdVB9FpqoayhYishy/5HFwN4nBSR048Pmo+y0f0BXJ4MWYPMAWLRkXODxF75ISSxtzktWYSJp04UyNJQS+L6PkMLEBLqf2vUiT/ZsAjjT8RHpgpgNbPXPbyKfXGKaqO2j8a6IE5ZbkPQIz1fM1Ml/vd2wmcjDmFZ1OerRe2WYnW7kdn9KV/VENq66Rxu8m1pe8mynkBEut3NI65TBiJEneQSvvsde6GxvTSgG1HdtYSH43jsph1Jyf3VSm3D/mD6wU1fPiJNA6pHae7g4QhkDYMMEA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5655.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(13003099007)(38070700021)(6133799003)(8096899003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?jbtDeN5voYW6qme73pYupXk2NI3JHq5iLx7UxC0ixUZOg0joKes5DA7smJ2d?=
 =?us-ascii?Q?GBSX9wyoUlz48X3vVMjOzVfu0xqd+f57NTeGN98JIWsZMNtX2aMHzHCNiZ67?=
 =?us-ascii?Q?xtUvhPWlwuZc0uk1ecVOVWhPDK2cDGRPRr8fs+40X49o6zPThTTGPspnZPHm?=
 =?us-ascii?Q?CDN6wOxLAO3QMCBZIwewE9F9XICg5JZuu4CCURxT+KQhWOnYYDBVFgKlX54t?=
 =?us-ascii?Q?R0Mj7Ggq4sH3l26exZPaiz+TJ/ESCc/ruDMGkJmjXKii/yFCZO7Cz51dNoeH?=
 =?us-ascii?Q?HtnAS5Q/NaqI6Vi7BhI8BBMlcN00nCACagMsE7nt/Fo/Mw3HXkIdJzq8IKT9?=
 =?us-ascii?Q?eK7WbuozkzwK33Qz6YO8qR2HbSrdHaSTRQcNSq90zuVxukmdjHqN3uILLmiT?=
 =?us-ascii?Q?WNMOlH5EvQDimj7DMTdcTYi47xMdnSuG8Nm6y60PryIkUiXizNwzyBuJ9nzn?=
 =?us-ascii?Q?NUSOgIAJzywm4BgxeSIkM9/6E9o9wvtJtxhuwk2mbtWNEP8iGfkAh7XZTRzP?=
 =?us-ascii?Q?MJ9hWoi5SSKfEu0xc918Wxt9Pxh7oc+BozNdF+Uizs7AuSi1kZA5tER7TPNf?=
 =?us-ascii?Q?TaromTbeHftKFJHft4WzLafHJAjDCf31XALvpbIkL8keiJz67IoGnUMn2xe+?=
 =?us-ascii?Q?eGJKY04kQwDd3yt7pufjqKV8ZPLPt2Sg1yMxu4TSHGa+VI3+R47N2XSWN6Ki?=
 =?us-ascii?Q?qV/ZMGeOlitzqmUZxICFSmtVpyHMVUXi0WEXR+wVMZFVRapx1Ky4hGJvgeOj?=
 =?us-ascii?Q?YfAJuqM14AfhjCk9WOBPuhaji977dh3anfFLhFJKVqtyOVDveSpiiJ31/PNB?=
 =?us-ascii?Q?wKJeldk0obc5Ogc28qUt6bY9yRJmxrv/o72rYzxoZY9B0llNj0VCyUJdXDdw?=
 =?us-ascii?Q?FIsJVNZG3yJ9ZqlcNgEUaCyHdh9Dp2ZvwemybnK3pgYiJKcW7uxslzjC66rU?=
 =?us-ascii?Q?KVvvw0pHGnd9t6egj5tgx2iCFR6Sr2gmWzbWC1ZUe5cpZ4NuB9OFWyE8kYWi?=
 =?us-ascii?Q?VK07f/TcSEE8MBXJvULBRqSRTjyx/b6BWJ9JquLB4Bs9U2Skw3o9yt3DJrVg?=
 =?us-ascii?Q?vmv4u9V+Ety789Z8CTYKZtKtpNMcVsdxwRRX7v+CAarqyruho95tb63tTbQF?=
 =?us-ascii?Q?h96MD/lnMBOPfTIYG75fEDY30XdIRQiSOHO42X2YDyt/YV5G0BAX+wW11bh9?=
 =?us-ascii?Q?/Lu5mz7Y+85fHPDd/Cx7oyFGZZYLwIIk4L6G9DZ9V0rF8TQ91wnytaKeVwoe?=
 =?us-ascii?Q?pVBukoCCviJcVLrkmxzxM3pMqXLcPtQya/3x4W2byPv0qoQAEVnVk3KyZwr3?=
 =?us-ascii?Q?iSovUxe/R5QDF6vcg1PamNUDLj2mtvLcWD6afiT8PtfTJz16i+vNnXTK6Elb?=
 =?us-ascii?Q?jqVb+x1RZXJe5/FJ9PrpGa0Pa3RNAfA08KBRZf8UT01++XLP1xxZIWU5Izt8?=
 =?us-ascii?Q?xaD3n7IADxADescsfb2EemvT5KURpYrdT01IS30yQoOIZ/JH7H1BaC1bxfZI?=
 =?us-ascii?Q?y0zGssAFQw4fE7LFE9s+AZquRA/ZR6Y5hDsLx0q4WrFHCHSQRWmBrWEjy2ha?=
 =?us-ascii?Q?aGK5FyCDPNbnPs4dB3UKPO/r0mu0dmo1wjLnKbxzQlbAOjG2dHpOknWvfpZx?=
 =?us-ascii?Q?hQq2yL1Smtpo2GUqQ8vHrBmXfP61RA4biSfcP924dW7rCxQoKI/M1lsdeJ2m?=
 =?us-ascii?Q?AKHJDB3a/J97rdFbtIOM9DKrLuQHYoS6rlUc+DZNn4vUSZFuNijHO8RIvLub?=
 =?us-ascii?Q?sIDO5eC+auxTqq764o4DwL4BLonSyes=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR11MB565590EF93CAAE1E7B5269D8E1D22DM8PR11MB5655namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	MZyfP1mMy6mBF66FADLvVRR9k165JJMptK1jdED1xPiwHKnr0aiqHD70Wq3oI2IIRDK65zOJwaM0VqzEy5Kt6tWq11lvl9uKUr3fA+lr4dfQ/OjBIuBVb14sXZUDRJDgzwpZITFDIOHtrO8wWjCI92gLZU+V0MRHGb9bPE8Xg+hXD3tny8mrQVFq1vPLyFI9QnpHBmVBUl721LayA/TioGYZJVEvieMloqPEIzJmHhv5AXDVPK7djD6XMdMIaP+Qzse+mr0JomgQQuRB82yYknwm2a2NiVAicNqbNs+bOIH2YMpIRihCv9EkE/OqBgo7JE5253WMdCkaGfHfZPbg4A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b84f59b-efab-4e8f-0ed3-08def3abd18c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2026 11:14:01.3608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: juF/++3uzcaQKE3MN1RyPa2mf1FDQ6zEhoO8fiqJufwdWPG1uuRMJ9qiL+cmman4AVfitWJP6REl8Htxx29dEvkxfb3qbcP/k4udMgZbgpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8001
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=cYTiaHDM c=1 sm=1 tr=0 ts=6a746c7d cx=c_pps
 a=eaWElexNrpfURq8UtOOyIA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=CckQENj0AAAA:8 a=_EeEMxcBAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9
 a=CjuIK1q_8ugA:10 a=pJ8t09Aow7-j1kLz:21 a=_W_S_7VecoQA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4OCBTYWx0ZWRfX8HYmrzojBiHn
 KESE9I8+rFsIStrtucSc7Xv1xwOykUhQthedzGzXtqkoDZGyT7QTu8wrikST5oKv3QSHYjQK7jl
 KrYGJUN0HLzzRCoiYGwPW8jQFQzWzOppsBPMHrb/eeUOWhEe8UK2vgMS5ZeC09Db1BxIQsTp+d+
 EP5SexwbS3taIGtQ28PPlze0KDn8SOBmm35bO8ZSsj4uGzDElbyMgxL0P1KyyzEfH6Y36EnsxFR
 UXLHBkqOX1Sq9aWhDYOOTbonPwq1xR3kF8KWMNBHRuMf4+xeqp6kWHt7SADbIavSOChgMiHiZhN
 fXWt6B8daIEN/jE/CK4yYEasJHXUgTP6jGjOLPw7rmBPUZb+1+56GOY2bpTI+gMulebt+6JpcrQ
 DQPz8EmZ1UgKDsmM+SdHBFWSrzVnPVhAuoBBMVRhDZXYG/P6rK1dj/leoUcitzXIolR9cnAHQ3F
 vDrtFx8Jl4ucUgzrUiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4OCBTYWx0ZWRfX4LF2Axew8aK7
 iAjH1IrWE/PTzQdGW/1+u4SsdaHJzsuNwpOqPtyQTz7wclYaNeEvVCygT+ZMO01dpQFOqAhN7br
 +Q/YvdQYddE9OqhHKr3RS723WDXESsZ4/N1A8QGGr1pfq9iUkqpB
X-Proofpoint-ORIG-GUID: fuFN7TKknfSr4XmE_vu_CksgLT3ZMkxq
X-Proofpoint-GUID: 7cIJQid2SHRDwLaYGq-94QhZTfAEJNiP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 11:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242927

--_000_DM8PR11MB565590EF93CAAE1E7B5269D8E1D22DM8PR11MB5655namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Sounds good.  Sorry for not looping you in.

I have been working with Richard and Michael to transfer the PyPI repositor=
y to the Linux Foundation.  They already have been added as maintainers.

Richard and I discussed updating PyPI with a newer version in case people s=
tarted using it.  I published 2.19 with the tip of the git tree: https://py=
pi.org/project/bitbake-setup/

Right now I am manually using twine to publish the package.  Some work need=
s to be done to add infrastructure to automate the testing and publishing o=
f future releases.

I think it would be all set to go.  I encourage you to give it a shakedown =
and see if it fits your needs.

On a related note, I have been converting my kas configuration fragments in=
to OE template fragments that both kas and bitbake-setup could use.  I woul=
d love to discuss some of these details with others interested in this area=
.

Regards,
Rob

Get Outlook for Android<https://aka.ms/AAb9ysg>

________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Thursday, August 6, 2026 6:51:18 a.m.
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>
Cc: ,openembedded-core@lists.openembedded.org <openembedded-core@lists.open=
embedded.org>; Woolley, Rob <Rob.Woolley@windriver.com>; Richard Purdie <ri=
chard.purdie@linuxfoundation.org>
Subject: bitbake-setup in pip (was: [OE-core] Yocto Project Status 4 August=
 2026 (WW32))

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Tue, 4 Aug 2026 at 17:07, Stephen Jolley via lists.openembedded.org
<sjolley.yp.pm=3Dgmail.com@lists.openembedded.org> wrote:
> Current Dev Position: YP 6.1 M3
>
> Next Deadline: YP 6.1 M3: w/c 2026-08-31

There was a question in the sync meeting about what people would like
to see in this cycle. I forgot to speak up: I'd like bitbake-setup
installable with pip :) I'm not 100% sure where we are with this right
now; I think all needed patches (or at least all published patches)
have merged, and what remains is the mechanics of making a release and
getting the artefacts to pypi.

The reason I'd like to see that is partly self-serving: I'm going to
talk about bitbake-setup (this time, as a released, shipped feature in
yocto) in ELC in Prague on 9 October, and it would be awesome to kick
it off with 'pip install bitbake-setup', rather than 'git clone
https://git.openembedded.org/bitbake'. But it's also good publicity
for the project to do it the former way.

So I'd like to hear from you Rob where we're at and if there's
something I could do, I'd be glad to.

Cheers,
Alex


--_000_DM8PR11MB565590EF93CAAE1E7B5269D8E1D22DM8PR11MB5655namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);">
Hi Alex,</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);">
<br>
</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);">
Sounds good.&nbsp; Sorry for not looping you in.</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);">
<br>
</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);">
I have been working with Richard and Michael to transfer the PyPI repositor=
y to the Linux Foundation.&nbsp; They already have been added as maintainer=
s.</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);">
<br>
</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<span style=3D"color: rgb(33, 33, 33);">Richard and I discussed updating Py=
PI with a newer version in case people started using it.&nbsp; I published =
2.19 with the tip of the git tree:
</span><span style=3D"color: rgb(0, 0, 0);"><a href=3D"https://pypi.org/pro=
ject/bitbake-setup/" rel=3D"noreferrer noopener">https://pypi.org/project/b=
itbake-setup/</a></span></div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0=
, 0, 0);">
<br>
</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0=
, 0, 0);">
Right now I am manually using twine to publish the package.&nbsp; Some work=
 needs to be done to add infrastructure to automate the testing and publish=
ing of future releases.</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0=
, 0, 0);">
<br>
</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0=
, 0, 0);">
I think it would be all set to go.&nbsp; I encourage you to give it a shake=
down and see if it fits your needs.</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0=
, 0, 0);">
<br>
</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0=
, 0, 0);">
On a related note, I have been converting my kas configuration fragments in=
to OE template fragments that both kas and bitbake-setup could use.&nbsp; I=
 would love to discuss some of these details with others interested in this=
 area.</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0=
, 0, 0);">
<br>
</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0=
, 0, 0);">
Regards,</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0=
, 0, 0);">
Rob</div>
<div id=3D"ms-outlook-mobile-body-separator-line" data-applydefaultfontstyl=
es=3D"true" dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, =
-apple-system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt;" dir=3D"auto">
<br>
</div>
</div>
<div dir=3D"auto" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-=
system, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(3=
3, 33, 33);" id=3D"ms-outlook-mobile-signature">
<span style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robo=
to, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(33, 33, 33);"=
>Get
<a href=3D"https://aka.ms/AAb9ysg">Outlook for Android</a></span></div>
<div dir=3D"auto" id=3D"mail-editor-reference-message-container"><br>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" style=3D"font-size: 11pt;" dir=3D"auto"><b>From:<=
/b> Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Thursday, August 6, 2026 6:51:18 a.m.<br>
<b>To:</b> Yocto-mailing-list &lt;yocto@lists.yoctoproject.org&gt;<br>
<b>Cc:</b> ,openembedded-core@lists.openembedded.org &lt;openembedded-core@=
lists.openembedded.org&gt;; Woolley, Rob &lt;Rob.Woolley@windriver.com&gt;;=
 Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;<br>
<b>Subject:</b> bitbake-setup in pip (was: [OE-core] Yocto Project Status 4=
 August 2026 (WW32))<br>
</div>
<br>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<div class=3D"PlainText" style=3D"font-size: 11pt;" dir=3D"auto">CAUTION: T=
his email comes from a non Wind River email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Tue, 4 Aug 2026 at 17:07, Stephen Jolley via lists.openembedded.org<br>
&lt;sjolley.yp.pm=3Dgmail.com@lists.openembedded.org&gt; wrote:<br>
&gt; Current Dev Position: YP 6.1 M3<br>
&gt;<br>
&gt; Next Deadline: YP 6.1 M3: w/c 2026-08-31<br>
<br>
There was a question in the sync meeting about what people would like<br>
to see in this cycle. I forgot to speak up: I'd like bitbake-setup<br>
installable with pip :) I'm not 100% sure where we are with this right<br>
now; I think all needed patches (or at least all published patches)<br>
have merged, and what remains is the mechanics of making a release and<br>
getting the artefacts to pypi.<br>
<br>
The reason I'd like to see that is partly self-serving: I'm going to<br>
talk about bitbake-setup (this time, as a released, shipped feature in<br>
yocto) in ELC in Prague on 9 October, and it would be awesome to kick<br>
it off with 'pip install bitbake-setup', rather than 'git clone<br>
<a href=3D"https://git.openembedded.org/bitbake'">https://git.openembedded.=
org/bitbake'</a>. But it's also good publicity<br>
for the project to do it the former way.<br>
<br>
So I'd like to hear from you Rob where we're at and if there's<br>
something I could do, I'd be glad to.<br>
<br>
Cheers,<br>
Alex<br>
</div>
<br>
</div>
</body>
</html>

--_000_DM8PR11MB565590EF93CAAE1E7B5269D8E1D22DM8PR11MB5655namp_--

