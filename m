Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C64FB5EAF
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 04:10:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69105.1773720630670009514
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 21:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=LJuCivDH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7536fe2076=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H2AHvH1096998
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 21:10:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=wVVtlJWD5QkCYy3evlaA8xAqBwNtoEMY/KMKBHUsk6w=; b=
	LJuCivDHEu7PFlZ7HAwDuGc1HK+JRoJI978zjbC7pwQcl3AAcUigzRnmXbu4+ClE
	PAKxtog5ptbtI1gRxDDIyX6pdyCglLJV0nXyM0v9izk30thWHJzWEJgfkZ0xZOnB
	ZlK7wbWKK6Y2viCK57oNFIXkb7KCU+rV+h65PHzf1o0x7+XGdZyQFhXCVJgEYwnJ
	7NBhWUYlp6W57GKdyY1iZCIjaJnDQwy09wYbez/GRFVYiyzOCmBPERLQhFTv7oWi
	5W0lCcQPaiceeFwDGJ25Esw3e5cs1tcQXNifTO3LjA82kv0uvofhBPwqevfaU0WM
	RJJGJli4/lEwTQJRid26jQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010041.outbound.protection.outlook.com [40.93.198.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw76dthwq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Mar 2026 21:10:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZG5Z98HJMwikWRC0ctVRpESidYBIZQZZw/zQVWwRCbGp8NxKKOIJ4lkYyvY1A5wcBkuQGPm07OI4Ub6GNSsRB7V41kGSrm5UreAFcHWWfZ/DJQ7Vo7Ezj1mrqO25Tue3fXzRpY+uuMNppitnUyPC6iZDjqX1ayLyA/Oefry4AS6wE3nl069+bBKoezuwgH9Y4e8iSU4gMm51xmsU+JXdUZumO/lrjFjD9TNFXFJjyK2BxAyshEN6b1VB5wL0qgroGl35VN6DSDM+0Gcj3XejxXxvtGCx7SeR7jTahlFOeA6R+r5pLiq7tmUOxNenyY93fXYw1Wv67ttF/t/kX40OcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVVtlJWD5QkCYy3evlaA8xAqBwNtoEMY/KMKBHUsk6w=;
 b=fPeP1qAatGyOb1FYtx9k/e9JqCPkecrS2cFE490wDhmyBrYrxgxXvm3SueZV7TwdruVJ5XSr8OkggLzzsiF85x0lw2bMoY2ziCW7jZvrsqo11YVD4IuzZ0AzZk7a+nB2RoYBZKpGF/aYQqn+rskU4wOzLgXqvf80zWn/MPnpkRLl14em5vlkyCeXZZu7JYmKsZWmUCqDKT+CYxoaovTpDl18u4lXbXt7v2WDNrb4s0vh54yZ2wZXOk9lvuRu8m2F7/sqDoa7hm511QZsPjcnZbOfYF6r7445WeMyRSKkBY/3GBHWnD30LkB0XnynQHMj5bNxht4wwrnTPXDHb8zmTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DS0PR11MB7412.namprd11.prod.outlook.com (2603:10b6:8:152::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.13; Tue, 17 Mar
 2026 04:10:26 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9723.006; Tue, 17 Mar 2026
 04:10:25 +0000
Message-ID: <8e26998b-52a6-4d5e-964f-5f4b5c09b43c@windriver.com>
Date: Tue, 17 Mar 2026 09:40:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] rust: Drop
 oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Sundeep.Kokkonda@windriver.com, openembedded-core@lists.openembedded.org,
        "Marko, Peter" <peter.marko@siemens.com>
References: <20260311132658.1230334-1-Deepesh.Varatharajan@windriver.com>
 <e4863d03-6c88-421d-b613-d846818f6a54@windriver.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <e4863d03-6c88-421d-b613-d846818f6a54@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA5P287CA0239.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::15) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DS0PR11MB7412:EE_
