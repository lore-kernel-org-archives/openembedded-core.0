Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBEAC88E7D
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 17:56:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3073.1789494960627615059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 10:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DFajrLdt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=371803a4be=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FHqpxe4158484
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 17:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=cGfhJmxq2TV1SajHjv7upO
	IAdAQ+m6DHOpb02sLE4L4=; b=DFajrLdtFLtGVE1sEAoSsH48y/7JDnC5jm56jS
	30DJuQpBZXD4PcActUqrTr/C4ufny4POk58cMbKxwBzPJLktQrlC+TZ7Uymv5viI
	BJB1c36Y5uDLddbOtGBE31UDfp9BTk9O0DLfbvYMa08qQtl+lB0zcSFU8aHErcCu
	+fwEfSUQ5+d5t+TOrHGsllR5kPVR5NplfmB8ESr4A6holXPfloQo/JGK1pozAoC0
	si66PfSrcKmYWZQMTOrhZxBtb8en+ZH6pK0onz2Ptcvd9uIh2fRT7vukD7ovBY9q
	tC1BIcVIezMZb1Ii4GJujL3yisUHK0elPNGkni+t7MJR2uWQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022095.outbound.protection.outlook.com [52.101.48.95])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gmxxnq322-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 17:55:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5atfkJLepu309jDd15mc99htf6BjI9EE+6Tpg/IZR1aS1RqGPb9YCOB2b56M29gRSKBQWFeBz96pIE8Tl57O8EWWXB4mMI1bwArTpPLGYhtNufVnPxIL0b8BSMSYyAJbe9atwZcLK12h+gzbHLUF+aIVTB77ipVV1P84/xt+l/KL010ehc4Tn+ISr2g7qgAshhb+anJ+UDXm2yKjQ4TdM98m/VJIgQrIgQKrHryk8miRz44uFbD1hrxxdnIiRfsJkru5w2J6MJl0wL+0WvzeYziDcvB5pISDMQvfMX49/BWj/rH9//sLcosnBRTnaHWppVaidHem88rOAxbv1xdKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGfhJmxq2TV1SajHjv7upOIAdAQ+m6DHOpb02sLE4L4=;
 b=oF1B7CgnwqtRoWa+qMMu6hspV/Cqh2B/96JwftFBIwmY8SiAvwdjklPcR43/niPUV6Et5PnIFdREexSonct6bw8HyVLPVDboX9IO5bX1ldYWmp2CCF0ffz4zxxuKfgrz4R5CaT6fv27cfk3geSa8alyC5cSomWq1fx8qYfdyF0UrpfU02GftckOvhi+6dE51oglFSTQAQx/80Cl2DEBdPQNFdZOyQutwpIk+bESP9v2KYwFkMtIIkeYPBisoBTwkcp5V/81RBN0YZx3ucjTwq0JO99AY1yvqAMsWLjGPJb6lx/brZmjfB8awYNVxMahqHg8ewAee/fCxrdi3d0gdDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS7PR11MB6245.namprd11.prod.outlook.com (2603:10b6:8:9a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.12; Tue, 15 Sep 2026 17:55:48 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 17:55:44 +0000
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
To: Alejandro Hernandez <alhe@linux.microsoft.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>,
        "alejandro@enedino.org"
	<alejandro@enedino.org>
Subject: Re: [OE-core] [PATCH 0/5] rust: reproducibility fixes for arm build
 hosts
Thread-Topic: [OE-core] [PATCH 0/5] rust: reproducibility fixes for arm build
 hosts
Thread-Index: AQHdRR0kJUiQVVSTjEOWFWswCYEVL7bPymAAgAAExwCAABx7ng==
Date: Tue, 15 Sep 2026 17:55:44 +0000
Message-ID: 
 <DS0PR11MB7901AB7D9B8DD4A35F438180E0BA2@DS0PR11MB7901.namprd11.prod.outlook.com>
References: <20260915141834.1212812-1-sunilkumar.dora@windriver.com>
 <b8a0599c-a7e4-44b5-b8c9-6a72d14a70fc@linux.microsoft.com>
 <18D58A6B209991A8.1909126@lists.openembedded.org>
In-Reply-To: <18D58A6B209991A8.1909126@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-09-15T17:55:43.556Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7901:EE_|DS7PR11MB6245:EE_
x-ms-office365-filtering-correlation-id: c3aa01b5-d084-454a-57f7-08df1352907b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|18002099003|22082099003|13003099007|8096899003|3023799007|38070700021|4143699003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info: 
 X/+1h+Us+mpiKLlvgq9UH04HP+mnecY1pKg1VXbirolLFu7KzS7pII08DGg0KqURSDom+Pd2ClOG4jaeclzvsWneP85XdnSzl2DMr7QvXO5qpOCaSaHGRbRADF3ooYgdhcbfb4F/q4J7/MCzX8JDQdDdRLLwDETBQ5o0fgGdq/5d2b74Z9SypYd2XOr3lIjr4M7rlGfU5S/bdTI+V4Eemmd47MLeiiiN19lqvQb0x9ZfZB/Vik8UVnK/5Xpf6pBQuAO1PCMD077xuxyNxHcRdNWMCcj3bXop0opumAibUObwR9M6fQYV+zbfUSzmYTRljxVhZzxdZMpsvBQY7gCerDBvaCOC4euA5X2RNoAN26YzhYO31TOw8CsWbDEQn+sYABnvgoD9NSphsCqLJYAQOd2nv1MjyVxo5k0adxt+G6FMDZr9LdmFAG9TN3IbyhYmmYZsK1WwyoW7W+DYqBTRV2iSdwtHevfKv6GZJcLjsqYRWXABGX/XPQWsNZ5Az+1FDVA579jHK1VckO1pyevkNAjm6vqkWG57+pptDrckE67rpJLUCJWqKIFbVxjk4t4AxWXqIud0feNBGmm1FLA2MsQIWEzVR7LE4HrPavGVc2imjQkVec9pdeEZ3Amo4ribj++epWlyMcW+vcn2rglUuAofKNmTmx6i2F5MphkM4ec=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(18002099003)(22082099003)(13003099007)(8096899003)(3023799007)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?0UfG58dpeQMmi0/ue24nYAYdDx7aK1evMzjrqFZ7daBus167N2SwVbRo2Qqk?=
 =?us-ascii?Q?oGYsNsKiaGMC0HT+5oOWlx11dkq1MTDCrwKk+eE85VuY2izP+9p5whiPuNBT?=
 =?us-ascii?Q?WeCh58wrmSros5FX/VMHC3WOfVsHJkj6BUeiqN6z5HT3k2IxiSAq+nM8vCtG?=
 =?us-ascii?Q?jGjwNQzvL67cIrZkvUion5o3ipSo3Bzs+hPpP/fjT7WFCIb4KUJ14pyIU56C?=
 =?us-ascii?Q?KDoW6yfGL5KdtdNPcK4E0eD4JR+SSfbiGP7Zs9KGk92dOA5D0U9hZcHEnFf1?=
 =?us-ascii?Q?HELxNGNeKUolzGjnzI0X8pQoVypagIEqAqxpQ4P8iBhnH6FHcloivO6ja8Tc?=
 =?us-ascii?Q?HSNK1+111UghPiqgzgLeK35gjrzNLHtS8GZpc+fqQDcAXK7AwiweqKugSHHp?=
 =?us-ascii?Q?XBVxr+AIpzy6vlE8RHRoHPtrDmFWbDiSlhupOa5gDBzuzLKzYLUVSKaoVvEM?=
 =?us-ascii?Q?b4HGW7BRI7dRUnikZ8lD3O/e4rbxMLcKzvUO/42vsiunZ+W/N6l5xfM92TaL?=
 =?us-ascii?Q?7QkcxyHPM2ffckEtM8oywY/36OxygfQP2TxLwpbVU8kcWSc0FM6YZFH4AprJ?=
 =?us-ascii?Q?Ts7Psf7oWCVNqwLDcNWQnID8MDGg6KgaJHpQ8rqaPR/lu3N+7KBZXFNFMN/x?=
 =?us-ascii?Q?NvDuZXYKTmsAJKCg2j1zlppTmMl5itK2eY7TlhsJ1Qw9lR6E/Cl5zwzefmJF?=
 =?us-ascii?Q?LxRsaM4OSojLpbIaC2IOavPvqmcofsAgd00NsDtzFENDxRwdx7FZPZQysisq?=
 =?us-ascii?Q?csH7mjsIyWmt2of0pT4ilIVzWO6g1vgebZYTR/2jeFeTaz0NmKcLCVaUTwNy?=
 =?us-ascii?Q?e/FHZmt7Dff9mz+iy5azCQBvZrEVwT3aLGE93mF/AYOtH+UMGC6uAFfnYTMS?=
 =?us-ascii?Q?9wzQf7DqsbcZAS7u7qCzllczTrSzqPH+Jhu1T7SVWPM9836o1tpl7e6Ug5I1?=
 =?us-ascii?Q?nifDf2n29dBXrugFyIyNJajnG5gfeqUye+wjR0MAl2Db8wLoiXZYSvlCUtSr?=
 =?us-ascii?Q?y/Oz48ykS8ozVBOOAVYDqB2i2O9GXxa5ItqQ9gliH9pd41lODr1Ib1bVWJKY?=
 =?us-ascii?Q?Uikk+shYHLYxxRAIjuA0jKaw9mSwjemt88nX48prZSwLuwA20w2+94M9LA4f?=
 =?us-ascii?Q?4K+lDTIFxTSIq1hpayTEaB2CTVLQrkFVpRV5kpBEsmuAQR3BBYOjUsdWsENr?=
 =?us-ascii?Q?q7sUtFg7lmF7np+RjnGh3LCbfbeIt0xEehCDdKWrJKS6TgEIQLPsOX5XC+cX?=
 =?us-ascii?Q?Jhy0FCOAySXEB5G7xmCf0WbaeSiUSsN/jvB62vEPkO+eH9XajwDxDgtClgz6?=
 =?us-ascii?Q?8htbVNGf5YnCtfWJ/WkujiHvmY+T5Hfy0THsP2XTe8rRuMwyozQmyTR/xSam?=
 =?us-ascii?Q?BciQPKR39vUr6tX8rnK3vjGvlYfWXxrbcbZvEp/9qslS4lv1BJhYtd25meqf?=
 =?us-ascii?Q?1vZ0D3UuP2tPhlEGFWj6m4q9gXWQTuJBvwAws0rJ7NA1g8WBYh9zEcu1/iBz?=
 =?us-ascii?Q?/wG/8oCD5Hg4m7/GMg3SNEKfa4xasVjEC2fNUjOF2UUzDN5FoBsYSlbqNbMa?=
 =?us-ascii?Q?ciwcWWPXokxzCuiZ/DkmeOsEwncdE//3G18Yc5esHL6wUx/sXlqiTNB22sWG?=
 =?us-ascii?Q?0uMf+7sf7MdcpYBC7GFzsOgXLZbdK1OUmVxIN1hTmZpVofOROPA2rQ1whY73?=
 =?us-ascii?Q?W6k3c5Pou/ypRu4GhBiHJHLt0zhy6ZxeohbAa90djH6TQdNpBt+tamnp72sE?=
 =?us-ascii?Q?SpUDGsX4UQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DS0PR11MB7901AB7D9B8DD4A35F438180E0BA2DS0PR11MB7901namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	A3vn3J2Pgya2ozeLzgld05/ag9/D59RuJsdjLRTAgYGzIjSDxIcwbMmqgjSevPtjKEcvlxHJzFsnVSNJDRUfbJh5p3laWsvwScM8BTiLFZhhl6rSb07lw/uCUcT536QcMd4KdGkQClGkYfbnLM44ztLW7DZ8YmULGTuPGHklZwoBfVxqw2tW3w1d/s09bAgiLgZm5BFAADFCMi8FUhs2RihH4NMFghXEcXqI6EhtMk73NagjGf2cqJE2Xv0A1E/UvAK+KKBPrz18lsUsPnjAfg/snUtwMfEryBAqguVKE6oQaaPOzyAP4V45LFYudN5ATnM6Ns5SfcUXGeNxJfaK9Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3aa01b5-d084-454a-57f7-08df1352907b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 17:55:44.1500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OOYcx8GCGoU7EILvTV1X5PSzCDlgr3W+f58NhaW8wlnr7q0JnMgj6DFhn3KzmgcI16QeMdZIh4xWHvFqEpOosHODD92JitYfTHmweuBi5hY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6245
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI1OSBTYWx0ZWRfXzbUif7pwGz0e
 xF/yTM4/81lVtvhzlu0puKSreQuemYY4y3Uco6eC3WCYiwoGuzAAvmWCOv9KvISvReZaTHdCUbI
 ioWK1oJI8vyUoWA8FLUVq4jOyviVyJaNET980UoVlbKawuu6YaEx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI1OSBTYWx0ZWRfXzBPaPDzX5WSo
 Bd6XJQRfd/rCB7ldVs0XLTyNwMO+7WvvXkKvF14oSoLy2CT6kWF6968ke+mnP/gbugl4UCUU06B
 0xeIN56134GPJlQ4zm/AxQd3Mzr/Z8LT436HC/ZXnDyjX0AVuSkebrTJOmuZ1WVjXh+gP6xKhtq
 s6VgJCNQdZYS9ukT+ipYDyIcy4kES9rATIiG3mqZRd0Xla0Yy05RXEHpgBgXGTE8eAdmsai2bX7
 GgvB9G0/VilnG3PItzcJVXlyfhWASyhTmVHV6yT/hWde8g0C0o7zlWuK5SqiOI+Bx7UanvVKkr5
 bqOT6VuMxTT1RUYBJBxShUsUsYooEc92NpsjqB9UiKIb/cJjZwNAIDxwP1yRdmqHxcoMvE4MML7
 lfkqO/xKAZiVK1Ndt0+4xnCMlJSabe2TWl1FnMfj7cZ6Q+lw5gru8kzJn7vsPcZrVvzGx3oiQYA
 SV5N0J+1W37nKI/OIFw==
X-Proofpoint-GUID: TQrvBr51DvknyWXM6AKYV3_eh4qZoos4
X-Proofpoint-ORIG-GUID: lMOCSNswuWSHgE-vXWbKN3e8LhR48iZL
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6aa986ae cx=c_pps
 a=kd6AeByrnEODuFk93iyKgA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=3E1WZoznAAAA:8
 a=yMhMjlubAAAA:8 a=ag1SF4gXAAAA:8 a=zjtiufAZAAAA:8 a=XqjmR3xNedtohG-ScM0A:9
 a=lqcHg5cX4UMA:10 a=CjuIK1q_8ugA:10 a=pXJvtOZlbyrwlV8f:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=o91rCKWQUG4lHlpACIlh:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=2tRhtM0yMehlNRDZlsEQ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150259
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 17:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245863

--_000_DS0PR11MB7901AB7D9B8DD4A35F438180E0BA2DS0PR11MB7901namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

A small update: the upstream half of the cc fix is now merged in rust-lang/=
cc-rs:
https://github.com/rust-lang/cc-rs/commit/fe27e7b62629daddccf1bdc9e9a447a37=
de2cd06

In v2 I will change the Upstream-Status of the cc patch from Submitted to B=
ackport with that commit.
The RUST_COMPILER_RT_ROOT part stays local, as the patch header explains.

Thanks,
Sunil Dora
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Dora, Sunil Kumar via lists.openembedded.org <S=
unilKumar.Dora=3Dwindriver.com@lists.openembedded.org>
Sent: Tuesday, September 15, 2026 9:40 PM
To: Alejandro Hernandez <alhe@linux.microsoft.com>; openembedded-core@lists=
.openembedded.org <openembedded-core@lists.openembedded.org>
Cc: richard.purdie@linuxfoundation.org <richard.purdie@linuxfoundation.org>=
; Kokkonda, Sundeep <Sundeep.Kokkonda@windriver.com>; MacLeod, Randy <Randy=
.MacLeod@windriver.com>; alejandro@enedino.org <alejandro@enedino.org>
Subject: Re: [OE-core] [PATCH 0/5] rust: reproducibility fixes for arm buil=
d hosts

On 9/15/2026 9:23 PM, Alejandro Hernandez wrote:
CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Hopefully these fix reproducibility issue when built from different hosts.

Unfortunately these go in a bit of a different way than my next version, so=
 I
will wait for the result before sending to avoid confusion, but I'm fine wi=
th these
if they work, lets just add my sign off to the actual patches based off of =
mine
instead of the "Patch from Alejandro + OE link".

Thanks Alejandro. Your series did the hard part here, finding where the hos=
t details get into the
rust builds in the first place. Mine builds on that map.

On the contrib branch run the arm reproducible builders came back with the =
rust family gone
from the failing list, so it looks good so far. The real confirmation will =
be the autobuilder runs on
master-next once the series gets picked up there.

On the sign-off: your Signed-off-by is already inside the two carried patch=
 files, but you are right that it is not in
the commit messages, so git log only shows mine.

In v2 I will add your Signed-off-by to those two commit messages and drop t=
he "Patch from + link" wording,
together with whatever else the review brings up.

Thanks,
Sunil Dora



Cheers

Alejandro

On 9/15/2026 8:18 AM, Dora, Sunil Kumar via lists.openembedded.org<https://=
urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!bAZjXNFQV=
d7FZGNUYCD78uEwFODIFOwfzeAgrtyk8STWe6WGkL_Vzz465VBcVThqLu12-qJFkYBIO_U1bW77=
Ut4JIQ$> wrote:

From: Sunil Dora <sunilkumar.dora@windriver.com><mailto:sunilkumar.dora@win=
driver.com>

The reproducible selftest fails for rust on the arm workers
([YOCTO #16376]). This series fixes that.

rust: drop the cc object-name reproducibility patch
rust: hash cc object names relative to their source roots

  The patch we carried trimmed the build path by matching the string
  "rustc", and the shared-source rework broke that for one of the two
  sets of sources cc compiles. The replacement strips the roots the
  sources actually come from. The OUT_DIR part is proposed upstream as
  https://github.com/rust-lang/cc-rs/pull/1902<https://urldefense.com/v3/__=
https://github.com/rust-lang/cc-rs/pull/1902__;!!AjveYdw8EvQ!bAZjXNFQVd7FZG=
NUYCD78uEwFODIFOwfzeAgrtyk8STWe6WGkL_Vzz465VBcVThqLu12-qJFkYBIO_U1bW4fqdQsf=
Q$>.
  The RUST_COMPILER_RT_ROOT part is specific to rust's own build
  system, so it is not part of that pull request.

rust: keep the build host triple out of cargo unit metadata

  From Alejandro Enedino Hernandez Samaniego's strict-version-hash
  series, carried with his sign-off:
  https://lists.openembedded.org/g/openembedded-core/topic/120939810<https:=
//urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/to=
pic/120939810__;!!AjveYdw8EvQ!bAZjXNFQVd7FZGNUYCD78uEwFODIFOwfzeAgrtyk8STWe=
6WGkL_Vzz465VBcVThqLu12-qJFkYBIO_U1bW7uALNnJw$>
  cargo mixes the "host:" line of "rustc -vV" into build script and
  proc-macro metadata, and target crates inherit it.
  Upstream report: https://github.com/rust-lang/cargo/issues/8140<https://u=
rldefense.com/v3/__https://github.com/rust-lang/cargo/issues/8140__;!!AjveY=
dw8EvQ!bAZjXNFQVd7FZGNUYCD78uEwFODIFOwfzeAgrtyk8STWe6WGkL_Vzz465VBcVThqLu12=
-qJFkYBIO_U1bW7EZ-2c1Q$>

rust: backport deterministic DocLinkResMap serialisation

  Upstream commit f9d9939 by jprochazk and mejrs. It is in rust 1.99,
  so this drops out at the next rust upgrade.

rust: sort hygiene data before it is encoded

  Also from Alejandro's series. Upstream is fixing the same problem
  with a different approach in
  https://github.com/rust-lang/rust/pull/161450<https://urldefense.com/v3/_=
_https://github.com/rust-lang/rust/pull/161450__;!!AjveYdw8EvQ!bAZjXNFQVd7F=
ZGNUYCD78uEwFODIFOwfzeAgrtyk8STWe6WGkL_Vzz465VBcVThqLu12-qJFkYBIO_U1bW5_rpj=
PaQ$>, which is still open.

Alejandro's StableCrateId patch is not included: the value it pins is
already host-independent in our builds, and it broke three rust test
suite cases when the autobuilder tested it.

Tested on the autobuilder: the x86 reproducible builder green with
zero differing packages, the rust test suite green, and on both arm
builders rust, rust-dbg, rust-rustdoc and libstd-rs-dev gone from the
failing list.


Sunil Dora (5):
  rust: drop the cc object-name reproducibility patch
  rust: hash cc object names relative to their source roots
  rust: keep the build host triple out of cargo unit metadata
  rust: backport deterministic DocLinkResMap serialisation
  rust: sort hygiene data before it is encoded

 ...-host-triple-from-unit-metadata-hash.patch |  62 ++++++++++
 ...oc-link-metadata-order-deterministic.patch |  40 ++++++
 ...hygiene-encoding-order-deterministic.patch |  58 +++++++++
 ...ject-names-relative-to-source-roots.patch} | 116 +++++++++---------
 meta/recipes-devtools/rust/rust-source.inc<https://urldefense.com/v3/__htt=
p://rust-source.inc__;!!AjveYdw8EvQ!bAZjXNFQVd7FZGNUYCD78uEwFODIFOwfzeAgrty=
k8STWe6WGkL_Vzz465VBcVThqLu12-qJFkYBIO_U1bW5pCv2TAA$>    |   5 +-
 5 files changed, 224 insertions(+), 57 deletions(-)
 create mode 100644 meta/recipes-devtools/rust/files/0007-cargo-omit-host-t=
riple-from-unit-metadata-hash.patch
 create mode 100644 meta/recipes-devtools/rust/files/0008-rustc-hir-make-do=
c-link-metadata-order-deterministic.patch
 create mode 100644 meta/recipes-devtools/rust/files/0009-rustc-span-make-h=
ygiene-encoding-order-deterministic.patch
 rename meta/recipes-devtools/rust/files/{repro-issue-fix-with-cc-crate-has=
hmap.patch =3D> cc-hash-object-names-relative-to-source-roots.patch} (70%)










--_000_DS0PR11MB7901AB7D9B8DD4A35F438180E0BA2DS0PR11MB7901namp_
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
<b>A small update</b>: the upstream half of the cc fix is now merged in <b>=
rust-lang/cc-rs</b>:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
https://github.com/rust-lang/cc-rs/commit/fe27e7b62629daddccf1bdc9e9a447a37=
de2cd06</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
In v2 I will change the Upstream-Status of the cc patch from Submitted to B=
ackport with that commit.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
The RUST_COMPILER_RT_ROOT part stays local, as the patch header explains.</=
div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Sunil Dora</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Dora, Sunil Kumar via lists.openembedded.org
 &lt;SunilKumar.Dora=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Tuesday, September 15, 2026 9:40 PM<br>
<b>To:</b> Alejandro Hernandez &lt;alhe@linux.microsoft.com&gt;; openembedd=
ed-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org=
&gt;<br>
<b>Cc:</b> richard.purdie@linuxfoundation.org &lt;richard.purdie@linuxfound=
ation.org&gt;; Kokkonda, Sundeep &lt;Sundeep.Kokkonda@windriver.com&gt;; Ma=
cLeod, Randy &lt;Randy.MacLeod@windriver.com&gt;; alejandro@enedino.org &lt=
;alejandro@enedino.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH 0/5] rust: reproducibility fixes for a=
rm build hosts</font>
<div>&nbsp;</div>
</div>
<div>
<div class=3D"x_moz-cite-prefix">On 9/15/2026 9:23 PM, Alejandro Hernandez =
wrote:<br>
</div>
<blockquote type=3D"cite"><strong></strong>
<div style=3D"border:solid #9c6500 1pt; padding:2pt; background:#fcfc03"><s=
trong><span style=3D"font-size:11pt; color:#000">CAUTION: This email comes =
from a non Wind River email account!</span></strong><br>
<span style=3D"font-size:10pt; color:#000">Do not click links or open attac=
hments unless you recognize the sender and know the content is safe.</span>=
<br>
</div>
<div>
<pre>Hopefully these fix reproducibility issue when built from different ho=
sts.

Unfortunately these go in a bit of a different way than my next version, so=
 I
will wait for the result before sending to avoid confusion, but I'm fine wi=
th these
if they work, lets just add my sign off to the actual patches based off of =
mine
instead of the &quot;Patch from Alejandro + OE link&quot;.</pre>
</div>
</blockquote>
Thanks Alejandro. Your series did the hard part here, finding where the hos=
t details get into the&nbsp;<br>
rust builds in the first place. Mine builds on that map.<br>
<br>
On the contrib branch run the arm reproducible builders came back with the =
rust family gone&nbsp;<br>
from the failing list, so it looks good so far. The real confirmation will =
be the autobuilder runs on<br>
master-next once the series gets picked up there.<br>
<br>
On the sign-off: your Signed-off-by is already inside the two carried patch=
 files, but you are right that it is not in&nbsp;<br>
the commit messages, so git log only shows mine.&nbsp;<br>
<br>
In v2 I will add your Signed-off-by to those two commit messages and drop t=
he &quot;Patch from + link&quot; wording,<br>
together with whatever else the review brings up.<br>
<br>
Thanks,<br>
Sunil Dora
<blockquote type=3D"cite">
<div>
<pre>

Cheers

Alejandro</pre>
<div class=3D"x_moz-cite-prefix">On 9/15/2026 8:18 AM, Dora, Sunil Kumar vi=
a <a href=3D"https://urldefense.com/v3/__http://lists.openembedded.org__;!!=
AjveYdw8EvQ!bAZjXNFQVd7FZGNUYCD78uEwFODIFOwfzeAgrtyk8STWe6WGkL_Vzz465VBcVTh=
qLu12-qJFkYBIO_U1bW77Ut4JIQ$">
lists.openembedded.org</a> wrote:<br>
</div>
<blockquote type=3D"cite">
<pre class=3D"x_moz-quote-pre">From: Sunil Dora <a class=3D"x_moz-txt-link-=
rfc2396E" href=3D"mailto:sunilkumar.dora@windriver.com">&lt;sunilkumar.dora=
@windriver.com&gt;</a>

The reproducible selftest fails for rust on the arm workers
([YOCTO #16376]). This series fixes that.

rust: drop the cc object-name reproducibility patch
rust: hash cc object names relative to their source roots

  The patch we carried trimmed the build path by matching the string
  &quot;rustc&quot;, and the shared-source rework broke that for one of the=
 two
  sets of sources cc compiles. The replacement strips the roots the
  sources actually come from. The OUT_DIR part is proposed upstream as
  <a class=3D"x_moz-txt-link-freetext" href=3D"https://urldefense.com/v3/__=
https://github.com/rust-lang/cc-rs/pull/1902__;!!AjveYdw8EvQ!bAZjXNFQVd7FZG=
NUYCD78uEwFODIFOwfzeAgrtyk8STWe6WGkL_Vzz465VBcVThqLu12-qJFkYBIO_U1bW4fqdQsf=
Q$">https://github.com/rust-lang/cc-rs/pull/1902</a>.
  The RUST_COMPILER_RT_ROOT part is specific to rust's own build
  system, so it is not part of that pull request.

rust: keep the build host triple out of cargo unit metadata

  From Alejandro Enedino Hernandez Samaniego's strict-version-hash
  series, carried with his sign-off:
  <a class=3D"x_moz-txt-link-freetext" href=3D"https://urldefense.com/v3/__=
https://lists.openembedded.org/g/openembedded-core/topic/120939810__;!!Ajve=
Ydw8EvQ!bAZjXNFQVd7FZGNUYCD78uEwFODIFOwfzeAgrtyk8STWe6WGkL_Vzz465VBcVThqLu1=
2-qJFkYBIO_U1bW7uALNnJw$">https://lists.openembedded.org/g/openembedded-cor=
e/topic/120939810</a>
  cargo mixes the &quot;host:&quot; line of &quot;rustc -vV&quot; into buil=
d script and
  proc-macro metadata, and target crates inherit it.
  Upstream report: <a class=3D"x_moz-txt-link-freetext" href=3D"https://url=
defense.com/v3/__https://github.com/rust-lang/cargo/issues/8140__;!!AjveYdw=
8EvQ!bAZjXNFQVd7FZGNUYCD78uEwFODIFOwfzeAgrtyk8STWe6WGkL_Vzz465VBcVThqLu12-q=
JFkYBIO_U1bW7EZ-2c1Q$">https://github.com/rust-lang/cargo/issues/8140</a>

rust: backport deterministic DocLinkResMap serialisation

  Upstream commit f9d9939 by jprochazk and mejrs. It is in rust 1.99,
  so this drops out at the next rust upgrade.

rust: sort hygiene data before it is encoded

  Also from Alejandro's series. Upstream is fixing the same problem
  with a different approach in
  <a class=3D"x_moz-txt-link-freetext" href=3D"https://urldefense.com/v3/__=
https://github.com/rust-lang/rust/pull/161450__;!!AjveYdw8EvQ!bAZjXNFQVd7FZ=
GNUYCD78uEwFODIFOwfzeAgrtyk8STWe6WGkL_Vzz465VBcVThqLu12-qJFkYBIO_U1bW5_rpjP=
aQ$">https://github.com/rust-lang/rust/pull/161450</a>, which is still open=
.

Alejandro's StableCrateId patch is not included: the value it pins is
already host-independent in our builds, and it broke three rust test
suite cases when the autobuilder tested it.

Tested on the autobuilder: the x86 reproducible builder green with
zero differing packages, the rust test suite green, and on both arm
builders rust, rust-dbg, rust-rustdoc and libstd-rs-dev gone from the
failing list.


Sunil Dora (5):
  rust: drop the cc object-name reproducibility patch
  rust: hash cc object names relative to their source roots
  rust: keep the build host triple out of cargo unit metadata
  rust: backport deterministic DocLinkResMap serialisation
  rust: sort hygiene data before it is encoded

 ...-host-triple-from-unit-metadata-hash.patch |  62 ++++++++++
 ...oc-link-metadata-order-deterministic.patch |  40 ++++++
 ...hygiene-encoding-order-deterministic.patch |  58 +++++++++
 ...ject-names-relative-to-source-roots.patch} | 116 +++++++++---------
 meta/recipes-devtools/rust/<a href=3D"https://urldefense.com/v3/__http://r=
ust-source.inc__;!!AjveYdw8EvQ!bAZjXNFQVd7FZGNUYCD78uEwFODIFOwfzeAgrtyk8STW=
e6WGkL_Vzz465VBcVThqLu12-qJFkYBIO_U1bW5pCv2TAA$">rust-source.inc</a>    |  =
 5 +-
 5 files changed, 224 insertions(+), 57 deletions(-)
 create mode 100644 meta/recipes-devtools/rust/files/0007-cargo-omit-host-t=
riple-from-unit-metadata-hash.patch
 create mode 100644 meta/recipes-devtools/rust/files/0008-rustc-hir-make-do=
c-link-metadata-order-deterministic.patch
 create mode 100644 meta/recipes-devtools/rust/files/0009-rustc-span-make-h=
ygiene-encoding-order-deterministic.patch
 rename meta/recipes-devtools/rust/files/{repro-issue-fix-with-cc-crate-has=
hmap.patch =3D&gt; cc-hash-object-names-relative-to-source-roots.patch} (70=
%)

</pre>
<br>
<fieldset class=3D"x_moz-mime-attachment-header"></fieldset>
<pre class=3D"x_moz-quote-pre">

</pre>
</blockquote>
</div>
</blockquote>
<p><br>
</p>
</div>
</body>
</html>

--_000_DS0PR11MB7901AB7D9B8DD4A35F438180E0BA2DS0PR11MB7901namp_--

