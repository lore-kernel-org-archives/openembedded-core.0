Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35A3CF6484
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 22:02:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19070.1763589747100433385
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 14:02:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=AMmqstVR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3418077aaa=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJLnRCH3570647
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 14:02:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=x/SAlaY2TSIBPcIcSc25/r
	hzJKcKfofkKY3Td6JbWks=; b=AMmqstVRS+p2YRUMslnKdbKkTf1iwumLl8pEGj
	3Y16We9gdP/kInDbwj6Nv6iGYbprvJh0XPNctINYb1fVaGH0FKNqOUeuvp0l4tiw
	3zKzxstuffmPPx048c2X8c1pgBqvXS7lrMEr4cNT1g9tJHqcKnGnL17hmjX8PJ2C
	lVsIz5xoq7jcPBfXsEwLWs9Ek/VmuPiGShPnjIQOxns/Pc2M2jqO9fSOXEoVZU/E
	/kozM0IG/V2HPJv7FmduoO3IPjEaAre4N7DqjHdO3bO2LS+dJsJXywiKOvFAT9+Z
	hvrsNApStov5nNaX9V9piMPIcv5CnKD+S1nMri2+cEbZg5kw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010006.outbound.protection.outlook.com [52.101.61.6])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aenp2wkyb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 14:02:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkxTvLfGTAPUVIWNXpnlNmjE/gIf6vNnz/LrV6lntMcD8Ge48j/kL4IBeK+8Xb4OitBqcYvDT7Rec6i7iEwRc7DAQBHLT+fKvASSsoPTGRUH4eecj+ofDYDOiCCN8I4h7x6ue1+cUAioljWU0qXiuWlFC0ErpE57sfHbuaDhILStlNdJ8X9Ldzx0PMgpAj3cwj3Mmdx6vEMJV0Bz2BOwc38kTn1gC/m4nzBSvpu7FG0NsrYQngm4cgUSS9mnv8iMjuDtu2vjv+WPlIH6mxu8ENO+GelWbaAX3bUZCN9Wr+RJmkzYVL2MzLwXE5Rs8OzimYKV9QRkEkHTNR1BhFf4Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/SAlaY2TSIBPcIcSc25/rhzJKcKfofkKY3Td6JbWks=;
 b=karYoUNwWPYZXzQdDWgYKnNw9bvpV2kNyY+FAo3F0Pg2CK9/u3wKOUNqNTbDVj8poTi6PKy3T+kG5oi33LmrBOL2pcixp7S0NG97e9HpREJwVdxPqgC22Lffv6CHjFlJKqGs6Cy/XeRz3ZOzsKLP420ml6SIurI1ijZB8fhi6CdTv0lsfJ9QNkgSO72dFoKXDIYaCPeYnDGnK2CxjIo6n+5pFPMBRKLfah5m+ghmMhZcUy6pPt9EFrawByKhRncFl2AnciNW1qwbZvEBPum32TalHJ5z4spmHwc3m9XcXazwn9UR2ZtA5tT1zqBeF2gVQaPRop+yh8TpzDKSYuJ0Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DS4PPFFF98E87FA.namprd11.prod.outlook.com (2603:10b6:f:fc02::63) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 22:02:19 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 22:02:19 +0000
Content-Type: multipart/alternative;
 boundary="------------G9Q7EwqcWH7yCG2Emoc0JxYt"
