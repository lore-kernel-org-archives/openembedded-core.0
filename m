Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF106C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 10:58:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.207733.1724065100643737790
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 03:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8961a927c4=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JAWJo6026894
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 10:58:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412j0xhpfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 10:58:19 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47JAuXsq029878
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 10:58:19 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412j0xhpfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 10:58:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5T8PW+4Ig6tzYyWZ8/bSk2mgvS4VW2P1LISi6nT3CwmBEfIfIe6ykxwkX7Rg625H7ijm49jpJWySNZSdi5XiS8adql3PzeD6POGXxTLzfv7ScaAE9WVUtIm6/bjxzdJcA/JtRGTqGymOV8oqS8QdKmHkQubD+4hxDyQNKTY5vQaxaEQd2rtu8BjDHKIpNNiyKdJ6oPuObDv6+7wTn/b6zrQSDK/0Pi7OjgQicngb573SrvcpCIHsuro109D/ntpK+wKnT4ZyTKaH0xMjlFjxeNiea9f+VpHLSQDoGnpKb+X7X9x3a0iuPELWrc1u8gl04Q7tb469UOLmTv51bFTFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6OXt2Ld2nVCtKOkSyFJWTZ1o5vwJk1/e0EZOy/xzck=;
 b=FAuO3e6DbmAWcoPR1fpon5lKXYmDT34ij2YL0TLgLKlzAZkEHv412RI5FV1dUPctS1YgpMAh/EHCT1F9/bBhn4x9AFIh99VJqVNuKpdRp9LBP3cvHqayNmDlssAZv2jcgZ1HcoZTIgjipIYLz4MamddDkecIGhih9f9cqhGedSO4dfMkw4aE/Fteav3rzs7ee6E52nYBy1cFcT3ek4RNUF9Azkvtr9nMTTSsqhH9R6pV3QXU38c5+dl5yMgacCXVhdg8/AkTK+pLs3+6Y628JXeAwbUxhrJO/cB8NafyiQrKQCuYWLAw74twFgWQQTlfxIvcZgutTezHLfSbJGCKCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB7320.namprd11.prod.outlook.com (2603:10b6:208:424::14)
 by CO1PR11MB5059.namprd11.prod.outlook.com (2603:10b6:303:9a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 10:58:13 +0000
Received: from IA1PR11MB7320.namprd11.prod.outlook.com
 ([fe80::5547:934e:1997:835c]) by IA1PR11MB7320.namprd11.prod.outlook.com
 ([fe80::5547:934e:1997:835c%7]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 10:58:13 +0000
From: "Varatharajan, Deepesh" <Deepesh.Varatharajan@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>,
        "Gowda, Naveen" <Naveen.Gowda@windriver.com>,
        "Moodalappa, Shivaprasad" <Shivaprasad.Moodalappa@windriver.com>,
        "Kokkonda,
 Sundeep" <Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [scarthgap][PATCH] rust: rustdoc reproducibility issue
 fix
Thread-Topic: [OE-core] [scarthgap][PATCH] rust: rustdoc reproducibility issue
 fix
Thread-Index: AQHa8hzH0GU5U5o5L0i+FGXKsUXbZLIuaAWAgAAAsCE=
Date: Mon, 19 Aug 2024 10:58:13 +0000
Message-ID: 
 <IA1PR11MB73203EA21C1DC3257EE94C80908C2@IA1PR11MB7320.namprd11.prod.outlook.com>
References: <20240819094701.27210-1-Deepesh.Varatharajan@windriver.com>
 <CANNYZj9MxBgY-v=vDyhqMn_euNAtT7Am1EJN9Xc4s_7t=jD8qQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9MxBgY-v=vDyhqMn_euNAtT7Am1EJN9Xc4s_7t=jD8qQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB7320:EE_|CO1PR11MB5059:EE_
x-ms-office365-filtering-correlation-id: 65ccc629-b237-49d9-de97-08dcc03dd26a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|4022899009|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?OXyOg40Ar+1bBLqSeNDGoUmxjC2ayhVMwSD3zNKeIEFG2/KDDTC9azXmjk8e?=
 =?us-ascii?Q?UomH4Pcnl5k+jMiYJDm7jvgTFpDIuRa8zAXnqxdsPGZrNt6mj8oNhihM4PQR?=
 =?us-ascii?Q?qKEJCdLGuaFdrOLrmK6be4iN+14J+ZVwzoXKktsDkMwffLIY8jN0d7fyM5Zz?=
 =?us-ascii?Q?ADP16OGBBx+zfWtn9Ao/jRRNbotkUEZ0mxmALDJQbuinKlRObiox1jvKBalb?=
 =?us-ascii?Q?q429I0Gn6or69WEjNtzhLBlx5xCy8ZUutHRhtxNtaZGZjjvFYEgIsPKfoexu?=
 =?us-ascii?Q?NmdMvaUuM/+hcibzUG0RiZO8E4+4aL2z40rH0/p1CR6JnAnxdRnhjz1Tp8aw?=
 =?us-ascii?Q?va2/8/501spALvp1rlR0ZdhX3obe1ypXIZAu+l8bxm1Zy9SvGVYvHM/oym/r?=
 =?us-ascii?Q?2jt6JP/8ZIL/kSwIX/zaWBXZUI+E75MbGgpUM1ucusS07YR9YRNnLtTeQAYD?=
 =?us-ascii?Q?wIws8jRt3X9a+VSzxr8pHq1zHMTkPyu4ZisBpj4zpaPOa6yOf9JK/h5eefiu?=
 =?us-ascii?Q?CIfvyk/nlvG2YLmw486/yrf1XvE8U3H6dBKVyKZ/0z0kvvgAdl5n1yga27Wt?=
 =?us-ascii?Q?LDBuzDvOYU9rkSATD31bb3BD4nYXQ544hHcybJ15dNjLgFwj97uyImqAoKgh?=
 =?us-ascii?Q?e/FLxeq91a8zTsUbDUGlj8lgTTfyvhT0X+pgxsPe5dRLR8Yei011EIMzUFvo?=
 =?us-ascii?Q?lZ0Iw9JJbSrhELkI/XYvylmEWwPgFfm1evaZVqTbMoIMnd1+mql3J+2Ustu4?=
 =?us-ascii?Q?r0YLAEhXsWlvSG7k6tPNwej276nY1YEUVCMhfQQMqNyTjmrqszp1L3fFG/wf?=
 =?us-ascii?Q?cW1WFvqu7XExSy2Tlz3EFLFphHNamQ7+UNRB1JkjGSO24wdmz9P/2Iwigs1S?=
 =?us-ascii?Q?ZjLgjSnGjHOfQ6dtZAf5HKgEf07cEjwOH5X0yDWQoTHRCgtbsaTWTYcyv8iX?=
 =?us-ascii?Q?dHwAx64qLraaUKPPPi5+dKGjxvQ6/z6oSWAvTid64L8BUCEFJL059jecH+Sq?=
 =?us-ascii?Q?gulqG8jYtolqkpMXCSeFvF4+LmSzrjUx+dGmt2OJ2ZQSwDl6iHVcxH/x2swS?=
 =?us-ascii?Q?jkn9pENQPIefFHAq3lyg9ZN2RQdfeNYMuCMjGXx+r5V6wIz0TdVebRh008hd?=
 =?us-ascii?Q?SrreKOfgzNPX5QHq7jttF/dbmnTAx6qwX1pY7gmcKM0fjX9SbW6dU4OrGFiq?=
 =?us-ascii?Q?IUVMijMcraRdYJxP7N7TkTSZtv1Z+FqikpEikGjJVPF7ZOD81JN2MXZ2lu7A?=
 =?us-ascii?Q?0I0xwaxZfkEq4BjsIZfdI1dyG3NnKVM75cZ2LAje81/eSMbpcHzbjPdyzV5f?=
 =?us-ascii?Q?EUo49ikYoQmm0BtiDNQnKmNaW1PdPVi4MQoMITfEHe7GI9iHmV2/ksEoymRs?=
 =?us-ascii?Q?GgKPzTQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?8NwhRuJCLJCZiiwUOrFZTgsFxsDLR+XpaKZhmwhrjdM92dmwfkHsavk9NjnF?=
 =?us-ascii?Q?JP0hTXX4oRUNf36i5MR6Ox14R6cCJ8wCXTzOEmgXOtzrIktavjMxPdVmmB4K?=
 =?us-ascii?Q?MRfAPVH5zW3+8cc91ZYUEqT7xUVmaYXFuWpqDXiLBXHL77jyReYF2V+T0nMn?=
 =?us-ascii?Q?gGepcvaZUin/uyZ+dvxB48F2SZ0EG+INBAfxSFCA2ZOCHNMrxV2SF9TXnmU6?=
 =?us-ascii?Q?ROiMzthhJQsTmLTBGIp4XTNBTqyxxFJUX5aPCgrcHAAc6pTO48Am+SA++VWZ?=
 =?us-ascii?Q?IoANx7DbaoZxdqo1yAcxVMrXCskOUFW5ymhUJY8W3ipJ8ihJADYK6M3uo6mu?=
 =?us-ascii?Q?bNNjTx/I1ewEhiQLkNoINfZ8LrvzG17VL3mvby7niILP+bS2C2wJexbjYcfV?=
 =?us-ascii?Q?yPkuB6BmeKsJQCkdrESb42ZAo8zB4289eCc9g7iPJlkHessfCCErhXw8GvNR?=
 =?us-ascii?Q?Iu8+VrAxfD6GPiTVaI4JnpFpm2tSub2OrjbtEuZiOsJi9UubM3EaQPhs0NpT?=
 =?us-ascii?Q?BTRTTlU3urYfBOkGagG0Ciipg/6jaiQ1yGi8VSb3RobyRcx++NTrCU6QcfZx?=
 =?us-ascii?Q?3nvQ73wS8pkhhYh2HjOoAPKciriQL4Jsx9SMqvItFxez+ELN0q0krpBasi5+?=
 =?us-ascii?Q?yg2uh7T72qTEkIrNPRkO8dqQBxXy+BAOSH3yRNmyS7CXV1r0gA7d212IQsy3?=
 =?us-ascii?Q?N2lIXaLXriZXPCgNPizjHlzHtlXLEU1MSfsnQUj/HDw3c/T/t42i3mFqFTdi?=
 =?us-ascii?Q?RICQBGwCBOu/zik4SZTaYhroriaemoQFe3Au7/hlrc5NtSU0f7jvvYeSa4E1?=
 =?us-ascii?Q?lmuxfKVhQ4YEd1ztrwEdbdCI+awXB4tincBBTefcMA0+uHs+EGDPHZtqKHrb?=
 =?us-ascii?Q?rtGyYlvoOVm8iVSG7tv0m8piIO/lpt2DhsEHaEzKsAigep651MC9/bwzJ7np?=
 =?us-ascii?Q?LPhXdhWJj9y31QRAf6a1yAM3RKTcbmWZkeRWJaeR0UnzVu8OGDzMV/Y94LtT?=
 =?us-ascii?Q?1cvJ9zJxrH+meMuiLKaBES241zFX90AMDHFiQAA2k0oS6iuZjTdiZk62ykK2?=
 =?us-ascii?Q?TpUUYoUxbsDe9V00Ka/3EGEuECzX7LbvQNJnIsjaT7VFkR8F1wdpQ1I3hdYj?=
 =?us-ascii?Q?l6QXIGxgqXYsxsspkeBin56PLkS64yD7Ky41ThNO6czQN4l6LPfTX3kRp+UP?=
 =?us-ascii?Q?hmzKyjl4bj8w4Q10vL+Zm5beFE2X9d1AoM6gbWyTnmwoh8/5w2cUUEMg4uPQ?=
 =?us-ascii?Q?Qbw5/jOsI/Zzhe/lw1S3jrsCUF+qaTEf0qOccbE/bVtEMxj4PKJjp/6tL4jN?=
 =?us-ascii?Q?SbuhxdjMvyoIImxZhuy04HD/uspUk4/arAJjdLGo4pgLbeIdKOuGHjFwb9CE?=
 =?us-ascii?Q?Rw9EgzKbHlr+8pjindwp06bhXcqqT656K9Lj3R69dxzbJGxTwlE0nZYAQAWG?=
 =?us-ascii?Q?JWfAVViCSvZFJPUoMP3RvpYmXCR7lOnu5yaHn1hlCjrXVFOF/ulIpM4Lhzz+?=
 =?us-ascii?Q?abJ6gKpALj8T//+3ws4SUWXonClhWUH5avwD4yuGCtgtEAkwAxq9M2RTBOzE?=
 =?us-ascii?Q?enf1iUjOdIpTA5mgTaZzC2RGjGpw+pEbg3Q7wjEF1w6kxp2fFhdfu7GCvhgw?=
 =?us-ascii?Q?wKONq/D1ASsg55tg7E8xWFeV26bIAcHEBurzoJ7xe2Kf?=
Content-Type: multipart/alternative;
	boundary="_000_IA1PR11MB73203EA21C1DC3257EE94C80908C2IA1PR11MB7320namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ccc629-b237-49d9-de97-08dcc03dd26a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 10:58:13.5088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wUrKfLNCVlDL7E9UPh9wGxz5Z6fYC3zGKFWbOMg0lBA3vhjSJh9mPlRFFJTpsWANQRibvegpOWbbrzzyAGpfvsjHLAGyBXO2rC7kwtTJe4S51/jF4DM0FAtGSewBmF2C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5059
X-Authority-Analysis: v=2.4 cv=PszBbBM3 c=1 sm=1 tr=0 ts=66c3254b cx=c_pps a=l9lnEPKonMfu/vbXsUzXcw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=_EeEMxcBAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=ei4SEBeUAAAA:8 a=52mdeZd8sWgJSgSe30wA:9 a=CjuIK1q_8ugA:10 a=m5Prkr60LOIA:10 a=pbxqds3gQIwA:10 a=mD-5BrbJpi4zfCQ8:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=syqr5EOPB93U0NEwqYpB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=8zIOOLb7Ym0NljyPXbuS:22
X-Proofpoint-ORIG-GUID: vg_IKNYBr00Q2wfgrfn9ar3rrlyt4nOl
X-Proofpoint-GUID: 9PPlBnYtfNRK4xhNG-v3KVPRIg44LPqB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_10,2024-08-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2407110000 definitions=main-2408190073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 10:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203503

--_000_IA1PR11MB73203EA21C1DC3257EE94C80908C2IA1PR11MB7320namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

The exception list 'exclude_packages' in meta/lib/oeqa/selftest/cases/repro=
ducible.py is already empty.

Thanks,
Deepesh

Get Outlook for Android<https://aka.ms/AAb9ysg>

________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Monday, August 19, 2024 4:24:31 PM
To: Varatharajan, Deepesh <Deepesh.Varatharajan@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; MacLeod, Randy <Randy.MacLeod@windriver.com>; Gowda, Naveen <=
Naveen.Gowda@windriver.com>; Moodalappa, Shivaprasad <Shivaprasad.Moodalapp=
a@windriver.com>; Kokkonda, Sundeep <Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [scarthgap][PATCH] rust: rustdoc reproducibility iss=
ue fix

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

This is the same patch as the previous one, and doesn't address my comment.

Alex

On Mon, 19 Aug 2024 at 12:51, deepesh.varatharajan via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> The 'codegen-units' option split the crate into multiple compilation unit=
s for parallel compilation.
> Currently, this split is causing the rustdoc to generate differnt binary =
between the builds.
> To fix this the codegen-units & the lto options are disabled.
>
> More info about options:
> https://doc.rust-lang.org/cargo/reference/profiles.html#codegen-units
> https://doc.rust-lang.org/rustc/codegen-options/index.html#lto
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  ...ue-fix-cargo-config-for-codegenunits.patch | 29 +++++++++++++++++++
>  meta/recipes-devtools/rust/rust-source.inc    |  1 +
>  meta/recipes-devtools/rust/rust_1.75.0.bb     |  1 +
>  3 files changed, 31 insertions(+)
>  create mode 100644 meta/recipes-devtools/rust/files/rustdoc-repro-issue-=
fix-cargo-config-for-codegenunits.patch
>
> diff --git a/meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-car=
go-config-for-codegenunits.patch b/meta/recipes-devtools/rust/files/rustdoc=
-repro-issue-fix-cargo-config-for-codegenunits.patch
> new file mode 100644
> index 0000000000..fdb2a4a498
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-cargo-conf=
ig-for-codegenunits.patch
> @@ -0,0 +1,29 @@
> +commit e2e7017350d0b5324811fef3b841f98b00273887
> +Author: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> +Date:   Fri Jul 26 06:35:59 2024 -0700
> +
> +    rust: rustdoc reproducibility issue fix
> +
> +    The 'codegen-units' option split the crate into multiple compilation=
 units for parallel compilation.
> +    Currently, this split is causing the rustdoc to generate differnt bi=
nary between the builds.
> +    To fix this the codegen-units & the lto options are disabled.
> +
> +    More info about options:
> +    https://doc.rust-lang.org/cargo/reference/profiles.html#codegen-unit=
s
> +    https://doc.rust-lang.org/rustc/codegen-options/index.html#lto
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
> +---
> +--- a/.cargo/config.toml
> ++++ b/.cargo/config.toml
> +@@ -3,3 +3,7 @@
> +
> + [source.vendored-sources]
> + directory =3D "vendor"
> ++
> ++[profile.release]
> ++codegen-units =3D 1
> ++
> +
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
> index b14221b6cb..4ffc9faf18 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -13,6 +13,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-$=
{RUST_VERSION}-src.tar.xz;n
>              file://target-build-value.patch;patchdir=3D${RUSTSRC} \
>              file://0001-Handle-vendored-sources-when-remapping-paths.pat=
ch;patchdir=3D${RUSTSRC} \
>              file://repro-issue-fix-with-v175.patch;patchdir=3D${RUSTSRC}=
 \
> +           file://rustdoc-repro-issue-fix-cargo-config-for-codegenunits.=
patch;patchdir=3D${RUSTSRC} \
>  "
>  SRC_URI[rust.sha256sum] =3D "4526f786d673e4859ff2afa0bab2ba13c918b796519=
a25c1acce06dba9542340"
>
> diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-dev=
tools/rust/rust_1.75.0.bb
> index c33f31d261..7cd34a61c3 100644
> --- a/meta/recipes-devtools/rust/rust_1.75.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
> @@ -132,6 +132,7 @@ python do_configure() {
>      config.add_section("rust")
>      config.set("rust", "rpath", e(True))
>      config.set("rust", "remap-debuginfo", e(True))
> +    config.set("rust", "lto", "\"off\"")
>      config.set("rust", "channel", e(d.expand("${RUST_CHANNEL}")))
>
>      # Whether or not to optimize the compiler and standard library
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203501): https://lists.openembedded.org/g/openembedde=
d-core/message/203501
> Mute This Topic: https://lists.openembedded.org/mt/107977579/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--_000_IA1PR11MB73203EA21C1DC3257EE94C80908C2IA1PR11MB7320namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"auto">Hi Alex,</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">The exception list 'exclude_packages' in meta/lib/oeqa/se=
lftest/cases/reproducible.py is already empty.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Thanks,</div>
<div dir=3D"auto">Deepesh</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"auto">
<div><br>
</div>
Get <a href=3D"https://aka.ms/AAb9ysg">Outlook for Android</a></div>
<div id=3D"mail-editor-reference-message-container" dir=3D"auto"><br>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"divRplyFwdMsg" style=3D"font-size: 11pt;"><strong>From:</strong>=
 Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<strong>Sent:</strong> Monday, August 19, 2024 4:24:31 PM<br>
<strong>To:</strong> Varatharajan, Deepesh &lt;Deepesh.Varatharajan@windriv=
er.com&gt;<br>
<strong>Cc:</strong> openembedded-core@lists.openembedded.org &lt;openembed=
ded-core@lists.openembedded.org&gt;; MacLeod, Randy &lt;Randy.MacLeod@windr=
iver.com&gt;; Gowda, Naveen &lt;Naveen.Gowda@windriver.com&gt;; Moodalappa,=
 Shivaprasad &lt;Shivaprasad.Moodalappa@windriver.com&gt;;
 Kokkonda, Sundeep &lt;Sundeep.Kokkonda@windriver.com&gt;<br>
<strong>Subject:</strong> Re: [OE-core] [scarthgap][PATCH] rust: rustdoc re=
producibility issue fix<br>
</div>
<br>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
This is the same patch as the previous one, and doesn't address my comment.=
<br>
<br>
Alex<br>
<br>
On Mon, 19 Aug 2024 at 12:51, deepesh.varatharajan via<br>
lists.openembedded.org<br>
&lt;deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org&gt; wrote:<=
br>
&gt;<br>
&gt; From: Deepesh Varatharajan &lt;Deepesh.Varatharajan@windriver.com&gt;<=
br>
&gt;<br>
&gt; The 'codegen-units' option split the crate into multiple compilation u=
nits for parallel compilation.<br>
&gt; Currently, this split is causing the rustdoc to generate differnt bina=
ry between the builds.<br>
&gt; To fix this the codegen-units &amp; the lto options are disabled.<br>
&gt;<br>
&gt; More info about options:<br>
&gt; <a href=3D"https://doc.rust-lang.org/cargo/reference/profiles.html#cod=
egen-units">
https://doc.rust-lang.org/cargo/reference/profiles.html#codegen-units</a><b=
r>
&gt; <a href=3D"https://doc.rust-lang.org/rustc/codegen-options/index.html#=
lto">https://doc.rust-lang.org/rustc/codegen-options/index.html#lto</a><br>
&gt;<br>
&gt; Signed-off-by: Sundeep KOKKONDA &lt;sundeep.kokkonda@windriver.com&gt;=
<br>
&gt; Signed-off-by: Deepesh Varatharajan &lt;Deepesh.Varatharajan@windriver=
.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; ...ue-fix-cargo-config-for-codegenunits.patch | 29 +++++++++++++=
++++++<br>
&gt;&nbsp; meta/recipes-devtools/rust/rust-source.inc&nbsp;&nbsp;&nbsp; |&n=
bsp; 1 +<br>
&gt;&nbsp; meta/recipes-devtools/rust/rust_1.75.0.bb&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 1 +<br>
&gt;&nbsp; 3 files changed, 31 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-devtools/rust/files/rustdoc-repr=
o-issue-fix-cargo-config-for-codegenunits.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-=
cargo-config-for-codegenunits.patch b/meta/recipes-devtools/rust/files/rust=
doc-repro-issue-fix-cargo-config-for-codegenunits.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..fdb2a4a498<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-cargo-c=
onfig-for-codegenunits.patch<br>
&gt; @@ -0,0 +1,29 @@<br>
&gt; +commit e2e7017350d0b5324811fef3b841f98b00273887<br>
&gt; +Author: Sundeep KOKKONDA &lt;sundeep.kokkonda@windriver.com&gt;<br>
&gt; +Date:&nbsp;&nbsp; Fri Jul 26 06:35:59 2024 -0700<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; rust: rustdoc reproducibility issue fix<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; The 'codegen-units' option split the crate into mu=
ltiple compilation units for parallel compilation.<br>
&gt; +&nbsp;&nbsp;&nbsp; Currently, this split is causing the rustdoc to ge=
nerate differnt binary between the builds.<br>
&gt; +&nbsp;&nbsp;&nbsp; To fix this the codegen-units &amp; the lto option=
s are disabled.<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; More info about options:<br>
&gt; +&nbsp;&nbsp;&nbsp; <a href=3D"https://doc.rust-lang.org/cargo/referen=
ce/profiles.html#codegen-units">
https://doc.rust-lang.org/cargo/reference/profiles.html#codegen-units</a><b=
r>
&gt; +&nbsp;&nbsp;&nbsp; <a href=3D"https://doc.rust-lang.org/rustc/codegen=
-options/index.html#lto">https://doc.rust-lang.org/rustc/codegen-options/in=
dex.html#lto</a><br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [oe specific]<br>
&gt; +<br>
&gt; +Signed-off-by: Deepesh Varatharajan &lt;deepesh.varatharajan@windrive=
r.com&gt;<br>
&gt; +---<br>
&gt; +--- a/.cargo/config.toml<br>
&gt; ++++ b/.cargo/config.toml<br>
&gt; +@@ -3,3 +3,7 @@<br>
&gt; +<br>
&gt; + [source.vendored-sources]<br>
&gt; + directory =3D &quot;vendor&quot;<br>
&gt; ++<br>
&gt; ++[profile.release]<br>
&gt; ++codegen-units =3D 1<br>
&gt; ++<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes=
-devtools/rust/rust-source.inc<br>
&gt; index b14221b6cb..4ffc9faf18 100644<br>
&gt; --- a/meta/recipes-devtools/rust/rust-source.inc<br>
&gt; +++ b/meta/recipes-devtools/rust/rust-source.inc<br>
&gt; @@ -13,6 +13,7 @@ SRC_URI +=3D &quot;<a href=3D""></a>https://static.r=
ust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <a href=3D"file://target-build-value.patch;patchdir=3D${RUSTSRC}">f=
ile://target-build-value.patch;patchdir=3D${RUSTSRC}</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <a href=3D"file://0001-Handle-vendored-sources-when-remapping-paths=
.patch;patchdir=3D${RUSTSRC}">
file://0001-Handle-vendored-sources-when-remapping-paths.patch;patchdir=3D$=
{RUSTSRC}</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <a href=3D"file://repro-issue-fix-with-v175.patch;patchdir=3D${RUST=
SRC}">
file://repro-issue-fix-with-v175.patch;patchdir=3D${RUSTSRC}</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch;patc=
hdir=3D${RUSTSRC}">
file://rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch;patchdir=
=3D${RUSTSRC}</a> \<br>
&gt;&nbsp; &quot;<br>
&gt;&nbsp; SRC_URI[rust.sha256sum] =3D &quot;4526f786d673e4859ff2afa0bab2ba=
13c918b796519a25c1acce06dba9542340&quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-=
devtools/rust/rust_1.75.0.bb<br>
&gt; index c33f31d261..7cd34a61c3 100644<br>
&gt; --- a/meta/recipes-devtools/rust/rust_1.75.0.bb<br>
&gt; +++ b/meta/recipes-devtools/rust/rust_1.75.0.bb<br>
&gt; @@ -132,6 +132,7 @@ python do_configure() {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config.add_section(&quot;rust&quot;)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config.set(&quot;rust&quot;, &quot;rpath=
&quot;, e(True))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config.set(&quot;rust&quot;, &quot;remap=
-debuginfo&quot;, e(True))<br>
&gt; +&nbsp;&nbsp;&nbsp; config.set(&quot;rust&quot;, &quot;lto&quot;, &quo=
t;\&quot;off\&quot;&quot;)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config.set(&quot;rust&quot;, &quot;chann=
el&quot;, e(d.expand(&quot;${RUST_CHANNEL}&quot;)))<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Whether or not to optimize the compile=
r and standard library<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#203501): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/203501">
https://lists.openembedded.org/g/openembedded-core/message/203501</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10797757=
9/1686489">
https://lists.openembedded.org/mt/107977579/1686489</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [alex.kanavin@=
gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</span></font><br>
</div>
</body>
</html>

--_000_IA1PR11MB73203EA21C1DC3257EE94C80908C2IA1PR11MB7320namp_--

