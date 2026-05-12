Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FDCCD4F26
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 08:59:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70949.1778576347237522081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 01:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OUrlmtmy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=95926deccb=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C3x6hP1203707
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 08:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=beAsQySC5xPYkGnzMH4eKrAH+EI1r9fa672jXL8pGW8=; b=
	OUrlmtmylsXHjkGR6iLTkCyAlc8I/F69l4PUpo8Z1f2IXt0tGHS+AzWQ6mBlKuzu
	hfJb8gMhqyg/tLn7HE1vgV/hr7917Oq/WA6N9jsJznI7J1SarZRclMT+/GG24jOz
	xFLuCEW1fYO5onP4gJ61ndMwJcdUpL/8OhQ2bOD3D9GXRbgTBLIZFwSU0g2nMX+c
	tMeG35UPEL38bJ7lp9bdbQTKhzIAv1dLDsWAZwJzzznbsn2Th4hmz8dCbvwqQBAS
	kMkgsS6/cZmhj0V7PrDlJkX6D9jqdbmeykbor70cZ4EgFNuIWRH445Z/3G8ysYGa
	07zM625gBP64V1Q2pQcJKQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010027.outbound.protection.outlook.com [52.101.61.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e3nvc0nhh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 08:59:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oX0l1hmpTncDO56gr3EuLcbW1JP4lq1EGBGNoyvkKN+ygkM5SvoyWwuAhTSh1hdM7gA6y6XoKeXIPOU9dkHb4n5sQvkpjKhgA7maR29drgDctrmky6/OCOW9o+di9Y/KO8V/gNc9q4SAMbR+GXSJhHhtzw1P4tSqayiK1zcsFkqOmFqBLKJn+/YSpYfDyMjeFD5l7bvaLtXb+bDexoqeESNvq9E2xDjeZkgh3ijY19QBarQ7bGkwbs/W26NLihVd5cfGIe2HXHBDGdtqFendwmBuBUPOu9fXoTCo7lc+WVglMqDybTlPw8h4SboBOP9fXzriiZ1uRsyBsTYM41h5Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=beAsQySC5xPYkGnzMH4eKrAH+EI1r9fa672jXL8pGW8=;
 b=akZh2g784c8YH0dj/h9rq2KfICFo0JoRzZqnnzQSobwePgz0tigY6CjmR8Ton6KTTKzKDS484oVx0Oo2W/UAmOyGBxFZbFfPcyVPHfP22BOCRoWZlKRMEheFY6rMpjEg1eFTDgo2mqVjgp+U0Bmh3tU8tVQqj6TNYgp9jfMUC4sNET4HwGaxRGEPHAnGT/+9W4hNGh8lajK9Bt04kpmLp2J4ZfwPmzFfeZSmiiAN7m5jUCgzRMzK69S4RjpstV7YQ/WTb2C9/Ora/WNFH27M6Oeva3ieJXoBDA1EhCAWoyJE4qFu1ipe7wiRubCQNj3JMPlTDyHJ+eEeTylvB3vN+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA3PR11MB7535.namprd11.prod.outlook.com (2603:10b6:806:307::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 08:59:02 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 08:59:02 +0000
Message-ID: <359fbacf-ff1a-4750-89f2-0243ae8e3aa2@windriver.com>
Date: Tue, 12 May 2026 16:58:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH V4 2/7] upstream-stable-release-point.bbclass:
 add bbclass for stable point upgrade
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
References: <20260512032614.2814369-1-Qi.Chen@windriver.com>
 <20260512032614.2814369-2-Qi.Chen@windriver.com>
 <CANNYZj-0da2o5EuriBVvxGB9=+G_Gro98ZyW9BNzA=6ciPGPpQ@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj-0da2o5EuriBVvxGB9=+G_Gro98ZyW9BNzA=6ciPGPpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0127.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1::6)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA3PR11MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: d9f074ca-cada-4183-596a-08deb004b6a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|11063799003|22082099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	S5i9koQfOd3XtQvS5in17gPTTLwd8HO/1/MTmW2IU9rqYr9kjdRHbRzVcL1nSeSSf9mOhDUYp8rdp6qTrkWPS074fCqBciALSvGWz51tACy12XWpsMRT6BNe8Lt3XSVmQENhDp6eJPuTD6qCzrfK1/rEBr5KufglInDNA53TjpYdNcRkeZ0G85rjjzHb5yHAie1g+fjH/dcf12wYGiP737ave5CsfXN4gXUefG9538uIjj9MmBe7FODKaK6jEDn6Kuv/J+xgV2Mhi9P/w5NyO7Wp+GegM7/2Xu3b22b+0vKqyhVp7y8oPiiPWSRxm1DsEyhh2jDzmDLM6iXvly97tIwj0W2q0k9vZQZl6WL9QNMaz7r1t6/JZhpiEMmXJvkahztadnFaxubfpxbzBadTon9flwOIaN5fL/l/9SYulQbluq+lvnan8atkOTAMNaFQ70wFEZBFH+XCPIYCjrAUg0jantwychl+Hm/1Vv4aTGEu7ryZR1pz11hE2CWpmneEJN13WqEpgGB1aouEIzQovjHBoz35yqG60pgM3ODX9BZiGiTOQ9lPuoFUyFE7DfuVbFm0xYhUA2l57n2LbDjL6tnD/IRNjxxYVqZykle3HqOtrma20f40MjF/5ylxKsDEJSHK9ZvSOOrACMTbBTm3OX4cx5RrkqFeF14DQA0DgpW8rjZZhvXvFPkZDtLVjZ/k
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(11063799003)(22082099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SjdlK1g2Mk9QcE1zTU9MTmQxMlpBMUNBTzZWM3g0M3gxUkhUY2FqQnFEOXhE?=
 =?utf-8?B?RlpiUWx6NHYyYUF3Z2VzRjl2REZNQzlCczZZcXc0Y21ZWGw4emk3Ky9VQmpE?=
 =?utf-8?B?d1FHeTljREJaUi9Oci9XcnlwK2pLcG9pZUZWajFmZzJpaW5DbXlQSTVUNEkv?=
 =?utf-8?B?MGdLMWlnUlpLcDA0anBaQkNQL0dSd2dkRjR6dm5VMEFhMXN2Z1ZqQkZOZHp2?=
 =?utf-8?B?KzNBUXc3MGowb29QV25pUEMxbHd3QXRLMlNDREFxdGtPQkpTS3JLKytOQzhz?=
 =?utf-8?B?dzFIZTRvQkQxb3lRTy80dW00ZnhWM2dVS2xsdHJDSEpOc3BYdjIrNEs4TFF1?=
 =?utf-8?B?V3Y3bCtDWE9yd0c4ZXE2OXUzZlMvT3Vmc3NBbys0Q3BqZjlFM3o0VjkwcTVZ?=
 =?utf-8?B?VTNwSHUySml2UW5lU3c5WjVKb0ZaQnNMVkFuZ3FTSnZsZ2ROSkhvdS9kY1Rl?=
 =?utf-8?B?QzRMZWxsU1UvRmo4N09vZERQc1BtTmNQMTJBblVuOXpybm8rbngxYm1MdDlk?=
 =?utf-8?B?L1B0cEVKZnBsWnhlTm15aWlQL0ExR3JDMDRNRUxPTDhOWXpUM1Y4UGNFalJS?=
 =?utf-8?B?U05hbWphd2JQMFZEb3FIQnlobzNYOFhiY1gvaXRVdmd3TWZhcUYvNHg0ekFT?=
 =?utf-8?B?TE11Y0J4eEI4b0tPaEluUVp4VGo3SFlNMEgxbHByZmtJU1hYNXJlbHh3b1E0?=
 =?utf-8?B?bkswdTd6WXNCdzlSYUtxb1MrUGw0emJHZXZLaWpDZmwxakJuY2gwUlVjeDlt?=
 =?utf-8?B?QUZaVGtWQnpodDVDMDZxWHRTS1FsNEZFeXVGK0hRMUdIMlRna2dIMVhZREZp?=
 =?utf-8?B?WTR6c2FUSVd4RzhEK1RybnRuWGF0YWNNWXo3ek1ySXlXSEQ3NVpOeWJ5QW13?=
 =?utf-8?B?Y2xxNEprejhWeTU1aUNpTWx4MHFBNlNQYm9tTHM3amR3VUk1ZG9jbWx3OG1H?=
 =?utf-8?B?QXJoVFI2YmNPMU9DNVJaQVRVdXpvaWpyaUFPVzZTZFh2QldVT2lOS0NZNEtS?=
 =?utf-8?B?TCtWL2duRTVUbGlNZTdkR09sbXVEcnVySXN6bG1FTkczRlQ0MzhpUlNLbWhp?=
 =?utf-8?B?UmxMd25pelFscllCbHV0bWNYOWQ3VWx2cklmQVNmOGwwUHJteDBjRFUxQTIz?=
 =?utf-8?B?Ylk4SzdpcGdKTkkvczdoc05hUXNVbmQ2UiswOUk5T1A4MjZ2YWcwRXFMM3lD?=
 =?utf-8?B?MUFlbG93RDFIT24zWmlJZTdWWjlWVFl4cE5pb2pVeWFvbUp3K1R1cXBXb1pt?=
 =?utf-8?B?a3JPRE8wMXcxS21NTXg0dFUxQXZ6V1pON2ZOUmtycVVmVStTWE52OXMva2hw?=
 =?utf-8?B?eE5CTGRSRTFMZ2RUM2tpTVdYL3RGcy9oM3pyU3BBY3FncnErYXlqQzYxNVg3?=
 =?utf-8?B?TTRlZFQ1YkJmaGdLRnpoeVZwZGVCV3FuWDFhdUpiK3BkS0kzNDNESmNRMXNs?=
 =?utf-8?B?Wm1wOU5PU0dTdUN2cVQ5alNhNldxSEI2RW9UOFNncVF4M1FOazZ5bXAvcEkr?=
 =?utf-8?B?UzF4eWZVRWdQMElyeVpsS3oxdmF2QTF4cE5HYlBHRmlxbStBamxkM2pPWUY2?=
 =?utf-8?B?UGhHdVM1ODJTcnErdm51c1gvRW1GS3NWTWtwQWg1bzFvZzgzd2xTSC9yTXpi?=
 =?utf-8?B?emcrcTROY0Qram1CU1VIL2RvT25CTy9YN2hGZnE4Mm5PYkM4VFAxcUtqcXR0?=
 =?utf-8?B?dHg0dFM3RllTU0lFMG1JY0UzNnR3NkJySmtabnFaTzhZcVFMVXBJekluUFpZ?=
 =?utf-8?B?RzJxOW1Xa2NGbVVGc1ViOVJSdHZFNlJyUy8vOXcvb0szeDhjaW9vNGtRVlp6?=
 =?utf-8?B?NjJZMEZNajdYOGtsTWVpekZYdXdBOWtDMEYxTTA3ZDJBQ3U1TDlUVlJZQTRN?=
 =?utf-8?B?ZC91NDViMHc3SnJHay93VGdJMlFNdGNQdWtYd0xRTWVvcGdEU29ldUJZZTBi?=
 =?utf-8?B?eDU5Szd4OXVtcFRRWFlJOWFmckhqYnRyWmh0Z1FkT2Jta2UyMWtveExRdVB5?=
 =?utf-8?B?QXhYTTdZbTJaMEc5VkVSSmQxVHBqdXVVbUxNYnlNbzE2bHFXT2liUHRUeklG?=
 =?utf-8?B?THlsNkRKZDA2UjFvaStmSmNvZHVqSU5kVURlMzBmMFUweUNuOFBDU2NjZ2pK?=
 =?utf-8?B?N0p1eHJQMmhzb1BOTkNIOHg2Z0RnU1cvS1M1eTNvaHJGQitxMURoSHJOSUJ4?=
 =?utf-8?B?T2JkS3RMR1JHWU84a3UwWXV1SFNOSWJZaHZYcTJadys5NzkvcFhUY0lUL3RY?=
 =?utf-8?B?WWY2UVR2WDNLTFZQb0tkam1GN1NpVjA4TklKVXNqdTdZZGRRbUtsUHgyL3JD?=
 =?utf-8?B?M3FxNmlyV0xPT2hla09OYkdaM25QdklPWFd2QkxpeHRKamx0cjE5Zz09?=
X-Exchange-RoutingPolicyChecked: 
	CF+7iy9X55o39jfbORo2mm44un9rl1ZqVovE8WpMpkcUDfqYwyF3kuWC1vvTrs/MBBkrbt1n66pWmxjgHGBT7PlQDMi7vUuQ6VWGLlPAr3U8AgAgOlKoPMNG9nYSj6Nr/vaCccvZCJ3/SWlk5d0I9/5WlvjRc05GIqG8Eb3n4D0x2zOs8HEYWhpvT60HdrTb2ELJpcQldrXSkEY3CbuIXYAMxyCe6GDRZs6j1WUMKsPzdQWLdP74M4ug/GCQfHXdHpkay1vjOzImvFg/3eoZIsNyaQqREFDi2zti43v3EDGk4W+nQt8cSd+iwF8fickAuqn7elSC0tDnNLtZXgWXSA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f074ca-cada-4183-596a-08deb004b6a1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:59:02.6904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LPnmpECDlsfsNHLLKalXxKYXP4Vy5q5V9mmk0E6K4YGJKNXuAgNNfZUkyQEz3K4CpgqJC+sTeQ8wlQHlu/Zi1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7535
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: qmbiEvvnUYFW4CsxeIrU0x4lJ1u2eaqx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA5MCBTYWx0ZWRfXw5PwXCQqP3DL
 EjJpZkt3FptK/pFxNZse19qXZYrElmUNyFYPdPRiTTR0nckhxBsH8BTC0L0ujHC7WhUQ4aFfH63
 EHyzS7bsKmj+SPPYNoJnEnJtREXeLygJcaDRivawP0glOG4pvitcmqXA3xHEa8XLhntCfMdg3yZ
 Up7o3dgqscgr5+tD553PInxSLJWpwg/XRNxyZ32oMKA9Ml06uWBsbqYT+OqTX36Cq8mpKIrW/hi
 l/TU2VHkljjIqy0Lay0tCs6OXzaFNvhK64xf28ldgHMPTON3rxe13xNot1lD/WERKqVW4KAi25E
 8ToODBBci8zyev9TLKvyif9UmzrmQ2IMOrKiK/VzNWsz4VTfCdEaQmhR8l4wP3Xuni2YXiFbfQk
 AFartcwzSain2iO2buC8tF1mtzzJHu71I/QpwbGBDCbbCTlnce4gG9NT7U/psiR7zc2Dlnw02KU
 AE3ufEzSUV3Vwkk86Ew==
X-Authority-Analysis: v=2.4 cv=G+Ys1dk5 c=1 sm=1 tr=0 ts=6a02ebda cx=c_pps
 a=ETG1guYRlgXENsW4hp29Cg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=t7CeM3EgAAAA:8 a=gUfpZCx4jqKyF3DFqSUA:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: j0iMGrjgy_kjnzeOwTQsOLclE-lhDrTs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 08:59:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236862

On 5/12/26 16:21, Alexander Kanavin wrote:
> On Tue, 12 May 2026 at 05:26, <Qi.Chen@windriver.com> wrote:
>> +STABLE_VERSION_REGEX = "${@get_majmin_version_regex(d)}"
>> +UPSTREAM_STABLE_RELEASE_REGEX = "${STABLE_VERSION_REGEX}\..+"
> I think we can make this even more universal:
>
> UPSTREAM_STABLE_RELEASE_REGEX ?= "${STABLE_VERSION_REGEX}.*"
>
> E.g.
> - use ?= so the variable can be overridden with a custom
> recipe-specific expression (that still has STABLE_VERSION_REGEX in it)
OK
> - do not require that . separates the stable series and stable release
> part (this will allow openssh to inherit the class)

If we do not use '.' to separate stable parts and the other parts, 
recipe with version such as 1.2.3 will also match 1.21.

The name of this bbclass is about 'point' ('.'), but openssh separates 
its stable part with 'p', so maybe it should not inherit this bbclass?

> - do not require that the stable release suffix is non-empty (this
> will cover e.g. systemd when there are no stable maintenance releases
> yet, e.g. if PV is at 261 but 261.1 is not yet out, then 261 will be
> reported as latest stable release, which is more accurate than 'no
> stable release was found')

How about:

UPSTREAM_STABLE_RELEASE_REGEX ?= "^${STABLE_VERSION_REGEX}(\.[^.]+)*$"

This will match 261 as well as 261.1 but not some other unexpected versions.

The regex starts to get a little complicated though.

What do you think?

Regards,
Qi

>
> Other than that, looks good.
>
> Alex



