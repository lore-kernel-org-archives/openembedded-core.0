Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4064FC282D1
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 03:30:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.45311.1740972617973091263
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Mar 2025 19:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51571b8f6e=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5233K3I1021733
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Mar 2025 03:30:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 453s789pbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 03:30:16 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5233UG0N004754;
	Mon, 3 Mar 2025 03:30:16 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 453s789pbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 03:30:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2abBjd7M70v+yGdxXcHsVONG23VbZlAOr31G5aV2t2vN3kYcwDnTuCSQj/rEFURPVXCsmiDYHky7IRo4zuPDCZhPNZRKB5gOw6Ho8oiZLLFT7zHK3enbqG4Gp7oJcMtShm/Rv4BqYmeYlBSf5kF1O7ltK0ZYZxD5ZTUjO+n+6BIg0xjEu0FJfxaF1KKbwyLlmT0L1Km2ifaaADPfI/SkAZNpqz+S6aRDSJOmF7kFSgIgCZSsWjcpcwDjWgPOeety1cHwmrEuAhOqSt09NeYuPgaRPNYmL4//yzZchmcALjtktnY86eENwkMC+OAXnboBXWBNIni2gblDLal6ujl0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXSNrjr/C4J40T/ubYQzi2SfwVbJL8ypoD+L4HzVYvA=;
 b=K/XSiLb2+KZPpJQ8NT9du3nLa9OIcjDmZcBlaBdMnSG4OXfEi8zkog6kNkKb4V/qNb+YyZwe4PbacqS0JPQWGHLOJb8ZYFeDe1pVrM+1SV2D9OOhhKYr3Q7/pEStB7suBwaI/noxXLg4kSz9Yc9EHye1Yl01FK0q5bKWeNaEGeOsGs9SsfCtl3mw4LfEejrF7cunTILmOIkU+a90hcHaTmDPcUo6eGS3GoyiZZNbfHoG/th1JAZOB8dJnrKc5MhRCLuaGO+6eOgRokCzirABB8TDWE9eRd+I+51l0T+rmQBtriLJGiqbM2PuXH30GigfnPIRU76mGyHxsXR+v+KgYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM4PR11MB7277.namprd11.prod.outlook.com (2603:10b6:8:10b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 03:30:12 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 03:30:12 +0000
Content-Type: multipart/alternative;
 boundary="------------wvkEsBQiEdEzGUe0y0lS9eUE"
Message-ID: <f0a8eefe-cd8f-4585-b032-395f3cfe63b3@windriver.com>
Date: Mon, 3 Mar 2025 11:30:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] Revert "python3-ctypes: depend on ldconfig only
 if distro-feature set"
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20250220035724.1460062-1-changqing.li@windriver.com>
 <nvmjowjub7hxr4wz4njvcwdi5mo2g4ppiixrsdgr5zrqs3dwch@mrwc5mgkqid4>
 <23e2fa72-4225-4dfd-8d5b-cd8afe03b411@windriver.com>
 <sozxs6figgef2mhn3bkcr2z7vy3u3idrrq4gkgzmxbibiiih4t@aoqiqffittgi>
 <d20d233c-08c0-490b-927a-fbfc6d4d2383@windriver.com>
 <vzy63llcnvkkp3tdkfj3eowkphcww7bi6ha4jfljw7pfskezw7@r27s535jwhl7>
 <48f11c6288db844ec985daf20f34e92974519e82.camel@linuxfoundation.org>
 <m4tm2mjs6iachotge62hejkid5f3s3lrent32i4gwhruzpahqr@42nnjjo6ag2k>
 <6f23591757291b5bdeea36d6bf630c121e188db3.camel@linuxfoundation.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <6f23591757291b5bdeea36d6bf630c121e188db3.camel@linuxfoundation.org>
