Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B9FC369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 13:06:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.19369.1745931979351315249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 06:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7214951ce6=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TAumr3011492
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 13:06:18 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq1cb7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 13:06:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WuajcURlzzMJGc955jrbxXWlw5p/vzSeBsXIjscnn04uYuAxEl1L8bGORzXxxEqgnQVZ2UkXxm0bsVlgNqhTth8+f+caqvLBg25jC1bhEfAg5HqwXOylHqWTLhurbu0iba9+je3EzljOxZl3X1pN+rDz8J5XDL9o+QkCcggFy9howSsmanBAU0B3Z9zB1DiwP63A3mZht7jIzDFG5OPuXJQOyphbmery4zlNu2Kg4HmmyvzGIsxw6PvjqG5sftONsyxx6RZ4K2XadlTL4kcGgXkfGStS/+WQl9OLDbcBkTfvttJ1WwM+JeMipBHjXinRzq0PWY+ppKPsmjgBL9jAag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7d1XTw4+iOw3Cr99j7hYF8B0rRBkTRdRJdTqpREbLpc=;
 b=lX4jPRmwnQi+t7bbALOke1zwz/C5isv10hPt8ejijPLHDEHGQCZcASIycS6VIDU+tyY5CXNXynmIQ9MEgcpJozQd/mh4VppqnPROxxFwtkCMcmjoPiF2wwcU3ySesD8y1DjfFsoBOsaVcerkU7DdFrfAy/Tk7kdpwxUg7o0pKByqJ/BDEh+TCG3D9OTEIscToXsWTEythrfOKOq82QqOz0ZoCS4LYPmIqNDbGWd2h1climmBPWshtoY/5mh+tARSUItV9VJVK4iFFqWX8nJS7QXFm/tpAeYt2iOfFpVdfLcBU/cwqU8dOeeiBIwALzFxBoybcwM+fKxyLTw6IfuSJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB6965.namprd11.prod.outlook.com (2603:10b6:806:2bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 13:06:13 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 13:06:13 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] makedumpfile: upgrade 1.7.6 -> 1.7.7
