Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05131C54788
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 21:37:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.633.1708551429113639748
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 13:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=enWiPCzH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=27818d3471=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41L4cLZK021731
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 13:37:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=GbUNhJ3VpgswkQF+R5H
	EboyTq8p9yowcjkK0KnmAFyU=; b=enWiPCzHMTmVhyATc6OKwGGQb8GcIx86pR1
	rZI/0eOSHv+vKtIzm439r5dTBMAg//pyjjZ3k4onJIIbjbrMD2mzY/d04IG8WVkB
	Ac0TX+NVVugC0CL06CzO4EqSPozcDskmMIBmz9ue69juYKivJQ5fNjqaqXH+Pp5E
	xAYKLvKTm/qTD3kL9Pp8sdt08RcMQAkSuVB+pnyaehTwg7TmOt+c11PKv4lLam5A
	PHxtqNkBrcTS2bHYl/yO3Tb9hbJv0hpj51el4yorROlXcv5NVbijsEXsj/VGKUtt
	tUGE1wzBhJZmkt0Co5yZKpTPTGDSHBitNS98CNGVJ9u8/JWp6QA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wd20csa99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 13:37:08 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41LLb7SW031693;
	Wed, 21 Feb 2024 13:37:07 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wd20csa98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 13:37:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=joxB+a3DjPm25Rf98TM2zMiNO9whGCEESwDivrdN7WFWl1CQik53ueWkiLVr36XRNdfuL+5+RcHYeck5aK9HG62gAKxY+eLrtHKdKpm4A3hzi8KPaWfoo/dzNdwnIejhCW68l0JY0YcWSuuBacOmcXopduINtRplpJDy5OvolBHg79AEPFE19OStPuYUFCqVBlShOorDBlmooVDY775FWW+yNG/zbOrWFYT24YLao5Fchw4OErwnAIi7A5q5pZbJj7vYWe5G36fur7d9INXAArVCnX+alDCZSZJ1OTm/0pe7/A9OBOO6MWW3+038R8Sc0AyntJMxjliIMVN1nhF31w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbUNhJ3VpgswkQF+R5HEboyTq8p9yowcjkK0KnmAFyU=;
 b=dwTVTmyqosCUvGcq0dh1zEcWl9UjtERsTiRCPYqjXq/XS5hsuTcpzbqbpxcMqWCCH3rG3sHubfP8djTInB/poFbJyktVGdcjodn3zKJLwJpZmOXyRPaugg1NfMevzzOe7r2RBcJA0FYugTH+tADRhxI3VAcH3CPfWjPBMWCXMwyqKSn/47g5puTsshg8Dp+kJWE0m5jeSGHZJgyfPJKuVKNZhqS/E3lsWXQz+INyuwS0KOLYJwLbZmJO4Ft1aaT2FQ8t5taaSO38+1b+6RC3IfvO52Y2OinEy7WUZEZHVowmaGilCgL3nvi6T59oLCw9K07QqMd0SVl9TMY42L/ygQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by MN0PR11MB6060.namprd11.prod.outlook.com (2603:10b6:208:378::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Wed, 21 Feb
 2024 21:37:02 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::f3ba:ff33:12be:cff7%7]) with mapi id 15.20.7292.042; Wed, 21 Feb 2024
 21:37:01 +0000
Content-Type: multipart/alternative;
 boundary="------------bXWwRVfa62auJFHTHvu4B0rl"
Message-ID: <b83edeb7-62c3-43af-80cf-c22f2e4041e4@windriver.com>
Date: Wed, 21 Feb 2024 16:36:58 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] sanity.bbclass: raise_sanity_error if /tmp is
 noexec
Content-Language: en-CA
To: alex.kanavin@gmail.com, Ross Burton <ross.burton@arm.com>,
        "michalwsieron@gmail.com" <michalwsieron@gmail.com>
Cc: ChenQi <Qi.Chen@windriver.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20240209140939.186588-1-michalwsieron@gmail.com>
 <94AE8BC1-9AA9-4DFB-B7B6-80CC83897ACD@arm.com>
 <b128ef22-03b4-ebd7-1b2d-40b2d8ab2201@windriver.com>
 <461776CF-3A33-4053-9FCA-009B4BA98246@arm.com>
 <CANNYZj9N5SyTPoJas+Zb5rJ9ztQRke_roNZ2cBafXo-5zhDsDQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CANNYZj9N5SyTPoJas+Zb5rJ9ztQRke_roNZ2cBafXo-5zhDsDQ@mail.gmail.com>
