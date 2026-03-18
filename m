Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB3310854CC
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 02:09:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5231.1773799738064525527
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 19:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Pcslm5ze;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7537156b97=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I0qcRL3277400
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 19:08:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=FL+AypcOGPC5vanaJXJfkPxDAcU0akZZ5LTMiZWjm38=; b=
	Pcslm5zehIc1OmSZ1jJgfWLDLFBCR6xoeF9xQpj4d4p9fwrxfGf8PgInJYjButM/
	RGNR1hWFdZ7S4Eayj0F2jrK1LlWqZ17/FOVC3wjmf9N0lwKa/ObYe7yAj9TYGPBa
	/NnwmUPlNUtoiholqMXJT6+R9AhZR8oGD/ApkUe4oz7xs8wrqTCEmP28XRDjnX/+
	vNBmO29z967jDnfIkHWPS04hpf/4hVzoBEMC0hzERco+LHMKUxHnYiSgJFcsTbAf
	HIPtY/cKCKb33PHuiYM2Ot/PyvLXPEZ9fNxYVF+5BQV1oTDZ2KvQeG9pI1FzDG9L
	t4R8lWoSVWAL7liO3Hb1+A==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012026.outbound.protection.outlook.com [52.101.53.26])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw2y143un-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Mar 2026 19:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eV5f2/9Un/p7xIJbIJ+JewZc8AX+b3Cc2ZsqDGZ77n0/NVHQ3/RD9SPFRmTDwGas54oRBNBTBYsUztEfMkQQmRYuTLZPgNH0ORXaRIu7rkUMddZXjgvejuUVIyrJFI2xauD0cLocExXbokOMfvNSII4cX2ZHbzkbW2mlIQZ2hXJfivKhG/qISQiWFC3QMT2SnCI9EpVjkXk/C6KkorZ4tdMiQ/E/o42KAuHIGQtHDnatg4vJGJARR0tGSYQgwesSLfX+Q/tFSP4yuawMH3yrUXh0eVo+IncYmQj5HgwYk9EqD12oIqISjZdfqZMBziPqv/cTUAF/ytHw7XSk0Uu+Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FL+AypcOGPC5vanaJXJfkPxDAcU0akZZ5LTMiZWjm38=;
 b=TmZE24IvuPY3isMYyJ0dL1wNWPbjlJ69Tz5ZfPd4NIFlREJMHqsYDs4PG+U67VPK7lerZqxPpx0g/dCPvmNqZ4PkfEZKaiT5Yd7D1w7AuLURd///z/KJehUbKNOcekMCNLbM8IMLeg2C1t9dRLNLTNH4fY61fqNGAqZK5leydS811C8grlneMcgr1ZMfK9dkuFhwjm6ZYRm2k1TXIlTQoJxsniokwH4HOZVv29JvF7e9fYRksxLrS98RCHgI2zx2PKWcTFSK7SWUXH+q2aTOCoypltJAuPOSYoR+kkmI/l3T2iWNEovmbhQNJFzD8sVYr1wIGcNOIsa0QxJZZwIRvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN7PR11MB2578.namprd11.prod.outlook.com (2603:10b6:406:b2::24)
 by IA4PR11MB9418.namprd11.prod.outlook.com (2603:10b6:208:56f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Wed, 18 Mar
 2026 02:08:53 +0000
Received: from BN7PR11MB2578.namprd11.prod.outlook.com
 ([fe80::d330:29b0:7235:bd2d]) by BN7PR11MB2578.namprd11.prod.outlook.com
 ([fe80::d330:29b0:7235:bd2d%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 02:08:53 +0000
Message-ID: <5accb641-64f0-458e-9079-e9829e72e77c@windriver.com>
Date: Wed, 18 Mar 2026 10:08:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] lttng-tools: not rrecommend on lttng-modules
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
References: <20260302064010.1421315-1-kai.kang@windriver.com>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <20260302064010.1421315-1-kai.kang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0119.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::18) To BN7PR11MB2578.namprd11.prod.outlook.com
 (2603:10b6:406:b2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR11MB2578:EE_|IA4PR11MB9418:EE_
X-MS-Office365-Filtering-Correlation-Id: 06e39808-f18c-445b-2bec-08de84934df6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|42112799006|366016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	FXdqZzUIV4SEdUtiSW7cGTzlJIIOsPvwqKz7txd5T0P7n+2ps4E4mAA6mkclHPXSVc/MycdQCoT8YzZyjuh4QOXdbhFyVT8tr0N64/ZBJro6x5JKkJ2JYSuieiuQM7Wj4hgpNsAreV0OCWm4Es2pyqDt+63di7LJ060zzq8YjkMIy/SVI3OhvG5/gn9Hb3RlxLycoSKoWtgPDTuu8fLrrAXzsKVZ/qoLCTN+yNsz93KsfoIgjtaXv7d3rQMR/YneugQRYA1UNlO+B0pvPE3p64ogaAXrqdFZ09IA2/aZ1wD2ybwUXP+J+lhfInKgGYefdpVZ2EjlB7qqWcNOLgmtxSnEGUTJBvL9aJmaoQGtp3nIejhZq9QtnAi1r7fk+oE2CGHyOjDXg0cuDKtWSXpjjX1hKfL76I/CaRAXaHQcdBLSjyMc6o4I7iqKEvG95fFezTbaOWem4HB6WOUD1Pguk5cqMT87fOVGJr+s+lDPptTpzvYci7hqcOnBVlwkAgcP4gf2HLGKWcB8zLMrlR8KC4CZSgw1d+mfM0+6zKDU8oUUPuAEMauaLY+3fWqPAkG0B3VVUbFNfrlcneRy0kO+GfkUvzP8cF0f4ln+AghgKBmOoy2lqKXp9amGLMaQ2S9i6D7JL+CowGEGlgtyIojks6Ne2m+dE7PRJ/CWzYx52K3qBugVQdQueu8uw99X8MIT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2578.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(42112799006)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VHpBY0JsQkdwcU05dDlMOWYrQUZUTThBWDhHTGlQL1BQZURITlRVS0hDYUZ4?=
 =?utf-8?B?TmEwK1g2NkdZd056VzZiNTQzd0svQXpmdzExL3FnRG9SeEZtbGdyOVB1aVh4?=
 =?utf-8?B?Z2hZdWxWb1RmR0lJcjVzakh6Ry8yc2pkWCt5aGc5b2dUWUs2d1Z6S3ZxV0xy?=
 =?utf-8?B?enRya0UwMWI0bDhkSGJXYjlkWXY4c2NPUnBLaGVDUDBIZkI1MEV1WUlBK01K?=
 =?utf-8?B?Q3V1MDJQYW1hTzNVSW05NmxGeDV3QlR4L0FFRWZ1dFJ4eU5QZ1J2cjRkSnA2?=
 =?utf-8?B?T0RFaGRvR0tYa2RheG9UaC8zUVhmb0Jya0tEbHZBdWZJNWhuMlVEN3Qrb2p6?=
 =?utf-8?B?NzNIazd5TGtkWitJQTlZWks3MzR1SDk2L2UwS1FiUC8rRW1WT0pacmxBRlN6?=
 =?utf-8?B?ZW5WTW1OL0wrR2FJUHREQ2NaMEE3aXZuaGRsb3p3djl4M0ZSZXh1aDJoTllt?=
 =?utf-8?B?UFpSaHIzV0piNGlqVnR3MG4wMVVBSU5VYVRBQnRzcmppWjA1aFhGRjRNRGdh?=
 =?utf-8?B?RDhDSWk0QnVScDYrV0kzVHBLY01wSTczMWRPdC90QnREYWs5TzRPcWIwakp5?=
 =?utf-8?B?cHdkemtrMmtXcnU4b3Awdy9Gc084dS9XWHM1QkQxZ242Z1VaOVRTcEFYd0Jj?=
 =?utf-8?B?YW16SGM1TGhlL1RrL3NXMzYrRFI5b2NHVy9uYTNZY05SanFtbktLcFFMeHd5?=
 =?utf-8?B?cGZCUUhPKzVBVUtOS3FzRWF4WjFpODI3enNhK0JVNkpBV1hPYU5CNmtGVjMw?=
 =?utf-8?B?RHVySml3VUVOTGhoelR3Wk9MQnU2dm53dXJOQmhGRHU2MVlUcFUxQndGOXE1?=
 =?utf-8?B?dzVhOEZJZm03OEI5dk5talRNVzFSaFNaWkpMRFFLMk8wQzFFeHE5OWlCajcv?=
 =?utf-8?B?R3QvMG91M29zZ01nYWxaWnhZL1FMVXdJRVpJcjAreHFxbkwyZXJVOXVnR2do?=
 =?utf-8?B?aXluU1hsMFpjZ2g0M2dRZi9jL2hoY0lTYVF5S1BsMHlIdmdjb0pWQWpLVGMz?=
 =?utf-8?B?SmdXQjNuUVZ6RHlzTlN1SHJDUUF4am1JVzdPT1l4SnJGYW01c2Rmc080VExI?=
 =?utf-8?B?S3dJR2FheXE5Mm82Z1JEdHJGeHNkYzBkWWJyNmlFQXU2aFAycDRiUjgxVmhL?=
 =?utf-8?B?RkFFU2dVMmZKcUJaNENsZWNqVmZ1Mm5qaVQ2WklnVVlPdnMxZTdldHVuZXRl?=
 =?utf-8?B?eUxlZ3pYTkdjKzR3dmlXakdUZXV0NEVaNHZhS2FQbm55QTMwbWcxWmEwTUtm?=
 =?utf-8?B?L3ZNRklQUVQydXVYVFYzUDlqUk5JY2lqcFk2NUdjalZuYjZQKzJIQXdVVkpH?=
 =?utf-8?B?cDNqN0h6YXFEY3pNRHFkTFlXcEJmVTRuMUcvbzRKMUNuMVU0cXUxNkx2aG9k?=
 =?utf-8?B?ODhYYk5oNnJkYm5lQjBVem8xWlFwemMyNUdXKzB3N1g4Nm9PQnJkWmNjVmdk?=
 =?utf-8?B?Unp0ZkpkSG9xNjFrN04yRk1sMk5TNGFlYXdIVE9Uajg1RW9Fa0tvRjZWZmNw?=
 =?utf-8?B?KzNyRmowbkJyTngzZ0VQS0x3cXhHUWc3UW1WMGtHVmV1SlJFemJ0dXVWK05m?=
 =?utf-8?B?QjdqZE8zZmFERUdOMENpNUxlTk9CbkJ4OWJRN011TkFINE1IdEtXVy9ySytq?=
 =?utf-8?B?Vkdlanp1UzU3MnNjVnpVeGlxeHFTL1AxdWd0dE5lUTRJaFRRVFpxeGFjTmJz?=
 =?utf-8?B?ODd3d01Sc2VXS1FBRXNRWDJNZmViWWtvTWx0VWdxQXMrbkZSRDA2SUI5YTUw?=
 =?utf-8?B?R2k5bTVWbHZZd1MwRjJjS1dxRmJKOGMzRXRMWE1jK0FvWEZrM0NFbjNsQzhB?=
 =?utf-8?B?TXYxRUVVTWxvTDJmWTQwWmJjOTMrd3J2WkdrcmFWVjlTR2Z0aDVVOGhJb0sw?=
 =?utf-8?B?OGZmMXF3UWRKYWJDMXZvWXRrYm5mQmw3ZGtIOEdsck9Ha25Tajc0WEZyQW4z?=
 =?utf-8?B?K3VNenV0Q2FFZGlMbGpIVGFSdGhoU3FjTE1RbnEwL204aFhTMUo5ZnVCWXdH?=
 =?utf-8?B?WHc5SWpBdWRidUZ6UUpiaTlqb0c5UWJQTXRnOHVNclY5cUo4UmNRWGV0WkhQ?=
 =?utf-8?B?MjB5dXd0QWgvYnU1WXlobkErNlJtNitEd2hoR2w5N0VBbk1CQ0QxVWRtQkZj?=
 =?utf-8?B?cE95Vk5zdm1rMGtGOGlyS09WdTdzcUJ4Q3Q2TENtUWR4K3dXZzRUelBzamwv?=
 =?utf-8?B?a2FuODNpMzJ6YUF2amtOWkV4WlpUeEd2M2VTRllnWjZJRXFCcm9WVXgwWXZq?=
 =?utf-8?B?cE5lRVQvL1ZTYU1rL0tzdGpMYW4wa05TWXdkVUgrbHVQUW5KeFN3WG5qd3Iw?=
 =?utf-8?B?U003UmNrcUN3VERWU1hXUExLdFFQaUsrM25aQzgvRjdtenJJdHVBZz09?=
X-Exchange-RoutingPolicyChecked: 
	feIc0+9o55dndnVVqqq8MhOzgSctzGZwLSisDe2zpWo6huZ8pwKvKTNgQJO1LUBMphj1fH3Xjxyn+Pb4iN7FPG5mmpEpxzbQBiJAu89hfnEglQR9t9yDoOAzoBIyDh9tJCFLyHOQctlg8SUEGP9jmBPXMd0O8s39FVrDuVeBlkmCujemuqo2JriBVO6WMKPxPu4xvNIkco3eD6tVCCfHGKK6YmwycRDevReeGCod5/rVytXldtdRUeDk4cenJ8K4YokxgRFBgQbPy88kevDW3zQKP7PizDOA5X/ybkLvjjYpp8XVDywag+HlDl0i/yE9KNhSOmtP3GNai26YmhX1QA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e39808-f18c-445b-2bec-08de84934df6
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2578.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 02:08:53.8769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6wDKsxj1/YALXC45/0OYRVamzikAF76/HS2e2IryWJuNVYZ5S7D6eO01JAfEh3LPWXaL3ybxU2rsWBy4zFKNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9418
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=CekFJbrl c=1 sm=1 tr=0 ts=69ba0939 cx=c_pps
 a=Rzgcbe2yxP2fEJMfMKkCcw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=a5LkSv8FAAAA:8 a=3WQPG5ikAAAA:8 a=xNf9USuDAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=ZHKvrY9qQF0uwZketXwA:9 a=QEXdDO2ut3YA:10
 a=E2cWBXyb0kjxxB1PlMdk:22 a=zBohcZEwHkW0jPBbCVRQ:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAxNiBTYWx0ZWRfX/nTbXPb/DPzC
 dGsZzI5iU8BQHYvDwSoFoD2h/wj1SRtVd2P+wCs6InnRwn+SE+c/w+IMl8CrJQig/VjzL1mOsH/
 kr2O010IXcbi//5QKPm0tFSAbcgpNcVcfNQgL1eNZ/2efopwxfJy3E+RUagb9OvYDqEfiUaw1dn
 B3INg4atk9RZ8eQsUHG5FrvqJTbMfWdfHD92Xuo/efqXXCSqRkZAaqELDVisa/tU5+xbxIiesgt
 rUp49+CbMa08WATIvJCU8/i/kpmq1hbuTphVTCB2CaNPhXnYIgU3n75P6YvV44gL02klx/y7cnj
 m16ijM+DEAe+iUxRVWXL6YrPoVvHo/ZzHkF+i8m5RakMZsQnwvZT6y5pVxTGeeysnqp5+nAPPlv
 CMmTTKnFx33v3le8JuxKt7gqsxLO5zRiL/wL6Rv1VNPyWPSxqplgxgsM4nHjxOGv/k4xkoZYEkb
 plromtwywzMJs8Gm/7w==
X-Proofpoint-GUID: D938FFzOvPxXQl84eUU4_xRUfDrlDjvU
X-Proofpoint-ORIG-GUID: vVR6pt_ouBG-bKkBNumBurE4nV1W-cXF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 02:09:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233354

On 3/2/26 14:40, Kai Kang via lists.openembedded.org wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> As in the lttng manual [1]:
>
>    Most distributions mark the LTTng-modules and LTTng-UST packages as
>    optional when installing LTTng-tools (which is always required). In
>    the following sections, we always provide the steps to install all
>    three, but note that:
>
>    * You only need to install LTTng-modules if you intend to use the
>      Linux kernel LTTng tracer.
>    * You only need to install LTTng-UST if you intend to use the user
>      space LTTng tracer.
>
> there should be no force dependency between lttng-tools and
> lttng-modules. When set lttng-modules in RRECOMMENDS, it always forces
> to build lttng-modules whether it is required or not.
>
> Compare to rpm spec [2] and debian conf [3], there are no any dependency
> between them too.
>
> So remove the RRECOMMENDS setting.

Hi,

The commit had been staged in master-next for a while. But why removed 
eventually? Is there a plan to add it back?

Thanks,
Kai

>
> [1]: https://lttng.org/docs/v2.14/#doc-installing-lttng
> [2]: https://rpmfind.net/linux/RPM/fedora/updates/testing/43/aarch64/Packages/l/lttng-tools-2.14.0-4.fc43.aarch64.html
> [3]: https://packages.debian.org/trixie/lttng-tools
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
> index 620ddfb1cf..3a3f2cff2c 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
> @@ -14,7 +14,6 @@ include lttng-platforms.inc
>   
>   DEPENDS = "liburcu popt libxml2 util-linux bison-native babeltrace2"
>   RDEPENDS:${PN} = "libgcc"
> -RRECOMMENDS:${PN} += "${LTTNGMODULES}"
>   RDEPENDS:${PN}-ptest += "make perl bash gawk procps perl-module-overloading coreutils util-linux kmod ${LTTNGMODULES} sed python3-core grep binutils python3-multiprocessing"
>   RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils"
>   RDEPENDS:${PN}-ptest:append:libc-musl = " musl-utils"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232171): https://lists.openembedded.org/g/openembedded-core/message/232171
> Mute This Topic: https://lists.openembedded.org/mt/118089750/3616933
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kai.kang@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Kai Kang
Wind River Linux