X-MS-Office365-Filtering-Correlation-Id: 23d28127-7d3d-4fac-5607-08de83db1d9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	tSQWnJXFljB2BdfmoLgj4F7XLfXK+i15pCsCxeTGTzB6XAPIjOCK3NKQrgyZb1pQLIdM+ppVFiP+ZkUJ1vHeXeKIH8WF8CKD9F654rDdiaPmCxCE062EzkN1C8Z/VYlWco8EBgKW/s1+h4HA4E6ekoelPTo77RVLLn0beZm0jgI420YcM8SV1Fvoe2/5gFpws4x0nvPb1Bh8wYdOxqCjfufQAwMtK1gMLA0OkoGs61WC0/jzISVtHoNKCyl58uinvqIT0Mi97dW3g1giTY8w5fPFPi1XMZMpv0oTK3u/oSmGlDk5Av0xy/MqyhzhZI6qu30kMJ01oodhlOUE/TzUdrXVPXJvlyw9sFv9IHJ3J8KztcRoRo859FhLHFbYSs6XVAbsEWoky+Gm6GH7Dg34H3jdEGWeuES2hFEllLmqFanRmieAXk03spZNo4Iqt0bj1+9hajf204qWC8WdOYqGMVz06Lzhqwf1Wyfj4WnuJNdC/FKdtUse5m+DCknEVc2V5zmhb2nnTj9x59nyW9hlsrdwI4aqmZnrIWyGnaRLAlrMxpwSzVvO1Kwy08d9zq2y9rmyIipArhCJ6QR/PljxycAD3YQrpo/aA4MPKeycTBGu/mGu78SBvGaYxF3EJZwzEQ3VIOs3LObvVI+e2/lGNrKNZ56K639vMttTyXimqr3G2UBiNKKUVND3H0Jfm9WH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R2dRUWlUZk9NZVBORmM4M3BLNm05Mlc2QzlEaGR4YTZDUDlPZ1NKY0t0Smln?=
 =?utf-8?B?RU1Od3F2dXJLYi9XL2hXcFZJY1J3dGFXSW0yUXVDdVluYndScGRDSUpOR2xU?=
 =?utf-8?B?eFgrbFA2R3VZSXUycEFzbXRyb0ZXR0tvVlZxYk1yc1l0TnRTbGJ4aEZvcTF1?=
 =?utf-8?B?SlhVME96b0VnRVMrc2hrU2ZsQmUrdm9tRXJwZTF5UG5KVXJZdDZQMW4wVW4w?=
 =?utf-8?B?WWZJYi9HZFVnUXZQUVA3UWNlVUFYa0Y4cytWNVpQd1RCSVBJbm1WSjFBa0Yv?=
 =?utf-8?B?NUh2UnVmZmJ4Q2Z2S3QvV1orZURWRlA5SG9lYTNNc0YzZWRmSUZtMWo3S01i?=
 =?utf-8?B?VDh6MytEREMwa2Y3TVVaalcweWNldExhY090UW1LRWtMU09ZbUE2bktHaTIy?=
 =?utf-8?B?WEdhMFN3YmdRVldHQTZYS2tSVVhmUE5pRnNpQkJKK0JFclZDYm5aamM4T0R3?=
 =?utf-8?B?alpyTElWWmlyRWRQNnR0bERqVFdNaTJ2aDBGK1J3TFloUi9tcXR5KzlaeHQr?=
 =?utf-8?B?ejE1RXQ2ak92a0FHOTRVKzNwQjBUb2pZTFRhWGdlMEZkUW0wY1NNNnBWK0pD?=
 =?utf-8?B?WnB5d2lPY2s0N0ExOStXaUNDVEpaN2FyMkNvODR5Rmh2dk1VQVd2S2g0cnV1?=
 =?utf-8?B?b1QzTytMNUNyS0JmTzZtMWlMMGZzL00zRFV5ZDBhM2FWTmk0ekEzZnZVb3dQ?=
 =?utf-8?B?Mk1lc0VxaktqejE2Tm4xU3NyOXZuc0tqd3NUY1l3SlVVUnJiWE5Kd3dFUUsr?=
 =?utf-8?B?N0ZTdTFoUUFNNlpSZm1tNTlHRWJ4aXo2WU5JSi9HRnlLRFV6YjRwMW9XQTJz?=
 =?utf-8?B?b0NrMjNwZHZXVzNyWWZ2L2ViTEcra3UwYU1iUlhnSSs1MzhUUFBjemJEbzJv?=
 =?utf-8?B?aGtLa0NVRnhCWHpXb2kxMzFiNHNtUkhyaFAzZElTc0oydDBkOEY0ajVsYUJO?=
 =?utf-8?B?T21KdzJ0Y05QZWU2NWRKZEtaOGUyOG9DUlhuSVZsVXg5bkxhMllVUlRYdWdj?=
 =?utf-8?B?a1ZnaFlKVnRqM2dLeXVnQlQ1eG91b3E4V1AzQXRBREJDM3VDNGpTSmhPeklR?=
 =?utf-8?B?NHEwcTBGdUI3NlMvV2JMSk9XT0F5SnlFUXozWmZBSm5JSnRmQ1I5cTRoRXUw?=
 =?utf-8?B?WWg3R1c4RGh0Sm1iZWNsemdwMUJzbEcrd1c4bnhxTW9rUEJHbDgyT1lBSElM?=
 =?utf-8?B?TzdwUEFpRW1QaGQrczhRdy9XU281aU9CZmhTZFNsRjZ0ZXU1YVE0LzBNK2pz?=
 =?utf-8?B?K3VvN1NUOE1udVFyRFdWMVN2WW1kQXM3MUJZdi9yZzl4UGsxYVY0Y1RQb0k2?=
 =?utf-8?B?bkF3WjNPN0N0aGQ0dzZmUERJZlhFMkRFd0pyblpobU02cHhOUkErZktJd3Jz?=
 =?utf-8?B?bDNXd3c2OTRVbEZRcFFzWkg1NzVkeEtzR0d5a2ZyV1ZyNVlHRjl5cHhua3g2?=
 =?utf-8?B?SEVuT0R4bnR1REdUMXBxem0yL3dyVFlzV2lXd25aM2Vsd3ZubEJQL0F4bENk?=
 =?utf-8?B?a3NUSTVld0g2NFZZY2o0azQ3SkZjdnR6R2s3dTZ2RTY2MzYxN2ltUFNza05H?=
 =?utf-8?B?dkYxS2svYThyeHJFYVFUOHcrc3lrZTVLdmg0VmxreTA5SGpKR3RiRW9xOS82?=
 =?utf-8?B?YlVGODA5S0swanJ6WUhocExPSUJlL3NQODFHeE1jZ2VIM0lDaGJCQkdGZmF1?=
 =?utf-8?B?ZS8rYk1qUDVrVUVQblpXSDl3NjV3WGpxNnV5M1hockRIY1lLb0gwb3JWUmxz?=
 =?utf-8?B?dXVWdGdsMUE0bWxZUTRLQXNNUndnSXBxNGFiaXlzUzd5ZXZpa1YvUG1tak9D?=
 =?utf-8?B?aHpiRElnNVd6ekpjU0Q2VGFxTzZESkpRT0Z2ZWNMbHVLbGxCc0lRenZMNVo4?=
 =?utf-8?B?bWNzY3lNdUVoSEtGbmVoQ2hSRTFCSXdicHJuN0d6THlzVUl0RGM3VFAyUjJQ?=
 =?utf-8?B?Q0VjVmNvLy9FUWpNTHd6dTdqSjRVdUIxb2JDS0o2VEtsSnVUV0JuT1lUMmRY?=
 =?utf-8?B?b2hwMzZ2RTlRYUJHVHFmWU10dFFzRU9KUzdmWnlnWWdWZERIbW1KVGoydSs1?=
 =?utf-8?B?cTc5TnQ4a2Z4VG9jcERabUluRkN6SUpsZ2pYN2lEWFNkNnhrZnhnRkRkdTZy?=
 =?utf-8?B?ZzlFK21TQWRqQ0ZqSWxaS2ZqYXg1RmwwMWp2WnJnK1ozZGVENTRjaitLWjdD?=
 =?utf-8?B?RnhLQ01HanZheE1YRE92NjhvcGtuUHJ5djNLc3hTaGRNR0tVMDZ0YmJPU3Rt?=
 =?utf-8?B?eEkxWndpZjZBYWxpcVYrZ01PSFlCWk5NZ0lGcTJnNkEvNkdxM25vaDdKS0Zy?=
 =?utf-8?B?ZS9wZlhiczhzc08zZXdCZnRnNFloZGQzem5nVm9sbW55aFFaSUVkOFhmcmQy?=
 =?utf-8?Q?tWlH1JWDcnDYDX9hRzrPTvKvikjkMupK6Zjra?=
