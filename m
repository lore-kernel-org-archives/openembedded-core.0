Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB43C55167
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 07:12:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1227.1785481122941168014
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 23:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=arBMXodP;
 spf=temperror, err=temporary DNS error (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2672a00ac1=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V6Djd11662264
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 23:33:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=vGdoeVK5jDPXugiHAwc68q
	GqAA6OGkFQQKDJOf6V0SA=; b=arBMXodPcY54ciOrXwXp5S6waKkmy90DkdkV6E
	S2SG62kck/8J87rMAAamyoazNx6qYbwkrdB5GzXocPhK+SA0WzUAt9xhrIX8YBfX
	xSUrqaZkz4g6zQAXdj2SFhkwGI7MsjPtYg+dpd5YS/m/bPB8AHWjdAF4NPzjq4U6
	oJi+XxRoaVan55iOjFysDGtY3q4JKc6y364mKhR2MouVK29ma1se1a1DiedmlVcC
	Mxkl7q7yU980Drfk8tw+HwWRLjpbhQ6amnMTHPFwuoJ6pRNhwPgoiKSjwwD8vYA/
	eXmutl58O/OmZZ6wCUWbhPcZf0ENJUOtem1W9w+Wr4NKgmuw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012059.outbound.protection.outlook.com [40.107.209.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4frp7xr0gu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 23:33:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQr8MbOJZyhEL+e1xabjACQjXr7bi23MwJrlUrNIDUKqagT1Liry9qXQWmInzTnzw9gLdM2QGBBqMfOM8Pe0FnWrr5TgkWIhUi5ddmWrm5YymhGt8Wn3+UV+O5JNnBv/TzrP9TeIGIsLAz/6cJKmUvCOHFNQA/wSjqDEKr0NTZTNGCHyYSbx8i5n8ehkrr5aELBQrGuX1YxNp7HGD5evqmDkKEKYTLtvsjVEUbeO+GoBcwjYREX0igY6R0G5wtUAlQQSuR03uh3ssTxCYeJ1kfnkzviecVUimhTyS+KTgj64EutNoWS3sm0O80lo2kS21RK6kYymyvHsW6ZNqXd+/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGdoeVK5jDPXugiHAwc68qGqAA6OGkFQQKDJOf6V0SA=;
 b=ecneGhvpeniDxtPCPeuY/hTRtznB4UwtIIVaJjVz+GdA8Lrd4QR2ol3Orq0GXCu3xB4XBuMX11FV0Iiui3zap8OlNb1asxa+bs5g5JnQXvnmzbE20MqVlvdchrHcpVlKrx2QG1MUQmx/WXnBXWBlOz42Iw44YPLWOnmfnRMixpboK7+envJ2rfMk2CyyaLSrcgtf+hKM7VJmhLlbm9GWMqbi+bJ0qmO0CZwQCmulK8hTckK7oerK0W2EC6Z14zGaUuVArAxr+WKXoDqW6e3tKwGPnUKGZktR9/gd40w4WZpasQQtJn4TpSG5YCZ++8mjdnLg5rE+tIZNqGrfQghqvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15)
 by IA0PR11MB8335.namprd11.prod.outlook.com (2603:10b6:208:493::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 06:33:18 +0000
Received: from CH3PR11MB8774.namprd11.prod.outlook.com
 ([fe80::8925:311f:7018:b3ec]) by CH3PR11MB8774.namprd11.prod.outlook.com
 ([fe80::8925:311f:7018:b3ec%5]) with mapi id 15.21.0270.015; Fri, 31 Jul 2026
 06:33:18 +0000
From: "Barde, Himani Ramesh" <HimaniRamesh.Barde@windriver.com>
To: Paul Barker <paul@pbarker.dev>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "Komati, Shiva"
	<Shiva.Komati@windriver.com>
Subject: Re: [PATCH v3] systemd.bbclass: fix service enablement for cross-install scenarios
Thread-Topic: [PATCH v3] systemd.bbclass: fix service enablement for
 cross-install scenarios
Thread-Index: AQHdGcLZdy0iaYgSoUS8gQ/EL2wnjbaGKWIAgAEO+0Y=
Date: Fri, 31 Jul 2026 06:33:18 +0000
Message-ID: 
 <CH3PR11MB8774C3DADBA455D8721EB8198FC82@CH3PR11MB8774.namprd11.prod.outlook.com>
References: <20260716061519.765593-1-HimaniRamesh.Barde@windriver.com>
	 <20260722101408.3225399-1-HimaniRamesh.Barde@windriver.com>
 <52bcf8634847de61960bb1e33f613abf4d11576f.camel@pbarker.dev>
In-Reply-To: <52bcf8634847de61960bb1e33f613abf4d11576f.camel@pbarker.dev>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-07-31T06:33:17.214Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8774:EE_|IA0PR11MB8335:EE_
x-ms-office365-filtering-correlation-id: 6d807d5d-0d64-4f80-c646-08deeecd9bb4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|18002099003|22082099003|56012099006|11063799006|4143699003|8096899003|38070700021|13003099007|6133799003|10067099003;
x-microsoft-antispam-message-info: 
 9/E6HxGORak9CQHrGXb0vJ3RGRw5EEOP5CUXOHFwNaSTH+4vEhgt5GCzWphl6xkG6V8RNBkVZ6HViPkVTFM3A+xfNLCUEo/9hv1P7y7bCXmeAcudDgItFLcygxNBS+nYKSbW3aobrIUOJ92zQSTkMsh/a3JEXcGAp8BmeFDikygeo7erVheXNHKnsE90NU8FCHnopxrULEfZxGbCxuvn13Z1MfBNPxnUhd9q1FJw/J12O4kEMq3J8TW41+rKwN2kb4hExNWOAwv8fhNg8Y76N1Os9gKqVUsX+e0zqjK7XQvRvOgXEmGJb1XRJC1Rrh2FTkiofcUbgpG/9NNk4DZ5JmWnDwV3be62Gxcva233PVuwHMMm/tAUaqOaKUwc1eGOu7XWuP3H2KDSBuGF5PC4tOORvMHheagkpuebL5BdONKTrFfkYvAYG9bsDbH82j3qNDaTaRyVqV4AyyUbPV1OPfTPITQrvgZW1ooWXmQkGTfG3dAOp1hr8njRNUFB6WTdUK03TzatMoHgLnWs+x25EQPPd6c/8WBJXbvfKtCD0j1x/044nuZOUmdzu2Qj/5sZwQTtxCCz/dGfPNnMKZinHG/gUKX1XXmzl+sf9NBLFG7GO9A7IDGmsisETmlmOjJ5p4BerEk/nBcGDMuivI3w0recP9c1poxhauLGkBEvxsE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8774.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(8096899003)(38070700021)(13003099007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?6zpX2Fk49/9QjKOIJtGiIVcIQQW0u6Whux/yFlmlvfDtaMZ9d5rZYJurwy?=
 =?iso-8859-1?Q?IbQ5v0G1o1N9+duRxHSGPaz9GlAfzw6QNuY4llOxjzyNTvUBUXKFy9Bl5d?=
 =?iso-8859-1?Q?xz+opkpxzsa3+fwdHij3fm+vEEAQo7pQd69oOxctdFiODCYeuR/V2HjGJO?=
 =?iso-8859-1?Q?som4yAL2AF55Bc8nmon1r+PUU+RSCT6l/85NokPSUsaP7nRt43smf3RrR1?=
 =?iso-8859-1?Q?f24aE+X3sf8Qz1T8fcGbdmiLWaTaWwtzKVVMt5TdDjlJ6kCw2B3g7/xISH?=
 =?iso-8859-1?Q?+e94FTPruetxXml0OPagTAtU4sPnks18Ssipm5QVpaiLtit1ISbIkt3Kqg?=
 =?iso-8859-1?Q?wsmGbbU3zA1lpx3o9UQrYHYnM6j9SseIXIM4z8pxn9V9TfCasKIcirZHEt?=
 =?iso-8859-1?Q?4zvGZyTl14CyS0wOP2zrYLeZWKrBCA4TjJz9YP86N8knWCBQ0BYmZj9Uzx?=
 =?iso-8859-1?Q?h+y0u7nWnjXMWcwOYKzVKQANMok62rc+TPLP98ES5c5QqisdiyiMtwdAgH?=
 =?iso-8859-1?Q?bx/tWzK9m6CnxegPBx4VME6W4HvyZobTmR9aONQms0d17lqMiQ4SRLn6Uk?=
 =?iso-8859-1?Q?OEVtp6JBqQiMn6JA139iuK7f6lj4qArUJvbViHrL0XOowSI1c40EHKE5pa?=
 =?iso-8859-1?Q?7wjlXS2BInCwKBZ9i938GZHKW8+4hxk1go86jsXxTXkn9Kq2aEytNGGShX?=
 =?iso-8859-1?Q?+ESa4Ps2/lo27dED3Zb202tnFVsLLPe+J08h4oTtXsXgOyzvkme0IdQ3CZ?=
 =?iso-8859-1?Q?pl+BZXM6CYOxw6CJUQ/O4HTZspeUrHN4s6gjOvB1luSobenqabdGPiOELr?=
 =?iso-8859-1?Q?jGgHkRqph+AIG7JIzxwU9+g3iesHA7ZgRYX6zZuu03DnxSGrAGIsc9lHY5?=
 =?iso-8859-1?Q?3x6Cgr6u/CgLt0Am371pTz+rUroLCW2K2pbuEBBbPzbW2rQ57xmSbEmQuE?=
 =?iso-8859-1?Q?AioYyz9/3dvRIy5drSjiu291A3wlK+875M6p1zHCwK9UA+CtBR34i/YHK5?=
 =?iso-8859-1?Q?OMdBwyhOFhAT9OPwPuxQEU5C3Tfl6TjtLuoVaV9T9//EGHjWHt+omU7hSc?=
 =?iso-8859-1?Q?NkkJRwgATYrizwE/VVVmz3dkH6Pe8mNg/sgKamzvSi7xcwHm0FTyZCcGjK?=
 =?iso-8859-1?Q?EjNboFw2WA1Jv8bLJr76f+x3PdV6OrlvOL/Rla8lJeqH0FVJ6H9V6QsOHB?=
 =?iso-8859-1?Q?xjIzAj0DGWKrO1Qox/7zGE6iOFYPr1G+zBDGuQqGFvhMZFJJ/27TeuLPs7?=
 =?iso-8859-1?Q?UYAsB6ZFN21+AkoUgGYaVo2+BXKpZ88LSo6QV/bhExhQGu0dPXfwhMc/sH?=
 =?iso-8859-1?Q?KQk95yyD1SrbtRQGuaHv8EsPmrQ2Fv9J7hWEqgOPFCqfIMro/SRn7RqNKx?=
 =?iso-8859-1?Q?dO5l3+dDcRS/DlVme3/E4cgYuUcvLso51wiwe6kfGvbaRkebdPAiDsx6QP?=
 =?iso-8859-1?Q?FVa5QB6RmLhignyYBl0bYKHUzryLwTNevHUveFKTpJZR3x7A6pMsXZJ31L?=
 =?iso-8859-1?Q?o1+z6O/7Ulc4GSvZBF2/FUT+SQG+xDUgEwcn2+hWumCq291rkUpv4doWR8?=
 =?iso-8859-1?Q?PUVSGPCpkqV+K5smlCcvZJ5V/w27/ADPz1bCIGlb/UiLj6NNVVKr1sBmzp?=
 =?iso-8859-1?Q?G25Tx/0cZU7hSS8BaVFcUFT6byQryXoUcRo4ej9d1tjrVz9kKibZqMAAq3?=
 =?iso-8859-1?Q?67jMCQmbRL3blEwcrWeRqpgRD9Ky/rxmhNtwQNJKosNUiKpvmOQvlzkwu7?=
 =?iso-8859-1?Q?ktn7etAjxcdBiEF/2kzanViUvCoFKmOoGNduTpsBRDgjFkZgPmA1rY3p0+?=
 =?iso-8859-1?Q?9kzUiBZc6EpqhItKtObbbVYBxgCGzCklUU7tnSAs0xRcKbpThjMxvXQLRs?=
 =?iso-8859-1?Q?nm?=
x-ms-exchange-antispam-messagedata-1: n5rwWR1FeAghUQgaEe8/gPpDIeGb4QcspIo=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	lf1clhCGEXI1VsxM3Sp0ufSh7DWOHsZckKKByjv6x9MsMZ9IoyMu5EfyDbyMRx29og9iNBGqN1rb8tN7pN5pYqsc80gBQcBCIQ7gQrYGDitZTyZ+wpQCeDG8+NYmwDBBySdLvvPGZMOAHjn9DpdpDlVOcQT4h29aW445/LjgEa+ZjiuQE4hjrlWg75ITPlQwvV9CYF7tandbrhZRiTTAEw6fbijQN8FKlCTq9h1BPYJlIOzgTRmmwUa5PnreGKXqM+Z9noi46RG/fNp+ung2N945w+n5kHMIKyatZcLGFndi+DeSorjXkfjFPFeK+sEvHxaZP2CFjxq2ORvfMXnYXw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8774.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d807d5d-0d64-4f80-c646-08deeecd9bb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2026 06:33:18.0688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 26WJxYRNlrSyGaiOH1WoNJAiefCTMCiYEQr4gfQ3+v3ZaDS6IphKSaEICJa2ovsO8nGPGkrfcIW3zW7jn81C4GC+aDuMpOVHNZiYdnIz3cgS9e7IWPPHsc4zlD1r3E6l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8335
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0NCBTYWx0ZWRfX8nBPqikJgpyz
 6DmRfBOyUd19Mo61Z4ow78c4JVHfaip8/Dnpg7XggRQBmXxUpwnWgGS8IAc053vN2JV5c+ERkZH
 zJng0UjQfTX8t3N58pH41N4yKsnydwiBs3UGVGEOxHFCYjSjgxUK
X-Proofpoint-GUID: nTMpMdyVqNbSUsgTYe3AkuGRCML500DZ
X-Authority-Analysis: v=2.4 cv=DptmPm/+ c=1 sm=1 tr=0 ts=6a6c41b2 cx=c_pps
 a=e24IK3jsPB00aLvKg+wNHQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=y7M5dpoWvHKhGoIBFTQA:9
 a=wPNLvfGTeEIA:10 a=AYcOGIO9QTV-QxxKPE0A:9 a=ljZk-KepJWKLKho0:21
 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: CwP5SBs86XDW7M9o2-Kxkd0yGCN9aPjM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0NCBTYWx0ZWRfX24oB2+rlMClW
 OkT+V5Hanq+qzX0BdE02E2qLfWc96S7zwDgLXdx8I0GDOHKn5+Ypy345xLwMVQ/s46dJ5dukRs2
 9TCc6ZmOolW0StdaTrhlamMSFP6zSNoEOTIqiqFaMB1Q58HU1yFXd4YauPx3nosOt7GQS1EYKt2
 PkBxEqGtFkUOl4IXiuNoqK88d+4xZv4isLU4Vh+1pKfZ+biLIF67RMeVTONXREW05sSXTDCTeJw
 +Msy5DbbwaKGsGUnKHXloQGcS6AhYNdkAuVxV9dKMg6YA/G0RXCL5nxEvDCZ6vs6TeT/XhelnCw
 5UAQyfOE7uAU55/rD/9ZhMX3h3kFyc26OfiM/e9QDp1Vul9UijSVn4wg4sMX5+5PDBZKCacE3hi
 Za5j4CQZz8/lCaqn4c+Q1Cs9sgNHUiyDcAP42DIlTZ29rBfcAR5D7rArRFCRRZUT8kOKN/9Oe8Z
 2MNfPdfknsCg4m5b5rQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310044
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CH3PR11MB8774C3DADBA455D8721EB8198FC82CH3PR11MB8774namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 07:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242411

--_000_CH3PR11MB8774C3DADBA455D8721EB8198FC82CH3PR11MB8774namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

The use case comes from Bugzilla #14118 - https://bugzilla.yoctoproject.org=
/show_bug.cgi?id=3D14118. The reporter (Daniel) uses Yocto-generated deb pa=
ckages with multistrap on an Ubuntu 24.04 host to assemble a root filesyste=
m outside of bitbake.

Their workflow:


  1.
Build with PACKAGE_CLASSES =3D "package_deb"
  2.
Host the generated deb feed via HTTP
  3.
Use multistrap to create a rootfs from that feed
  4.
Run postinst scripts via fakeroot


In this scenario, systemd-systemctl-native is not available since they're o=
utside of bitbake's environment. The postinst scripts are run by the host's=
 dpkg infrastructure, not by bitbake's do_rootfs.

I understand the current behavior is deliberate for the normal Yocto image =
build path. The issue is specifically about consuming Yocto-generated packa=
ges outside of bitbake - which is a supported use case when package-managem=
ent is enabled, and packages are meant to be installed via apt/dpkg at runt=
ime or for external rootfs assembly.

Would it be acceptable to handle this as a fallback only when systemctl is =
not available (i.e., not change anything for the normal do_rootfs or on-tar=
get paths)?
Or would you prefer a different approach?

Regards,
Himani


________________________________
From: Paul Barker
Sent: Thursday, July 30, 2026 7:49 PM
To: Barde, Himani Ramesh; openembedded-core@lists.openembedded.org
Cc: MacLeod, Randy; Komati, Shiva
Subject: Re: [PATCH v3] systemd.bbclass: fix service enablement for cross-i=
nstall scenarios

On Wed, 2026-07-22 at 10:14 +0000, Himani Ramesh Barde wrote:
> When packages are installed outside of Yocto's normal image creation
> (e.g., using multistrap, debootstrap, or dpkg directly on a host),
> the postinst script fails to enable systemd services.

Hi,

What's the use case for this? I'm not aware of a reason to install
packages generated via a Yocto Project build using
multistrap/debootstrap or via dpkg on the host.

> The issue is that the entire enable logic is gated behind
> "if type systemctl >/dev/null 2>/dev/null". In cross-install scenarios:
> - If systemctl is absent on the host: the check fails, script is skipped
> - If host systemctl is present: it cannot find target unit files

This is deliberate. On target, if systemd is in use then systemctl will
be available. At do_rootfs time, we depend on systemd-tools-native to
provide systemctl, the intention is that we're running the native
systemctl binary that we built, not the host's systemctl binary.

> Fix this by separating the image-build ($D set) and on-target ($D unset)
> code paths into distinct branches. The previous code used a single
> OPTS variable to switch between "--root=3D$D" (image-build) and ""
> (on-target) within one unified block. This variable is removed because
> the two scenarios now have dedicated branches with different logic:
>
> - Image-build ($D set): Uses "systemctl --root=3D$D preset" per service,
>   which reads preset files from the target rootfs and creates symlinks
>   without needing the host systemctl to understand the target's unit
>   files. Falls back to "systemctl --root=3D$D enable" per service.
>
> - On-target ($D unset): Same as before - enable, daemon-reload, preset,
>   restart. No behavioral change for on-target installs.
>
> The OPTS variable is no longer needed because each branch now directly
> uses the appropriate systemctl invocation for its context, making the
> intent clearer and the image-build path functional.
>
> Fixes [YOCTO #14118]
>
> Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>

Best regards,

--
Paul Barker


--_000_CH3PR11MB8774C3DADBA455D8721EB8198FC82CH3PR11MB8774namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi Paul,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
The use case comes from Bugzilla #14118 - <a href=3D"https://bugzilla.yocto=
project.org/show_bug.cgi?id=3D14118">
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14118</a>. The reporter=
 (Daniel) uses Yocto-generated deb packages with multistrap on an Ubuntu 24=
.04 host to assemble a root filesystem outside of bitbake.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Their workflow:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<ol start=3D"1" style=3D"margin-top: 0px; margin-bottom: 0px;" data-editing=
-info=3D"{&quot;applyListStyleFromLevel&quot;:false,&quot;orderedStyleType&=
quot;:3}">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); margin=
-top: 0px; margin-bottom: 0px; list-style-type: &quot;1) &quot;;">
<div class=3D"elementToProof" role=3D"presentation">Build with PACKAGE_CLAS=
SES =3D &quot;package_deb&quot;</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px; list-style-type: &quot;2) &quot;;">
<div class=3D"elementToProof" role=3D"presentation">Host the generated deb =
feed via HTTP</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px; list-style-type: &quot;3) &quot;;">
<div class=3D"elementToProof" role=3D"presentation">Use multistrap to creat=
e a rootfs from that feed</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px; list-style-type: &quot;4) &quot;;">
<div class=3D"elementToProof" role=3D"presentation">Run postinst scripts vi=
a fakeroot</div>
<div role=3D"presentation"><br>
</div>
</li></ol>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
In this scenario, systemd-systemctl-native is not available since they're o=
utside of bitbake's environment. The postinst scripts are run by the host's=
 dpkg infrastructure, not by bitbake's do_rootfs.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I understand the current behavior is deliberate for the normal Yocto image =
