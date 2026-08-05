Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA7DC55182
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 07:34:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32953.1785902440218172646
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 21:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=c3AEjup/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2677b27f76=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6752cTQd1035353
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Aug 2026 20:51:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=C4WSDfHayqtc1Ptnapjl1G
	rkcSq//PteDua+fLKG6aI=; b=c3AEjup/ytSYoZMdUX1CTWP20VSUPrq3QSzRNI
	WlgrNEq5f9RYOIQ3b8ddTYYfKlhC/OMhHSEbQUkwr0ayHjoTqgqA17j65vPwdpIA
	WynthqIDM4zkUzfDHZpPJFfxXmWC/EkPQu1khYFznIvvH+oWUbETNlTxs8aU7k2h
	/h5hna/iVhWINgrvbUnSRHAKQ/iHeEIzwAj0e1BoEpClJqWoYH7nt/hLK1F4huQT
	wFDG14yvg7S8u7FGNpcJQSF2aiCMv5Zv1u3rmjMCbtLbLanne+iSQqtZ9HM9Om5W
	HS3I4xjbZz5NQW4mg2n6m6OYV2Weq5aZU4CZbzXk8XFTuR1A==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010025.outbound.protection.outlook.com [52.101.85.25])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fsc31ns94-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 20:51:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ew0WMAsTf2PHjymKN+XBa8nWE4OV/qV8dt75ZXTlqHlhx4oiNQDkaK/ovYxBd2ou/ajS+cXzNmKLIF92MsnRrr5iDPiEEWJ/IhgukUligN4oC9TijxiviwFdsWql7dJJwBcEl0g9VWEFCH/iIIYVw4n4e7wHMw19b4d9k7zJOEGZTL1T+63LIAGj6J+h7Qsls2MsSgALDBNWeAndNS7h9d8bZxVxMINFvdaWqo6EVYowYQ88sgQQvIjrLi1al7saCQSjErQnozUjPGF+rDd726avbIxzaiouhFuoqk7AhwLq3lMZOVgWjKL98yC/PuDW96av3Ak+CR1ZQZb6nhjVBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4WSDfHayqtc1Ptnapjl1GrkcSq//PteDua+fLKG6aI=;
 b=eCLNqmX+/7ejuHrc9Xigccwa5WYSOt4+FawtT/oFJR26vEQxsQ1IV12peDbX/pmsNDhwjvL/SKjgDqNsdtk3iv8iyyeBbduZ+1htaT+On/nY/7DxUMnYKxE1po+Lzqoej+4jwNqud0gTTWTz/TAVeLL1rh1YtVC6cFKubPAosqvhshjEiePs2hzIMPOcwVIuQ3Ulb7Qyva4dd0SBoUq763zpXW515X9Nwns5zwz5TU9nozGK3NBLfK0p6FVtxDuT5UltpEy1yVhpRdNhaj6MJt32IgTJCPE0O8GLs/U+KPU91w/3+DKnVM5xsWjv1jOsxduSgXHkKaie8gmNNpkHFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15)
 by DS4PPF382351574.namprd11.prod.outlook.com (2603:10b6:f:fc02::1d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 03:51:46 +0000
Received: from CH3PR11MB8774.namprd11.prod.outlook.com
 ([fe80::8925:311f:7018:b3ec]) by CH3PR11MB8774.namprd11.prod.outlook.com
 ([fe80::8925:311f:7018:b3ec%5]) with mapi id 15.21.0270.017; Wed, 5 Aug 2026
 03:51:45 +0000
From: "Barde, Himani Ramesh" <HimaniRamesh.Barde@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Paul Barker <paul@pbarker.dev>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>,
        "Komati, Shiva" <Shiva.Komati@windriver.com>,
        Daniel Dittmann <daniel.dittmann@rohde-schwarz.com>
Subject: Re: [OE-core] [PATCH v3] systemd.bbclass: fix service enablement for cross-install scenarios
Thread-Topic: [OE-core] [PATCH v3] systemd.bbclass: fix service enablement for
 cross-install scenarios
Thread-Index: AQHdGcLZdy0iaYgSoUS8gQ/EL2wnjbaGKWIAgAEO+0aABT77gIAAAJ2AgAJvSDc=
Date: Wed, 5 Aug 2026 03:51:45 +0000
Message-ID: 
 <CH3PR11MB87744A73F7FD9B5CACF586228FD32@CH3PR11MB8774.namprd11.prod.outlook.com>
References: <20260716061519.765593-1-HimaniRamesh.Barde@windriver.com>
 <20260722101408.3225399-1-HimaniRamesh.Barde@windriver.com>
 <52bcf8634847de61960bb1e33f613abf4d11576f.camel@pbarker.dev>
 <CH3PR11MB8774C3DADBA455D8721EB8198FC82@CH3PR11MB8774.namprd11.prod.outlook.com>
 <CANNYZj_c+CJ+asij_nZoZ3PsZtjL45aGv3nfLnPXooYGO9gJ=Q@mail.gmail.com>
 <CANNYZj_29BCC92tXvGX=G2t-G+=abgpEcbWK9Gy4n8wXiuY9=A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_29BCC92tXvGX=G2t-G+=abgpEcbWK9Gy4n8wXiuY9=A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-08-05T03:51:44.754Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8774:EE_|DS4PPF382351574:EE_
x-ms-office365-filtering-correlation-id: a3c800ae-879e-4af2-c1fa-08def2a4dea6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|23010399003|22082099003|18002099003|11063799006|4143699003|8096899003|38070700021|6133799003|10067099003|56012099006;
x-microsoft-antispam-message-info: 
 8N9qm3GRSdnqFyGCAzuI4PTUvdhfdQZ5UkM4PC2PPV5hChp6CqP7CBByMMzGRSQ4umE9ZwXzxC+3+78JPkE1PcFFOkkqHupekOO364wvicvVIIIg0C1IlDFSToA3a480940EE1XLboDinvHPEf3NjEFWm5cximdfMnA0/Bw1Cujy+0EoK630DwB5aYLYguFnc8f68adRQAJRDRtNZ3aTjIsaKZTJXfma3DAAsXzFFhxAd4fSBnu5hRMO4swUnTthrwBzau88kOfc5xjTScUUS4456hvTg07h2opPifuPTKGMbFi26mUOMMZ1KapjOayqkli1v1cJIqAt6k0rtqVaZVkr9QhDjeuICTtKdwW9dFks2Kh0yk4nvSHXhRA8vzKNn+egPqm7LNfb6WOCL36uzmA9+1oW9gvAkoVKcYoh2SWV9iZiImfDq0QNRK1k4R2QjTKmCwElXvU1PNXgOPjmcM43iCJT64X3dwsC0J+MsL+D5DnXB770jX5kdDVPZTylEv57M7OTOM47d9Ej2F8LW5eOx5J14Os9ldx4EQPDx903AOMcuycKBMOcyzdIlhCI7RVyggVoWeKOlTdIeQNcObsxISPnDEkULTH5U859v9b2U69UGKVumQOZpEoPKr9fl1fRdGfcHG7XPjnnRtK+7F4NWIV0tufCOw+I5qLxgJogrdKsOlLb0MTLXCKRLqmDbn/ySm8of2HXsuk3JULMQWp1NrL1xL3DWbg7cvy+sWs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8774.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(23010399003)(22082099003)(18002099003)(11063799006)(4143699003)(8096899003)(38070700021)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?UjZgtIrDBvx6M2ebaAEAwlAezoYlRljTBZtqxZOpJ5lds2GHzf0a42Wl1ADB?=
 =?us-ascii?Q?1P2O+c77zjq+R3LR03Q6mO9z9wcpocZP+aAlieF4C0oP7VKArPnG+j+It4N/?=
 =?us-ascii?Q?7dJQqgrQv0rK9hOCNfi40MpXLMZ/2OeWo9RSBYvP2NynpTV1TsnrQjoBpwBr?=
 =?us-ascii?Q?E3pf+vMT71iAapnObBNqVW1D7rEr7VIOI3yEIjW5q1opL5ytF++p3Q73RM6o?=
 =?us-ascii?Q?UKQCO/kwA+V0CZ7F0fOCj5ENewrdQPH23isrQJ2Po6G+Sa0LkDCZC4fEdzFm?=
 =?us-ascii?Q?qhdntsAWf36INqaYECf7pfbA59pRmSRmAmNXnif6UlNv9ie9vvmxRQl/NKh5?=
 =?us-ascii?Q?dkXdlsYQXH+xYbrL7lnaaKdPJf596/TYDAB2GvTHc4kpOC52Py+8ze8RYg+b?=
 =?us-ascii?Q?693tpIPqrQttg5ImFDSvXpOjgDVA1MJcLdk8jW6ezSZAOWCEwNgk7H0rHQMP?=
 =?us-ascii?Q?xvxgwXogD1EuxaKnMJDCYxUQsrKKxFPDsRFv+sslSzuFmCI8LtW1pvG+b7h5?=
 =?us-ascii?Q?wzSNY+TgmFP9pDxX89voz33n/YkE4/jEnyzOCpDOXe6wIiFjgmeNlhAkizOF?=
 =?us-ascii?Q?vLFV7z1D7vT4EW4ad500sloztqwUA1PPh2Ssl0UNoYDROl2mth8+ySWrQRPa?=
 =?us-ascii?Q?FC3HWFUKwSJdbGGsmkgT5C4Lr3ZIkj72Htxb2rk8MoqC0ZxeLKywYZwcS2xG?=
 =?us-ascii?Q?wtoHxeKwa3ZcxFg6GZ6f6MPVwecU8i+AYLyNK2a+FsCcpGw9FUK+cmqsFlLB?=
 =?us-ascii?Q?wUg0VrPlUZpCimdjI1rY7C7nb6r4AJ2d7gaXL2zENaGwiI2A0mjkujrLMi/1?=
 =?us-ascii?Q?NTRz5GAaTyui6wi+dmIu1h4dsGSnaEdWyJ7JlzOuESZdw1VHCA9fPJjjRk+x?=
 =?us-ascii?Q?mtZ2/hOo9Pc4e/JA8CL08id07291SKRwLMmbWqm0GHxu0qYk5FgQLWaS/HVN?=
 =?us-ascii?Q?gHJpZB3ugZwLrIvn7nIssqURWIRtI1OL9T2FYaQXaY/aG/vkrvKkyRwbwLKL?=
 =?us-ascii?Q?q3Xz+yN01rlFfMZagzjS21mQQ0brdPN50R+hEIS6bYZF3ze76CzFx0CrKxE+?=
 =?us-ascii?Q?UDOzBzRKxlil3WJhGTiFzLGpZBWQns/O5QO3rojxwFSz8KIeQ7gOPR4Q7m75?=
 =?us-ascii?Q?ghsTbWL31X32gMXi+6ojaem8LbSzYwRip+bCpIZ2DdpPac9qxOW2sV7ypm8S?=
 =?us-ascii?Q?b93p1IaNdygodZXfqxmdXfaOFm9NOFarU3v+lhdLElh/1124UZHSGt2MDg9u?=
 =?us-ascii?Q?ZQK7nG8up++uu9b69AiHR0CWpbcl++paqOok+QHBkjWoTGvDP8by0wV6kdvj?=
 =?us-ascii?Q?peRaYto+F0HBenUnMLaksneaIBt7M9oxTP7ONu8dooTRwTJnKuevn8agsnBE?=
 =?us-ascii?Q?5VQfM7GJ2x91z5omLrUNis1Re29+vpCPzBQS8FaKVr0BCgNo78is2KUxs3OC?=
 =?us-ascii?Q?a9EipcHaUdlvMVVwGxy0YylnCC1jFRb2SURHSfK7E47CXwwifOlIRKbuXsV4?=
 =?us-ascii?Q?jbVZKojAIMZvf4qFGY2TwNtm/V38ubvjU2+v20WZSz7pAmmg7VECJN+lJmWu?=
 =?us-ascii?Q?wvEbSQTNu0rDkoUpTuoYnXckLwLyo7VS+YB5xI7GFyeQguqb9AO4tFmln+ww?=
 =?us-ascii?Q?jLP0qb7dHdbwq/AEfA3fuoOb/oCHvMrpsKdOKAE23U0Aac9/CSF2Z2W/DBbj?=
 =?us-ascii?Q?jeMb/7NXqVd7sooJgryQ1FR/Z4XOwNoH1z+bQdlqWEHHjWz0BU3im/r4mQ5z?=
 =?us-ascii?Q?Uz7wZBVl0bxC6Nu6uEvUhPvYN6bzhqI7Ex3YXiAbW+09Wmvy6OjIC4QQCWUk?=
x-ms-exchange-antispam-messagedata-1: Bdgn2D317VlcpuxsQAn97Ytm7BzTFc+eMeI=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	CHRq7KqV+9EzEkSZTdmGC4g0Rm7LTUykMQQYuCTsJhBDDvfKUTHbgTzJsY8VwVmIzmxYaLQ7xUem+9ZdbSJ5dzGP2RmQfwMg6ghA60HH2ubOG5kz9CqxSx+psXiHI1yf4x9tot8Qxv+coU0tWpqhLEf9FHHwNYax6DQ3eIQGL2XHBF3kMA9t+KB7CqiQFsXSAqPg1uiK9J3sugU9e9IPytTk94TkOL7h+nQGe3KIPGYTRy7qnSOcoAO8cvtLHCb89qRdhOgw2souctAYACLsvYB//B+olKPepINI1nreHOfgktot5HTVjLeeRe4HOOE2IPmRKIZ9SF1iht36ljB4Hg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8774.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c800ae-879e-4af2-c1fa-08def2a4dea6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 03:51:45.6766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhavT7Edx57SHj4T5BADPl1ZT7KMCeW6HmiPRqLxRZR8/UuJbTTN19b2YnZQt6n+iRR0N5Cw4dZIqWchSG83ERZjXJAi7YI8GA5gpJBbMGj8HtRAp4CQ5xwgGXL1DMh2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF382351574
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: XgF6rVwVsmIoEkyX0OHju_y2DV-qZffH
X-Proofpoint-ORIG-GUID: lPTcN6hnmKDhrYktS1xsAPTTrO0qAfzI
X-Authority-Analysis: v=2.4 cv=afFRWxot c=1 sm=1 tr=0 ts=6a72b356 cx=c_pps
 a=vKxAdbwNlT/VBnJ0vobx9w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9
 a=CjuIK1q_8ugA:10 a=5neErPw3g4MG8boj:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDAyNSBTYWx0ZWRfX8F7MnN0mOVlC
 Q9hTu+bxNNCAjW5zuV5kST0DcUXXT7JUEte8TTyxKd8S4CcQK3DJUwOKx0Tl66mQpi/B2uDqe0b
 USGA/wMiKvIPVvLuSyjKORAVrt7hcW9YVqrxQ+TKPc5x2gZISJjWPosrG4zJ2PM1w4CkTpF9xrs
 AUV1doHdXKiKr+IipEt5LklB6GIcDEzZrMIMpRyRBL4RKBuY+oe0BM8Mplx6JheKPzeVSojA3Hw
 cMp3CW9hsS0DPOPRiJp93bUIpIrYwFfe7Vk6mMT24OWBYlgAsqvr95SvP9/g9lwPBTVZgXdxhX6
 OmpYxdSQR0Ev2Lyz/fJn9d56Evi9hxLLiBrKCpfZKJL8DcPMHGf1rXQIZYyeZPtCUz94nIN39BV
 yFPb1x4/cTyWfz+glmqNgzlOQ4EMskBpNLx8v10jIin1Hs8yjivjT6prhjPaLKsUQGvAFmodMd6
 2kmc8N8xLlKgapOWsUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDAyNSBTYWx0ZWRfX4ZRriYUnCnkN
 95KFvX5XZRL3rT94hNO9D5nMMYp6ES+fxpnXi/BTA+10ADPxh/IECZpXUNV0PsE+TtjjGOw1glU
 dpU6eD+BWdXHhlOBRKT5K0cjdgeEPPyFKOlJ2gazGadPTDkNzuoz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_01,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050025
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CH3PR11MB87744A73F7FD9B5CACF586228FD32CH3PR11MB8774namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 07:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242834

--_000_CH3PR11MB87744A73F7FD9B5CACF586228FD32CH3PR11MB8774namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Paul, Alex,

Thanks for the feedback. I understand that assembling a rootfs from Yocto-g=
enerated packages using external tools like multistrap isn't a standard Yoc=
to workflow, and I appreciate the concern about setting precedents without =
tests.

I'm looping in Daniel (the original bug reporter, CC'd) - Daniel, could you=
 share more context about your use case and whether you have any thoughts o=