X-Exchange-RoutingPolicyChecked: 
	g+pE1ACRe5B0axYg8eqrCRf+7G9jeMlNuU20UASdEqx8/eCAj4mKjRLCgndg0w+BsXktss3ZcxZKLJAhH43HA5eXvyTQPm/Qtnle+urtzV61+mJZV2jW6KyyjUc4qy7/7lUC78mdDBF1AkwdFQPkrl88yI/AQGxjlApEdWcQrvMioL0LWsE8rzsHLY6qLSuZJyaM6hO8VTq14E8SPvqhm3R1al6o2mukGx65v65ReQqSsoEH1MD5kreCJhLczQJ9+UwoLlStb4U6iaHvPKSU/dnhb/Sl7jyTDuwafsrffF/VHLk61lK8Up132/P9dMx8QcUi1cftLU4btxlwQ5btyA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d28127-7d3d-4fac-5607-08de83db1d9c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 04:10:25.4743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZj/dzITaGFhoNfzpK4Yb3n2WObZTNGainUXXrGmAi0zB4u6o7Tm8vr1mISTbs/I7sOtsNmE7VuhKG1iUa1XwMVsMGzmdWym7HaeqHVqCXeg3VYVF/IdL57qR7Av3mes
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7412
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b8d435 cx=c_pps
 a=GhmKEtzeB3JP3t09wzqP+g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=ei4SEBeUAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=a_U1oVfrAAAA:8
 a=rhgUDnZ7qHsVfPYMRCQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=8zIOOLb7Ym0NljyPXbuS:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDAzMiBTYWx0ZWRfX6n3n3cgh2jnc
 5CrCTPvtgjlTLsQocckdRkzozEJAkuSZowE5880iTAC8GesK22fqGLkbrk2mrie7Ho3oP6c02jW
 d5L3mM1jV+Nay313wQ8Ks7L5w235E+c6YZuWQvkjpLtR5Y4OkeVO650db8ti2X3bHkV9uGh2pTj
 RrLupHvF2c1OGQTX9xnjs21PPRqfatPmt/df+tuF792cOy1aSLKJxkywTOO4qCkP4mmvzVeBCIx
 5wyEQE+5FZ0O12jvfPzntjxgA3IY82zApfq4hBBtCUYCE4ezS1gak9QfjmJgEgiHuTyVYQheeR9
 cbWzkOUvsR5P11v8FQYWY6Dep6gR621GgB6fYxys/ccXrMnLV7TOlzHeKXv/Bk/kXyfR3cv7nLm
 zOeB8/1m7fe3E0GX9uxL2f3OxSQ9XA67V6oTlPibTuwKzgbmjMKOzSyJqWvlMGzGBY7glz69kIV
 yySbJ1tHirG72ezesEQ==
