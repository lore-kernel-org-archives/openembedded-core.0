Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD865C369CB
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 04:57:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4255.1745643437908425954
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 21:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62117661af=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q4Z2LG008128
	for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 04:57:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq1858n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 04:57:16 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53Q4vG9n007532;
	Sat, 26 Apr 2025 04:57:16 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq1858m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 04:57:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezxJ8UxL6zt9sVjIPyC8kizesUAbupYNWVUoG6g52IBazW7/rGomHS59adyGK0UPCIGmxnVjiECPZFuSYCV18aZQp26pUxx8a/kCFxwlY4EAfMm4WpfVmxRNTEMxT5bSnlMEa9+0Fj1RcqFmaiw7p9bfbxayLf8uxChehIt04K1FIpUWW4CUKCAiLxAeCgdSnRzic67eRVUOAuSjzYsRhW+SXj52FagqFLDq0YzyIH2JZGRSNuLOUKrGfJHPGdC6CgfRmoH7cYmmVX/q+07iqWcpq/s9o59G1dbbBj3p7auJ0rtYPS+qRozGkuz368shXNcxVByDC7/BSFzIL0Nzkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0n2zprfPp6Ptxs3r6PBTr4M8xWXkpPbnhr1GY+FTd0U=;
 b=cHrgkqGhdk3ZhgHizqF8Xi9HY9MFffT5WVcD7mBjVPJqA3EjNFC6BAsqmKocQyTXZMyAJpdikkyaCCPad9CunyUNq0OhfPTqPK4YlxGzFCVM561+kiyqyFoX8Jl3fKGI2xrYVPnj+KsWTIFGe59LI8OCPNGbGecs9x9xdCTjXn9DIOqH+W1q/BaSyxOHaDIm3nEO3pB5cWDto8Kk7li1LyCxzxyaDN8XxuzLGYe/c2CYAyaohM337O0ax7ShGNQyPuCy9D/zpEAtZEYWXjjSe7JMAjGT8Vo2Uetvic9Soz24FBbwz6AkTQUoCYuozElaGfXm1rgHbQ30fBW8SKTdPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB7919.namprd11.prod.outlook.com (2603:10b6:208:3fa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Sat, 26 Apr
 2025 04:57:12 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8678.027; Sat, 26 Apr 2025
 04:57:12 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH V4 5/5] lib/classes/recipes: refactor
 qemu.bbclass functions into library functions
Thread-Topic: [OE-core][PATCH V4 5/5] lib/classes/recipes: refactor
 qemu.bbclass functions into library functions
Thread-Index: AQHbsal/xJGh28o8SESQqK8kpO8FhrO0i0KAgADYKjA=
Date: Sat, 26 Apr 2025 04:57:12 +0000
Message-ID: 
 <CO6PR11MB560213D8F0EE3692EAC8C1A6ED872@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20250420040528.4012613-1-Qi.Chen@windriver.com>
	 <20250420040528.4012613-5-Qi.Chen@windriver.com>
 <76b6266900221f41a43835a3a4962b7b129309ba.camel@linuxfoundation.org>
In-Reply-To: 
 <76b6266900221f41a43835a3a4962b7b129309ba.camel@linuxfoundation.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|IA1PR11MB7919:EE_
