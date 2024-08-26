Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7AAC5472E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 20:19:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.62735.1724703540159992298
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 13:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=89680760d5=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47Q5KXnT009129
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 13:18:59 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 417f1k9y5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 13:18:59 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47QKIws2000934
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 13:18:58 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 417f1k9y5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 13:18:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcLj1nCqRnaUIo9DgVoHzel6BII0Xq1eOKUvnJ2fstQb5n8RDOcOZqCp9iQkWtDelt5d2Nvoz78olwY9Q1HfjQvfEYuoqks8eGlxSjDTiQFqgNKiGkDpxU9qQOin+jgNiCnwf7eVeadTiEsQjgKB7Of9EZv4dc+0+HgMV22fvCJm7yL4Rg9C3aY6SXBqigCQ1+/5FSKtyrRcFJZr/9bZQDJUmrM6xenDdeQ3jKMt5Gjwb+jc+b2//Tp4IM/m+xJUmK51VPqscLfTSiRILrV5ixeFTqPWslhQYqZZNdegy6rRGckZjc37qnHGYXj02jOVSxLWPdJNxsn+aIiYgKGBdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnuUXspNDrQmjLa+VJUaZSO47SfGqqXMHLsO7go/KGU=;
 b=RtD06+Aycdu7JiJR83jmcJL4PvavtJMisDXJ29lpGkS3WqJT5CAh6msR/FehfuEU9Xf7d8PEeuIy8iVUvO1JuNClhIz8QaVxO8o1cnUsdCAGsxHZccx8mXERWOKvZJFa1AZsPqNbYhCfNSRw+xFcBRSl/SFao6TJsKDpEXIS8ZMnpyZhFQmnvi5HeY9g1GAS8yeYn3RTSHHdiMRnsIGa9THZD63yjK8ph6WYmxLeqJj4XXW/XVc9u+NtMLdqC3gtoQUV+bWgO2IWVY/e3npHXKZBbQ6/7ms86uMgk3ghgNcTWrXv15XL+8FmiQsodvO6n5KxEPCvVi4O51wyVJjfuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH0PR11MB5047.namprd11.prod.outlook.com (2603:10b6:510:3c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 20:18:53 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 20:18:53 +0000
Content-Type: multipart/alternative;
 boundary="------------00B7u3JSj0OP9P8dU79v8BHc"
Message-ID: <39eb6b48-c5a6-4fe2-9719-aa9d100ea022@windriver.com>
Date: Mon, 26 Aug 2024 16:18:51 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][scarthgap][PATCH 1/1] qemu: fix CVE-2024-7409
To: archana.polampalli@windriver.com, openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
References: <20240826135702.3956243-1-archana.polampalli@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20240826135702.3956243-1-archana.polampalli@windriver.com>
X-ClientProxiedBy: YQBPR01CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::24) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH0PR11MB5047:EE_
X-MS-Office365-Filtering-Correlation-Id: a5bd0971-7463-4f8c-e40e-08dcc60c4e13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VGEvTWFpRnF6cXd2akN0T3M5Q1ZHWWpJS2V3d1o1Qld2dHFHWXVwaElEVHVT?=
 =?utf-8?B?Q1VtNmtleDhURGU5SDZXWnQ4QU1uOFkyWnZBQkM4NnVvQTdmRGtEZ3docGd1?=
 =?utf-8?B?ZkVMOEJzWU9IemR0eS9CQ1NWbVYxbmpINGc0WjR1VmN2dndJbWhkZ3NBTVlw?=
 =?utf-8?B?Q0hyM1hOQ2NzajhzVjFiQXE3TEpnd1lublUveEtVSHZ2Z0psd2JEYkdMZENX?=
 =?utf-8?B?azVERVc4QUtCeFNWRGtmSS93RWtBTTI1Rlh2cThwL1lkbENibkU2QXArNEdZ?=
 =?utf-8?B?SU45SG1jQ1JEYjVGR0h0akJrNEZuOFNpTUtyUVFvdTBueld4cWQvUWpQTFlr?=
 =?utf-8?B?ZzB3cURheDRnRk1HRE9mRzIwZFVDWEIzeWdPM1ZoWU9LM3lvaVFXMGUzN0dr?=
 =?utf-8?B?NmRGYnoxS0k3NmlMazBuenZZZnl6UUsxUTVobGZ4UDB4aVVWRTJ3enBWZEZH?=
 =?utf-8?B?a2JHTE9iNzR5c29WbDRqY1l3aGx6TU1nenNzdEhQTlR5UnhPQ0Fnb0cwbkVj?=
 =?utf-8?B?djFKYTF1Tnd5UVVNVWpvUDZDL0lCaXNTdlBCYk80WmdqMDlHSk92d0d3RW5J?=
 =?utf-8?B?RW1pY3lINFIxZ0xRUWs4S2NDNXNYcmxkMHhnb1A5Um5aNFFLMnNNYjI5aDRK?=
 =?utf-8?B?VzRCRDFCNmg4NXg3b1hYcFVESnBjN3VtME9BalUrVG9mSGFMWk9EaWl5WXVn?=
 =?utf-8?B?M2hvd2lBZTFFZFNFc042TFJzRmFkeEc5anpBUU9ueVc1ZGJYUG5rZDM0eWZQ?=
 =?utf-8?B?UFQ0UTJlK3dKdHRvem9YcjZ2bk14VlpFMFNRdGN4M3lycTkxRG5zK3JLRDNH?=
 =?utf-8?B?RHRGdU1MQmtHbWJUdnE1MVQ5RzVjTTdzZi9XSWNwQktmcit5R2FXMmNvcXFK?=
 =?utf-8?B?eE5WdWx3ZVJCSlZwbTBkR2JjNW03Nng1bG91TE9vRE0yaWtMUzV5cnZDcWJH?=
 =?utf-8?B?MjlxN1pZcUJQb2J5NDY2YnVjWFpjV2s0dzdlWCtKNlRPM2hjMEIrNXdNZUcv?=
 =?utf-8?B?Mk5ldG54akxBQUhGR2JtdGZ3akIzUGpmQStlRk9vc0NjU29Ob3VEQTNic2Ro?=
 =?utf-8?B?YXZ2L1QyRWt4dDhSOWNmUkNiWDdhMm5PVHpxeThiQVI3Q1gxemgyU3dmR3Rr?=
 =?utf-8?B?WUl6Z1JMYlNPYm45a0piRGd4SmFnaUFzRkM4UmNTLzIvdGpWK2gxMnEreWhl?=
 =?utf-8?B?ektOUzFoTXV2aU5Tek93K0pNekNCREl3aUtPK29ibTJkZlBLODljTUc5Uit2?=
 =?utf-8?B?eG9IcnA5QlhtUEkzMmp2WmZVdS81c3JzTVNmdTQ5SWExclN2VTArbFJESkFG?=
 =?utf-8?B?dHQ5MGpDb0p6SmxQakhJajR3VXhkc1JnRnVzTmdwR0ozRHdRM1Z2T2hkbUJr?=
 =?utf-8?B?Sk4wRVVyMVFhcVczV1RSc0tjNlFFMkhwU3h4TVdFdXNDNzBZRC9NQ3JHTVZv?=
 =?utf-8?B?dW1aU1FUaWhQcHh1a1FYTVkyVFFFZDNDcFVCYnlIZlFZcGxVU0haU0U3eVBt?=
 =?utf-8?B?cHdJNmhmU0RGQmhlYTd3d1VqVWN4VUc5SHh1UWluNHhjMkdrWEorTzlpWElU?=
 =?utf-8?B?eUFIczA4UXhvNXJ3Y2NlL1NCLytLam5qeWZqVGRMenlLN205elRobEF2NTV3?=
 =?utf-8?B?NWZ4LzRrZ04rT2ZOZFdBdHdneWNNMFFVWTVUTU8yYjlRcXNGeC9JZTg1a3Ry?=
 =?utf-8?B?UHBtNC9nNFZZL2tSMUxMU3JTbExTQnR2d25rTTBNdlFFU1FyZXJ5SnJScDFy?=
 =?utf-8?Q?iZh/SffSP3yOxTcWCSqgqKMzAOGQW3QL3kCe0CJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dDdQOVE5bnp4ZTczWHdkYnJTS0V4RTlqVDY3Nitzakx5eDI0K1RTUFdaWDZK?=
 =?utf-8?B?RFQ3OFBRUHdUdXlvUG5zVmhlcjBvT0V6cDlrckltU05GUjlzSzhXRkdSWW1M?=
 =?utf-8?B?U0dzM0VibkZSazZnTTREN0JXNjYveHZTckNCdTIwc0owT2ZUUFVjZmh3Nmhq?=
 =?utf-8?B?eHpRUzNNSWsvSmd0L1lYdlE0OU5WL2o3L2g2TWNyTHVDb0JzZkF4WjBDdE16?=
 =?utf-8?B?WjJCY2UwczZtWDJaVEFNUUhFMEtZK0xlWW0xRzFNN3N4Yko5dVgwYzIyc014?=
 =?utf-8?B?ZkltYXlNVEdIWFc2K2FYMWdxR1Y1VmcrdjNrS1JZREVKbENJSnZRMXdLaDFC?=
 =?utf-8?B?STJsR0g5cXgrd0ZlQUxMcWMyVG5xRWhCdnZESzUzRW9Nb0h3NXdqMTllODJF?=
 =?utf-8?B?SnpudCtsNnZEN2RwU2hCK2RUbitsK05KV3RFUnlCcTNjQW52ZWp6RVg2elJD?=
 =?utf-8?B?UUFrVHZzL1dvOWJzRUltQlliUWwwVnZ6YkNTOG1aTzQrbUZMRVdzWndjL1dh?=
 =?utf-8?B?WXVnWlZ2WitDRWkySVJGU201cXhxY0RmbWpVMVhkVjlIc2NQWkVrZ1hrc0Zp?=
 =?utf-8?B?bmwwYlJ6WllyODdYSDNIZlBQbnZaYVhRNkM4eVM1dXlHa1pkL0hxZ0UrQXNB?=
 =?utf-8?B?Yis2Rmg5NEpGbURFU0VZa2p6TVV5QlJwNEVPQzNVb1IyMTRHUGE3ZXVncWRQ?=
 =?utf-8?B?MFhnTTFNMWppZEZ0YytkYUZ3bis4aVgvUmdyNEREM3U4R0pUK3FWUi9qMVhj?=
 =?utf-8?B?TFFCWXFQYVkzNVN3L01vUnBWeC9OVWhNWHJ4VkVJM2NCV2NIemRQS0xKZDF3?=
 =?utf-8?B?M3Y1WlFUV3k5M2YyNjZSV1VLc3hMV3QyeTYrWlB2MDNkVHZ6QXM3UUpNT0w1?=
 =?utf-8?B?TEtoNGlmbHNJZGEwRGJyMjJVNmZuMFpDSEtyWDdVcXA2b1p6OGw1WWdDT3NO?=
 =?utf-8?B?WllwVmQ5ZXNqWjZEaXBQTGJ0S21aMzMrWDlKVXlQdjNwNlJhblhrdCtXQUo5?=
 =?utf-8?B?Y21HbGloSzlYSTdWTXlLNGU2RnQyWlMzUk1FUEMwenhzOTBzWDNkVDFIWWNT?=
 =?utf-8?B?V3lHTDZEQ0xScjFqeDRuK21uSVBLRHVPOGZMZEZ3Z09XcndSa1dYYmhKRTBP?=
 =?utf-8?B?a2VsdjI1eHEyT0FpdUVUK1l6MUc0V1ZjUDgrMktOSTVQR1BvZ0RHcHpzQUI0?=
 =?utf-8?B?YzJTWEhEdUtpQndiSlR3UlphOVBhUjBiMHM4ekFHbjJNUlFXQjkrMEo3QUg1?=
 =?utf-8?B?Nm9IYUhRZk1hZ3RnejFJZzlaWVhpQW5mblM5MWNBK04yS01oN0tya2YxY2M2?=
 =?utf-8?B?Q0Z6ZWZweFA5WjNVc3dSQjhOc2djRGl3NFlINStydUNzU09qNFhXYmhTbzlX?=
 =?utf-8?B?WldYQk5xSGU2ak4xMkxBSEJuVTA1T3ZaajJkOTlXQ0UzcVYyZWtZamZqU1Rq?=
 =?utf-8?B?T2xsSzR4alN6SVFFbUVNaS9LZ3djNEJQemt0amR3NDRDcG04cnRaclVpamR3?=
 =?utf-8?B?Q0xicGpOMlRHR2dsN3VKN3hvNUs1R2pOVFVVdFZ6WjFMQ2VZNHdGakdsNHZu?=
 =?utf-8?B?S0tsTEhWUlpSVmtDVXJlRE0ydHBCOGg3aWpmcDdnMFh4bTNTVVpoK05IY2t5?=
 =?utf-8?B?VmZOL2d3bjc1Z0lEUUdmY2xUY0JENWQwVndUczlBRC9Nb3JpWi95SlhkazBr?=
 =?utf-8?B?SmliZm5aT2ltbEprK3FMOXVkQzNUQXNPSkN0Z0FiWXhWdWhKZ09reDlzaXkv?=
 =?utf-8?B?cDZRMG96RnBtd1Y4eWY4NFo2czZzSThWNDNYZjdjL3ZOWmJzRTA3OWQ5YmxD?=
 =?utf-8?B?VjhsWkgvbCs5T1hBc0g0WlVualZzWmtwN01QZW1oMFhFTnUyeWJqWlZxM2to?=
 =?utf-8?B?MEZacytwNmpPSVpGYjA1aDFsU1l6b001dzN3TTN0RzgzZG1yWVJ0eUJwUU9o?=
 =?utf-8?B?L2RIWXE0ZmhOcHNQR2Vpd0Exekozd0luV0NaWGZDWVpJdG9yRjhmQ0ZVZzZ4?=
 =?utf-8?B?cXVuL1VxZklMQWUwb0xUekJxK1pXS2kyU2Nzc1RDNkVCcWRhdmQvWXhGUEl6?=
 =?utf-8?B?enIweU41Y3ROczFJdm9rWC8vRFgrOUdjWVU3TytvRHgzYm1hUUpIWTFqMjRO?=
 =?utf-8?B?ajJvL2Vuay9XMnAwWEJkakJwT25ZcThGS2ZvYUJ5SjBucllMOTgzVGNBYnhV?=
 =?utf-8?B?amc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5bd0971-7463-4f8c-e40e-08dcc60c4e13
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 20:18:53.2965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tTi8KNOkJIo0+m7lF+Jy6hkur9K+NRpxGIse19WpnmUw/H8JQ8ALQAwil7vgevLoCh01mzrKWMu0tRv802nHI2Zg9HFuKsiEgB46VH3Surw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5047
X-Proofpoint-ORIG-GUID: EMtaJvjlLz34Wih0tA8iT6oWnAyA2aiD
X-Authority-Analysis: v=2.4 cv=McQ+uI/f c=1 sm=1 tr=0 ts=66cce333 cx=c_pps a=vIBLTX18KUGM0ea88UIWow==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=ID6ng7r3AAAA:8
 a=20KFwNOVAAAA:8 a=6R7veym_AAAA:8 a=NEAV23lmAAAA:8 a=MNj-0NSj0lLhA0vee-cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=J7shVm6D6-ZrtXBcItwA:9 a=DdxH542GWQ0K_xZw:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=AkheI1RvQwOzcTXhi5f4:22 a=ILCOIF4F_8SzUMnO7jNM:22
