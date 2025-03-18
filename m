Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA232C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 00:35:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.803.1742258118752713590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 17:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5172b7ed30=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I0ANje030226
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 00:35:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d0h92pt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 00:35:17 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52I0ZGYY001875;
	Tue, 18 Mar 2025 00:35:16 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2049.outbound.protection.outlook.com [104.47.58.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d0h92pt6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 00:35:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flBCE0+aqOdUzlcwSqgZvaDuxeSlMEqVKueEpwrIE9aLBBcRDKD8hX5oL9NhtIvyL7LRhieSWpv9jsjXzyOYoqGAsjrY5ZvGaCMtE5/SfOJ+fZyoz9UY/f23DqSlywYq1L+ch2AJMxsBKiJFwyJ+w3Jb4N0CFmOUxM9ypjITUxfZSQErkY7SyJ7x0b/TxLql3tsewPFgJOH+WvJBXO2ihTIP3oFuFFTRn8pmdqFQ6OWeNKmFyBHbuGNfWxR5/5zTAa+Zru+f4OuRLNFltxGsFChtfH5aEL7lLpKbAudTsdR1NW3kA+qOEO6xVU62LIP0fzrTff0oRxNxvfmj7XIqOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STthhZ1IGkEzVp4risUsfRx6VUL7ubLI/l3sFX4w/ew=;
 b=PXY0RrAucT9r/J8vIv0PcF3614vVgzIiNV4wkU1e0dupUPJDhqAYFNkX099MGOkNRYyOZFObAslZLfJWH0qpsmdJ+fkAGfvbOleBo0LpTKaHv62J5PwYg0gCRiXmWgCGqtCCZVvir9A8AzZn3RPchIPGBthIQvEQXKDVMs7VlRkNoDrOPszjjrKc1fosDhWpXUNatkLs3AKC5S/gx6qDIIiepJ3F0MQWq/u63dQXycZ/0O8KOnVe0wP5DdkrwLDjjmANF6gydL+pcwSjMF+oYSF2/xN5cv4Z6UY9HSMGLrTGewflPbRS8A4lByAY52YF71dQkFJrvD9evBQnSvi5Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA1PR11MB8253.namprd11.prod.outlook.com (2603:10b6:806:250::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 00:35:14 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%6]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 00:35:13 +0000
Content-Type: multipart/alternative;
 boundary="------------Y04bjeO0g9uX0wFqmRjsOpJB"
Message-ID: <8977d71f-acc9-4653-8f56-076893329f4e@windriver.com>
Date: Mon, 17 Mar 2025 20:35:09 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V4 2/3] rust: Upgrade 1.82.0->1.83.0 --> bloat
 alert !!
To: Yash Shinde <Yash.Shinde@windriver.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        deepesh.varatharajan@windriver.com
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Khem Raj <raj.khem@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20250305134459.2275598-1-Deepesh.Varatharajan@windriver.com>
 <20250305134459.2275598-2-Deepesh.Varatharajan@windriver.com>
 <c411d58d-bd27-4107-9b98-e39de14204df@windriver.com>
 <5d748ede629df75d0ed30df5418b42b936d5416b.camel@linuxfoundation.org>
 <03997060-1f1c-4784-af57-bb83b0514ebb@windriver.com>
 <a82ea56c-dc36-4784-a6cd-33d97014bdbe@windriver.com>
 <70820f45-41b1-487b-ac53-1e49ef57fd5f@windriver.com>
 <aa6b3d4c-bf6b-41b2-98e4-0ff854c5fc8d@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <aa6b3d4c-bf6b-41b2-98e4-0ff854c5fc8d@windriver.com>
