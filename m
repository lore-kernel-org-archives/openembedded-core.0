Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D03EB1041
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 10:21:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36986.1773138077439804495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 03:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=oembVRfV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7529dc2072=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A7s6wc718928
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 03:21:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=WjgfvCPeTN3oJp9ZeptwrfIjdDiPFtkCGl42EqPBOtU=; b=
	oembVRfVgR3cD9QcxA1h/tciyCttvpBNdkLZ4L5/twSruUgm3V83u64VWivibO6N
	xD2h5PvimG2pLI7pOwoPedoUqAx2TqbYqMF5TOfWfeSe99SZZIkx6vT2oSuSomAo
	s6vO0OOrg/6ndUCtfyzCBWdy9bQd52HNKJz1Gb4gEWtAMLJ8NZkNWyoSOp2XnEtf
	iM9xMYs4VR//cKNzr1kmaV9t/dBaXXUtlk7c3P8QQVLw9Vx85OoRofxVTN7ZmJbN
	EG5iECs6QJwfHt+pIcA/wbYiWEeJdeI1YuByEVXhBnC9Xg/hK0ctl2QkOP9pQhhJ
	KWDD+mBCIFz0Hbh3lCLRZg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013024.outbound.protection.outlook.com [40.107.201.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crmdm2ss2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 03:21:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lBb67oFIDOf1zr7qitSrJ1DMgjehKs3PJNuLR3OyDQ0+knhfvcvl7UxaAYX+K2yc72yHaKMRI8y4NY72SHNuB8C8QNUfcyGV1gT5W5hnDMtSB5KgSEl/GP3TrmI+aJXIq6cq125BBmxEWdAgEfFsPV5LaE37eAEAtQ1g5Z+C7J/fQcfeqFwKywCUmzjSF5jAlI3+FlpbNBvKJZLf1pm8qLWQk9rDznL7rPHfTegCjf15CKsj8kg9R4zE+z1rT3+WRz7o6Q1CFGwcbznl6htpZGrQnrY+HFZPkf2E9w1ra5gLV+sr2rAWu0oMptrXyDccybIAD4TeN/ukexCycO6nDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjgfvCPeTN3oJp9ZeptwrfIjdDiPFtkCGl42EqPBOtU=;
 b=qKoHNfh28ZWXybuZlYjvINwgxaS6aTeyIT9eHE1RxOUoAsWw8ewgmDB/BxIPV/ee6pWN2ln8YcDNTvB8MOAVztr3HdDrQtg1zPMYSbW+XNyPL9WPqpbRUs4AvEEK6OvsBAF9ZWg7wcWsy6oqknSaG7QCSXxXddf7z7rgC+/ewweyLg7rs4wSzA103e1e7XuWmfQw0xn43vdN4YT7V4No+1Mw1aquIv/ainK8U/df3+216ccoe4Qs3pEIYiG2cQimjZisCCUr11zpVfL1t8NOFqKMlq7N1sGv+UfEpRljfWf2Lsbx95Zw9sgqvtzwIeRRHAMFM3iZhh72I7JceTIO8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by MW4PR11MB6910.namprd11.prod.outlook.com (2603:10b6:303:225::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 10:21:13 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 10:21:13 +0000
Message-ID: <d6997c95-9360-442a-b6ba-ec89a9724657@windriver.com>
Date: Tue, 10 Mar 2026 18:21:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v7 1/7] package_rpm.bbclass: Drop external
 dependency generator to support rpm 6
From: Robert Yang <liezhi.yang@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: alex.kanavin@gmail.com, Ross Burton <ross.burton@arm.com>,
        openembedded-core@lists.openembedded.org
References: <cover.1772367692.git.liezhi.yang@windriver.com>
 <8e2bf6e0befe331a0f834687317a3dcd2d735b92.1772367692.git.liezhi.yang@windriver.com>
 <2bbd3ebdc7f525fc5fdb5848ec6d80c70dbb9e22.camel@linuxfoundation.org>
 <86d3c351-16e9-44bd-8b38-b8c6ed75aa0a@windriver.com>
 <e4bed048-61eb-425a-a3bf-a3906145938d@windriver.com>
 <DGU6U0PB5R0J.2FMV5TJUWPZJV@bootlin.com>
 <e85b7909-392f-4fb1-a463-46a09484060e@windriver.com>
 <DGY263XJ28Q5.S68LXPC7JMI6@bootlin.com>
 <dea8a50e-cd53-4b8d-a2c6-a0b0b7929952@windriver.com>
Content-Language: en-US
In-Reply-To: <dea8a50e-cd53-4b8d-a2c6-a0b0b7929952@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0238.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::11) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|MW4PR11MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b368293-64e3-448c-6c21-08de7e8ec16d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	lB8Q4R4eJ6aijODH9WURO36kHryWADtMWk4fUhVQs8QJ7HDFRTuETWP+R3i7sdAy9bY8opcLHVqUgX2fTXjHxWlD3EUpZ/mjcIVTMb5TPHyw61XtR7I1gfYFDpNoQfcBiFkdNjgJEXKO9X5UE8tgX5efZSZJPHoBkdQ0ooznTGxJ4XPIKa1UufkjAu7dgfzjShi+e783jgN79sFRBcveOmMIOSd5VVF/0hoQo/ef59YbV6eV5ZWKRrj7QYkSGF0FRc79tAY6TlYUXeW5tfUhkziiNk8FgEUm51HaLPdhk7hi4Sk0Xar7T5PunpZvF5/MA5M3hox9VSZ0FV+/2GF7e0+GJqq27BxfWkTg6bzLW7y5wN7fx+IPSTvzdK8HLC37aOJp2m1j78nE8bvvsSZ8UKdQemDCyXbRJolMFy5EX7VC0/13lCYgvmL+WZrRd73LLyhJ5B5bfUGsYwvef6G3LU5D+apKJv+8iqkD9eI90nGHXvp1p7LoIrBw+n2GDswInD9QXVUkffWfQGfbqhjcrxrvW2Mm8Uok0SLLfz40T+c0pFoKnLKQq124wR4HzRu8NDOhMfgixEpjVac+psmV3DHZHUJHEUatrkEnN25wiW/Wd6+ZOLN915PNZ/maTEnOh3DSzviG3nBZekp6sTxSUtVXUHa0vk94WyrlyPnVgO9tA0xjxKdX+0ZANMK9qEpc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?am9rSnN0UDRDY0YxVzRuSjZsUXprNG1rQXMzaDlTc3RHZkR3dmkzL0VWM2JP?=
 =?utf-8?B?ZksyaThLZXdkdmhkaitJRUdZbHlYKzNiVFFFdzI1UEd5SWYxdXRJL2xneUhh?=
 =?utf-8?B?OEl0b1dnbWlmT2JZTUFFMnBXSnN4ZUZ5aldjUFhUTXBURGxJOTF3U0oxcWRT?=
 =?utf-8?B?WXFvTC9ZUlNLTXlORktQdHRzYkFuMVBvY1VVQzNVZDViTk93VmNzYkFYVTRD?=
 =?utf-8?B?d3Z0VEsvclJNYk9uSURrWWMzSElCOXJqQm5MV0JpbHA0ajVlU2ZhL1NwUzB0?=
 =?utf-8?B?MFVqZUtLV2RUQ2tjM3lXUmJNZ0s0TTFsMWNMODhzMVNrcHBzaVhyTjlhVURw?=
 =?utf-8?B?WnByc3lmSTArVmlmOXc4azdCcDdvMHNGdEl3aGVGcis1TVhPZDBscUJSWXpz?=
 =?utf-8?B?OVJyV281aU1CWjNLRXUvMWlwUlROYThlOE1GMlRsa0hrdmdlVmsxbW1iME9X?=
 =?utf-8?B?OThSSm5ieVowa0NEMmNFa2V3d2ZoVHZHSTBsNHZMRWhMOS9QTVlHSSt2OVNn?=
 =?utf-8?B?QkJQVGcxZkJ4bTRoMk5FWllRcHBUOXZhQkFweUxLQVJrTlcvYThNUW5rengy?=
 =?utf-8?B?SVJ4Z29rd2Iyc2JHNXNnQUt4bGREM1FmdzNVdmdoT0Z4UWkwbjNQQkJIT3VF?=
 =?utf-8?B?Wnh2MG5DenJHeFhPYlVia3M3MURBV3FFaHdGVkRISUUrWEwxZnA1OHpWV1lV?=
 =?utf-8?B?eWZ1b1pETWtmcnVFaFNDaXd2OTljaUxtcFJjS01hUzFQMTNob1N1MkZaTDRp?=
 =?utf-8?B?cDlpYWl1cXBNVjFxc2l5aEZ4TS9zNVpvMjhWanE1QTNMWFYxaWo5NzJwL1Qw?=
 =?utf-8?B?cHptQkVVbDVpTU1Bbm1JNWdVZVZOZDU4Um43cThULzQ3MkQ4V2lGUkNmK2wr?=
 =?utf-8?B?RXc5a0RudHJJTUlWVUE2dGhGOWk1dlV3RWhIUTJ5VjYyU3kraktoNDZ6NENa?=
 =?utf-8?B?VnFualdBRlZ2RTBaVVJuVUZIRVVYb21VTXE4cnBrd1M2SGFnZDNwMzhuYyto?=
 =?utf-8?B?VS9aVytFY3hRK01nQ0phZGc0L1Vmd1REMVVSMERyQ2FCM0dGY2NhR1haeEsz?=
 =?utf-8?B?ZUlyOUtvYzNWOEx3cmhkcWZHWUswZ1NQK013R2FpNU10amV0RjZRdEYzNzAw?=
 =?utf-8?B?eksvcytGa1J6RkZLMXlNNmZnYkdSTjVCUThtUS83WDhjZkE1TVYxbEp4UGVq?=
 =?utf-8?B?dVJQQ2xBeHRoRFlmZ1ozeDJ4d0pUTEh1N3RJVlFpSTE5S010VmVnNldSczA2?=
 =?utf-8?B?Vy9mVGRoeTM5VUNKa3ppam9VZzdLd1haeERaWmxibGdKRlJGTFhwSzZQaG5n?=
 =?utf-8?B?NVdFMHZjWXpYbHlCV3pabWp0VFhlTmFScFBmSEZkTHZVdlNScmN3MWRMd2FH?=
 =?utf-8?B?S1FaajhkcmZMdW9oajI5M1ZYeFl5WXI2WldvUVFXeUlySGQwcjFabDdhTWkz?=
 =?utf-8?B?ZFlXYTVCRG5HZWlpeXgxcW1XaXA0VndTaGl4Tnk3elJ4Y25kODVuMEhITjRL?=
 =?utf-8?B?cmNlM0tiOHFXaDFDelpTN1gwYkxBcnlyWlVEUnRJRDZMY0M0TjNZWHpJSXdU?=
 =?utf-8?B?YmV0dk5PN3l2bHJWMG5SRXdHWWV1Vzh3YVZRQ28wYjMwNmdmYjUwNTJkYUdy?=
 =?utf-8?B?RDZ2OE1JcUxwRmQ1Y1pJR1BXWHBwQW9lY3hWQzV6SnpPSDhaSXYvMit5QU92?=
 =?utf-8?B?em9wOHRBTnRhZ2FwNHA4aEFydzNDZitjNHQ3ODFvUnpNUnFBZGU0ZHhjZjRl?=
 =?utf-8?B?OHM0U2hhUzlFM2FiOGlYTG1zelBGNHZEV1VlY0F4UStuM3kyenpsM1lPd21K?=
 =?utf-8?B?dWh3L1NZNkZNcnJJRk5ubUd1WHNEZFh0VnVPUmI4aWlHbTBGTmJzUWZuVXF6?=
 =?utf-8?B?WktjeGJKR3I4VGhVRkJPaXQ3dFkyNzFXckNFcmxkSTJ2OHFHT21jWWdiNndB?=
 =?utf-8?B?RzFIWkFESG50UGJHNDk5eDltTTRBbnJMMHFZUktLU0hKeVBKTGRZbHZqRHFS?=
 =?utf-8?B?VEJ5NzlaNjQvTGdVdDBCY29ibldhNi92K1hneThDKzBnaW5CTk4yZWNRUWxa?=
 =?utf-8?B?Z0d3VVZrTndBZ0xsS1R3SnZ2QUp2dUx2SE1nWDgwc1ZSYjg5SWo1ckpnMmJZ?=
 =?utf-8?B?Q0VtTTg3d01nV2hqNzZIRWc0dEhQRC8zUFhFQkttaXdWb2EyNTR3bWdGbkNR?=
 =?utf-8?B?YndKTFFrUmRRRUFlOVN4N0pYUVBBSEF0cEExb1dMVmRJMEpFK2hCWFpmWVdz?=
 =?utf-8?B?bzh2UlJQOXBzaE10emJVVmRIc2ZWSDBvNGM0ZXFGU1BVbUFQMWhITC9iOVdz?=
 =?utf-8?B?ektCWmxaeEtCMVd2TGRtZXFjWHo0eXc0MUVyZWhLcnlKUTduaFcwc2dITTJC?=
 =?utf-8?Q?1JD7Z0mHyukjcZCg=3D?=
