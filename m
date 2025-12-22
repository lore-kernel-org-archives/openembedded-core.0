Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A9DE6780C
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 17:34:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.84819.1766424886525281368
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 09:34:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=JAV++e8S;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4451c17654=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMD8ojX2839255
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=6SQw+x5nZD3qYWp3MrNUS7
	gqWe86mA4DLWbThO99nes=; b=JAV++e8SFgBPIAbFzQp7vBOQmqBJvjYssVccFm
	UdF2mhWkkFqk4kMbPdBGTXvFifZ5AZv7yG+xak94Q+U4ycANFJukC0k6ZnCTEp/+
	Odpx6DUrLeWVzXNLzJuLOubaxsA16WoMp1KLnyNh8Ti/r0nX6d5FLW7Y4QruBfB7
	h6FJ7o0D1p10IY6OEKyir3N0mvXaJpt4QSaActyz5mNB7nZmdvyPsJv7MSHPA17B
	hR5TNSEZFPoJKQvjrZv6Lz+i/DMpQnRzJl/6wR0eGocHYGkBS0fS8KRnAIZTwaSZ
	6kpfoNmgwj03WnP2PRG/eeMyp6hSGKHNnc5RTrSRHQ3cpw7A==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010001.outbound.protection.outlook.com [52.101.61.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5js7209x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:34:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YI25wfmjfdwFuX9bOiENayyrYssw052UcqA0KLgtOBPw6zZvx3DEPvL8oAnbJ+IPNcVzKdZT6VCDqsu7Felyx7wovWxx4wB56CxJSqmcGA2GPWjxF7OnVS5SO3Bf9c8cLC9RCAHc5A1s8DHEOUlixVilAPnnTj/RGb4f4fjVLYcrfcuFq1NaxJsyH0DvhVtELHg5h0iCAIJAetdUtHAbTvJyejk8HmKUWgsjZ13laBGofcZoBnF7HuhMfN8u7lrvoSjhR0YYruCrtryWOby82puxPpx+8rYpmge0JRCDE7MrbsuczLYcliyEV8v7iUSQF36ExtpkPE23YeDvqdkyFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SQw+x5nZD3qYWp3MrNUS7gqWe86mA4DLWbThO99nes=;
 b=e4/yVAQRwgOBrOTlQOfLHD07mti236+CXz8o1xuCNwPJdSVtSm1FPOn9QF26IXs9rIxDjg2C2yagnNwKC4bM9xlT2MJyV6SojhBKYLKCm7kOL8PaehSFcGkBwriBdPSu4b+nspffrn8ZkesBaYothZZ26ThvfmZyM+Fsq4qFW57HANDuCsV8HH1VG/8THckXxXpIWX3gRJUZN9l0pXVG7kKYrKtmIRsY1ryNPT1X9G2DkVAKmX9VVEUezdW5VPViEUkt8DO00DsJOW6v62GNVtJLMqlBgoYwTfcmxFedr5KUfy7xQ4Jj9uZgA1kdTImm62fSk5GGnzD+79ItGjwU+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DM4PR11MB6336.namprd11.prod.outlook.com (2603:10b6:8:b9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.11; Mon, 22 Dec 2025 17:34:42 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 17:34:42 +0000
Content-Type: multipart/alternative;
 boundary="------------I0a0mlAZXdfh8CUSeaUmkk9t"
Message-ID: <af7814b2-9d54-4235-bb21-c1aac90638ff@windriver.com>
Date: Mon, 22 Dec 2025 12:34:37 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3 V2] kea: fix creating runtime directory in
 service files
To: yi.zhao@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <20251218134426.4187527-1-yi.zhao@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20251218134426.4187527-1-yi.zhao@windriver.com>
X-ClientProxiedBy: FR4P281CA0213.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::13) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DM4PR11MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e67574-e569-468b-790b-08de418063d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|366016|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NWVra1I2ZmUxaWxMbnBTSU1OT3JxZ2xaay9qZGN4c1lRU3czNE1zdVhrZEt1?=
 =?utf-8?B?MjJROVVvdTFRYmxjTnJJNk9ZYnBCeUp2R2dvS3VUTTgwUmk1bFFNTWJGaDd0?=
 =?utf-8?B?UVhuWWI0VDZNQnltdmI0VXpWTkZTanJSZjNjTnE5T1FPWTE2U3lwZlhybjAv?=
 =?utf-8?B?ZXRTOTFMWDFVMmZXVElubDVlSm9yUDg3VTE1d2FkTFhLekJxQUY4cksxY2g4?=
 =?utf-8?B?ZEYzUzNHSWZNTERtTzdxRDg2WURRWSt3MW8rTnRzWnFCMXJNdzBoU1FLV0ZD?=
 =?utf-8?B?cUxZZWZhWjJpU0JRNmVPalFSRHdPWFlnOUdOV1dqMTBQc0VJaGN6eFN4Z0tG?=
 =?utf-8?B?MWhTV1ZHSkNGYjZyNGxFS281bDZRMzRiNkRoRXpoNnpoZE5rU2s3LzdPSzJu?=
 =?utf-8?B?eVFreHB0ck1HSEgrWUZhWk15ditVUk1FeFpPVlRocTdPL2JSMk1kUGM5TjRF?=
 =?utf-8?B?ajdKZ2ROWEduUU8rakY4aGRCaElrUWgrc0tQaWxjVkl0aW5lNjVNUHgvRVNz?=
 =?utf-8?B?cm1MV1UrMTBjU2JueFdSa0F6K1R5ajRVNWlYWmQ5dlRTQkRyZm40WTB5WC8x?=
 =?utf-8?B?bFdHMEo3SWovQjA3ckV5Nm1QY2d1YTRjOXR1SGhyd1hESmZxTEw2bWgxQ1Vs?=
 =?utf-8?B?MEQ2NXc3ZWs4T2hSOXZ1eGhTWDZJN1NYN3lEdi81ZkpIUjRQMnlOLytueklu?=
 =?utf-8?B?dGpiZDAwc0EzS3lHblk4Ym0zQ1BTZ3J3ZHBrUDJpZDZDTHljejNjem5KY1FG?=
 =?utf-8?B?SkxhSFJXMzgya2JRQU9yUVQ5bDVYYjJrdUc3RW9EMXlvdWJGVVFmMnlTbm1O?=
 =?utf-8?B?RTliNXliZEdMVDkxanJ4aFlhdVpFL1VXY282R0o4ekJweUY3NUNwQ0FnaVN6?=
 =?utf-8?B?Smp4R2RRbXp1T3U0amhWYmRmd3h0cVgvOXBWdHFxaS9EVGNvcTFlbnZDbk1v?=
 =?utf-8?B?bHlIZ1pTbGowU1FDQjNFMDVaVFN5TGtlYTFJM2o5bnpXRjh1NThUdWZXdlE0?=
 =?utf-8?B?MHdRVFR0cjZMQVZwZVFKS2JDRGxESVRGS0JMb3BuVVVIUkJOY292enRyeXla?=
 =?utf-8?B?VGQ3NmhhUk9BV3Z5K1BUd0lySngyVEE2MldzSUxCVm1vT00xRjlIS25OeGJ2?=
 =?utf-8?B?NDhYdTd0RzJSSXo5TU9tU2VRYmJaNGFmWDBFbDhpdDV0bnQvVUlXajE4V3RU?=
 =?utf-8?B?TUhkclIwS1NMejU0a3NrQ1hFOGZBK2s5MXluRy9lWGM5RGJ0Z25DU3hzMS9V?=
 =?utf-8?B?U1ZZaWVXK3dUZ050Ni8vQ2wwQ1pxeWdzOEhEVFpVcXorYUtkclpkcjNVS25H?=
 =?utf-8?B?U3NlaFJ2M0Y3M256ZFptTHFjRGl4RnZOR0V1NkVhWGE5TGp1aHQvZ0JleEFz?=
 =?utf-8?B?b1RFYUdzUThhZnRIUXdCa1VtcGRMV05sNDlWanFLalkrNE9JdmZudEkzM0d3?=
 =?utf-8?B?NHhwUlMwNjFaaHdxZ2VmMnZRODVZU2pHVUQwNzMxbVpEWTlQN0JXSUdONzIw?=
 =?utf-8?B?Qk9wR3lrd0FBNUQvbnhjTDhDNmdhdUc2aElaZG1kbVppdGh5V2toOFVEY1FP?=
 =?utf-8?B?bkFVbHd0MmpaVE52MlRYaGRUb2MxNnpNV2d2Ym9iNnYzRElvbTRUZENyWkF3?=
 =?utf-8?B?MGwzaklaVzZqblFkZy9PY0JMMm5CaWZPeVl4L1E1WkZ4Z2hsZ3JvNnFTVW4x?=
 =?utf-8?B?emt6cGNzWkY1c0RSaGNhMW10bFZtOTVLN1hrNDk5TTdodXNuRElvUS9sL0Rx?=
 =?utf-8?B?aDJPK2YvWkRFU1BtclNhMVhNRDNOTk82alFiaU5SZnc0Y1FDVlI5RUthVnVi?=
 =?utf-8?B?OTZ3aXdKNTFjWmxkUURnZmxkNGQvSXBoQ2ZMZVVJbDZaRnJoRlhhK3Y1TTFw?=
 =?utf-8?B?eWVWeitVOUVib3pKSjFQa0ZkakVmcjJTdjNCSDVvSEVTR2Q3eHRHTHZTZXgy?=
 =?utf-8?B?Vkxkc0ZmUEVkZ3NwSVNFV25wSXhPV29saWpsRENvREhnRVBlcFpHczFFTUg0?=
 =?utf-8?B?RVd6THBhS1hRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TTlUbHBDYlcrck1FZmhwNjlqcWlzYWJySDl3OXQyMmJib3hnRzlaTVJNUk92?=
 =?utf-8?B?cktsbTUxbGJzNGN6UGRFWUZQSWlqVnhUcDJwL0ErNS85S1ZuSmZiMW9uMUU3?=
 =?utf-8?B?SU9YUFQ1bmpVWlBPWUszMmVCcFgzWFNaSVA3d0pxTVRucDJid1U0UTE5Y0lI?=
 =?utf-8?B?bEo3c0dDWDdrYTd2cERwN280LzU2MkV5cTFzUGg1cGorejc4M2lUT2RvaW5a?=
 =?utf-8?B?QUVaaGlDRDBsZmduelljVDh6bEcrVjJjRGR6UVcrcUpObm9JNFlKZFNjQlNH?=
 =?utf-8?B?QUVTb2tnU01veGIrVVlRaWcwWFVBdmViKzJwU1djVFV5TTh4ajZtVXgyRWdN?=
 =?utf-8?B?RFVLUEtPUzl5SVlPWlFMZUhlczRyQ3NiU1lNNmlNZ0toRlVvbDhhbWFyellt?=
 =?utf-8?B?ZkUzNEtKTm1QVjhzdW5pVHFBdEVib2JraDBVOGFqKzh6dHFkY1p0UjJMMzdC?=
 =?utf-8?B?aDBZa3g5QkhPcjQvKzcza0ZnTHhtY1JnelZmL1o3OFZVQVNsS0k1QUs5STda?=
 =?utf-8?B?cW5pVFRBelhZaFo2NFUwNUF3Z0djRzZqREt0dHFhMkI0MDFCSDZERi9XUERJ?=
 =?utf-8?B?VC9tNURDL3YwU2I0VlJJc2FOQ1pYNHVlUEhwSTNhOWtRd2UzYnRldWtzWURj?=
 =?utf-8?B?YWd5bnpMQUZmWW5NZnhKcFc0ZTltcjBtb0NyZEJlWUpBS2diZW1jTzNXei9B?=
 =?utf-8?B?N0xvTzRpSFJJUTlFU2QraHVXTTlOWDd4dWRIR0lZRUtzZndtYXlQaDVRWEpR?=
 =?utf-8?B?dmtUVjVPL1NCWWErTEdMMDNsTzNGUk04Zmp5blJtUmY2MmNWdWhSYTkraXZX?=
 =?utf-8?B?aFQrTTJvRG5MNFZYOUZZdVZXTnNTUmc3Mk9NVUFMSy9XdE82K2tLUDd2aDY1?=
 =?utf-8?B?UTNIc0RIc3lRbHJhOVJkUjkwQko4OTRSY2ZHcDBtZjRHSUw5WEp1NzRubUU2?=
 =?utf-8?B?Z2dPaEpyN2YvK3pOWXI1QjAvUmFWdWFXQjB3bGpuY1QweDNoL3RZOHAraTcx?=
 =?utf-8?B?T1diMzllR3B5dGtsV1FXRlkxc1JYUkFRQkhDNCtCeHRwMVpUWjZvQWllbE9B?=
 =?utf-8?B?d2VLLytkVnRLK2N2VVV4aVdpOE9KL2ZLc2RHakxnKzA1K0hUYTA3TDJldUhl?=
 =?utf-8?B?TTlMS1diRkkvSmYrZlQ0b3ZsQWllakZ2dnlvZnJFUFhIYnN6RTZzM3J1UG1X?=
 =?utf-8?B?bEt0bitib21GUnhxd3JkVFd1OTRaQ2JVdml0SVQxNnY2N2J5UGpNT1pGTDgx?=
 =?utf-8?B?RnNheFd3cXV0NTBmV2dOc2o1ZCtITVkzTHBFekNaK3NyNkFEb21LNy9DSmdV?=
 =?utf-8?B?RXd6cHE1OHZRUlRpaytqaXh3QTh3MmQwczIydk9xSlR4b0I4QmVVUHRkdGxR?=
 =?utf-8?B?YXppdTMrN0dUdEdiNXNvaTdhZ1lkM29FMFczMTdBSnEzK1UrVEhpMVFEdWlp?=
 =?utf-8?B?b25DUzg0TVZXUzdpYlRkMVRMdmpZZmxPRGtvS0c5R2M3VG1PMTJ1R2U1dDg5?=
 =?utf-8?B?K002ZU56Y1RtV1JFSThGY3ZDb1hsNkNwM2pORDlOdUFOUGNIN1R6VnI4MDc0?=
 =?utf-8?B?dE43L0tOazdlTmp3MUUybWE5TzdFNVNBODRBUkpSYXc2RHpZMDk2L3JiQ3Zi?=
 =?utf-8?B?U0dNTVZnYnhuL3IvNzZHSlBlcGpuZmlXNEkxdjRCSjdDVE0rckxPeURPR05Q?=
 =?utf-8?B?eEw5SHI4RTdVb2V1c0tMc05NVTlwZ0h2YjA3RkF3QlNjanBha2ZTK25hMkpP?=
 =?utf-8?B?TEMzcW01Z1JMZVBaZWlqaVZZTWxNdUpJeERBOGZwTXJDWmxMSEtUcmc3UVVR?=
 =?utf-8?B?ZSs2MGlEYkltdU9ZMG1qdVFWbUhoc2RpZTVSRUZ4d1VYRWx5Q3BaWGhSazNB?=
 =?utf-8?B?Z2lOc1ZJTWdudTRVbHRjaUw5MUtrRFRmbnVvbFpiUk5xU0FvWVVINS8ySUlC?=
 =?utf-8?B?NjNjLzRaU0ZOOEtMa1RuUS8rVkx3RmQzb0htblc0MEZzSHRuU0RiNnczYkNK?=
 =?utf-8?B?dWNyeEd0TXJNdWFFY3RONmtHTHVWVXA2dzAyZDFDenZEWlNXTy90cGhTZW52?=
 =?utf-8?B?Z1JWZXR5Uk5sSm9wUmtCWFVHZTExQS9Db01MWVF1K28xQUFFTjBBZHpnanZC?=
 =?utf-8?B?SnBmOWJVRDU1S3VNYzBhZjJ1K3lQcXBvSkI1ZzZGMFlNWUNjYzlpNXBsbWtW?=
 =?utf-8?B?UkpYOVVWcEVQN0xPN0ZFdXVGbndhWThGZkFUamI3NERCN0lVNE5POTZQNldC?=
 =?utf-8?B?N3g1NG10THNheC9RV0UvTml4SUdTVmpnbitWdHJjN3dUUnhBMGplTW1tRWdP?=
 =?utf-8?B?ZnNUM0JFRFVkbHJlNnhRWCtVTTdEUDZEN3pER2o5cjBmZGJKNTNUc2R2T291?=
 =?utf-8?Q?bfHf/cLz7j0ifePo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e67574-e569-468b-790b-08de418063d5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 17:34:42.2623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpbhBgdgH7WfE06v23W6H6bYH0/30qlFTeWOZVXehzB0lu7OL7LGp5jnpask2YhwuFamzhSMUDFxwEb/umjV4VA3EDN4rpg5YMFlMiis+/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6336
