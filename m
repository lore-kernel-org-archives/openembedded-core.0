Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3226C5DF66
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:21:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19586.1786922503803925113
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Y3BtIPPI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=26887e2f0c=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GNBT9b1161212
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 16:21:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-id:content-transfer-encoding:content-type:date
	:from:in-reply-to:message-id:mime-version:references:subject:to;
	 s=PPS06212021; bh=jVgA/+aE/prWME/KpAuFzsqRe/m+FrELmdcenRKGuc8=; b=
	Y3BtIPPIgADE0rY/RFWwBJ07gq/1SEk+AX3lXi7oRTo6gAJiEKaX5AP8jQ6qSsiO
	Tbycj3d6bQ1SudsLXS7UxaE8Wo+kN9zscUsMuwfuMjBldrGK4YygoScbhkENU+Vs
	ptb85BGFX+ZpMKRJHoWJMv6ut5p3uy8LpFziUN2jzJJsIfjyQDMFpl33JvudrH5Z
	WCzC2RYGKt9bSFE8KcybD79DuLsTqpvjHydK0RxrVT5/nMTL7wnmIbG/y59Ujh2c
	PuqrQGOkajRPVRyQTpD/VwSQgTmIYf3iEPFLLF+3xuHShtGtczcNYRUGADH8z2HS
	YDea62DKb1VGQ3R1KQ4yvg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022130.outbound.protection.outlook.com [52.101.53.130])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g2qmgsexv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 16 Aug 2026 16:21:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wl+cL8CTf1AI7ZdtRIq4MK6tvwMtnSkL/1IevjkYLP+rY3IEvu0g4IaFmsFmcivyC3DpJRAtKIE/Qksu3lNPyfNwKEUPmZrwsEg5hpE4G44J8PJ2FpCyPVX9RusI6YnDbNqxV5h9EGFsn+J6Hb1dsIYfDF6XGYFrQt7DNAF2VwqR9g/TIWZVLzXc6gPWm1i9JO6lQj2v05L2Xfe+wXkBE3roZdOMZ2tclPB0zvPUFKGTvMdaAZKVo+Rt1hVEFdZr5Ir3CaGdH1RITO2Mk2TdbZliOBhX2J2cKhJh2Po5LOBK2hqPF97VouQ8US0dus0ZKMePG4n9hU853EOAYTz9NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVgA/+aE/prWME/KpAuFzsqRe/m+FrELmdcenRKGuc8=;
 b=yncVNpc0dQiunfNEv6Uygll/mBKJsrO/t3LSA14ZM7KTkhnj4cquPyF5vNPlPNebJblli7pFko+ixG3TXCWeBbZRF348JCMF5go7H4ywsgGEJvng/JrsnKQNkxllyU6ZWe0kqVfiTfgN6fLqUlSRtxksWQMK6oxBfoPb19ZUn/OFnFkqwX70TbWGNqxVtSqp3vktv+D7xk84l4iDPAOZfRnyCsnJqTt6aD61DyAKPjT9GHBAzPpsm5fONlcoe+eDKJE2zMbAbsY1E8sD4mIrhzadbBjhCPRTq7EJ5F5jFR3Lh/Ru1noN2JCMOlc1YQ8bM+GflXh0UifFQuqnIvbSrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by DS0PR11MB8206.namprd11.prod.outlook.com (2603:10b6:8:166::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sun, 16 Aug
 2026 23:21:38 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0315.014; Sun, 16 Aug 2026
 23:21:32 +0000
From: "Gavini, Sumanth" <sumanth.gavini@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
        "mattware@cisco.com"
	<mattware@cisco.com>,
        "esparlin@cisco.com" <esparlin@cisco.com>,
        "peter.marko@siemens.com" <peter.marko@siemens.com>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: Re: [PATCH v14 00/10] rpm: 4.20.1 -> 6.0.2
Thread-Topic: [PATCH v14 00/10] rpm: 4.20.1 -> 6.0.2
Thread-Index: AQHdKrUw4GlPDWx0PUqeHLOqPf8fxLab082AgAKPDICAADX8AIACvbGA
Date: Sun, 16 Aug 2026 23:21:32 +0000
Message-ID: <8e2250a7-e6c5-4c37-a68c-740e28c96ea5@windriver.com>
References: <20260812234900.866436-1-sumanth.gavini@windriver.com>
 <DKNRRQM7Q3FN.34QV9VN15JGBS@bootlin.com>
 <4ebd8940-a044-4c14-8434-960ffbb0d525@windriver.com>
 <DKP9QR622BEY.1JP3LFV6R35WN@bootlin.com>
In-Reply-To: <DKP9QR622BEY.1JP3LFV6R35WN@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9256:EE_|DS0PR11MB8206:EE_
x-ms-office365-filtering-correlation-id: 251d77e8-bae9-4fdb-b852-08defbed1b90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|56012099006|13003099007|38070700021|6133799003|11063799006|5023799004|4143699003|10067099003;
x-microsoft-antispam-message-info: 
 Y+m362lSeOQFxIEsvDWzEuCc4hhU/FsiFdeuyPLPsuM/VA+tM3L3EUXBtXImdqneVGTgzWSemlJjQdOw9AABicDyTdSYhXd41UnYuh9L0c6AML+aOd4EWZIN4sSeojonl+qA1yiOXc6LUXmti/0ehZNnxAYyESqOvOFxXT016MPRMybQIQ3AB/tKnszD2y7OxrsnjSAPgcNpD3pA653e0APq/7PX53AsTyjTtHhHpj2+nRBIpMRHWbVJ1UFCjgOyex8CvOx3+mLw/rqa2RK4yiK7FE7QgNQ/mGEWDLFDnhFprID3MUbwANFy85K6lLQt1TG6UI5ZGJJSgSzT4OYFJ3Dnhz0Z7KIKVrvIPXIRxzfPzzLuNpYJ6zFjcaucsKqyIPGY0wNgHX1m989WrHDuqM33h3S/FejTZBaDTBHh7G/ueSO/8I0Ca40tnW1V7Jx2+osiBehe+Urh/8M9w+QbxMEnTwreNYl0/1U7gMNAeNZO9PeonWOs52l1OwraS1rTIuwo76QU42JGGd7gZzyISnODqXXZYN+NuAFQo4PYCX65U05dzyKeZRgSBfilFtx6MoHgw7sFELTcPpFGAPbISn+rXWgbDOGPf4GDFnWkWgE7+3JJG6PyX5KwBYK8pAyN/b7R+/vSkO+5K7s/vpzClufNmFvfVzOcgLbAnocg6XY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(13003099007)(38070700021)(6133799003)(11063799006)(5023799004)(4143699003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MVBMeU8ybS9Ndm9nTVdIUzhtNi9waUdKSFRvaStKR3JPVkg1eVZYOXNzNEZv?=
 =?utf-8?B?cTJLekdONlk1VSthNDFsampIMlVKVit1K2Q4dlNuWXBVOENVTjRlVjZhajh3?=
 =?utf-8?B?VG1JMm5TQ1NrQjdYSGpNVnM4V1dqYmNhWENqTmMrV01hd29KZ0Z6T2YydGJv?=
 =?utf-8?B?YWpkSXJQbHpLQXVRc0pYOTZhc21XYUdlQnJ3WllJNFVaaEMxMnJlUjMzY1FH?=
 =?utf-8?B?QTJmL1p5STBSTEp2b0o5S001Q2JLalhUMmxPUWlsTm1aR2VmRDhHemRZZS80?=
 =?utf-8?B?RGcwTjlvWEh1NVFCRFYrUFZEeXIzUnhxdURUaHJJeDJ5MUdFY3hKeXFlelB0?=
 =?utf-8?B?cy9sRk80TXNNZ2o2algzbzgyRi9DZ1dwZjdjbld4cHJ3UXlEZTdsL29TQm9w?=
 =?utf-8?B?US85NlhINHpDSExZTVNlMVFPTkdTd2RsYVBLOHFhWFFWLzcwVk1OSDAyQ1pu?=
 =?utf-8?B?SU5oMW16V2VRNk80OW5Td0k2Z2VFT2UraUo4Q2pTRUxDcTlTbEh1L0hlNysr?=
 =?utf-8?B?MnA3dC9FWnZxNlEwcWJxL2FWeGh2S0RKVyt6WnMvRS9XSGtVNXRnQ0NleGdq?=
 =?utf-8?B?N2hkRktYd0g5N2tCMzFNbjYvRVBQdXBVSkVVQ2pDOHlOcm1VRXI5TWVaK2dY?=
 =?utf-8?B?aE54VWtERHJFOGVGSWZENzZ0RCtkQ1ZqcFhiZ2diay9BMnpMSkxQcGs4TmZE?=
 =?utf-8?B?OWNGOVU5cHM4aC90ZHM2bUZ3T1gwd01zWkQyT2Y4SzA5VDcwWDRETnhDM0Mx?=
 =?utf-8?B?TW10SUtuMUxmTG1TT0RBK0ViazdMdDh2dWJ6bzdmUmxrMTZEcWxLZFNkNE13?=
 =?utf-8?B?UjVMcyt6STdQRnZGZE9TTjVRT3V6d1o3ai9rd2NsTkJPUG92Nk82elpEb3JP?=
 =?utf-8?B?QVlvSkpUcVRPWnA2Yk9zaDVXWWRZRi9aLzBNNmRpN3V5eXZ5VWxHV0p6M2J5?=
 =?utf-8?B?MkJBV3lKd3hNa3VVc0FQaWgvUFpod09NK1hpOUM1VlhqR2V4aWZTNUtKTFlD?=
 =?utf-8?B?SDh0Z0JRZVFuZndKRWY4cGNjS2FqOCtqNTRMS0E4T1JNK0xlM3h5M3BvM2lH?=
 =?utf-8?B?Vi9sY2o5SDBsMWhlbEphdHFOb3BGRk5oU25CWkJ1NmtqYmFNRUI5eTh5aWNl?=
 =?utf-8?B?Uk4xSi9IQXRiYUJETzNCK0lhRVlCR1NEOHg3S05NSkdtenFhUlRaR3dEbVM4?=
 =?utf-8?B?VjBOWXMxaEVhMDVURHZQaitsbHBTUlhPNW5CS3phbWtYR084RzBOYlo3eUJ5?=
 =?utf-8?B?dXdwZEdWMU9FUkkwOXovWVpQZ29SVGFFeXJxNC9wcDJGOW8vL3VGZktOa0pK?=
 =?utf-8?B?VkFURHFCY1IyaFh2UVh6SW1Fd0pQL0VuTURWdnBPdk1ienFaTlFFVnBneXFX?=
 =?utf-8?B?OXVzODJ4K0tDM0E1RTlOQXVYR3FLVkFLZWRvT3ZKQ3k2SmM3T2pUSUIvNlQw?=
 =?utf-8?B?TG1yZnJpaHl5MnhCM0pnbDdGeEE2OUFpNUZ3MCtDeVA3NXJHdFdlNThocEhi?=
 =?utf-8?B?UGRKeTN6cU9FUFRaaEkzRDZ3ODNNT1pWZURFZWJIRDJTV3E3ZHFDMDJUTThq?=
 =?utf-8?B?MTN5dnJiMW5OV0tONUh2VUdhT3lCVFZzVWRIbUc3YzJMRmMrSkRicDRrYm1h?=
 =?utf-8?B?VzRhVkJuUzRCQTBhQ0VKVzAzdExTQnFBSWdRbm5yK09NZHF0UlFqY1YyTXZL?=
 =?utf-8?B?SVh4cGRQRnBLeUpCN3B1aVhyQ09nV1l1SmVXRG9CS01RVUJYWFBYWUszdW1N?=
 =?utf-8?B?aHhOekZFUHFrVmZUWUFGSG0xc3ZJK3FvY3BKUDhuRjR1am5EalRkMFlHN20x?=
 =?utf-8?B?M1NwVnJRNDRrbWQwVWlUSXdqR0FkWlBsd2U1VjQ2NjFMcngrRjd5QkRGSE0r?=
 =?utf-8?B?YlYwODgvUGZjQmNCeEhaeXpBL3dPVkJpOHEwaVQ2Mk5BbHZDM1F1eUZKWm9X?=
 =?utf-8?B?V0JZd1p2SEZURHF0ZHgwQnJFSEY5cUdFQWlLRFgyaU1UdzBWN2tOcGVZdlFa?=
 =?utf-8?B?dHdvZ3lHckdaaTVHWVEvOG9waVVMdy9nR3pDbVVEYWlnTU4wdkNKSDhzS091?=
 =?utf-8?B?Z3ZzZFlzWmxZeDlObGRORDlkZC9ncUdGejZGRnVjK0FveEJoTE1WcXMxUy9U?=
 =?utf-8?B?VTJhTU4wcGdCNmM3K3hxd2hQL3haanp1NE55OWRLSHc1bEFxN3dkTDg3WXV3?=
 =?utf-8?B?OHhTL1Vvbzk5ZUpWYmlqTFo2UFRWR3RVTnFQWC9weno2U2t4ZDkzcDJKcnQ4?=
 =?utf-8?B?NHZydjFjdE4zMUIycFBueDVEWS9oL1lpRWNMalBVMlhTY1Fzd0s3ekJEc2E1?=
 =?utf-8?B?eWdpeEw2RHpyS2Yyc1VUU2VJK1gvMnpGMkRRRDlIVDU2QU1rd0E3MEhSUVJG?=
 =?utf-8?Q?S4ES3aH0NaWFwAM0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <53E4F0610581354C809AB80C7F0C8CD7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	pxwzdberWLOJioPuLM4yDS+p5av5+yHMk9GIIWBPSKP7JRNijQnfZbbeovSb+3Qql3Y0bjAnxx6w5XO8Ddw/8FpZ+2qYWoUjQMC7BgRaH21d4MUniRUOMvvKaP1OZGRslC+5zfWkEpyslu44QkYoVjSAy6AP1WyZfTeybQNMr5/9xqgh+XVwDHiMAIV9jAXPQeSWgMxNMvq+RiyalAXt48hVtDLLzuQTHvlWFENOJElQTfgDkhGvYX+UHhNp0fCoyESXL7CyE5kOkP2H3t7VpsGycXaOO138mRq930HliyOt5cPkeOophH+UAYUzlvyB8u4A3jO1es6BrHs9kTb5iQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 251d77e8-bae9-4fdb-b852-08defbed1b90
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2026 23:21:32.1164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WUGfJpkIUvf5ZaaLrj0ZlAeVFgauDNXlEYwIYuojmBqLAaDbpQtgS+cN8TFZDT8Oo63LswVkMOt/6naLVV4uL+MPJuBmYErbjWt8mr+u13w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8206
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=br98wkai c=1 sm=1 tr=0 ts=6a824607 cx=c_pps
 a=n1V/8NYIZSV8AwDzGrCUNA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8
 a=2G6NVjAz1nYySMLVKQMA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: dKI8FQCu9T5X1pYKe905duHwDLja_B-7
X-Proofpoint-ORIG-GUID: jQAHG3LjWod2HR-PAWIQXjXI94pvF6ne
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDE5MCBTYWx0ZWRfXz/Lugb5UwRvN
 4SS8ZVKPQKNsarRO6/ha+PhN+7kT8n/JzSsfVbWtOLovMXIl0GxSdI5j5ybgMi0vakPEB/tlUYk
 RQ+QYKT4gwjJ8u7101DWnPT8b4+aQJUWwksjQc9VTIfJjWmdoiscdcl7g2U9OXnyo/+dgge2pYO
 XsJHE0hvAsEPMRS7eqQ7rKp4XjQHwQI+MJVKEcv9fpUpCB8s0iTW+CWew0Q1p0Kab/Na3mk8TP1
 BPvveTxLePr3f4KoUxyxCqHm9ouCtTgryelPnZAee3Kk3yQizwZK4YPZG01car0gKbmOUP7iXLu
 o43nn25XeePKbfPfqniKS1xZaM8HycKlrTaBTMSnajNqGpKyoyLng1DGcvqU6MzT7bP28bt9H69
 DmTMm3mNXi+n+PtyrrnBQo+JtFWOjtfr/dwziI8NzK2eX+7yifjTQwivRfGc3PQ12P3uFfNmq0c
 t5CsNH+HNJMsljoOyNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDE5MCBTYWx0ZWRfXw2CFz3SkUvBi
 dSg6n63WcUtudc9B6iKFhyPchcm8XRePxo/slcR+ph4yx0nnrh7vj/OIobfRiSNpyCrUdHg/f/J
 dXwqE0rmtuRCPnEYMJQOLaISrKqa70QS6a0t5P9mwlTBI545RJ60
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160190
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 23:21:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243579

T24gOC8xNS8yMDI2IDEyOjMwIEFNLCBNYXRoaWV1IER1Ym9pcy1CcmlhbmQgd3JvdGU6DQo+IENB
VVRJT046IFRoaXMgZW1haWwgY29tZXMgZnJvbSBhIG5vbiBXaW5kIFJpdmVyIGVtYWlsIGFjY291
bnQhDQo+IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
cmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+
IE9uIFNhdCBBdWcgMTUsIDIwMjYgYXQgNDoxNiBBTSBDRVNULCBTdW1hbnRoIEdhdmluaSB3cm90
ZToNCj4+IE9uIDgvMTMvMjAyNiA2OjEyIEFNLCBNYXRoaWV1IER1Ym9pcy1CcmlhbmQgd3JvdGU6
DQo+Pj4gQ0FVVElPTjogVGhpcyBlbWFpbCBjb21lcyBmcm9tIGEgbm9uIFdpbmQgUml2ZXIgZW1h
aWwgYWNjb3VudCENCj4+PiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1
bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNh
ZmUuDQo+Pj4NCj4+PiBPbiBUaHUgQXVnIDEzLCAyMDI2IGF0IDE6NDggQU0gQ0VTVCwgU3VtYW50
aCBHYXZpbmkgd3JvdGU6DQo+Pj4+ICogVjE0Og0KPj4+PiAgICAgICAtIERyb3BwZWQgInJwbTog
ZmlsdGVyIC91c3IvYmluL3BrZy1jb25maWcgZnJvbSBSUE0gYXV0by1nZW5lcmF0ZWQgUmVxdWly
ZXMiDQo+Pj4+ICAgICAgIChwa2djb25maWdkZXBzLnNoIHBhdGNoKS4gUGVyIFJvc3MgQnVydG9u
J3MgcmV2aWV3LCBpbnN0ZWFkIG9mIHN1cHByZXNzaW5nDQo+Pj4+ICAgICAgIHRoZSAvdXNyL2Jp
bi9wa2ctY29uZmlnIGVtaXNzaW9uLCBhZGRlZDoNCj4+Pj4gICAgICAgICBSUFJPVklERVM6JHtQ
Tn0gKz0gInBrZ2NvbmZpZyAvdXNyL2Jpbi9wa2ctY29uZmlnIg0KPj4+PiAgICAgICB0byB0aGUg
cGtnY29uZiByZWNpcGUgc28gaXQgc2F0aXNmaWVzIHRoZSBhdXRvLWdlbmVyYXRlZCBSZXF1aXJl
cyB3aXRob3V0DQo+Pj4+ICAgICAgIG1vZGlmeWluZyB0aGUgdXBzdHJlYW0gcnBtIHNjcmlwdC4N
Cj4+Pj4NCj4+Pj4gICAgICAtIFJlbW92ZWQgL3Vzci9iaW4vcGtnLWNvbmZpZyBmcm9tIG5hdGl2
ZXNkay1zZGstcHJvdmlkZXMtZHVtbXkuYmIuDQo+Pj4+ICAgICAgICBSUE0gNidzIGludGVybmFs
IGRlcGVuZGVuY3kgZ2VuZXJhdG9yIGF1dG8tZGV0ZWN0cyBmaWxlLWxldmVsIFByb3ZpZGVzDQo+
Pj4+ICAgICAgICBmcm9tIGluc3RhbGxlZCBmaWxlcywgc28gbmF0aXZlc2RrLXBrZ2NvbmYgYWxy
ZWFkeSBwcm92aWRlcw0KPj4+PiAgICAgICAgL3Vzci9iaW4vcGtnLWNvbmZpZyB2aWEgdGhlIHdy
YXBwZXIgc2NyaXB0IGl0IGluc3RhbGxzLiBLZWVwaW5nIHRoZQ0KPj4+PiAgICAgICAgZHVtbXkg
ZW50cnkgY2F1c2VkIGEgRE5GIGNvbmZsaWN0IGR1cmluZyBkb19wb3B1bGF0ZV9zZGs6DQo+Pj4+
ICAgICAgICAgIG5hdGl2ZXNkay1zZGstcHJvdmlkZXMtZHVtbXkgY29uZmxpY3RzIHdpdGggL3Vz
ci9iaW4vcGtnLWNvbmZpZw0KPj4+PiAgICAgICAgICBwcm92aWRlZCBieSBuYXRpdmVzZGstcGtn
Y29uZg0KPj4+Pg0KPj4+PiAgICAgIC0gQWRkZWQgImxpYmFyY2hpdmU6IERpc2FibGUgUlBNIGZp
bHRlciBhdXRvLWJpZGRpbmciICgwMDA1IHBhdGNoKS4NCj4+Pj4gICAgICAgIFdpdGggYm90aCB0
aGUgUlBNIGZpbHRlciBhbmQgUlBNIGZvcm1hdCByZWFkZXIgcmVnaXN0ZXJlZCwgdGhlIGZpbHRl
cg0KPj4+PiAgICAgICAgaW50ZXJjZXB0ZWQgUlBNIGZpbGVzIGZpcnN0IGFuZCBmYWlsZWQgdG8g
cGFyc2UgUlBNIDYgcGFja2FnZXMNCj4+Pj4gICAgICAgIChkZWJ1Z2luZm9kIHNjYW5uaW5nIHN0
aWxsIGZhaWxlZCBhZnRlciB0aGUgMDAwNCBwYXRjaCkuIERpc2FibGluZyB0aGUNCj4+Pj4gICAg
ICAgIGZpbHRlcidzIGF1dG9tYXRpYyBiaWRkaW5nIGxldHMgdGhlIGZvcm1hdCByZWFkZXIgaGFu
ZGxlIFJQTSBmaWxlcywNCj4+Pj4gICAgICAgIHdoaWxlIGFyY2hpdmVfcmVhZF9hcHBlbmRfZmls
dGVyKEFSQ0hJVkVfRklMVEVSX1JQTSkgc3RpbGwgd29ya3MNCj4+Pj4gICAgICAgIGV4cGxpY2l0
bHksIGtlZXBpbmcgdGVzdF9yZWFkX2FwcGVuZF9ycG1fZmlsdGVyIHBhc3NpbmcuDQo+Pj4+DQo+
Pj4+ICAgICAgLSBVcGRhdGVkIDAwMDQtQ29udmVydC1SUE0tcmVhZGVyLWludG8tYS1wcm9wZXIt
Zm9ybWF0LnBhdGNoIHRvIGluY2x1ZGUNCj4+Pj4gICAgICAgIHRoZSB0ZXN0X3JlYWRfZm9ybWF0
X2h1Z2VfcnBtLmMgY2hhbmdlcyBmcm9tIHVwc3RyZWFtIFBSICMyODQ2LiBUaGlzDQo+Pj4+ICAg
ICAgICB0ZXN0IG5vdyBjb3JyZWN0bHkgZXhlcmNpc2VzIHRoZSBmb3JtYXQgcmVhZGVyIGluc3Rl
YWQgb2YgdGhlIGZpbHRlci4NCj4+Pj4NCj4+Pj4gICAgICAtIFVwZGF0ZWQgcGF0Y2hlcyA3LDkg
YW5kIDEwIGZvciB0aGUgbGF0ZXN0IG1hc3RlciBjaGFuZ2VzOyBubyBjb2RlDQo+Pj4+ICAgICAg
ICBjaGFuZ2VzOyByZW1vdmVkIHVwc3RyZWFtIG1vZGlmaWNhdGlvbnMNCj4+Pj4NCj4+Pj4gICAg
ICBUZXN0cyB2ZXJpZmllZDoNCj4+Pj4gICAgICAgIC0gb2Utc2VsZnRlc3QgLXIgZGVidWdpbmZv
ZC5EZWJ1Z2luZm9kLnRlc3RfZGVidWdpbmZvZF9xZW11DQo+Pj4+ICAgICAgICAtIG9lLXNlbGZ0
ZXN0IC1yIGRlYnVnaW5mb2QuRGVidWdpbmZvZC50ZXN0X2RlYnVnaW5mb2RfbmF0aXZlDQo+Pj4+
ICAgICAgICAtIG9lLXNlbGZ0ZXN0IC1yIHNkay5TREtUZXN0cy50ZXN0X3Nka19tYW5pZmVzdHMN
Cj4+Pj4gICAgICAgIC0gb2Utc2VsZnRlc3QgLXIgc2RrLlNES1Rlc3RzLnRlc3Rfc2RrX3J1bnFl
bXUNCj4+Pj4gICAgICAgIC0gYml0YmFrZSBjb3JlLWltYWdlLXB0ZXN0LWxpYmFyY2hpdmU6ZG9f
dGVzdGltYWdlDQo+Pj4+ICAgICAgICAtIGJpdGJha2UgY29yZS1pbWFnZS1zYXRvIC1jIHBvcHVs
YXRlX3Nkaw0KPj4+PiAgICAgICAgLSBiaXRiYWtlIGNvcmUtaW1hZ2Utc2F0by1zZGs6ZG9fcm9v
dGZzDQo+Pj4+DQo+Pj4NCj4+PiBIaSBTdW1hbnRoLA0KPj4+DQo+Pj4gV2UgYWdhaW4gaGF2ZSBz
b21lIHBrZ2NvbmZpZyBlcnJvcnMuIEkgc3VzcGVjdCBpdCdzIHRoZSBzYW1lIGlzc3VlIGFzDQo+
Pj4gZm9yIHRoZSBwcmV2aW91cyBzZXJpZXM6IHRoZSBnZW5lcmF0ZWQgcmVjaXBlIHNpZ25hdHVy
ZXMgYXJlIHRoZSBzYW1lIGFzDQo+Pj4gYmVmb3JlLCBzbyB3ZSBhcmUgcmUtdXNpbmcgb2xkIGRh
dGEgZnJvbSB0aGUgc3N0YXRlLWNhY2hlLg0KPj4+DQo+Pj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55
b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMy9idWlsZHMvNDQzOQ0KPj4+IGh0
dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzgv
YnVpbGRzLzQ0MTMNCj4+Pg0KPj4+IEkgYWxzbyBub3RlIGEgbmV3IGZhaWx1cmU6DQo+Pj4NCj4+
PiBFcnJvcjoNCj4+PiAgICBQcm9ibGVtIDE6IGNvbmZsaWN0aW5nIHJlcXVlc3RzDQo+Pj4gICAg
IC0gbm90aGluZyBwcm92aWRlcyAvdXNyL2Jpbi9wa2ctY29uZmlnIG5lZWRlZCBieSBhY2wtZGV2
LTIuNC4wLXIwLmNvcnRleGE1NyBmcm9tIG9lLXJlcG8NCj4+PiAgICBQcm9ibGVtIDI6IGNvbmZs
aWN0aW5nIHJlcXVlc3RzDQo+Pj4gICAgIC0gbm90aGluZyBwcm92aWRlcyAvdXNyL2Jpbi9wa2ct
Y29uZmlnIG5lZWRlZCBieSBldWRldi1kZXYtMy4yLjE0LXIwLmNvcnRleGE1NyBmcm9tIG9lLXJl
cG8NCj4+PiAgICBQcm9ibGVtIDM6IGNvbmZsaWN0aW5nIHJlcXVlc3RzDQo+Pj4gICAgIC0gbm90
aGluZyBwcm92aWRlcyAvdXNyL2Jpbi9wa2ctY29uZmlnIG5lZWRlZCBieSBrbW9kLWRldi0zNC4y
LXIwLmNvcnRleGE1NyBmcm9tIG9lLXJlcG8NCj4+PiAgICBQcm9ibGVtIDQ6IGNvbmZsaWN0aW5n
IHJlcXVlc3RzDQo+Pj4gICAgIC0gbm90aGluZyBwcm92aWRlcyAvdXNyL2Jpbi9wa2ctY29uZmln
IG5lZWRlZCBieSBsaWJ6LWRldi0xLjMuMi1yMC5jb3J0ZXhhNTcgZnJvbSBvZS1yZXBvDQo+Pj4g
ICAgUHJvYmxlbSA1OiBjb25mbGljdGluZyByZXF1ZXN0cw0KPj4+ICAgICAtIG5vdGhpbmcgcHJv
dmlkZXMgL3Vzci9iaW4vcGtnLWNvbmZpZyBuZWVkZWQgYnkgb3BlbnNzbC1kZXYtMy41LjctcjAu
Y29ydGV4YTU3IGZyb20gb2UtcmVwbw0KPj4+ICAgIFByb2JsZW0gNjogY29uZmxpY3RpbmcgcmVx
dWVzdHMNCj4+PiAgICAgLSBub3RoaW5nIHByb3ZpZGVzIC91c3IvYmluL3BrZy1jb25maWcgbmVl
ZGVkIGJ5IHV0aWwtbGludXgtZGV2LTIuNDIuMi1yMC5jb3J0ZXhhNTcgZnJvbSBvZS1yZXBvDQo+
Pj4gICAgUHJvYmxlbSA3OiBjb25mbGljdGluZyByZXF1ZXN0cw0KPj4+ICAgICAtIG5vdGhpbmcg
cHJvdmlkZXMgL3Vzci9iaW4vcGtnLWNvbmZpZyBuZWVkZWQgYnkgeHotZGV2LTUuOC4zLXIwLmNv
cnRleGE1NyBmcm9tIG9lLXJlcG8NCj4+PiAodHJ5IHRvIGFkZCAnLS1za2lwLWJyb2tlbicgdG8g
c2tpcCB1bmluc3RhbGxhYmxlIHBhY2thZ2VzIG9yICctLXNldG9wdD1vcHRpb25hbF9tZXRhZGF0
YV90eXBlcz1maWxlbGlzdHMnIHRvIGxvYWQgYWRkaXRpb25hbCBmaWxlbGlzdHMgbWV0YWRhdGEp
DQo+Pj4NCj4+PiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUv
Iy9idWlsZGVycy8zNi9idWlsZHMvNDM3MQ0KPj4+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9w
cm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzYxL2J1aWxkcy80MjY5DQo+Pj4gaHR0cHM6
Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvNzMvYnVp
bGRzLzQyODYNCj4+PiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3ly
aWUvIy9idWlsZGVycy8xMTAvYnVpbGRzLzk0Mg0KPj4+DQo+Pj4gQXMgdXN1YWwsIHRoZSBkZXRh
aWxlZCBjb25maWd1cmF0aW9uIGNhbiBiZSBmb3VuZCBpbiB0aGUgIldyaXRlIGNvbmZpZyINCj4+
PiBzdGVwLg0KPj4+DQo+Pj4gVGhhbmtzLA0KPj4+IE1hdGhpZXUNCj4+Pg0KPj4+IC0tDQo+Pj4g
TWF0aGlldSBEdWJvaXMtQnJpYW5kLCBCb290bGluDQo+Pj4gRW1iZWRkZWQgTGludXggYW5kIEtl
cm5lbCBlbmdpbmVlcmluZw0KPj4+IGh0dHBzOi8vYm9vdGxpbi5jb20NCj4+Pg0KPj4NCj4+IEhp
IE1hdGhpZXUsDQo+Pg0KPj4gTG9va3MgbGlrZSB0aGlzIGlzIGFuIHNzdGF0ZSByZXVzZSBpc3N1
ZS4gVGhlIHBrZ2NvbmZpZ2RlcHMuc2ggZml4IGlzIGluDQo+PiB0aGUgcnBtIHJlY2lwZSAodXNl
ZCBieSBib3RoIHJwbSBhbmQgcnBtLW5hdGl2ZSB2aWEgQkJDTEFTU0VYVEVORCksIGFuZA0KPj4g
ZG9fcGFja2FnZV93cml0ZV9ycG0gZG9lcyBkZWNsYXJlIGEgcHJvcGVyIGRlcGVuZGVuY3kgb24N
Cj4+IHJwbS1uYXRpdmU6ZG9fcG9wdWxhdGVfc3lzcm9vdC4gRGVzcGl0ZSB0aGF0LCBJJ20gc2Vl
aW5nIHRoZSBzaGFyZWQNCj4+IHNzdGF0ZSBjYWNoZSBhbmQgaGFzaC1lcXVpdmFsZW5jZSBzZXJ2
ZXIgc2VydmUgcHJlYnVpbHQgUlBNcyBmb3IgemxpYiwNCj4+IGdsaWItMi4wLCBldGMuIHRoYXQg
cHJlZGF0ZSB0aGUgZml4Lg0KPj4NCj4+IEkgY29uZmlybWVkIGxvY2FsbHk6IGRpc2FibGluZyBz
c3RhdGUgbWlycm9ycyBhbmQgcmVidWlsZGluZyBmcm9tDQo+PiBzY3JhdGNoIGZpeGVzIGl0LCBu
byBtaXNzaW5nIHBrZ2NvbmZpZygpIFByb3ZpZGVzIGVycm9ycy4gQ291bGQgeW91DQo+PiByZXRy
eSB3aXRoIHNzdGF0ZSBkaXNhYmxlZCB0byBjb25maXJtIG9uIHlvdXIgZW5kPw0KPj4NCj4+IFRo
YW5rcywNCj4gDQo+IEhpIFN1bWFudGgsDQo+IA0KPiBJIGRpZCB0aGF0IGFscmVhZHkgd2l0aCB0
aGUgcHJldmlvdXMgc2VyaWVzLCBhcyBzdGF0ZWQgaW4gbXkgY29tbWVudHMNCj4gdGhlcmUuIFll
cywgZGlzYWJsaW5nIHNzdGF0ZSBvciBjaGFuZ2luZyBQUiB2YWx1ZXMgbWFzayB0aGUgaXNzdWUu
DQo+IA0KPiBUaGFua3MsDQo+IE1hdGhpZXUNCj4gDQo+IA0KPiAtLQ0KPiBNYXRoaWV1IER1Ym9p
cy1CcmlhbmQsIEJvb3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
Zw0KPiBodHRwczovL2Jvb3RsaW4uY29tDQo+IA0KSGkgTWF0aGlldSwNCg0KVGhhbmtzIGZvciB0
aGUgc3N0YXRlIGZlZWRiYWNrLiBJJ3ZlIHNlbnQgdjE1IHdoaWNoIGFkZHMgdHdvIGZpeGVzIHRv
IA0KaGFuZGxlIHRoZSBwa2djb25maWcgc3N0YXRlIHRyYW5zaXRpb24uDQoNClBsZWFzZSB0YWtl
IGEgbG9vayBhbmQgc2hhcmUgdGhlIHRlc3QgcmVzdWx0cywgSG9wZWZ1bGx5LCBpdCByZXNvbHZl
cyANCmFsbCB0aGUgcGtnY29uZmlnIGFuZCBETkYgaXNzdWVzLg0KDQotLSANCiMgU3VtYW50aCBH
YXZpbmkNCiMgV2luZCBSaXZlciBMaW51eA0K

