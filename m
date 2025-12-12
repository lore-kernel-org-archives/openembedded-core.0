Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCAFCD43362
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 01:13:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2521.1765502000779560422
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 17:13:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=l1pv+utW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4441d9c407=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC0AEWM1910961
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 17:13:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=QXaDCZiVClWlb196J+mXLruPnplYwj99gNC5NA6V/ss=; b=
	l1pv+utWI/iq1bChnAe9/4WH/E9BLyu/9tI9yNEAcOrkwd5AexMOpwPfwM0rVSDL
	Ehh+Ex4Htq8mV1vd/Ife6XwaAHZqAGdGmt3zES9RCUlPbDmOCfZtBV8gIgM6mdUz
	BjmVgxqbKyfpb5k/Povrk69n52ofLBJMBY/1gY1VCsG6D92VgJGH4SUKOUA9DnvA
	4fElg/C8+JrUbdfRJJ9toFWFWb5q+KeKI6dNw0zlfhXwpmFIlZLQDrTyVGDpnBJk
	+/jfQWwpgYpcXhV91SMWJuBIEE313VblThKf3AJELuI9VQ5S9zN+eWsasWlYAzq9
	EHerVPcloer+7iIgAXzTXg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay022txxb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Dec 2025 17:13:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+rQu1WihMy+GBraGNYdWLIl7hn7zhL7D6EU9j1gpR06fr4DyYyO+w2CJ+uz/eOSmj23Tvvq+S7nYqiehvUUf/c7nDvfQY548SEyUgggUozEFveoeHQ/kdgtLtGBpGvEe2/26DS1tGe4WXJ01EqXALpHHVbof2d/3/X9uBi9uauzPw+Wc0F6M2mk7+Ux3cDb0CEv+vG9E0vzSwoCZBUWNpPyXK73gRftdBOeXYh1nx34JWNtU18kXVpvA/UKTjQsz5AlYEVMJ4QiAXhYMg66AWFyar7GWdYasotbDY8UCwQuvAv8j84JBez2U+LGNnfKjQfm/qan2CADgeTxCF+Xpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXaDCZiVClWlb196J+mXLruPnplYwj99gNC5NA6V/ss=;
 b=vDN7qEOgBAQ/adl0fHn9d32jQqoP/rY5NYzGQip12sM5Jgw15/LOk1BqTtrXYrk+y04eF4nfWZPhbzgg9z3ck73V2B8y5mp0ZIuR52VkjULiykP1T54RQErOzXEQUAPr128bFJZYxjieSAPYuAdXERuqESLMbdAv+eRV1p7y7HEvTupCIc8FA3uL3m46zai6wVqES3xeN4jiRBRw+GaOZZrnrfy3uHHU1Lg8TsgeUhJge2OvEaPwIechoSKx2qebfLHNf3qVijW7aqMSDba8H34etdHqa/YuH9dzL00PAapOJqTydOQ6APqn03Wk4YVz2EQ1Wf17a8lAHK6EQ9mndQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB8435.namprd11.prod.outlook.com (2603:10b6:610:169::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 01:13:16 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 01:13:16 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Paul Barker <paul@pbarker.dev>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alex@linutronix.de" <alex@linutronix.de>
Subject: RE: [OE-core][PATCH V5 2/2] rootfs-postcommands.bbclass: fix adding
 'no password' banner
Thread-Topic: [OE-core][PATCH V5 2/2] rootfs-postcommands.bbclass: fix adding
 'no password' banner
Thread-Index: AQHcaqVDC78O9K4gpEq7ZPdARKjv7LUdMsDA
Date: Fri, 12 Dec 2025 01:13:15 +0000
Message-ID: 
 <CO6PR11MB56028B34D3F4318930C01EC0EDAEA@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20251204083208.1046464-1-Qi.Chen@windriver.com>
	 <20251204083208.1046464-2-Qi.Chen@windriver.com>
 <09078a17ec73a43bfbda989cdc9f4a2ece5d4384.camel@pbarker.dev>
In-Reply-To: <09078a17ec73a43bfbda989cdc9f4a2ece5d4384.camel@pbarker.dev>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=d774c981-b583-40d9-a177-5f67e8755960;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-12-12T01:09:52Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|CH3PR11MB8435:EE_
x-ms-office365-filtering-correlation-id: 3616cdea-3184-4618-6e2d-08de391ba0f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?WUFZeThaVE52cVRGUlYzSDRsL1hwR3pRUmRjeFprUDBEWkdQbDZ3MklBR0kz?=
 =?utf-8?B?ckFnWGpsN3BUR01BcTY0VEN5aFg1bkxQZCs0WUpiVWtVU2J0LzI2a0NPcHhL?=
 =?utf-8?B?bThieVVHalNRYkFMalVhcVk0MFp0c3UrOHlQV0lheURIVys3MlRaYStCb09N?=
 =?utf-8?B?N2Qyd0xYNjZrU1hYMGdnekFER1RpV2tYQ2p6YndEMkltYnNlMDhnNnp6M0RJ?=
 =?utf-8?B?L2VxNDRBOVpVREFWS3dpbjg5S00vRURNdUk0cVQ2b0N5S2FiWWJScXV6L3dX?=
 =?utf-8?B?VHBOeTJiNWREMi9VREJzNW5pS2FnRWFnSjE4U0FEMGdSd3liVy9Qb2dUcFMw?=
 =?utf-8?B?VTFwSlY4Zy9KRUFERk9iYTRNdTlNYU5IRVAyZGl0YTA4OEJ2Y0p3OXZNL012?=
 =?utf-8?B?SVZONlNsQ0RnUXRaWHY4dXdLemtNb241N29PdFJjRTh2QXVhVlpyZ08zbTda?=
 =?utf-8?B?SUVod2FjWk9OeXJnVnJ0eDdsTWs5YUlQUlc0MjRUWUxDRTFUOWlaY0phaGF3?=
 =?utf-8?B?VDVyZ3E5c05Jc0M1ZWVsdms0NGtJQVd4cUZ1U3NDNEJCSUJmaXkrSDNmcnBW?=
 =?utf-8?B?NXNHZjdGdkhidFV1VkE1akhXRWZjSW56SE9WT291aTZFdmhVdnAyQ3pibmJO?=
 =?utf-8?B?Ylg5UWF4R1JkZlJCWjBVT2FzcHJXM3pDTWlMN1NZWmEyLzQxMFc0OGY2NGpx?=
 =?utf-8?B?emY1b0tVeTRBK1dRSWV1V0JybTFITEhmbFlRaTNpaVJ3MzhvaHdoRktMd1pt?=
 =?utf-8?B?U2tZdm0zWXduKzU1RVZpTStnQnc5bzBBNjBLdFMzMEZ4Z3ErcHNGK0QwckFz?=
 =?utf-8?B?NzNWTU5WNUNPSVphQzRsL25CRVZRM0RrYS9pd1hkbUY3Y3p6Ui9EM3VjYmNW?=
 =?utf-8?B?NE9nYjRTc3J0anB5MHh2eFBqOE1lTXBrNmluWVQ4VFBUUE1tR25UeWRyTlh0?=
 =?utf-8?B?TGtBdmJneWE4Z21IWi93cjdGVlJPMnVuM0tnRTlQaWpBUGJSbGRSbUxvSTBC?=
 =?utf-8?B?NDlKRStSam8yaEJlR1JqWm11RXNQMTU1SGRvQmFMTlk2YnVhcGJYb2NpNXQ2?=
 =?utf-8?B?MHpMbFhhRmFVWXBVaThNRnh6a2M1KytaOTNLa2VYWWZBMzlLZCtra0Q3cXRD?=
 =?utf-8?B?TXJXMGw2d0JiM1E5TE5WNzh0YWZGMU5zdzVFVVFPb0xZRXdXclM2UUx3QWQy?=
 =?utf-8?B?MzIxSFhvTkJGYmkwV2lYb21VNm1MbkhuODFvNEMzdUM1K0dUSGpNWTVCcXVy?=
 =?utf-8?B?Z0ExbVUwOHhWSCtwM3JpWGhyY3QveWhtZUlKcjgvRkJBbUVlNGhvaWd1VGhk?=
 =?utf-8?B?anczRDBCczFvL1hoYnROaDhDTWUwaDRyVlBDNWVsRDhmTm9kK2l5ekJXbnly?=
 =?utf-8?B?Y0twK2xOeEFLZmxrMW1YRllOS05TazZKWTRXaFAxc3hmRWQ2VnIySFFGUEpp?=
 =?utf-8?B?QWtaeiszTldqSE5JbjI1WE9EaEdzQ0NBTmRGUE93dHJ2ZWoySGQ2NDZhdWtt?=
 =?utf-8?B?ME5seUMrRXpyOFc0SjdFc01nL2xETGdkbHJreStRU3dtUS9ab3doSG5INEdG?=
 =?utf-8?B?UVBGUXFaS2I0TWpIM2FiNllJN044VSsyM2xuKzIxVGVXbGl1dnRpcTFZNG1P?=
 =?utf-8?B?OVdvRlVzVElZRHRnSnlsZC85SXliakRCandCOVBZYjlMMnphcmR5Y1oxYzc0?=
 =?utf-8?B?cldNK0x4R0d6cnZERmFjaERWT3pnK01Rc015NnZYYTkvVVZDQ2E4RTgwWkl6?=
 =?utf-8?B?TUV1RzJHcWo4T1EvTkxPbXdZTzNMVURxTytQZUgzNUNFeHA3NEVBeVVTblVQ?=
 =?utf-8?B?bHMrOW00SHBhREhDaHZXRDhsNkIzeXYrVEFtLzBLdytGUTlhYVdaejM2Tmlt?=
 =?utf-8?B?UHFKMXBxNnN2THZtWGhuTlpDWUFXbUZCYkVCZUNBRHZLbGhFbDVFL2lhbisw?=
 =?utf-8?B?K1hkT0F0UzBCMFRDU3U2NmtBd0R6L3JMdjFhYUc4Yy81RmNrbGJlYUJSYlN1?=
 =?utf-8?B?SlNWVkhuK21NaTYyRE11b2Z1bTdiTWJBNFBUdmdOVTBsVjgzcytUVW96UXI4?=
 =?utf-8?Q?zhMZd/?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?c1crV1dYUnNPaFNBSFlmd1lPUXhkaUJ6TWlkaDRpRnAvZjAxWVpoUXdmMGZI?=
 =?utf-8?B?bmV6Z2RHTzU2Yi9VQUhpVFlVVXpmMjhpWFh3eXpiT20zalJ5bm5GYUpZcW9l?=
 =?utf-8?B?cW03bGhNM3VORERiRkM3bStSZ1NkamM3VWR4Q0tlLzZuaWIxZ0o2WmZkNVQx?=
 =?utf-8?B?OUE2K0l1L1ZWVHNoeDlmbnZ6QzRHK3F1bDlyT2NJM1F1QzFQTHpONDBGd1Fp?=
 =?utf-8?B?R2U4anc4VWZYVThZVkk4U1NGTWRYQ2Fub2xZOTd4WCtrMXhEL0lkQjJiQjhJ?=
 =?utf-8?B?N3hLUWp2ZHJ6NEZSN1J6dFJYK0JzY002ZnpHU0ZDQ3pTQllqUG0wQWJjMWFz?=
 =?utf-8?B?UkJQcEVpejBtK2YreGJTNW9HMFZweTJZZUdOSHlIM3d1TEJ5RUl3bjFvV2RE?=
 =?utf-8?B?Q29yYTE1TElTT0N5VFpmZXZRYndZQ0FLbW1Ddyt1VDFQbW5kcjk3cXA4QTJx?=
 =?utf-8?B?OExsc3JReDZjdU9NZXhKa29zMjZGeTZZNGJQdytsM1pTcUxaUHl1aXNWVklW?=
 =?utf-8?B?czAvalNva1pmQW84OE1SanhlK1JvMk1GQWQ3ek4vN3IwZ2NOYmVlYWVZeUgz?=
 =?utf-8?B?VHJkZUFrckpqY24yVjRLZ1hyZlhOdzg2VTJEYUhsVWJ6R0JUYTdINjU1Tlpw?=
 =?utf-8?B?SmJKQlFQZHFGSVBBejhBM0tiOTROMy9CYWF3RVNsajdIa1d3M25kMXpTKytP?=
 =?utf-8?B?S2Y1K09HYm1YNEN3d1M4VVBHZjE4Nk9kNk5qZUsyenVBNS9SbEFqWVIrVVNU?=
 =?utf-8?B?N25vZHVPWUw3aTh0ZGluRit4YkJRWUZSQWp5MkJaenF5MFBnMGMxc3NtZjJQ?=
 =?utf-8?B?c3VQTXBTSzZrZ2FsWmdxYVYrZHNEMk9EM1hXWVlkc3hMSnZOZWd2bVp0OGY4?=
 =?utf-8?B?T3VPTWp3cEpXRE41dWZpNkJIUm9LRnM0WDJNazd6UWhkTUF5Y1RtdndTc1Nw?=
 =?utf-8?B?Q2pIQUY2bDBrMUtvUFhPWkJrQ3dWMy9qUXBFNTRRMHErN1NsTjFjaE5sa2lU?=
 =?utf-8?B?RksrbFA5WVRLQS9jdk9FRElxS1ZjTXhxWjZiclRtY3BDTlJpY3RUOEhvN3Q4?=
 =?utf-8?B?WWRjelg3N1c3N2M4YWxOZkNzeXUwVWhHaE8rYUd2S3lOQnlMRkt0RDdOWDc5?=
 =?utf-8?B?RHM2T1V6Ymc5UG9oQTdXMUZXcVhldlE3OXQ2TVpUK1BOczA1Sm02aUtmVEhj?=
 =?utf-8?B?N3JvZ3p6MVJia0pIZDB4RVM1SDBmQVdwODhnd1c5c29WL2RLa1BmUVdFYllj?=
 =?utf-8?B?N2t4TTA2SllYdTRnU0FsQWtraFdGSWlUb0xOMDBzeUVqTnVyMy8rQ2tGWDNW?=
 =?utf-8?B?M1RVNm1iNkMyRlYrWXFBK25IVEJOK0xSZlQ5cGxab2FIWHl5ekE2ZHNyc2JY?=
 =?utf-8?B?djJydm5zQWE2K1JlY2xybUFsZU9kL29qbmRZSEJaU2h2alhvaE1oUkVGQ3FV?=
 =?utf-8?B?Mkt6eHJyZ1RFemFzTjczSXJlSUUwNzlKSmVURURUcW45cUtPMERvajZEc24x?=
 =?utf-8?B?dDFqMGVjeU9BMmI3aGhicG1CcXR0Ui9abjFhZUk2bFFwVDZBc3RQSGFnZ0RX?=
 =?utf-8?B?WFBOODQ1dnQ1OUdLdGdiSU5zbWFRR1paUWUvMTJocTd1YnRyR0g1STRlcGJW?=
 =?utf-8?B?WkxOTjJKeGF2azFGSkNaR1FoeHVJbE1XL0R3UERyaHRUUHJsYVUzN3NDVnRL?=
 =?utf-8?B?d0FseVJUUWJJV0Z4dHFldVlkVEg5M3lvOUExKyt2ejZtSmVaQnlna1I5RHhR?=
 =?utf-8?B?TTdTM1o3b2FVU3ozMGxLNi9wVjBPWWVzQyswaFl2REx3Mm0xbUhDMkpXWUNC?=
 =?utf-8?B?T1F4NytFckZ4T0d3cldOVENpT2d4MDhRcy9lVTMwWUluS1VXcWVPMDhRVXRP?=
 =?utf-8?B?bEdmNzk5djJDSXZ1bGJGTUQxY0NrdHV4N25YaWRUS051VTdPdlVTUEZQVXQ1?=
 =?utf-8?B?YTJxYWc1SHFPUDRhWWVXR2RoekY2ZlZvWWFFSHNRbWxqZU5VVjdVdWtSMFhu?=
 =?utf-8?B?TWF1bFlFNmlnVVc0WnlZQjdwZ2NsR3lpTFZncjFDak5BcnR1d1NjTlk0UStn?=
 =?utf-8?B?SEI2ek5qU0s3cG1hQW96TUxXRWQ1SjVJUG9xN01oMFRNWkhMRkd4RHhvcEJG?=
 =?utf-8?Q?WRYKqDevSQ8jycdCetXm4pXKI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3616cdea-3184-4618-6e2d-08de391ba0f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 01:13:15.9912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vi+XGbrpJQvM/KojV1VhrTHaI01imBHkt1JFYHCU9DG8/GbM4Of58uHIvUT7kx5JDA92XR8bBHBTjsbcpuOfdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8435
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bf1mkePB c=1 sm=1 tr=0 ts=693b6c30 cx=c_pps
 a=xOYz1KraVtwoi73AohHYLg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8
 a=EPMWOeRl9xkjBqIsdVwA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: opD8YAgfy2_9eBrQe9zV9LTVUnoTOE2E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDAwOCBTYWx0ZWRfX5TkPOIwbAH9c
 1ZJuCgwog8y1ZigvVM9LZJy36wfxghfTRFtYhY9bPlLFVDuLEjLxvl2l2HUdZnE/uggHRsc//ai
 e2Ak9rlaqOJi/ERUpkcjMLGKsrkJZoLDTMUsb32VuOHjzJu2a0d6nzF5Ld2kwXhRswxWaNUl0HH
 6hSwyY9aURpnblO4JyWeL1a0ZYfxINwnmXj32X7DFIIVLpSrnnO57cE8gCzYSFXGYRniltSO+OZ
 hP/a23ORf5McV/L1jTstSKFj/BxE0pLkIJl9mKRdyYJ7KgmYE0mZczfTpMOhJYRWGCtwJr82cai
 g1wAdz5mE14sVJOQkHvkU2LHJgwvGq/Dl3eka5UnMnXTw8igW86HjnOlMdT3Iv7yXUutDZdFPNG
 Ze4bnxcB4b+jkitjxOucAJa6dSxlAg==
X-Proofpoint-GUID: 6dWzOJTdoRYCtCPzarKvOZWtK5CvpkPh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512120008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 01:13:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227567

SGkgUGF1bCwNCg0KVGhlIDphcHBlbmQgaXMgbmVjZXNzYXJ5LiBTZWUgdGhlIGNvbW1pdCBtZXNz
YWdlLg0KVGhlIGZ1bmN0aW9uIG11c3QgcnVuICphZnRlciogdGhlIHNldF91c2VyX2dyb3VwIGZ1
bmN0aW9uIGludm9rZWQgYnkgZXh0cmF1c2Vycy5iYmNsYXNzLg0KVGhpcyBpcyBub3QgcmVsYXRl
ZCB0byB6YXBfZW1wdHlfcm9vdF9wYXNzd29yZCBmdW5jdGlvbi4gVGhpcyBmdW5jdGlvbnMgY2hl
Y2tzIHRoZSBmaW5hbCBzdGF0dXMgb2Ygcm9vdCBwYXNzd29yZCBhbmQgZG9lcyBtb2RpZmljYXRp
b24gb24gL2V0Yy9pc3N1ZXMuDQoNClJlZ2FyZHMsDQpRaQ0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogUGF1bCBCYXJrZXIgPHBhdWxAcGJhcmtlci5kZXY+IA0KU2VudDogVGh1
cnNkYXksIERlY2VtYmVyIDExLCAyMDI1IDk6NTEgUE0NClRvOiBDaGVuLCBRaSA8UWkuQ2hlbkB3
aW5kcml2ZXIuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
Q2M6IGFsZXhAbGludXRyb25peC5kZQ0KU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSCBWNSAy
LzJdIHJvb3Rmcy1wb3N0Y29tbWFuZHMuYmJjbGFzczogZml4IGFkZGluZyAnbm8gcGFzc3dvcmQn
IGJhbm5lcg0KDQpPbiBUaHUsIDIwMjUtMTItMDQgYXQgMDg6MzIgKzAwMDAsIFFpLkNoZW5Ad2lu
ZHJpdmVyLmNvbSB3cm90ZToNCj4gRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29t
Pg0KPiANCj4gSXQncyBwb3NzaWJsZSB0aGF0IHVzZXJzIHVzZSBFWFRSQV9VU0VSU19QQVJBTVMg
dG8gc2V0IHBhc3N3b3JkIGZvciANCj4gcm9vdCBvciBleHBsaWNpdGx5IGV4cGlyZSByb290IHBh
c3N3b3JkLiBTbyB3ZSBuZWVkIHRvIGNoZWNrIHRoZXNlIHR3byANCj4gY2FzZXMgdG8gZW5zdXJl
IHRoZSAnbm8gcGFzc3dvcmQnIGJhbm5lciBpcyBub3QgbWlzbGVhZGluZy4NCj4gDQo+IEFzIGFu
IGV4YW1wbGUsIGJlbG93IGFyZSBjb25maWd1cmF0aW9ucyB0byBtYWtlIGFuIGltYWdlIHJlcXVp
cmluZyANCj4gc2V0dGluZyBhIHJvb3QgcGFzc3dvcmQgb24gZmlyc3QgYm9vdCwgYnV0IHdpdGhv
dXQgaGF2aW5nIHRvIGZpcnN0IA0KPiBlbnRlciBhIHN0YXRpYyBpbml0aWFsIHBhc3N3b3JkOg0K
PiANCj4gICBJbiBjb25mL3Rvb2xjZmcuY2ZnOg0KPiAgIE9FX0ZSQUdNRU5UUyArPSAiZGlzdHJv
L3Bva3kgY29yZS95b2N0by9yb290LWxvZ2luLXdpdGgtZW1wdHktcGFzc3dvcmQNCj4gICBJbiBs
b2NhbC5jb25mOg0KPiAgIElOSEVSSVQgKz0gImV4dHJhdXNlcnMiDQo+ICAgRVhUUkFfVVNFUlNf
UEFSQU1TICs9ICIgcGFzc3dkLWV4cGlyZSByb290OyINCj4gDQo+IENoZWNraW5nIGFuZCBhZGRp
bmcgc3VjaCBhIGJhbm5lciBpcyBlbnN1cmVkIHRvIHJ1biBhcyBsYXN0IHN0ZXBzIG9mIA0KPiBS
T09URlNfUE9TVFBST0NFU1NfQ09NTUFORCwgcmVnYXJkbGVzcyBvZiBJTUFHRV9GRUFUVVJFUy4g
SW4gDQo+IHBhcnRpY3VhbHIsIHdlIHdhbnQgdG8gZW5zdXJlIHRoYXQgdGhlIGZ1bmN0aW9uIHJ1
bnMgYWZ0ZXIgDQo+IHNldF91c2VyX2dyb3VwIGZ1bmN0aW9uIGZyb20gZXh0cmF1c2Vycy5iYmNs
YXNzLiBTbyB1bmxpa2Ugb3RoZXIgDQo+IGNvbW1hbmRzIGluIHRoaXMgYmJjbGFzcyB1c2luZyB0
aGUgJys9JywgdGhpcyBmdW5jdGlvbiB1c2VzICc6YXBwZW5kJy4NCj4gDQo+IEJlc2lkZXMsIGFk
ZGluZyBzdWNoIGJhbm5lciBpcyBvbmx5IG1lYW5pbmdmdWwgd2hlbiBiYXNlLXBhc3N3ZCBhbmQg
DQo+IGJhZXMtZmlsZXMgYXJlIGluc3RhbGxlZC4gSW4gY2FzZSBvZiBjb250YWluZXIgaW1hZ2Us
IHRoZXkgbWlnaHQgbm90IA0KPiBiZSBpbnN0YWxsZWQgKGUuZy4sIGNvbnRhaW5lci10ZXN0LWlt
YWdlKS4gU28gYWRkIGV4dHJhIGNoZWNraW5nIGZvciBpdC4NCj4gV2l0aCB0aGUgYWJvdmUgbG9n
aWMsIHdlIGF2b2lkIGJyZWFraW5nIHRoZSBmb2xsb3dpbmcgb2Utc2VsZnRlc3QgdGVzdCBjYXNl
Og0KPiBjb250YWluZXJpbWFnZS5Db250YWluZXJJbWFnZVRlc3RzLnRlc3RfZXhwZWN0ZWRfZmls
ZXMNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4N
Cj4gLS0tDQo+ICBtZXRhL2NsYXNzZXMtcmVjaXBlL3Jvb3Rmcy1wb3N0Y29tbWFuZHMuYmJjbGFz
cyB8IDE2ICsrKysrKysrKysrKystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy1yZWNp
cGUvcm9vdGZzLXBvc3Rjb21tYW5kcy5iYmNsYXNzIA0KPiBiL21ldGEvY2xhc3Nlcy1yZWNpcGUv
cm9vdGZzLXBvc3Rjb21tYW5kcy5iYmNsYXNzDQo+IGluZGV4IGY0ZmJjNGM1N2UuLjhkN2U1ZTc2
NTIgMTAwNjQ0DQo+IC0tLSBhL21ldGEvY2xhc3Nlcy1yZWNpcGUvcm9vdGZzLXBvc3Rjb21tYW5k
cy5iYmNsYXNzDQo+ICsrKyBiL21ldGEvY2xhc3Nlcy1yZWNpcGUvcm9vdGZzLXBvc3Rjb21tYW5k
cy5iYmNsYXNzDQo+IEBAIC01LDcgKzUsNyBAQA0KPiAgIw0KPiAgDQo+ICAjIFphcCB0aGUgcm9v
dCBwYXNzd29yZCBpZiBlbXB0eS1yb290LXBhc3N3b3JkIGZlYXR1cmUgaXMgbm90IGVuYWJsZWQg
DQo+IC1ST09URlNfUE9TVFBST0NFU1NfQ09NTUFORCArPSAnJHtAYmIudXRpbHMuY29udGFpbnMo
IklNQUdFX0ZFQVRVUkVTIiwgImVtcHR5LXJvb3QtcGFzc3dvcmQiLCAiYWRkX2VtcHR5X3Jvb3Rf
cGFzc3dvcmRfbm90ZSIsICJ6YXBfZW1wdHlfcm9vdF9wYXNzd29yZCAiLGQpfScNCj4gK1JPT1RG
U19QT1NUUFJPQ0VTU19DT01NQU5EICs9ICcke0BiYi51dGlscy5jb250YWlucygiSU1BR0VfRkVB
VFVSRVMiLCAiZW1wdHktcm9vdC1wYXNzd29yZCIsICIiLCAiemFwX2VtcHR5X3Jvb3RfcGFzc3dv
cmQgIixkKX0nDQo+ICANCj4gICMgQWxsb3cgZHJvcGJlYXIvb3BlbnNzaCB0byBhY2NlcHQgbG9n
aW5zIGZyb20gYWNjb3VudHMgd2l0aCBhbiBlbXB0eSANCj4gcGFzc3dvcmQgc3RyaW5nIGlmIGFs
bG93LWVtcHR5LXBhc3N3b3JkIGlzIGVuYWJsZWQgIFJPT1RGU19QT1NUUFJPQ0VTU19DT01NQU5E
ICs9ICcke0BiYi51dGlscy5jb250YWlucygiSU1BR0VfRkVBVFVSRVMiLCAiYWxsb3ctZW1wdHkt
cGFzc3dvcmQiLCAic3NoX2FsbG93X2VtcHR5X3Bhc3N3b3JkICIsICIiLGQpfScNCj4gQEAgLTY0
LDYgKzY0LDEwIEBAIFJPT1RGU19QT1NUUFJPQ0VTU19DT01NQU5EICs9ICcke1NPUlRfUEFTU1dE
X1BPU1RQUk9DRVNTX0NPTU1BTkR9Jw0KPiAgIw0KPiAgUk9PVEZTX1BPU1RQUk9DRVNTX0NPTU1B
TkQgKz0gJ3Jvb3Rmc19yZXByb2R1Y2libGUnDQo+ICANCj4gKyMgQ2hlY2sgYW5kIGFkZCAnbm8g
cm9vdCBwYXNzd29yZCcgYmFubmVyLg0KPiArIyBUaGlzIG5lZWRzIHRvIGRvbmUgYXQgdGhlIGVu
ZCBvZiBST09URlNfUE9TVFBST0NFU1NfQ09NTUFORCwgdGh1cyB1c2luZyA6YXBwZW5kLg0KPiAr
Uk9PVEZTX1BPU1RQUk9DRVNTX0NPTU1BTkQ6YXBwZW5kID0gIiBhZGRfZW1wdHlfcm9vdF9wYXNz
d29yZF9ub3RlIg0KDQpXZSBzaG91bGQgdXNlICs9IGluc3RlYWQgb2YgOmFwcGVuZCBpbiBhbGwg
Y2FzZXMgdW5sZXNzIHRoZSBzZW1hbnRpY3Mgb2YgYXBwZW5kIGFyZSBhY3R1YWxseSBuZWVkZWQu
IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB3ZSBqdXN0IG5lZWQgdG8gZW5zdXJlIHRoYXQgYWRk
X2VtcHR5X3Jvb3RfcGFzc3dvcmRfbm90ZSBhcHBlYXJzIGFmdGVyIHphcF9lbXB0eV9yb290X3Bh
c3N3b3JkIGluIFJPT1RGU19QT1NUUFJPQ0VTU19DT01NQU5ELCBhbmQgd2UgZG9uJ3QgbmVlZCB0
byB1c2UgYXBwZW5kIHRvIGRvIHRoYXQuDQoNCkl0IHdvdWxkIGFsc28gYmUgYmV0dGVyIHRvIGtl
ZXAgdGhlIHJvb3QgcGFzc3dvcmQgcmVsYXRlZCBtb2RpZmljYXRpb25zIG9mIFJPT1RGU19QT1NU
UFJPQ0VTU19DT01NQU5EIHRvZ2V0aGVyLCBzbyBwbGVhc2UgbW92ZSB0aGVzZSBsaW5lcyB1cCBz
byB0aGV5IGFyZSBpbW1lZGlhdGVseSBhZnRlciB0aGUgemFwX2VtcHR5X3Jvb3RfcGFzc3dvcmQg
Y2hhbmdlIGFib3ZlLg0KDQpUaGFua3MsDQoNCi0tDQpQYXVsIEJhcmtlcg0KDQo=