X-ClientProxiedBy: BYAPR11CA0058.namprd11.prod.outlook.com
 (2603:10b6:a03:80::35) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|MN0PR11MB6060:EE_
X-MS-Office365-Filtering-Correlation-Id: a4723184-ed86-4727-bda7-08dc33253d6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OuADSef+kTIiwj6QMrUK+SBZEJCAV6CHzF4c2iIyYeQj5PmjaFHeWZMvd3vpjo/IWcoRku9VDc98Ui9RI8MWT5ihQBnRaLOU3RFJWODRKRkjitDKvvBPPwd02L8dDwXA09xLKlseUR9DV3tzptYTR7AVv44AnwoGzT1APXMGVgNxNOW3OfnNdQolYbNjwzu3kUAVCilhVfjIBfDqJngGaSOhwnostAGXNoYOeipqNzB3pByG6DdlEBhtZvuyqdUZawTuhPVpzsstGzkQhh+OSuY0Wvvft5LO2Um7xNJkQ/uJ1wPtEHjFvJg4DUm4d7bK+FrNvqXk4d71Rf9mhNd+DTwlmdn7Obu/82cTCJ5aCpbj56a/whnUYQykjHOlfKn1KDUWuHB38vtS5Qnq1gjk10ii9t4WsR/vdMwUFWHqHMFiCPXmoJjwo1iwEWXjUHfyDONu+M1XvG1MMhaVZGloMudR9c0K5OWOm1cDBsoyA6mLpOMqs7+/uKakYm+A5rMMPMC7RWON/LvwZras6Y1ggA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QmJUcHhKeGZ1emo4MGgvSDRpRXpRM0lvcTNpbUZSVmh6cWwxNjc4WVF6K2lI?=
 =?utf-8?B?c2U4WFZxUkJOMitLR0k3TGhjd0JSYTNHSGx6MTRoaU1DNHNZMmhJaXl0Z0pS?=
 =?utf-8?B?eWtHamhGTVM5V3hUNEZZazJlL3RsUGMvUDY1bzVXS0VhdUdrWHlzbnZVSFlz?=
 =?utf-8?B?b05vR01Pd2hib2F4MFZsVnV4VFBjUGUyaThLbDhoYldLcG94UW52aEtsUXN4?=
 =?utf-8?B?NmUvS0lvRUdqQ091WGEyKzM0c1ZMc09DUG9sWUhzZTRDT2pFU1BKMFVLZWZG?=
 =?utf-8?B?dHNhTDVoYXp5WnVpczBwSEtoTUZaMEE4eGRvRjBWdEtJRjhRYXdGdkxKTFZ1?=
 =?utf-8?B?cHB4YU1JMGREYURMWFFRbEc4U0RSVmoxNDE2ZStoVm9qSzhaMEVFOUNtT1R2?=
 =?utf-8?B?ZWpVekNjanhUMkJxeHlNUURLSWdDb1RHekZrVEtFRGE3YlYwRkxUNWdLYXha?=
 =?utf-8?B?RFl6TDdndUdSYWo2YlowbldTdmRjRUxRdG5ydWtBbGlFdGtlaWZqUHlQcjd6?=
 =?utf-8?B?OEpua3FSVGFHbENma2d4YTVXTXMzbUZ2bHVUcTREMExNUGRYZG5LNlVpL3NO?=
 =?utf-8?B?WCtiaXV4d05oa3pqOHo2L1JuL1E1ODRJSHY4Vk9reFI5Y1BnanBBcTZBT1No?=
 =?utf-8?B?Ukp3dEZQVnlVaGdsWG9rWVJXSjNoU1VoOHF1Y2lLd3k5NEYzTkhJY25BRWhT?=
 =?utf-8?B?ZTlxYXlPT0ZnVFlMY3JrendlY3dOK0VzMWRqb3BDVG9KZEg3b3Q5RjFOOWlG?=
 =?utf-8?B?cGdaL2h6QWJXRWp0blJIdUQzaE95czdoUUhyekx3cEMrUU9yWU5ubXVLTmJS?=
 =?utf-8?B?RG9tYk1DSmswMDBneGdiM0lZYVA2RTQ5cUZ2OExCYUZVUnltQVFDekloL3dv?=
 =?utf-8?B?N0djcllYeHZ1K0pmVFdIeFkrUVdMWk5tWnZKUFVaMmdXMGxZeDliZkpUb2V0?=
 =?utf-8?B?am5MbHFuT0FrT2lPWFZuUW51WHJ2LzB4VVJKOXpvNytVVDVuWTNVTGNYUVhz?=
 =?utf-8?B?Z0lXQXA1R2JzYytOMHlsRUZIR2trYnhhRktMTGxvM3orU290bzVwZE9RV0Rn?=
 =?utf-8?B?U0pMZ0QrRTJMNnppN29IcUF6cFFyRit4K1ZrbHlsbURieW4vUDczTjFnZXpx?=
 =?utf-8?B?NEhzMTFaQjdXZTRWcjl1eGs2MkE2Y2xGblI2dFdyK1FEYjNlb0ZYeENwRUpQ?=
 =?utf-8?B?SXEvUFJkY3Y1TldFdGt2VndmQ2tQWU9yQ1BEVVNTeTY4Zm5mODJ5cHdRbzkz?=
 =?utf-8?B?UGdiQmkvQXpDMzNRTXduTENtNFRHTGViKzl4ejVtT3pDY0JpamZIRHdrS3RE?=
 =?utf-8?B?TnZ3a0J0bndCSTVhS2t4cUFyV29iSFRoZ3FSOGk2ZXBveU5WTlJkblVLWitG?=
 =?utf-8?B?STJTNjhKcmliM0xiZmlsb2lOd01kKzdvRXhqMHNIMHloWTl1Wm5xaCt2bVor?=
 =?utf-8?B?dEtualFhZXpXa0ZxY3AxT0xLODUvczlmQklFWE51c0lEMjZEcWhsNHU3YU5m?=
 =?utf-8?B?QzVsVDByaEQ1d3RPWGIvQll0KzZqQ0tnK1FlY0Y1TWs2NVVSZ3ZiMXdyVEFK?=
 =?utf-8?B?UjRlZzI5UzFVclhiTnFNYlJQNzQ5SDFDMUE5OWRBbUFMNUFVdjdVcHh6d3N5?=
 =?utf-8?B?cE4xL0c4ZzJzZ1o2Ykw4NHlIdlAveGFWSnhqU25xM2FCajhrTUVPYVFyZVFj?=
 =?utf-8?B?TDVOL1cyeWJ4OWg1K0hkblYzN1VQZ3FGMmRLcmV0L3VGZDFqa20xcGk3dVh1?=
 =?utf-8?B?Sk9MTXJab0hJZkNNTXpXb3Q5NFQwTmkzZThXMi9QODh4bjdoS0NWT0ZLMHpN?=
 =?utf-8?B?SGIvZVVpVnZ5bU5rNVhMY0QzcnJFbEFYZytVek9lMDJvdXdVR1FWN0kvQzZn?=
 =?utf-8?B?ZzN2aHUxT29aYlJYUWFMcWxsM09Pb2dnc1RRUXdiMGdPckxrNlVYUlQyRlJr?=
 =?utf-8?B?Njg2OFR1YTNqUXBMMVFFYUwvRkVaNU1zTXZmT0RvQmxjcmN6VE1rY3hyNVQ1?=
 =?utf-8?B?c2kvajZOdWVhdTIrRjJBT2ZEcVUxVUpzMzU3akI0S2V0b05LOGR6TWpNd3pZ?=
 =?utf-8?B?YThuemFkZXROQXpqWitJeERyT0FycHVPZjVsRWNoWVJJVjk0MmlWU240V1hU?=
 =?utf-8?B?VEZJMmxnNTk1b0ovWWR4WHhkQ2RDWTcvVUQ5Vmd4Q3RQTVVQMVJhRDF3eE9X?=
 =?utf-8?B?NUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4723184-ed86-4727-bda7-08dc33253d6a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 21:37:01.8016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5xmru2AfLRXYcKiCxgj213QAjqtnhYR413g5yw0UMpcoxE7XtGrfY8AUHwj+WmLYqxWhA4u8tnf1b7BpPsOCp2yafuNTvVvpDejxocnxGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6060