x-ms-office365-filtering-correlation-id: 365a3a0d-08a3-4c00-838e-08dd847ece98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Y0RvcmF5Qng2N2dyU05MbVY5UGtjV2RCalA0OXFJZGVYR1dDMW9qVU5LSVk3?=
 =?utf-8?B?eGxhQkNNdmVMWUc0U2NpUlZESmM3R21VdWVlMHk2RHJ5NHp5ODM1T0hta0pu?=
 =?utf-8?B?MG5pT2JoaDlTWUMvQ3ZPS0xXZ2o0TStEREFUbFZQaWJySktvZy93YnNYS2c3?=
 =?utf-8?B?VWRXNlRBS2dONWNNSUFCRVF1RUNSS09Fb0NKQk9sMkYrYkowUDUxUVlSbC9i?=
 =?utf-8?B?WEZYMGFrS3p4ekRBWTBvUEVhTEtUaThoeGhJMzhZVXZ5NDBwM0MwRWxaOGMx?=
 =?utf-8?B?L0lzMGhkejNPSUxUSVBUZi9IVitiRU5LcHJma3RldURsaGo5OFIrcXpXWW5y?=
 =?utf-8?B?SEdpTHpwL0NCZFFZS2hNRUJLSnd6MUczWm1LVkxGVGFJVXdhc2tBZTdUQ1dG?=
 =?utf-8?B?c3k3Q1NYVXBlSzNjcys5NmxQNDRHNk9lNFB4c0F1MExUMzBmaGJLd3NoY0cy?=
 =?utf-8?B?cG5KbFRjT3Z0SEhsS09udGpxR1l4aVFmak5LVFFoSldwemNDV0pDMmVXeTFY?=
 =?utf-8?B?b0N2cGNBVDl1QUlBWkY4ZFhack00OXNIQkN1OEJiL044UktTUmZlWTZBRHNN?=
 =?utf-8?B?bjNaRzFYcE1hOUt6dFBNeXovTElxUERLajFQSHltdnVOc2FqdDJUd2N6Y0FM?=
 =?utf-8?B?WmIxenJGelVVZEVuZXZIM29mbXMyK2dKSXZGTFR2Sm5FRTlzSitFR2FHaFRu?=
 =?utf-8?B?ZXVnZEFZMklpaUdOR1p0TkF1L2F3WWtBT3MzUmEyUlFpT0o3ejkwZWdFeWJ3?=
 =?utf-8?B?Nkl3d1gxRGpYV2k5TmI4MENxc3Y5MGpBNEpwMThQMWZDU24zLzRRTDVzL1Nr?=
 =?utf-8?B?UXRSNG9SRlRDV2Y1RXIxSTNJai9FWVhmam1naUFEZll0MUNDUm9ZYUVSaGxX?=
 =?utf-8?B?QjdTKytGbTNhT0M2UFZHemE2U0dYbnYrREtzeG81TVExUEdZWnlSeEc4SlVx?=
 =?utf-8?B?VkNtY1RhUTR4aUZqUmRYa3QxenhLblhtWmQ2MGkvaHFzUXgyV1RrSWZoUTRQ?=
 =?utf-8?B?NEsrSGRkUG4wVDlrbDkvbHRVcmJ4VThZamtnTmFYUEZkc0RHR1lNcU5nbklX?=
 =?utf-8?B?SHduaFBaQ2p1YTZUMGxSclo5eU5iMjM5SXdBZVVlVEU0eDIxemVTNHgxTERO?=
 =?utf-8?B?RjhLUWd2THN3SVZBeWZQWWozcjdKWEhHWVdwRzR5aklSdGJXZ1lhOTJsUmNT?=
 =?utf-8?B?WEZwdnZmYTg2VlhvN1FzbUJTenpKT2lUSzlUQkp2VU1QRnc2MFFLM3pqSlpU?=
 =?utf-8?B?ZU8wWm1vUklYZTluaUxINjlESjJ1eUZobzc5V3luMU4rT280RXNWNkpEV01z?=
 =?utf-8?B?eCtucDUwL2poQVdXaFRTMnpQelpna1pHRHlPN1VnL2I5bnRPZGNMWUhaMjhq?=
 =?utf-8?B?bWhwQ1NZZnY4cC9xV2pQY0ZES0VoLzROcEx1V1NNcE9jeXVIR1NialdhbnB2?=
 =?utf-8?B?bGJpS2Nsa3lDclBOYnJ0Znd6d1RBemNTdFpLZ3NMYzhCdHc3UmlxaVlsaUJa?=
 =?utf-8?B?eDNqbHdWcEx0eXVCQmFkN2pxTmxxTFJ4NjV3NmR5S1Y3dUdVYzRuZWV3Y0hy?=
 =?utf-8?B?VjhqM3B6dmd5OUwwOGxnc3VCMmpDUThFYlk1cEFwNVE0Vld3Q1MwdTB3S0My?=
 =?utf-8?B?OEVSaUVoOXBwYUR6cXA5L1lBcjcvcW05ZGZsUFN3QnFKQ1JPVjZPNDFEUFlI?=
 =?utf-8?B?RHNEUndIUjJZQzBoRXNqQzViWHJTbThmWlpUZndYNzlFSUhMZXY3SnU4a1hx?=
 =?utf-8?B?ckV0OW9UeXZEQVFYRnRHWm93V1dSZXZYVEdpdUFMV01Pc2IyWjhYR05VbG9m?=
 =?utf-8?B?TURHTElJZWUyOWJFVkFpYW0yeE9zRXUwS3oxZUx6YUV2VVBCZUFiUGU2K2Vv?=
 =?utf-8?B?TWtuRUJmT2Z3R2dPVU92M00waG5mcEU0NkhVTVcyL3NNa0V2Zm9kT0NHTEVC?=
 =?utf-8?B?bFo3enpGS3I0c1hIWEJHWnFhNEE3R1N1cUptZ0lEa0VCVDFLMk43Q0JHckcw?=
 =?utf-8?B?amNiaWJHNy93PT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N3NrL0E3UDZXRXM1ZHY5SnFUd1pWQWVPelBrRkZXd1lWTVhRZ0FCR3RWSkJs?=
 =?utf-8?B?TlN2UjlXOTJRQnNKUWZoU1ZnVWxILy9ONkJpQzMwRWlaWFFyQW94WGwvMXZo?=
 =?utf-8?B?YmNhSVdheXM1RHdxTktVaS9mNWZvQUFERDhBcS9vWFlCbytqUWpXeFpPZUU5?=
 =?utf-8?B?b3FhMmpOM0dxbURnNTg3QUxBMS8ybTFPVzhSTjRFU3J2U3hBOGJDL1daMFBq?=
 =?utf-8?B?UUhiRzZqME5KYXhUR0tYZmsydWtYMTFTd2VaaUk0YjQzVFltemtXOHNueVc3?=
 =?utf-8?B?aDBYa3RITVVxZTdzOS84UkpNa2hZSDVVbktHUitJWTlYd1J1R2Nkc1pmNHVv?=
 =?utf-8?B?dnB3VTFmekYrTGM2SWtNWHlxYWNIUGtwME1yUDUvTlI1eTFhK1FZNVNPZzFK?=
 =?utf-8?B?Snk2UzN5ekJwNzUrUUpIajI5VkJTakl4dXlQSGhqclhEVHg3dmJFR01tNjlm?=
 =?utf-8?B?bldxdXRqZi8vRlpVaWUwNyt2YUNRc2NZem14VnJTZkJoV3EyamRZMkRsUW9P?=
 =?utf-8?B?UjN3bjY5STFSQWJqdEVKRUlDcE1RYnB5eGVGamRGckswSEN5OXdTY2FTNGlC?=
 =?utf-8?B?dmxidHVhUGRLcFFuaTM4WGQyQzZJWmtVQXZzd3NXWHpSRUlUblZjRnNBVTEz?=
 =?utf-8?B?cEpXNldiaFZ0YlY2MGNIalNtamkwK0ovYktHTDc4QXU0TGcvTDB1b29NRHRL?=
 =?utf-8?B?Y3FsNjNDTnF5RUM1YmdOQ0UzVVZnYjRBTFFoWS9OVWtkRHpQYkRKSFlnVTRh?=
 =?utf-8?B?SktQOEpQazZJaW5rRUF3MmhsUksrZ1RvL2xySnZPVGtNTE1nc052S3RtVk44?=
 =?utf-8?B?VDhPemtQNTBFTEVQM2RKWkJtU2ZzZWdpcjF5NHd0SlpyZlE0Vkp1Zzl0cWxk?=
 =?utf-8?B?Vmpjck1uSU82TFlkb3BkZ2k4N3J4S1lIUDBhTGk2dFN1R2IyK01URTl6VUtm?=
 =?utf-8?B?aVNqSnRjcUhzRlZZemw2ZXgvL201eDM3N2JOUnQ3VTdtVXBXY2kzNEJFdEpl?=
 =?utf-8?B?bFpUTkcxb1I0d0NXT1JhMjFhbjBEVm9hYXJycnMzTjFnRkRJSmdsWlZJVU9m?=
 =?utf-8?B?cE1WMFd6TTdoa1d4ZTZQaGRWTDU1WlZWQlgydlZQaHI4UmNKNTJadTBQN2Nk?=
 =?utf-8?B?ZXVGL0h4WVZtc0xENk5vUDFHN3A3Q2VmbmNqTXE2WERHb2FmcEZXait0Y0V2?=
 =?utf-8?B?d3pTZUtTWndzM2ZUekhxcDUzcmU1ZkwwN3ZhYTUvQ055N0RUU1lQVTh5TTRN?=
 =?utf-8?B?MmJ6UWlwVGR2WDdJS1h2QTlQTGFKNWxPdzBMSEJrT0drbXp0OTNEUC96U1Uv?=
 =?utf-8?B?NWdzMGkvR3BhdWUvc2oyaXZOQy9aZXJ5KzRUZmdYS01sejUvb1hzb2pmOG5W?=
 =?utf-8?B?OVB3Zlo0aVN0ZVhVZFdTaUNuZUVkM0pCd1BRdTZUK08yeE40Z3d3WjhZWEc2?=
 =?utf-8?B?R2xJc1I4cm1HMUtWLzF5enFXbzRLN2s0M0pJcGdqa28xR2xPNElVL3FUK2tz?=
 =?utf-8?B?UVVyVlBvM0RSTGhCSCtvYmxDcS93cnFpcm9Oc0szOGE1ZTl0MkJaV2VJbkVn?=
 =?utf-8?B?emE0WGlUd2EvK1BmMEZ5YUliWEV0cjZrak5yUDRkTkU4aklrYkNkV0cvTmF1?=
 =?utf-8?B?SHVPd1JwQ0wwWlM4ZzZiUUFxaFRQNlNZclpsbHJtVnViNlcxck5rQ2Uwc3dr?=
 =?utf-8?B?a2ZNYzNjbHVmNjBrRVJLV0pSRUdJM2JJQ2pNSFRaanBhK1I3c29kSmlIZ1BB?=
 =?utf-8?B?M2ZVRkhyOExTcWRrbnhsMVdDM0J5NFV1czkyL0w5VWMzUVBwMldLbzh2ekFp?=
 =?utf-8?B?KzltL1ljeElrd1QvL1JzK0JILzlNNjh2TW92MGw4UmRIYnVxSDVTZ3BxZ3Ra?=
 =?utf-8?B?V2lETzRRN1YxS245eS9RMDNSV1d5QjlicDBHTjdFMXQ4VXllakh5dGFUdlAx?=
 =?utf-8?B?THJLNG5ubVlucnR0NmpGYlluSVBOc0FiaFVXRW9FVW5JMnlQUnVNd1c5TlBF?=
 =?utf-8?B?VDBudlVUbWJnWFhRTjVBaHpKVDVscXk4cVVVS1crQmZQQ01ZYWd6K1MxSmpN?=
 =?utf-8?B?ZGNxWXFvbmdyNy9IS01ObTRQVEhRUWNCNzl2Rjc4OG1UamI3Q0pUdEU0R1pF?=
 =?utf-8?Q?vLBA3ProAz4M6YW04wmu4MrtU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 365a3a0d-08a3-4c00-838e-08dd847ece98
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2025 04:57:12.2980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pz10RMXwVHT66x2eYdFTR9kGl8kQMgZxtLJFbp3WgDePJD7Apvsgt4bUzlMt7a8qosbooIGQnsfzQj8LC4sTYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7919
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=680c67ac cx=c_pps a=X8fexuRkk/LHRdmY6WyJkQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=-O3zfcOnp448wJzg2bQA:9 a=QEXdDO2ut3YA:10 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: IfquMXaG7r93VVfnHUmH2d06IxBLgjMC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAzMCBTYWx0ZWRfX7L+LxwYGwjBm qE25pa6A5ke+eo+wt6vIEJe1x3xIQzu+eN2iTt/VQ574LKKmuDBufziwCAr7gP5SDfypLFeMGoz 9BbdOLN0DvqOXNvY4OjBdvV+CeD3+/1zkQFa8GsyZHx/0bu4rO0FFHn0tuR1cSUYldZW54p6INu
 cWL5eJEQhfT54IoeJ5cn3jb4a/q+d7gNjW6Mzl8m00IN4ncSvoJiU8yP8Irk7CNMNjjQXtv5Tew JRjNtFHtw/FeLUvkwNnrU94t9lIqNPFg+t1iw3Ea70bu/xAJ/Ttr3jF+iELcefetHAPmDt2E7/q x0ATgk92ZnlyZnjzfGk/KqRqu3d0egs5/hRhWtMoPw+2pL5OxQYnt2i/qhNZWBraTq4wl+hhA0S
 +h1ibGIePZBP67HAIwjlv4Mn08SzDvktBjYjbzWQtZSSeVtklH+LvpxlfIeeSxAZ8xaCpsP9
