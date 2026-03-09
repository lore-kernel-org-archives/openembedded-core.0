Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80187EF36F8
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 07:26:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8875.1773041184943780408
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 00:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dmaGiSLX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7528c4c72f=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6295kYPT2231139
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 00:26:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=C8gy5xyDeIh01CdrFDiFIvZcSIRjMUVnxHYtnRzbWcs=; b=
	dmaGiSLXacIbUZht1QY6Jn+Rr0SGY7Axzb3BOE8gBX6KxwBVkkhu1tI7VhSmLflb
	oiCrAf6K8x1s/SaSheMOxZQSNzelKaojiGRQRXYvMWa0nbu6SRGOLqfmQG7uowt6
	/xcvq0uIlNNc28oY+9l1uwQcWb0RsZ217TkDGDKYT/90n8xH/yfsifZdG0U4bzEp
	+qy3/HBJ5U7WI0VmkFvS1hdKyNAKr2rBe9T0Df53Y0SlcTsc5AbWnn0hQkUCpobJ
	MO1yqJ91npTAF+R18Ht29z0ZnySz+TS25ZIGQucfYzV6ZKeUay0Iwq8NfNLnl97o
	2J57YDvYYEKK+e7FUs77yw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011021.outbound.protection.outlook.com [52.101.57.21])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crmdm16x3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 00:26:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tl0/6LUOLVzkz/w8Roo4Qux1OMlOxeSNLmWgp8hBTdqLrN9SKNgmuu4JAbt3fZdXEkowHfATYEucpWNeJbLSEHPWUGdFfXRFzF/gU5omTkksQR1QS0nmXJ1qHarQYm3/DQALBXSeuL+gWUaa63H3x34pyVeC7kfLYjK8v8+/sEsj5GDny0j3+LYpdysdc81Gk4J14MeZpyYa9MluGwpmxnnm6zOgxsyzf2RmenS6JI8kZjG7ihGKh1ARK9rly3HJlOqGsclTHOVI/bhQhdwWl/3nkKejf6yMl28Jf/gJcotsLNup90jU2wmyw33M0VdnxO4wUZLd/9xh7b9qaPRfpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8gy5xyDeIh01CdrFDiFIvZcSIRjMUVnxHYtnRzbWcs=;
 b=lhtvO6bhV+Z1nd7p1Qdx+nOm/01VjKjH1JOrWioOr0MtjcpYVYRPiursjguzLQO5ZtTiFp5dIvVyoj2uHZpXemkoVgGSRCf52M5/ON41UPGag5vHTKovOW37+hA3rm5BDTgU6lcHMj4GE6trZbAh30rg6SOPk9A49QcxfoaM6r8ILa/AErHIv7Z7M1HCKiFZH7s2B0vOEEeUVPQaoUxhG5gxWwW7S9B7UNx8VuCcJr6UUezQ5fN0ajOlzI+CKtBYxTeoJIXSksNB2c1wwRZCQhTzuxqelJ4eNSZVXfCafmB5VjDU8O1K8eowHNoor4T+K6OJolyL/ewkcS+oEE4jAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by IA3PR11MB9063.namprd11.prod.outlook.com (2603:10b6:208:57d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 07:26:20 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 07:26:20 +0000
Message-ID: <dea8a50e-cd53-4b8d-a2c6-a0b0b7929952@windriver.com>
Date: Mon, 9 Mar 2026 15:26:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v7 1/7] package_rpm.bbclass: Drop external
 dependency generator to support rpm 6
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
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <DGY263XJ28Q5.S68LXPC7JMI6@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|IA3PR11MB9063:EE_
X-MS-Office365-Filtering-Correlation-Id: c90e4e89-065f-4842-2559-08de7dad28eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	y3cyOeo+zCyZTIvBWBmNGqyHkI4png+VbZ/poLdoVhYfjObfbdRhIwjaFVuxlKcBr1rI1TN6VIVTvQ80rpgq8XzJx9c7PhsDpCR/C5tlD4TxQH4PBCggNgdd6xGjjZPUluzhjxJ76UINFJbmhr4HtnHTvxHwy4Vt5o6wcJr4z+8zgf9kG7f2wN15tnyKFzyHfy9RFOs88eEnsAfQcFvTm9K/RyxiRlfetfAPu7O9farWnA8v0AGFzYB5Pjv8n7KhzZFPxXek7xw6LVH6CgA3Mhh/tNToELURdOuXrSgx9fP9V+pdnZ0bFykY+pVZolpjSBUjRK2GDbQww09gErcGJ89Gdd8EGV8icIpKmHp/JW6lBewECZ0+/JO3up+X2RtWFHsFMKVuq3GvlTppm1F3fVzAY5V+yj+/yq+MieTcyxgntF0VzLQXdyjlbMG4ro7b48G70g9G2uI5psenOZHjChjoilWg40FIa6mWsRs+a83gAV/L7rKugc4718Fj5kfk1e7tLGCdheV0HkOFSTtb/xbBSnjm+tSiViKWtTjhIfvtAiUYoWJlDcGbAAoSzBLgyloYaV3OouQKxiibnOVrb1CC+V/fC8oKtC226pMirGcaxiOXSalgkZQm4DOBtqdkxRM6a9rCrG724l9MsGPgU8dQ5bltYiuIbcJU+9AWsmjV2V8yr20ldjo+cmMgC5sO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RTllbFJMQVJGTi9jaGsvdEpkMHVMcWY4OWZkOHo3TGN0Q2RaaWFwNnA3eStu?=
 =?utf-8?B?ZjJSWXZUeGdIRVkyWDF3Wks4eFdVS3pVSlB1T3pjdE0xMkRMa3JidW5nL3M2?=
 =?utf-8?B?Nk1XS1ptOUE1cmZPRXpDTlo3ZTdDTmpHbUMrYkJYOVhPOGJSR2tPOE5iMzZy?=
 =?utf-8?B?UXV2c0VBV1luN2V1eitqanYxeHNaOFE5SDViK3ZNME1MVXdFRmhjMnFpWWJ2?=
 =?utf-8?B?a3lhYWpoNGJHek0zNEZpSDZ2M1h5ZTJkOUNpNzlNeVhDV1gxSWNtZVE4am1y?=
 =?utf-8?B?YkJ2ai9BUXBzbmFEUW5ET0RuOUZ2OGlWd29oaHVXV05UdTB4RkV4RCtFdVY3?=
 =?utf-8?B?dmM1czV5QkxnMjRNUFU3S1ovTUdlSkx1cHByNGlXU0dVVXp0STcwaUNZVXZJ?=
 =?utf-8?B?YWpuVkVmUXhyZ2k4ckdTOTU0SmphNDlqNGFhRHJRZG9NdXhzSndXbW5jNWlY?=
 =?utf-8?B?L0hNWkMyQ25zRmZLVjhOTDNRdndBMjdMVHlWYUpZRkcvUTNnUk16Qk9UWDJV?=
 =?utf-8?B?K2dWYlZzbFk1N3lQdG9nWGJTRHFja0hHTUpUdVRoVytOVzVVanJ2SHJWWi83?=
 =?utf-8?B?by9ubXM4Umh1eTM4ZU9ubzYyWjFzOFVNUnZIdzhSS3dvMlNoZm1DeDZmeGY3?=
 =?utf-8?B?a1dBOE0zdnhwT2M0SEovRTI2QjBFNWZPL3hpQkljMlBMZUtyTnZvTkpNekps?=
 =?utf-8?B?d3VLRDlNZklZRnVMWW1rVEhlZlVVczZJRlp3aDVnMWZac2o3cmJFdlcyTlhG?=
 =?utf-8?B?ZEozblVCUmF0TW1adi9QNStkbEFVLzFXVElIWXpLaDRLTldISkZadnM0dDd2?=
 =?utf-8?B?MEdjNDlCQlR2d1Z2NmV1bjd2RGpSWEM4WjNOUHEzYjdTMC94clI0a3pBZlcx?=
 =?utf-8?B?Mm5IMGs4UHhxMElMK1M1ZTRxc2RxdmVoZkZxSCtQSmlreHdjT2E1YVlwbWpn?=
 =?utf-8?B?MUEzdkxPMDRoYUhzaEVTMGJVMXB5Mms5MlY2eUVYd2ZvOUV4NkpheWwvS0NT?=
 =?utf-8?B?R0g5NjEwTzFLdG5Lak85elRoZEVEUmxsTDZWTWNmcEVHNDBtZFVDZFpDRFRW?=
 =?utf-8?B?RnJsQm5YZi9YZitrWXIvdzhZN2dGZ3JlT0RJbkhvc3Q5NXh3MzNHdEVRbmJH?=
 =?utf-8?B?Q3d4am9VeHZYUDNyeTBMOVJLTWZDSlB0T21zY2tnaVFkSG9hY1p4a2N5OFU1?=
 =?utf-8?B?czRIYWJnTTloWm5hcWFVMnZYdEcvWkhHV2NWZlZqR3FsR2Njei9jS3lVRnpU?=
 =?utf-8?B?U3g3QlArQkN4Tnhvb0hHVjJDRGxSRWtSSGZObWtRbWh3dDBYVGwwTEEwQlNZ?=
 =?utf-8?B?UDlEU2hpdDZRbHpHZlNLYngvZUZSSEg4WWMxb3B2T0NQZGdodFpiSXVjMU9E?=
 =?utf-8?B?aXJhS1p4MVlvZEcrdkJwZ3R0bS9zMGxLc1FyQnVmKzdxc3VjUXYxVGtjdGZx?=
 =?utf-8?B?aXRWcXg3ekpTeTlzYmZ0VlJlVGozREVycm84RlVrdFhlY3JuUEpGZUdKZTFi?=
 =?utf-8?B?WjMzYVJZRENKWXRuQkxpSk1FQjBxZ3VtZ2ltTWtmNTN4a2VOVFU1TGM5VmFo?=
 =?utf-8?B?bjE4dWE1SndSTEMxYVp3Q1V6SWthSUJ6TENaNlQ3amNoTUl2a1lJd0tXNFFs?=
 =?utf-8?B?bVZkSDQ3ZU5jM0pid1B6WE9SYlBHaEp3SVdRcG84L3hnOFVBSlV2aHRYbDRK?=
 =?utf-8?B?NFB4eURFWWRsdW5yejJYMnU3UUxLUWRZVXo2Q05ySGdiRmU0KzRUTkdwbUhC?=
 =?utf-8?B?YUZRQ3p2L1dYeUUxVVFWU24zbFk1b3lNSlltM0l4Rkl4YzhKekZST3ZtS1Ay?=
 =?utf-8?B?VXJHK0o2ZExyTzdRT3dQQjFka25MZ0RaOUloNk9LdHg1dVJ6Y3NOYzQ4V2Ju?=
 =?utf-8?B?TUU4Q3NjV1owNE1CS0NBWkZycEQ4Q2prWUxiUEgvckxXL0pEWmZwM2dJdXg3?=
 =?utf-8?B?bGZVb295ZS92eHEvRXJZQjMvaStiMU1pRmhkaFQzV0hOeXBQRnRNVGNGSHBl?=
 =?utf-8?B?TjRYVWk3ODVVMDJyTU9HOGpRblhSRVhtSzRmWnBWNFFUZjgranV1dTdicmZl?=
 =?utf-8?B?ajY2c3pSSnlUNXVNQ0hFSWx4YlhUdC9kR0FvKy9saytXTHpyaFczeDNQaDZR?=
 =?utf-8?B?VDhzUlZySGx3SWxEdU8rTWpXNlREZzh5c29OY3UrQXFLaWZaMUZOZW55ei9i?=
 =?utf-8?B?UnN0V1p5NXdOVWwxK1JTNkc2dmRPYTRKa2pDN043aWVGQUJhbWQ4cDBET0Jo?=
 =?utf-8?B?dEsvTTRHc2JOM290cE1ieUpDVUR4cURFdDdaS0NOdU9rM3NDUEIySFRYM0lq?=
 =?utf-8?B?ME5KbjFVN2FQNlhlZHd4N2I0aVB5OW0rN0lxZldYa0ZsRVVnQUwzTkJLRENy?=
 =?utf-8?Q?147CzO4jbDjj2EQ8=3D?=
