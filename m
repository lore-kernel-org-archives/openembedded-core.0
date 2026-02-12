Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECF8EE3695
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 16:34:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49337.1770914063683835642
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 08:34:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=elUtAaWs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6503590ce3=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDKUVp3017429
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 16:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=fHI03WiIJ9SFrhAPt/yv3Ya11kPI9GoTrC9JHsdIaIc=; b=
	elUtAaWsAH4k7sjivY+lBuGE3jKQ7Pq4vDPISiDxgUJNsF37Z0fVzUuVyfB+RhPE
	nD/5TGlG/VHi8yMkXcROmkmW4C7fVQ0bX1ieMrqWVqR3SANKKNvmbX2RPO9hNYqg
	oWErbbpQKk2ftYmmRBsddkyzqNZP85fNp7ZV+5ugsy2eOczHQ3DbqEWJaSIbtBjt
	Oz+otdPXcl1UQP5U+OSZ1Y+hxMJeiNQg41nz6fMEiP287pjbdh5uYDUrWo6y3rX3
	r+2BfuwbSSkhVJWbu67eQEK6Xg/JMf2U3hGdUqkuViVDefqjrBeAB6vGPZrsxn4h
	xeJ07C+kfh2spit0prVmhw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012053.outbound.protection.outlook.com [52.101.53.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5tkwpd9h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 16:34:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xM8A1eJ6A9tml2fYYJ5HX8ZLlWsacz2dEec9Lld5+nCvvvFdSIzPB+4Od2dvj9sGEYsj6cmk8ZeiIltBb22KT5U9iEog6YbejBUa3fhS8pfQeavtW9jjtVM22IWV82Q1YcdvAiAIsNju0+WYDP43spEAFLCCG4yju0+gTYG5oF5RAPJO5fAGWPy0a6SThCUt9rc2G5j5fPffmeeAnL2i5uCKnimwA08QRqrs9S2V/EVRmiKymLkUfAI0YrpjFpZ9Qpuk+BAnyTyGUbDaRxyldY4v9pq3QCE1lHknJ5qrb+3a6GGp4cULJiKkoGyCFW468xnlVg46aV+outT7IPyRig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHI03WiIJ9SFrhAPt/yv3Ya11kPI9GoTrC9JHsdIaIc=;
 b=kgt1HLUbGNvesA+T6zi+wqfCWD93CkcE+9zeaKdi8bb4Hvm9vZuSsC9HLris5cjYnGpG4GCkKLrQkuKDQHDXlMlxoiD6rLs2onaBLgEg0dPDlyenmhY6tvP1MKtw8pIb9OWqk06f+25cONmSr92BkcMwssK+4Ufqcn9BXr6RXGlhianKLbV9MRnQxjt3Pic+qvA6ypXXKYK5zUJbmJE+8FjMoEKOpiU3dAVjz3NQEKkXZfc3+TPWy/cVhJCaUQStYX5+5ZfM4g41kI4eoUI4+Ym59YNsPl6Gl+qNAASGy2PJkIkKtM51a9uLjRIpY7MzWiuCJE24vvmayz6Me5knAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by CH0PR11MB5281.namprd11.prod.outlook.com (2603:10b6:610:bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 12 Feb
 2026 16:34:18 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 16:34:17 +0000
Message-ID: <8c07bed6-0dca-47bd-a1c6-176bfb1031f3@windriver.com>
Date: Thu, 12 Feb 2026 22:04:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/4] Oe-selftest for Clang, LLVM, LLD
To: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
        paul@pbarker.dev
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20260203140337.1971735-1-Deepesh.Varatharajan@windriver.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <20260203140337.1971735-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0102.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::6) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|CH0PR11MB5281:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c3ca2cb-e1c9-4a52-2590-08de6a54907d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TnFLRzBGMVZFMzkrUURDVE5FdUtETG16NytqZ0pUZndlWVk5clhnVFFmajYy?=
 =?utf-8?B?eVJDbzExUUFUUk9LVkpqOEtMZWY2aGdWMjZ6MjNZTGNETHBRdXl1SVNGbFZJ?=
 =?utf-8?B?RFdRc3MydG9yZy9pdDZFWUdNTENRd3dKZWxVdVN0a3d6VVFCb0J0WnBBK2M0?=
 =?utf-8?B?NnVsOGMvd2JmL29vK0ZKOHhXZTR6YjZ1VmorNDFRbUpVOFFQekpDTlc3WXdh?=
 =?utf-8?B?eTJsZGk2eVJ4NTRaRndaaGllRlZBWk9sY1IyWksyLy9ud2R1aXZpZFZWZHBM?=
 =?utf-8?B?VEtyWVJoOTJBUXlBWHd1M1IvczdwN0RNZFFBK2Q3aXlOZVNZRTFyNGJxOWxo?=
 =?utf-8?B?Z0V4czllKzlmbWRtU2MwRUJweXh3RjJyR0QwcGpaWXhyZFhoZTJwN3hPM2th?=
 =?utf-8?B?Rnlwemp1ZFNlNG1uVkQvMTU4djRTNlA5ZXZuTUh1SmlvMnQzQXlnbVVUVnh2?=
 =?utf-8?B?OGVqNUhOUVZIWThuNEZTK0RDUzR6TGpBMnUzVFhZd2QxRjZOaEVySUUrR1RE?=
 =?utf-8?B?b2lyTlh4Y3Y3b3dkcnZsbWxpMlRvTmRsRUVza1ZkcncwOGhtVDlwdE8xVS9J?=
 =?utf-8?B?ZnpWU1Z6bDBOTFJPQWpWV3VMbllXWWpKZ1NqR2VDcHUzYjZlak1FL0Q3NERW?=
 =?utf-8?B?ZElXL0hvcVBQZzBrQVFQVzZJdDk3L2pGUmNXMSs4Qm90TGkxbmZYRzFMSSsr?=
 =?utf-8?B?dmprL2hRbk9PS1ZmMDZ6dEIvQlRHajB4Wm41R3FEL1N2dTdKdXBPVDN6OXAr?=
 =?utf-8?B?U0JjaEgxY3dCRE1GQ0xCWnVNcG1ZK3hJQU9pd3NNWG1oOEQ0Wm1EeWhaNmtH?=
 =?utf-8?B?blN0RTQ2WnRMelplQTMxcTdhK215emppbkJpenpLU25lOVE2dWVpSzUvaDhL?=
 =?utf-8?B?R1dGWnBTNUtDNDI5UElXY1c4MkZtbDdWR09ud2p2UTBhc3k1WUZqSmluUVZF?=
 =?utf-8?B?aW1zblIvNnc0aVY4VU9HU2RUd3E4TnhGUmRyMmJHLzNFc0prOFNnUVh0L3J3?=
 =?utf-8?B?VHEvWmNSaGZtNzltVTZLSUV3TXRoK29uVUtxc21zTytEdSs5L2NBVjN4QS8w?=
 =?utf-8?B?M3F2cFhvTE9PNFQ3bENvbXFVaHlibzJySkMwc05TMlZsYVBDWHQ4M0VTbjVY?=
 =?utf-8?B?M01oMGlPa2R3cDNaK0cvaGE2Mzk4eitPTENjWlhySS9WalF5MDNZRFZFYzdO?=
 =?utf-8?B?SUV0U2ZWRjhiKy9rSTIybEc0SHQ5Q0FQNkJCejh2N2t4L2xJOUF3VGRjcDZH?=
 =?utf-8?B?bDI3Rm5rSXJoaTJOeDRNcVpyK1lETGd1ZDlGc3JOeitOc2F2d1ExcVNnREIr?=
 =?utf-8?B?OVpURHFxY0Q5YWNpb0wxYkRwdS9SamhuZXgyMXcwdzBuZy9iNEhrSGNhK0FM?=
 =?utf-8?B?cWY2aUdIaGMxSUcva0pmY1g0ZlJlY2s4WndubXRPUEpmSDltM3RRR2tVMUtm?=
 =?utf-8?B?R2I1MFlBaFpSK1M4c1laWTAvbmdFcEIremppZjJWK1I3T3hlcnpvSHUwNC9Z?=
 =?utf-8?B?MnBjSlRXcTdISjdhc0NTVG14QlJ4QUNaN2dMN0FobldURit1amRiUjRFcENo?=
 =?utf-8?B?TkE5U1N2UGFQaVMwVnpaQnMwMVVid1NVL0I5bmErK1JaalZSMFh0eUw0dEdZ?=
 =?utf-8?B?alhRaVJGRjFNVlV3Tk8rNVJPZlJLWHZaUDgyVnh3aVVTTXdtZmhsNzJwUVE5?=
 =?utf-8?B?dDE5ZkxOdkdxR1VZYlVwaWJYQzdCbkRFVmlMaEh3UW43Z3pBb0tlTks4ZHlW?=
 =?utf-8?B?aTZ1Z0pCdm9TREhzS0xmZDBJcEthcVZyc25zT1VSalQ1UEE2a3loZkYweHBT?=
 =?utf-8?B?cGZhOHdVY1JqWFU5YXhRRkZPcHEwZTlHK2NKcG00ZklFSjNnZmxEVkljbTUx?=
 =?utf-8?B?Snl2NjljWFVyU1JMUStkeEtsMlplcU9kTzN1UHgvR0YxR0ovaVFZMmQ5d0Nm?=
 =?utf-8?B?NC9lWElYN1A2djdnN0JRUXFsMEwzUXFRT2tmU3dxSXVBNTJQTWNKQVdQWUpq?=
 =?utf-8?B?cWhvQjVRN1c1RnVxTHkwTXpzdEFrUlBKY0RMQm1obngveGt4d3d5RUJoYlJF?=
 =?utf-8?B?YmFaTXZrNG0xM1JuU09HcE5mS1JGakU1d240SnIwb2xudVNXeUt3QTd6azlm?=
 =?utf-8?Q?KIvs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dzZ3eHJ3MWFiaU9FN2g3M25iTGIybklzbzFwbjZKWno2cjVmUWNmOG1mVktl?=
 =?utf-8?B?ZTlBZE03R2NVaGd1cVFLSmw1WTlMbngwbjU3QlJETjRUZHl1S3o3NE9MdldW?=
 =?utf-8?B?Qnc3Zmdsd1drQVZZMDdZczROWVF2cW8vTkJYNEQzS1NVL1ZySVhHdVI2cUp1?=
 =?utf-8?B?cEJwMjV3VEJ2SU5CNW1ZSDdvYmlJb2FmK2NIVllwV0dRMHA5NHg1OVVlYmFW?=
 =?utf-8?B?VDlOQ1htMEhwV0ZrUmhJYUF5VWVIUFYzZkVWQVlyNjU5ZjNiaUV3dFV6SnVr?=
 =?utf-8?B?eGJlWlpMcXhGLzZhNDZDaUUxMnZ0N1ZncUpRd0UrQVZWa0RNL2tsSHhBRUtI?=
 =?utf-8?B?aGd5OEpNYnB2Z3dndk1UZ0l0VGpENGJXdGIxV0daM2RoWGNRMzZkSVRic1RL?=
 =?utf-8?B?Y2l4Rm11clFDTWlnS2xuVWxYa3VKNkxOTnBJNndtaUhXTmJwb1JKY3E4RURn?=
 =?utf-8?B?SGxKV21RVFhpQjZVVXdDUTRvazk2dHh5M1pIdUoxdXo1VVM4QXZ0VklTOTdW?=
 =?utf-8?B?bVBTUEc4WUxkbjhWbmRoYjRpSGlSTUtlTFdBbUZJOU9zS1R6bEtsb2ZLZDFs?=
 =?utf-8?B?NnF5WkV5ejdOeTZRa3dEcHEya29WR2R2K0FCNFNESzU1eldSY3YzSFI5K3pB?=
 =?utf-8?B?NGt3WDdIa05Jc2dybjEzdkxvdXJSekpsbU9yVWtzSWpPNGRLSjFNRVV0aThi?=
 =?utf-8?B?SmIvZHdSSHM5c3NsYzMybURhZHRiVXJqOE9XaEdDbk5EdldkTXluM2pmN3px?=
 =?utf-8?B?eFI3MC9hUGt0L3RlOENzbHM1cW96a2lPU3Q5L3haL1ExMUQ0UHNUSVp1RWx3?=
 =?utf-8?B?Y3ZLWWp6LzgycFFoVE45U2pvTTJFYy9PdGhwb0I1NTh3QTFNL3hTdUFjMngv?=
 =?utf-8?B?bUtQcGR6M2o5T2hSQmlWNHFpZjhJMTZoLzZjcThiVlRwY3JnYUlTTjV6b2Zl?=
 =?utf-8?B?WDFyZGdFUU1kU2MydVE2Y2xab0J5aVJjZHBLV2ZOMzdpempBWEIzT1lwdU1N?=
 =?utf-8?B?L1pNcWFhVS9WelVZOURXVjFqbzNZVmRmR3hlcmRrTWkrMnJEYUgzaXFQKzQr?=
 =?utf-8?B?Y0V4b3hLbHk1ME0wR04rV2FoZ0VEL0JNclN1OFpXNE84czR2R0lDbEV1MXJF?=
 =?utf-8?B?Z3NKN2lIcnZDZklzbnFKakhPZFRxTVBkWmxvaERlZkVLTU9id1JNQjNzVGFD?=
 =?utf-8?B?WUl2U1QyK2F1aXowS3k0T3Job3J0UWF1eitqbUFMWk9VYVNKRGxQUk1qNmp4?=
 =?utf-8?B?YWdCQ3RFNkhlSDJ5UUcxWjdDczRWUWRNNkFPZ3pvdW54NE5JNUVaMHA1aXpY?=
 =?utf-8?B?L0R1RXNwdFBXcGNoZERtRWNDaVdzbWQ2SURMbHZYS2Fkd1dsbCtna3V0UDNJ?=
 =?utf-8?B?ejd6UXNDZjZPdEJKVjgyTWl0SzhOdSt5SWNpRjU4aC9HWVUycWQzQTVaaTNt?=
 =?utf-8?B?bG9EUEJDcU1RZWpEc0srWXNXM2JzU1A5NnNUWUFPNXhTT29rOVJmd1ZZSStn?=
 =?utf-8?B?UXg2bEVlSElGVEhmQW12RWFpTTBhbnBjcW4rRUZJdGJ2RkNuSk5aMzErS29P?=
 =?utf-8?B?ZGh3VWZFTjRDa2Nva084RVpMUGpjdXdBWjhwQlpkQ1l2TW1WYWhFQnVza3ZU?=
 =?utf-8?B?RVFrSzR4My9ybFpSVjZWYk9MQnhSdkJZSndkUzV6bTlzOUFrVTcxTHlpUDJs?=
 =?utf-8?B?OEZLc25HNEVaYVFuSWhkMkdtQ0huWk9NNXIyclQ5ZlhQS1ZGUHpSdkJoT1Vw?=
 =?utf-8?B?M1hpSjY5eWUzSWJmOTFnRDN6VHF5RTFwNTdpM2ZEQlF2K2FPVG9lTjljUVVj?=
 =?utf-8?B?czVuMTBFVHl2MjUxeFprbjdGd2sxVy9ac2UzTjAvVWJwdVd1Y2FLYjNMU09E?=
 =?utf-8?B?V20vRC9lUklIZTEzRU1QUFdjMGFlTnpoUWZYRFM5bFJuaDNZdUNFY3FvZFdQ?=
 =?utf-8?B?Y3puaWxrSHhIbm0yWSsvUFc4Tkd5R0prVGdlOEQ4cXMzM2wvbjVmL2Z2MXBm?=
 =?utf-8?B?VDUvdnM4dnROTzVvTTdoRnZQUUFldHliaXVJb29tQkJjUlUySThWenVFanFl?=
 =?utf-8?B?R2NGTzFlN1NBdHo0Y2FDWjNDVkc2UXMyWnM0di9ZLzMvSU9uaVZsNC9SRHNp?=
 =?utf-8?B?bFhlTVIxU3ZlbDQ5N3pPbC9nRnRCd1AvY2NTclAreGFMK1gvRkZPWW41WitL?=
 =?utf-8?B?Z2dnT2NHejI4RzVNMFhncFVUMnJUcGxiNURmRjdjNDdFS1Mxa2pDZU1qblUy?=
 =?utf-8?B?S24vd25SMExmTk1HYmpNYlVLL3VYTG9SZ0FlZE5SUng1RDRFbG14eFFtZUE3?=
 =?utf-8?B?VmVCZTE0a1gwWFE0L3FMSW45ZnFPWllaU2dYSnVtS2x5YUhEYmwxUjIyeXNp?=
 =?utf-8?Q?1s1gMW6J9qNepig0+koZQoqhA7X7GhtHd6Bi8idorwpSg?=