X-ClientProxiedBy: SJ0PR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:a03:332::10) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA1PR11MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: e7dfa44e-2558-4e52-269e-08dd65b4bf2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SnVDZjlWcGw4dXMwZUY1R3FHczZGaDcybzczbUljWVRTbENhVXZuL3RGN2d1?=
 =?utf-8?B?UjRTdnRHZG11dTJDbEorT0FoRlRQS3RITTlRWVBmYVJiaUltcEgzd0w1NmVL?=
 =?utf-8?B?R0VHa3lQVWV3eng4ak4zRnFlRUFxSGc5cTE4ZGxFbmg5elRVWXFqVmtGNzNN?=
 =?utf-8?B?VU00dlpGSmZaMHIwVWNVakhRM1NnaU1xTVNheGhpdEYzVUhvaE11eFV2N3lI?=
 =?utf-8?B?WHN3WUp1U01UTkY2RlowL2NRa2RwUXZyYjRwdnpSWmNaN0sweDdUdGg4aGE2?=
 =?utf-8?B?bGw3WktUdFo4OG1MNXgzcXlSQ2VtNXkvL3FEMzNzblovQkxNeGN4TnFXR2I3?=
 =?utf-8?B?ZDNydDBlbFc4V1VIdmM3ZVNicDdrRC9VOHYrZzJxMDRYaU5kZit5aVE4TkRU?=
 =?utf-8?B?cFJZUTRLd2dyUkhjRzUxRXJpOEJGN0VaRmRzUkpzbE5XNEJtWXd5RWR6WDNB?=
 =?utf-8?B?NzZtWXhZNDJGd3RJN0l1cTN4TU4xTGlDUGp1TkduYVFYM0FBL2NNekkycmNY?=
 =?utf-8?B?K2ljeGNldXVYU09SOTFIaWEzWjlTeTkyZHB2OGR5TWRGY3hHQXJwWjFRc3hM?=
 =?utf-8?B?S1hYeGlJV0g2eXJ0dS9GMzJ5M3NTMWIxcHJjTUZDOWdkRlBoa3AwcEZuMDJX?=
 =?utf-8?B?S1RNYWpMNWwzRjJ3Vm9ZcTJmQXRobnlsSkhmTXc1RTlQWTZTdFBTRkF2V0xl?=
 =?utf-8?B?S2hacnI4bXVjMGxmYWQ4eS9jMjJEOVlkU1kyWXk5UmpGcXM3OEZhUE05NmZ1?=
 =?utf-8?B?VXlBeHNINUhzSWo1K3Q1RlBnNGY3QVlxSFhFZmdKV3M4ejJsLzZrK1FZSHlX?=
 =?utf-8?B?Y2wwZ2JmQU1uNDlUYzdyd2t2ZzFnVU04Y3RBcmk4MVMvdjhHSlZyVC9IdldP?=
 =?utf-8?B?bG5TMDI1RThzMDFUSERSREJqQ2dxdjkwcVFiKzNDajZIZjZDL2ozMUtkV0J5?=
 =?utf-8?B?Mnd4VUpXMVQvTkpRYXdwNmoycjlLMjM2eUdWMmZsdXlKbFpJTHEyclM3YUNq?=
 =?utf-8?B?LzBFSzRQZFlGeVFXQTZkaU5qNDF4UG9aZW5sempFd3l5SjVWZmZVK2gxTTJF?=
 =?utf-8?B?VndHS3pla1VObklFY2xvY2d4cFZiOGIwRFl5NTRsNE5aVlhYbGFHU3dkNWhE?=
 =?utf-8?B?Vm4xdVlremZwVjhCeDUzeE5Gb2krSjh6MjFLYjNZMzNHaEJCcStRZExnSU1M?=
 =?utf-8?B?bkFWVU5tVStTbElXTzM4eDlGVzY4aDZUZWVaa01lOFFNS3pzRHI4cjg2YUcw?=
 =?utf-8?B?cExrQWh5N1VBb3BkVy81MmJjMHpSSnRhdmQ2bGRkWEsrUnVLckUyU3JLN3la?=
 =?utf-8?B?L1RrOE9YbnMvZWRMcTVnSDJpQUx2cUh0QlZYMkhYTlpxVmh3clhXTGZvaVR6?=
 =?utf-8?B?UVcra3B5dGc3RlhiY2hpVTlZS243Y0p2cUZoeVRFbVlVM2VIeFVkN3dmTWhT?=
 =?utf-8?B?Szg5K256aEhlYzJtTWhZUUhLNmdTYjBvSGt2T00wZ2FMQnVHRWtoN1BXU05w?=
 =?utf-8?B?MExFcmN2ZFBPc3BUaitpcmMxT0tKSjJNQzBUZVZoQlFjUlJSbCttWTBNVzk3?=
 =?utf-8?B?YzkrRWhSTnZlZjc1N29KL1JtbCtFVmFoRmpIaXFSVU41YUUza1hlVnVBcGNh?=
 =?utf-8?B?aHIwWWlRTU05ODZYbUJVUURwTDZzQ01iZWNvZ1ZvNU5aaTNudVRIQU8yWDFs?=
 =?utf-8?B?ZmE4Sm9va2YzY0MvVXA0L1NRMitNbDBYK2c3VDFLem50NVVYWFI3NXJSZ04v?=
 =?utf-8?B?QnAvek8rQmVwcStydXRZV2xYbDNFcGNUR0ZCMXNjZ01sVCt5NTQ4RmlJcDRW?=
 =?utf-8?B?U3pFQmd4bm5UdmxBenc0MVBLcXN5YjFEbWVQdEt5K2Q4SSt2OVIyMm5ZeElj?=
 =?utf-8?B?MExuanVlRU1GdDFjRlNlOXFwazhwM2crQy9qbytyOEZ3aEE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d3V2QVZwV0pOL0ovbnRHUmhqRjZTTDJtb1QzdWN1RDFyUE1WY1JoV2ZzcDVY?=
 =?utf-8?B?bExERjZPZEhNdjdzYkVUWTZVc3FqMUhMaEVYazBoNEJjRDRDRzAwZGg3MjBo?=
 =?utf-8?B?Nys0bi9DNlhYWFhKNng4ajQ2emVCaDViYWVoVVFRZlZxZnl2Wi9sQmFHeGhn?=
 =?utf-8?B?ekl6M1lxWXcwTDZBOUhjUTNlVmVCdUFxWVk1OUpjZ0tuTm1uRkZZb2hnaTBi?=
 =?utf-8?B?VmROa1B3Qk9EVDNKdFFwSDdIa0pLWTVhZzZ3cGxZVE5Fd0dKdUlmM3Z0Q2pz?=
 =?utf-8?B?aVl6L3g2WjU0WXJiTG1Ydnl4cGdiVW4wKzdnaXBDTlpKTG9FYlFrL3pCQXM1?=
 =?utf-8?B?L2ZzYnExK0xlYm9pdUVxK25xLzloN3Vzd3dwMldmYW1HNVE0VlRibVNOMlF1?=
 =?utf-8?B?Z3RQdEV3enFzeWlqekRkSFJQN3hWNkxVMzMyM2xINkhBQnZqM2tMQzZlVEdO?=
 =?utf-8?B?TFVERGZWTWpua3VsRFdTZGpvcmtScEE5ZktWV09oc1FGUm92Yk1JTjN3dzFW?=
 =?utf-8?B?ZE5uK1dtTm1keDUxQmZuQ2x5SlRJZTdubXpmQ3A2cUFjRDNyUTlBVEMxMklW?=
 =?utf-8?B?eE5PUDlOR1o0dkpmRXpIUEpIcm5wckJ5VFZKV0dRajVrOENDTXlxSkVIQkZl?=
 =?utf-8?B?aXRxRko0d3RPVnBJd3U1NDdEWXY0MC9HU2o0emEvZEtlcFNxcnp3Z2x1bkZk?=
 =?utf-8?B?TGhlZjhKWnE2WTdXbCtwRmVHNHlGbEZGSVBWWmdxT2dlUlJyZCtEdzFqbDds?=
 =?utf-8?B?ZlFNanNzUVVhbWg1QXV6OTFjVTcyc3BhV0NSWlUwazFHMFZtcVNkZTNRbFRr?=
 =?utf-8?B?cWZhZTFUNDVzRW5JQUVsTEYySjhwSkxBZ3RhMXkvbFJCU3JBVTVZek1paXpq?=
 =?utf-8?B?WndLYkp2WGluV2Fjb2Z6RWl6aUkway9MT1Zta0x2UVJ6d2hiaFpKQW5pd1M5?=
 =?utf-8?B?NjVKMVpuS2dwT1kzU3laenlQVXBmbHhHS0pYMEdNVHNzOEFLMVAwbmJEdE5X?=
 =?utf-8?B?WURqVks1d2xYVWUxcEZNUjdvMEN3Y01UcWdmaEdpbWtTRUdINlhlVlNlZk51?=
 =?utf-8?B?NUphNW4zM3ZjSDYyVW8zdWEwS1F2Y25KNkx2Y3dVTlRMTjBsVTJJdFY1elRY?=
 =?utf-8?B?dFk5ZE9McmtKQ1ZTVlo2TUFXYlgyU3Mwem9KT1BCTlo5YjYxTHcxeTU0OHNs?=
 =?utf-8?B?SU1aQUVTWm8zN01tWllxelo3dG1uSjQ5dGVZWHBmbStzN2d4QTU2dTkxSmox?=
 =?utf-8?B?OGlnT0c0QXN6WUxhdEVZd0ZqSWJWYmhabmc5OTBVTUFKemlTd05oRE55RTF6?=
 =?utf-8?B?YlRMUk1xcFBMMnRTUlpERTc4TkVaRkRpL3lhOEF6c0JqK2crZWFJSnV4NHRX?=
 =?utf-8?B?eVErYUN0SXd0YktmcE5nOTl2cXlqbU1RcWh6Tk90QjE4VzhnQlpEemxIYzNp?=
 =?utf-8?B?ZDNLNVYxLzUwbVR3bXJFTXRickhZQkdPUytaMk9YSDg4SnJGbE9DUzZNOXg5?=
 =?utf-8?B?akdHVDhLOURleldvQWs5dEhmYWZsQzhZVEFmTXpZRFlWMkRwRXBYRk5YTllt?=
 =?utf-8?B?aXN3NjN5dDgwYlI5emU1M2JwY0JKTElaczNzTGVFZzYwa3ZHcHdiMEZzaHZn?=
 =?utf-8?B?a1lpa2RCUS9JUUFDOFVpMTFDVWdCZkFXb1RhWUFCTzVUZU8xdXhkZ0F4QnBX?=
 =?utf-8?B?bGthLzgwdUJGZjRSRTVpRWplNVF2T1F4Z085bHB1VHdqYXpCMTFONDAvNW5R?=
 =?utf-8?B?Sy9FR3k4eVpEU1RkWERHTDc5Vm9PazU3bGpEbWp1ZjVWSmxyRW9LUmZaMnVp?=
 =?utf-8?B?MXRUbzk0cU9yeGJMUzVsL2VybUFrUEV3Wkk5SjJ6ak8yUjVOV0xoZXNmZHZa?=
 =?utf-8?B?Uk1XUE1keTBlZmt0L2RnNVA1aVVQNW5XTmRmckg5ajZDSWg1VXF2MlZCd2FD?=
 =?utf-8?B?YVJJT0pLK1g3K1JCSTgxaVRvTjYycVRiS1BRTURmbk1Gb3IzNW9jSTNNS05G?=
 =?utf-8?B?Y21ScGVtRURkQk5Rb3huZlZPa0M2MS8xMGtqSzZ2K1p2NEkyVGhpZHFaR2pE?=
 =?utf-8?B?Wk5peFgvUkpmdWE5YzFhdnlLblNtcUdVZ3dIdkx2RUc4cmtXMUhMZUNBbFVB?=
 =?utf-8?B?WjZobjFhM2VDMjhNU29DT3ArMndFY280TllLcURURWRPbVBoU2tqK0ozSjVv?=
 =?utf-8?B?cmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7dfa44e-2558-4e52-269e-08dd65b4bf2c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 00:35:13.4606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jBVz8egw/3gCriDNFANeEXnRilk5bfHRkaE8EnYJuGpEJgzBgsaywmHmdVKlWaGWWLvcWerKGz4saL0BWKqa1X1r5QxUECfpRBFtEEo3ng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8253