X-ClientProxiedBy: SG2PR06CA0227.apcprd06.prod.outlook.com
 (2603:1096:4:68::35) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM4PR11MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf85569-e19b-4bcb-d5e2-08dd5a03b4ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UGpXa1JNSjhZb3FjMXFUZ1BrZjJxcCthS0IxbkFhcUkyeGhJaitQVjBFSU9J?=
 =?utf-8?B?Q0ZCbFJvRmttVUxVS0Y1VWhJV0piSUlFUndIRVhmemFqaFByY1FJN0wxb1dB?=
 =?utf-8?B?YURmSHdUMU5UTXJtb3ZPWDQ3VHZkRnUwbm16YjI2T2FpY3dUZnRUSStUNEs4?=
 =?utf-8?B?TFJWQWZYU2VnUk41UDdmVHRwMi9IdVBPQmJqMEJ0Z1U5NnhydDNTb3JyaDVw?=
 =?utf-8?B?blRoOFdyUEdJdWRTdDFBWERkakhLSG43UzUrN3g4dkxMV0g0ZklSMVZLT3NN?=
 =?utf-8?B?WWxVRnFjREN4c2xzeWl6R1cwRmF3L05sZ25MampvaGp1ZjV0eHNFYnR1YVRy?=
 =?utf-8?B?MEsra0VDajFudVFIN0dNdE4rbHFCdFV6QzJMQk9kSCtoSnRPVU9CbTMzU2RR?=
 =?utf-8?B?U241ckNzUWIvdlFVcS9nRXJIS240Vm1GNnpVOVZvUEpCNEcxaHpPSWFCNW1V?=
 =?utf-8?B?WENESWNkbkpMZUVDVEFLZ1pLTlM2MDVCMmh6czZlRzAzVVpHb3p1TEF4NXdH?=
 =?utf-8?B?a3VhbENxZXV4RXJSSlBFRFIzYkRsSE56b0x3T3cxc1Uwd1BXUHlxbEJrVU5h?=
 =?utf-8?B?SXQxeitybUg3WGdqYk53RWtRcnFTcy95R01KZ1BKQmhYa0RHSjI2MzZmUmI2?=
 =?utf-8?B?NzV3U29VM3NQbnQrUFc3SEw0ZE1VL2lqd3oyZVgzaXMvby84UHEzMnRIcW9h?=
 =?utf-8?B?TjRmUERWaEdIQXpGU3AySXk3cnRZcEIycEVPbm9EQlJYS3JqZW9sZ3BmRXFO?=
 =?utf-8?B?QkxJOS9YUnBLcG55TnBNQzRxOGdjQXoxUW1yZGpodU1iWTdVbHpSWitPM29t?=
 =?utf-8?B?THVVOURISkdrVFU4K1haVGQ2Vi9nWVJwVkZDMG1DUlR0d0dodEUwajQvTGVI?=
 =?utf-8?B?M0FuNTB2eTloQ081aUxyK05qM0c1UEN3U0JvaTJvSHRmQ1NtWm53V293dXVB?=
 =?utf-8?B?VVB6a052MXJrMndOOVlOWU1wdXhqY1JqaEhBOVFsa203WXBSRE42NjU3Q0o5?=
 =?utf-8?B?RFRvaVJXYUpObnNqMC9DQ1Y4NEFKQlBVNkdpbUJYZ0tQNWYyWkhvbGZ3TnpI?=
 =?utf-8?B?Y3hVMVpUUE9LQ1c1dHp0djVDdFZuOHc3MTMwU2NNVi9lWlpkYWRjUG1NR1I4?=
 =?utf-8?B?anNDbXRIWmI0QlRyRUx0b0hIaUhPMFE3bGNBdTIrWnBDS3JWYnAzTnBZVlJG?=
 =?utf-8?B?aVc2Ym1xb2xhZzZva0lMQlg3eVhGS2VwMzArdG14aFFGSTVPMFhOaXc4TVZx?=
 =?utf-8?B?SDB1bm9mYlVqSjZ6Q3J4WnpHcDV6YzdNVE4xWmduenJrMTVMNHhRNDBzU0Ja?=
 =?utf-8?B?aXcvT0RHcGxZalBHNXdVblEyM3UvRVpBVnZZVHYxL0pDNFVsckhyaW9Eakwr?=
 =?utf-8?B?RzNoVHRxY20vZi9acXFyRk1OVkMvbWRMWlRDeGlYeDJUVFlmNEpmVXVZNHRa?=
 =?utf-8?B?YmtjT3BqSHY4VGZpYm9wVU1mVEtEL3IzV2ViS05YVTh3Y3IwN2Y4dzBGM2dq?=
 =?utf-8?B?cHo4VkY3NHRVb2JJNFVPa21qVWRYSXNLU2RPeXRpMVRRTWxSVDhlRUpSRW5z?=
 =?utf-8?B?TVdROWExa3FZb29Td1Qzelk3aXhBeTUyRmJwQTBQWVFhMXhRTmZzeVpGMDNt?=
 =?utf-8?B?WHF1b3JBbDhORmFvNy9uV1gxMjVERVYyMmpsTkwzQlV4NnlxRE1Qa1VYUmZE?=
 =?utf-8?B?b2lISnpQL0hKQ3UralpsLzd2UldMVEZ0SURZWHdvOUlJZEtNN2xTVGQ2dGJr?=
 =?utf-8?B?ejNMU2hyOER4ekNST3k1T0RzVmFhblQ2MnloTDhvd2ZtMjNDbHZRZHlmZDZk?=
 =?utf-8?B?R2tlTE1PTDM3YVNwQXpudz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S0NHRURzWUJWTklobHFYZm81RDNMNVhnbGkzNFFuR0Zyb1pFd0ZZZGg2YWpr?=
 =?utf-8?B?aXhZcHZTc2NqS3duSDFEaktUTGhNeG5RL1JZc1k4d2YwMXo1MXZuMHJDNWVt?=
 =?utf-8?B?TmVrWGFXSzdsWXRud0xrKzREbDNIMXJZeHM0WDNpMUlPLzN5VytSK3NYQTRX?=
 =?utf-8?B?YlIxRmR5NlE3Ym9aY3JoQnNEWlFWcWVVOUlpalpZWm10STJDZWtwV3VSbVFo?=
 =?utf-8?B?elA4UTA5TnpteWN1anBjT0FsMGJUeUxlKzZONkp0dHJPbG5MajV6eFphQkRT?=
 =?utf-8?B?R3E4VTZzUStxbC9FcklsMFJURjhmcEhLamhwdUptTE9jMElBdUVUUllrRWsw?=
 =?utf-8?B?cHA2V1VWYkgrdnRJTDNXTTJKNDFZUHRFaTlaM0NnRjFDbFk0WHVybmJvVVA1?=
 =?utf-8?B?eU40M2paL0xISVNHeU5vb3lQZEl2NnR5WWYvcm9aVElYRG5jTFpiL05BWVFD?=
 =?utf-8?B?d3RGWEtJbi9SUHdweW9sU3E4UUVKNE9LS2NTejQ2b3Bua2VGVDl4SWJMaXg0?=
 =?utf-8?B?Y0VDR2QvSTZaa0kwREV6eklNMlVGMm5HSEt3SzVyS3VUcnl0dDR4dVlKU3Fx?=
 =?utf-8?B?RFJvR3FvNUM5ejFIT0lmdm15eFZhT0JOTFUvOTB2WWNGbDlVVzVjYkdlMTFl?=
 =?utf-8?B?Q1RUOGRFUmE2S0h4SDhQdUpkdDloZVlXME9JQ2gyRFFlbk5YK0ErbVdDUDJL?=
 =?utf-8?B?L2ZlRnpFSlRHQ3g3VDI1NHlWeXVrUGRudFZTSzRXZ1k5RWw4dGlzZW1ySUdx?=
 =?utf-8?B?ZXZ1S0ZBbTVMRDVuNWIrczRYS0JNT3hVNHp0MS9adGZRRCtQcFljZUw4MlZN?=
 =?utf-8?B?ejRudkNOY0hyRkFCKzFXSG1ndFpEaWtxT3pBdG5FWjNsSldJbEV6NzBzWmdH?=
 =?utf-8?B?NHJsQzkyOGZzSXV3NjhmM09LNGg3aE9RcUtFZHc3YWVleWdiTlc5ZlVGdnl6?=
 =?utf-8?B?UEhDNFdJdUNqSG5FdzVQNWxielhQYzhsL1o2dldpRE9SUHgvNDJ6dUJqS0Zl?=
 =?utf-8?B?dlhzVUtUVXZIcUV4VWdoTzlXT1ZkOFdLV3BmeUJGTWd2OUhPOWxockZlUEpq?=
 =?utf-8?B?dFVaTm9KLyt5SmtsMEtoaUF0U21HMHluNTc4Z1loa0ZTQVZQYlMzTHpYVktO?=
 =?utf-8?B?ejBYMWN6aEtYcHRQczNOaDRzVFQrbFRjVEFBMjJ2RHFWQVBTalEwT2NhRlRL?=
 =?utf-8?B?UVd3Ry9KTW95YWpMaEh1YmlMUWZ3TFNWdmpBNVJmM2p2SzhCRW1MdlVHZEpn?=
 =?utf-8?B?VGgwSUVYZnhJMXlTbzlmRXBYY1V5N1R1QzhRT3pnR2lMQWphRWJ3QW5jYWNV?=
 =?utf-8?B?UllnLzNwRkJzYisydTNxU3pLcE9wQlhwQ1VvZk5aMHdsc2ZCVG0zSTRaZG4x?=
 =?utf-8?B?VXNCNEoydngwNFhCbFY3RHFiTXZuUWRobzU0b3BwK3Vrd2NNZVA1T2VQQ01C?=
 =?utf-8?B?TWJRMkNxYTc4TFRtZlhOMVRlYUhObkhSWU5XdU55Y2tndEd2OWx3U09kYWE0?=
 =?utf-8?B?QkNaNFlCR1lrSk50OThuZzZNd0Jlc3hmeEVXa00rZXpTQ280bmJPRWE3Mk9z?=
 =?utf-8?B?TXdGV2VXVWp6b2JqbUxRM1Y0b2RpRHA4SWF6ZkNLV3hBc01pVnluL0dvM05E?=
 =?utf-8?B?anhLYjhMbjZCVThtcGlBYVljTUxFSS96bTlsK01iU1AzeE92UkR0bDFDRW52?=
 =?utf-8?B?V3dHSDgxR2FIaGdBWDNKRmZHcy9NV1EyMTZhQmd0MG50SWZhTUpoU2hlTnRr?=
 =?utf-8?B?WElINkZUYkdYekVQNlVUbUFCVS9nbUp2OFRvOVAvYlhQV1U4Y2k0MHdDT1Yx?=
 =?utf-8?B?bE13SS9oSFJIYjN6TG50WDlpalBGWFlHQUNsTlJtOTF3L285a0o1Nk93c0U3?=
 =?utf-8?B?TGxqL0VJUlMwNkZaT29MVnBsTjdDZkE2R2hxcjFlT1ZidVJWVW5McEJPc2Iv?=
 =?utf-8?B?YUk5elRrdzZHNmROK0FJbjZ3NFI5a3ZXa2RNTHJrdXRQUzlvZFFHNzYwUWoz?=
 =?utf-8?B?YjhWR21FdVVkVVc2TGhRRnFxU2hpOFprZlpZUjhkOWM1eXNHd1RuQXRUdTdp?=
 =?utf-8?B?amxPQjA3KzJ2YkJCRjM2V01QVU1XNmNvYlJmTU9ibjM3RThBSE5HT1NEMmpo?=
 =?utf-8?B?bGQwUUMxbGJPY01mUFpVdUlNY3V0cFg1dVRpZEtYbXUxVWFCT3dKWVAvUlpM?=
 =?utf-8?B?UkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf85569-e19b-4bcb-d5e2-08dd5a03b4ad
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 03:30:12.0737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2tQbLAeQxMrG2CqSBkN8weGYybxqHuihW38ZlbGZAFVnanOWm+ox0Ex5Pyfts/78kbhF2Gi36U/v3Wj+mxHGteSlzUJBU/3YojAQdEhcgZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7277
X-Proofpoint-GUID: FgYpA0SBGlA5DaPBd1TepdJmptEdZwOZ
X-Proofpoint-ORIG-GUID: 0YfPG9zFXXmmf_usbC3FXN-8qVZcbNR3
X-Authority-Analysis: v=2.4 cv=cfwormDM c=1 sm=1 tr=0 ts=67c52248 cx=c_pps a=ybfeQeV9t1qutTZukg5VSg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=iGHA9ds3AAAA:8 a=2FF6I7tUA1trs_LCtvwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=XcwGy2eOlZMA:10 a=ag1SF4gXAAAA:8 a=yj-aMKAYKbz0kkd27lYA:9 a=ClhENxtobuE9C4zE:21 a=_W_S_7VecoQA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_01,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503030025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 03:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212196