X-Proofpoint-GUID: 9GCrCpbdvd-J5Ys3pd5e07Si568FbC4p
X-Authority-Analysis: v=2.4 cv=To7rRTXh c=1 sm=1 tr=0 ts=69498135 cx=c_pps
 a=j7tsCyGgeYHcZD8MHzM6Gw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=SSarXw7XQgvRzmwD13UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=elQYSOkI7eW87FL_RVoA:9 a=fA7l3fYQiQyBWmlz:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 9GCrCpbdvd-J5Ys3pd5e07Si568FbC4p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDE2MSBTYWx0ZWRfX8IEH74QYS6kt
 AInVtkuzNbSYdQlDfINr7K8dTWilGvitrbyDR494semU2KYC1XA01bN8l1O0QASMomJiP92cBtN
 U26Dg6Vh6kQCrfIITOcod6fqM6mwTlADJ/3/9fLUsWRCkYigFMqGWk095OA4/uwzfe4bR9Ou9b2
 8Ouuao7kDdTYPG1cH7ji/kIiA5Yu7fjcYeLCwtR2mSCK+U+v5PciOJ51kHSqvRVVWePGZjrBNu4
 zQz8k+heS5LKctNGIZNMVhm9rMAxRx2UBjOwHyWIACm/k75DGneoQimRbrcFDzSXZMP5EPyNQwN
 wcOndDueWXmHU3yWVJ5xsfU2U2R1z7r2fGfxMu+oo4EeE9A1I/keSV15JQtb4e43J6A57krS8n9
 F16oE+vjdTY2RwZfoxVQY5oK82aB7NYjX8qz39Y0bRQZ+5GYLw4Ro1O8jNjsnmcThuSdlHakpr8
 e4nMuZJVBCP8iRr5v/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220161
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228314

