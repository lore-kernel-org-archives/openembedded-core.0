Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2476C77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 11:38:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20313.1751542732781862526
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 04:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9279cb34ab=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5635dOvW017566
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Jul 2025 11:38:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j5m1dj2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 11:38:51 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 563BcpsI003362;
	Thu, 3 Jul 2025 11:38:51 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j5m1dj2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 11:38:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqQkxXVOimSGKMvgqCBYOESZI5vtEisO+l4wje3QgCIsL7oU6O9tofbRrxmnK75WX/j99CgxBkptPt9F7EqbYmAa5365UjyS5CSoRL+dtS/XtDhy41ZwheqvttMOWVsLvXAD/DWdiG7ZLUOUI0js+0OanWs1iDDRyPDsBPOwhT74mPAW6fZnhhJthuxrgtTVEmrGfSo/3jqZPHkiUXaAn3HfN83NSCcND6zM7GcMp8xr9trlJftQJTPaMnQxyDThiImeVGwbXUf/U/0+jF5mvt+VKwkji5CkySq+XTkLvSTFu51lm30W5mCqKol/6Q0ttfaFQtaVj+l7Lj6ZkYyOiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BW0XfTHXwyA5ubxecegd56C6jT//p5OMLQ5daY+hCPs=;
 b=uP8RGfWQDhqOCl3dO3kBcaTOYtS9XorNa568mMDCX0K9OKwRMXnhKqCjUst5/N0nI76+I9UA+GTL2zdJDU5zlOK8Q4NUfdv26ka4NayZSEdafaz4VtcuPzlxo5icrO32tdQy/lPueNQMhQkD9QEBBihUBbtGiDCpf+4v5w1BAaSGVvLCrytSvSBjanwXSHYhfKKV8rI9PgDbogemGroLbYTXudlW+nWOuI1SP4TZZsWLQ3i0X3FI2LCPPAQ45ZukxwTyQb5Ir9LrTLZoI7j1e9jpKTC48gR7OkDOw8/quewzWyluYlnnhz9mbwfOH719vOdZj6avtIz8wyQk+OrLow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SN7PR11MB7603.namprd11.prod.outlook.com (2603:10b6:806:32b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.37; Thu, 3 Jul 2025 11:38:47 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%5]) with mapi id 15.20.8880.021; Thu, 3 Jul 2025
 11:38:47 +0000
From: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>,
        Patches and discussions about the oe-core
 layer <openembedded-core@lists.openembedded.org>
Subject: GCC Patch removal - 0008-libtool.patch
Thread-Topic: GCC Patch removal - 0008-libtool.patch
Thread-Index: AQHb7A3PApzuEZRm2EmHPQ1qMuSgbA==
Date: Thu, 3 Jul 2025 11:38:47 +0000
Message-ID: 
 <DM8PR11MB5653BDE89A4EFB219A90C7E3EF43A@DM8PR11MB5653.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|SN7PR11MB7603:EE_