X-Proofpoint-GUID: ut3cN1cGelW1TyCxpZXDnfDfCzOCgg0O
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504260030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 04:57:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215512

SGkgUmljaGFyZCwNCg0KU29ycnkgZm9yIGFueSBpbmNvbnZlbmllbmNlLiBJIG5ldmVyIGdvdCB0
aGUgaW5mb3JtYXRpb24gdGhhdCB5b3Ugd2FudCB0byBzZXQgc29tZSBiYXJyaWVyIG9uIHVzaW5n
IHFlbXUgdXNlciBtb2RlLiBJIHRoaW5rIEkgbWlnaHQgaGF2ZSBtaXNzZWQgc29tZSBlbWFpbHMu
DQoNCk5vdyB0aGUgaWRlYSBpcyBjbGVhciB0byBtZS4gSSB3aWxsIGZvbGxvdyBpdC4gSSdsbCBz
ZW5kIG91dCBhIG5ldyBwYXRjaHNldCwgcmVtb3ZpbmcgdGhlIGNsYXNzIGRlcHJlY2F0aW9uIGFu
ZCBhbGwgcmVsYXRlZCBjaGFuZ2VzLiANCg0KUmVnYXJkcywNClFpDQoNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhm
b3VuZGF0aW9uLm9yZz4gDQpTZW50OiBGcmlkYXksIEFwcmlsIDI1LCAyMDI1IDExOjMzIFBNDQpU
bzogQ2hlbiwgUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0ggVjQgNS81
XSBsaWIvY2xhc3Nlcy9yZWNpcGVzOiByZWZhY3RvciBxZW11LmJiY2xhc3MgZnVuY3Rpb25zIGlu
dG8gbGlicmFyeSBmdW5jdGlvbnMNCg0KT24gU3VuLCAyMDI1LTA0LTIwIGF0IDEyOjA1ICswODAw
LCBDaGVuIFFpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiBGcm9tOiBDaGVu
IFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQo+IA0KPiBNb3ZlIHRoZSBmdW5jdGlvbnMgaW4g
cWVtdS5iYmNsYXNzIHRvIG1ldGEvbGliL29lL3FlbXUucHkgYXMgdGhleSBhcmUgDQo+IGdlbmVy
YWxseSB1c2VmdWwuIEFkZCBhIGRlcHJlY2F0aW9uIG5vdGljZSBpbiBxZW11LmJiY2xhc3Mgc28g
dGhhdCB3ZSANCj4gY2FuIHJlbW92ZSBpdCBpbiB0aGUgZnV0dXJlLg0KPiANCj4gVGhlIHJlLWRl
ZmluaXRpb24gb2YgcWVtdV93cmFwcGVyX2NtZGxpbmUgaW4gYWxsYXJjaC5iYmNsYXNzIGlzIA0K
PiByZXBsYWNlZCBieSByZS1kZWZpbml0aW9uIG9mIHRoZSB3cml0ZV9xZW11d3JhcHBlciBmdW5j
dGlvbi4gV2UgbmVlZCANCj4gdG8gZG8gdGhpcyBiZWNhdXNlIHdlIG5lZWQgdG8gaGF2ZSB0aGUg
c2FtZSBzaWduYXR1cmUgYWNyb3NzIGRpZmZlcmVudCANCj4gbWFjaGluZXMgZm9yIHJlY2lwZXMg
aW5oZXJpdGluZyBib3RoIGFsbGFyY2ggYW5kIG1lc29uLg0KPiANCj4gTm90ZSB0aGF0IHdlIGNh
bm5vdCB1c2UgdmFyZGVwc2V4Y2x1ZGUgb24gb2UucWVtdS5xZW11X3h4eCBmdW5jdGlvbnMgDQo+
IGNvbmRpdGlvbmFsbHkgaW4gYWxsYXJjaC5iYmNsYXNzIGJlY2F1c2UgcHl0aG9uIG1vZHVsZSBm
dW5jdGlvbnMgDQo+IGN1cnJlbnRseSBkbyBub3Qgc3VwcG9ydCBwZXItcmVjaXBlIHZhcmRlcHNl
eGNsdWRlIGhhbmRsaW5nLg0KDQpJJ3ZlIGJlZW4gc2xvd2x5IG1lcmdpbmcgaW4gcGllY2VzIG9m
IHRoaXMgc2VyaWVzIGFuZCBpbiBnZW5lcmFsIEknbSBzdXBwb3J0aXZlIG9mIHdoYXQgaXQgaXMg
ZG9pbmcuIEl0IGhhcyBiZWVuIGEgbG9uZyB0ZXJtIGdvYWwgdG8gZ2V0IG1vcmUgb2YgdGhlIHB5
dGhvbiBjb2RlIGludG8gdGhlIHB5dGhvbiBsaWJyYXJ5IGRpcmVjdG9yeSBpbsKgcGFydGljdWxh
ci4NCg0KT25lIHRoaW5nIHRoaXMgcGF0Y2ggZG9lcyB3aGljaCBJIGRvbid0IGxpa2UgaXMgdGhh
dCBpdCBtb3ZlcyBRRU1VX09QVElPTlMgaW50byBiaXRiYWtlLmNvbmYuDQoNCldoZW4gdGhlIG9y
aWdpbmFsIHBhdGNoIHNldCB3YXMgZGlzY3Vzc2VkLCBJIHdhcyB2ZXJ5IGNsZWFyIHRoYXQgSSBk
aWRuJ3QgbGlrZSB1c2VyIG1vZGUgcWVtdSBiZWluZyBhdmFpbGFibGUgZXZlcnl3aGVyZSBieSBk
ZWZhdWx0LiBJIHdhbnRlZCByZWNpcGVzIHRvIGhhdmUgc29tZSBjbGVhciBzaWduIHRoZXkgd2Vy
ZSB1c2luZyB1c2VyIG1vZGUgcWVtdSBhbmQgdGhhdCBpdCBzaG91bGQgYmUgc29tZXRoaW5nIHdl
IHN0cm9uZ2x5IGRpc2NvdXJhZ2UuDQoNCldpdGggdGhpcyBwYXRjaCBhcHBsaWVkLCB0aGVyZSBi
ZWNvbWVzIHplcm8gYmFycmllciB0byB1c2luZyBxZW11IGZyb20gcmVjaXBlcywgaXQgaXMgZWZm
ZWN0aXZlbHkgaGlkZGVuLg0KDQpJJ20gcGFydGljdWxhcmx5IGZydXN0cmF0ZWQgdGhhdCB0aGUg
cGF0Y2ggY29tbWl0IGxvZyBtYWtlcyBubyBtZW50aW9uIG9mIHRoZSBRRU1VX09QVElPTlMgY2hh
bmdlLg0KDQpJJ2QgYXNrIHRoaXMgcGF0Y2ggaXMgc3BsaXQgdXAgZnVydGhlciwgaW50byB0aGUg
ZnVuY3Rpb24gY2hhbmdlIHdpdGggdGhlIFFFTVVfT1BUSU9OUyBwYXJ0IGFuZCB0aGUgY2xhc3Mg
ZGVwcmVjYXRpb24gbGVmdCBvdXQuIFdlIGNhbiB0aGVuIGZ1cnRoZXIgZGlzY3VzcyB0aGF0IHNl
cGFyYXRlbHkuIEFzIHlvdSBtaWdodCBnYXRoZXIsIEknbSBsZXNzIGtlZW4gb24gdGFraW5nIHRo
YXQgYXNwZWN0IG9mIGl0Lg0KDQpJIGRvIHJlYWxpc2Ugd2h5IFdpbmRSaXZlciB3YW50IHRvIGRv
IHRoaXMgYW5kIEkgYmVsaWV2ZSB0aGUgY2hhbmdlcyBhcmUgaGVscGluZyBtYWtlIHdoYXQgeW91
IHdhbnQgdG8gZG8gZWFzaWVyIGJ1dCBJIHN1c3BlY3QgZHJvcHBpbmcgdGhlIHFlbXUgY2xhc3Mg
ZW50aXJlbHkgaXNuJ3QgZ29pbmcgdG8gYmUgc29tZXRoaW5nIHdlIGNhbiBkby4NCg0KQ2hlZXJz
LA0KDQpSaWNoYXJkDQo=