X-Proofpoint-GUID: 16TxvPVfFJEzDCMmJEBbWk6x_czQCSsp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_15,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408260156
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 20:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203773

--------------00B7u3JSj0OP9P8dU79v8BHc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47Q5KXnT009129

On 2024-08-26 9:57 a.m., Polampalli, Archana via lists.openembedded.org=20
wrote:
> From: Archana Polampalli<archana.polampalli@windriver.com>
>
> A flaw was found in the QEMU NBD Server. This vulnerability allows a de=
nial of service (DoS) attack
> via improper synchronization during socket closure when a client keeps =
a socket open as the server
> is taken offline.
>
> Signed-off-by: Archana Polampalli<archana.polampalli@windriver.com>
> ---
>   meta/recipes-devtools/qemu/qemu.inc           |   4 +
>   .../qemu/qemu/CVE-2024-7409-0001.patch        | 167 +++++++++++++++++
>   .../qemu/qemu/CVE-2024-7409-0002.patch        | 175 +++++++++++++++++=
+
>   .../qemu/qemu/CVE-2024-7409-0003.patch        | 126 +++++++++++++
>   .../qemu/qemu/CVE-2024-7409-0004.patch        | 164 ++++++++++++++++
>   5 files changed, 636 insertions(+)
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001=
.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0002=
.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0003=
.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0004=
.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtool=
s/qemu/qemu.inc
> index 50d92b04bd..a1d8a309a0 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -45,6 +45,10 @@ SRC_URI =3D"https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \=20
> file://CVE-2024-4467-0003.patch \ file://CVE-2024-4467-0004.patch \=20
> file://CVE-2024-4467-0005.patch \ + file://CVE-2024-7409-0001.patch \=20
> + file://CVE-2024-7409-0002.patch \ + file://CVE-2024-7409-0003.patch=20
> \ + file://CVE-2024-7409-0004.patch \ "
>   UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>  =20
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001.patch b=
/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001.patch
> new file mode 100644
> index 0000000000..631e93a6d2
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001.patch
> @@ -0,0 +1,167 @@
> +From fb1c2aaa981e0a2fa6362c9985f1296b74f055ac Mon Sep 17 00:00:00 2001
> +From: Eric Blake<eblake@redhat.com>
> +Date: Wed, 7 Aug 2024 08:50:01 -0500
> +Subject: [PATCH] nbd/server: Plumb in new args to nbd_client_add()
> +
> +Upcoming patches to fix a CVE need to track an opaque pointer passed
> +in by the owner of a client object, as well as request for a time
> +limit on how fast negotiation must complete.  Prepare for that by
> +changing the signature of nbd_client_new() and adding an accessor to
> +get at the opaque pointer, although for now the two servers
> +(qemu-nbd.c and blockdev-nbd.c) do not change behavior even though
> +they pass in a new default timeout value.
> +
> +Suggested-by: Vladimir Sementsov-Ogievskiy<vsementsov@yandex-team.ru>
> +Signed-off-by: Eric Blake<eblake@redhat.com>
> +Message-ID:<20240807174943.771624-11-eblake@redhat.com>
> +Reviewed-by: Daniel P. Berrang=C3=A9<berrange@redhat.com>
> +[eblake: s/LIMIT/MAX_SECS/ as suggested by Dan]
> +Signed-off-by: Eric Blake<eblake@redhat.com>
> +
> +CVE: CVE-2024-7409
> +
> +Upstream-Status: Backport [https://github.com/qemu/qemu/commit/fb1c2aa=
a981e0a2fa6362c9985f1296b74f055ac]