X-Proofpoint-ORIG-GUID: jK8d9rTYvM20WWWmZu9MtSOiCh18jlzN
X-Proofpoint-GUID: u1luP-9s1Kdi8MDTBBM7SwOU0MZDNuk9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170032
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62H2AHvH1096998
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 04:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233291


On 17-03-2026 02:38, Randy MacLeod wrote:
> On 2026-03-11 9:26 a.m., Varatharajan, Deepesh via=20
> lists.openembedded.org wrote:
>> From: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com>
>>
>> This patch was originally introduced to address a rare failure on the =
PPC
>> target and with the latest version of rustc this issue no longer occur=
s.
>> So, this patch can be removed.
>
>
> FYI, merged:
> 3b5c2d8bdb=C2=A0 =C2=A02026-03-11=C2=A0 =C2=A0rust: Drop=20
> oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
>
> If this causes problems for anyone, please let us know and we can=20
> consider restoring the patch.
>
> Deepesh,
>
> Surely there's some existing data that you can point to,
> to convince upstream to double the timeout if not 10x it?
>
Currently I don=E2=80=99t have data since I can=E2=80=99t reproduce the f=
ailure with the=20
latest rustc.
If the failure happens again, I=E2=80=99ll collect the data and reach out=
 to=20
upstream to discuss
increasing the timeout.

