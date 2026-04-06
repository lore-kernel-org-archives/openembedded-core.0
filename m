Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D33EF4ECA
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 09:56:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51786.1775469382625362565
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 02:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=a16jkQae;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8556cc1aa0=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6367kEef1446493
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Apr 2026 02:56:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=0LQYR/MuMfK9lpmBqJSAVtkquG9hKKqKFoTqjx7nb4Y=; b=
	a16jkQaeF1yek7RMZBBs06IyMjsJWCQ9BGdHQNkuap1enVS4SpTgbbvvmHyvvqLp
	kIxpSnKT3RvKbQG1Q9efhlWAUcC6e86EYlahjlGRR0HQmAjXr/AxWVHWgt4B5A/A
	8ZXXP0uelcVm33kCGNfoHCgGwLcHs8AtkZYfrbNupPRYtz2IZZlcOtziMqhzhjh6
	pmomR9VohBMVwOfoFiH5tvFuX7ge13gkdyeWxjkuaUfsuAbjTUgft9EOaMlzURkR
	Htt1f8ciKibVIP2GXXZXhq+V2fC889kAeb9qbakn2a+l43b69Xsyk/cIxQUuW03N
	7C1EdWlxBHB/yjQiUnOg2g==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013005.outbound.protection.outlook.com [40.107.201.5])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4db25bh8ru-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 06 Apr 2026 02:56:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4jnrJU2ccJAdQgSpUyMgU40nRWd6JXlIeLqEqkCpg77PBCI1rkfzhi216gSsES1+n17S++iDy9iURjQNMTNTag2NG/2EH0PDxu8onQ3dEpdDWVjgIEhntb3KTEvJyO3rHb0A6tTH6WcSthCdBzMYzCccRkMAsJZHon8qq1XpBz5gX7NcIllypqn59bEeYddYSVHEBgUmaeXjCcGsoeDUZisbPvRIeaSZ7Wx7J2vMsHczl+fWvoQzxwwrsSHKSJtCSMfDIE9IcqFLsnyKmaVNxsvwKQomtIyLTfALs0w0Qc++DljSj9aIzZTaOjA/MEkEdH+B7j5bc/ZD4M4KGfWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LQYR/MuMfK9lpmBqJSAVtkquG9hKKqKFoTqjx7nb4Y=;
 b=I16dJzwxZzfIuAxFaSqH9qFMHiKmdxdXPN5ROdIqzz7akscljVv/8iTcfpo/hO/NhJpu+PLSuT8jpatVg5GJA6TmX6i78XaNAWRu3t/d99t0vTz1tkWd/dfmNhpzyV71f2mV7cGdoLwPapWa7jQHyD+oLZrvUYwd4RZmHD2TauMI1ilo8qzI5u8SX4/GouXyj7rpEHtPk9RSjFCWZdVmUsUCHDy1ReacFKEFiTcP9FQTYGUw6IDFWPPxXFr7+jS6jpIZ2COHyHunGpIvsPTTBEYkl+susXY9s6gjDm1vOWHtfaTo0OjyBaOL5uz8qldjSi1HxlutHxcH1qaDbfrj3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH7PR11MB7147.namprd11.prod.outlook.com (2603:10b6:510:1ee::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Mon, 6 Apr
 2026 09:56:18 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 09:56:18 +0000
Message-ID: <9b85db42-8a0a-41a9-b31f-7da1ba0f5e0d@windriver.com>
Date: Mon, 6 Apr 2026 15:26:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] binutils: Set status for CVE-2025-69646 &
 CVE-2025-69649
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20260406070506.3779367-1-Harish.Sadineni@windriver.com>
 <aff85443515795d097949cedbf07bd2ed40d7372.camel@pbarker.dev>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <aff85443515795d097949cedbf07bd2ed40d7372.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA0P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::18) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH7PR11MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c70bf7a-7963-4731-556b-08de93c2bfc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|22082099003|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info: 
	14kEm/DX5TeD8N6jmoIEaA1pFJAjGudtvZ2UDd0vezFLoD8nLPtmLCBLa1Lt80xgi7MtYxYqel9k7ZwdEoHXuRgUHepTUzLbDKqseVm6otLLN+JBMtBBazsUJH2nKrenqEaC4TVA3/TneJN1CBhGifD4XRKYyAA8eiRxqqiacnQEIfQrTC+ozoKpaO1VDX22XkH0CNl4V4U+Cxxp8+gBSHfhRaIFS3ADp4vsoel5oSTQfaB8+OcXwJA/idaVIjI0jSv3d+nkSYHDo7jCWafhhYBQAdG9c0gQYVlu73ObOZo10pfmYB8NSQPKbKRBjQixqWT8qklCWiDO1bbpRQDHtbN0zwZ2mjCO3wJwsxp70dMPS9AzhUOcCt3fHrcFW2qciPARAMvTjZ8+UWbKhXBGPXZetJTC/N0dvgIRwfYHlEwvYJlV6RG1RnYHyMvH17luUUV0JuKSL4EB/Sa051zYaRT9r5e6Cic406bd0f4SORa6Zl4poiT0e0reCKB+ATDzh4cyv0ttwu8HkMPON4T8dfGybKdVSvtme1y1204tzeXg/Muf1SQt53DNRdV89R5C/pPNwH3EowfuGC7GfeHGOBN5M1yi5Sapw9oWRJ0oHTp0+mcu8lG/ZHrii1GSQ6EKvd00POWgE0YEuHBoT1lB2c5MgccHVB05ZkY20RtGUdGOzVlCrIyAFy013Yqxz1I9yrI314jwnp2eydLULI8d+8VBHadv4vibSnkTyquNXEAOc9kshxThhvCMdB3VYCDN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(22082099003)(18002099003)(38350700014)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K0piYVMweFZUNUFHSkdrbEFSN3ByWTRHQXFFMENYdlIwTGM1Qi80QXpvNktw?=
 =?utf-8?B?UWUxRllXaUhCMUI2UFBhNW1GZU45MkJYNDB0LzhTTVduUUp3bUtsMGlyeGFP?=
 =?utf-8?B?eXRZYTVSN0xhQTF1R0ZiR1NzZzZTT0N1VUJUOEdOVGdtaG1TbVBCMTdwVWlO?=
 =?utf-8?B?eklxd0Z2bUxDV2VGWmp0blNwOWszNlZjZDJnMDF3NDR2ZzlHRHhoaVhnUzR1?=
 =?utf-8?B?c0JsUDRkaHF2czhxTXNnL3pBVGxMM2tuMFZaUHJ4YWJoc1FVMlN6SHFTMkdr?=
 =?utf-8?B?YmFiRFNHUjZXMjF4WHN3Y0pRNGgyVHFiRGRmVXk5d1VES0REbkNKSmxLS2J3?=
 =?utf-8?B?UENkdWNVd012ZVhnZXNoSlRPdnpzZmY3dWhPWDRtd0RwQVYwRUpYejBEYXJI?=
 =?utf-8?B?Vkpib09lTStWTmE2TlBUTkZiMytxT2tVcm1iemVNeGY3YlppMEhBcEJCdUVS?=
 =?utf-8?B?T1hCTXFFTjBPOGF2ZVRhNmFBTWlIQnpxaGYxb2hnemdzU0FiMzZlTlV3NFdy?=
 =?utf-8?B?R3hQcDU4Y0RuZzNlN0tWRlRldFRrbURPdkp0QzQxRnVhbGJOZzArRWNlYi9x?=
 =?utf-8?B?ZTZRMUFKd0pMajIyLytvUEUreStLbHdLZGtvSWJIMWFQajVQUkJ5clVFSHRV?=
 =?utf-8?B?SUJnMDlnMitSUm9hek5FUmo1TzZHa1UraCtzVW9Rc1Z3U2RVMzYwWUNOWDFP?=
 =?utf-8?B?SXczdURCZk01cTdHd2Juelg5MlU0YW1rWjMvRG16WXZqTGtteHU0bzN5bFJw?=
 =?utf-8?B?b0UydWpKM0xreTErd0pQS3NsWFBpU2tWWURaejJ5M2RFc05xRFpxUDd4ckdY?=
 =?utf-8?B?UmZqY3VpZDFJa3lVUFl0ZXBHUUNiN20wSnhhaHZzUHluZUEvY3pEemJqU1c5?=
 =?utf-8?B?S1ljcWxLaWF5SUpsRlZLdGNidnhqeFpRZ3hod2RwbndXNnJkME5Xd1N4bDNm?=
 =?utf-8?B?RXpXdTZCdklQcVdlcDk0SlVjZmFFUkJpdFgxT3N3OGlJcXJldjE5RzFFQk1k?=
 =?utf-8?B?ZlJ5TUliaHhsU09kZWNuMGhtQWhHdk9UZzJtcjc5VWtIUFNxV3RSL0xaTkFs?=
 =?utf-8?B?L0thdWp0UzFCVlF0V1pRL2lkMjY4WTlpWWZlTzBJbzRjSkZkZlFXMlUrVjg2?=
 =?utf-8?B?OXZsY2RicGhkMkp4UjRiUUdtRXV2aVkzQ01UNjF3dGhsR0UybG5sNFJwTG8r?=
 =?utf-8?B?V2RnU2kvTHhjTTdnejNodk9wSDVEVWJXYkJ5VzhSV25LQ3VtYTlTemM5Skx0?=
 =?utf-8?B?SzhDQ1ZlV3BkUVp4RWR5cElxTER5Z0FqOFBvSlJDYWNud2h5VXBJRFF2L2RG?=
 =?utf-8?B?THREbXF3VUZnakRDaEVxTkd6WWg2b1JtNXJzVTZrVXRYSlZLMFF4ek9KR2Z5?=
 =?utf-8?B?TG8vWm9sZW83TzBvNmV5aEtUYmM5emZsbGpWN1IwTHBNaUEyQk5QYVAvemJH?=
 =?utf-8?B?VkU5Q3EvcFVST21IdTZ3RWZqd1hwSkNRVDNobjFRQXAzVWFIQW1mbmFYNVZ4?=
 =?utf-8?B?clNxYmlLNTlGNkg2Ti8xTnJhaEFSM2wyemg2dTJERzJWK0tLWHYrV3o5WjRY?=
 =?utf-8?B?U1U1d3FVNEtUQ0RGTjEza3I0V3drbkJTcSs2QjE0cWUvZ3FzMGIxSGl5RFd5?=
 =?utf-8?B?OEtQMHMwVW5KdGpQZmhlUTRoZzYyVkpvK1QybWtZKzQ3Nkc0Nm5LUHJrUGZU?=
 =?utf-8?B?QU9CR3ZhU2tLRnhrWjBBSDlBQ0ZTM0hQcEtSRDNLOVkzT2dHazBDSmh5OVhM?=
 =?utf-8?B?SmJMMTFrcVc5aloxWU9iM1U0b01GeUF6OThiSlM0YmIvVjhIaHRFUE9iaWpZ?=
 =?utf-8?B?RmdYTURVdjdEZTNsVWRQTXUyaHAvanNSb0NlU1pRa3BENnlCbHpkVjdUa3la?=
 =?utf-8?B?MTdNZ01SRlNNVzNSNHBKOFZJSEhnOHpMRFBrdCtSb3BScGxYVDQvVnY4cnVB?=
 =?utf-8?B?NG9TSG5MZ1VSbW95NlNpWnp6UFFNcUM5ODcxci81NGJRbU9Lc3JGYkdXblFp?=
 =?utf-8?B?dllCKzNTWDBna2IvTDhnQWQ1RVJCcitScjhHdzhDbTNuMy9naUNOZVJzRHFW?=
 =?utf-8?B?bVVqVlNFZ2xXU1BZeVFaMHVZT21vN2x2MmgzR0JRV3l6SUg3TnhVbGVGbWZS?=
 =?utf-8?B?RDlEbUJVdWNEbllybGV0ZHZlTE81dmRaS0NEdTZnTDV3eEdlbGRaWkxXQitB?=
 =?utf-8?B?WGZodzdBODRCQlFTaHBoWmlKZ2VZTys0NERnSHNRNDNzNHFrdVdGMGltTXZv?=
 =?utf-8?B?RzV2TXVWTXdiQ0UyYnNrSURuS3JHQ2hJSTNBdW05RXNEYnRwckJYazR2eDcy?=
 =?utf-8?B?RmQ3RnhsNzd1MUM2Q1BDOVBzbjVmL2xiazEvdHBraWN2R3RwdDc4NjI0cW01?=
 =?utf-8?Q?o24Hi4cquf+IBWaU=3D?=
