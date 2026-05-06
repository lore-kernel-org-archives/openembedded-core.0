Return-Path: <libo.chen.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2379CD3424
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 08:24:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13658.1778055846007716423
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 01:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cySknm+S;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9586df8bd6=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6465oG9E443744
	for <openembedded-core@lists.openembedded.org>; Wed, 6 May 2026 01:24:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=9C+NkBX3LqrMMoTl7KFL198Wj8KGw5kMGt6rnB2Z7LY=; b=cySknm+SVf2Z
	SSE/QNJ0iEAI5xrPnI1+6ZAk4SGL1kRSJonkwqsMZthCzV0K0pQzQs0EI7tewNZR
	+4Msqw6kMZ/d4qsniTU+GXk0cnSBOJLYjfs6lCN5R3ctZ66asqiRhWj5OLC3Mvln
	tKFiYT373UIUM9ZAFV3T/hN5dmPo6GRDkW6SNabah+ExrJkojTnQgZiPCbCYhGc2
	XmRUtGD1B9VbcylMR6php8qFwMga3lAs3jqlPWVpUkwLdTF0kjEyeSnrjVM7FVVB
	vPq6IhRMn33sLgZfwkA7ABy8bWciEuTnM9lXOgAPpGC64LOusBP0dluab3RbxhpJ
	2+icbBMvVQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010036.outbound.protection.outlook.com [52.101.85.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwchyvgf1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 06 May 2026 01:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/w+JAUqseg2NnFqvcJ4Xc+ZmHhNqtZYmhYoLzxd4FXcKOynn6AoJZrbWgT9euRs28FQXKJf20Q0vtbLzlYw0u2pr6Lc2gq42XZYkCgEk7I8mzxRHNBMXT97wSy06+FeFK0kiGhHNk66aVjgfudenSsaB6qcHOqIvM0lToRy3VhrLQyP+vjWzkYqS52FFo8Cs8xH0CU1LajcuKL0nS8yJE5n/EzaCuaga5usOoos+8uGSly3l6E1mSRWcf7OBjiPAn9Srwz1F9k7Z1txqsDO/fwHiKoJfMuMa32phyzHjYV3V8V9r7uib+QLDnngLS9y2beXHEBQ4r1icO4MfZZZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9C+NkBX3LqrMMoTl7KFL198Wj8KGw5kMGt6rnB2Z7LY=;
 b=W25GdMNHhj3lWimnYO3dW9TYX4IPHqClvkjKpiukv6arDG2s6QEx8qRherQf5hi4JAwcaAnRY/ToldP1+RdcHiCiklP1NcEBwWsoo45tcf4s4Qh6Qyb0OsEiUkot7yF5QHlPxwFkE0wJB1KtqARhboLIZQZNVR/P1hXipNSfyRc9bS91TzSS0V7688KEkO5c4vYcmKla0LZqJEbvkjFvEmgLGgDJeqbcekIvcXsDmn19q/wuB3DeqOmpTmqRy67pve5ARWlmdLSQRueX5IPOUJrgJFreYbn4mLspIPb9R5O4dNcQHsgEGtUiI+1CU7FLYcXnU8erovFqd45WSMll3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 by DM3PPFC3F0DB79B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 08:24:01 +0000
Received: from BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::4a0e:caa8:c2fa:8700]) by BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::4a0e:caa8:c2fa:8700%3]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 08:24:01 +0000
From: "Chen, Libo (CN)" <Libo.Chen.CN@windriver.com>
To: "yoann.congal@smile.fr" <yoann.congal@smile.fr>,
        "Wang, Jinfeng (CN)"
	<Jinfeng.Wang.CN@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Chen, Libo (CN)"
	<Libo.Chen.CN@windriver.com>
Subject: RE: [OE-core] [scarthgap][PATCH 04/12] python3-ply: fix
 CVE-2025-56005
Thread-Topic: [OE-core] [scarthgap][PATCH 04/12] python3-ply: fix
 CVE-2025-56005
