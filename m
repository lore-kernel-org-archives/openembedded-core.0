Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E93CC28B2F
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 04:39:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6352.1741927139975879181
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 21:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5168aca9f0=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E4ZlVr028489
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 21:38:59 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0j4tvts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 21:38:59 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52E4cwnP032230;
	Thu, 13 Mar 2025 21:38:58 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2045.outbound.protection.outlook.com [104.47.57.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0j4tvtr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 21:38:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZL3m9hYm+aK91mnJvxdRtVB+O5kaUrJWfoTq1PtfFMCa/yYTHOb4Ye+gfXhM1TfIsu37VC2+ErT5q6W2amyOzFv8RSQjWa7b1xtoFKoEO0V5AQVVEokWR1eObe44iArgWCEtgjJCC6l8NyCcu2muiu2QakFc1ZxlZnE5V81YNv53wYahT5EJ26nlWzsJvFnkx36B6N/eg6gC18yerBHdp0r40SoLkRBqKorkmwrrwifIiUIgkbgLxI/BrjpZVMmKLJ8e/y9EJlj9Nx3pv2wmiMaCyJdfjw54PoLUirvxK79eA5YkgV5TTEKANPQReggJry2k+gIQfV/pLnC+ZSeMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwJ3djcv1LGohZRgVkhC4LC762G7R8nYS/9gJB/nt2g=;
 b=ysnfUqSwm9TPFcnkP/TX/a3xZEbIxnMjpk3OV6uPBU6z8uZf/Xw8MyVv7Y0fNeWWbIc88uSbxMHyjniTGxsvTpOHrXarIhWIo+DixotDw5Ow4fW+tvCjdR+HzgLbf6rqi0NJmdBF/IpyfRGThD7iZydbAnUlistOxKuOSDCOQtBiJV2jw4nlg85elOxM4jiAitswKUgXko6cU4utfxOcuneWOH2W5bRMbW0WebHRxLYX+b5nOpdizh2s4PYuxIrm5vrqK5xhhGprVUzoPdYZxenAbvucn3mQZsGpoFrAX7ENgZ+9CzJsqFwf/BepfiMwO+vslzFcgpdtzvAkewtF+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA1PR11MB6845.namprd11.prod.outlook.com (2603:10b6:806:29f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Fri, 14 Mar
 2025 04:38:55 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 04:38:55 +0000
Message-ID: <013eb7e2-7096-4529-a6a8-e981119af44a@windriver.com>
Date: Fri, 14 Mar 2025 10:08:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V4 2/3] rust: Upgrade 1.82.0->1.83.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20250305134459.2275598-1-Deepesh.Varatharajan@windriver.com>
 <20250305134459.2275598-2-Deepesh.Varatharajan@windriver.com>
 <CANNYZj-sGPdJT9XghUQQ2XOvn+QatnH0fqP7_Kg5WQHYmyXtmQ@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CANNYZj-sGPdJT9XghUQQ2XOvn+QatnH0fqP7_Kg5WQHYmyXtmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::35) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA1PR11MB6845:EE_