Message-ID: <5557a44f-e0e1-4017-a6b8-ab08ca97390b@windriver.com>
Date: Wed, 19 Nov 2025 17:02:16 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 00/11] Enable rust support for linux kernel
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr
References: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
X-ClientProxiedBy: SJ0PR13CA0112.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::27) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DS4PPFFF98E87FA:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e5b76f1-9a4b-4794-5a01-08de27b74edc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SDdtcTZCbUMxM3E4R3dhcmluaGo5dlB3M2xYQlprRkJGVkZ3ZlI5bVZxK2Ix?=
 =?utf-8?B?aW1veGdFdjFyWTBhdHMwT05XaEN6T3VtdW4ybHo1Yk9WVGdsL0ZuRksrbVFL?=
 =?utf-8?B?QzFXUE5Id1loME9Ielk2U3pSVjkzQWpmZnVJVnlOdnhxd2lyUzJCWThTVmdr?=
 =?utf-8?B?RmYxYy92ckdhWmpjSjNEU2lTbkMrM1A2VzJZMWpxOXdpQ2R2SWpjSHBxSzda?=
 =?utf-8?B?TURUcnlTT3RQOHNaYldUTDh2UW1vQUhacENCQ1pTam14aW9WZEVsT0NvWGw5?=
 =?utf-8?B?TWo3YmZ2UHBFVTBDSHMySHJBL1hML0lPUkVPMk5jdm0weUFnd0l0L2Jjd1Bo?=
 =?utf-8?B?Qk1uZk14ZG5KYXlYbVhuZmhRMUU3YWFVNlNGNmdrZjBMeTZNSXp1RzdheWRW?=
 =?utf-8?B?MkloVG1JZ0ZvZ3VaZ0lkTnFMOXk3RUxNSkt5RTBkYmNoaTlDS2xSdVBRaVpz?=
 =?utf-8?B?aVZCN1BpVm1uVlJEcmtCYjlOQzBYN1RpY3ROUWVrOW4yL3BBVnh4bnQ0UFVx?=
 =?utf-8?B?bTJHeFVmMEk4UGhTSjFGWG5DMXlzUFk5SjNqZEFpZW90RzZxRjQ4YSs2eUMr?=
 =?utf-8?B?QUxVUGJvQllJK3NIR3ZGdStUNHNyaHlnV2JBNWoxV2N4cU1sMUpQTVV5TlNt?=
 =?utf-8?B?ZFdpK042THIwcnZiWnNINmxTTy9GbjljQXYxT25lY3dSL0hzeld0SDg2MmRG?=
 =?utf-8?B?cU1ueWFuK3RHNDgvRmZFWjFKSGQzN1JYL2l1SHh4U3cvVytlcGNlNlFodXly?=
 =?utf-8?B?bUdkSXpqQy9Tc2k3eFlxVEVuVmlHSGhTc2luN1VUZWU5aHZPQUd5U1JQMFgw?=
 =?utf-8?B?TkljdlVlVjE4SWRuWDhKZU5nK2d2T0hjVzBiQlFxdyt0aTBUOHZIbDIwOEQ3?=
 =?utf-8?B?NVRWOG5GYm9vR1Z1c21JcHhLd0szdzlIWlZkY0t1eDBRMEhQYTFoT011S2tM?=
 =?utf-8?B?bjVUbWs0cFhiRUM1cGZVUytzSTFpY1JJa2pPTCtzS25MTE9kSmxTL0p0ak5P?=
 =?utf-8?B?NXhNYVQ5d2F4eGRuTUtkZDF4ZnVUb1l5ZEZFZC90RENvNU9ldVJRNlZFUEpF?=
 =?utf-8?B?dUVGVjBJUzAwdHpHMktPK3pKam0wMFlodng1RlBHYzg3UytjbzU3NkZYU0Zu?=
 =?utf-8?B?QTNCYTZoSDROWUNuRHRnMWFzVzk1OUZsZEVmRDgwZHNIWGNwYk0vWUpMRVJV?=
 =?utf-8?B?ZVp2L3R1cmJqYzBTejVVQTRBbGZZYWtXZUVyclFxaVNkaWxFT1lMZkNFclRG?=
 =?utf-8?B?aFpCbmFFYU54akF5cCtpeUZCT09USG1ZdjlOTlE1KzJ1RjBpK0d6bHJKRG8y?=
 =?utf-8?B?Yy92cHNONXJXNmVSeFBPR3lGWGtFeXhDOVZRQ0NPaHJIc2NLQmlKSHA5UHE5?=
 =?utf-8?B?UjdSSjh4RXdzNnlPS0JwT1c4VDNoaUV4VkV2TXZUeUVwU05ZMmFZWjJXeEVj?=
 =?utf-8?B?TmoxQlpjRlhuOUN5bm93d2tvV3NNYXR6UFNJdmFabjRWR1hDekl3YnZtcjQ3?=
 =?utf-8?B?MVNEdUtjTmMrUnNGcE9ndWtKWnNWcjJ0Nnl6d1hWeW9FNXgzMFZpU3hwVENm?=
 =?utf-8?B?NEdtUmZaRUJzVTdXL250eE1GRVBYNFUwd2hXbmJ5dEJZdXhTdkUwbUtKcVdj?=
 =?utf-8?B?M080MDlJSXBwQmZKdUVxUldBVmJGTUQxR3dZRWZHQmZuRVA3L0dKR0N1YzB4?=
 =?utf-8?B?VUxiazFLNEVZbUVQZGZmbDZXdUU0WDRrZERNQW93N2UvL0NNWEZtUU5WWXk4?=
 =?utf-8?B?UWpScjVBUnlac1VkMG53WGZtby83YVZlK2JlamZKdFp1K2kydSszb3ZqWUo1?=
 =?utf-8?B?NXkvY1VYUVdMSXBzNHkrOWJ4QlZnclRHN0R3L0h0eVI3WnJqTHMweHY1ejh5?=
 =?utf-8?B?aDJPTDBmREo5SFI2WEFnMlpJV2RiU2tYd0FxQ2gxeEE4dytXQzdsa3FHU2lS?=
 =?utf-8?Q?unz1npALaOyYGlU8pFj0+/b2g8Jw9BAq?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VFU0dXU3UHFQS09PNzVORzRJd3ZHM1FNbUUvNmxncmUzNk5NdE10aEhWZVFH?=
 =?utf-8?B?OE9Ob3JNSU9VdE1iZVJGMDgyYzFGWjFtS3c0bEI4Z3JsL2x3cGhHZkpkZlJN?=
 =?utf-8?B?QUlHQk5zZUJyb21jQXJsZWo1eWhzYzJEUHNQRFhoaFZIY0R6K2FMT1A3aHNI?=
 =?utf-8?B?NmZzb1R1bldyM0JmNGlXWHVrQzhabWhVcnFvRUxoLzRzL3NTQ1ZVSGJxclhM?=
 =?utf-8?B?YWs1NnFUV3diZlhldzQxNWJ1UzZUOSsxY0tVeUpYR1R5TnhpTG5FZ1NrWnk4?=
 =?utf-8?B?QVFaWk9hOUFRaXpkUno3UkhJSTNSa2ZXNURaZDZLa1pzTzhlckZnZnpNdzhU?=
 =?utf-8?B?ZTBlM3RWMENZQVU1K0luSCtldWswSkNCV3FPQnVhSDl1SU9yVHBQSkRraVVj?=
 =?utf-8?B?VU1XVERjeldxeGowdlRoaUpERWxtQ1dFR0lTbHlPb1I4VnJoVXBHNVJpK2U5?=
 =?utf-8?B?bW9SU2UrVWltY29rR0dGV1hyTUdNSkJyOHdTOEhGak0yUWZ3YWxoZlhOUWlW?=
 =?utf-8?B?S2tHNU5lZHZrczdwOFhZSkFBTEJJbFRwOUV2WmFwMUJVbWEyVG4yRnpNb2RJ?=
 =?utf-8?B?MW0vY3ppTHozSzZkZDNsYkJTTGJaQ0FTSnZOaWRUSHRrcnE3OWlsMW5aZktu?=
 =?utf-8?B?c0FXd3NqdkpwQXMrTDVpSUtaellZWXFpeHcrbnVXS3d6bVhURDJQM09JSnVx?=
 =?utf-8?B?VFlrL0d0cGRyUDBUVEJiaVg0alZnVHRFeE5OQjRrcmdTdGNDS3BXT2V3QmQw?=
 =?utf-8?B?NjdxWHFDa3F0TmZWOVREM20vTkE4WElJZStsTjNKNGdXWVlUTnFPSU1vSFdJ?=
 =?utf-8?B?SXRQRWtvcWlJVjdZV2FqQ21RMk9ONVlIQjFXbDBBK2RKOGdIcDRtVGlNMGN4?=
 =?utf-8?B?TGdQUHhLY0tCN1VYcVIxUWF1UFhVTDg1cCs2d2hCU1FqUWExY3hGejZWT3Jz?=
 =?utf-8?B?YUE0VDNPcTNrS1FUcWtrMHk3WDgzZ24rVFlKaUpHWFBzTTM4L3c2cDc3dTA5?=
 =?utf-8?B?VXBTenZrVnFpcVk4U2gzZUJJQ1J0NUlkenpLMVF0Z3ViVzVNS0dKdTN6TnY0?=
 =?utf-8?B?VEU0RzV1a0R1YW9hWTNXcnN5K2dTWkcySlFaajVBUlB6Zjg5eWh3WHBXZ2c2?=
 =?utf-8?B?dlh1NnpVazFGeGVoK2pUdmdpazNTcy9obGZab2thREZOTnkxdlByMU5EWEtv?=
 =?utf-8?B?MUpnS1BTUnFKZEVuakgrcnI4MHMxbkNpNTBsVHNzVlhJMTNZbzBsN3ZNL2Rx?=
 =?utf-8?B?VHJ2b29Cemtud3QzRC9qOTk2RGVPRmxydlhOVm9Jek1MaFVpcHpkNHQ0eGVI?=
 =?utf-8?B?Z2MrN2VlZDMwUFZkajI2VlV3RUdLenZNUkdOTmlOUjJtL3luVFVIdDlsaTJQ?=
 =?utf-8?B?Q0ovZnI1cG9qSGdTelN1T3BsNmpaN2V4TlRDZnFITFZrOEZGOGwvWUtxeWNq?=
 =?utf-8?B?d0M0OEZ3cTJFbnoxZkpMTXJiMHZtZHo4OE1zSjU0cWpEZXZUbUhoeGMwMXhq?=
 =?utf-8?B?QnRNamsrQ3JLZzdiaGF2V0NpMVRZQ2tkVzlRV3I2VWVucFVBY0l3cDFJNU1n?=
 =?utf-8?B?NWpJcEFBWXRzRTAxdkpzaWd5VXZQNmxUOHFyWGI5bXhvVVlPcWFiMTdNQjdu?=
 =?utf-8?B?RmlmaVRRYms0U0dETHVacnF2LzZiMDJhK0M1ai9RNVUrNUo4OFJDaHc3Y0ZT?=
 =?utf-8?B?QXhNc2FtdDIxVWVYb2hHeXJEYjB5NVRyR2VzdmRvbjBsUWpUNVlXT3ZjMDFi?=
 =?utf-8?B?K2hQREJoV3pzVzU1ZXd1Y01ySE1rSHBwa2hyOVczNUZTTDNJT0hGYm1uMDRa?=
 =?utf-8?B?aHFvZCttRnVaYnNzWlVBWTd5UlAyekFTMWloNUYvWHcyT0NRTjd1UXdDNmNP?=
 =?utf-8?B?Njk3WVgwdTdGcjk5bVRoWjNNY0o2RnFtTFJtMUtwKzR5aVhsdjRsUE9FR3hk?=
 =?utf-8?B?Wk1BTEFnOFVVVE05SldmYmpEWHRqcGhmN3ViV2xkamJPT3R2cnZZdnlEVUJv?=
 =?utf-8?B?T0dlNTFDcTd5TjJMTFZpVVRUNDJrNnZxRXpqRWFuWWF6dVJFVjJMZWFzZmpC?=
 =?utf-8?B?YWRnVnJmVGdzeHFQLytFVmtTL0kyZW8rNEs3WE5zcEMzY3dpOHNxd0dyc0lm?=
 =?utf-8?B?bVVrL3RFWi91eDJ0a2V6OWZ0TmE0WWcvQm9pTHJEdHVrTUpGVk1nWmd5YlZo?=
 =?utf-8?B?bFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e5b76f1-9a4b-4794-5a01-08de27b74edc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 22:02:19.0234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uw0TYYMsH4LdLcDwZ+JRz74fXhjdsMbIwzP9yAjTb7U6t9haXZu+qrLqtRST87d2VtAq9ZuZwmlIdGEahEI++d2AAXpmpjw+yU27aBZ1uzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFFF98E87FA
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDE3MiBTYWx0ZWRfX1G2+WWuerBtD
 qcGSC5fvKJ5ajDpq8Kbgs525lB9OqlxNnLfFL7cqPzHKNCAOuKnb7Rp5BiXRIcJjWlw59c6Y9KC
 C65fHe4s22tvQ6WKUzH3a8TXUWIfKoTWoBCET8cUCAN6K1nn/M5CB6I5cRoXyf7BCelw90d9rk4
 1O3uonPj//3tP/VsRjk8Gyf7IvKI66N095jyoQ1JjpuoE7FiOOoBC23R9janITsJLM7CdUTlx8t
 IPCw/TxyMeuHqTNXp0VTehxBoJK7HJUOKaDKYC5aySOvpEZZfYSx/rkeqJHc3ImOnZyx2Kybk5F
 6d91qWsjJMPAWH9TdbZp+nwszxUqz8Iuu8ZBBGacizCpFo6q7zcOqTXs08QBzjVh3t1SHvPoh3w
 7CjlOfBL7paJ3PLGY1sNY7q9URvUtw==