X-Proofpoint-ORIG-GUID: KrulxgnAfukiM8CDkwwpqc2O5BFiooPZ
X-Authority-Analysis: v=2.4 cv=ROOzH5i+ c=1 sm=1 tr=0 ts=67d8bfc5 cx=c_pps a=SX8rmsjRxG1z7ITso5uGAQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=J85HRaW5Anwn4s3s-XcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8 a=io179-_ENtLLCYE6_mcA:9 a=toN47tfCSwFIZ2pC:21 a=_W_S_7VecoQA:10 a=zY0JdQc1-4EAyPf5TuXT:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: I5DYr3SnQ4-iErHVIEaXMH7iuVZo0caO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_10,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503180002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 00:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213130

--------------Y04bjeO0g9uX0wFqmRjsOpJB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52I0ANje030226

On 2025-03-14 11:50 a.m., Yash Shinde wrote:
>
>
> On 14-03-2025 19:18, Randy MacLeod wrote:

...


>> Thanks Yash!
>>
>> It's a bit odd that you see an 8G diff and YP AB saw 5 GB but that's=20
>> close enough for now.
>>
>> Please run the same analysis for 1.84 update both before and after=20
>> removing the src/gcc .
>>
>> Please summarize the data for 1.82, 1.83 and the two sets of data for=20
>> 1.84.
>>
>> I'd expect 1.84 + "rm -rf src/gcc" to be somewhat larger than 1.82=20
>> but much smaller than 1.83.
>>
> TMDIR FS usage =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0 v1.82.0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 v1.83.=
0=20
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0 v1.84.0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 v1=
.84 + rm -rf src/gcc
> du -sh poky/build/tmp/ =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 65 G=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=
=A0 73=20
> G =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 73 G 72 G
>
What steps did you take (bitbake rust-native ? ) before comparing these=20
tmp dir trees?