X-MS-Exchange-AntiSpam-MessageData-1: 
	ztbL4owyEKGUaKOfbgnCakV1+ZVn7R9fBupp7dcf5gUZ85sJ2yXdUQcp
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3ca2cb-e1c9-4a52-2590-08de6a54907d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 16:34:17.4175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jutXCh2nIj6jKByIpDEqnuiTtOfSG3MEcetaK48SVtM6GxjW7GPOIBVnX9OyJe0xtaDbPu49j8SitZIPXZmd78nyxXqVCtlMgIKXrQYAUgvX2aBuh6MhZ7Wb+Tqk7O73
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5281
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bvBBxUai c=1 sm=1 tr=0 ts=698e010d cx=c_pps
 a=IWYRGtMsEs392uQhKf0YYg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=ZKfnguAeb2mIkjnhnzsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: j-o_hbkgKuocCiJ7f7ksrNpA7c2DeoaQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEyNSBTYWx0ZWRfXww/KqvtcZF75
 kyYaZiNzCoSlgwgh66/HJuBuWkczBtM1RwoxiVhSM+X/L1Na0AXxB7FNTvZ+bwjMG1OUDN3roQ+
 NDwpBq6/voCaLmSua5gsu6UyI1pZzyYmnZ4y7VahKnugQF2ed4nSDcj9mZqlK2xgdBO1dE2f/zw
 aVpWwpb9Qn9hLSo2MfcTEtkH1JKsDeti1RaPtL2SibbPyR26SCFkBuQJY+4VGP38wlwA9q5/7NA
 C03SZPUepSmmZ5rXg9VASCtbmG6T1dmDo2rmEDE0m73VNlZ/eP9LbCGt/LOcrP+acTaW9j7UEFS
 C3cK8J+/r4HzajRGkUYwtuwXerocLq6pIRZgy7qUZwoGU7eptSO9ZCogeWliJuwyLZiTOPr4JlN
 LONp6s6sO74q8g/U3gNDw8ZqoXmNRB/5AK8+j8yFsEdmMxqIipQLXNNw/SMiaTNXc/cOjxdPCoL
 2dLOGaCE1wAn6r+kvsg==