Date: Tue, 29 Apr 2025 21:05:58 +0800
Message-Id: <20250429130558.1672684-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: 71b0f57f-898b-4ccc-f426-08dd871e9e9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UnZybnhNRWxYQ2FPaXVqR3VranZ1SUcvdkN0MFYxUzZldzZZUXpzRW0wdDlJ?=
 =?utf-8?B?RUJ4VDAvRnArNThWMGtSSDRoVkQzQ0l3SXdWOTR0RTlKdXl1VG1qeEpyWEVS?=
 =?utf-8?B?blkraUNSb3VQZU93d3VWdGpSYnRpOHkxZUloT2Q3YThNbkVFYnp5WmN1eXp4?=
 =?utf-8?B?Y0dNMVJvZUMxbU9XWjRaeE9CWnlhSytoVUx4V0RXMjZlNThpd0hPRW5kajNL?=
 =?utf-8?B?a0Z1ZWdlOVRPYjRWYzR0dVB5c0FYSjQzNzhxMFIvemJkWEhwaVoyRDJkUkVm?=
 =?utf-8?B?cVkxZUN6ZkdaeXE5ZFdreitmdkI5OWw1ZmgyNS9rM2VuTk9wQkJ6aDVzaWNC?=
 =?utf-8?B?RzB6WlZDYmI4Y04rV1B2eWxjOHI0aFRRaUhpeDhwSC9rcXNTUC9haldIL0ow?=
 =?utf-8?B?M0NGa3drckJsM2hZSXg0YUlnUUc0eVFQcGgwRUZTank0Mk1hOU9tWXkxbzhY?=
 =?utf-8?B?RUp2SldvcFR4TmhVRks3eWxvZVJ1T0UxdnZKS0YwRWQrbXg0YThUbyt4aGNo?=
 =?utf-8?B?aTE2OTBUL1h6bkJzSnl1TVViODlnRERGWHAvVDRBazJybWVMOHlVc1N1eTRF?=
 =?utf-8?B?UDVPRUJGa1FWc0NHRXA1YVp3WXB2alpYWWpudFVNaEFKcXdROTFpZFdNU2FN?=
 =?utf-8?B?R1ZxUjJMR2tCSGdpT1pRMTlBTGc3SStEbGhodzIvYVpqTWkwT1JtL2ozZU50?=
 =?utf-8?B?SEVEeG5MdmhLRVFrbE5ZSFY4eVkvQmF2bk55NCthaDBQOHRzV25LVlViZDJr?=
 =?utf-8?B?UEhMelltd0czWHlMZ0xiMnNSWE9SakV5YnYwMWpTYzREamtWKytXRDh1S09x?=
 =?utf-8?B?OGNTSGhOMEMzQkpLS29iWGc2dklZTGxtT0lVK285a1JDNG9IdFRXbkExNmp4?=
 =?utf-8?B?elRXU3RmSDlMdnZuMnpOOU85WE43ZWFnYWV6dGpYNlpGZTdvQXZoUXNvRytW?=
 =?utf-8?B?M0FXMUpiYzVqNVVaV2QzMS9lZ0lvUVhTUGoxY2c5VUVNQ2pWeC9JMHFVaVZE?=
 =?utf-8?B?U2RSTFZvRHd4TzVnWkxYUG43Mm9SZUpUbE15aUJRY0VMblIxTEdybC9mMFBt?=
 =?utf-8?B?MnFUVFIwekM1MDZqeE5XVC9VSDU5NlI3UktqVFRqSEVBdTVjNEJjSlM2MXJo?=
 =?utf-8?B?UXJDTWY0eGEvK05mYjR5MXZjaVJla2ZJN2FMWEY1bDRHS1pXb29LbHVMQWJ4?=
 =?utf-8?B?Y01BVUdya0xxVms0ZFhkc0hjZ1M2N1hyNWphR21NWXVvcGJZd2c2eHdFQUFE?=
 =?utf-8?B?MzVGNm5nREF2RENSbEQxQy92a0x6Z2pGcVVLbVhKNkcxRkVJcUdTaDI3MEpk?=
 =?utf-8?B?Y20yZXcxVmIrNFlrL1VpV1daM0NIQm16Nm1yZVJiQWtWVDR0Z0dNSm9MN3p3?=
 =?utf-8?B?MFlMK2hrRnZHdEU2djl0bm9WcWxRK09zQUNTR2lROWkranRMM2hLdm03bjZV?=
 =?utf-8?B?RnZJMEZTN1dTejUwYXpncXllZ2ZGY3l2c0NnTDJ0MVZwMnRQeEQwc2NIclBM?=
 =?utf-8?B?cEk1RXpvSFZBU3JUU21BNlJuaXkzQlN0WWFhbllHMmdleXRqcXFtSStaNGZW?=
 =?utf-8?B?QWx6NVppbnlvRjVnN0duamhKRXQxUVlaZjhLMzQ4V2gzWGE4Y0YwT1VscGhx?=
 =?utf-8?B?eUpEZkFZNHl2STRXMkx1OFlKYlBzOGI5cWxROC9NOGlJNXhvcCt3S2NVME1y?=
 =?utf-8?B?UjcwN2tVVURCUlR4VUNGWkJhcjlndVg4dDQ2YkRXQUdGL24vM1U3ZitUUmlC?=
 =?utf-8?B?c0VaeEE0bzlUWDdpVVJoNk52L3Y1Q3YwWnpDVFZKOVRFVHQ5QXNtb3VQSDho?=
 =?utf-8?B?amNuR3UyNW9DK3g3Zm1BT2hZaVNnNUowa2huSG9WbU9OMml5aDZ4Sno2ZDBx?=
 =?utf-8?B?U3hJWXQyZjVLVmszV2hoVEJDNE1JdG5QR2hxeWZUNlJKdG41ZVRUQzBlSFE3?=
 =?utf-8?Q?Jf2u9Q8f/qs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K21QTVNKZDVZQ3M1Zk9zQ0VjT3hKUmlNdC9TWlBZMWdDY1NpOGkvTzlmV09x?=
 =?utf-8?B?YTc3R2tVZVdtSzlyWDdTTU5kOGQrUWF1bThGQko2RXZDSzlxajl0VEFOcXlm?=
 =?utf-8?B?SVRpMENGTDBRWlpTOVd1Y09ZVVRKY1h0VDBaekdCM0l5RldPbmYyYkJmNkE4?=
 =?utf-8?B?UEdtMUVUMWJyUUZaV2NiQnFlTHUrcm0xWTFlRHJITjlKOWJhWFNScndsdmNY?=
 =?utf-8?B?OGFiOXZpRUlNUStEV01JTm5zNG9SY2hadlJneGJnSXQ4VlE5a0w0bUxuY2Yr?=
 =?utf-8?B?ZXdLN3R5c0hMbFB3YUFobkFVMWVPdU1ZNC9xS2tkYnF0a0QzdW56THVBZjAy?=
 =?utf-8?B?N05TZ0VKdmduS1BBZE9qMlJuRVFyL1JIcjZpekFGOExVb3RMRGFXa0t3bkNF?=
 =?utf-8?B?WTBtVzEzTE8rYy9FcjdKemR6SlRRQ2JPTHNNNnlWSzVVcjVYZW54bzViYkVK?=
 =?utf-8?B?WDBmNkpwYjBWVEg4UWg4SXYybm9adVRBemc1b0VTS0dWRnB2R2w3bklISXF0?=
 =?utf-8?B?WEVJd0FXVXlGd25LeW9ORkRRdE1wTTB1aEh6bjVZZ2xxclJMQytTcHF1aXgz?=
 =?utf-8?B?OG1vNTNGR0J3QndYZEFmYWJxL2l3ZEE1RmhVV2hXbEJTUEpUNEZCdDV2Um9s?=
 =?utf-8?B?VDVITnJjSlNXdndZelZub25KMldKZ21PR2JjdE9JL1hQcG0vSmNFY2FlLzRV?=
 =?utf-8?B?bmJLcGdJWkFma1MvTjFaRlRsbktJcE03dGtHVkVzdTRUSjdqSXRTYUVFaW9I?=
 =?utf-8?B?d3BOYXBGVVVsVjk5dDN1bjVwKzMwbEl0TDZ4QTJXMzhCMG5oS1ZuSkZRM3U2?=
 =?utf-8?B?OTlzSUVrWUg5WTNOK0ExelorMG83YnBYZmRRdGRRUFRRdHYwWFZBVEFhdnk5?=
 =?utf-8?B?cmxXVExvbnphZDgyMXU4YWt1RFdtOUYxWDRTZEMyK2JORU82UEZhR1RQTVFU?=
 =?utf-8?B?VXB2RVh5TGZaNkYxWjFwaDVLWFAxTXRRakt3eURZb0hNRXAwcU8xSll6TWNZ?=
 =?utf-8?B?QTh1QWdWRGFSQmZBcUNONmNqbFplZk12YUExcUtVOGxlTHkwcy9EN0poK0xk?=
 =?utf-8?B?TmNSbUVxemthNVhnM0Z2MkZ1WGNIRGlVbFRTQW1yQVZCMUk3SWg3eVUrMU9u?=
 =?utf-8?B?elVSaVJVTG5yTDNpY3ZaSWFEaEZhYWs0MWlmU2pBQmpkOXhoL0dmWDNEMDdh?=
 =?utf-8?B?ek91bWNhMk1Cd3E2alM2WEdqTFNtbUlKWGlzMjFVODVwQTF0MTZRRjZvM002?=
 =?utf-8?B?R0N4aithRXlCQmZldy9LRjhyV2VLbnFwK2dmMlJvNUNnTTdCaDRYeFRIVktw?=
 =?utf-8?B?alhWamNBZHN3bjlwUXkySGlHTTdScWFNZmwyai9BVHFEUjJnOHZUSlpBdGhh?=
 =?utf-8?B?a1RDOStjMG4zTFBtdjBLR0JBLzJZekxheW5XZ0xjeGZtenVSbTVuSk42OEov?=
 =?utf-8?B?a0VIYlJwZmJiR0RxamdjTkhTY3p0MVhvSkM5dDlVUkJRWVZEcmkySDV1MnJq?=
 =?utf-8?B?QlU2ZUljQlNsWmhwTTIvYkUycHFldFRiK1hlTHhSYXo4c3pJNUV0eWk2TDFh?=
 =?utf-8?B?bWRIZmNWNWVNYUFXc1d3QnR6M3p1bkltSjVydFIxNVlqU3B2OGJhQzkvZEZO?=
 =?utf-8?B?S1dYTEtkT2F3NVJsblNhTk02ci8xWmlsL2JPcU9Vdy9OSENKVlVtQzhhTks1?=
 =?utf-8?B?amJRVkxMRjRBQTlmQmlzN0F4NGVqZ1owOHhKY0l2aEFMYVJ6SUE0azJBdncw?=
 =?utf-8?B?UVYxU0xYb0NBeWNpUEM2WmJCb0VkazJxekJrSlpyZ1NEVCtPS3FzSUNzU1FX?=
 =?utf-8?B?b3pSZlJxdjBhNGZ2Q1hCUTVyeldOcWRNaUt3cmlvY3ZaRk0zcUg1TWZSRUs1?=
 =?utf-8?B?RkgxR3I2YVYxYU5BRmJpeS9nM2Z2dkJZNlBpVmd1Y1Q0U3JUVkY5allrMzJX?=
 =?utf-8?B?bVRuTVd0RWNrS2F1UEg3bXhUcXFybmxJZkVIb045aG5TNExVTitRM0hEWFVk?=
 =?utf-8?B?eURBVHVERmVUY2VWdnhFQ20yZnpuVk9Eak9RaGxQci84MFRDVEIwVmhUdkky?=
 =?utf-8?B?UmlEVXBKU1J1SXBLVmU2anUrVW5JMVVyalhFQk1zeFpndFhZeVV5MWVuaU5T?=
 =?utf-8?Q?eIidBKvVS093UmkpKvOylvcXY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b0f57f-898b-4ccc-f426-08dd871e9e9b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 13:06:13.8225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/1ZXyBgV6pkWF6EpOeMmsfzavMLEoFyHsZOWhjrM/+rJCszzkMDpLJbI5Chh9jOTsxzcVlWK7v5WqieOvIgcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6965
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=6810ceca cx=c_pps a=ZuQraZtzrhlqXEa35WAx3g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=20KFwNOVAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=xxtYkN68ehKtVhB3oKQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 09sYDctU5dkMgZhpCgC3f4KlQ2Y7mtG_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5OCBTYWx0ZWRfX9r9ArZgrKSXL xrEkd34VTRGDwg4oPU0BgnEd1RDCv/q1cOqqFSOqeEovq/PpYb1zFZziNL1dJ1x59Rqiap0jifW Cr25r9YX++7IzlA2ajSGtxWWXtnMC1I6Air8hztzlVGkvEHGIoDIwIk6nNRjLgJr5p17GyqXDEm
 jikg+VyVbtsiwALSljZTr24f28zwiWRzF5FZBWiJqKvNjxWlvZlzSAQQAavFU37ZtSTWXdHcyeP j/t/IkCVxgTioT/rs7iM8csV34Q5+R9iavfQTBIZwV0GGeNRaQ8SghzyFXcJ+70s/T/ChNaGGPa bSzDYGkGP2ElAfheWA+rt/yV74AKqSbZ31X3c5lBISlVFLK2+J041BM2JnAZnwCh6NIjnISUS6g
 +ZwG3M4DhnyIQ+2i7OBBeTYzytbigT3aebkpWDt64zFnh17nrLk26DscmG4bih8VtnAsD1C3