Thread-Index: AQHcx+kLiJD6XyKzBk+4dZ+kVrqCRrXt2/6AgASsHCCADkqzoA==
Date: Wed, 6 May 2026 08:24:01 +0000
Message-ID: 
 <BN9PR11MB5354F2CF2323061354A5AC18DE3F2@BN9PR11MB5354.namprd11.prod.outlook.com>
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
 <20260409061639.1688205-5-jinfeng.wang.cn@windriver.com>
 <DI16KRN0V4A0.1I7P5Z5C5PG7S@smile.fr>
 <18AA22684C0F041F.2188217@lists.openembedded.org>
In-Reply-To: <18AA22684C0F041F.2188217@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=ba2d8366-9e94-4ee3-bd48-5353af0ff016;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-04-27T06:06:18Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5354:EE_|DM3PPFC3F0DB79B:EE_
x-ms-office365-filtering-correlation-id: 326304ae-51cc-42f0-f03e-08deab48d3ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 DCu+DlXRaHKbO6YCmY8kpQYe5/zdcF/W2MDe+l48EIIEZHt09AHorGEROxnk3lrV62H88byPhOamKCwsfAhgl8xuZgLj0cL2dGK32HNOD2Iy2FOHHCM4OStcQ3rDhMM8XbcKK0djmtBSy5jTVgZiRNYBxAWVz4RqLVtMiuFgtVNA++FP7Q+0oSxpqnx9Tok8vSSUG4krq/xV0aPnePBLOFu9Ug3LW5GXjytkViQHA8mU40SRAQN16XBW/2k5uOe4YIvjt3piKqe8ZLKCqG2+ej0kBSyeCPH2mXMdXPIMExm2rTKf+ZVxGOLL+ofvMqDkXDJuJksD3c4VqHRm+mbKKfhBMt7+APXVkU5iEuMDCmPrDrkds0CNcYWYjvQ7MF8sakQJBGNR1NM1zLHFYt1MQlrvsKljXenK4rRM6N8KTu9BpwWF2jCSxlQjZi7zJNIwSqEO4CEuoo+P79IqgRYXQqGEBeBPBAfDiIJHYys3CgiF7VMZaYSR5r45KF9JNTzhuuNpn+OaZDECtAoo8ovTM974AozjnnypaireTT6Jj3AKNyw2Ei7IQ5rl+jl+GwNK+zm4PY5psEfn1wC0xBDLeq+ivBx36GrNwuNUBZoqeSUp8g1gx2YUe1VIQx3WwY1kf6W6vmE28z+TYEqPDqFG1vv4qCc0FcFqZPYdTNMjKiLPHv7LSlxDWX8q7y6cavAisBGgqHKvlGoYN111oDGKbMn7do3cMu3IYtvqiduNiHwrnEKkJSlh0zXDes8R1+4v
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5354.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?WGBQexGxYvyAE1fOj0xKjj8tFSpzuP/9+9Kc3/CDn/RqGplS235P7DgIweXK?=
 =?us-ascii?Q?kKwJGVDOGmYYRxr05lNHSJF1aTGDmhpTkBqGRbX44rVJ8Ay/BbRnkHCcWJnP?=
 =?us-ascii?Q?o1bj777bW9Pf3rqhTXmWUBhkx1Azpcx3vtRa5xBiLxBXGE6eJCizRWBw39Al?=
 =?us-ascii?Q?E5zVGobr2plUtOTLGUbBtfwIl+QI3kvICSA+X6jXz3OSOxT7inFMJIfS4Hz4?=
 =?us-ascii?Q?OhpS+WpQW0Xgsoy+G3fHW3pNA/n61k66fQrIM9LA8OyG4cNf/MtcGBqges8A?=
 =?us-ascii?Q?Lz3VKUE1NcwDtxdNe00jC3wfYKDQmaj7qfVYnGHIUy3EhMB9p+vjuKaAF5z1?=
 =?us-ascii?Q?OFxE8tW3VJeQf3H8BCnMZJj0fdmsx+NamnVpW73k4194FuGs5Ery61uA20KB?=
 =?us-ascii?Q?sYkWgDWgW+pYGEDS1kolJ5o0eVwmwzlg/6hZa596LDuxK/TiJWrYYwE8bnVG?=
 =?us-ascii?Q?JYqIIac/qKr1kiBV5YOhcbY/zDrGCS13fqQazBVa3Vk4zGx0hcNxX/6fYbJ3?=
 =?us-ascii?Q?GA37oRH8R5r5lGPV1Glx/LgDURcOBT5Y9tHRVcbFJ9ABfuZd+vjIl7Qt8Ok+?=
 =?us-ascii?Q?KerS/IaTDMa95ShN1JWSO9+e6X/5K8sarLA0xApICOHVnrI0lY0wd65vK/Kr?=
 =?us-ascii?Q?NrCzwUjAIgqfTh/hI6PMa0Oh+aUlhONS26oh22BLvvU4NwB0maVd2PM0OGzw?=
 =?us-ascii?Q?uZqaI0b6C5zeZEchsHc9/ZvaQfvY96ElasJMwwnB6ZGu3t/GqZhxfI25FY6A?=
 =?us-ascii?Q?keS2Ng5Tn93WOUcau/eir+yoO6TzADuXLT3VF+DZeU6Splj1zcNXBSi0s4Cz?=
 =?us-ascii?Q?46VPHX0aSfUxenOoQosdy23jyoqj/vo/TOlFPD7uxGUCCc4Zu9ag4/R+pCnw?=
 =?us-ascii?Q?U017gcl/Iwb9hZbjTQh7urVFcaM57tDP5H63OYGqsJHAv+4QfFxkIoBM0kTJ?=
 =?us-ascii?Q?p6yMgxqCBOuMw7fonJ2x4h26etWcs5q0/u83NF1nDlGXoaZ3EZJR+AVttF1M?=
 =?us-ascii?Q?XPaFfzK/8sTJaHF5BmAcfFGk86oyHMka0nu5NCzE1U1d+CZPP4IjLIWpD7Id?=
 =?us-ascii?Q?Rzc8UCTExDf4HFVxmd4MzUxJZNLMsKpWw6kVX+zIQqNdWbFR+y3ZswsSYLPk?=
 =?us-ascii?Q?6JhYmmISsGJZiUTbYJGf/bsUhmtjrOmQoxnqd2MJg79re5FpLWlDG7iWygjU?=
 =?us-ascii?Q?mEPoYdA8gDdwnPP4C3oYfK7PXi0FRAjrEi/qRofAJAr9ouygMDOovfW+/fzh?=
 =?us-ascii?Q?zGPjucXHJd5gFwq09qKJMcXIMvrmfuxyTgHitQG3/FYnoa620vwXIZPu6Twh?=
 =?us-ascii?Q?rebd0P5ty6vIxmPGTc3gzz78xrpt2JsKtAtji2neuFAPH2X14gsfqmP7ymTY?=
 =?us-ascii?Q?IfPHstgHCeVTgADYvA4T9OSfPhFK1vsJqIH+ECIcmPyQTooALRhHbNFqRecc?=
 =?us-ascii?Q?WAmYRL2ZoTLcD///hoS8KHNihqvOxDc8SvnZQ7odYQy6OdNXaQ4gvg9nimyh?=
 =?us-ascii?Q?LqexFuXhvEEsgrdZF8oVdIHEl37cd1qeeigqc+QOJWf3ywBgkJdbfc5FEkBv?=
 =?us-ascii?Q?Qlh6x4f3pOkTX1N8r7V/SfaugFcB8lj9uWkSEphU8T3/FI8dbY10KUg9Jqks?=
 =?us-ascii?Q?1xudfudKuQnooVJ6klIk0DaPPscEocf/U/v0pn/aaE4PrKmzkQOfKbr45voi?=
 =?us-ascii?Q?dRUVhihiKzTWCnb62ijB8aGVplWgO5FAKtqvR/nfD6xACBK/UAl+Yhq+V9C/?=
 =?us-ascii?Q?Pj9FPHab5Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	tJXMhHKSAhZSeg7enUV12eOeJ2TY3BUj4MFLtLNlLTiIVykno4+MWQghqW4jxz9h7GeTRUGxCOnAPlZ/MWXIaS+NqsEXtc/bwwqFDW4xQMCbyvHr19775ZDJTdAsxG1b5am+t93jkcze4hXtyCcW45MQR/kosKXfRGeApmcPH/I3KncuJ9r/FVDZz+fcEen9FEuWHU/4jtPH4LP0JQhwkWQnoa/P0duZxb+22G+CeM03Qh2T8u4z4hjSafB5oWZlW7GGDR38nluvY2lkgO+K3VHOSBu6npSyVz18TOc4KM3HatU0U74WyKm5ad+amw8zfcutvFKsiXEo/UwsN7cNcg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5354.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 326304ae-51cc-42f0-f03e-08deab48d3ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 08:24:01.4668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aI4kNZqDzjk4M64wirCJPWtx/nloxMuImTp9hxYz0qmYWJeqn9aM4qGX05BcAmZCDwF8StTeM8TlCAzDwkf2/W8yOkRSSD173K4e4WQcGq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFC3F0DB79B
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4MSBTYWx0ZWRfX/I4DEUTI1DEa
 s0qSkuImtlkBsC6s8NzRKlwjBHsfpZz3GEV1RJff78TYRPybMuHb80gB0V0zW0fBAcaFOt69NSA
 5EXOt+Yr1SocPlDCiLFkAhqvO0vOJ6TaOTawsQxqU53WofMzk3LM7rdun/3fkUJv/ssbv9iJRlP
 f44STJ4TGtrQLqHg+y8+cRjl7Hp2igxnZoO7Whembdk0Kqxc5AxECG26CddtKkEz6w0f+wdgRoD
 sxg55RPNnjy5Js/HXog5UB2jANyVofoJKM+uHDvA+FMuwbXJiMUx4YeLpGthf+8agR7NZso5knd
 piRmf1Eq9SOE4RX/qNW3mqCoo+co11YMOBJRW9DEK1hx/cpdy7+osWWcz8db88Q60aQENL9c4PY
 GhkqvNVycWdEai4lxCB4yRkoz9Cw+FRHJZSmZJxxsgVByqHn4bvzw9zYFeD8UI6TZEVYZNyvwAq
 Iexq3KTkTfAOOsFjuVg==