n how this could be addressed within the existing Yocto framework?

I'm relatively new to the Yocto community and still learning what features =
make sense for the project. I'm happy to help with implementation if there'=
s a path forward that the maintainers are comfortable with.

Regards,
Himani
________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Monday, August 3, 2026 8:08 PM
To: Barde, Himani Ramesh <HimaniRamesh.Barde@windriver.com>
Cc: Paul Barker <paul@pbarker.dev>; openembedded-core@lists.openembedded.or=
g <openembedded-core@lists.openembedded.org>; MacLeod, Randy <Randy.MacLeod=
@windriver.com>; Komati, Shiva <Shiva.Komati@windriver.com>
Subject: Re: [OE-core] [PATCH v3] systemd.bbclass: fix service enablement f=
or cross-install scenarios

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Mon, 3 Aug 2026 at 16:36, Alexander Kanavin <alex.kanavin@gmail.com> wro=
te:

> Using apt/dpkg at runtime on a target system to add or update packages
> is supported. But assembling rootfs from a package repository over the
> network using Debian-specific tools isn't. I'm not sure we should set
> a precedent for it, as there are no tests, and it's just not how yocto
> is meant to be used.

What I meant to say: if you can demonstrate the issue on a target
system in qemu using apt, we can focus on addressing that. But let's
not try to support 'external rootfs assembly' please.