--------------I0a0mlAZXdfh8CUSeaUmkk9t
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BMD8ojX2839255

Hi=C2=A0 Yi,

This is probably fine but it needs a better description in the commit log.

Please explain why you're making this change and
what the implication is for users, such as changing a build-time config=20
to a run-time instantiation.

Also the conf files change is not mentioned.

We'll hold your other kea commits for v2.


In patch 2:
Is : kea.volatiles for sysvinit ? Is so, please mention that in the=20
commit log.

Patch 3: looks good.

Thanks,

../Randy


On 2025-12-18 8:44 a.m., Yi Zhao via lists.openembedded.org wrote:
> Create runtime and state directories using RuntimeDirectory and
> StateDirectory in systemd service files, rather than creating
> them via ExecStartPre.
>
> Signed-off-by: Yi Zhao<yi.zhao@windriver.com>
> ---
>   .../kea/files/kea-dhcp-ddns.service                  |  7 +++++--
>   .../recipes-connectivity/kea/files/kea-dhcp4.service |  8 +++++---
>   .../recipes-connectivity/kea/files/kea-dhcp6.service |  8 +++++---
>   meta/recipes-connectivity/kea/kea_3.0.1.bb           | 12 +++++++----=
-
>   4 files changed, 22 insertions(+), 13 deletions(-)
>
> diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service =
b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
> index aec6446f0e..feef7e0b6e 100644
> --- a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
> +++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
> @@ -5,8 +5,11 @@ After=3Dnetwork-online.target
>   After=3Dtime-sync.target
>  =20
>   [Service]
> -ExecStartPre=3D@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
> -ExecStartPre=3D@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
> +RuntimeDirectory=3Dkea
> +RuntimeDirectoryMode=3D0750
> +RuntimeDirectoryPreserve=3Dyes
> +StateDirectory=3Dkea
> +StateDirectoryMode=3D0750
>   ExecStart=3D@SBINDIR@/kea-dhcp-ddns -c @SYSCONFDIR@/kea/kea-dhcp-ddns=
.conf
>  =20
>   [Install]
> diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4.service b/me=
ta/recipes-connectivity/kea/files/kea-dhcp4.service
> index a2ed4edb59..ce1256cf26 100644
> --- a/meta/recipes-connectivity/kea/files/kea-dhcp4.service
> +++ b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
> @@ -5,9 +5,11 @@ After=3Dnetwork-online.target
>   After=3Dtime-sync.target
>  =20
>   [Service]
> -ExecStartPre=3D@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
> -ExecStartPre=3D@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
> -ExecStartPre=3D@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
> +RuntimeDirectory=3Dkea
> +RuntimeDirectoryMode=3D0750
> +RuntimeDirectoryPreserve=3Dyes
> +StateDirectory=3Dkea
> +StateDirectoryMode=3D0750
>   ExecStart=3D@SBINDIR@/kea-dhcp4 -c @SYSCONFDIR@/kea/kea-dhcp4.conf
>  =20
>   [Install]
> diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6.service b/me=
ta/recipes-connectivity/kea/files/kea-dhcp6.service
> index ed6e017d0c..6123a8ad58 100644
> --- a/meta/recipes-connectivity/kea/files/kea-dhcp6.service
> +++ b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
> @@ -5,9 +5,11 @@ After=3Dnetwork-online.target
>   After=3Dtime-sync.target
>  =20
>   [Service]
> -ExecStartPre=3D@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
> -ExecStartPre=3D@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
> -ExecStartPre=3D@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
> +RuntimeDirectory=3Dkea
> +RuntimeDirectoryMode=3D0750
> +RuntimeDirectoryPreserve=3Dyes
> +StateDirectory=3Dkea
> +StateDirectoryMode=3D0750
>   ExecStart=3D@SBINDIR@/kea-dhcp6 -c @SYSCONFDIR@/kea/kea-dhcp6.conf
>  =20
>   [Install]
> diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-=
connectivity/kea/kea_3.0.1.bb
> index 8729b1162e..1be557c79a 100644
> --- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
> +++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
> @@ -74,13 +74,15 @@ do_install:append() {
>              ${D}${sbindir}/kea-admin
>       rm -rf ${D}${datadir}/${BPN}/meson-info
>       rm -rf ${D}${runtimedir}
> +    rm -rf ${D}${localstatedir}
>   }
>  =20
> -do_install:append() {
> -    rm -rf "${D}${localstatedir}"
> -}
> -
> -CONFFILES:${PN} =3D "${sysconfdir}/kea/keactrl.conf"
> +CONFFILES:${PN} =3D "${sysconfdir}/kea/keactrl.conf \
> +                   ${sysconfdir}/kea/kea-ctrl-agent.conf \
> +                   ${sysconfdir}/kea/kea-dhcp-ddns.conf \
> +                   ${sysconfdir}/kea/kea-dhcp4.conf \
> +                   ${sysconfdir}/kea/kea-dhcp6.conf \
> +                  "
>  =20
>   PACKAGES =3D+ "${PN}-python"
>   FILES:${PN}-python =3D "${nonarch_libdir}/python*/site-packages/*"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228122):https://lists.openembedded.org/g/openembedd=
ed-core/message/228122
> Mute This Topic:https://lists.openembedded.org/mt/116841995/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------I0a0mlAZXdfh8CUSeaUmkk9t
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi&nbsp; Yi,<br>
      <br>
    </div>
    <div class="moz-cite-prefix">This is probably fine but it needs a
      better description in the commit log.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Please explain why you're making this
      change and<br>
      what the implication is for users, such as changing a build-time
      config to a run-time instantiation.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Also the conf files change is not
      mentioned.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">We'll hold your other kea commits for
      v2.<br>
      <br>
      <br>
      In patch 2:<br>
      Is : kea.volatiles for sysvinit ? Is so, please mention that in
      the commit log.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Patch 3: looks good.<br>
      <br>
      Thanks,<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">../Randy<br>
      <br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2025-12-18 8:44 a.m., Yi Zhao via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251218134426.4187527-1-yi.zhao@windriver.com">
      <pre wrap="" class="moz-quote-pre">Create runtime and state directories using RuntimeDirectory and
