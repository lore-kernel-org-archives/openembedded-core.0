Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533EDD58B22
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 04:34:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44035.1773635689507195294
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 21:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nVWoyugV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75357a93d8=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G3fZcB2989999
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 21:34:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=EwWbYhUYBi+dAkUoRaFypT
	x0L/j2XAhQdew3LmRB1so=; b=nVWoyugVQVLH8qpBzQS09cLUUTMEXLozlc4mDC
	d7ul9JUv7G0gN9Lt8jdJBVfp/IwWV0pbx9oMPP+t3J3O4xJlH4PKsO58lGHwOmsL
	DvG6M9N7q/Ky5Lg+AAKHtCQOR9KEsEIOKeWmq8sFpPWsUhzp2dYHYICdww7PXr0+
	VMPMI0sc5bikSQEtZIMmlTcK7Rn6jttuRx5xsMWuJiz+GupDeYogNtaghHph5+hm
	/DIt9zRPSeHPh40WI4F34R3HcevGqPNGcw40SdOezuUMxekQpF4KhwAzwcfI8tj1
	4v6NrFbSfxWE/31SthQrYzNJtP58ANbS0WolsTQilWjbxj7A==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010065.outbound.protection.outlook.com [40.93.198.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw76ds8ax-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 15 Mar 2026 21:34:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGtyLMPApWdUOGqG35kMxBv9vDGIyKhV77mp1Z9zD3Ve/stu4fUnpN8JWIpXb2DGKHnopYf4DthoGpvCbZDUUWP/ceTcVIprRhcKn3SaTynAvCChCoON39xHh8/y9xwSlB4is88U1adfb/M6E8kbHjmFrdBtBa0U7yf7VD+uPcJP96nH9lC8nUSyuuizh2OGTAgm+ufqDJsCojglAVSbnFBK7M8a4lIjdjp7SZecWNArZKXeLRVXXr64MNA/THXZB6KptLbJmxQpRq4lUjlRLufFzj4CkVp84Nfvn6vyHGFv9NCWfF+/0/Ms69qvnZuXs3GbP30VrSLKZRTRZUGeig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwWbYhUYBi+dAkUoRaFypTx0L/j2XAhQdew3LmRB1so=;
 b=e1v8ayBEYyqjIHKgxN6XUPwzTccJJCRNoPvPbVtiwCh64Efy4y/Ia+5WwJiCvGNumyTErogZcplO5I2o+NyVzxlYs9ZWilrFT98uXBcbIJsgixrucz8Xb/+ScG8yHCEnit12qanXe1CSj1Yz6b8tDJ3BW+QL2OnpUI4OsowUWQih617sIukLPhJjqa1PsQQZyo9v59VMdpsr20IXBa2LAIukprpIiWVTdmoomv6sGS1gUdp/or+4fKR8W7vZ6s9vZhdWQ5vUl9npArl2Zqzv7z8dI36c3gYclWjtqHgiIh6+Zqaz0K3ILOj7Hm7UJkBiQJb5s9cUt1LU+e22HPfMEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by DS4PPF1B1B74C09.namprd11.prod.outlook.com (2603:10b6:f:fc02::e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Mon, 16 Mar
 2026 04:34:46 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9723.013; Mon, 16 Mar 2026
 04:34:46 +0000
Content-Type: multipart/alternative;
 boundary="------------sd3SJU5IjuU0aMIGJkfIbBSA"
Message-ID: <c936f21f-3f43-4a99-ae95-94c3f7e654c0@windriver.com>
Date: Mon, 16 Mar 2026 12:34:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] python3-setuptools: upgrade 80.9.0 -> 82.0.0
To: Marcel Ziswiler <marcel@ziswiler.com>,
        openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com
References: <20260304045413.3265198-1-hongxu.jia@windriver.com>
 <d291e85326d0d184045b7492aa5a1241b210763a.camel@ziswiler.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <d291e85326d0d184045b7492aa5a1241b210763a.camel@ziswiler.com>
X-ClientProxiedBy: SL2P216CA0135.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::14) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|DS4PPF1B1B74C09:EE_
X-MS-Office365-Filtering-Correlation-Id: 14052012-8731-4445-469c-08de83155a1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	XjYNC7MIgsplWvH3hux1iW8drlfJ9iBf/Wxii5F5cq7WtYSzg4BKXDqINfnauuyi6/iYh1iJc21RKOENMAA4Miutc4iPoO+P8XE7YB2G80gFMoReNFm3oGyVFW7QpMyXUTZ9x0/EfjafBuMY2FddqVSjav3poqymODKttrXDAdaSvr9JkAHAN1ERYgnM23srJx4AahMGtc4M2Z8V80yYlWhOHs4Xy4KCbpVE1v/k2BVGZ7vJx+dQJ2k1TNQLXiqLc0kQ33PXZ2KGTsY1vc6Y/YhhAVvpj/XUqaHJZkO+LTs4aI/2l7KmC4EReIWnPcEbKlurruPp7CumppUc6rPVb8cfkXAwbYTSfFSbUJu/zPr+w4SLMaUI94ROfyHGQsDMr0jkZHwN1K84gXJCCGQS5tZ5qTz9nlD6f38dj57v+u6ZCadH5D0ZkS17wTHFrs6hb7LR7tUDvZZ65uLopiJgvJag/cvU2/uoEn7QBkMg12ViKsNqJ92m7J+fmAkS2i51pySq7O+CDAbCSE2shgifvtPfNvnz+opgPN8cbGnR8XGnbAwhyNiC0XYJekXLUOoVLH+IG2AT1ESXi5FfKt59twOoAkaZ56XnUzz3D4qF+FxyN52EQLzxiavFY8XtJO2AxElquh+WL3WXTfJZW/bReiQIuKFqLcqMA9WUOCQTAsk5YccSd+FjXWuDMuw+jEKl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZXZSWXczR3EvZlpmWWNObnhrVjhBK0hDajhsOWhkNlJTdzJCSWhRdG1OdC9w?=
 =?utf-8?B?SkZrWDJySlFlalBkcGpqK09TRzZDejRldTlvam4va1VFQmNTSDBNZnptQmla?=
 =?utf-8?B?Wkp3QkNJajZaYi9LY25uMlpmRWlEWWZQYXVqTjA2cURDckgxcnZ3YVg0Y01U?=
 =?utf-8?B?SWpza1pOdnNOcGNqUmJ4MWs2cG0wMmR1RXRra21tT0w3R0dTaFJIejloQmtV?=
 =?utf-8?B?elB5V1hyRjNYbUcwOGxrSGFvaVQrWk90Znk5L3lVaGlLR1NKWVVDckFjMGFU?=
 =?utf-8?B?SFBsNFlUR0F5Um1ZYVlhMnRMU09wNlFwY3d4ZjhpYzFyVnBIdGdpU0JZWkUx?=
 =?utf-8?B?b09qcy9sV0pLVi9POGg1R3RJSDBMUkEyaWNLTW5JMjJrQnUwNTc1T3FzVVFX?=
 =?utf-8?B?dTA4b2ZNMlhOZHRIbktlZFhCZ3l4L2NuMFpWNHJlbnVOb25Wd2h5UG4yN2Ji?=
 =?utf-8?B?ODVzRno2VXl4SE1mYTZGZHhsQnhXai9tNHo3Q1AyRUhrWlhySFc2TWFuYjI5?=
 =?utf-8?B?UjZYdjRuNkdZaitBNTJUbXpOM1JBUFhEeGVuQVZWZDJBUVdpT3VKMzZwTk50?=
 =?utf-8?B?Tnk5K0U2Lyt5ako4ODA1NUhuQ1U0VmFFamxsME9uUzE3YVZPRDRCZDkvb0lS?=
 =?utf-8?B?SjhvRi9EYThSYjJhc1ZWTEJFZGdQT0VES08yVytIbXJ4SzNZZDZFd3R6Y01D?=
 =?utf-8?B?SUtzQ0hjVGExeHFNK1RjR2p5NzBLaHpLUDlwY000NGhVVFpBV3BYVU85NDdF?=
 =?utf-8?B?SS92bUV0dzFqU2NhQUdnUGRIWUVCcHV1V0o0Y0NiL1RKTTJBcFJjSW1jRlU1?=
 =?utf-8?B?bXRsdTI3L0Fzbi91ekpYVW5HRUF3TGE5ZU8vODMzbWMrcGM1R0w2WjdCcFZw?=
 =?utf-8?B?aEFWMkpnRklFRVNpbktVWDRoQS9hbmwrODB5dnQ5OFBmeE5lbzFnQXB2RXNi?=
 =?utf-8?B?VGRlSFpnQzlnMUVnZi9XUUgzVzhDdm1XNkVFSG5LVS82U2dpOFdWQ2V4Ynhl?=
 =?utf-8?B?aGxRTEEzUmlVVEdEM3JBN0RVUUM3ZHpUOW4rK3hCK21EZnFVZDBOTkozUlZP?=
 =?utf-8?B?NGsrM0lqMlhIMnRkY3oxNmRVa1UzWFpZanY3MisyOVFPZXVhU25tWFk5QXZK?=
 =?utf-8?B?ZWZjbGh1cmNLYWRQdHZzblZiejhOY053bmZEWU9oaS90RW8rNFVSaFdOWFNP?=
 =?utf-8?B?MkUyY1hFenc3ME9kUjFBSEdnUDlpVFR2N2VqNjdNZzFLZlFMTHE4bGxHbjN5?=
 =?utf-8?B?ZW0rV1FGZzV2TVBncXA5YUM3azByK2VTcEMyWHhnRnBES1NtQ0orVzR2bkpm?=
 =?utf-8?B?REpiNFVtbGduYUZxblV5N2ViUG5raVFLa1ozT2liSG8zZ2FiZWFVdWJKWk9l?=
 =?utf-8?B?b1R0Y1dhOHhIcHFoajBRZWlEZ0FvNUtqY2NON0tkQlpNdTIrcEhDTDdXbHBH?=
 =?utf-8?B?MEo0OTBBMG4ySXo4YUVYSStNYU9vR2ZBcG41aUI0WmJBS29QbWg1akowU1Bm?=
 =?utf-8?B?V1M1R25Od3ZpVld5WVAwV2x2WGVLSFNOMFJTSi9WcUt6ZmdKL2liQ2EyZCtp?=
 =?utf-8?B?MzJPdG03VjVOUWZYdWF4UTBnVmdmK0tDNHA2UVVlQlh5ODhlci91VkpTNGlD?=
 =?utf-8?B?QlBoZXpJNnBCRkJzbnU1N3htbWdzOTNCS1JIM3EvMzZ1R2tMZm1aRW9Hd0c0?=
 =?utf-8?B?T05nVGRBZktkTitGR0lhYUV4cnVsTXN2Zk9ieWdXRWRyN0h6c0pDNjYvdTds?=
 =?utf-8?B?dmFtR3U3UVZlck9RbVZvSDMzOFNVMGlSeklqdkV3K1JUN0I5bWpsbnRNeHJ1?=
 =?utf-8?B?YW4zTy94c1ZhTkRaLzJZa052K2xqeG9FYVlGMU11MEZCbEhlTy9Pb3RiditO?=
 =?utf-8?B?b096R0xHWmt0L0IwVW10cGdSRzRsVzY3WG5ZYnhxOHFSKzBDOHFhNUhjcDU2?=
 =?utf-8?B?ZGowdHZKUHRpZGtMWG1hSm0zTCtMd29RNUdDam91R2RPdHdLeU1ZU21IMWJp?=
 =?utf-8?B?WEF2V2RrTzVOQnhPVVJCMFpzQlAyZ1ZST3ZGQlduTzZTc05OTFk4MHJOUWoz?=
 =?utf-8?B?ZDdQMVhlOVdNMWdKNjNQSi9zcUlqdjFMSTRJbDRJTGNSMFpqQm1UdmVSM1dX?=
 =?utf-8?B?Y3BITnVRc1ZLOHlyNlI1RjVNQ04wV1ROOERkY3ZVZDBQZ3ZKeWJzc3BRZW80?=
 =?utf-8?B?UXhLVjZjbXhlWHh6VTVSWmhxa2tlcG9kK2lETzd1N21uY253cU1PbWN2NWlt?=
 =?utf-8?B?L0VRYjJWMDhpNUFSZnNJajByREluT3ZXWmR0bHZVUHFFSDZXby9oc3dPdWRo?=
 =?utf-8?B?R3BJcVlHVW5yK2NUOTA2UE5TYTdiWkU4NVBFQWcrSmd1RnRKV2JVdz09?=