X-Exchange-RoutingPolicyChecked: 
	tKOkp2uil9KD05/2BXGEA+sWqr7ltFSQpK21iAbnYIr1P/OcwfS7d0kmNzOIr48lHNmH90y4ltSSCjlNdkJdbmALPt/HabHJhvzqW8xqOZLI4gzjbpZwLaLEnBYr3bK6+Prx1sLVkSkOdlg6maWpck9jwOOMexOxKaaAb9z/b7o2hgzliAixtjd3g3YhDzxGm/W9BJyyRAvgnXikjzZLwIava/P34x5EPlGzBOfR4wwrPkUVtOGpVdV1daJE2gJUpGRxEWKQOxEE2u+BN/JgJ4E9PdQDZvKrZ2gqzOOpf4Cd0AN4XPvJkpkq+uYe7qfHYgIwM7E24Q21lGXMBaKCLw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b368293-64e3-448c-6c21-08de7e8ec16d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 10:21:13.1246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbwkLWHcUTDWtv4uRMfbr94Z2jV95WfwNuSj7Ihaj7omJv7GLvqbE/b2J6/dp+dB0QxHOvOGdu9lH5Vco5Ut6542+OqAVn5ldmE2KitjIOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6910
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 53WfT4ZrSfUtoypqzbxh37rjYNkAdw5A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4OCBTYWx0ZWRfX4qC3L7KRuy27
 n3ozpGbl/ZyVOtXEYIvIyv0ke2zbeVvbdpNoYHA4y8ILDQjdU1eaP6UikBq20FvtRa0867f5GfL
 +GQAAlkG8QrYQN7ijx+7oVNIjtWpgRySIBe4h2yr5R6cpQVItJVhzgy887raMODyiYIploqIvAd
 WuJxVaqhaueJ5kKHIzKRsoZPmIm1j3kEc6LgJkJYThwHqB0yD3ydVgwV2HttVZK3gXwwCo9shgA
 MUL+nZ4o29Ok+AFmmoB4qW39n4RnicYXb1VrWOyPVtHOasSOaVSY/eX2nJdvYP+tp7EQ3M89UUN
 lnrv40/eNUXKfUBZB8p1iC7daJRdyZRm5DU+26umAP/otV7qtTLsFHzoER1AMWreIejwHXMnwec
 7lTDSFuq5xOZzgq4Sd30tMWILinH8lQl2QpC7eAfmg3yLHhLM0zxVwO/Ga0vZ6+JsoKHuSjh8yy
 GyUU+5p1czRECXyNSfg==