X-Exchange-RoutingPolicyChecked: 
	XLrZB3yklhqERfBZU1lnyvnGoodTGv4PCqQZdA95xpszIR9OXqN2qgwi7naF8gZSH7QpyrgDeGq1iPtXaoL/udVpGAVd9ZVPqhey2Ew/IWI9Dv2c/I0V6nr7Bj0lsPK8prZeBdVt4m9npGQLycG7f3oDWuEaXfMyP4tiZo0anPHthyWpO8Kxl+rWietrFrTcS0YXzkVTttjD+nByAooMaZb1nSGRUFBv9yjKCmjb7wnItR7Z4k/3/t+5HtQ2G/0x9nf899Ir+2SHoQFCp/AuorJMVnaOvUUXYq5Vp58uGjoYPEqXfyjQh/grrFGx4Cc6UMSWZ5PirFQf1hLXBos2tw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c90e4e89-065f-4842-2559-08de7dad28eb
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 07:26:20.5898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27M+wSnihlphoo/JZInSJ+rsl3k4wsRDFZ3nOG/P7m+U0k4Klwj1xY1eHodpBmXzhny86OqaP+mqXyMJnaOgS3gB5WaRp/48dVV6pIF89DM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9063
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: Jf5ICWZSkLMvyFtN0Zg0pT0BdmendBPX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2NiBTYWx0ZWRfX4Cdnz+bUmqvt
 mJuz3cDuf8K+uvosvnBMcCvAL7ROcN/JuDD5PNL8vPkchB6YbV6g2IuSfOknoOebFznhWmedzdH
 5zlXyfwG9+DURj0uChJ4OsRx1HNKllTJ7Z4aefdHIfvsjA890C497Wqf0A0qK7+a7qSi+LkDWt9
 kLsD3uuqGwkdJEoWgptxHb1YyY/Q7bnqQYbChvhkJGfMweB5x0mmugu4rWfQzSor59BObQh/qst
 a6di/xAPDPs4Y0wJDVvDFxS4Qpl9IIKtGdkqDxMRhleuvbvNbWJxtG8pb6IHu4xSMrOoyYLRHLd
 BzcuRB0ITBs04WojKDY65B+IZXXNJIIHqPh2Wqc9AJvXj7jthWw1zfnnekT7eXlZHlV1ru9zext
 Fi3BVVinKol4V9xCS/9fktHTj7n8lI9bcLNTl6uiCN5aJnrlJ9HgaJrhOF4FQng5xVpTvET0If/
 QMH/uO1m20Em9QYyuHQ==