X-Proofpoint-GUID: wyqPS1DIOy1XNgkuBGn731lSvUatZfTr
X-Proofpoint-ORIG-GUID: FZRh4tYzBCK9jzpZplE2M0W8PlPapNjj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-21_09,2024-02-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 mlxlogscore=929 suspectscore=0 clxscore=1015 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402210169
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 21:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195998

--------------bXWwRVfa62auJFHTHvu4B0rl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41L4cLZK021731

On 2024-02-21 5:08 a.m., Alexander Kanavin via lists.openembedded.org wro=
te:
> On Wed, 21 Feb 2024 at 10:48, Ross Burton<ross.burton@arm.com>  wrote:
>> You _can_ export TMPDIR but that has to be done on a per-recipe/class =
basis very carefully as TMPDIR means something else to Bitbake.
>>
>> The problem is recipes that use mktemp to write files and execute them=
 (be it shell scripts, or as a place to write C and then compile in the s=
ame directory).  These will be in /tmp (again, we can=E2=80=99t set TMPDI=
R because for foolish historical reasons, TMPDIR is used by bitbake).
>>
>> We first noticed this with Meson where noexec /tmp meant the configure=
 tests failed. We worked around it at the time by assigning TMPDIR when c=
alling Meson, but since them Meson writes to its own build tree now.  Thi=
s has been seen before though, but luckily noexec /tmp is fairly unusual =
so I doubt this will break many builds.
> I'm actually curious where noexec /tmp can be observed. It does seem
> rare, because I think it's the first time someone came up with a
> sanity check for it. Perhaps it should be treated as a bug in that
> respective environment/OS/container?