I don't see this commit being backported to the stable-8.2 branch
so this manual backport makes sense.

Nevertheless, it does seem like we're behind by a couple of point release=
s:

https://github.com/qemu/qemu/commits/stable-8.2/

8.2.5 is latest and 8.2.6 is being prepped. See below for the 63 (87)=20
bug fix shortlogs.


Steve, Archana,

How about we merge this and then do an update once 8.2.6 is out?

../Randy


poky.git on scarthgap
=E2=9D=AF fd qemu_
meta/recipes-devtools/qemu/qemu_8.2.3.bb

qemu.git on stable-8.2
=E2=9D=AF git log --oneline v8.2.3..HEAD | wc -l
87

=E2=9D=AF git log --oneline v8.2.3..v8.2.5 | wc -l
63

=E2=9D=AF git log --oneline v8.2.3..v8.2.5
909772f0a5 (tag: v8.2.5) Update version for 8.2.5 release
6feae1d0dd target/loongarch: fix a wrong print in cpu dump
af008b379c ui/sdl2: Allow host to power down screen
276ec925a7 target/i386: fix SSE and SSE2 feature check
d84afebcee target/i386: fix xsave.flat from kvm-unit-tests
2891807479 disas/riscv: Decode all of the pmpcfg and pmpaddr CSRs
ae5edeb084 target/riscv/kvm.c: Fix the hart bit setting of AIA
935be461eb target/riscv: rvzicbo: Fixup CBO extension register calculatio=
n
37d6c6e495 target/riscv: do not set mtval2 for non guest-page faults
6da92af4f9 target/riscv: prioritize pmp errors in raise_mmu_exception()
0f9578497c target/riscv: rvv: Remove redudant SEW checking for vector fp=20
narrow/widen instructions
909772f0a5 (tag: v8.2.5) Update version for 8.2.5 release
6feae1d0dd target/loongarch: fix a wrong print in cpu dump
af008b379c ui/sdl2: Allow host to power down screen
276ec925a7 target/i386: fix SSE and SSE2 feature check
d84afebcee target/i386: fix xsave.flat from kvm-unit-tests
2891807479 disas/riscv: Decode all of the pmpcfg and pmpaddr CSRs
ae5edeb084 target/riscv/kvm.c: Fix the hart bit setting of AIA
935be461eb target/riscv: rvzicbo: Fixup CBO extension register calculatio=
n
37d6c6e495 target/riscv: do not set mtval2 for non guest-page faults
6da92af4f9 target/riscv: prioritize pmp errors in raise_mmu_exception()
0f9578497c target/riscv: rvv: Remove redudant SEW checking for vector fp=20
narrow/widen instructions
c4173e4caf target/riscv: rvv: Check single width operator for=20
vfncvt.rod.f.f.w
d813f356ad target/riscv: rvv: Check single width operator for vector fp=20
widen instructions
749907f857 target/riscv: rvv: Fix Zvfhmin checking for vfwcvt.f.f.v and=20
vfncvt.f.f.w instructions
4cba687b86 target/riscv/cpu.c: fix Zvkb extension config
ec182b1045 target/riscv: Fix the element agnostic function problem
cf7143fdb7 target/riscv/kvm: tolerate KVM disable ext errors
cd1228a80e hw/intc/riscv_aplic: APLICs should add child earlier than real=
ize
b9b2f3bbab iotests: test NBD+TLS+iothread
9a6143a73e qio: Inherit follow_coroutine_ctx across TLS
71c7036b18 target/arm: Disable SVE extensions when SVE is disabled
3f470980b4 hw/intc/arm_gic: Fix handling of NS view of GICC_APR<n>
0970313b05 hvf: arm: Fix encodings for ID_AA64PFR1_EL1 and debug System=20
registers
8965709b86 gitlab: use 'setarch -R' to workaround tsan bug
3b36dd0005 gitlab: use $MAKE instead of 'make'
fc88204b82 dockerfiles: add 'MAKE' env variable to remaining containers
ca0799624e gitlab: Update msys2-64bit runner tags
52031d6be5 target/i386: no single-step exception after MOV or POP SS
c6171d524d target/i386: disable jmp_opt if EFLAGS.RF is 1
93fa768d40 hw/loongarch/virt: Fix FDT memory node address width
d679c82488 hw/loongarch: Fix fdt memory node wrong 'reg'
e3a2aa9542 hw/core/machine: move compatibility flags for VirtIO-net USO=20
to machine 8.1
9b98ab7d3d target-i386: hyper-v: Correct kvm_hv_handle_exit return value
90e023f2bc tcg/loongarch64: Fill out tcg_out_{ld,st} for vector regs
355527b646 ui/gtk: Check if fence_fd is equal to or greater than 0
f44d2398d8 ui/gtk: Fix mouse/motion event scaling issue with GTK display=20
backend
05bfa963df configure: Fix error message when C compiler is not working
19a931f207 configure: quote -D options that are passed through to meson
2b95625643 target/i386: fix feature dependency for WAITPKG
1cc3cb96b8 target/i386: rdpkru/wrpkru are no-prefix instructions
eb761b4ee5 target/i386: fix operand size for DATA16 REX.W POPCNT
7d7b770bde hw/remote/vfio-user: Fix config space access byte order
7dbebba4a5 hw/loongarch/virt: Fix memory leak
819f92ec3e target/sparc: Fix FMUL8x16
d3da3d02a0 target/sparc: Fix FEXPAND
50ed4f856a target/i386: Give IRQs a chance when resetting=20
HF_INHIBIT_IRQ_MASK
1332b8dd43 (tag: v8.2.4) Update version for 8.2.4 release
07d46408cb target/sh4: Fix SUBV opcode
dc5390a0ca target/sh4: Fix ADDV opcode
7b4804c965 hw/arm/npcm7xx: Store derivative OTP fuse key in little endian
dfcbb9ef24 hw/dmax/xlnx_dpdma: fix handling of address_extension=20
descriptor fields
d5cf8bed29 hw/ufs: Fix buffer overflow bug



 ><snip><