Alex

--_000_CH3PR11MB87744A73F7FD9B5CACF586228FD32CH3PR11MB8774namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi Paul, Alex,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for the feedback. I understand that assembling a rootfs from Yocto-g=
enerated packages using external tools like multistrap isn't a standard Yoc=
to workflow, and I appreciate the concern about setting precedents without =
tests.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I'm looping in Daniel (the original bug reporter, CC'd) - Daniel, could you=
 share more context about your use case and whether you have any thoughts o=
n how this could be addressed within the existing Yocto framework?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I'm relatively new to the Yocto community and still learning what features =
make sense for the project. I'm happy to help with implementation if there'=
s a path forward that the maintainers are comfortable with.</div>
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
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexander Kanavin &lt=
;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Monday, August 3, 2026 8:08 PM<br>
<b>To:</b> Barde, Himani Ramesh &lt;HimaniRamesh.Barde@windriver.com&gt;<br=
>
<b>Cc:</b> Paul Barker &lt;paul@pbarker.dev&gt;; openembedded-core@lists.op=
enembedded.org &lt;openembedded-core@lists.openembedded.org&gt;; MacLeod, R=
andy &lt;Randy.MacLeod@windriver.com&gt;; Komati, Shiva &lt;Shiva.Komati@wi=
ndriver.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH v3] systemd.bbclass: fix service enabl=
ement for cross-install scenarios</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Mon, 3 Aug 2026 at 16:36, Alexander Kanavin &lt;alex.kanavin@gmail.com&g=
t; wrote:<br>
<br>
&gt; Using apt/dpkg at runtime on a target system to add or update packages=
<br>
&gt; is supported. But assembling rootfs from a package repository over the=
<br>
&gt; network using Debian-specific tools isn't. I'm not sure we should set<=
br>
&gt; a precedent for it, as there are no tests, and it's just not how yocto=
<br>
&gt; is meant to be used.<br>
<br>
What I meant to say: if you can demonstrate the issue on a target<br>
system in qemu using apt, we can focus on addressing that. But let's<br>
not try to support 'external rootfs assembly' please.<br>
<br>
Alex<br>
</div>
</span></font></div>
</body>
</html>

--_000_CH3PR11MB87744A73F7FD9B5CACF586228FD32CH3PR11MB8774namp_--