x-ms-office365-filtering-correlation-id: 071ec619-4886-48a3-8f9c-08ddba262c73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|13003099007|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?VoQIYz9Lt9rQb6Y0uCcYq5IZNl+N/3V2RtbmKWNyl+1lfeFchufyeZoBt0?=
 =?iso-8859-1?Q?eN1kKsPzLPNmI687o1xkbj3A2dMiVrBRi8g6dGPNbsj+6DpDgwvWG/ybGg?=
 =?iso-8859-1?Q?Cvkn3UuECVrRJB/yqMTJtpCEj+el1OmFocgB3R9A0XVzUBEpLMd42gbMGd?=
 =?iso-8859-1?Q?zA3UFf55tYrS9tG0E+rhiqvLmbLYcN9zInX9GRNnvQ17BsV/d1yvtLSt22?=
 =?iso-8859-1?Q?9bOmAKSfHGgOlH4bJPwGFxU3rFWVNm/ZfbU5tBP7Ob4cBQYYWh5z3sHbzv?=
 =?iso-8859-1?Q?OEB+DeX9Sou0FcIQLRf0IRlZ1mY09IKCAgcfbQAnQID9Q2jIBvSEM5e0Cz?=
 =?iso-8859-1?Q?is5Y/iH+69+8AUi7gdQ7QBYjCpH0NSUw9KrrH7LjDP6QW8haoOnkhi7WMe?=
 =?iso-8859-1?Q?W9nwwrEaAGGWt3Q/CKk6j6wnXxVMoRL1C1WIdWD99JTuXDnXb+ltxfmBdm?=
 =?iso-8859-1?Q?oVAse9ZmRfPtNC+YD5e0tHXpLvYIcXQ2GO+wCRe8wUVT2KR0ac60B7fIO+?=
 =?iso-8859-1?Q?L/q2zgg920hNgCrAQUUjB5v/P2RJ1VMYppTcnQDYlwoVjfuxOCZAfDJzzL?=
 =?iso-8859-1?Q?7bre95jRkoVmvb6J8dOhmecghvA6Uq+sTDncMFEr5iHCleMzLIqv/Sf4Ru?=
 =?iso-8859-1?Q?xast7IgtNrWyOF1pv+QqxXepc1/PQtcbTc8JXfiaAOmSO/ylsRLy+A+q47?=
 =?iso-8859-1?Q?13OpBgqjEv/rkuB16/wwrCQIBp1hB4ashqDhJ01kVhhcohjOeDrDH6F8xY?=
 =?iso-8859-1?Q?ogRgKOc4dbQwv9Vo+ldRfaMqnaYfqevXuIKYCAF6Awaz++jPffuqBK5Uyc?=
 =?iso-8859-1?Q?i0EP1IOnLXJSoe9NBRi+vTOxuaHfiI9mNcz5MErpnddIMowhMbjRXaXl3h?=
 =?iso-8859-1?Q?5H6dZDV7gpX07yU//T/+9x26wj4jpcq8L+Ah1DL3RJ9eWz+ihXoDokw3vV?=
 =?iso-8859-1?Q?kEchLqGPSa9N/oLG27sDL04p4Cdb08HrqQow6APrjjH8VLX4AU8lLCCW/e?=
 =?iso-8859-1?Q?HAp701ihQqBftF9zGnhJaUADL9bKLdFHGIHnuS4upUlT3BgMMkMiqkvUet?=
 =?iso-8859-1?Q?+x2ahaUBoPCYovuBohDOKIu0EOP/5VMJaoPPzXpEeZ1o0tffhairajvx+0?=
 =?iso-8859-1?Q?bPupuVNFf2d1JPnldoNFo9Q8iEl48AiFEG74fONIxIviBkhFqKuV1R7enI?=
 =?iso-8859-1?Q?FThQ/5EvrI/X6LMeQpsJb6MUwDAaEpuNod5bKXtFxz7xL/whRrRvJNvRFO?=
 =?iso-8859-1?Q?ki7PvNYxjeGajjwwDCQhOjyxxTi0NcDzhUzz2yXkXgkAcpZOmQy8cgNT+m?=
 =?iso-8859-1?Q?LtYScBUHb1h4nnu8OLDDWNJQArqf9eV4AHI8ZvkOMmgBs9tlZqnY+/smu7?=
 =?iso-8859-1?Q?iJGmcnkICRt/jUuFIUZqlY/rIUcyQ78Ey8zk2rwNkQNuxXug7sTrePtkNI?=
 =?iso-8859-1?Q?tCtHPFGt7tYOkZ93nteFThoA8uGH0Lwrfb+7pxe+5i6jDmC7xuTxkxp07X?=
 =?iso-8859-1?Q?uRG8j9dRijVaGkcIG2n+3q8vGX/kdSP7xrNvfdVv4hkZpB9+yVHW29k8qt?=
 =?iso-8859-1?Q?MAbBu6g=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?fP4DxIHJjaN9aP52Yty2np3i66BSZafnhueH607Xz4/6OP8VzqelWIED7B?=
 =?iso-8859-1?Q?yVOG6oMsLeewcrJJyNgi+la5n+HdB0Aybst6KZvGvKrAyp/V33seI9KDgO?=
 =?iso-8859-1?Q?EUyGUwkPl/GQb21iUhr2eSKOfl5r/IGqIzyMX3W1qRTuCYU9kMveqgUzrp?=
 =?iso-8859-1?Q?Sgesp1JycTnOp3Yt9h5JYgpe03j5TEG5xKoQwodCVyLGsr9ob5RrCvwIFd?=
 =?iso-8859-1?Q?7g842ecVMxlJthD4+TnwoESk0j3kcpCuejJQAUD4TzrZZIoutC6yhpz3E5?=
 =?iso-8859-1?Q?gA8uixtAppdYmEEglnlbl+iQW734oPI8oxkNdMM7kNVv2gaeh0dVAMbTe0?=
 =?iso-8859-1?Q?vXCSGGUr+IaIjJturi7s8hPMnOPwqmImue03Feo3qAvsEXqR1oiMediiy/?=
 =?iso-8859-1?Q?yuFIaVyFNZgS7Ruey32FHrLq+NiYopsW3j9uUWIJuXj9tGmcRdY5ZdFb8L?=
 =?iso-8859-1?Q?ev/+jPKxRiFvSVEB8iPcC5ZP1gZkuO0e2D1e7UKeJxdrmh17u0LgcXqAdc?=
 =?iso-8859-1?Q?7vmS08+wcbZr8c6LL+JUDKanwVHnGCgQ6POLmqUKvLMq7crhgCs1W0q53n?=
 =?iso-8859-1?Q?BpjU+0bZeYvyHEWoA1Vma7LKmBn6H4FgH2TaEeHAdOZEpv0BAZE8WHUZQ7?=
 =?iso-8859-1?Q?WSmPMdSnn8VyK+gnCEQYEdjyHHf8D6+4WYSlwjx+sSM1mBBg7gbUmFAxVK?=
 =?iso-8859-1?Q?P/KpkpsplbhLKYVyB5zSwjy5S0WePJWOqFZkiwInxezbAYhXPfupPcCc20?=
 =?iso-8859-1?Q?g/AOLKeWEE1Pqnhmxe5AoKHDW3fXce6uxlBeYg3y2IeLQwtAYwtMqO4ZT4?=
 =?iso-8859-1?Q?ktNJaGdx6UMCBCk1LJVteUS6x6Dy+KVpNO9O4iVDIVWWNCZzmNHLZqIRcB?=
 =?iso-8859-1?Q?8XuCDNE42BjtkdswkzqMbOJIxd610WVpckCpzBf/xVlD3h5gAR2u6EAE1J?=
 =?iso-8859-1?Q?PcP3yVEsa4jBZgaTyBkFHFEqGHC2zkUbXlZlNn/wGYQsH4e+EFHk7CNVTX?=
 =?iso-8859-1?Q?JdygopHtVyo8OEKWmLpyCFIrzLKaHWY1bPjSkv7M/kIO9es6eeBe0b8UI3?=
 =?iso-8859-1?Q?0l5VaXOMdkcRwN3QDTNPXO70aiOvuwDOEUsuYnPq5lKTEgBblg9ZYtbW2G?=
 =?iso-8859-1?Q?//KdwPljb9sOrdVO/0yxK3NYBi3xY3hTSm/A2LXcdZoKaZNTBSkJ9YwLEN?=
 =?iso-8859-1?Q?BGO38sOunAQlKzrsDunEmGC6uGmSFXkr5/ROd0rGIALm0fLGxhenP4F+Nw?=
 =?iso-8859-1?Q?MVWt/rxaPnDNuwvj1r6ENpkaYKsgr++r9GpwMvdblzAe8og5WxjuA1j6l9?=
 =?iso-8859-1?Q?7IcR/ggD2ZZynAr9r7YWmuL8EKnCN2c/TI0eqEaw3s1NhVZ2ZEuiAS1mde?=
 =?iso-8859-1?Q?B5f1/8Khe24TEH51L/d2+ZfbALW+IJK4qSzAcLMlV4k5/s/NFHaTa01lqM?=
 =?iso-8859-1?Q?TWC8TjXhRE/0BSU5bgtZMTeHb1TR4xWUbEzDlrkgh3vlnWTCrapP2jdipw?=
 =?iso-8859-1?Q?u7Cga6tNVklDejhNle9zYTCrqEBR0O1gTcV+Xyo5Qxy0HqWQxyM8fJ4xSw?=
 =?iso-8859-1?Q?TokmEF83rXCYXgoSbCGqHgqXfYDVcCwQgXJn+6G6H/vSDjJO7VzewVaHE9?=
 =?iso-8859-1?Q?kcdite//gLIbKLeuzbSggYB64Pux/0iq2SOaKVAop2VHiS7FWxqXyzDg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR11MB5653BDE89A4EFB219A90C7E3EF43ADM8PR11MB5653namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 071ec619-4886-48a3-8f9c-08ddba262c73
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 11:38:47.1905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ax+D4o2/VgrqTivpueUHFpR5PPKOMDsANklVwMH8rcozKAydOnGOA9OwmXNA5PzJyQAa61fUdjRCgXMyEZ2iWZkGAy3oCNolnWXuhXzJsyY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7603
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA5NiBTYWx0ZWRfX4GYKvOia4ReW oGKp49nRX1EKCF4acFtOiCbDxITLg9ssHxUwiEdlA1ofkMj/W7Ffd7CeaVAnK25NLS4cw67I36F pZl3uy4cQvGY++se6udzj59DSDnHDNfc6dIE5DZ7ZDjjwcwVrLQ0v3l1lzbWGKv0vyje0iR4dK+
 0sJcCR5/sDL1KgdFu65Lvl0fUOhOlevC/bekvt/3B5LO+9Ij5yv/9IgWJtQdjd+KJWlef2MQTv2 /9b2PhsD2j2CXssDVj/XvadmxF1WiPOFg8Kyd6ygtVEFwkW10msFtooZ0plgfssUTSKoptrBnzQ bqTTxk9mdRrvohd9yVSqNcAZosRlxTLgt5bL9qZ+51sEa/YS7A8CIa3YtB089wzALeJHy59vQCO
 zZlXeQMd+RxOTG336Wa5JP6xm5O2uZsD8VNDWZo7eC4GDitKPcmB778ZzPCgMU4FQIlEbqNT