--=20
# Randy MacLeod
# Wind River Linux

--------------00B7u3JSj0OP9P8dU79v8BHc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47Q5KXnT009129

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-08-26 9:57 a.m., Polampalli,
      Archana via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20240826135702.3956243-1-archan=
a.polampalli@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Archana Polampalli <a =
class=3D"moz-txt-link-rfc2396E" href=3D"mailto:archana.polampalli@windriv=
er.com">&lt;archana.polampalli@windriver.com&gt;</a>

A flaw was found in the QEMU NBD Server. This vulnerability allows a deni=
al of service (DoS) attack
via improper synchronization during socket closure when a client keeps a =
socket open as the server
is taken offline.

Signed-off-by: Archana Polampalli <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:archana.polampalli@windriver.com">&lt;archana.polampalli@windr=
iver.com&gt;</a>
---
 meta/recipes-devtools/qemu/qemu.inc           |   4 +
 .../qemu/qemu/CVE-2024-7409-0001.patch        | 167 +++++++++++++++++
 .../qemu/qemu/CVE-2024-7409-0002.patch        | 175 ++++++++++++++++++
 .../qemu/qemu/CVE-2024-7409-0003.patch        | 126 +++++++++++++
 .../qemu/qemu/CVE-2024-7409-0004.patch        | 164 ++++++++++++++++
 5 files changed, 636 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001.pa=
