Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B2DFCD0C5
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 07:46:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8802.1773819963750214620
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 00:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=AnJ4wlRb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7537156b97=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I6Wkne3855155
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 00:46:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=sHsrN2rwi0lbv/xNEa8hJZXgWwL/HOzZIV0ld82Q7CU=; b=
	AnJ4wlRbnlNSRg+acIrw0RywzvZVh3DXsBb2NRRgo4tew2M38OnW7QKubhiWrzZb
	2CKtm1ojly0vE+lB4lzg++sOgsafAVQPOeRpJDUM8/BToL6Na9RVrxZZ9ujyi/km
	lfBjZJOXIHGEd84W/B5HDmDFo1NXEtJcG8qFKajHiuokWTq1k2DL+bcDKELUsV+F
	iKQoPIfzuppj3o45B5UqHrODTqhSMiQ3pnVR0RP1ZB9/p36xENv/gVCp/Q/YTNOo
	ayWbdKPDw1BTR9zCl6A0SWwGEUCljT66hmqqA5DAo3o5NAXvHDDru/3chtIGLu+u
	dMMo0hNI5wsDTq4bAQgteg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010011.outbound.protection.outlook.com [52.101.61.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw2y14cur-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Mar 2026 00:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ES1Gs9lFCk/KFQfkMxn3fTotFFUNqfXYMo5cdZoBFF+R6FzteBMJAkNgZK/T414JKdOqz8i0jn4QBY4RVqAUjJ0so/mB+4hTsnZUq2wbH0nrgY9vV3fSxmBXBqx1lnhL9Ta/otthzexgvxmixLtT/+lljzWb8nOuU08iBxd1qe5/siFDvAVEqjJmPVZv12dxbiB66pe0OHHa1KnOz6lQtZ0dCopa91dLbyHl5L7cYzaD/t0GbS5Gz5wvKzxOCY74e/8YbEgibV7SiX7gRT9znCz3+U7pJ9nxEJCuZv5vThABGlkF16fQoyXOTr1+SpoGtUN/INV+97ewYJjQq5ZuZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHsrN2rwi0lbv/xNEa8hJZXgWwL/HOzZIV0ld82Q7CU=;
 b=VH4i8kkWU+psW6YLWgxc5cGWOXYeESnh5a6jnlHHak0QMj23ZhJCyQi9MuqVnQ3IxSapp04oFrqDciwDEL/0h6hLdtggbnEm5kGD6trkYfZdKxmPEyo/cduuPVfXC2m9w6uMn9ozNVT6C5RgHmMxSrR0B7kHptpqY1igXIWc76M2KR33siFN3sy3MI/kM+/tBVM8NOHBaI0b+NtLFiBpenvgrYL0H/qSBY69nxL1ZjctXqtheVkPv1UYtN9sh2f5IugxXSQW3rbjnl/2wqEmSykXsA7ikCtjkiFEns8A5HFJQjUhTlQkFLUHDEpLytIGKcGjS7NiXyJYy5MXbe22Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2589.namprd11.prod.outlook.com (2603:10b6:805:53::12)
 by DM3PPFD5EE188BF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f53) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 07:46:00 +0000