X-Exchange-RoutingPolicyChecked: 
	bxWBA6GEpMqN7hEx5/t1j4owbVkgEdkmlydefgo3x63avqFijC75CYCTwPvVrj26slA+rxIjshmYaH6h6K943CpyjavCUwvmaYou0pffulISmyxkWdhdWw6Wf41lgyn5d0fxM9IqaP8p5UZqYv2UStdFiqDwAptIl+BkTWf0AcV3cbSxkE15PyRTWxJfiNp786w/kjFya28bD+mPV27jU72EOU+xKWt7c5v8Olq2+4Hmzo/71zKxTd92LsgStALIjXlW9MBOyklkQFsKctuXZESWySNA3gUq661ivu6fYEuV83judJ+ghtB1D9kywLmyKtJV7JQHrPdMEnLQ8yTCcw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c70bf7a-7963-4731-556b-08de93c2bfc0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 09:56:18.4462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjZlecMDDh+IZwH4SbxqFUTj7WwF/e9/Np4VUgav6nMVF+WM7aaULxq4FyPMZ/AZfys2LN0jZwKDT20/lxv750VkA7RUy2srn1ILV69C11c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7147
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: ZSGJOhPOUq78__SSrHVjEM9Ri01QEdL-
X-Authority-Analysis: v=2.4 cv=LcIxKzfi c=1 sm=1 tr=0 ts=69d38346 cx=c_pps
 a=RM5EPw/H4l4S9ahloXzS7w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=PYnjg3YJAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=sBHLgKcWVGiXGU-EixcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: OaQImm7mivW5lyQm8_28Kp29bge_2Mor
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA5NyBTYWx0ZWRfXy+BBRR21jtHd
 OjmFOeqniotjw2Ld+A7EVenLNvxRG3jZW/iAU53rL6FF5HM+7LvrK2yxqK65mUCEueVKofrUCzD
 TJGfmWwMW1ljNTyKe+9MU9ZkvJnBhFYxh2U3ZhpwJl/rffow7rWjRS+qU04p2IQtNqui4QbQ1+Z
 W7lYT7YIRDotXqeR2Fvq+F0WHQlqzic6gSD1hEcUbFiR0mYvmi9hdA2KOrPpj9+TOnOGB3ozmMd
 XugTNplNTlKuD1KVjt5F593cms+74XA1DuhtTBSZNXnt3k8nSHcKrqAS93mQcer3jUSi3I4AkZg
 ToV2vjlcwf084aYEclakXElFLD5Hlgaj8ebfiUbolbCoUEyLMTxGYfUfn0NMbGSOhM7/cCqn6df
 0qbT63ZbcFvcHZKkPkdwqYRO38PzbDxtvCn4Pyp7QU3acWzrbs4Aw+xGrXS40NIf6GtyoHtLqJ4
 rRFikF7nY1EN/og7upA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060097
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6367kEef1446493
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 09:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234672