tch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0002.pa=
tch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0003.pa=
tch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0004.pa=
tch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 50d92b04bd..a1d8a309a0 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -45,6 +45,10 @@ SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D=
"https://download.qemu.org/${BPN}-${PV}.tar.xz\file://CVE-2024-4467-0003.=
patch\file://CVE-2024-4467-0004.patch\file://CVE-2024-4467-0005.patch\+fi=
le://CVE-2024-7409-0001.patch\+file://CVE-2024-7409-0002.patch\+file://CV=
E-2024-7409-0003.patch\+file://CVE-2024-7409-0004.patch\">&quot;https://d=
ownload.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2024-4467-0003.patch \
            file://CVE-2024-4467-0004.patch \
            file://CVE-2024-4467-0005.patch \
+           file://CVE-2024-7409-0001.patch \
+           file://CVE-2024-7409-0002.patch \
+           file://CVE-2024-7409-0003.patch \
+           file://CVE-2024-7409-0004.patch \
            &quot;</a>
 UPSTREAM_CHECK_REGEX =3D &quot;qemu-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&quo=
t;
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001.patch
new file mode 100644
index 0000000000..631e93a6d2
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001.patch
@@ -0,0 +1,167 @@
+From fb1c2aaa981e0a2fa6362c9985f1296b74f055ac Mon Sep 17 00:00:00 2001
+From: Eric Blake <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:eblak=
e@redhat.com">&lt;eblake@redhat.com&gt;</a>
+Date: Wed, 7 Aug 2024 08:50:01 -0500
+Subject: [PATCH] nbd/server: Plumb in new args to nbd_client_add()
+
+Upcoming patches to fix a CVE need to track an opaque pointer passed
+in by the owner of a client object, as well as request for a time
+limit on how fast negotiation must complete.  Prepare for that by
+changing the signature of nbd_client_new() and adding an accessor to
+get at the opaque pointer, although for now the two servers
+(qemu-nbd.c and blockdev-nbd.c) do not change behavior even though
+they pass in a new default timeout value.
+
+Suggested-by: Vladimir Sementsov-Ogievskiy <a class=3D"moz-txt-link-rfc2=
396E" href=3D"mailto:vsementsov@yandex-team.ru">&lt;vsementsov@yandex-tea=
m.ru&gt;</a>
+Signed-off-by: Eric Blake <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:eblake@redhat.com">&lt;eblake@redhat.com&gt;</a>
+Message-ID: <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:2024080717=
4943.771624-11-eblake@redhat.com">&lt;20240807174943.771624-11-eblake@red=
hat.com&gt;</a>
+Reviewed-by: Daniel P. Berrang=C3=A9 <a class=3D"moz-txt-link-rfc2396E" =
href=3D"mailto:berrange@redhat.com">&lt;berrange@redhat.com&gt;</a>
+[eblake: s/LIMIT/MAX_SECS/ as suggested by Dan]
+Signed-off-by: Eric Blake <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:eblake@redhat.com">&lt;eblake@redhat.com&gt;</a>
+
+CVE: CVE-2024-7409
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://github.com/qemu/qemu/commit/fb1c2aaa981e0a2fa6362c9985f1296b74f055a=
c">https://github.com/qemu/qemu/commit/fb1c2aaa981e0a2fa6362c9985f1296b74=
f055ac</a>]</pre>
    </blockquote>
    <p><br>
    </p>
    <p>I don't see this commit being backported to the stable-8.2 branch<=