StateDirectory in systemd service files, rather than creating
them via ExecStartPre.

Signed-off-by: Yi Zhao <a class="moz-txt-link-rfc2396E" href="mailto:yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
---
 .../kea/files/kea-dhcp-ddns.service                  |  7 +++++--
 .../recipes-connectivity/kea/files/kea-dhcp4.service |  8 +++++---
 .../recipes-connectivity/kea/files/kea-dhcp6.service |  8 +++++---
 meta/recipes-connectivity/kea/kea_3.0.1.bb           | 12 +++++++-----
 4 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
index aec6446f0e..feef7e0b6e 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
@@ -5,8 +5,11 @@ After=network-online.target
 After=time-sync.target
 
 [Service]
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
+RuntimeDirectory=kea
+RuntimeDirectoryMode=0750
+RuntimeDirectoryPreserve=yes
+StateDirectory=kea
+StateDirectoryMode=0750
 ExecStart=@SBINDIR@/kea-dhcp-ddns -c @SYSCONFDIR@/kea/kea-dhcp-ddns.conf
 
 [Install]
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4.service b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
index a2ed4edb59..ce1256cf26 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp4.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
@@ -5,9 +5,11 @@ After=network-online.target
 After=time-sync.target
 
 [Service]
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
+RuntimeDirectory=kea
+RuntimeDirectoryMode=0750
+RuntimeDirectoryPreserve=yes
+StateDirectory=kea
+StateDirectoryMode=0750
 ExecStart=@SBINDIR@/kea-dhcp4 -c @SYSCONFDIR@/kea/kea-dhcp4.conf
 
 [Install]
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6.service b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
index ed6e017d0c..6123a8ad58 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp6.service
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
@@ -5,9 +5,11 @@ After=network-online.target
 After=time-sync.target
 
 [Service]
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
-ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
+RuntimeDirectory=kea
+RuntimeDirectoryMode=0750
+RuntimeDirectoryPreserve=yes
+StateDirectory=kea
+StateDirectoryMode=0750
 ExecStart=@SBINDIR@/kea-dhcp6 -c @SYSCONFDIR@/kea/kea-dhcp6.conf
 
 [Install]
diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-connectivity/kea/kea_3.0.1.bb
index 8729b1162e..1be557c79a 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
@@ -74,13 +74,15 @@ do_install:append() {
            ${D}${sbindir}/kea-admin
     rm -rf ${D}${datadir}/${BPN}/meson-info
     rm -rf ${D}${runtimedir}
+    rm -rf ${D}${localstatedir}
 }
 
-do_install:append() {
-    rm -rf &quot;${D}${localstatedir}&quot;
-}
-
-CONFFILES:${PN} = &quot;${sysconfdir}/kea/keactrl.conf&quot;
+CONFFILES:${PN} = &quot;${sysconfdir}/kea/keactrl.conf \
+                   ${sysconfdir}/kea/kea-ctrl-agent.conf \
+                   ${sysconfdir}/kea/kea-dhcp-ddns.conf \
+                   ${sysconfdir}/kea/kea-dhcp4.conf \
+                   ${sysconfdir}/kea/kea-dhcp6.conf \
+                  &quot;
 
 PACKAGES =+ &quot;${PN}-python&quot;
 FILES:${PN}-python = &quot;${nonarch_libdir}/python*/site-packages/*&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#228122): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/228122">https://lists.openembedded.org/g/openembedded-core/message/228122</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/116841995/3616765">https://lists.openembedded.org/mt/116841995/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------I0a0mlAZXdfh8CUSeaUmkk9t--