--------------wvkEsBQiEdEzGUe0y0lS9eUE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5233K3I1021733


On 2/28/25 18:50, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, 2025-02-28 at 11:35 +0100, J=C3=B6rg Sommer wrote:
>> Richard Purdie schrieb am Fr 28. Feb, 10:20 (+0000):
>>> DISTRO_FEATURES are high level policy controls, not "this should be
>>> included or excluded" controls. For example "pam" controls whether th=
e
>>> access control modules are configured/used, not whether libpam is or =
is
>>> not included.
>> But it controls if other packages (e.g. systemd) enable pam support or=
 not.
>> The same goes with ldconfig: Should ldconfig support in the packages b=
e
>> enabled (which would pull-in ldconfig as dependency).
>>
>>> For ldconfig, as I remember, the distro config was about whether to
>>> include "ldconfig" calls after installing libraries and whether to us=
e the
>>> ld cache.
>> If the feature is only about enabling code in the postinst script, tha=
n we
>> should find a better description of the feature
> I think the description needs improving and I think we'd take patches
> to do that.
>
>>> ldconfig: Include support for ldconfig and ld.so.conf on the target.
>> https://docs.yoctoproject.org/ref-manual/features.html
>>
>>> Packages being installed or not is an image level decision, not distr=
o
>>> level.
>> Yes, that's also my understanding. But enabling some features (e.g. x1=
1
>> support) leads to recipes set DEPENDS on libs and this leads to the
>> installation of some packages. So DISTRO_FEATURES influence indirectly=
 what