br>
      so this manual backport makes sense.<br>
    </p>
    <p>Nevertheless, it does seem like we're behind by a couple of point
      releases:<br>
      <br>
      <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/qemu/=
qemu/commits/stable-8.2/">https://github.com/qemu/qemu/commits/stable-8.2=
/</a><br>
    </p>
    <p>8.2.5 is latest and 8.2.6 is being prepped. See below for the 63
      (87) bug fix shortlogs.</p>
    <p><br>
      Steve, Archana, <br>
      <br>
      How about we merge this and then do an update once 8.2.6 is out?<br=
>
      <br>
      ../Randy</p>
    <p><br>
    </p>
    <p>poky.git on scarthgap <br>
      =E2=9D=AF fd qemu_<br>
      meta/recipes-devtools/qemu/qemu_8.2.3.bb<br>
      <br>
    </p>
    <p>qemu.git on stable-8.2<br>
      =E2=9D=AF git log --oneline v8.2.3..HEAD | wc -l<br>
      87<br>
      <br>
      =E2=9D=AF git log --oneline v8.2.3..v8.2.5 | wc -l<br>
      63<br>
    </p>
    <p>=E2=9D=AF git log --oneline v8.2.3..v8.2.5<br>
      909772f0a5 (tag: v8.2.5) Update version for 8.2.5 release<br>
      6feae1d0dd target/loongarch: fix a wrong print in cpu dump<br>
      af008b379c ui/sdl2: Allow host to power down screen<br>
      276ec925a7 target/i386: fix SSE and SSE2 feature check<br>
      d84afebcee target/i386: fix xsave.flat from kvm-unit-tests<br>
      2891807479 disas/riscv: Decode all of the pmpcfg and pmpaddr CSRs<b=