Received: from SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::9fca:dc5d:4230:e12e]) by SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::9fca:dc5d:4230:e12e%5]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 07:45:59 +0000
Message-ID: <044f1e0a-80ed-4a16-bdc0-dbd36b777b0f@windriver.com>
Date: Wed, 18 Mar 2026 15:45:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lttng-tools: not rrecommend on lttng-modules
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20260302064010.1421315-1-kai.kang@windriver.com>
 <7029edb75e3d8c609447de0d0f7d9f4e73ec5521.camel@linuxfoundation.org>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <7029edb75e3d8c609447de0d0f7d9f4e73ec5521.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SGBP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::21)
 To SN6PR11MB2589.namprd11.prod.outlook.com (2603:10b6:805:53::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2589:EE_|DM3PPFD5EE188BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 19663e0e-4af8-46d3-7c6a-08de84c26590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|42112799006|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	bmYq7plKEVpjusonhcQIUqd52CvHiInnMjCKDWp8y03XuGtFR7JPiAF4GSm8aTb2Rg2yocElOmKxQtqG1G81TTdqeFifT/dFwuedCxz+iNPVtBW0uaaZl+XMQud0WJrsmktE+zkwbqLh00fVXovepemcRD2uye0UswYAA6oVQVsv+wz37G8o2nJRwu1c0a1N6hOrTMjVmdRyH5AoyDk20nHYoPsQ85pOdMvKnO2c7r7HhWMQ9bz2pF8gnu7ML/KAFlv/sbFRorT75Jk2fHWsXfvgjZfDym8cfG0qm0T/4soWkY8Qv6EMnKrxl47qvSCBJK4d58tR48b06I4RpJVqHmihIbsiSezDBlu04zYaAepNVjWKJazp5Hwq16B3IV9iglBE+0oA+mMKDX9iEwAyIPPsttN5hOaWPELB43cW+zojJmNTI9ZzE6be34XCpQ9VgjQ3NeXyFwPKLUtvr5+k7Ok1QPDyxwC+3B0m6YcC5E24qhTLFGMp1JT9WrUCT8t0ZzqIfjZ2qbNdwnlTVF2xOBKBX3YM6SlVN7ocSYlEofbKPcJOzFDrgLNSpdA8lro4HzQ20RyMrlbNJEObsGIXQWukJOFR036F1oYBwlKejI7ykawbM2fHSWdzg/WebS4z71OfUNYaf3NNSIsgTOFE0TZpGrx8I+NsHrEFw19cqlGo9mq0ipXXav8Jww5ItG6p
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2589.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(42112799006)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VUlSbUg1dk56bzNpY3BtOE1XU2JmNmRtbHNLWWEzWEo2SHdaMjFjdnJpaUgy?=
 =?utf-8?B?RHA4OXdHRUNkZXkvY2hxSWdBWGhwR0tQbDdqdlhJbTFISlZLUkZwc3FzV3RB?=
 =?utf-8?B?SCtSYmI2dGc2M0s1WllWSmdrZTI5OWc2dFRXMVBvaUJqNHRIcEhHNnpKclF3?=
 =?utf-8?B?U0JXNVh3VzlJUHFaSC9jNmlRZkxVamdydDZyS0Y2OHRCMGQzQTc3TlM2RkFt?=
 =?utf-8?B?MmFMayt3U1hlWEhIcEpEWVl6cVU4ajZpMTd4alNLWS93T09ZWk1TdXFzaGNT?=
 =?utf-8?B?djN1ME9Tek0ySFhUNjYvZ2lRRFBVTmo0U2llSFY4TTQzMFVXdklFRWVMdFZ4?=
 =?utf-8?B?b2tnRlhEQmhnV2NDelIxTFViVFduSFVOamplTGhZb1Y4d2xRV25ZMHNZS0xk?=
 =?utf-8?B?a1FTdTBPc0hkcDZ0OWthcWwwRlYzLzdJTE8vRklBb25oQnNVQ1JUU2FWdG1t?=
 =?utf-8?B?UzVQRXg2eUN6bU5IZzZXWTVEWFNPY2JYakE4djI1aXUzclBiWHQ5dzhpck9q?=
 =?utf-8?B?V1pkUmdmRWtKZzZGdWtRUk9ra2JzRWM2RnRtSFNnc0lhK05KTzZRRytCSENG?=
 =?utf-8?B?YmVYNnVSbnBZNm9FdXJ5K1BlckJIaE1jNXMzVmM5Q0NLb2pOUmNtVCttZ24w?=
 =?utf-8?B?Yk9HOE1VemRxMW9RcDQxeXRZRGx3TVJRenVURmh2Y1FadHNDY3M1T1JpN29J?=
 =?utf-8?B?V2VjNmJsQnBmN2txUi9oY2lmVndFVFVmOFQyK2NiNXhVellEL2R1SG04WUph?=
 =?utf-8?B?QStjRkliQkdGZEl1QW1oOTh6ZEJwQTBaUlh4cXpoUFpHeTc2WEsxeUl0NGNI?=
 =?utf-8?B?V2dOUWQ2SnJrQllCSXd1bHVHSWtSVWJ5R0JMT2VtNUVtbGxJblFkOSt1aGh4?=
 =?utf-8?B?b1FuOHdsTWtDcStuTTNSNVhSeUlTMDV0TWJ5RS8ydmdIbS9YNnRHSHNGM2pQ?=
 =?utf-8?B?ME0wcFMzUkt2WVlrck1qR2JOTm13elphQTJqMHNRcDZJb2JZNGR5ZmRaa3JP?=
 =?utf-8?B?Q3Zxbmo2NWJpaTF6R2IyZ3RoV2J6cHlqY1RNNmRncU1tVFJQNElDeWxMLzEz?=
 =?utf-8?B?RUVEK05mQjQxVXRMNzNYZllTR1JoVExaTGZpS2VjNHZsK0VTNUU1WXkyb2FS?=
 =?utf-8?B?Tm1JbEZweWN4SEljbWNGbEUxUWVoYW9tWFZRaUU0RVBhNHlHazVMMVZBYmpo?=
 =?utf-8?B?VmRGYUJDbzV3a0NHQUYzaTV4MHRFZHFGYXpUa2VieDVwY3U4c1ZtSnpBNXZw?=
 =?utf-8?B?dUx4UXF6Slo3WWFZREwrYythR0RKV0xoWk1kMm9yU1dlNTR5cndTdVdrTDhS?=
 =?utf-8?B?NzQ1S2ZKdi9SeUF3TGszcmJvZ3ZnVGlSRFNYSC81cTFVNFRlRDJhQ1RndkdH?=
 =?utf-8?B?UjRQN0NEaFduK0o0TTJEbjU3aThXaEtSdWpJMTdEMWpmNGlEUXBYSTBPTkZh?=
 =?utf-8?B?aFJ5WngwU2JiZU1XS0R2cGE0ZDEwN3VMRWw4Wm1JZngwOWcyOEFPVUxsNWwy?=
 =?utf-8?B?dEE5MFY4Wm85MGtSc096TWdlYUp3Unc2RWtXTVFIL0syc0dyZGwxT1ZhQTJw?=
 =?utf-8?B?M0ROWEZ0STBlZ01aRGFGdStQN3dBZDVCczkwRm5LdktTQWliUFQzRUpXUFJ3?=
 =?utf-8?B?TlFXblNYbXE2ajVTaUFuM2tEQ0tGUlBuQ3lQSHJiRDF2WXJYUWlPVG8vTjli?=
 =?utf-8?B?dGEwQ0w0cjU5TmdXUGdiYmE2ZUFwR0U4V1Vxdms3L0hXbVNpS0x5b09BYXlh?=
 =?utf-8?B?Q3JGZ0FFT0pPd3lBbjhFNi85WjRuVlJlazNwY3JBNWhPc2xrT3djVCtWNVpI?=
 =?utf-8?B?U1djelZybHExdkNibUJXSEd2L3JyZEZ0OWVNTVN5Q2dwRURFSnZRbDlxT2dF?=
 =?utf-8?B?ZTI4ckNERFpVVEpHYTBCK1plR3hwR0pnUUZtV3FVN3lJUmRYMll2ZWlHeWlF?=
 =?utf-8?B?S1h1Z28rSHp4QktOeGdsOHA4Y01CaEZ0UHNEKzVRdEZKcnUwU2VyQ245Y2Fw?=
 =?utf-8?B?TzhEZFdYNUNEMG4vSWgvcmZkR0tpN1hFeE4wRkVuS0lIRkpwM2hDN2dHbVhi?=
 =?utf-8?B?bGJkb20zT2E5TmJXTHJHSVNBYU51UEVkTjNYRldSMVJQMHBJSkhHREJDWU9t?=
 =?utf-8?B?K2JBVzBNTTlra1lLS3FsL05zUGJ0ZWZUQTJZNWEyWktQSUFnczJTaTdrNm9x?=
 =?utf-8?B?ck9xYVpqaHpGaUZOL3daWlpoZXlHWFFTYTJKN0gyb1hmVnRMcUtvaEd4aHBp?=
 =?utf-8?B?SkNKSTcxT3Q3Vm5pRkxwaEF6c2UwYXNjOXJiT1VvWFhvMzBHSGROdHRDU2w2?=
 =?utf-8?B?SUVVWUpPaDBpSnE5RGhmMDhMWW1HbElkWkdkU2tuN1JTYWgyTHo2UT09?=
X-Exchange-RoutingPolicyChecked: 
	bXJzqH6Dc46ja/WyXWXZ50HL7W5Hfg96ZsdWoS5kcB4kwqgvrtAj443N4Gla00BXBnIlwsazgrjiQUKDrighHHoalF3UzTnK1zHkk/VmVVhCdlTDGIsevBPicY+Gt7oda0nYlLK7zJywSsMX6fNqAU4EZgiC4CliCoj8HR+PYnsApQh5QhwITaVtJMX3tCLVD1fuyWTWlkt/JqHwt4hMSKtP/ai8WJAm+lahcfYTOaSBouNo1g/jwjD2lRewpnvYa1Kyr0yapOW4dLB/3AoXA975gDz8DKV/ssBZT83A/EIIq9LTS79QHs4lKdrtqyQjC07yjcnlSTvVaYm2jbhvwQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19663e0e-4af8-46d3-7c6a-08de84c26590
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2589.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 07:45:59.8940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7xFmVupcUSEqBgMLOtHbeI0WmpcruyVn21QoXgSX+bqLOc2/p7Q+M7YEmOQdEIda878C78JtgGjtG8Uyw9AZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD5EE188BF
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=CekFJbrl c=1 sm=1 tr=0 ts=69ba583b cx=c_pps
 a=UjDdpJjQ9fE5FDPsVaFzsw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=a5LkSv8FAAAA:8 a=3WQPG5ikAAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8
 a=XbjTCVpAX8OVzuHSmYwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=E2cWBXyb0kjxxB1PlMdk:22 a=zBohcZEwHkW0jPBbCVRQ:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA2NSBTYWx0ZWRfXzXxNKeGfsLzq
 OzhQG5eA6ozRYhfdmSX8kIyfsYhYDhIrZE2t7+fT3/hCQ+UBErOZSIpHgsu/vUsl2+QZcqtn/ba
 RCTMZfh2gJpKM4qQEItr2Okc2Nr1a9gBzV53jdXJONbQExO5SOffKidenyWbZ1XG4GrHIuI+Sc5
 7zgONYU8GE6yqXgeWN+bysfl/OQpuxIBGzn4b65tPCvB6fdAdVuh72fgG1LazxcgLgL69YYJs0e
 8P2Wp7FdD3JYb6wqSm0Jet8xfWMXmqIZDXelLZ4oX7XBCFcouxEJVHQ3UaU6FgI/xye4M+b0WIu
 91Iq4J29EE5tJXazzzjPQigSD7xOE2Jfj9N3OoLVpEJBsWZqS3JCBZnk9XQI/asG+HvG/B8Ebh+
 hIbyrHEHKY96SqOGh4dbkTedQRm3N0xvJxo3/2/GLpgyTBKvjzJlsLrvYqoOMbdUAxpgUS/VZkx
 WnoegNQVIQZn7+2Itmg==
X-Proofpoint-GUID: ejpAj4LbJMwOK-z8TytLF3tER3M6GU2U
X-Proofpoint-ORIG-GUID: ky1Rw_qRi0OEn0be1qbqMdiVcmNgnwAn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180065
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62I6Wkne3855155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 07:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233368

On 3/18/26 15:37, Richard Purdie wrote:
> On Mon, 2026-03-02 at 14:40 +0800, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> As in the lttng manual [1]:
>>
>>  =C2=A0 Most distributions mark the LTTng-modules and LTTng-UST packag=
es as
>>  =C2=A0 optional when installing LTTng-tools (which is always required=
). In
>>  =C2=A0 the following sections, we always provide the steps to install=
 all
>>  =C2=A0 three, but note that:
>>
>>  =C2=A0 * You only need to install LTTng-modules if you intend to use =
the
>>  =C2=A0=C2=A0=C2=A0 Linux kernel LTTng tracer.
>>  =C2=A0 * You only need to install LTTng-UST if you intend to use the =
user
>>  =C2=A0=C2=A0=C2=A0 space LTTng tracer.
>>
>> there should be no force dependency between lttng-tools and
>> lttng-modules. When set lttng-modules in RRECOMMENDS, it always
>> forces
>> to build lttng-modules whether it is required or not.
>>
>> Compare to rpm spec [2] and debian conf [3], there are no any
>> dependency
>> between them too.
>>
>> So remove the RRECOMMENDS setting.
>>
>> [1]: https://lttng.org/docs/v2.14/#doc-installing-lttng
>> [2]:
>> https://rpmfind.net/linux/RPM/fedora/updates/testing/43/aarch64/Packag=
es/l/lttng-tools-2.14.0-4.fc43.aarch64.html
>> [3]: https://packages.debian.org/trixie/lttng-tools
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> The removal of the dependency probably makes sense but we need to add
> lttng-modules to packagegroup-core-tools-profile instead.

OK. v2 will be sent.

Thanks,

Kai

>
> Cheers,
>
> Richard
>

--=20
Kai Kang
Wind River Linux