X-Proofpoint-GUID: 5oaOO5nO_YAuO8VN8tiudfSGxwnSfMuW
X-Authority-Analysis: v=2.4 cv=QppTHFyd c=1 sm=1 tr=0 ts=69ae761f cx=c_pps
 a=UGDxSQ6JIm3CXF+tY3HRSA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=7jkV2KkuvO4vxkmOpg0A:9
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 07:26:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232685

DQoNCk9uIDMvOS8yNiAxNTowNCwgTWF0aGlldSBEdWJvaXMtQnJpYW5kIHdyb3RlOg0KPiBPbiBT
YXQgTWFyIDcsIDIwMjYgYXQgNDoyMiBQTSBDRVQsIFJvYmVydCBZYW5nIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIHdyb3RlOg0KPj4gSGkgTWF0aGlldSwNCj4+DQo+PiBPbiAzLzUvMjYgMDE6
NTIsIE1hdGhpZXUgRHVib2lzLUJyaWFuZCB3cm90ZToNCj4+PiBPbiBUdWUgTWFyIDMsIDIwMjYg
YXQgMTowMSBQTSBDRVQsIFJvYmVydCBZYW5nIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdy
b3RlOg0KPj4+PiBJJ3ZlIHVwZGF0ZWQgaXQgaW4gdGhlIHB1bGwgKHBhdGNoIDcpLiBATWF0aGll
dSwgd291bGQgeW91IHBsZWFzZSBoZWxwIHRvDQo+Pj4+IHJlLXRlc3QgaXQgaWYgUlAgaGFzIG5v
IG9iamVjdGlvbnMgb24gdGhlIGV4dGVybmFsIGdlbmVyYXRvcj8NCj4+Pj4NCj4+Pj4gICAgICBo
dHRwczovL2dpdGh1Yi5jb20vcm9iZXJ0bGludXgveW9jdG8gcmJ0L3JwbQ0KPj4+PiAgICAgIGh0
dHBzOi8vZ2l0aHViLmNvbS9yb2JlcnRsaW51eC95b2N0by90cmVlL3JidC9ycG0NCj4+Pj4NCj4+
Pj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGY4ZmEzMDkwMTk2YmFlM2UxMmFkNzZm
MTJmMTAxNzIyZDg0Y2EyMGE6DQo+Pj4+DQo+Pj4+ICAgICAgcnBtOiA0LjIwLjEgLT4gNi4wLjEg
KDIwMjYtMDMtMDMgMTE6Mjk6MDcgKzAwMDApDQo+Pj4+DQo+Pj4+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+Pj4NCj4+
Pj4gUm9iZXJ0IFlhbmcgKDcpOg0KPj4+PiAgICAgIHBhY2thZ2VfcnBtLmJiY2xhc3M6IERyb3Ag
ZXh0ZXJuYWwgZGVwZW5kZW5jeSBnZW5lcmF0b3IgdG8gc3VwcG9ydCBycG0NCj4+Pj4gICAgICAg
IDYNCj4+Pj4gICAgICBwYWNrYWdlX3JwbS5iYmNsYXNzOiBEZWZpbmUgX2xpYiBhbmQgX2xpYmRp
ciBmb3IgcnBtYnVpbGQNCj4+Pj4gICAgICBsaWIvb2UvcGFja2FnZS5weTogRG9uJ3QgYWRkIGxk
Y29uZmlnX3Bvc3RpbnN0X2ZyYWdtZW50IGZvciBnbGliYyBvcg0KPj4+PiAgICAgICAgbXVzbA0K
Pj4+PiAgICAgIGdsaWIvcHl0aG9uMy9hY2w6IEFkZCBwa2djb25maWcgdG8gUkRFUEVORFMNCj4+
Pj4gICAgICBsaWIvb2UvcGFja2FnZS5weTogRG9uJ3QgcmVkaXJlY3Qgc3RkZXJyDQo+Pj4+ICAg
ICAgdGFyZ2V0LXNkay1wcm92aWRlcy1kdW1teTogQWRkIHBrZy1jb25maWcgdG8gRFVNTVlQUk9W
SURFUw0KPj4+PiAgICAgIHJwbTogNC4yMC4xIC0+IDYuMC4xDQo+Pj4+DQo+Pj4+IC8vIFJvYmVy
dA0KPj4+DQo+Pj4gSGkgUm9iZXJ0LA0KPj4+DQo+Pj4gSSBkaWQgcGljayB0aGVzZSBjb21taXRz
Lg0KPj4NCj4+IFRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgZ3JlYXQgcGF0aWVuY2UuDQo+
Pg0KPj4+DQo+Pj4gV2UgaGF2ZSBzb21lIGRpZmZlcmVudCBlcnJvcnMgbm93Lg0KPj4+DQo+Pj4g
RVJST1I6IGNvcmUtaW1hZ2Utc2F0by0xLjAtcjAgZG9fcm9vdGZzOiBDb3VsZCBub3QgaW52b2tl
IGRuZi4gQ29tbWFuZCAnL3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL3FhLWV4dHJhczIvYnVp
bGQvYnVpbGQvdG1wL3dvcmsvcWVtdXg4Nl82NC1wb2t5LWxpbnV4L2NvcmUtaW1hZ2Utc2F0by8x
LjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vZG5mIC12IC0tcnBtdmVyYm9zaXR5PWlu
Zm8gLXkgLWMgL3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL3FhLWV4dHJhczIvYnVpbGQvYnVp
bGQvdG1wL3dvcmsvcWVtdXg4Nl82NC1wb2t5LWxpbnV4L2NvcmUtaW1hZ2Utc2F0by8xLjAvcm9v
dGZzL2V0Yy9kbmYvZG5mLmNvbmYgLS1zZXRvcHQ9cmVwb3NkaXI9L3Nydi9wb2t5YnVpbGQveW9j
dG8td29ya2VyL3FhLWV4dHJhczIvYnVpbGQvYnVpbGQvdG1wL3dvcmsvcWVtdXg4Nl82NC1wb2t5
LWxpbnV4L2NvcmUtaW1hZ2Utc2F0by8xLjAvcm9vdGZzL2V0Yy95dW0ucmVwb3MuZCAtLWluc3Rh
bGxyb290PS9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9xYS1leHRyYXMyL2J1aWxkL2J1aWxk
L3RtcC93b3JrL3FlbXV4ODZfNjQtcG9reS1saW51eC9jb3JlLWltYWdlLXNhdG8vMS4wL3Jvb3Rm
cyAtLXNldG9wdD1sb2dkaXI9L3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL3FhLWV4dHJhczIv
YnVpbGQvYnVpbGQvdG1wL3dvcmsvcWVtdXg4Nl82NC1wb2t5LWxpbnV4L2NvcmUtaW1hZ2Utc2F0
by8xLjAvdGVtcCAtLXJlcG9mcm9tcGF0aD1vZS1yZXBvLC9zcnYvcG9reWJ1aWxkL3lvY3RvLXdv
cmtlci9xYS1leHRyYXMyL2J1aWxkL2J1aWxkL3RtcC93b3JrL3FlbXV4ODZfNjQtcG9reS1saW51
eC9jb3JlLWltYWdlLXNhdG8vMS4wL29lLXJvb3Rmcy1yZXBvIC0tbm9ncGdjaGVjayBpbnN0YWxs
IGRuZiBwYWNrYWdlZ3JvdXAtYmFzZS1leHRlbmRlZCBwYWNrYWdlZ3JvdXAtY29yZS1ib290IHBh
Y2thZ2Vncm91cC1jb3JlLXNzaC1kcm9wYmVhciBwYWNrYWdlZ3JvdXAtY29yZS14MTEtYmFzZSBw
YWNrYWdlZ3JvdXAtY29yZS14MTEtc2F0byBwc3BsYXNoIHJwbSBydW4tcG9zdGluc3RzIGxvY2Fs
ZS1iYXNlLWMgbG9jYWxlLWJhc2UtZW4tdXMgbG9jYWxlLWJhc2UtZW4tZ2InIHJldHVybmVkIDE6
DQo+Pg0KPj4gSXQgbG9va3MgdGhhdCBzb21ldGhpbmcgaXMgd3Jvbmcgd2l0aCB0aGUgc3RvcmFn
ZS4NCj4+DQo+Pj4gLi4uDQo+Pj4gKysgdHIgLWQgJ1s6c3BhY2U6XScNCj4+PiAvdmFyL3RtcC9y
cG0tdG1wLlU0aWFKWDogbGluZSA5ODogdHI6IGNvbW1hbmQgbm90IGZvdW5kDQo+Pj4gKyB0ZXN0
IHggJyE9JyB4DQo+Pj4gKysgZWNobyAtLXN5c3RlbSAtLWhvbWUgL3Zhci9saWIvZGJ1cyAtLW5v
LWNyZWF0ZS1ob21lIC0tc2hlbGwgL2Jpbi9mYWxzZSAtLXVzZXItZ3JvdXAgbWVzc2FnZWJ1cw0K
Pj4+ICsrIHRyIC1kICdbOnNwYWNlOl0nDQo+Pj4gL3Zhci90bXAvcnBtLXRtcC5VNGlhSlg6IGxp
bmUgMTE0OiB0cjogY29tbWFuZCBub3QgZm91bmQNCj4+PiArIHRlc3QgeCAnIT0nIHgNCj4+PiAr
KyBlY2hvDQo+Pj4gKysgdHIgLWQgJ1s6c3BhY2U6XScNCj4+PiAvdmFyL3RtcC9ycG0tdG1wLlU0
aWFKWDogbGluZSAxMzA6IHRyOiBjb21tYW5kIG5vdCBmb3VuZA0KPj4+IC4uLg0KPj4+DQo+Pj4g
ICAgIEluc3RhbGxpbmcgICAgICAgOiBkYnVzLWNvbW1vbi0xLjE2LjItcjAueDg2XzY0X3YzICAg
ICAgICAgICAgICAgICAgICA2ODIvNzkwRXJyb3I6IENhbm5vdCBvcGVuIGZpbGUgL3Nydi9wb2t5
YnVpbGQveW9jdG8td29ya2VyL3FhLWV4dHJhczIvYnVpbGQvYnVpbGQvdG1wL3dvcmsvcWVtdXg4
Nl82NC1wb2t5LWxpbnV4L2NvcmUtaW1hZ2Utc2F0by8xLjAvb2Utcm9vdGZzLXJlcG8vcnBtL3g4
Nl82NF92My9kYnVzLTEtMS4xNi4yLXIwLng4Nl82NF92My5ycG06IFtFcnJubyAyXSBObyBzdWNo
IGZpbGUgb3IgZGlyZWN0b3J5OiAnL3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL3FhLWV4dHJh
czIvYnVpbGQvYnVpbGQvdG1wL3dvcmsvcWVtdXg4Nl82NC1wb2t5LWxpbnV4L2NvcmUtaW1hZ2Ut
c2F0by8xLjAvb2Utcm9vdGZzLXJlcG8vcnBtL3g4Nl82NF92My9kYnVzLTEtMS4xNi4yLXIwLng4
Nl82NF92My5ycG0nDQo+Pj4gVHlwZUVycm9yOiAnTm9uZVR5cGUnIG9iamVjdCBjYW5ub3QgYmUg
aW50ZXJwcmV0ZWQgYXMgYW4gaW50ZWdlcg0KPj4+IEZBVEFMIEVSUk9SOiBweXRob24gY2FsbGJh
Y2sgPz8/IGZhaWxlZCwgYWJvcnRpbmchDQo+Pj4NCj4+PiBodHRwczovL2F1dG9idWlsZGVyLnlv
Y3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy8yNi9idWlsZHMvMzI3MQ0KPj4+IGh0
dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzQw
L2J1aWxkcy8zMjc2DQo+Pj4NCj4+PiBJJ20gYSBiaXQgc3VycHJpc2UgYnkgdHIgZXJyb3JzIGhl
cmUsIGFzIGl0IGxvb2tzIGEgYml0IHVucmVsYXRlZC4gVGhlcmUNCj4+PiBpcyBhIHNtYWxsIHBy
b2JhYmlsaXR5IGl0J3MgcmVsYXRlZCB0byBzb21ldGhpbmcgZWxzZSBpbiBteSBicmFuY2gsIGJ1
dA0KPj4+IHRoaXMgc2VyaWVzIGlzIGNsZWFybHkgdGhlIGJlc3QgY2FuZGlkYXRlLiBJIHdpbGwg
a2VlcCB5b3UgdXBkYXRlZCBpZiBpdA0KPj4+IGZpbmFsbHkgbG9va3MgcmVsYXRlZCB0byBzb21l
dGhpbmcgZWxzZS4NCj4+Pg0KPj4+IEkgYWxzbyBnb3Qgc29tZSBtb3JlIHRyYWRpdGlvbmFsICJu
b3RoaW5nIHByb3ZpZGVzIiBlcnJvcnM6DQo+Pj4NCj4+PiBodHRwczovL2F1dG9idWlsZGVyLnlv
Y3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy83OC9idWlsZHMvMzMxNw0KPj4+IGh0
dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzgv
YnVpbGRzLzMzMjENCj4+ICAgPiA+IENhbiB5b3UgaGF2ZSBhIGxvb2sgYXQgdGhlc2U/DQo+Pg0K
Pj4gRm9yIHRoZSBhYm92ZSB0d28gZXJyb3JzLCBpdCBpcyBiZWNhdXNlIHRoZSBzc3RhdGUgY2Fj
aGUgaGFkIGJlZW4gcG9sbHV0ZWQuIEkNCj4+IG1vdmVkIHBrZ2NvbmZpZy1uYXRpdmUgZnJvbSBk
b19wYWNrYWdlIHRvIGRvX3BhY2thZ2Vfd3JpdGVfcnBtLCB0aGUNCj4+IGRvX3BhY2thZ2Vfd3Jp
dGVfcnBtIHN0aWxsIGNhbiBiZSBtaXJyb3JlZCBmcm9tIHRoZSBvbGQgKGJ1dCBiYWQpIHNzdGF0
ZS1jYWNoZS4NCj4+IEl0IHdvdWRsIHdvcmsgd2hlbiB0aGUgb2xkIHNzdGF0ZSBjYWNoZSBhcmUg
aW52YWxpZC4gU28gSSd2ZSBzZW50IGENCj4+IGdldHRleHQgdXBkYXRlIHBhdGNoOg0KPj4NCj4+
IFtPRS1jb3JlXSBbUEFUQ0ggMC8xXSBnZXR0ZXh0OiAwLjI2IC0+IDEuMA0KPj4NCj4+IEl0IHdv
dWxkIG1ha2UgbmVhcmx5IGFsbCB0aGUgc3N0YXRlIGNhY2hlIGludmFsaWQsIGFuZCByZS1idWls
dCBmcm9tIHNvdXJjZXMsDQo+PiB0aGVuIHRoaXMgc2hvdWxkIGJlIGZpeGVkLg0KPj4NCj4+IFdo
YXQgSSdtIHdvcnJpZWQgYWJvdXQgaXMgdGhhdCBnZXR0ZXh0IGlzIHZlcnkgYmFzaWMgcGFja2Fn
ZSwgSSBob3BlIGl0IHdvbid0DQo+PiBjYXVzZSBtb3JlIHRyb3VibGVzLiBJJ3ZlIGRvbmUgd29y
bGQgYnVpbGQgb24gcWVtdXg4Ni02NCBhbmQgcWVtdWFybTY0Lg0KPj4NCj4+IE90aGVyIHJlaXBl
cycgdXBncmFkaW5nIG1heSBhbHNvIGNhbiBtYWtlIHRoZSBzc3RhdGUgY2FjaGUgaW52YWxpZC4N
Cj4+DQo+PiAvLyBSb2JlcnQNCj4+DQo+IA0KPiBIaSBSb2JlcnQsDQo+IA0KPiBJIHJhbiBhIGJ1
aWxkLCBub3Qgd2l0aCB5b3VyIGdldHRleHQgcGF0Y2gsIGJ1dCB3aXRoIHRoZSBvbmUgZnJvbSB0
aGUNCj4gZ2xpYmMgdXBncmFkZSBieSBIZW1hbnRoLiBXZSBzdGlsbCBoYWQgc2ltaWxhciBlcnJv
cnMuDQo+IA0KPiBBbnkgb3Bpbmlvbj8NCg0KSXQgc2VlbXMgdGhhdCBub3cgdGhlIGZhaWxlZCBv
bmVzIGFyZSByZWxhdGVkIHRvICd0ciAnLCBhdCBsZWFzdCwgdGhlIHBrZ2NvbmZpZyANCmlzc3Vl
cyBhcmUgZ29uZS4NCg0KSSB3aWxsIGxvb2sgaW50byBpdCwgc29ycnkgYWJvdXQgdGhhdC4NCg0K
Ly8gUm9iZXJ0DQoNCj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92
YWxreXJpZS8jL2J1aWxkZXJzLzMvYnVpbGRzLzMzNzgNCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55
b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMjUvYnVpbGRzLzMzMzANCj4gaHR0
cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMjYv
YnVpbGRzLzMzMDINCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5
cmllLyMvYnVpbGRlcnMvNDAvYnVpbGRzLzMzMDcNCj4gDQo+IFRoYW5rcywNCj4gTWF0aGlldQ0K
PiANCg0K