>> gets into the image.
> The key word is indirectly. Where things have a hard dependency on
> something, they do include that dependency and it isn't conditional on
> a distro feature.
>
> In this case, the usage is tangential to what the DISTRO_FEATURE was
> designed for (ld cache). I do agree ldconfig is optional so RRECOMMENDS
> seems better than a hard RDEPENDS though.

I will send a patch to update RDEPENDS -> RRECOMMENDS

Thanks

Changqing

>
>>> In this case, perhaps we should drop the RDEPENDS to a RRECOMMENDS?
>> This would be helpful to remove ldconfig, if django is installed.
>>
>> But the main question is still open: Why should I want ldconfig and re=
move
>> it from DISTRO_FEATURES? What is this use case?
> It is being used to control whether the ld cache is being used or not.
> That has to be done at a distro wide policy level. Whether ldconfig
> makes it into the image or not is an indirect effect.
>
> We can control the inclusion of ldconfig for ctypes at a package/image
> level, it isn't a distro config level issue.
>
> Cheers,
>
> Richard
>
>
--------------wvkEsBQiEdEzGUe0y0lS9eUE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5233K3I1021733

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2/28/25 18:50, Richard Purdie wrote=
:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:6f23591757291b5bdeea36d6bf630c1=
21e188db3.camel@linuxfoundation.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Fri, 2025-02-28 at 11:35 +0100, J=C3=B6rg Sommer wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Richard Purdie schrieb am =
Fr 28. Feb, 10:20 (+0000):
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">DISTRO_FEATURES are high=
 level policy controls, not &quot;this should be