X-Proofpoint-ORIG-GUID: knMo_LtN4UuaSGH0Dqrx31_lUO4ImkAO
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=69fafaa5 cx=c_pps
 a=Pnh5LeqhM4XIZ/aCP1A8uQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=8PcQs4gdAAAA:20
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=ExiV3mtGcZGygbndPz4A:9
 a=0HxsFzLBF6O8tY2a:21 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: OL2OswUElzz3Sy8KEVZD0mzPS9ADWDcN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 08:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236533



>-----Original Message-----
>From: openembedded-core@lists.openembedded.org
><openembedded-core@lists.openembedded.org> On Behalf Of Chen, Libo (CN)
>via lists.openembedded.org
>Sent: Monday, April 27, 2026 2:20 PM
>To: yoann.congal@smile.fr; Wang, Jinfeng (CN)
><Jinfeng.Wang.CN@windriver.com>;
>openembedded-core@lists.openembedded.org
>Subject: Re: [OE-core] [scarthgap][PATCH 04/12] python3-ply: fix
>CVE-2025-56005
>
>
>
>>-----Original Message-----
>>From: openembedded-core@lists.openembedded.org
>><openembedded-core@lists.openembedded.org> On Behalf Of Yoann Congal
>>via lists.openembedded.org
>>Sent: Friday, April 24, 2026 2:45 PM
>>To: Wang, Jinfeng (CN) <Jinfeng.Wang.CN@windriver.com>;
>>openembedded-core@lists.openembedded.org
>>Subject: Re: [OE-core] [scarthgap][PATCH 04/12] python3-ply: fix
>>CVE-2025-56005
>>
>>CAUTION: This email comes from a non Wind River email account!
>>Do not click links or open attachments unless you recognize the sender
>>and know the content is safe.
>>
>>On Thu Apr 9, 2026 at 8:16 AM CEST, Jinfeng (CN) via
>>lists.openembedded.org Wang wrote:
>>> From: Libo Chen <libo.chen.cn@windriver.com>
>>>
>>> According to [1], An undocumented and unsafe feature in the PLY
>>> (Python
>>> Lex-Yacc) library 3.11 allows Remote Code Execution (RCE) via the
>>> `picklefile` parameter in the `yacc()` function. This parameter
>>> accepts a `.pkl` file that is deserialized with `pickle.load()`
>>> without validation. Because `pickle` allows execution of embedded
>>> code via `__reduce__()`, an attacker can achieve code execution by
>>> passing a malicious pickle file. The parameter is not mentioned in
>>> official documentation or the GitHub repository, yet it is active in
>>> the PyPI version. This introduces a stealthy backdoor and persistence r=
isk.
>>>
>>> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-56005
>>>
>>> Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
>>> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
>>> ---
>>>  .../python/python3-ply/CVE-2025-56005.patch   | 125
>>++++++++++++++++++
>>>  .../python/python3-ply_3.11.bb                |   4 +
>>>  2 files changed, 129 insertions(+)
>>>  create mode 100644
>>> meta/recipes-devtools/python/python3-ply/CVE-2025-56005.patch
>>>
>>> diff --git
>>> a/meta/recipes-devtools/python/python3-ply/CVE-2025-56005.patch
>>> b/meta/recipes-devtools/python/python3-ply/CVE-2025-56005.patch
>>> new file mode 100644
>>> index 0000000000..3f1e62b766
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/python/python3-ply/CVE-2025-56005.patch
>>> @@ -0,0 +1,125 @@
>>> +From bfaebcc33a5af77f2701581638aa31a1bf918302 Mon Sep 17 00:00:00
>>> +2001
>>> +From: Libo Chen <libo.chen.cn@windriver.com>
>>> +Date: Tue, 27 Jan 2026 13:58:57 +0800
>>> +Subject: [PATCH] python3-ply: fix CVE-2025-56005
>>> +
>>> +Deprecate and disable the unsafe picklefile parameter and related
>>> +pickle serialization/deserialization functions to prevent RCE attacks.
>>> +
>>> +The picklefile parameter in yacc() now issues a DeprecationWarning
>>> +and is ignored. The read_pickle() and pickle_table() methods are
>>> +stubbed out to issue warnings and raise NotImplementedError,
>>> +following Python's standard practice for security-deprecated APIs.
>>> +
>>> +CVE: CVE-2025-56005
>>> +
>>> +Upstream-Status: Inactive-Upstream
>>> +
>>> +Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
>>
>>Hello,
>>
>>The status of this patch is not clear: It is not mentionned in the NVD
>>report you linked.
>
>The upstream https://github.com/dabeaz/ply was archived by the owner on De=
c
>22, 2025. It is now read-only. So I could not submit my patch to the upstr=
eam
>and only mark it as "Upstream-Status: Inactive-Upstream"
>
>>And there is an argument to reject the CVE:
>>https://github.com/tom025/ply_exploit_rejection/blob/main/README.md
>
>I can reproduce this CVE. Here're my steps:
>