X-Proofpoint-GUID: 09sYDctU5dkMgZhpCgC3f4KlQ2Y7mtG_
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504290098
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53TAumr3011492
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 13:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215663

ChangeLog:
https://github.com/makedumpfile/makedumpfile/releases/tag/1.7.7

This version supports the following new kernels:
  - 6.12, 6.13, 6.14

Drop backport patch.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-compiling-error-too-many-arguments-.patch | 43 -------------------
 ...umpfile_1.7.6.bb =3D> makedumpfile_1.7.7.bb} |  3 +-
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 meta/recipes-kernel/makedumpfile/makedumpfile/0001-PA=
TCH-fix-gcc-15-compiling-error-too-many-arguments-.patch
 rename meta/recipes-kernel/makedumpfile/{makedumpfile_1.7.6.bb =3D> make=
dumpfile_1.7.7.bb} (92%)

diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix=
-gcc-15-compiling-error-too-many-arguments-.patch b/meta/recipes-kernel/m=
akedumpfile/makedumpfile/0001-PATCH-fix-gcc-15-compiling-error-too-many-a=
rguments-.patch
deleted file mode 100644
index 90f1b4038b..0000000000
--- a/meta/recipes-kernel/makedumpfile/makedumpfile/0001-PATCH-fix-gcc-15=
-compiling-error-too-many-arguments-.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 73e62a08022bf8e5edad250f8c1452f0be3771a3 Mon Sep 17 00:00:00 2001
-From: Coiby Xu <coxu@redhat.com>
-Date: Thu, 23 Jan 2025 17:47:10 +0800
-Subject: [PATCH] [PATCH] fix gcc-15 compiling error: too many arguments =
to function eppic_init
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=3D2340813
-
-When building makekdumpfile against gcc-15, the following error is
-shown,
-
-    erase_info.c: In function =E2=80=98process_eppic_file=E2=80=99:
-    erase_info.c:2226:13: error: too many arguments to function =E2=80=98=
eppic_init=E2=80=99; expected 0, have 1
-     2226 |         if (eppic_init(&eppic_cb)) {
-          |             ^~~~~~~~~~ ~~~~~~~~~
-    make: *** [Makefile:109: erase_info.o] Error 1
-
-Upstream-Status: Backport [https://github.com/makedumpfile/makedumpfile/=
commit/73e62a08022bf8e5edad250f8c1452f0be3771a3]
-
-Signed-off-by: Coiby Xu <coxu@redhat.com>
-Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
----
- erase_info.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/erase_info.c b/erase_info.c
-index cbe1681..af6bfae 100644
---- a/erase_info.c
-+++ b/erase_info.c
-@@ -2192,7 +2192,7 @@ process_eppic_file(char *name_config)
- {
- 	void *handle;
- 	void (*eppic_load)(char *), (*eppic_unload)(char *);
--	int (*eppic_init)();
-+	int (*eppic_init)(struct call_back *);
-=20
- 	/*
- 	 * Dynamically load the eppic_makedumpfile.so library.
---=20
-2.48.1
-
diff --git a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb b/met=
a/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb
similarity index 92%
rename from meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
rename to meta/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb
index 46be13e7d0..23fcef9569 100644
--- a/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.6.bb
+++ b/meta/recipes-kernel/makedumpfile/makedumpfile_1.7.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa9=
54499f7abaabaa882bbe"
 LICENSE =3D "GPL-2.0-only"
=20
 SRCBRANCH ?=3D "master"
-SRCREV =3D "97a89484e2c960dd64933e1cea7a7248138f8a76"
+SRCREV =3D "e4ae6b5ee04edeeb03db89bee372904157e3378d"
=20
 DEPENDS =3D "bzip2 zlib elfutils xz"
 RDEPENDS:${PN}-tools =3D "perl ${PN}"
@@ -26,7 +26,6 @@ FILES:${PN}-tools =3D "${bindir}/*.pl"
 SRC_URI =3D "\
     git://github.com/makedumpfile/makedumpfile;branch=3D${SRCBRANCH};pro=
tocol=3Dhttps \
     file://0001-makedumpfile-replace-hardcode-CFLAGS.patch \
-    file://0001-PATCH-fix-gcc-15-compiling-error-too-many-arguments-.pat=
ch \
 "
=20
 S =3D "${WORKDIR}/git"
--=20
2.34.1