X-Proofpoint-ORIG-GUID: ulDIiCWzA4uHjgt7IWhfrsA5-h3DIqjM
X-Proofpoint-GUID: 0hoXlK5kCV8uwVjfl-5dApPtlOjvTDyM
X-Authority-Analysis: v=2.4 cv=Z6Xh3XRA c=1 sm=1 tr=0 ts=691e3e72 cx=c_pps
 a=h5F5dVrtafxD4HcxutFXpg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=ktMQgidfe3c9mytpCMkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8o4fqTwK8Fz0gpk:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_06,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190172
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 22:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226599

--------------G9Q7EwqcWH7yCG2Emoc0JxYt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AJLnRCH3570647

On 2025-11-19 11:47 a.m., Harish.Sadineni@windriver.com wrote:
> From: Harish Sadineni<Harish.Sadineni@windriver.com>
>
> v3:
> - Addressed v2 review feedback regarding adding dependencies to a varia=
ble and assigning them using (?=3D).
> - Moved staging of Rust libraries for the Linux-Yocto 'make rustavailab=
le' step from linux-yocto.inc
>    to kernel-yocto.bbclass.
> - Made copying of the Rust library directory into tmp/work-shared optio=
nal and performed only when
>    building rust-native when rust-kernel is present in DISTRO_FEATURES.
> - Split rust.cfg into three separate config fragments: rust.cfg, rust-s=
amples.cfg, and rust-debug.cfg.
> - Disabled ccache for Linux-Yocto builds when rust-kernel is present in=
 DISTRO_FEATURES