X-Proofpoint-GUID: LcDVG8d8ssqmqGz9ItG5dDzui1KDaDOs
X-Authority-Analysis: v=2.4 cv=QppTHFyd c=1 sm=1 tr=0 ts=69aff09c cx=c_pps
 a=GL1li5ChHZoEBhvyUKgzGA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=x7pVspDikWsIn9G4mGwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100088
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62A7s6wc718928
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 10:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232767



On 3/9/26 15:26, Robert Yang wrote:
>=20
>=20
> On 3/9/26 15:04, Mathieu Dubois-Briand wrote:
>> On Sat Mar 7, 2026 at 4:22 PM CET, Robert Yang via lists.openembedded.=
org wrote:
>>> Hi Mathieu,
>>>
>>> On 3/5/26 01:52, Mathieu Dubois-Briand wrote:
>>>> On Tue Mar 3, 2026 at 1:01 PM CET, Robert Yang via lists.openembedde=
d.org=20
>>>> wrote:
>>>>> I've updated it in the pull (patch 7). @Mathieu, would you please h=
elp to
>>>>> re-test it if RP has no objections on the external generator?
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 https://github.com/robertlinux/yocto rbt/r=
pm
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 https://github.com/robertlinux/yocto/tree/=
rbt/rpm
>>>>>
>>>>> for you to fetch changes up to f8fa3090196bae3e12ad76f12f101722d84c=
a20a:
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 rpm: 4.20.1 -> 6.0.1 (2026-03-03 11:29:07 =
+0000)
>>>>>
>>>>> ----------------------------------------------------------------
>>>>>
>>>>> Robert Yang (7):
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 package_rpm.bbclass: Drop external depende=
ncy generator to support rpm
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 package_rpm.bbclass: Define _lib and _libd=
ir for rpmbuild
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 lib/oe/package.py: Don't add ldconfig_post=
inst_fragment for glibc or
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 musl
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 glib/python3/acl: Add pkgconfig to RDEPEND=
S
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 lib/oe/package.py: Don't redirect stderr
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 target-sdk-provides-dummy: Add pkg-config =
to DUMMYPROVIDES
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 rpm: 4.20.1 -> 6.0.1
>>>>>
>>>>> // Robert
>>>>
>>>> Hi Robert,
>>>>
>>>> I did pick these commits.
>>>
>>> Thank you very much for your great patience.
>>>
>>>>
>>>> We have some different errors now.
>>>>
>>>> ERROR: core-image-sato-1.0-r0 do_rootfs: Could not invoke dnf. Comma=
nd '/=20
>>>> srv/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/qemux86_6=
4-poky-=20
>>>> linux/core-image-sato/1.0/recipe-sysroot-native/usr/bin/dnf -v --=20
>>>> rpmverbosity=3Dinfo -y -c /srv/pokybuild/yocto-worker/qa-extras2/bui=
ld/build/=20
>>>> tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/rootfs/etc/dnf/dn=
f.conf=20
>>>> --setopt=3Dreposdir=3D/srv/pokybuild/yocto-worker/qa-extras2/build/b=
uild/tmp/=20
>>>> work/qemux86_64-poky-linux/core-image-sato/1.0/rootfs/etc/yum.repos.=
d --=20
>>>> installroot=3D/srv/pokybuild/yocto-worker/qa-extras2/build/build/tmp=
/work/=20
>>>> qemux86_64-poky-linux/core-image-sato/1.0/rootfs --setopt=3Dlogdir=3D=
/srv/=20
>>>> pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/qemux86_64-po=
ky-=20
>>>> linux/core-image-sato/1.0/temp --repofrompath=3Doe-repo,/srv/pokybui=
ld/yocto-=20
>>>> worker/qa-extras2/build/build/tmp/work/qemux86_64-poky-linux/core-im=
age-=20
>>>> sato/1.0/oe-rootfs-repo --nogpgcheck install dnf packagegroup-base-e=
xtended=20
>>>> packagegroup-core-boot packagegroup-core-ssh-dropbear packagegroup-c=
ore-x11-=20
>>>> base packagegroup-core-x11-sato psplash rpm run-postinsts locale-bas=
e-c=20
>>>> locale-base-en-us locale-base-en-gb' returned 1:
>>>
>>> It looks that something is wrong with the storage.
>>>
>>>> ...
>>>> ++ tr -d '[:space:]'
>>>> /var/tmp/rpm-tmp.U4iaJX: line 98: tr: command not found
>>>> + test x '!=3D' x
>>>> ++ echo --system --home /var/lib/dbus --no-create-home --shell /bin/=
false --=20
>>>> user-group messagebus
>>>> ++ tr -d '[:space:]'
>>>> /var/tmp/rpm-tmp.U4iaJX: line 114: tr: command not found
>>>> + test x '!=3D' x
>>>> ++ echo
>>>> ++ tr -d '[:space:]'
>>>> /var/tmp/rpm-tmp.U4iaJX: line 130: tr: command not found
>>>> ...
>>>>
>>>> =C2=A0=C2=A0=C2=A0 Installing=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : =
dbus-common-1.16.2-r0.x86_64_v3                   =20
>>>> 682/790Error: Cannot open file /srv/pokybuild/yocto-worker/qa-extras=
2/build/=20
>>>> build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/oe-rootfs-r=
epo/rpm/=20
>>>> x86_64_v3/dbus-1-1.16.2-r0.x86_64_v3.rpm: [Errno 2] No such file or=20
>>>> directory: '/srv/pokybuild/yocto-worker/qa-extras2/build/build/tmp/w=
ork/=20
>>>> qemux86_64-poky-linux/core-image-sato/1.0/oe-rootfs-repo/rpm/x86_64_=
v3/=20
>>>> dbus-1-1.16.2-r0.x86_64_v3.rpm'
>>>> TypeError: 'NoneType' object cannot be interpreted as an integer
>>>> FATAL ERROR: python callback ??? failed, aborting!
>>>>
>>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/3=
271
>>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/3=
276
>>>>
>>>> I'm a bit surprise by tr errors here, as it looks a bit unrelated. T=
here
>>>> is a small probability it's related to something else in my branch, =
but
>>>> this series is clearly the best candidate. I will keep you updated i=
f it
>>>> finally looks related to something else.
>>>>
>>>> I also got some more traditional "nothing provides" errors:
>>>>
>>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/78/builds/3=
317
>>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/8/builds/33=
21
>>> =C2=A0 > > Can you have a look at these?
>>>
>>> For the above two errors, it is because the sstate cache had been pol=
luted. I
>>> moved pkgconfig-native from do_package to do_package_write_rpm, the
>>> do_package_write_rpm still can be mirrored from the old (but bad) sst=
ate-cache.
>>> It woudl work when the old sstate cache are invalid. So I've sent a
>>> gettext update patch:
>>>
>>> [OE-core] [PATCH 0/1] gettext: 0.26 -> 1.0
>>>
>>> It would make nearly all the sstate cache invalid, and re-built from =
sources,
>>> then this should be fixed.
>>>
>>> What I'm worried about is that gettext is very basic package, I hope =
it won't
>>> cause more troubles. I've done world build on qemux86-64 and qemuarm6=
4.
>>>
>>> Other reipes' upgrading may also can make the sstate cache invalid.
>>>
>>> // Robert
>>>
>>
>> Hi Robert,
>>
>> I ran a build, not with your gettext patch, but with the one from the
>> glibc upgrade by Hemanth. We still had similar errors.
>>
>> Any opinion?
>=20
> It seems that now the failed ones are related to 'tr ', at least, the p=
kgconfig=20
> issues are gone.
>=20
> I will look into it, sorry about that.

It is failed to build with systemd, the rpm's sysuser creation doesn't wo=
rk with
cross build, and we don't need rpm to create the users since we have
useradd.bbclass. The fix is:

diff --git a/meta/classes-global/package_rpm.bbclass=20
b/meta/classes-global/package_rpm.bbclass
index 1b86cb52cd..e85644995a 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -636,6 +636,7 @@ python do_package_rpm () {
      cmd =3D cmd + " --define '_unpackaged_files_terminate_build 0'"
      cmd =3D cmd + " --define 'debug_package %{nil}'"
      cmd =3D cmd + " --define '_tmppath " + workdir + "'"
+    cmd =3D cmd + " --define '__sysusers_path %{nil}'"
      cmd =3D cmd + " --define '_use_weak_usergroup_deps 1'"
      cmd =3D cmd + " --define '_passwd_path " + "/completely/bogus/path"=
 + "'"
      cmd =3D cmd + " --define '_group_path " + "/completely/bogus/path" =
+ "'"


I will send a V8 after more testing.

// Robert

>=20
> // Robert
>=20
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/3378
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/333=
0
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/330=
2
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/330=
7
>>
>> Thanks,
>> Mathieu
>>
>=20


