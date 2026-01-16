Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE5ED4A617
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 09:31:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2454.1768555891459162370
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 01:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oeT196U6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5476979829=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G5bvvu1601251
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 09:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=PEVuW1Lag8nSUFCMV/oiDlOooT/Gq7+/2sNGh9gOGvw=; b=oeT196U6WPiq
	aeLn+0WrfXiEHwF9oZgibbsLWv1OHTKqY6X6wDIM+ULS5aNVPfZ4FXpbGGs3gUdd
	/r5m3BBbnq5IxAbZZ2PuQH5p/X9S0eOiTVpUPsbSE2kEmvoNTryILn1pz/waWWBX
	wcMYePskBEHFQ0vRAJq7Zd5fK2xIAx60SNVosU74SHMFym0yjdMeer9Wd6OmRoSV
	1fzoJLuVh3K8CLwND+VrOy8VDegvskuLYmrMZl56TBaKxuRxtpy5dZjuNBZC02sc
	FINrq9BqZfl8/EBv6U2JBi/0W1+D3lLIhgLYXRLC0GsD+2iXhotlzHQokETY2jFD
	Lk7odhatSA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011033.outbound.protection.outlook.com [40.107.208.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqddvr8w7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 09:31:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsQIoyUatuw0V+tOnEI7KGmzJ2a2WTIR5lUwhjvW/JTumVJRa20dFO7f6D9ximICjFZkY+LF6mcEPEhfZRmd0tF/J0yCDq2PtZWWK04EinW/NUvGjLYTtX5hdD9kCmDMT/gZkAEqOsvA4RGVFUE0tvYzkeUoLN4rK7zie+20N4335zEyK0+1mfrlK1RrYuGWZ80hmqmLtzX8lJwGau1BztFtmGyA2Kpsm+XWhT6tM9iSVUFBsKvgY+QhhJTz/wul28NoaEJ1mRQKPgxWddzCv5IKEy7+Y2S6oNvp95VGJ6yOiN3dEOjzodLhz2dNyaWH4iIJg64rOUY3Ap0aMzSM9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEVuW1Lag8nSUFCMV/oiDlOooT/Gq7+/2sNGh9gOGvw=;
 b=g7CB7spY84MD7MzMJEh30vBxoFGh22cUW9f6eTyO1JFpkQ1myjEEO2ywoPzt5UJjSdpZFu7ev0elTUZbU4x/piHb7GaZ09nbsMKSUngojEi8ejWX1WfnamcefW6U/pjBQq36HqB/VCs5/MLz/VQuUpHdrC0m2FNlTr1m5chSmh2Mg7oMsE25JwrQEj36duSBffs7YAO2CmnbksWbDL3XQl+Cq15MEm346MPpP+zpKHcuZgKz693UXuK9YbVCOizG+SB9s5ejhc9WKJSy+JCzJi8M10N4OUAtZ+DpJ1EA5hAFZMUhRTxzOrwJ3KvKaW1erCdRdRNpWhoRadMJCZk1rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH7PR11MB8251.namprd11.prod.outlook.com (2603:10b6:510:1a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 09:31:27 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9520.003; Fri, 16 Jan 2026
 09:31:27 +0000
Message-ID: <96e7662f-971c-45d4-a0a3-9b8de241806b@windriver.com>
Date: Fri, 16 Jan 2026 17:31:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] procps: support ptest
To: antonin.godard@bootlin.com, openembedded-core@lists.openembedded.org
References: <20260114044319.2830540-1-changqing.li@windriver.com>
 <DFP00XRS6GEY.1ALBCSVFUBBQP@bootlin.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <DFP00XRS6GEY.1ALBCSVFUBBQP@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0111.apcprd02.prod.outlook.com
 (2603:1096:4:92::27) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH7PR11MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf2bf32-fe29-4cb0-ff7e-08de54e205a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VndXZjc5ODNnZXNLMXJhNzRoZ1NKY2RUQmNVS2NSNjBSU2FnRE1BKzdya09P?=
 =?utf-8?B?U1VLQjI5QmdheWdibWFVOERuTzNSaWoxNTZMb0QxdEg4cHBGcGx2cC8vc0s1?=
 =?utf-8?B?UFJCTFNvVEZmd1FuLzZUTlhSc0hiY1dHOXdtR3l1TEI0QWVsZmpFZEFZMk95?=
 =?utf-8?B?VllxL01JTTRnV2FvRVl5N1duL0J4SjZGYXZUQWF2V1g2TnF4Ly83L0RRemZo?=
 =?utf-8?B?eE14NUx2Q0VlTkZjMzYwaEhsWDBMUWNERVJvcW4yZmZnNGRJMDBCWjFpdVlZ?=
 =?utf-8?B?YnIxdjRZN04yQVlNRUthR25lUEFLN3lGVXFRN0RKMjdOeDQ1enoyMGZtRVNt?=
 =?utf-8?B?UHdxSWFNNFQxMjVPakFIN3c3amdGVWt6bzBSNFU1Y3VzcGhzUE5iZTJ1YTBl?=
 =?utf-8?B?R1VVSVlCOExkUVpLR2F6M0lZdWt6TFVMMXhsVHFQMHR6QzVjc1NIZU83R0Qy?=
 =?utf-8?B?clpIMUt4aDNmMGM4YWY2dXNJUmYwZHpzbjRqSVBFNGJSVHU5aTBSdG10Yldj?=
 =?utf-8?B?dFhycVUrMlUvTnYzUXR6RjROSGdvaDdhcmZqRHNTcDJmQ1hnWlVKTHV4YThK?=
 =?utf-8?B?bGlQdjNLaXhLdkJtMjRtcGRIK3FGRUlwK1lTU0hzV01ZNVFRU005Nnd4ODBz?=
 =?utf-8?B?cW1OekIwdFY3UyswemZzcG81aU1kOTRjcDkxcThKbnFLclN3Ylo5enhCTG1w?=
 =?utf-8?B?SHZob2wyYzRoZVV0eWFvNUFXSlVWc2RURDVmVGNKVkROdlRuSUt4RnRDalQy?=
 =?utf-8?B?NWxBWjkyeE5Yc3I5ZlMvNzZmUU9tc01udXVkUDUrUS8wb2U5dkRQcFBXMEVI?=
 =?utf-8?B?bEZEdlBQWWh5SHhQdGdjMnU5aHI3a1ZQckJVSmdNMXB5OE5MRURoTzFQeCt4?=
 =?utf-8?B?OUhNT3pENWoxSUN0bTA1UmxzdXFqSS9zOHhCeE5wZWlwbEhCZ0k2YTM0eXVR?=
 =?utf-8?B?bEVvRTJjb2hnQVdZUVdDUmk1cjl2Uk5XSWZFWGpYeE1WTHFlNkhxQ3V1cXFh?=
 =?utf-8?B?L1FheTJxSmczQWVhNUxPN292Ynd5WFZnM3BYbmZXRncvcVRTakFjUnIwUEZa?=
 =?utf-8?B?RHNuZUpWcnNNeWdiQ0ZBWnpiZGErcTNFSUFlbkVDM0lSNW5ONzN6elZvbHdH?=
 =?utf-8?B?TEtOYktsY2hTbVJuNFIvTHF2d1I3aWxsWURDeXJHWVNOMU1KVitjbkQ0SXhr?=
 =?utf-8?B?TTJvSHlscVJmRGYycElVc0FZWHgrUDdoS1hRL0w5UWc5NEZsQ1lDZ0hsTUlu?=
 =?utf-8?B?SmZZSXNacDB5SkR2Q1Yrb29GVXRzZlhsVWJ4OWFNem9HeXhZTUxYcTRUZTRU?=
 =?utf-8?B?ZklnYnZjcjBPOFA5MlZOTGZ6YkZPZS9nRmttaldPY0FKNHVIUnhnbTZDQXBv?=
 =?utf-8?B?cEplMDVLeHdWSENyQ01DRGhWUW1FVUozdlV0V0VxL0lPbUdaRjRhaHl1YVVU?=
 =?utf-8?B?WWYwYWd1ZkVSVTFXM1gwMDk0NGpNclQ0UERuMWQ2dTA5bmJONzA1dWZheExl?=
 =?utf-8?B?T3VYUU5EU2Y4UGI3WUJURmwxOHNMOW41Y3pZTkMrOFdjMG9uQ3krdm1kY0pZ?=
 =?utf-8?B?eDNkSTc5VWcwbGdtb0dEM1pYc1ZuMVhxTThQU1UzcTN4c3dIN0JPWlprM0NP?=
 =?utf-8?B?NnQ5MUxhbVJOWVEwSVN1eTU2aGxFWE5oV01OYnYvQkJZRVFLU001NXR2d3pi?=
 =?utf-8?B?Y09HR1hYaUl0bnJkM3hkM1Rua1FMVG1ETlNDMEI2empxMndPK1ZPUkRVTHl2?=
 =?utf-8?B?TUhkY2J0UlFvZXN4Tm4vYU1tZHNCSzJTbG9lM01la051WHQ4RXRTUGgvQUU0?=
 =?utf-8?B?czdGMXZQcGUwemhlcm5oVnB0U1NXa0hGQS94R0poN1FkWGYrYlIxaHhiQzhR?=
 =?utf-8?B?cEUzT2J6K0x6WmQ0aVltR1Y5bVdRV1plYmM0Y2R0Ui8zdk9kZ2NlbkZ0M1cv?=
 =?utf-8?B?cENZYUxTMnhhcVZEUjhUczdrV1k5QnF6VjAzYnRBRC9VUmRyMVdTVGcwK2N2?=
 =?utf-8?B?clVyY0tuR3lFYXNDNHVMb2xBNFNlK2lQWHBPRkM1UTJZMzltbXd2dXFFbmw0?=
 =?utf-8?Q?ebKAYZ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c3Buai9SQ2JQQ2FIUGc3NEtuUHJJVi8zeXBiTmFJVWwyV1JQSVlxM1JybXdB?=
 =?utf-8?B?eDV2UHZFQmV4NnBsMlhNc0dkSnNUMkZ2bXMyaFcxdzMwRkRmZkRoNlhYOG1O?=
 =?utf-8?B?V2Y1L3pjQ2hYQ05VRy93SFFtNjNET2srTmozRUw5RHJpbjFuRlh6R3ZFdmZF?=
 =?utf-8?B?VDJEekw0d2MvTGdRQWRtQVVERGtqT09SVnFyYlZlSzkwY0REZzVSUzFZREhJ?=
 =?utf-8?B?MGFoTHBFMXRBOXRhTjVFZ3BCYTMyQkdFeEVVZERQRElFNVNrYnNsSmlxU3FZ?=
 =?utf-8?B?ZEU2NmNVK25RYUR2L1FySkJFOXZvS29Edk9QN0hOZTU3MU95TG5GTElaVzR6?=
 =?utf-8?B?K3JwZm5yNTI0cDdPeHh6eVJ5OFlqaHJHL1hLeGRXRFltVjJ6d1pyRmZyS0RK?=
 =?utf-8?B?UWkrNE9LUGVpU2RyZ2RaNDNnSzl5WEdJN1F5STRablBCalhEWUZuVzdMMjlr?=
 =?utf-8?B?UmxZcXFqMm9wbG9oVHJOLzZMclJBK3BlbFJZNVpBZXdpOThiUmlOU0hiaXBz?=
 =?utf-8?B?RC9SOVhENlFiNU9ZSGtjRE9BaktvTGtjczgrNzBKSk83NUNieDBWNE81WTdC?=
 =?utf-8?B?QmwwVTFsbHAvNEtHYTdsN1U1Ky9Gc1AvSFlWRDdBQXpubnBxRHg1YmZIcFBG?=
 =?utf-8?B?SGhHUzRNdXNwSFJNNTN2a2k3bDVSZkxRdVBTK0xvOTZrVGJHOHJpOE1KbjVw?=
 =?utf-8?B?TlIxTlF1MUlyMWtocGRYSVNYMFQ3dG5mUW1XOTJ5ZkJzVFpNdTc5dEVzWTVF?=
 =?utf-8?B?RktZZlJyYUxjTE1zSmkzdnhoVmUrbkZiQmhNdHpqUHFOa1VpNDFNOXF0K2pr?=
 =?utf-8?B?V1lTL0wxR3dieUVnL2E1WGpRM2RIU1FzZEk2b3kzVFV1c0FNVmZ2VlRMOE5I?=
 =?utf-8?B?N21TUndqUnpqdG5yYlI0WDBMZUZubHc5M1FsTDZOejZlZnhvemdkNTZ4bVpy?=
 =?utf-8?B?TFJlWlRKQmNjMHd4UUJGdUJhUlRsN0UvZjczSUVlTDdxbkdlT1lvckthZmNV?=
 =?utf-8?B?eDEyd0RZYmF0UDJZSllDYjhCMWx2TFBSR0Qram1lK1hpOUdZMm45c2RkSThK?=
 =?utf-8?B?b0JYVjRDejhRekwvTHV5NTd0N3RCNHM3WDdnOTZNaXlEb00xNjIyWDBGa3ND?=
 =?utf-8?B?aWVpTzFMcTQxOUYrZHZOUW1iNEFabmI1SnliN0dLTFRXcHJtZDdPa0ZBYkNi?=
 =?utf-8?B?a3pIQ0VDbGtGalBTNDl2WEVZNWtvSTRHVzQ0VzIrWmpWbFFheFVxUTdsRHhQ?=
 =?utf-8?B?dUx5amUwcGhaSzBTRGx2OWhYSnJwMFR6bmxvR25DYnpzb2dsTVhvOFNncVAv?=
 =?utf-8?B?N3h0cExNNXEvUTZSUlpkdkFTRDNXbTRFUUFuT3pmTWpmdDhKdllsdFNOTi9Z?=
 =?utf-8?B?WXczWWdLYmRydDRCK0c3ZXNlY1QwcGx4dll1MGlid3NLVk1sd2QvZzh1Z2ho?=
 =?utf-8?B?aWlKbHRqaUNkczQ4ZGNhbkJDSXRLazFNWHpKaWJHaHZzQkJ1RjB5ejJ1eDJx?=
 =?utf-8?B?d0Y4OUltc0tCQmlIaWhiZ0JYSWlBcHNGcXpsWnlyUUJpOXBjdVBpejVwVThO?=
 =?utf-8?B?VDdDaVgwUFFnQkNyYjFiNWVjRnVyN04rQWRlS1B3UUZtZFVNbElzVHdaZ0hF?=
 =?utf-8?B?RWtNVmI5ZDNOMU45QmtqWng4MEVhMWFFL1lsdnFOYUk0TE9mQmJXMWY1SmUr?=
 =?utf-8?B?V3ZEbU5lTmJMb29xM1plblpDOS9WcUxZTEN2NTBkOGYyRzlYK29jK0FyRTlz?=
 =?utf-8?B?cDQxcGdRSkJ6NDFRQkpsRjdTRk9TVURlWUpISlVXczR5RGNvc0dTYmphNHp6?=
 =?utf-8?B?SGJDc0c1RjVPeVhQN1lJTXpqbjhzRFBJb3gyYk45N2NaYVNlZDV0YkpGT0Nt?=
 =?utf-8?B?ODY4bE9tSGxRLzhpWWcyRStORkNoQm55WnZ2TkJTUTJkK0toYzNvUkp2Vmwx?=
 =?utf-8?B?dGcwTGpIZzJCWGJUNzlUWm5UOXZ6Qm1MVVpUTXI4TktacEUvVFJpbDl1TEcy?=
 =?utf-8?B?OVJvUHlaODNpbGxTN0wxVHQvaEhCa0JoMGRWaGoxQTVDdHh6c1BsaDZoc2hW?=
 =?utf-8?B?M0p6bFEwSHgyb0Zia3g5S1pmOVYyMGZlbEVCVmNCQUJNZHQ4NUVYUWh6Qi9p?=
 =?utf-8?B?RmtSaUs4ZW16N2N0R01QNFhSOFhCZXhkblJOdWdFRW9TbmVmMHF5TEVYaUll?=
 =?utf-8?B?amZTcnNUNXhQVXJEaG1wc2Z3MWdPT0UxSnVYNE9GQnJtQytpSHVxZUhWeVU5?=
 =?utf-8?B?N2FQTkpBVjNwYUluZ3V5ejcwR2Z0ZjRiYzFtb0gyR0l6ZlRSQjUzem1nSGdR?=
 =?utf-8?B?bGNlYlhiaUtmeExUdTBLMkRpM25VbEJNTWd0eDJ5RzZwWXpWaTBJTERWb01w?=
 =?utf-8?Q?reamdKOlasO1teNM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf2bf32-fe29-4cb0-ff7e-08de54e205a1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 09:31:27.0426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhLpWjlkJWhL+xxbjZSnPxLoK8qHFPqDxcQKiicYYE+wOW3wucL00fd8ve4VAVT/TpJRv4KTVXNOeHySChMFan7bu8mGaQHZWGs7Fm4UALQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8251
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA2OSBTYWx0ZWRfX8AJgg2WMuiGo
 HCPKtTlDXFXKBsgVkH11Uc+8WtHDSuTK+uRoVydFsV8ppg/30Hw5xA47fx6+QP8ajfp4J7SfpAU
 Ayne7e/J5XOh+bGCnwHIUVfWAi+7+50N90JEqZDu/rLJtwCsxnNIEE7uQVSKGSXJJ6PuCgX+NeF
 +ESiDvzv1Z0JIUU6/Iv7DSS+eMRXD3efbjw7qKoSAi9nuhKi1nf98nYtqc8L4eKAktemc1nIw57
 nNBSuLLo8uFNdHgKiBsFpKGoXqDEx4hKClj8WvRkPzo4GSPdJkJ/EGi1muPVJtdqmuBK67Yu8mh
 zlpUft3AV9thW0zROC2P7unq5JUFLSOsH3aroKNZheTOaazt86YiwQmzJxWv2UrX7S3Mmj+cvBz
 0zd852iV9b4KBG4RC/qVrEPot8jR70ZLzhF272+oSD3qQD8VIIpDZUIt3Zty5v6+voko0/Ze+vT
 MsJKXZ+mfbVAkkP1UmA==
X-Proofpoint-GUID: PYcWv5up1NGPLJt90HKYVEVDdak6FEcX
X-Proofpoint-ORIG-GUID: JzHfH2rkjq3aUkPLJbXQD4u-YxsnDw2s
X-Authority-Analysis: v=2.4 cv=NqvcssdJ c=1 sm=1 tr=0 ts=696a0572 cx=c_pps
 a=GRGg88i0IYp+MSRJKvRoYg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=p0WdMEafAAAA:8 a=6tykLMwmbh32Ro94nAgA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 09:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229530


On 1/15/26 15:53, Antonin Godard via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi,
>
> On Wed Jan 14, 2026 at 5:43 AM CET, Changqing Li via lists.openembedded.org wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> support ptest for procps, procps's testsuite use DejaGnu test framework.
>> The testsuite is expected to run during build time, this implementation
>> create the same folder structure as the testsuite expected to make it
>> can work well.
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   .../distro/include/ptest-packagelists.inc     |  1 +
>>   meta/recipes-extended/procps/procps/run-ptest |  7 +++
>>   meta/recipes-extended/procps/procps_4.0.5.bb  | 50 ++++++++++++++++++-
>>   3 files changed, 56 insertions(+), 2 deletions(-)
>>   create mode 100644 meta/recipes-extended/procps/procps/run-ptest
>>
>> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
>> index fff2947177..0a4ff49ee3 100644
>> --- a/meta/conf/distro/include/ptest-packagelists.inc
>> +++ b/meta/conf/distro/include/ptest-packagelists.inc
>> @@ -57,6 +57,7 @@ PTESTS_FAST = "\
>>       nettle \
>>       opkg \
>>       popt \
>> +    procps \
>>       python3-atomicwrites \
>>       python3-attrs \
>>       python3-bcrypt \
>> diff --git a/meta/recipes-extended/procps/procps/run-ptest b/meta/recipes-extended/procps/procps/run-ptest
>> new file mode 100644
>> index 0000000000..c999876bd8
>> --- /dev/null
>> +++ b/meta/recipes-extended/procps/procps/run-ptest
>> @@ -0,0 +1,7 @@
>> +#!/bin/sh
>> +
>> +cd ./testsuite
>> +for tool in @DEJATOOL@;do
>> +    runtest -a --tool $tool --outdir ../log
>> +done
>> +
>> diff --git a/meta/recipes-extended/procps/procps_4.0.5.bb b/meta/recipes-extended/procps/procps_4.0.5.bb
>> index 0e0e06f0d2..b4697f7ce3 100644
>> --- a/meta/recipes-extended/procps/procps_4.0.5.bb
>> +++ b/meta/recipes-extended/procps/procps_4.0.5.bb
>> @@ -10,11 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>>
>>   DEPENDS = "ncurses"
>>
>> -inherit autotools gettext pkgconfig update-alternatives
>> +inherit autotools gettext pkgconfig update-alternatives ptest
>>
>>   SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master;tag=v${PV} \
>>              file://sysctl.conf \
>>              file://top_large_pid_fix.patch \
>> +           file://run-ptest \
>>              "
>>   SRCREV = "f46b2f7929cdfe2913ed0a7f585b09d6adbf994e"
>>
>> @@ -47,8 +48,51 @@ do_install:append () {
>>           fi
>>   }
>>
>> -CONFFILES:${PN} = "${sysconfdir}/sysctl.conf"
>> +do_compile_ptest() {
>> +    oe_runmake -C testsuite site.exp
>> +    oe_runmake src/tests/test_process src/tests/test_strutils  src/tests/test_fileutils src/tests/test_shm
>> +    DEJATOOL=$(make -C testsuite -s -f Makefile -f - <<'EOF'
>> +all:
>> +     $(info $(DEJATOOL))
>> +EOF
>> +)
>> +    echo $DEJATOOL > ${B}/testsuite/.dejatool
>> +}
>>
>> +do_install_ptest() {
>> +     install -d ${D}${PTEST_PATH}/testsuite
>> +     install -d ${D}${PTEST_PATH}/src
>> +     install -d ${D}${PTEST_PATH}/log
>> +
>> +     cp -r ${S}/testsuite/* ${D}${PTEST_PATH}/testsuite/
>> +     cp -r ${B}/testsuite/* ${D}${PTEST_PATH}/testsuite/
>> +     cp -r ${B}/src/tests ${D}${PTEST_PATH}/src/
>> +
>> +     rm -rf ${D}${PTEST_PATH}/testsuite/Makefile*
>> +     rm -rf ${D}${PTEST_PATH}/testsuite/README
>> +     find ${D}${PTEST_PATH}/testsuite/ -type f -name "*.o" -exec rm -f {} +
>> +     find ${D}${PTEST_PATH}/src/ -type f -name "*.o" -exec rm -f {} +
>> +
>> +     sed -i -e "/set srcdir/c\set srcdir ${PTEST_PATH}/testsuite" \
>> +            -e "/set objdir/c\set objdir ${PTEST_PATH}/testsuite" ${D}${PTEST_PATH}/testsuite/site.exp
>> +
>> +     DEJATOOL=$(cat ${B}/testsuite/.dejatool)
>> +     sed -i -e "s#@DEJATOOL@#$DEJATOOL#g" ${D}${PTEST_PATH}/run-ptest
>> +     for p in $DEJATOOL; do
>> +        if [ "$p" = "ps" ]; then
>> +            install -d ${D}${PTEST_PATH}/src/ps
>> +            ln -sf ${base_bindir}/ps ${D}${PTEST_PATH}/src/ps/pscommand
>> +        elif [ "$p" = "sysctl" ]; then
>> +            ln -sf ${base_sbindir}/$p ${D}${PTEST_PATH}/src/$p
>> +        elif [ "$p" = "kill" ] || [ "$p" = "pidof" ] || [ "$p" = "watch" ]; then
>> +            ln -sf ${base_bindir}/$p ${D}${PTEST_PATH}/src/$p
>> +        else
>> +            ln -sf ${bindir}/$p ${D}${PTEST_PATH}/src/$p
>> +        fi
>> +     done
>> +}
>> +
>> +CONFFILES:${PN} = "${sysconfdir}/sysctl.conf"
>>   bindir_progs = "free pkill pmap pgrep pwdx skill snice top uptime w"
>>   base_bindir_progs += "kill pidof ps watch"
>>   base_sbindir_progs += "sysctl"
>> @@ -80,6 +124,8 @@ RDEPENDS:${PN} += "${PROCPS_PACKAGES}"
>>   RDEPENDS:${PN}-ps += "${PN}-lib"
>>   RDEPENDS:${PN}-sysctl += "${PN}-lib"
>>
>> +RDEPENDS:${PN}-ptest += "dejagnu bash glibc-utils"
>> +
>>   FILES:${PN}-lib = "${libdir}"
>>   FILES:${PN}-ps = "${base_bindir}/ps.${BPN}"
>>   FILES:${PN}-sysctl = "${base_sbindir}/sysctl.${BPN} ${sysconfdir}/sysctl.conf ${sysconfdir}/sysctl.d"
> I think this triggered the following error on our test infrastructure:
>
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'glibc-utils' (but /srv/pokybuild/yocto-worker/musl-qemux86/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.5.bb RDEPENDS on or otherwise requires it)
>
> Can you have a look?
>
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4942697/raw_inline
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3047
>
> Antonin

V2 patch is sent to fix this issue.

Regards

Changqing

> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229388): https://lists.openembedded.org/g/openembedded-core/message/229388
> Mute This Topic: https://lists.openembedded.org/mt/117256827/3616873
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