Regards,
Deepesh

> ../Randy
>
>> Signed-off-by: Deepesh Varatharajan<Deepesh.Varatharajan@windriver.com=
>
>> ---
>>   ...crease-timeout-in-process-sigpipe-ru.patch | 31 -----------------=
--
>>   meta/recipes-devtools/rust/rust-source.inc    |  1 -
>>   2 files changed, 32 deletions(-)
>>   delete mode 100644 meta/recipes-devtools/rust/files/oeqa-selftest-In=
crease-timeout-in-process-sigpipe-ru.patch
>>
>> diff --git a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-t=
imeout-in-process-sigpipe-ru.patch b/meta/recipes-devtools/rust/files/oeq=
a-selftest-Increase-timeout-in-process-sigpipe-ru.patch
>> deleted file mode 100644
>> index 5bd1abffb4..0000000000
>> --- a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-=
in-process-sigpipe-ru.patch
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -From b4524278985f517b0785b6f64a21380dcf1ff096 Mon Sep 17 00:00:00 200=
1
>> -From: Peter Tatrai<peter.tatrai.ext@siemens.com>
>> -Date: Mon, 4 Nov 2024 13:58:16 +0100
>> -Subject: [PATCH] oeqa/selftest: Increase timeout in process-sigpipe r=
ust test
>> -
>> -This patch increases the timeout for the process-sigpipe rust test, w=
hich
>> -occasionally fails when the server is under heavy load. Increasing th=
e timeout
>> -reduces the likelihood of false negatives under load.
>> -
>> -Fixes [YOCTO #15625]
>> -
>> -Upstream-Status: Inappropriate [OE testing specific]
>> -
>> -Signed-off-by: Peter Tatrai<peter.tatrai.ext@siemens.com>
>> ----
>> - tests/ui/process/process-sigpipe.rs | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/tests/ui/process/process-sigpipe.rs b/tests/ui/process/p=
rocess-sigpipe.rs
>> -index 11f363d62..c12d66016 100644
>> ---- a/tests/ui/process/process-sigpipe.rs
>> -+++ b/tests/ui/process/process-sigpipe.rs
>> -@@ -23,7 +23,7 @@ use std::thread;
>> - fn main() {
>> -     // Just in case `yes` or `while-echo` doesn't check for EPIPE...
>> -     thread::spawn(|| {
>> --        thread::sleep_ms(5000);
>> -+        thread::sleep_ms(50000);
>> -         process::exit(1);
>> -     });
>> -     // QNX Neutrino does not have `yes`. Therefore, use `while-echo`=
 for `nto`
>> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes=
-devtools/rust/rust-source.inc
>> index 04204969ba..47a0154cdc 100644
>> --- a/meta/recipes-devtools/rust/rust-source.inc
>> +++ b/meta/recipes-devtools/rust/rust-source.inc
>> @@ -4,7 +4,6 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-=
${RUST_VERSION}-src.tar.xz;n
>>               file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown=
-linux-g.patch;patchdir=3D${RUSTSRC} \
>>               file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
>>               file://repro-issue-fix-with-cc-crate-hashmap.patch;patch=
dir=3D${RUSTSRC} \
>> -file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch;pat=
chdir=3D${RUSTSRC} \
>>               file://0001-src-core-build_steps-tool.rs-switch-off-lto-=
for-rust.patch;patchdir=3D${RUSTSRC} \
>>               file://0001-riscv32-Define-plain-syscalls-as-their-time6=
4-varian.patch;patchdir=3D${RUSTSRC} \
>>               file://0001-Update-call-llvm-intrinsics-test.patch;patch=
dir=3D${RUSTSRC} \
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#232879):https://lists.openembedded.org/g/openembed=
ded-core/message/232879
>> Mute This Topic:https://lists.openembedded.org/mt/118259934/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [=
randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
> --=20
> # Randy MacLeod
> # Wind River Linux