build path. The issue is specifically about consuming Yocto-generated packa=
ges outside of bitbake - which is a supported use case when package-managem=
ent is enabled, and packages are
 meant to be installed via apt/dpkg at runtime or for external rootfs assem=
bly.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Would it be acceptable to handle this as a fallback only when systemctl is =
not available (i.e., not change anything for the normal do_rootfs or on-tar=
get paths)?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Or would you prefer a different approach?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Himani</div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b> Paul Barker<br>
<b>Sent:</b> Thursday, July 30, 2026 7:49 PM<br>
<b>To:</b> Barde, Himani Ramesh; openembedded-core@lists.openembedded.org<b=
r>
<b>Cc:</b> MacLeod, Randy; Komati, Shiva<br>
<b>Subject:</b> Re: [PATCH v3] systemd.bbclass: fix service enablement for =
cross-install scenarios
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">On Wed, 2026-07-22 at 10:14 +0000, Himani R=
amesh Barde wrote:<br>
&gt; When packages are installed outside of Yocto's normal image creation<b=
r>
&gt; (e.g., using multistrap, debootstrap, or dpkg directly on a host),<br>
&gt; the postinst script fails to enable systemd services.<br>
<br>
Hi,<br>
<br>
What's the use case for this? I'm not aware of a reason to install<br>
packages generated via a Yocto Project build using<br>
multistrap/debootstrap or via dpkg on the host.<br>
<br>
&gt; The issue is that the entire enable logic is gated behind<br>
&gt; &quot;if type systemctl &gt;/dev/null 2&gt;/dev/null&quot;. In cross-i=
nstall scenarios:<br>
&gt; - If systemctl is absent on the host: the check fails, script is skipp=
ed<br>
&gt; - If host systemctl is present: it cannot find target unit files<br>
<br>
This is deliberate. On target, if systemd is in use then systemctl will<br>
be available. At do_rootfs time, we depend on systemd-tools-native to<br>
provide systemctl, the intention is that we're running the native<br>
systemctl binary that we built, not the host's systemctl binary.<br>
<br>
&gt; Fix this by separating the image-build ($D set) and on-target ($D unse=
t)<br>
&gt; code paths into distinct branches. The previous code used a single<br>
&gt; OPTS variable to switch between &quot;--root=3D$D&quot; (image-build) =
and &quot;&quot;<br>
&gt; (on-target) within one unified block. This variable is removed because=
<br>
&gt; the two scenarios now have dedicated branches with different logic:<br=
>
&gt;<br>
&gt; - Image-build ($D set): Uses &quot;systemctl --root=3D$D preset&quot; =
per service,<br>
&gt;&nbsp;&nbsp; which reads preset files from the target rootfs and create=
s symlinks<br>
&gt;&nbsp;&nbsp; without needing the host systemctl to understand the targe=
t's unit<br>
&gt;&nbsp;&nbsp; files. Falls back to &quot;systemctl --root=3D$D enable&qu=
ot; per service.<br>
&gt;<br>
&gt; - On-target ($D unset): Same as before - enable, daemon-reload, preset=
,<br>
&gt;&nbsp;&nbsp; restart. No behavioral change for on-target installs.<br>
&gt;<br>
&gt; The OPTS variable is no longer needed because each branch now directly=
<br>
&gt; uses the appropriate systemctl invocation for its context, making the<=
br>
&gt; intent clearer and the image-build path functional.<br>
&gt;<br>
&gt; Fixes [YOCTO #14118]<br>
&gt;<br>
&gt; Signed-off-by: Himani Ramesh Barde &lt;HimaniRamesh.Barde@windriver.co=
m&gt;<br>
<br>
Best regards,<br>
<br>
--<br>
Paul Barker<br>
<br>
</div>
</body>
</html>

--_000_CH3PR11MB8774C3DADBA455D8721EB8198FC82CH3PR11MB8774namp_--