X-MS-Office365-Filtering-Correlation-Id: 03f8bfb5-4115-44cc-1b56-08dd62b22096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T2Z3R0NqUE9sNDhZZkRQZ1FSYjk4NGlpVXp2KzFqK1I2SnR2Q045Q3JIdUxH?=
 =?utf-8?B?Z3oyaVFLUTRDZzE5OC9td3Q2UVo3YjI0QjR3c0Y2VGlyeDJ0eW1YMFFOM2Rz?=
 =?utf-8?B?MWJCbjQ0YmtEZzBxS2JiSVBpclIyQVhZZFlvS3FtbHhqcFFsWjE5T3VtSHVp?=
 =?utf-8?B?dVAzNXJpRytqMnFTUU02M2p2dVhQNlpLM1FtdnlWT1FkcXJzVDd2UENYT0xu?=
 =?utf-8?B?ZFdLZW5LeGt1VGtPUE0xUlUzVXdoYkdORTN6Sm9NVGhHV2NJUE1RTjJTcFh0?=
 =?utf-8?B?emdtdW1yM1JjQW9PYXg4aFU0RGJ1WFRPSkVUdDNzVmQ5SkZXZm5ONk1sd1gz?=
 =?utf-8?B?Y2dIL0VyVzdXZ3crUVpXZFpJWmEvbnlmNGZzbWtFelV4UDJqUUZtRHBOVnFz?=
 =?utf-8?B?U1NRM3h1a3Fxd0JCaUI0SkJSVlpmZURaaGxCSDNsNERobnJweW4wZlBEZ0pV?=
 =?utf-8?B?YWcyRjAvQXlsTkQyMm0yY1ozdnBuR0xhU2wxbXNuKzZMYTJrREpyTURTR3Y1?=
 =?utf-8?B?L1oxSzhaZWRDZGJBczBLTlZON1o2N0x0dUFGQnhnVTZGZXRSU3k2OFBJS3E3?=
 =?utf-8?B?N2N2QjRLTG9QaUVzZmdvaEx1QWlEWmxTY2JGMHVKZVNpQzMrazJiL2g1Q3BB?=
 =?utf-8?B?QTRBR1hRVXNub1pubFFEU3V6bkw5OTkxeFlhYTA3NFpvT0tCNHlPMWNjRjUx?=
 =?utf-8?B?SEpoNWVnTnB6MU5HKzJETytUcXZBY0RaRHJrY0w3bnI0dzl3MVF6YVZuTE5n?=
 =?utf-8?B?R3VhRndhRW9iZ1ByV1hJcGFQaFF1bnJmWUtSRkhUV0QwMmdCcGJYdGZIL0l4?=
 =?utf-8?B?QTJlc3ZRNnA3QWhzWVBoYXBqZVB6M01ySkFDQmF5Uk1KaVUvTzVjYWxZYzZw?=
 =?utf-8?B?MGtKbWRFUVgwc24raWZ6YXpuTkhhSldtZEUxb2VtNE1NcWloWFdZOThTYUV4?=
 =?utf-8?B?aEZuak9KdXQxUndtZXNYUkRLU2Jqak9wMlFlUkg5L0U2VjBLanNSdmxidTBF?=
 =?utf-8?B?MWtkOWowa0ZmQjdFOWxrcy8yMTI4eHovQ24xSG9ZUW9lMXV4R05CSHFFTzkr?=
 =?utf-8?B?cHQ0NmVtbzE2ZnhqRmIxdUQrYzBydEdqRmdRWCsvV0xpWGZmenZWR3IyVndB?=
 =?utf-8?B?bE1tYnpKWXFSditVaEJlKzVoMHgxeG84dUNJQ2piQXdaRUk5UThwdHhVb3dS?=
 =?utf-8?B?TUU2WW5sdlZhMTVxb01GdG9GdGVRUnFtRnhORGhCdHhKTFFPSXdEeTlHNzR0?=
 =?utf-8?B?UkZCYnI4blB2R2RqaFByNWs2cTlRK0RvUGsvVDNUY2M0ZXJleUpRWTNVMENx?=
 =?utf-8?B?bXIyZlZWMy82ZlBDcFdveFVQaXN3TTh0VDViNXBKYnhsUUtrWmxscUFQdmNI?=
 =?utf-8?B?bzEyK3RCbEpjdXdsbUozQ0NSL0ZuSk14a25iSncvaXBpSEpteWg3cGxDN2Yx?=
 =?utf-8?B?cE1STU1IdEFyQm11b0dKSGhNbEp1UHhiSnd4azBpU2VuOFRncEpqTDN1RzRD?=
 =?utf-8?B?VHlFY0pXQXZ6V0hBUytTVS93SEt5ZkJLMnBVdHI4Qys3Z2tzM080UXlobEZ3?=
 =?utf-8?B?cFFXb1JNTXNzZVczOVR1anppaDFEbjJYcmJMczBDZmdCeXhhaWlZcUxFTnRh?=
 =?utf-8?B?cHhra3dxNmJpWGh5djZzc3NacUMyUUN2MGdtdXRzV0h2Tlgra05vZEZxK0Mr?=
 =?utf-8?B?WllJdDVYckFVQk5MNTdIOXlHQ09kcmNNcXN4aGFSM3l0ai9LZ3NFZEJ2OCtF?=
 =?utf-8?B?VDVRMDFVcGk1eDJCVnNHZk41bzFWRkdzNSsrTnBqcUZMcER3RFlQbVJObk1O?=
 =?utf-8?B?REMvUlg4ZE9FUWNOM0VIaU8zTktRdnMxVzk3amFuY044cUdwSnV0cU4rOEhl?=
 =?utf-8?Q?y1CINWIs+5y8c?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RXlTSSszR2VkZnNhZlBRbjdxMWZFeTJPZzNWT2VBakxLT242MUx0eXgrbXZD?=
 =?utf-8?B?YjhCQXMreEkyVkJxaFA3a3JndGNKVFJlSkVlZVh3a3VldVlYTmE2TVFOOTFB?=
 =?utf-8?B?OWdiejBlWmhzNFVyeTIxMTArbWg1Q29aUWNHYUVGY3dqZjFOUjQ4SHFrS1ZC?=
 =?utf-8?B?VjNNZVh3M2ZDeTVOajhIaEdVRzB3VVg2T0pmMkdMUkpUS0RhM1JQRVdWdjBk?=
 =?utf-8?B?TXF6MzcrYXhXMUhXYStKK2dTNGJZZEJHNGVHcHJ1OU80MkUrMlhvVDU1eCtl?=
 =?utf-8?B?OW1JQlNmZjhDelIrV1BxSnhad2xWdTVpSjhnU1BOY3pKTTc5VE9RYk4zaHd2?=
 =?utf-8?B?aXdub0FEOUtzbUZkaHRlaFFMR0VYb1UyTVBvT1NjZ0ZXem9OUVN1ZTMzaEk1?=
 =?utf-8?B?ZFhlNnJLNVdENTI2NS9xaUlWbmhid1F0YS93OUIrQ0JhRXJ5M2FCMzZHemJL?=
 =?utf-8?B?SCt6QUZDS2p6citKMzRHb3ROM1dYVlRFMTZTUkQ3NTQzREIyTG44WkU3OXpa?=
 =?utf-8?B?SWFEYWhXbW9STktmcGoxYVBkWXRiYThWZHBPUnhIK0t0YU8wZzUrVEhsSkRw?=
 =?utf-8?B?YjZ0NHlCZStQb05GQ2N4TThqa2podWJDM3d6b2s4K0orOG9aY29aUlUrcVZ6?=
 =?utf-8?B?R2t6S0NzUy9jSnB1SFV5YVNRMHpjQXpBZmhZZmthVENGbytCVDdMdy9GUlhn?=
 =?utf-8?B?dUJKMjV3Z0pBQ1VUOSt2ZGFqQ0wvU1hyQW56N3JJOXJrRFU4Y1M0NVJObUFI?=
 =?utf-8?B?UHZndVVvTWxtL0M1cHpTSTdFK09ZS3R0bldyVDh1Rk45R1k2TnFSWisxNWQ2?=
 =?utf-8?B?YUVPMXkzUi9BOWdKNllQV2x4OUQ3bWdRWXZ1N3dyK2dHNjZvaUtKcnlPeC93?=
 =?utf-8?B?aE5aVkl3VlNOZ1FMcE43SmYvc3lHbHpoc0Eza3d1UHR1aXRNeTYxa2xTU0tw?=
 =?utf-8?B?VWlPU1hpN0tCNFNBTms3ZEdudndkM2piSVVEcnF1SVhIcWJSVURqYXVsUklj?=
 =?utf-8?B?ZkpMNHY5SExKdHhFNC9QZGZrOE9zQ1Q2RExhVGRWbFRUbnFMN3RxVXZacFZx?=
 =?utf-8?B?QnBzbkY1c1pzNjZKUnlUSGVIcjBreGZnaU45SVVaRDlBOUdSZk5nSFIwV2w0?=
 =?utf-8?B?UzdOeDFEMDRaZkQveEt1OEh0MUY0SFBsNGN0MWEwMUM2dmswblc4cnhxdTk1?=
 =?utf-8?B?TmY3Rk5GZ3VwTW94bXduM3BlaStoQndYWGtWVkJUNWY4SEJYTDRnbkoxUkxm?=
 =?utf-8?B?OUVrd1ZkWldEajFaSVJtSzJ1cGNSTWlNOGVUaWx2OXJaM2dSbHQ1UWFXL3Mz?=
 =?utf-8?B?Q0xIRStZZnp4QVVkcSt6WTJlVnduZ1VaOEJqcHIyUG1USGpVSFlEOHBNZVpT?=
 =?utf-8?B?SzhpQkU2Q0IzTmhWTjdsaVhrc2J4SG1nVFo5Qndpbnc2TlRNc1JhVGgrT1ZG?=
 =?utf-8?B?UjhCSlhXWWVObC9LeWxzR3EwYlMzSi84QkIzSWlSN1lIODBNVU9wclBDY0pn?=
 =?utf-8?B?dGRuWkpVWU9IaTVWRVYrbkpnM255TnY3SnFYdHFBU3hXRndYTTNtb2VqV3Vl?=
 =?utf-8?B?MytHNjBPNlRjNlg5VjdaVEdSTzd0TU9oUmk5eW9Tc0dDM3VLN285Ujd4NWxB?=
 =?utf-8?B?c3RTa0lRRmR0cklmVHduVXNBbURCRFV1YTlvMU9LM1l4cm5XZUZXTFg4L255?=
 =?utf-8?B?SVZuODVMSWtvWWhVK0JRSGkyRmlVZTd5bWRKNjE0dS90bWxYRGpWMDI5TEFv?=
 =?utf-8?B?ZkU5VEZLaXZBNWd5bGNncGVzZkYrbUl1RFdWZXlGUE02TFBjWEZNNHFkVnlO?=
 =?utf-8?B?VVdNSTJNMUJIa2lCdVJvTCsvL092Y0hGWG5TTVcrai9pK0h2bnF5L2Q3QkpB?=
 =?utf-8?B?MVpXam1OMFU3Y2JtVHJEUlFJelJJNW9GbHF5dGgvOXc3bUtpS0VvMUxoaW95?=
 =?utf-8?B?bzlJUmtGREJ5S3BhZmR2UXkrV0t5UWJEamFMNW5xeE1DZ1BRRGx3bkRpazNB?=
 =?utf-8?B?bGhlKzFDZ1RRemRmSUhPelp1RTUzT0RWYnJId2ptNVdBMElTM2hSLzlqdDlE?=
 =?utf-8?B?cDZ3WXB2WXE3ZUw5VDR6NUR2SjFpN3lURkhGKzBUQTlJZEZQV3JyQ3puSHA1?=
 =?utf-8?B?cW9mcUV3VlplNjF1bU1LSWtiRWNORytUZGlQd2R6dzMzbzkwWXVuRDJacW91?=
 =?utf-8?B?cE4xaVdvZkNRam43N1VYN01KWjYyYVJidXpIelRBeS9UVC9KR2I5VjlOUms0?=
 =?utf-8?Q?pl/lmtMFc1eGQ0sgQh7FnEtP6naqp1GcSnr386ok7g=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f8bfb5-4115-44cc-1b56-08dd62b22096
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 04:38:55.0410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0ucgLf3Kd3hTJDkPLpFKAjLq5OGwkPDfILP2nSvMLywbhejDYWF9JsoxtBhLT/mA3bIuEDhxYzi6UO7MbwmY/VLdu1UAnlBYRjLSuorXEUuVtRF/X01AHG9IZ95/hzW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6845
X-Authority-Analysis: v=2.4 cv=Cc0I5Krl c=1 sm=1 tr=0 ts=67d3b2e3 cx=c_pps a=hSS9g3ca6WprpwKybkK64g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=tZAO6T7hntU7hn5m8REA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 4dTOgo_6yXvaxq8R_a1ynxU6OMe2ahCX
X-Proofpoint-GUID: C3P-cUcX_iysTrNHiBHIo2xFAe9rBJTj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_01,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502280000 definitions=main-2503140033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 04:39:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212818