r>
      ae5edeb084 target/riscv/kvm.c: Fix the hart bit setting of AIA<br>
      935be461eb target/riscv: rvzicbo: Fixup CBO extension register
      calculation<br>
      37d6c6e495 target/riscv: do not set mtval2 for non guest-page
      faults<br>
      6da92af4f9 target/riscv: prioritize pmp errors in
      raise_mmu_exception()<br>
      0f9578497c target/riscv: rvv: Remove redudant SEW checking for
      vector fp narrow/widen instructions<br>
      909772f0a5 (tag: v8.2.5) Update version for 8.2.5 release<br>
      6feae1d0dd target/loongarch: fix a wrong print in cpu dump<br>
      af008b379c ui/sdl2: Allow host to power down screen<br>
      276ec925a7 target/i386: fix SSE and SSE2 feature check<br>
      d84afebcee target/i386: fix xsave.flat from kvm-unit-tests<br>
      2891807479 disas/riscv: Decode all of the pmpcfg and pmpaddr CSRs<b=
r>
      ae5edeb084 target/riscv/kvm.c: Fix the hart bit setting of AIA<br>
      935be461eb target/riscv: rvzicbo: Fixup CBO extension register
      calculation<br>
      37d6c6e495 target/riscv: do not set mtval2 for non guest-page
      faults<br>
      6da92af4f9 target/riscv: prioritize pmp errors in
      raise_mmu_exception()<br>
      0f9578497c target/riscv: rvv: Remove redudant SEW checking for
      vector fp narrow/widen instructions<br>
      c4173e4caf target/riscv: rvv: Check single width operator for
      vfncvt.rod.f.f.w<br>
      d813f356ad target/riscv: rvv: Check single width operator for
      vector fp widen instructions<br>
      749907f857 target/riscv: rvv: Fix Zvfhmin checking for
      vfwcvt.f.f.v and vfncvt.f.f.w instructions<br>
      4cba687b86 target/riscv/cpu.c: fix Zvkb extension config<br>
      ec182b1045 target/riscv: Fix the element agnostic function problem<=