X-Proofpoint-ORIG-GUID: Z3xqNd0uHnYxIpFmjIEUbORqGI3TLZbQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 16:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231038

Hi all,

I would greatly appreciate feedback on this RFC. Please feel free to 
share any comments or suggestions you may have.

Regards,
Deepesh

> WIP:
> LLVM target tests are currently failing on x86. This is under investigation
> and will be addressed
>
> Deepesh Varatharajan (4):
>    clang-tools-extra: disable tests
>    clang: Enable tests for llvm, clang, lld
>    oeqa/selftest/clang: Add selftest for Clang/LLVM/LLD
>    rust: Fix rust build failure
>
>   meta/lib/oeqa/selftest/cases/clang.py         | 301 ++++++++++++++++++
>   .../0042-guard-clang-tools-extra-test.patch   |  74 +++++
>   meta/recipes-devtools/clang/clang_git.bb      |   3 +-
>   meta/recipes-devtools/clang/common.inc        |   1 +
>   meta/recipes-devtools/clang/lld_git.bb        |   2 +-
>   meta/recipes-devtools/clang/llvm_git.bb       |  11 +-
>   meta/recipes-devtools/rust/rust_1.92.0.bb     |   5 +-
>   7 files changed, 389 insertions(+), 8 deletions(-)
>   create mode 100644 meta/lib/oeqa/selftest/cases/clang.py
>   create mode 100644 meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch
>