X-Authority-Analysis: v=2.4 cv=IOsCChvG c=1 sm=1 tr=0 ts=68666bcb cx=c_pps a=liEUPl06j6ly8OSD0KH+qw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=Q4-j1AaZAAAA:8 a=KOVHfdb1LPJyNfpPZl4A:9 a=wPNLvfGTeEIA:10 a=LP6SN_fC6SDjycBe:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: F-LWgrIEA3qwAMdDRd_xCwnmpz4Lvx_Q
X-Proofpoint-ORIG-GUID: k-KFfoeojFC6I_05iD8AfFuLge5XZa9e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507030096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 11:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219875

--_000_DM8PR11MB5653BDE89A4EFB219A90C7E3EF43ADM8PR11MB5653namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

This gcc patch https://git.openembedded.org/openembedded-core/tree/meta/rec=
ipes-devtools/gcc/gcc/0008-libtool.patch?h=3Dmaster modifies the libdir fro=
m "/usr/lib/../lib" to "/usr/lib" in the libstdc++.la file.

We removed this patch and rebuilt GCC using bitbake. We did not encounter a=
ny build or runtime issues. We tested building gcc, gcc-runtime, and core-i=
mage-minimal. After booting the image, we also tested libtool and a simple =
C program with the following commands:

$libtool --tag=3DCC --mode=3Dcompile x86_64-poky-linux-gcc -c hello.c
libtool: compile:  x86_64-poky-linux-gcc -c hello.c  -fPIC -DPIC -o .libs/h=
ello.o