X-Exchange-RoutingPolicyChecked: 
	STJxewbAZ4YeWMFGWKeDvYx+0EAPmgvqrV6CJUhjshmz74s/QYnSwXmBZZjOzNh15uEYb1PJUwzQhedrYIzr9xXfV4Z0A230TAbuQw2TkoNweibiGfVC+X/SxMNah9gSuv4GNKl/oZ9qTSqmqJuny23QEWAuY92ZHcD5QXuHYl6/h/xrgndFyRUKe8x8MEQ5DdNQWJrgla3VLbfCM0G6Bb8Ygg4blMnm4qjBXo/Ort3DqkkaYgXjIq51pgDcl5IrJJU6f5HLkKsSQEwzGzF3Tzc13y36aiiUOiDBMRRFEqesK+zw0iDXtTHkzlIokxEfYBIAkfqL4LywyeGhhUFBbg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14052012-8731-4445-469c-08de83155a1a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 04:34:46.3454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MvxdzkifEaFa8JtFdYOaOyyOBgKcAcSmwdZBwCYly0HbJ2zXQZ+06AveTuQmH1wuVDCr5cTOzdFgSSpx7IIqpfEnmZqM4rU0DAKL5UBD/1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF1B1B74C09
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b78868 cx=c_pps
 a=zsOV+8tnETx+K6VwtxJO8A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=dXvAoEkxAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=xkeKmrcl5rkhlbhb1AIA:9
 a=36DcYDAlGrXZe9iL:21 a=QEXdDO2ut3YA:10 a=j-NXPswCAAAA:8
 a=TGWRFvGZnzJx6LKCTUUA:9 a=co0A5TqiIt_dN-6z:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=iJ39DRKJB4kz2P1Iyp3E:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=UdV-L189IiqUQIgB40x4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAzMiBTYWx0ZWRfX6OyyB7Z/DUOL
 h5aokywR6R8ovvk74fbPR8mRZiX4XYA4dys9YpEmmAIBlajnLH/qdhO/KR6i7uQtCiS5lHlzaIf
 Va12aldmnwsL7N+0yP9qevbTMz4Xt6QEQKSjV4El2HNPe51qnAshQzDLWn/DNZJHZ5A+lfKkN2y
 07PcgRl9v+fosoXHEiraDEyPAnOSnl0oslcoryLrXo2SeTNdRPIBuOyABUCYutcrDZJ1zT1/FSP
 2+yBix057mV6uYwpn78EsSqDVupDPiXgA9Wxq9apzJo9A3wNFBIKcQPpbZRC+KL77nlc/4ivZEU
 hMxfRl5/nHFnLxmMAPpW+E00BzT72+wpVnPDwR5yPeQu+KJI4+TkrwcH7ZwY0jgofmbkhaKr0uI
 F4fD0uNYVn3JbjvG6tBQkHwVgTeDXfM9LDpnfBPpH+zPMPHQVvnL34Zef8g2HALPIHSy2UjCV9y
 K3sP+yFm/eySPArZE8g==