We've been using noexec /tmp since 2019 with few if any problems

using:

meta-anaconda
meta-aws
meta-browser
meta-clang
meta-cloud-services
meta-dpdk
meta-imx
meta-intel
meta-intel-qat
meta-iot-cloud
meta-lat
meta-mingw
meta-openembedded
meta-qt6
meta-raspberrypi
meta-realtime
meta-secure-core
meta-security
meta-selinux
meta-tensorflow
meta-virtualization
meta-xilinx
meta-xilinx-tools
meta-yocto


Michal, what problem are you seeing?

../Randy


>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195965):https://lists.openembedded.org/g/openembedd=
ed-core/message/195965
> Mute This Topic:https://lists.openembedded.org/mt/104258828/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------bXWwRVfa62auJFHTHvu4B0rl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41L4cLZK021731

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-02-21 5:08 a.m., Alexander
      Kanavin via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj9N5SyTPoJas+Zb5rJ9ztQRke=
_roNZ2cBafXo-5zhDsDQ@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Wed, 21 Feb 2024 at 10:48=
, Ross Burton <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ross.burt=
on@arm.com">&lt;ross.burton@arm.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">You _can_ export TMPDIR bu=
t that has to be done on a per-recipe/class basis very carefully as TMPDI=
R means something else to Bitbake.

The problem is recipes that use mktemp to write files and execute them (b=
e it shell scripts, or as a place to write C and then compile in the same=
 directory).  These will be in /tmp (again, we can=E2=80=99t set TMPDIR b=
ecause for foolish historical reasons, TMPDIR is used by bitbake).

We first noticed this with Meson where noexec /tmp meant the configure te=
sts failed. We worked around it at the time by assigning TMPDIR when call=
ing Meson, but since them Meson writes to its own build tree now.  This h=
as been seen before though, but luckily noexec /tmp is fairly unusual so =
I doubt this will break many builds.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">I'm actually curious where n=
oexec /tmp can be observed. It does seem
rare, because I think it's the first time someone came up with a
sanity check for it. Perhaps it should be treated as a bug in that
respective environment/OS/container?</pre>
    </blockquote>
    <p><br>
    </p>
    <p>We've been using noexec /tmp since 2019 with few if any problems</=
p>
    <p>using: <br>
      <br>
      meta-anaconda<br>
      meta-aws<br>
      meta-browser<br>
      meta-clang<br>
      meta-cloud-services<br>
      meta-dpdk<br>
      meta-imx<br>
      meta-intel<br>
      meta-intel-qat<br>
      meta-iot-cloud<br>
      meta-lat<br>
      meta-mingw<br>
      meta-openembedded<br>
      meta-qt6<br>
      meta-raspberrypi<br>
      meta-realtime<br>
      meta-secure-core<br>
      meta-security<br>
      meta-selinux<br>
      meta-tensorflow<br>
      meta-virtualization<br>
      meta-xilinx<br>
      meta-xilinx-tools<br>
      meta-yocto<br>
    </p>
    <p><br>
    </p>
    <p>Michal, what problem are you seeing?</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj9N5SyTPoJas+Zb5rJ9ztQRke=
_roNZ2cBafXo-5zhDsDQ@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Alex
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#195965): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/195965">https:/=
/lists.openembedded.org/g/openembedded-core/message/195965</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/104258828/3616765">https://lists.openembedded.org/mt=
/104258828/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------bXWwRVfa62auJFHTHvu4B0rl--

