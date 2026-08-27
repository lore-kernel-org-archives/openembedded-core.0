Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB124C61DBD
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 03:29:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28406.1787801359916230911
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 20:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lcylATvq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2699cd3361=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R3HvqJ1346205
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 20:29:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-id:content-transfer-encoding:content-type:date
	:from:in-reply-to:message-id:mime-version:references:subject:to;
	 s=PPS06212021; bh=bDaqiVvINv1XdYH2+AZKfFQ+1gR6dazeb7vfuYt/oVs=; b=
	lcylATvqA0GZoIq7IHxtyD6dTlvBwAd2nJcQftXpU2gl06J28xA2jE4y8l1AN4++
	739GT65xvN+4o4oU67quQlHfPcUeG3OfPp+b7H5GuN3zNP1QYPZM6m1R5UIm26xw
	sqvjzzS16FI+6yKaAwKSDLGjdrvYVjnAAImeisSfS3Kt2dk0QHealj5EOFCmmf1z
	c5Z31r2c/kSADhN4KsFLFk71ZvYs9tfpIu2QdKYp66N85lA8+XhlLU4HZblLpj3y
	xH+c5Hs+u9XFodUuY3jz6IZf+c19hwjSnzF6s0HoaMgGZzR48HcsgeRSKnAZcE+5
	HXRVmUTHcdZ1DdWrtwsOzA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020109.outbound.protection.outlook.com [52.101.193.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gaawd84pc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 20:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXjZR0aoa12BpjhmN0vrD+3xKTe3zWDY+EQ8ynYpwJKq9tC45B4ULtcsXHBj8gXBH+Elfs8ZKExc7tKidCBUNLulbKSl7xHnMVlDUJPXu3BrCfO9mANVwUACVkpd9uBOxuIyScc1jEXiLdLTbIRR5E8NSPblM5tNZlDzOo+q0nbcNUDLBSwGqaDo36kWAzCbu0O0rI11HfxHfGNnwar5RrxDFH23ptk/3huJHkLcAqVu/3IuLOyLwswH48nQYT11D1yYaiLCUU8CJhQ4FXJpZgUaME9ludx4Jb5Io/G/fiwQuSYi9FCP5f2wg3C005efWoORwc96vOZ0nfFhW//ctA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDaqiVvINv1XdYH2+AZKfFQ+1gR6dazeb7vfuYt/oVs=;
 b=qieChwdu1v4eq//VoqbEu35jGjnKwDQMDW0VJDu4Va46aEawGSy0tT86pGaIYDpvsTHTAp/P9hRD9vaBqhCQOt7STmduSPO08Nkv3vRWl+QDONFjuMWDC9NAqDIUK9A7gCO1d/MO6f4g+Mm7J4aB1WSz1Bia0IHQvPKwauAz/qFjQ2MYZTxjRBwqTPLzRaflPfauOtvAeHIE3P+0kjjddp2T3XnZr9pSYWtjtYFFS/SwCOmwrI1RUenrO2RwTrrgpTKOw2q2AE50X54jAnK6uUupUI/MFwbrfCjnLLuOqnfedAE6jcS9soqAf3MC0DIMJ04LiL8oNS1nCrJxZMC+Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by LV2PR11MB121525.namprd11.prod.outlook.com (2603:10b6:408:423::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Thu, 27 Aug
 2026 03:29:15 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0360.005; Thu, 27 Aug 2026
 03:29:15 +0000
From: "Gavini, Sumanth" <sumanth.gavini@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
        "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
        "mattware@cisco.com" <mattware@cisco.com>,
        "esparlin@cisco.com"
	<esparlin@cisco.com>,
        "peter.marko@siemens.com" <peter.marko@siemens.com>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [OE-core] [PATCH v18 10/16] pkgconf: add /usr/bin/pkg-config to
 RPROVIDES
Thread-Topic: [OE-core] [PATCH v18 10/16] pkgconf: add /usr/bin/pkg-config to
 RPROVIDES
Thread-Index: AQHdNaRMgoZ3rJr+Lky29+rrdp47O7aw9nkAgABGtoA=
Date: Thu, 27 Aug 2026 03:29:15 +0000
Message-ID: <595128f5-59de-4d20-a602-455c012a25fe@windriver.com>
References: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
 <20260826214548.3002838-11-sumanth.gavini@windriver.com>
 <cb8e455c527739e2777cca0e026d9f9aabfce81a.camel@linuxfoundation.org>
In-Reply-To: 
 <cb8e455c527739e2777cca0e026d9f9aabfce81a.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9256:EE_|LV2PR11MB121525:EE_
x-ms-office365-filtering-correlation-id: 29bc70e2-ac1e-4d0d-40cd-08df03eb5f1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|6133799003|18002099003|22082099003|4143699003|5023799004|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info: 
 1cInmj6RHSdLHZpnnF8SXw1xgn+YY6012n0w+BsKaPjOp1O9HxjsGT4km+4KpszwMGQUsT0uObOO9vVc2853MsnsIcYWnXSQJIcg5Sjs+wOVhAvZOJY/pvNy9vZO84ZfOG/+xISsjzGPspktPAC7vuOqdePiEjv88H/CPiLjkMRxJdAP+XR8dOMdydmChSCxln0mpG1XfFfyC/FJB3iEqaXnApPgk3lkggd0ou1KHnTv0L4COi3yIB3wDqJsr1iXgl1p48K6YrXlohfS5HJ4uLV4HlA0wKVEBN7O/a1/L8B08JhZ8iIT+kyrXmOurOt51Oso/BBpHxtlLVR8aEmNPu0wCWNpbiQzZV48KxBosXLIf0t1xsqDvrckm3RqRBRXijkVpxNXyLKBezmcyaG4Gjo44y4+ZrlLrV4rOBD9APxx4ZkNvvcBs2R4BEwblovOX54SQdI0e2S+0hKUdn9BgcIebOXqVWlc6nphgPefc0NWfn4pPoe2ye/cvNvKNEx8xaWj4WkFUXM1EsoThpbtDSPpvcW459touS8ozyMY6tdc+6nhtf4+7svKVomY575vqWVULGiU2yWeQJLdN8YTFc01MHYnxucjhNxxbJC9isRRFfMjuOwe+peH6GmT7Ir4Q6K54RP7CJFnuCF4G0iwBph9vGXqeiT+IBHIrfsqvjA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(6133799003)(18002099003)(22082099003)(4143699003)(5023799004)(11063799006)(56012099006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ekRDUjFwZHU0Vk9sSVFLWEZtK0VLS1YwbmFHQjlWL3FSczlrRXpDWDhpQ0Ns?=
 =?utf-8?B?WjJFRTZiTjQyMmg3TC9ZdkNESkFMb050MTJ3U25qbjZ5bkZqcktFR3hNcmNx?=
 =?utf-8?B?OHM5YWFZcXdIRzZsVVZ0L2VydmNQWXBsVm5OWGtOMEpNSWJjb2NoUFNJaG9m?=
 =?utf-8?B?MlJFRitpTWVnM2labm5LelZMalIwR055MjJEYkxSMnE1dG1id0lNMXdZa2pz?=
 =?utf-8?B?dUtsZEJuMkg4anpOQ0RPdlZYVjJWWmV3UjBhazNYL3dLRHhvV01ic0ZmVzht?=
 =?utf-8?B?elRDU1BFTlVQL3hmQ0I5QUtkeS9yelkveUVxbk5uaExCS29RemNwSUhXbE9n?=
 =?utf-8?B?L1ZsZ0M3d2NjTUE3dzhsME42cVlOTHhIR2FaWUQxM3d5V09DOEk0NXlpSU00?=
 =?utf-8?B?Z2NmQTlrbUxYRzJaUjY4Nm5NR2J3OEhZbXFIWDVMNk10WjgrWWlCbWJ6K3NB?=
 =?utf-8?B?SW44a0J4MzZFN2c4em90b2QzdG5qN2NvMVkxVk5kUTdBMjNnYzFFTEVWSVB6?=
 =?utf-8?B?VEFnS2xldUZyYkVXSG5LMmptQWFaN0hVWnZwL01Vc20yNUlpREErM0pFRWN1?=
 =?utf-8?B?c2VRTzVxMWJvQnRLWDlIZEpoSk9PMUlYQlQwdUVVczAvNGtHUytzcGNwRU84?=
 =?utf-8?B?YTdaUTlXelBvamtmUVlOWEhxN1JzRXFyYWI1cHJFbWg4NHlPbXQ5b2FkT2JV?=
 =?utf-8?B?b0RnTlVLVEY5NEJXM1Ewd3JJQUhtVnpHZmJQMmdHNFdzWEk1NU9oK21DQ2lz?=
 =?utf-8?B?N09xL0IrMldHYXB3YVZYZ0FtenBxSkphK2EvSERtYW9zcC82YitMNVZNOHNj?=
 =?utf-8?B?M205V2pwdElVN3oya1BZcWV0MEt4MVJCWjRudUxHVTFOc1V1djFOUFNPdUNt?=
 =?utf-8?B?V3ZBK0xUcjM5Q0o2L2djMGVNTExCVTlQdVlLQ3VUaS9lMTEyZmpXdW9UL2s5?=
 =?utf-8?B?WFVmNjFCWXF6blBtSXI2REZGak56a2tXWHVCR1hjZm5QNFJETmtRbFVQSUFx?=
 =?utf-8?B?eWZHa0RqOHVBajh2RE01VmcwWWw3VHFnTWMvV05aRXFicXMrL1ptSU52bEFS?=
 =?utf-8?B?TmtUWnk0a05PT0VpbmVlMVFWa2tVTzhKdmg5ZjVSYlV6dnh2WmZBSjIzRGhE?=
 =?utf-8?B?TFVrOU9GSFhBZWFXVDVwdTd3SW9ycm9OcXVnengyMC81WUxvWjBMd1VFYk43?=
 =?utf-8?B?bXRmT1RyWHlHYk5ZaGplajZZSVhEcEpjMXFRTTR3MFBqVi9ZQXo2clZ5S0ha?=
 =?utf-8?B?b040VUttNThJM0hod284NlRaamFpTHZRaUJWZEsxc25BQ05tcjZnQWZRU0xR?=
 =?utf-8?B?VGdsYmN2N0I4K3NlZHlFR0NpejVpbXpLSHlKdDMxaDBRUmNsR0UvWElHUFly?=
 =?utf-8?B?aUhMYnJqSlUxVzA2NDRMeWRCbWxVcGVrUFBYbXhiVG9BR0tJdXVSb3cwbCta?=
 =?utf-8?B?dFVRSnJRNGZaSDBJQzJLdEZjNU51a0FETEFJSDh6ZXk2SWhxTkhVTThoSjd3?=
 =?utf-8?B?Q05SQlIycnBNdS8zd2RjTTFhbUtEZ0ZuY01rUkNpSUEvUndFWm1samxLY2cv?=
 =?utf-8?B?c3hNaFhELzhDVjdQZlo0cDZxT01lVHRmU29CWStsdGdNb3VlRXN5eS8wam9r?=
 =?utf-8?B?WVR3WEFnb3pvbUluY0o0S1lGeFBia0trdnd2SFp1dGVPOGtkM0FuQVBaNWhp?=
 =?utf-8?B?cE04a09xYnlKL0Z6V1ZTL2VJWmpGcCtVVEIrVjFhaGI5RkI2NGJMVUJQWngy?=
 =?utf-8?B?emtFRWlqWURpOElldll2MkZIUDIxc0luOFNIM0hmRitkeXV4UEx6aHU5WVpJ?=
 =?utf-8?B?V3BGckhudGpBNW1DeWFXUmVwd3k1cU5MOW1HR2NvdUlrTzdwdGlGRHhzNUpy?=
 =?utf-8?B?SDArNTRHRFpPM0VleVR4ZG9ySlpxZkFSbTZjT3hSYWRpbVVBSThTVGhHbnF5?=
 =?utf-8?B?STZqZDAxL2tvdngwa3FHZFdGVVNoNVE4WHNaZ2dGd3NUM21ROHpndVVhOVFi?=
 =?utf-8?B?aWR3N21iN2RMcysxNmpiMnkra0JYakRxRmRWWHZPeUE3N01nL3h4SU0yR2x2?=
 =?utf-8?B?S1VVZVdhaVJrV21Rb2YwUk1TR2gxTW5CdlJWVTRZMUhBeFM2Qjl6elJHNGFq?=
 =?utf-8?B?SFRkSUFORUM0OGZoWllReWtrZis0ejc0T1FYZGJzU3FhNDFRSlBZSmdGSlZT?=
 =?utf-8?B?RU5veDY5NVlGcDUxeGdwVWVkKys0WEl3WHRYUFBWeDdCdGVpQXZVU3VmdmlE?=
 =?utf-8?B?MUlGVXJOMGsxdWJoNTE3RnFOc0xrWDU2MkVEb1VNWDJLMWZOSFZHbFJFTjdS?=
 =?utf-8?B?ZmYzK2tKRW81T0dCNTN3SjVxY0V6SXBuRDc2MlJqaG9FT3JoOHRoWllGOElJ?=
 =?utf-8?Q?FxEQgp3uVrk0nuLuWJ2G4IGQw2n23PbAnalwL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <101B9B759DF0EB49B5F3CF54C8C9DB41@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	kFNuDVku84HQwgqedRpmaOQWStC2GC1uo1I/NxPGDERo/oStSfuQvzD/pWRkD8pZ1FUubFgKRdTna7CFZ6DNnzIa1ZTrO5LdsJ5Yl41E8aDwFxIiXpUj9U8BeCJjXHZbnaqCCOSHeYyWXeJBUb0pG+HYpNBT/N080SjFAan0Zbg3ut3rzzNKHI16+pY4UbNHKtcelvX2mHU85JBAiklakQpTsB7XPl0jk6ejYDJyDaJRqlYWkbrhJhdJyABEkQU68vD4N5fmfWboN3OG8dl+Q02F3Rnpaxd9ZPfB5s0j3FcAvZRcVpKTQ4d6HH+XpT2oeDSlWTcfIi3fHan24mOIlA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29bc70e2-ac1e-4d0d-40cd-08df03eb5f1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 03:29:15.7665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YWql4sNdgJXOnO+M8Rx8aRPr4CM9yqMuka5j4Y2cCU27IiSh2B9TMhJtp9R32l6JZ0NmUZB3+mewQy7dvJl4YTWzSaP/tV2YU3Eg6lpHsh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB121525
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDAyNSBTYWx0ZWRfXzreG+oTJONZj
 skzksLPUbjQFm94KJRWYttX6GGyzvKWiSkHzSWSh7Zlz2NU8v/Jv5EkvEhS6eoUUOjWVH4KjUbu
 8n7bQttwhj0oBWJ6bLU0YAG+tdqIIs3RhgQjpSir6tS9h6ZqBt3z
X-Proofpoint-ORIG-GUID: 8EHDBbtTAYiGqME1v-qoPTNErwfI_qQ8
X-Authority-Analysis: v=2.4 cv=CcQ4Irrl c=1 sm=1 tr=0 ts=6a8faf0f cx=c_pps
 a=cqkZ7RzDZd4RD9VGRo3S+w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=NzkYBEk6AAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=ogZbaUIKQ5VWQx5k_7kA:9 a=QEXdDO2ut3YA:10
 a=zqED95DPWUTvcrp2mxve:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: N4YldE7mxMXvrNPrNcUOVxDAOY4wjBeU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDAyNSBTYWx0ZWRfX3MsrPFKgYOTH
 jlrPjWvF8SscPJ5sVbxy5INALqIBN9Zm44d7M8xmuJ+tROmLwnzrQbQWiawYr7Zik90qg8pcWRG
 R6lGS+JaH73FrP1K/ncA8mGdc7u8IKtDNe2kzN9lGLfjbjxystpfGQuTlDIhpOPBH/g3GtYJI5H
 DRcsS9k3tWYWSr57HIRnES6K+w8Zj+4XEJsRyeo7eygm1lruzvCw5BusfVzr2+zPqD9EVu3sjY0
 qkGF7QhEuFQ96OQ6roZ8EgqNyvWGOkA3gyy1A3K1MF9ESFMWCOXPepRLu1BT41Le28HZMm7CzFr
 b/tKR4UD075q76m0mqHQlhmcnUcymBFWF/zD4oL16MgHWh61eNOB3HLiFLrgYg03sl6k0W1PEfR
 Eh9ot1fU12VCM3WirrGDinCPMEKAWJaBgqwIDKQJwZPRjJnZds0mkeXfE1wRib+D26J08McJrn+
 8L53ly8l08OVZcn4xCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_02,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 03:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244445

T24gOC8yNi8yMDI2IDY6MTYgUE0sIFJpY2hhcmQgUHVyZGllIHdyb3RlOg0KPiBDQVVUSU9OOiBU
aGlzIGVtYWlsIGNvbWVzIGZyb20gYSBub24gV2luZCBSaXZlciBlbWFpbCBhY2NvdW50IQ0KPiBE
byBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6
ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiBPbiBXZWQs
IDIwMjYtMDgtMjYgYXQgMTQ6NDUgLTA3MDAsIFN1bWFudGggR2F2aW5pIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIHdyb3RlOg0KPj4gUlBNIDYncyBmaWxlYXR0ciBzY3JpcHQgZ2VuZXJhdG9y
IHByb2R1Y2VzIFJlcXVpcmVzOiAvdXNyL2Jpbi9wa2ctY29uZmlnDQo+PiBmb3IgcGFja2FnZXMg
dGhhdCBjYWxsIHBrZy1jb25maWcgaW4gdGhlaXIgc2NyaXB0bGV0cy4gQWRkDQo+PiAvdXNyL2Jp
bi9wa2ctY29uZmlnIGFzIGFuIGV4cGxpY2l0IFJQUk9WSURFUyBpbiBwa2djb25mIHNvIHRoZXNl
DQo+PiBmaWxlLXBhdGggZGVwZW5kZW5jaWVzIHJlc29sdmUgY29ycmVjdGx5Lg0KPj4gUmVtb3Zl
IC91c3IvYmluL3BrZy1jb25maWcgZnJvbSBuYXRpdmVzZGstc2RrLXByb3ZpZGVzLWR1bW15LmJi
IHNpbmNlDQo+PiBwa2djb25mIG5vdyBwcm92aWRlcyBpdCBleHBsaWNpdGx5IHZpYSBSUFJPVklE
RVMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogU3VtYW50aCBHYXZpbmkgPHN1bWFudGguZ2F2aW5p
QHdpbmRyaXZlci5jb20+DQo+PiAtLS0NCj4+ICAgbWV0YS9yZWNpcGVzLWNvcmUvbWV0YS9uYXRp
dmVzZGstc2RrLXByb3ZpZGVzLWR1bW15LmJiIHwgMSAtDQo+PiAgIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9wa2djb25mL3BrZ2NvbmZfMy4wLjYuYmIgICAgICAgICB8IDIgKy0NCj4+ICAgMiBmaWxl
cyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbWV0YS9uYXRpdmVzZGstc2RrLXByb3ZpZGVzLWR1bW15
LmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvbWV0YS9uYXRpdmVzZGstc2RrLXByb3ZpZGVzLWR1bW15
LmJiDQo+PiBpbmRleCA2MDc1NzcwYmYwLi4zN2RhZDU0NDA5IDEwMDY0NA0KPj4gLS0tIGEvbWV0
YS9yZWNpcGVzLWNvcmUvbWV0YS9uYXRpdmVzZGstc2RrLXByb3ZpZGVzLWR1bW15LmJiDQo+PiAr
KysgYi9tZXRhL3JlY2lwZXMtY29yZS9tZXRhL25hdGl2ZXNkay1zZGstcHJvdmlkZXMtZHVtbXku
YmINCj4+IEBAIC0xMSw3ICsxMSw2IEBAIERVTU1ZUFJPVklERVMgPSAiXA0KPj4gICAgICAgL2Jp
bi9zaCBcDQo+PiAgICAgICAvYmluL2Jhc2ggXA0KPj4gICAgICAgL3Vzci9iaW4vZW52IFwNCj4+
IC0gICAgL3Vzci9iaW4vcGtnLWNvbmZpZyBcDQo+PiAgICAgICBsaWJHTC5zbygpKDY0Yml0KSBc
DQo+PiAgICAgICBsaWJHTC5zbyBcDQo+PiAgICINCj4+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzMuMC42LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BrZ2NvbmYvcGtnY29uZl8zLjAuNi5iYg0KPj4gaW5kZXggNDcxNDMzZTdiNS4uMDI0OWM4
Nzg3OCAxMDA2NDQNCj4+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2Nv
bmZfMy4wLjYuYmINCj4+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2Nv
bmZfMy4wLjYuYmINCj4+IEBAIC03LDcgKzcsNyBAQCBIT01FUEFHRSA9ICJodHRwOi8vcGtnY29u
Zi5vcmciDQo+PiAgIEJVR1RSQUNLRVIgPSAiaHR0cHM6Ly9naXRodWIuY29tL3BrZ2NvbmYvcGtn
Y29uZi9pc3N1ZXMiDQo+PiAgIFNFQ1RJT04gPSAiZGV2ZWwiDQo+PiAgIFBST1ZJREVTICs9ICJw
a2djb25maWciDQo+PiAtUlBST1ZJREVTOiR7UE59ICs9ICJwa2djb25maWciDQo+PiArUlBST1ZJ
REVTOiR7UE59ICs9ICJwa2djb25maWcgL3Vzci9iaW4vcGtnLWNvbmZpZyINCj4+DQo+PiAgICMg
VGhlIHBrZ2NvbmYgbGljZW5zZSBzZWVtcyB0byBiZSBmdW5jdGlvbmFsbHkgZXF1aXZhbGVudCB0
byBCU0QtMi1DbGF1c2Ugb3INCj4+ICAgIyBJU0MsIGJ1dCBoYXMgZGlmZmVyZW50IHdvcmRpbmcs
IHNvIG5lZWRzIGl0cyBvd24gbmFtZS4NCj4+DQo+IA0KPiBUaGlzIHJldmVydHMgaGFsZiBvZiBw
YXRjaCA1IGluIHRoZSBzZXJpZXMuIERvIHdlIHN0aWxsIG5lZWQgcGF0Y2ggNSBhdCBhbGw/DQo+
IA0KPiBEbyB3ZSBuZWVkIHRoZSBSUFJPVklERVMgb2YgL3Vzci9iaW4vcGtnLWNvbmZpZyBpZiB3
ZSBoYXZlIHRoZSBwa2ctDQo+IGNvbmZpZyBkZXBlbmRlbmN5IGNvZGUgaW4gcnBtIGRpc2FibGVk
IChlLmcgYXMgaW4gcGF0Y2ggMTYpPw0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQpI
aSBSaWNoYXJkLA0KDQpZb3UncmUgcmlnaHQgb24gYm90aCBwb2ludHMuIFdpdGggcGF0Y2ggMTYn
cyBfX3JlcXVpcmVzX2V4Y2x1ZGUgaW4gDQpwbGFjZSwgbm90aGluZyBlbWl0cyBSZXF1aXJlczog
L3Vzci9iaW4vcGtnLWNvbmZpZyBvciBwa2djb25maWcoLi4uKSANCmFueW1vcmUsIHNvIHBhdGNo
ZXMgNSBhbmQgMTAgc2hvdWxkIGJlIHJlZHVuZGFudC4NCg0KSSdkIGxpa2UgdG8gY29uZmlybSB0
aGlzIHByb3Blcmx5IGZpcnN0LCBJJ2xsIHJ1biB0aGUgb2Utc2VsZnRlc3QgY2FzZXMgDQoob2Ut
c2VsZnRlc3QgLXIgZGVidWdpbmZvZC5EZWJ1Z2luZm9kLnRlc3RfZGVidWdpbmZvZF9uYXRpdmUp
IHdpdGhvdXQgDQpwYXRjaGVzIDUgYW5kIDEwIGFuZCByZXBvcnQgYmFjaywgdGhlbiBzZW5kIHYx
OSBhY2NvcmRpbmdseS4NCg0KLS0gDQojIFN1bWFudGggR2F2aW5pDQojIFdpbmQgUml2ZXIgTGlu
dXgNCg==