included or excluded&quot; controls. For example &quot;pam&quot; controls=
 whether the
access control modules are configured/used, not whether libpam is or is
not included.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
But it controls if other packages (e.g. systemd) enable pam support or no=
t.
The same goes with ldconfig: Should ldconfig support in the packages be
enabled (which would pull-in ldconfig as dependency).

</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">For ldconfig, as I remem=
ber, the distro config was about whether to
include &quot;ldconfig&quot; calls after installing libraries and whether=
 to use the
ld cache.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
If the feature is only about enabling code in the postinst script, than w=
e
should find a better description of the feature
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I think the description needs improving and I think we'd take patches
to do that.

</pre>
      <blockquote type=3D"cite">
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">ldconfig: Include suppor=
t for ldconfig and ld.so.conf on the target.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
<a class=3D"moz-txt-link-freetext" href=3D"https://docs.yoctoproject.org/=
ref-manual/features.html">https://docs.yoctoproject.org/ref-manual/featur=
es.html</a>

</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">Packages being installed=
 or not is an image level decision, not distro
level.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
Yes, that's also my understanding. But enabling some features (e.g. x11
support) leads to recipes set DEPENDS on libs and this leads to the
installation of some packages. So DISTRO_FEATURES influence indirectly wh=
at
gets into the image.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
The key word is indirectly. Where things have a hard dependency on
something, they do include that dependency and it isn't conditional on
a distro feature.

In this case, the usage is tangential to what the DISTRO_FEATURE was
designed for (ld cache). I do agree ldconfig is optional so RRECOMMENDS
seems better than a hard RDEPENDS though.</pre>
    </blockquote>
    <p>I will send a patch to update <span style=3D"white-space: pre-wrap=
">RDEPENDS -&gt; </span><span style=3D"white-space: pre-wrap">RRECOMMENDS=
</span></p>
    <p><span style=3D"white-space: pre-wrap">Thanks</span></p>
    <p><span style=3D"white-space: pre-wrap">Changqing
</span></p>
    <blockquote type=3D"cite" cite=3D"mid:6f23591757291b5bdeea36d6bf630c1=
21e188db3.camel@linuxfoundation.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">In this case, perhaps we=
 should drop the RDEPENDS to a RRECOMMENDS?
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
This would be helpful to remove ldconfig, if django is installed.

But the main question is still open: Why should I want ldconfig and remov=
e
it from DISTRO_FEATURES? What is this use case?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
It is being used to control whether the ld cache is being used or not.
That has to be done at a distro wide policy level. Whether ldconfig
makes it into the image or not is an indirect effect.

We can control the inclusion of ldconfig for ctypes at a package/image
level, it isn't a distro config level issue.

Cheers,

Richard


</pre>
    </blockquote>
  </body>
</html>

--------------wvkEsBQiEdEzGUe0y0lS9eUE--