On 12-03-2025 15:22, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Wed, 5 Mar 2025 at 14:45, Varatharajan, Deepesh via
> lists.openembedded.org
> <deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
>> +++ b/meta/recipes-devtools/rust/files/revert-Zdual-proc-macros-additional-check.patch
>> @@ -0,0 +1,43 @@
>> +rust: Fix build failure for v1.83 when lib32 enabled
>> +
>> +Because of the following commit ,
>> +https://github.com/rust-lang/rust/commit/68034f837a39387e49fc7d7c5b088f5372a1127e
>> +when we enable lib32, getting build failure because there is a check for target
>> +support for "-Zdual-proc-macros" flag not functioning properly when lib32 is
>> +enabled in the build environment. So for now reverting this commit and bring
>> +back the previous behavior, where the "-Zdual-proc-macros" flag is always
>> +added for building proc macros, regardless of the target architecture's support.
>> +This would bypass the check introduced in the patch, allowing the build to
>> +proceed without error, even when building for a 64-bit architecture with lib32 enabled.
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>> +diff --git a/src/bootstrap/src/core/builder.rs b/src/bootstrap/src/core/builder.rs
> Please do not add new 'Pending' patches, especially without specifying
> the reason for not submitting them. They tend to stay 'Pending'
> forever and are discouraged for that reason.
>
> Rather, submit them upstream before sending them to oe-core, mark them
> as Inappropriate (with reason and link to upstream ticket), or in rare
> cases, explain what event needs to happen before 'Pending' status
> becomes something else.
Since the new commit added in 1.83 is causing a failure when multilib is 
enabled, and it is a blocking issue for version 1.83,
the commit has been reverted, and the update has been proceeded with. An 
issue will be raised upstream,
and the patch status will be updated when submitting the 1.84 update.

Regards,
Deepesh

>
> Alex