So what made the 1.82.0 and either 1.83.0 or 1.84.0 differ in size so=20
significantly? See below for my approach for the src tree.
Hopefully you can do something similar or better for the build/tmp dir=20
that's a ~8 GB diff from 1.82 to 1.84.
And still 7 GB after rm -rf src/gcc. Please read the rest of this email=20
and send the update if it's ready before
spending time on the analysis of the size difference.

> du -sh=C2=A0 poky/build/../1.8x.0/rustc-1.8x.0-src/ 9.8=20
> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 12 G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12=20
> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11 G
>
> The size of TMPDIR increased from 65 G in 1.82 to 73 G in 1.83 and=20
> remained same in 1.84.
> After removing "src/gcc"(1.1 G) the size is reduced to 72G.
>
And the build and test worked well, I assume.

If so please send the update with the rm -rf src/gcc .



I took a look at the source tree differences a little.
I tried using ncdu and meld but they aren't really the right tool.

I ended up doing the following:

Unpack two tarballs then mkdir du

=E2=9D=AF=C2=A0 du -sk rustc-1.82.0-src/* | sort -n > du/du-1.82-top

=E2=9D=AF=C2=A0 du -sk rustc-1.84.0-src/* | sort -n > du/du-1.84-top

# manually edit line order


*=E2=9D=AF* sdiff du/du-1.8*-top
4	rustc-1.82.0-src/Cargo.toml			      |	4	rustc-1.84.0-src/Cargo.toml
4	rustc-1.82.0-src/configure			      |	4	rustc-1.84.0-src/configure
4	rustc-1.82.0-src/CONTRIBUTING.md		      |	4	rustc-1.84.0-src/CONTRIBUTI=
NG.md
4	rustc-1.82.0-src/git-commit-hash		      |	4	rustc-1.84.0-src/git-commit=
-hash
4	rustc-1.82.0-src/git-commit-info		      |	4	rustc-1.84.0-src/git-commit=
-info
4	rustc-1.82.0-src/LICENSE-MIT			      |	4	rustc-1.84.0-src/LICENSE-MIT
4	rustc-1.82.0-src/README.md			      |	4	rustc-1.84.0-src/README.md
4	rustc-1.82.0-src/version			      |	4	rustc-1.84.0-src/version
4	rustc-1.82.0-src/x.py				      |	4	rustc-1.84.0-src/x.py
12	rustc-1.82.0-src/LICENSE-APACHE			      |	12	rustc-1.84.0-src/LICENSE-=
APACHE
24	rustc-1.82.0-src/COPYRIGHT			      |	24	rustc-1.84.0-src/COPYRIGHT
40	rustc-1.82.0-src/config.example.toml		      |	44	rustc-1.84.0-src/conf=
ig.example.toml
140	rustc-1.82.0-src/Cargo.lock			      |	140	rustc-1.84.0-src/Cargo.lock
736	rustc-1.82.0-src/RELEASES.md			      |	768	rustc-1.84.0-src/RELEASES.=
md
36364	rustc-1.82.0-src/compiler			      |	37124	rustc-1.84.0-src/compiler
43928	rustc-1.82.0-src/library			      |	44484	rustc-1.84.0-src/library
165588	rustc-1.82.0-src/tests				      |	169872	rustc-1.84.0-src/tests
1379288	rustc-1.82.0-src/src				      |	2889512	rustc-1.84.0-src/src
1975056	rustc-1.82.0-src/vendor				      |	1926968	rustc-1.84.0-src/vendo=
r

Since I'm always asking for you to do the math, I got chatgtp to do mine=20
for me:

|+4 config.example.toml +32 RELEASES.md +760 compiler +556 library +4284=20
tests +1510224 src -48088 vendor|

Positive numbers indicate an increase in size, while the negative number=20
for |vendor| indicates a decrease.


# Similarly for src and vendor subdirs:

=E2=9D=AF=C2=A0 du -sk rustc-1.84.0-src/src/* | sort -n > du/du-1.84-src
...


sdiff du/du-1.8*-src
4	rustc-1.82.0-src/src/README.md			      |	4	rustc-1.84.0-src/src/README.=
md
4	rustc-1.82.0-src/src/version			      |	4	rustc-1.84.0-src/src/version
44	rustc-1.82.0-src/src/stage0			      |	44	rustc-1.84.0-src/src/stage0
							      |	56	rustc-1.84.0-src/src/build_helper
							      |	56	rustc-1.84.0-src/src/rustc-std-workspace
60	rustc-1.82.0-src/src/rustdoc-json-types		      |	64	rustc-1.84.0-src/s=
rc/rustdoc-json-types
1208	rustc-1.82.0-src/src/ci				      |	1220	rustc-1.84.0-src/src/ci
1408	rustc-1.82.0-src/src/bootstrap			      |	1468	rustc-1.84.0-src/src/b=
ootstrap
2348	rustc-1.82.0-src/src/etc			      |	2344	rustc-1.84.0-src/src/etc
3368	rustc-1.82.0-src/src/librustdoc			      |	3456	rustc-1.84.0-src/src/=
librustdoc
42096	rustc-1.82.0-src/src/doc			      |	43048	rustc-1.84.0-src/src/doc
290368	rustc-1.82.0-src/src/tools			      |	693384	rustc-1.84.0-src/src/t=
ools
1038376	rustc-1.82.0-src/src/llvm-project		      |	1038408	rustc-1.84.0-s=
rc/src/llvm-project
							      >	1105952	rustc-1.84.0-src/src/gcc


the major difference is the src dir.

|+56 build_helper +56 rustc-std-workspace +4 rustdoc-json-types +12 ci=20
+60 bootstrap -4 etc +88 librustdoc +952 doc +403016 tools +32=20
llvm-project +1105952 gcc |

Vendor dir is harder to compare since there are so many files and the num=
ber of files has changed:

=E2=9C=A6 =E2=9D=AF wc -l du/du-1.82-vendor du/du-1.84-vendor
   1511 du/du-1.82-vendor
   1530 du/du-1.84-vendor


The total size changed from 1975056 to 1926968 - a decrease, so that's no=
t worth looking into.

../Randy



> Thanks,
> Yash.
>
>>
>> ../Randy
>>
>>
>>>
>>> The main reason for FS usuage differences in v1.83 are:
>>> 1. Addition of gcc  ~1.1 G.2. The addition of enzyme AD sub module ~3=
92 Mb.
>>>
>>> References:
>>> https://github.com/rust-lang/rust/commit/9028177115718b38c0a189c4fb9e=
da03a14841d7
>>> https://github.com/rust-lang/rust/issues/124509
>>> https://github.com/rust-lang/rust/pull/129175=20
>>> https://github.com/rust-lang/rust/commit/59d4114b2d1aaac9a6dfe770997f=
2e79ccfd28ab
>>>
>>>
>>> Dir
>>> 	1.82.0
>>> 	1.83.0
>>> 	Diff
>>> rustc-1.8x.0-src.tar.xz
>>> 	210Mb
>>> 	338Mb
>>> 	128Mb
>>> rustc-1.8x.0-src
>>> 	3.5G
>>> 	4.8G
>>> 	1.3G
>>>
>>> (PS: Please ignore the previous mail.)
>>>
>>> Regards,
>>> Yash
>>>>
>>>>
>>>> ../Randy
>>>>
>>>>
>>>>
>>>>
>>>>>
>>>>> Cheers,
>>>>>
>>>>> Richard
>>>>>
>>>>>
>>>>
>>>> --=20
>>>> # Randy MacLeod
>>>> # Wind River Linux
>>
>>
>> --=20
>> # Randy MacLeod
>> # Wind River Linux
> --=20
> Regards,
> Yash Shinde


--=20
# Randy MacLeod
# Wind River Linux

--------------Y04bjeO0g9uX0wFqmRjsOpJB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52I0ANje030226

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-03-14 11:50 a.m., Yash Shinde
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:aa6b3d4c-bf6b-41b2-98e4-0ff854c=
5fc8d@windriver.com">
     =20
      <p><br>
      </p>
      <div class=3D"moz-cite-prefix">On 14-03-2025 19:18, Randy MacLeod
        wrote:<br>
      </div>
    </blockquote>
    <p>...</p>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:aa6b3d4c-bf6b-41b2-98e4-0ff854c=
5fc8d@windriver.com">
      <blockquote type=3D"cite" cite=3D"mid:70820f45-41b1-487b-ac53-1e49e=
f57fd5f@windriver.com">
        <p>Thanks Yash!</p>
        <p>It's a bit odd that you see an 8G diff and YP AB saw 5 GB but
          that's close enough for now.</p>
        <p>Please run the same analysis for 1.84 update both before and
          after removing the src/gcc .</p>
        <p> Please summarize the data for 1.82, 1.83 and the two sets of
          data for 1.84.<br>
          <br>
          I'd expect 1.84 + &quot;rm -rf src/gcc&quot; to be somewhat lar=
ger than
          1.82 but much smaller than 1.83.<br>
        </p>
      </blockquote>
      <p>TMDIR FS usage&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;=
&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;=
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&n=
bsp; v1.82.0&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbs=
p;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; v1.83.0&nbsp;=
&nbsp; &nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&n=
bsp;&nbsp; &nbsp;&nbsp; v1.84.0&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbs=
p;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&=
nbsp; v1.84 + rm
        -rf src/gcc<br>
        du -sh poky/build/tmp/&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp=
; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp=
;&nbsp;
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 65 G&nbsp;&nbsp=
; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 73 G&nbsp;&=
nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; 73 G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        72 G<br>
      </p>
    </blockquote>
    <p>What steps did you take (bitbake rust-native ? ) before comparing
      these tmp dir trees?<br>
    </p>
    <p>So what made the 1.82.0 and either 1.83.0 or 1.84.0 differ in
      size so significantly? See below for my approach for the src tree.<=
br>
      Hopefully you can do something similar or better for the build/tmp
      dir that's a ~8 GB diff from 1.82 to 1.84. <br>
      And still 7 GB after rm -rf src/gcc. Please read the rest of this
      email and send the update if it's ready before<br>
      spending time on the analysis of the size difference.<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:aa6b3d4c-bf6b-41b2-98e4-0ff854c=
5fc8d@windriver.com">
      <p> </p>
      <p>du -sh&nbsp; poky/build/../1.8x.0/rustc-1.8x.0-src/&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        9.8 G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12
        G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12
        G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11 G<br>
        <br>
        The size of TMPDIR increased from 65 G in 1.82 to 73 G in 1.83
        and remained same in 1.84.<br>
        After removing &quot;src/gcc&quot;(1.1 G) the size is reduced to =
72G.<br>
      </p>
    </blockquote>
    <p>And the build and test worked well, I assume.</p>
    <p>If so please send the update with the rm -rf src/gcc .</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>I took a look at the source tree differences a little.<br>
      I tried using ncdu and meld but they aren't really the right tool.<=
br>
    </p>
    <p>I ended up doing the following:<br>
    </p>
    <p>Unpack two tarballs then mkdir du</p>
    <p>=E2=9D=AF&nbsp; du -sk rustc-1.82.0-src/* | sort -n &gt; du/du-1.8=
2-top<br>
    </p>
    <p>=E2=9D=AF&nbsp; du -sk rustc-1.84.0-src/* | sort -n &gt; du/du-1.8=
4-top</p>
    <p># manually edit line order</p>
    <p><br>
    </p>
    <pre><font color=3D"#CC0000"><b>=E2=9D=AF</b></font> sdiff du/du-1.8*=
-top
4	rustc-1.82.0-src/Cargo.toml			      |	4	rustc-1.84.0-src/Cargo.toml
4	rustc-1.82.0-src/configure			      |	4	rustc-1.84.0-src/configure
4	rustc-1.82.0-src/CONTRIBUTING.md		      |	4	rustc-1.84.0-src/CONTRIBUTI=
NG.md
4	rustc-1.82.0-src/git-commit-hash		      |	4	rustc-1.84.0-src/git-commit=
-hash
4	rustc-1.82.0-src/git-commit-info		      |	4	rustc-1.84.0-src/git-commit=
-info
4	rustc-1.82.0-src/LICENSE-MIT			      |	4	rustc-1.84.0-src/LICENSE-MIT
4	rustc-1.82.0-src/README.md			      |	4	rustc-1.84.0-src/README.md
4	rustc-1.82.0-src/version			      |	4	rustc-1.84.0-src/version
4	rustc-1.82.0-src/x.py				      |	4	rustc-1.84.0-src/x.py
12	rustc-1.82.0-src/LICENSE-APACHE			      |	12	rustc-1.84.0-src/LICENSE-=
APACHE
24	rustc-1.82.0-src/COPYRIGHT			      |	24	rustc-1.84.0-src/COPYRIGHT
40	rustc-1.82.0-src/config.example.toml		      |	44	rustc-1.84.0-src/conf=
ig.example.toml
140	rustc-1.82.0-src/Cargo.lock			      |	140	rustc-1.84.0-src/Cargo.lock
736	rustc-1.82.0-src/RELEASES.md			      |	768	rustc-1.84.0-src/RELEASES.=
md
36364	rustc-1.82.0-src/compiler			      |	37124	rustc-1.84.0-src/compiler
43928	rustc-1.82.0-src/library			      |	44484	rustc-1.84.0-src/library
165588	rustc-1.82.0-src/tests				      |	169872	rustc-1.84.0-src/tests
1379288	rustc-1.82.0-src/src				      |	2889512	rustc-1.84.0-src/src
1975056	rustc-1.82.0-src/vendor				      |	1926968	rustc-1.84.0-src/vendo=
r
</pre>
    <p></p>
    <p>Since I'm always asking for you to do the math, I got chatgtp to
      do mine for me:<br>
    </p>
    <pre class=3D"!overflow-visible" data-start=3D"48" data-end=3D"176"><=
code class=3D"!whitespace-pre"><span><span><span class=3D"hljs-addition">=
+4	config.example.toml  </span></span><span>
</span><span><span class=3D"hljs-addition">+32	RELEASES.md  </span></span=
><span>
</span><span><span class=3D"hljs-addition">+760	compiler  </span></span><=
span>
</span><span><span class=3D"hljs-addition">+556	library  </span></span><s=
pan>
</span><span><span class=3D"hljs-addition">+4284	tests  </span></span><sp=
an>
</span><span><span class=3D"hljs-addition">+1510224	src  </span></span><s=
pan>
</span><span><span class=3D"hljs-deletion">-48088	vendor</span></span></s=
pan></code></pre>
    <p>Positive numbers indicate an increase in size, while the negative
      number for <code data-start=3D"255" data-end=3D"263">vendor</code>
      indicates a decrease.</p>
    <p><br>
    </p>
    <p># Similarly for src and vendor subdirs:<br>
    </p>
    <p>=E2=9D=AF&nbsp; du -sk rustc-1.84.0-src/src/* | sort -n &gt; du/du=
-1.84-src<br>
      ...</p>
    <p><br>
    </p>
    <pre>sdiff du/du-1.8*-src
4	rustc-1.82.0-src/src/README.md			      |	4	rustc-1.84.0-src/src/README.=
md
4	rustc-1.82.0-src/src/version			      |	4	rustc-1.84.0-src/src/version
44	rustc-1.82.0-src/src/stage0			      |	44	rustc-1.84.0-src/src/stage0
							      |	56	rustc-1.84.0-src/src/build_helper
							      |	56	rustc-1.84.0-src/src/rustc-std-workspace
60	rustc-1.82.0-src/src/rustdoc-json-types		      |	64	rustc-1.84.0-src/s=
rc/rustdoc-json-types
1208	rustc-1.82.0-src/src/ci				      |	1220	rustc-1.84.0-src/src/ci
1408	rustc-1.82.0-src/src/bootstrap			      |	1468	rustc-1.84.0-src/src/b=
ootstrap
2348	rustc-1.82.0-src/src/etc			      |	2344	rustc-1.84.0-src/src/etc
3368	rustc-1.82.0-src/src/librustdoc			      |	3456	rustc-1.84.0-src/src/=
librustdoc
42096	rustc-1.82.0-src/src/doc			      |	43048	rustc-1.84.0-src/src/doc
290368	rustc-1.82.0-src/src/tools			      |	693384	rustc-1.84.0-src/src/t=
ools
1038376	rustc-1.82.0-src/src/llvm-project		      |	1038408	rustc-1.84.0-s=
rc/src/llvm-project
							      &gt;	1105952	rustc-1.84.0-src/src/gcc


the major difference is the src dir.

<code class=3D"!whitespace-pre"><span><span><span class=3D"hljs-addition"=
>+56	build_helper  </span></span><span>
</span><span><span class=3D"hljs-addition">+56	rustc-std-workspace  </spa=
n></span><span>
</span><span><span class=3D"hljs-addition">+4	rustdoc-json-types  </span>=
</span><span>
</span><span><span class=3D"hljs-addition">+12	ci  </span></span><span>
</span><span><span class=3D"hljs-addition">+60	bootstrap  </span></span><=
span>
</span><span><span class=3D"hljs-deletion">-4	etc  </span></span><span>
</span><span><span class=3D"hljs-addition">+88	librustdoc  </span></span>=
<span>
</span><span><span class=3D"hljs-addition">+952	doc  </span></span><span>
</span><span><span class=3D"hljs-addition">+403016	tools  </span></span><=
span>
</span><span><span class=3D"hljs-addition">+32	llvm-project  </span></spa=
n><span>
</span><span><span class=3D"hljs-addition">+1105952	gcc  </span></span></=
span></code>

Vendor dir is harder to compare since there are so many files and the num=
ber of files has changed:

=E2=9C=A6 =E2=9D=AF wc -l du/du-1.82-vendor du/du-1.84-vendor=20
  1511 du/du-1.82-vendor
  1530 du/du-1.84-vendor


The total size changed from 1975056 to 1926968 - a decrease, so that's no=
t worth looking into.

../Randy



</pre>
    <p></p>
    <blockquote type=3D"cite" cite=3D"mid:aa6b3d4c-bf6b-41b2-98e4-0ff854c=
5fc8d@windriver.com">
      <p> </p>
      <p>Thanks,<br>
        Yash.</p>
      <blockquote type=3D"cite" cite=3D"mid:70820f45-41b1-487b-ac53-1e49e=
f57fd5f@windriver.com"><br>
        <p>../Randy</p>
        <p><br>
        </p>
        <blockquote type=3D"cite" cite=3D"mid:a82ea56c-dc36-4784-a6cd-33d=
97014bdbe@windriver.com">
          <p><br>
          </p>
          <pre>The main reason for FS usuage differences in v1.83 are:
1. Addition of gcc  ~1.1 G.2. The addition of enzyme AD sub module ~392 M=
b.

References:
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/commit/9028177115718b38c0a189c4fb9eda03a14841d7">https://github.com/r=
ust-lang/rust/commit/9028177115718b38c0a189c4fb9eda03a14841d7</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/issues/124509">https://github.com/rust-lang/rust/issues/124509</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/pull/129175">https://github.com/rust-lang/rust/pull/129175</a>=20
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/commit/59d4114b2d1aaac9a6dfe770997f2e79ccfd28ab">https://github.com/r=
ust-lang/rust/commit/59d4114b2d1aaac9a6dfe770997f2e79ccfd28ab</a></pre>
          <p><br>
          </p>
          <p> </p>
          <table cellpadding=3D"2" cellspacing=3D"2" border=3D"2" width=3D=
"714" height=3D"118">
            <tbody>
              <tr>
                <td valign=3D"top" align=3D"center">Dir<br>
                </td>
                <td valign=3D"top" align=3D"center">1.82.0<br>
                </td>
                <td valign=3D"top" align=3D"center">1.83.0<br>
                </td>
                <td valign=3D"top" align=3D"center">Diff <br>
                </td>
              </tr>
              <tr>
                <td valign=3D"top" align=3D"center">rustc-1.8x.0-src.tar.=
xz<br>
                </td>
                <td valign=3D"top" align=3D"center">210Mb<br>
                </td>
                <td valign=3D"top" align=3D"center">338Mb<br>
                </td>
                <td valign=3D"top" align=3D"center">128Mb<br>
                </td>
              </tr>
              <tr>
                <td valign=3D"top" align=3D"center">rustc-1.8x.0-src<br>
                </td>
                <td valign=3D"top" align=3D"center">3.5G<br>
                </td>
                <td valign=3D"top" align=3D"center">4.8G<br>
                </td>
                <td valign=3D"top" align=3D"center">1.3G<br>
                </td>
              </tr>
            </tbody>
          </table>
          <pre>(PS: Please ignore the previous mail.)
</pre>
          <br>
          Regards,<br>
          Yash<br>
          <blockquote type=3D"cite" cite=3D"mid:03997060-1f1c-4784-af57-b=
b83b0514ebb@windriver.com">
            <p><br>
            </p>
            <p>../Randy</p>
            <p><br>
            </p>
            <p><br>
            </p>
            <p><br>
            </p>
            <blockquote type=3D"cite" cite=3D"mid:5d748ede629df75d0ed30df=
5418b42b936d5416b.camel@linuxfoundation.org">
              <div><br>
              </div>
              <div>Cheers,</div>
              <div><br>
              </div>
              <div>Richard</div>
              <div><br>
              </div>
              <div><span><br>
                </span></div>
            </blockquote>
            <p><br>
            </p>
            <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
          </blockquote>
        </blockquote>
        <p><br>
        </p>
        <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
      </blockquote>
      <pre class=3D"moz-signature" cols=3D"72">--=20
Regards,
Yash Shinde</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------Y04bjeO0g9uX0wFqmRjsOpJB--