br>
      cf7143fdb7 target/riscv/kvm: tolerate KVM disable ext errors<br>
      cd1228a80e hw/intc/riscv_aplic: APLICs should add child earlier
      than realize<br>
      b9b2f3bbab iotests: test NBD+TLS+iothread<br>
      9a6143a73e qio: Inherit follow_coroutine_ctx across TLS<br>
      71c7036b18 target/arm: Disable SVE extensions when SVE is disabled<=
br>
      3f470980b4 hw/intc/arm_gic: Fix handling of NS view of
      GICC_APR&lt;n&gt;<br>
      0970313b05 hvf: arm: Fix encodings for ID_AA64PFR1_EL1 and debug
      System registers<br>
      8965709b86 gitlab: use 'setarch -R' to workaround tsan bug<br>
      3b36dd0005 gitlab: use $MAKE instead of 'make'<br>
      fc88204b82 dockerfiles: add 'MAKE' env variable to remaining
      containers<br>
      ca0799624e gitlab: Update msys2-64bit runner tags<br>
      52031d6be5 target/i386: no single-step exception after MOV or POP
      SS<br>
      c6171d524d target/i386: disable jmp_opt if EFLAGS.RF is 1<br>
      93fa768d40 hw/loongarch/virt: Fix FDT memory node address width<br>
      d679c82488 hw/loongarch: Fix fdt memory node wrong 'reg'<br>
      e3a2aa9542 hw/core/machine: move compatibility flags for
      VirtIO-net USO to machine 8.1<br>
      9b98ab7d3d target-i386: hyper-v: Correct kvm_hv_handle_exit return
      value<br>
      90e023f2bc tcg/loongarch64: Fill out tcg_out_{ld,st} for vector
      regs<br>
      355527b646 ui/gtk: Check if fence_fd is equal to or greater than 0<=
br>
      f44d2398d8 ui/gtk: Fix mouse/motion event scaling issue with GTK
      display backend<br>
      05bfa963df configure: Fix error message when C compiler is not
      working<br>
      19a931f207 configure: quote -D options that are passed through to
      meson<br>
      2b95625643 target/i386: fix feature dependency for WAITPKG<br>
      1cc3cb96b8 target/i386: rdpkru/wrpkru are no-prefix instructions<br=
>
      eb761b4ee5 target/i386: fix operand size for DATA16 REX.W POPCNT<br=
>
      7d7b770bde hw/remote/vfio-user: Fix config space access byte order<=
br>
      7dbebba4a5 hw/loongarch/virt: Fix memory leak<br>
      819f92ec3e target/sparc: Fix FMUL8x16<br>
      d3da3d02a0 target/sparc: Fix FEXPAND<br>
      50ed4f856a target/i386: Give IRQs a chance when resetting
      HF_INHIBIT_IRQ_MASK<br>
      1332b8dd43 (tag: v8.2.4) Update version for 8.2.4 release<br>
      07d46408cb target/sh4: Fix SUBV opcode<br>
      dc5390a0ca target/sh4: Fix ADDV opcode<br>
      7b4804c965 hw/arm/npcm7xx: Store derivative OTP fuse key in little
      endian<br>
      dfcbb9ef24 hw/dmax/xlnx_dpdma: fix handling of address_extension
      descriptor fields<br>
      d5cf8bed29 hw/ufs: Fix buffer overflow bug<br>
      <br>
      <br>
      <br>
    </p>
    <p>&gt;&lt;snip&gt;&lt;</p>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------00B7u3JSj0OP9P8dU79v8BHc--