On 4/6/2026 1:58 PM, Paul Barker wrote:
> On Mon, 2026-04-06 at 00:05 -0700, Sadineni, Harish via
> lists.openembedded.org wrote:
>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>
>> Set CVE_STATUS for CVE-2025-69646 and CVE-2025-69649, as both CVES are=
 already resolved
>> in the latest binutils 2.46 version upgrade.
>>
>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>> ---
>>   meta/recipes-devtools/binutils/binutils-2.46.inc | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/r=
ecipes-devtools/binutils/binutils-2.46.inc
>> index ff10050dd9..dc8b6be03e 100644
>> --- a/meta/recipes-devtools/binutils/binutils-2.46.inc
>> +++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
>> @@ -34,3 +34,6 @@ SRC_URI =3D "\
>>        file://0013-Define-alignof-using-_Alignof-when-using-C11-or-new=
e.patch \
>>        file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofi=
l.patch \
>>   "
>> +
>> +CVE_STATUS[CVE-2025-69646] =3D "fixed-version: Fixed from version 2.4=
6"
> Hi Harish,
>
> According to https://nvd.nist.gov/vuln/detail/CVE-2025-69646, the CPE
> for CVE-2025-69646 is "cpe:2.3:a:gnu:binutils:2.44:*:*:*:*:*:*:*", so i=
t
> should already be seen as fixed in 2.46. Which tool is reporting this a=
s
> an unresolved CVE?
git branch -a --contains 598704a00cbac5e85c2bedd363357b5bf6fcee33
* master
 =C2=A0 remotes/origin/HEAD -> origin/master
 =C2=A0 remotes/origin/binutils-2_46-branch
 =C2=A0 remotes/origin/master


The above git info (and bugzilla) shows that the commit id got=20
merged/fixed in 2.46 branch. And so it documented as fixed from 2.46.
And, it is not shown by any tool as unresolved but we see CVE's status=20
is well documented and maintained in kernel-recipes
https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/l=
inux/cve-exclusion.inc
So, We thought of maintaining the CVE's status for toolchain components=20
from now.
>> +CVE_STATUS[CVE-2025-69649] =3D "fixed-version: Fixed from version 2.4=
6"
> According to https://nvd.nist.gov/vuln/detail/CVE-2025-69649, the CPE
> for this one is "cpe:2.3:a:gnu:binutils:*:*:*:*:*:*:*:*". Please includ=
e
> some info/links in the commit message to confirm that this was fixed fo=
r
> v2.46.
Ok,=C2=A0 I will add the commit reference in commit message while sending=
 v2.

Thanks,
Harish
>
> Best regards,
>