$libtool --tag=3DCC --mode=3Dlink x86_64-poky-linux-gcc  -o hello hello.lo
libtool: link: x86_64-poky-linux-gcc -o hello .libs/hello.o

$x86_64-poky-linux-gcc hello.c -o hello

All tools and the generated binaries are running fine. So, we believe this =
patch is no longer needed with the latest GCC sources.
However, in the commit message, it is mentioned:
"it shouldn't be passing this into libtool in the first place but for now t=
his resolves the nastiest problems this causes."

Do we need any other tests to perform or is it okay to drop this patch?

Thanks,
Harish


--_000_DM8PR11MB5653BDE89A4EFB219A90C7E3EF43ADM8PR11MB5653namp_
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
<p class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; ba=
ckground-color: rgb(255, 255, 255);">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica=
 Neue&quot;, sans-serif; font-size: 15px; color: rgb(36, 36, 36);">Hi Khem,=
</span></p>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin-top: 1em; margin-bottom: 1em; =
font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;=
, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sa=
ns-serif; font-size: 15px; color: rgb(36, 36, 36);">
This gcc patch <a href=3D"https://git.openembedded.org/openembedded-core/tr=
ee/meta/recipes-devtools/gcc/gcc/0008-libtool.patch?h=3Dmaster" id=3D"OWA55=
6d419a-a73e-17a6-c160-2d24879f4d15" class=3D"OWAAutoLink" title=3D"https://=
git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/gcc/gcc/0=
008-libtool.patch?h=3Dmaster" data-auth=3D"NotApplicable" style=3D"margin: =
0px;">
https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/g=
cc/gcc/0008-libtool.patch?h=3Dmaster</a>&nbsp;modifies the
<i>libdir</i>&nbsp;from &quot;<i>/usr/lib/../lib</i>&quot; to &quot;<i>/usr=
/lib</i>&quot; in the libstdc++.la file.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin-top: 1em; margin-bottom: 1em; =
font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;=
, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sa=
ns-serif; font-size: 15px; color: rgb(36, 36, 36);">
<br>
We removed this patch and rebuilt GCC using bitbake. We did not encounter a=
ny build or runtime issues. We tested building gcc, gcc-runtime, and core-i=
mage-minimal. After booting the image, we also tested libtool and a simple =
C program with the following commands:<br>
<br>
$libtool --tag=3DCC --mode=3Dcompile x86_64-poky-linux-gcc -c hello.c<br>
libtool: compile:&nbsp; x86_64-poky-linux-gcc -c hello.c&nbsp; -fPIC -DPIC =
-o .libs/hello.o<br>
<br>
$libtool --tag=3DCC --mode=3Dlink x86_64-poky-linux-gcc&nbsp; -o hello hell=
o.lo<br>
libtool: link: x86_64-poky-linux-gcc -o hello .libs/hello.o<br>
<br>
$x86_64-poky-linux-gcc hello.c -o hello<br>
<br>
All tools and the generated binaries are running fine. So, we believe this =
patch is no longer needed with the latest GCC sources.<br>
However, in the commit message, it is mentioned:<br>
&quot;it shouldn't be passing this into libtool in the first place but for =
now this resolves the nastiest problems this causes.&quot;<br>
<br>
Do we need any other tests to perform or is it okay to drop this patch?</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Harish</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_DM8PR11MB5653BDE89A4EFB219A90C7E3EF43ADM8PR11MB5653namp_--