> - Added an oe-selftest case for the Linux Rust sample
>
>
> Summary of changes:
>
> - Patch 1: Extend 'bindgen-cli' to support 'nativesdk', allowing it to =
be available in the SDK environment.
> - Patch 2: Add required dependencies ('clang-native', 'rust-native', 'b=
indgen-cli-native') to the kernel to support Rust binding generation.
> - Patch 3: Install the Rust standard library source ('library/') into `=
work-shared` and which will be later copied to
>             linux-yocto recipe-sysroot-native.
> - Patch 4: Added 'rust-kernel' to DISTRO_FEATURES_FILTER_NATIVE and DIS=
TRO_FEATURES_FILTER_NATIVESDK, the 'rust-kernel' feature automatically
>             propagates from target DISTRO_FEATURES to native/nativesdk =
builds
> - Patch 5: Stage the Rust sources into `recipe-sysroot-native` for kern=
el build compatibility, making them visible during native builds.
> - Patch 6: Update `kernel-yocto.bbclass` to invoke `make rustavailable`=
 during 'do_kernel_configme', ensuring Rust readiness.
> - Patch 7: Add kernel configuration support for Rust (via 'rust.cfg' an=
d 'rust.scc'), enabling the Rust build options in kernel config.
> - Patch 8: Fixed buildpaths errors when rust is enabled for kernel by a=
ppending --remap-path-prefix to RUST_DEBUG_REMAP
> - Patch 9: Disabling ccache when rust-kernel is enabled for linux-yocto.
> - Patch 10: Copy Rust kernel sources into kernel-devsrc build directory=
 which will be required while running 'make prepare' in sdk.
> - Patch 11: Added an oe-selftest case for the Linux Rust sample.
>
> Benchmark test-result for x86-64:
>
> For bitbake core-image-minimal
> +-------------------------------+------------+-----------+-----------+-=
----------+
> | DISTRO_FEATURES               |   real     |   user    |    sys    | =
 FS usage |
> +-------------------------------+------------+-----------+-----------+-=
----------+
> | rust-kernel (enabled)         | 46m1.720s  | 0m28.864s | 0m3.696s  | =
  58 GB   |
> | rust-kernel (disabled)        | 30m1.053s  | 0m20.091s | 0m2.748s  | =
  33 GB   |
> +-------------------------------+------------+-----------+-----------+-=
----------+
Thanks for reporting on the time and space bloat.
>
> The increased in time & fs usage is due to kernel rust dependencies in
> linux-yocto. These will get solved by using pre-built binaries from
> meta-rust-bin (WIP).
We haven't decided if let alone how we're going to ensure that a
quick kernel build with rust enabled is still fairly quick.

We can look into meta-rust-bin as I suggested but we should be
evaluating it and sharing the pros and cons rather than thinking that

this approach will solve the "rust takes forever to build" problem.

>
> WIP:
>
> - I am  working on try to use make use of prebuilt binaries for rust an=
d cargo using meta-rust-bin layer which is having compatability issues
>    with oe-core master branch.
> - rust-out-of-tree kernel module recipe and selftest is in progress (by=
 Yoann Congal)
>
> Test results:
> - tested with oe-selftest case for the Linux Rust sample for  x86_64 an=
d arm64.
> - tested with rust-out-of-tree kernel module in sdk for x86_64 and arm6=
4.

Very nice work Harish.

One more thing that isn't a requirement for being able to support=20
linux-yocto with rust enabled but

at some point, we want to test that self-hosted rust-enabled kernel=20
development works.

As a non-urgent, unless Bruce demands it, task could you try installing:

 =C2=A0=C2=A0 packagegroup-core-buildessential.bb
 =C2=A0=C2=A0 packagegroup-rust-sdk-target.bb

and then on target, clone a kernel tree and try manually compiling
a rust-enabled kernel (module)?

Thanks,

../Randy


>
> If everthing is fine, Can we send this as patch?.
>
> Harish Sadineni (9):
>    bindgen-cli: extend BBCLASSEXTEND to include nativesdk
>    linux-yocto: add clang-native,rust-native and bindgen-cli-native to
>      DEPENDS
>    rust: install Rust library sources for 'make rustavailable' support
>    bitbake.conf: Include "rust-kernel" in native/nativesdk feature
>      filters
>    kernel-yocto: stage rustlib sources for linux-yocto 'make
>      rustavailable' support
>    kernel-yocto: add rust support via "make rustavailable" in
>      do_kernel_configme
>    linux-yocto: enable Rust support in kernel configuration
>    kernel-yocto: Fix for buildpaths errors when rust is enabled for
>      kernel
>    kernel-devsrc: copying rust-kernel soucre to $kerneldir/build
>
> Yoann Congal (2):
>    kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled
>    selftest/cases/runtime_test: Add test for Linux Rust sample
>
>   meta/classes-recipe/kernel-yocto.bbclass      | 28 ++++++++++++++++++=
+
>   meta/conf/bitbake.conf                        |  4 +--
>   meta/lib/oeqa/selftest/cases/runtime_test.py  | 24 ++++++++++++++++
>   .../bindgen-cli/bindgen-cli_0.72.1.bb         |  2 +-
>   meta/recipes-devtools/rust/rust_1.90.0.bb     | 17 +++++++++++
>   .../recipes-kernel/linux/files/rust-debug.cfg |  1 +
>   .../recipes-kernel/linux/files/rust-debug.scc |  3 ++
>   .../linux/files/rust-samples.cfg              |  4 +++
>   .../linux/files/rust-samples.scc              |  3 ++
>   meta/recipes-kernel/linux/files/rust.cfg      |  3 ++
>   meta/recipes-kernel/linux/files/rust.scc      |  3 ++
>   meta/recipes-kernel/linux/kernel-devsrc.bb    |  4 +++
>   meta/recipes-kernel/linux/linux-yocto.inc     |  2 ++
>   meta/recipes-kernel/linux/linux-yocto_6.16.bb |  2 ++
>   meta/recipes-kernel/linux/linux-yocto_6.17.bb |  2 ++
>   15 files changed, 99 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-kernel/linux/files/rust-debug.cfg
>   create mode 100644 meta/recipes-kernel/linux/files/rust-debug.scc
>   create mode 100644 meta/recipes-kernel/linux/files/rust-samples.cfg
>   create mode 100644 meta/recipes-kernel/linux/files/rust-samples.scc
>   create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
>   create mode 100644 meta/recipes-kernel/linux/files/rust.scc
>

--=20
# Randy MacLeod
# Wind River Linux

--------------G9Q7EwqcWH7yCG2Emoc0JxYt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-11-19 11:47 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:Harish.Sadineni@windriver.com">Harish.Sadineni@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251119164804.256364-1-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>

v3:
- Addressed v2 review feedback regarding adding dependencies to a variable and assigning them using (?=).
- Moved staging of Rust libraries for the Linux-Yocto 'make rustavailable' step from linux-yocto.inc
  to kernel-yocto.bbclass.
- Made copying of the Rust library directory into tmp/work-shared optional and performed only when
  building rust-native when rust-kernel is present in DISTRO_FEATURES.
- Split rust.cfg into three separate config fragments: rust.cfg, rust-samples.cfg, and rust-debug.cfg.
- Disabled ccache for Linux-Yocto builds when rust-kernel is present in DISTRO_FEATURES
- Added an oe-selftest case for the Linux Rust sample


Summary of changes:

- Patch 1: Extend 'bindgen-cli' to support 'nativesdk', allowing it to be available in the SDK environment.
- Patch 2: Add required dependencies ('clang-native', 'rust-native', 'bindgen-cli-native') to the kernel to support Rust binding generation.
- Patch 3: Install the Rust standard library source ('library/') into `work-shared` and which will be later copied to
           linux-yocto recipe-sysroot-native.
- Patch 4: Added 'rust-kernel' to DISTRO_FEATURES_FILTER_NATIVE and DISTRO_FEATURES_FILTER_NATIVESDK, the 'rust-kernel' feature automatically
           propagates from target DISTRO_FEATURES to native/nativesdk builds
- Patch 5: Stage the Rust sources into `recipe-sysroot-native` for kernel build compatibility, making them visible during native builds.
- Patch 6: Update `kernel-yocto.bbclass` to invoke `make rustavailable` during 'do_kernel_configme', ensuring Rust readiness.
- Patch 7: Add kernel configuration support for Rust (via 'rust.cfg' and 'rust.scc'), enabling the Rust build options in kernel config.
- Patch 8: Fixed buildpaths errors when rust is enabled for kernel by appending --remap-path-prefix to RUST_DEBUG_REMAP
- Patch 9: Disabling ccache when rust-kernel is enabled for linux-yocto.
- Patch 10: Copy Rust kernel sources into kernel-devsrc build directory which will be required while running 'make prepare' in sdk.
- Patch 11: Added an oe-selftest case for the Linux Rust sample.

Benchmark test-result for x86-64:

For bitbake core-image-minimal
+-------------------------------+------------+-----------+-----------+-----------+
| DISTRO_FEATURES               |   real     |   user    |    sys    |  FS usage |
+-------------------------------+------------+-----------+-----------+-----------+
| rust-kernel (enabled)         | 46m1.720s  | 0m28.864s | 0m3.696s  |   58 GB   |
| rust-kernel (disabled)        | 30m1.053s  | 0m20.091s | 0m2.748s  |   33 GB   |
+-------------------------------+------------+-----------+-----------+-----------+</pre>
    </blockquote>
    Thanks for reporting on the time and space bloat.<br>
    <blockquote type="cite" cite="mid:20251119164804.256364-1-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">

The increased in time &amp; fs usage is due to kernel rust dependencies in
linux-yocto. These will get solved by using pre-built binaries from
meta-rust-bin (WIP).</pre>
    </blockquote>
    We haven't decided if let alone how we're going to ensure that a<br>
    quick kernel build with rust enabled is still fairly quick.<br>
    <br>
    We can look into meta-rust-bin as I suggested but we should be<br>
    evaluating it and sharing the pros and cons rather than thinking
    that <br>
    <p>this approach will solve the &quot;rust takes forever to build&quot;
      problem.</p>
    <blockquote type="cite" cite="mid:20251119164804.256364-1-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">

WIP:

- I am  working on try to use make use of prebuilt binaries for rust and cargo using meta-rust-bin layer which is having compatability issues
  with oe-core master branch.
- rust-out-of-tree kernel module recipe and selftest is in progress (by Yoann Congal)

Test results:
- tested with oe-selftest case for the Linux Rust sample for  x86_64 and arm64.
- tested with rust-out-of-tree kernel module in sdk for x86_64 and arm64.</pre>
    </blockquote>
    <p>Very nice work Harish.<br>
      <br>
    </p>
    <p>One more thing that isn't a requirement for being able to support
      linux-yocto with rust enabled but </p>
    at some point, we want to test that self-hosted rust-enabled kernel
    development works.<br>
    <p>As a non-urgent, unless Bruce demands it, task could you try
      installing: <br>
      <br>
      &nbsp;&nbsp; packagegroup-core-buildessential.bb<br>
      &nbsp;&nbsp; packagegroup-rust-sdk-target.bb</p>
    <p>and then on target, clone a kernel tree and try manually
      compiling <br>
      a rust-enabled kernel (module)?</p>
    <p>Thanks,</p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20251119164804.256364-1-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">

If everthing is fine, Can we send this as patch?.

Harish Sadineni (9):
  bindgen-cli: extend BBCLASSEXTEND to include nativesdk
  linux-yocto: add clang-native,rust-native and bindgen-cli-native to
    DEPENDS
  rust: install Rust library sources for 'make rustavailable' support
  bitbake.conf: Include &quot;rust-kernel&quot; in native/nativesdk feature
    filters
  kernel-yocto: stage rustlib sources for linux-yocto 'make
    rustavailable' support
  kernel-yocto: add rust support via &quot;make rustavailable&quot; in
    do_kernel_configme
  linux-yocto: enable Rust support in kernel configuration
  kernel-yocto: Fix for buildpaths errors when rust is enabled for
    kernel
  kernel-devsrc: copying rust-kernel soucre to $kerneldir/build

Yoann Congal (2):
  kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled
  selftest/cases/runtime_test: Add test for Linux Rust sample

 meta/classes-recipe/kernel-yocto.bbclass      | 28 +++++++++++++++++++
 meta/conf/bitbake.conf                        |  4 +--
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 24 ++++++++++++++++
 .../bindgen-cli/bindgen-cli_0.72.1.bb         |  2 +-
 meta/recipes-devtools/rust/rust_1.90.0.bb     | 17 +++++++++++
 .../recipes-kernel/linux/files/rust-debug.cfg |  1 +
 .../recipes-kernel/linux/files/rust-debug.scc |  3 ++
 .../linux/files/rust-samples.cfg              |  4 +++
 .../linux/files/rust-samples.scc              |  3 ++
 meta/recipes-kernel/linux/files/rust.cfg      |  3 ++
 meta/recipes-kernel/linux/files/rust.scc      |  3 ++
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  4 +++
 meta/recipes-kernel/linux/linux-yocto.inc     |  2 ++
 meta/recipes-kernel/linux/linux-yocto_6.16.bb |  2 ++
 meta/recipes-kernel/linux/linux-yocto_6.17.bb |  2 ++
 15 files changed, 99 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/files/rust-debug.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust-debug.scc
 create mode 100644 meta/recipes-kernel/linux/files/rust-samples.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust-samples.scc
 create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust.scc

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------G9Q7EwqcWH7yCG2Emoc0JxYt--