X-Proofpoint-ORIG-GUID: oN0xvo5lbTpM41-2t7eamuxrMqEaLD3H
X-Proofpoint-GUID: 2N-HVdUSyi_8FCPLxoe7jCDA-hoEg927
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 04:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233209

--------------sd3SJU5IjuU0aMIGJkfIbBSA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/13/26 17:25, Marcel Ziswiler wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Hongxu Jia
>
> On Wed, 2026-03-04 at 12:54 +0800, Hongxu Jia wrote:
>> Remove python3-pkg-resources
>>
>> History v82.0.0 [1]:
>>
>> Deprecations and Removals
>> - pkg_resources has been removed from Setuptools. Most common uses of pkg_resources have
>>    been superseded by the importlib.resources and importlib.metadata projects. Projects
>>    and environments relying on pkg_resources for namespace packages or other behavior
>>    should depend on older versions of setuptools. (#3085)
>>
>> [1]https://setuptools.pypa.io/en/stable/history.html#v82-0-0
>>
>> Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
> [snip]
>
> Unfortunately, this seems to break all my meta-riscv machine builds:
>
> ...
> | gcc -shared -L/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-cython-
> native/3.2.4/recipe-sysroot-native/usr/lib -L/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-
> linux/python3-cython-native/3.2.4/recipe-sysroot-native/lib -Wl,--enable-new-dtags -Wl,-rpath-
> link,/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-cython-native/3.2.4/recipe-sysroot-
> native/usr/lib -Wl,-rpath-link,/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-cython-
> native/3.2.4/recipe-sysroot-native/lib -Wl,-rpath,/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-
> linux/python3-cython-native/3.2.4/recipe-sysroot-native/usr/lib -Wl,-rpath,/var/home/sumo/Sources/riscv-
> yocto/build/tmp/work/x86_64-linux/python3-cython-native/3.2.4/recipe-sysroot-native/lib -Wl,-O1 -Wl,--allow-
> shlib-undefined -Wl,--dynamic-linker=/var/home/sumo/Sources/riscv-yocto/build/tmp/sysroots-uninative/x86_64-
> linux/lib/ld-linux-x86-64.so.2 -pthread -isystem/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-
> linux/python3-cython-native/3.2.4/recipe-sysroot-native/usr/include -O2 -pipe -
> isystem/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-cython-native/3.2.4/recipe-
> sysroot-native/usr/include build/temp.linux-x86_64-cpython-314/var/home/sumo/Sources/riscv-
> yocto/build/tmp/work/x86_64-linux/python3-cython-native/3.2.4/sources/cython-3.2.4/Cython/Compiler/Code.o -
> L/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-cython-native/3.2.4/recipe-sysroot-
> native/usr/lib -o build/lib.linux-x86_64-cpython-314/Cython/Compiler/Code.cpython-314-x86_64-linux-gnu.so
> | running bdist_wheel
> | error: invalid command 'egg_info'
> | WARNING: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-cython-
> native/3.2.4/temp/run.do_compile.2101018:159 exit 1 from 'nativepython3 setup.py --verbose build -j 48
> bdist_wheel --dist-dir /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-cython-
> native/3.2.4/dist'
> | WARNING: Backtrace (BB generated script):
> |       #1: setuptools3_do_compile, /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-
> cython-native/3.2.4/temp/run.do_compile.2101018, line 159
> |       #2: do_compile, /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-cython-
> native/3.2.4/temp/run.do_compile.2101018, line 149
> |       #3: main, /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-cython-
> native/3.2.4/temp/run.do_compile.2101018, line 166
> ERROR: Task (virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-core/meta/recipes-
> devtools/python/python3-cython_3.2.4.bb:do_compile) failed with exit code '1'
> ...
> Summary: 7 tasks failed:
>    virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-core/meta/recipes-
> devtools/python/python3-pyelftools_0.32.bb:do_compile
>      log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-pyelftools-
> native/0.32/temp/log.do_compile.2101167
>    virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-core/meta/recipes-
> devtools/python/python3-markupsafe_3.0.3.bb:do_compile
>      log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-markupsafe-
> native/3.0.3/temp/log.do_compile.2100841
>    virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-core/meta/recipes-
> devtools/python/python3-calver_2025.10.20.bb:do_compile
>      log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-calver-
> native/2025.10.20/temp/log.do_compile.2101147
>    virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-core/meta/recipes-
> devtools/meson/meson_1.10.1.bb:do_compile
>      log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/meson-
> native/1.10.1/temp/log.do_compile.2100900
>    virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-core/meta/recipes-
> devtools/python/python3-setuptools-scm_9.2.2.bb:do_compile
>      log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-setuptools-scm-
> native/9.2.2/temp/log.do_compile.2100993
>    virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-core/meta/recipes-
> devtools/python/python3-mako_1.3.10.bb:do_compile
>      log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-mako-
> native/1.3.10/temp/log.do_compile.2101162
>    virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-core/meta/recipes-
> devtools/python/python3-cython_3.2.4.bb:do_compile
>      log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-cython-
> native/3.2.4/temp/log.do_compile.2101018
> Summary: There were 16 WARNING messages.
> Summary: There were 7 ERROR messages, returning a non-zero exit code.
>
> If I revert commit ab6b2bf7b555d3516abea6255b800fe6f9673a69 all builds fine again.
>
> Any ideas?

The recipe python3-cython is in oe-core, would you please apply [1] to 
recipe python3-cython and retry?

[1] 
https://github.com/cython/cython/commit/fd847477a47855f9c0d036f35c8865196d5267cc 


//Hongxu

> Thanks!
>
> Cheers
>
> Marcel


--------------sd3SJU5IjuU0aMIGJkfIbBSA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 3/13/26 17:25, Marcel Ziswiler
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:d291e85326d0d184045b7492aa5a1241b210763a.camel@ziswiler.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

Hi Hongxu Jia

On Wed, 2026-03-04 at 12:54 +0800, Hongxu Jia wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Remove python3-pkg-resources

History v82.0.0 [1]:

Deprecations and Removals
- pkg_resources has been removed from Setuptools. Most common uses of pkg_resources have
  been superseded by the importlib.resources and importlib.metadata projects. Projects
  and environments relying on pkg_resources for namespace packages or other behavior
  should depend on older versions of setuptools. (#3085)

[1] <a class="moz-txt-link-freetext" href="https://setuptools.pypa.io/en/stable/history.html#v82-0-0">https://setuptools.pypa.io/en/stable/history.html#v82-0-0</a>

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
[snip]

Unfortunately, this seems to break all my meta-riscv machine builds:

...
| gcc -shared -L/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-cython-
native/3.2.4/recipe-sysroot-native/usr/lib -L/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-
linux/python3-cython-native/3.2.4/recipe-sysroot-native/lib -Wl,--enable-new-dtags -Wl,-rpath-
link,/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-cython-native/3.2.4/recipe-sysroot-
native/usr/lib -Wl,-rpath-link,/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-cython-
native/3.2.4/recipe-sysroot-native/lib -Wl,-rpath,/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-
linux/python3-cython-native/3.2.4/recipe-sysroot-native/usr/lib -Wl,-rpath,/var/home/sumo/Sources/riscv-
yocto/build/tmp/work/x86_64-linux/python3-cython-native/3.2.4/recipe-sysroot-native/lib -Wl,-O1 -Wl,--allow-
shlib-undefined -Wl,--dynamic-linker=/var/home/sumo/Sources/riscv-yocto/build/tmp/sysroots-uninative/x86_64-
linux/lib/ld-linux-x86-64.so.2 -pthread -isystem/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-
linux/python3-cython-native/3.2.4/recipe-sysroot-native/usr/include -O2 -pipe -
isystem/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-cython-native/3.2.4/recipe-
sysroot-native/usr/include build/temp.linux-x86_64-cpython-314/var/home/sumo/Sources/riscv-
yocto/build/tmp/work/x86_64-linux/python3-cython-native/3.2.4/sources/cython-3.2.4/Cython/Compiler/Code.o -
L/var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-cython-native/3.2.4/recipe-sysroot-
native/usr/lib -o build/lib.linux-x86_64-cpython-314/Cython/Compiler/Code.cpython-314-x86_64-linux-gnu.so
| running bdist_wheel
| error: invalid command 'egg_info'
| WARNING: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-cython-
native/3.2.4/temp/run.do_compile.2101018:159 exit 1 from 'nativepython3 setup.py --verbose build -j 48
bdist_wheel --dist-dir /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-cython-
native/3.2.4/dist'
| WARNING: Backtrace (BB generated script):
|       #1: setuptools3_do_compile, /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-
cython-native/3.2.4/temp/run.do_compile.2101018, line 159
|       #2: do_compile, /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-cython-
native/3.2.4/temp/run.do_compile.2101018, line 149
|       #3: main, /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-cython-
native/3.2.4/temp/run.do_compile.2101018, line 166
ERROR: Task (virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-core/meta/recipes-
devtools/python/python3-cython_3.2.4.bb:do_compile) failed with exit code '1'
...
Summary: 7 tasks failed:
  virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-core/meta/recipes-
devtools/python/python3-pyelftools_0.32.bb:do_compile
    log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-pyelftools-
native/0.32/temp/log.do_compile.2101167
  virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-core/meta/recipes-
devtools/python/python3-markupsafe_3.0.3.bb:do_compile
    log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-markupsafe-
native/3.0.3/temp/log.do_compile.2100841
  virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-core/meta/recipes-
devtools/python/python3-calver_2025.10.20.bb:do_compile
    log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-calver-
native/2025.10.20/temp/log.do_compile.2101147
  virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-core/meta/recipes-
devtools/meson/meson_1.10.1.bb:do_compile
    log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/meson-
native/1.10.1/temp/log.do_compile.2100900
  virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-core/meta/recipes-
devtools/python/python3-setuptools-scm_9.2.2.bb:do_compile
    log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-setuptools-scm-
native/9.2.2/temp/log.do_compile.2100993
  virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-core/meta/recipes-
devtools/python/python3-mako_1.3.10.bb:do_compile
    log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-mako-
native/1.3.10/temp/log.do_compile.2101162
  virtual:native:/var/home/sumo/Sources/riscv-yocto/layers/openembedded-core/meta/recipes-
devtools/python/python3-cython_3.2.4.bb:do_compile
    log: /var/home/sumo/Sources/riscv-yocto/build/tmp/work/x86_64-linux/python3-cython-
native/3.2.4/temp/log.do_compile.2101018
Summary: There were 16 WARNING messages.
Summary: There were 7 ERROR messages, returning a non-zero exit code.

If I revert commit ab6b2bf7b555d3516abea6255b800fe6f9673a69 all builds fine again.

Any ideas?
</pre>
    </blockquote>
    <p>The recipe <span style="white-space: pre-wrap">python3-cython is in oe-core, would you please apply [1] to recipe </span><span style="white-space: pre-wrap">python3-cython and retry?</span></p>
    <p><span style="white-space: pre-wrap">[1] <a class="moz-txt-link-freetext" href="https://github.com/cython/cython/commit/fd847477a47855f9c0d036f35c8865196d5267cc">https://github.com/cython/cython/commit/fd847477a47855f9c0d036f35c8865196d5267cc</a>
</span></p>
    <p>//Hongxu<br>
    </p>
    <blockquote type="cite" cite="mid:d291e85326d0d184045b7492aa5a1241b210763a.camel@ziswiler.com">
      <pre wrap="" class="moz-quote-pre">
Thanks!

Cheers

Marcel
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------sd3SJU5IjuU0aMIGJkfIbBSA--