Yoann, do you have additional comment? Thanks.

>1) copy the source code from
>https://github.com/bohmiiidd/Undocumented-RCE-in-PLY/ to a python script
>ply-bug.py
>
>2) set up a uv environment. Here's the configuration:
>[xyz/temp/ply-poc]$ cat /buildarea1/xyz/opt/pyenv/pyproject.toml
>[project]
>name =3D "pyenv"
>version =3D "0.1.0"
>description =3D "Add your description here"
>readme =3D "README.md"
>requires-python =3D ">=3D3.14.2"
>dependencies =3D [
>    "ply=3D=3D3.11",
>]
>[xyz/temp/ply-poc]$ lsb_release -a
>No LSB modules are available.
>Distributor ID: Ubuntu
>Description:    Ubuntu 20.04.6 LTS
>Release:        20.04
>Codename:       focal
>
>3) run the python script ply-bug.py
>
>[xyz/temp/ply-poc]$ ls -l /tmp/pwned && cat /tmp/pwned
>ls: cannot access '/tmp/pwned': No such file or directory [xyz/temp/ply-po=
c]$ uv
>--directory /buildarea1/xyz/opt/pyenv run python
>/buildarea1/xyz/temp/ply-poc/ply-bug.py
>WARNING: yacc table file version is out of date
>WARNING: no p_error() function is defined Traceback (most recent call last=
):
>  File "/buildarea1/xyz/temp/ply-poc/ply-bug.py", line 35, in <module>
>    parser.parse('example')
>    ~~~~~~~~~~~~^^^^^^^^^^^
>  File
>"/buildarea1/xyz/opt/pyenv/.venv/lib/python3.14/site-packages/ply/yacc.py"=
,
>line 333, in parse
>    return self.parseopt_notrack(input, lexer, debug, tracking, tokenfunc)
>
>~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  File
>"/buildarea1/xyz/opt/pyenv/.venv/lib/python3.14/site-packages/ply/yacc.py"=
,
>line 1018, in parseopt_notrack
>    lexer =3D lex.lexer
>            ^^^^^^^^^
>AttributeError: module 'ply.lex' has no attribute 'lexer'. Did you mean: '=
Lexer'?
>[xyz/temp/ply-poc]$ ls -l /tmp/pwned && cat /tmp/pwned
>-rw-r--r-- 1 xyz users 11 Apr 27 13:46 /tmp/pwned VULNERABLE
>>
>>In doubt (such as this), I'd rather leave the CVE applicable and let
>>downstream users that uses impacted code decide for themselves how they
>>want to handle this CVE.
>>
>>> +---
>>> + ply/yacc.py | 72
>>> ++++++++++++++++++++++--------------------------------
>>> + 1 file changed, 28 insertions(+), 44 deletions(-)
>>> +
>>> +diff --git a/ply/yacc.py b/ply/yacc.py index 88188a1..5103566 100644
>>> +--- a/ply/yacc.py
>>> ++++ b/ply/yacc.py
>>> +@@ -1998,31 +1998,15 @@ class LRTable(object):
>>> +         return parsetab._lr_signature
>>> +
>>> +     def read_pickle(self, filename):
>>> +-        try:
>>> +-            import cPickle as pickle
>>> +-        except ImportError:
>>> +-            import pickle
>>> +-
>>> +-        if not os.path.exists(filename):
>>> +-          raise ImportError
>>> +-
>>> +-        in_f =3D open(filename, 'rb')
>>> +-
>>> +-        tabversion =3D pickle.load(in_f)
>>> +-        if tabversion !=3D __tabversion__:
>>> +-            raise VersionError('yacc table file version is out of dat=
e')
>>> +-        self.lr_method =3D pickle.load(in_f)
>>> +-        signature      =3D pickle.load(in_f)
>>> +-        self.lr_action =3D pickle.load(in_f)
>>> +-        self.lr_goto   =3D pickle.load(in_f)
>>> +-        productions    =3D pickle.load(in_f)
>>> +-
>>> +-        self.lr_productions =3D []
>>> +-        for p in productions:
>>> +-            self.lr_productions.append(MiniProduction(*p))
>>> +-
>>> +-        in_f.close()
>>> +-        return signature
>>> ++        import warnings
>>> ++        warnings.warn(
>>> ++            "read_pickle() is deprecated and disabled due to
>>> ++ security
>>vulnerability CVE-2025-56005. "
>>> ++            "Pickle deserialization can lead to arbitrary code execut=
ion. "
>>> ++            "This function is no longer supported.",
>>> ++            DeprecationWarning,
>>> ++            stacklevel=3D2
>>> ++        )
>>> ++        raise NotImplementedError("read_pickle() is disabled for
>>> ++ security reasons (CVE-2025-56005)")
>>
>>And, also, this is quite a breaking change for a stable user using this f=
eature.
>>
>>So, I can't accept this one. Sorry.
>>
>>> +
>>> +     # Bind all production function names to callable objects in pdict
>>> +     def bind_callables(self, pdict):
>>> +@@ -2845,27 +2829,19 @@ del _lr_goto_items
>>> +     # pickle_table()
>>> +     #
>>> +     # This function pickles the LR parsing tables to a supplied
>>> +file object
>>> ++    # DEPRECATED: Disabled due to CVE-2025-56005
>>> +     #
>>> + -------------------------------------------------------------------
>>> + -
>>> + ---------
>>> +
>>> +     def pickle_table(self, filename, signature=3D''):
>>> +-        try:
>>> +-            import cPickle as pickle
>>> +-        except ImportError:
>>> +-            import pickle
>>> +-        with open(filename, 'wb') as outf:
>>> +-            pickle.dump(__tabversion__, outf, pickle_protocol)
>>> +-            pickle.dump(self.lr_method, outf, pickle_protocol)
>>> +-            pickle.dump(signature, outf, pickle_protocol)
>>> +-            pickle.dump(self.lr_action, outf, pickle_protocol)
>>> +-            pickle.dump(self.lr_goto, outf, pickle_protocol)
>>> +-
>>> +-            outp =3D []
>>> +-            for p in self.lr_productions:
>>> +-                if p.func:
>>> +-                    outp.append((p.str, p.name, p.len, p.func,
>>os.path.basename(p.file), p.line))
>>> +-                else:
>>> +-                    outp.append((str(p), p.name, p.len, None, None,
>>None))
>>> +-            pickle.dump(outp, outf, pickle_protocol)
>>> ++        import warnings
>>> ++        warnings.warn(
>>> ++            "pickle_table() is deprecated and disabled due to
>>> ++ security
>>vulnerability CVE-2025-56005. "
>>> ++            "Pickle serialization can lead to arbitrary code
>>> ++ execution when
>>deserialized. "
>>> ++            "This function is no longer supported.",
>>> ++            DeprecationWarning,
>>> ++            stacklevel=3D2
>>> ++        )
>>> ++        raise NotImplementedError("pickle_table() is disabled for
>>> ++ security reasons (CVE-2025-56005)")
>>> +
>>> + # -------------------------------------------------------------------=
----------
>>> + #                            =3D=3D=3D INTROSPECTION =3D=3D=3D
>>> +@@ -3225,7 +3201,15 @@ def yacc(method=3D'LALR', debug=3Dyaccdebug,
>>> +module=3DNone, tabmodule=3Dtab_module, star
>>> +
>>> +     # If pickling is enabled, table files are not created
>>> +     if picklefile:
>>> +-        write_tables =3D 0
>>> ++        import warnings
>>> ++        warnings.warn(
>>> ++            "The 'picklefile' parameter is deprecated and disabled
>>> ++ due to
>>security vulnerability CVE-2025-56005. "
>>> ++            "Pickle deserialization can lead to arbitrary code execut=
ion. "
>>> ++            "The parameter will be ignored and standard table files
>>> ++ will be
>>used instead.",
>>> ++            DeprecationWarning,
>>> ++            stacklevel=3D2
>>> ++        )
>>> ++        picklefile =3D None
>>> +
>>> +     if errorlog is None:
>>> +         errorlog =3D PlyLogger(sys.stderr)
>>> +--
>>> +2.34.1
>>> +
>>> diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb
>>> b/meta/recipes-devtools/python/python3-ply_3.11.bb
>>> index a05bd6702d..41bcac2be8 100644
>>> --- a/meta/recipes-devtools/python/python3-ply_3.11.bb
>>> +++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
>>> @@ -8,6 +8,10 @@ LIC_FILES_CHKSUM =3D
>>> "file://README.md;beginline=3D5;endline=3D32;md5=3Df5ee5c355c0e6719
>>>  SRC_URI[md5sum] =3D "6465f602e656455affcd7c5734c638f8"
>>>  SRC_URI[sha256sum] =3D
>>"00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3
>"
>>>
>>> +SRC_URI +=3D " \
>>> +    file://CVE-2025-56005.patch \
>>> +"
>>> +
>>>  inherit pypi setuptools3
>>>
>>>  RDEPENDS:${PN}:class-target +=3D "\
>>
>>
>>--
>>Yoann Congal
>>Smile ECS


