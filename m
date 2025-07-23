Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F799C83F27
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 02:11:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4819.1753236636182625790
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 19:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9299900d39=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56N0X3pr1299583
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 19:10:35 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqt1kfb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 19:10:35 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56N2AZbI1460264;
	Tue, 22 Jul 2025 19:10:35 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2075.outbound.protection.outlook.com [40.107.236.75])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqt1kf9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 19:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cF/xQ8E3Szz5asoakua49IcZ1reUxj0Z0B5uS1DKHqvUAuT5y8zoKU1xn0X1a2ShHjer/iepkqCqcybjWgl1xlUYtUAWome7VI0kmUkJbDgSWJsBmJykmlPmNvPm3dxbURp38Es7aJeOD6SEHihldFvwDhNPX1LEJjxPQtkkToqTFe48gk7y60gJMqs80XCiNAMTxoN6MLwRGC9sEN6VAvbYkwnMtNjYyFJGte8SCL4vSfZ3+JOykB4XnZ8iOxwnA2WZC+hHzGcXWTHfMkOjnJqYlM4aIl4CpAW3dt2eoYtg36xlolveTKo06nHskRRTrjkZoJ7XaB2n2l2fVUPJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ma7H0t4led2wVeWxvGTPtAlao5X9YwH0cUOqPW6KQq8=;
 b=G1n/I6dbE2qgfjgqCp1PISauiWiwYcHv6BuP0AkC1JFvFOlhwEyV6MqSVyfBnuXVjxeIXkttMf8muB704M1O+juwtQHT/1/S9ZNxsgaePFUOayUstWsD9i3E8mC7+8SvjdJesVWRkOfeAiq/ktsMY5MYUmZd+0nOMeiD/NZeq6jBMRe6aMNQpaLOxcmeZ11M7P5XW4RKm6VkxnizQtF9zEqykwBPJ2LSbz2/dfI780JQWHIvnxCJH7/rI3sxHgwZAEwyB+TATT6/TEQOrqjV2ER6TIH88FsktYj5XiQkPUmmJzwpMVS+iLiXk+orcoaxMSPOSuB7UuREBHp3w8zkfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by DS4PPF2EEA5C68E.namprd11.prod.outlook.com (2603:10b6:f:fc02::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Wed, 23 Jul
 2025 02:10:31 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::7ff0:a398:beba:1ce7]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::7ff0:a398:beba:1ce7%4]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 02:10:30 +0000
Message-ID: <1ae568be-00d1-4589-9ab0-887c05bae482@windriver.com>
Date: Wed, 23 Jul 2025 10:10:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/4] babeltrace2: Enable python plugins
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>,
        mingli.yu@eng.windriver.com, openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com
References: <20250720090010.3122861-1-mingli.yu@eng.windriver.com>
 <20250720090010.3122861-2-mingli.yu@eng.windriver.com>
 <1728b300-fcaf-4969-8ea8-b41735242764@bootlin.com>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <1728b300-fcaf-4969-8ea8-b41735242764@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SE2P216CA0083.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c6::16) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|DS4PPF2EEA5C68E:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c6cfae1-8899-4c56-594b-08ddc98e1921
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ekdRMlRadUo4VWhLYnNXbE41WDBtVGdkUTRORTc2MlY1R2xZZHU5RTN1cVlo?=
 =?utf-8?B?VGxYdHVxdHJpNTJuL2dvamRVSzFUbHZXcU9GbnZxOHhaMlNrNmRFQ1BTQmhp?=
 =?utf-8?B?VVlaNS8wZnZaL1IxekgvNFNTNWRYb00ybGVCU0pvaXBYVGxaSUMvSmdHVEFQ?=
 =?utf-8?B?VEpidTd6RjdZOE9ROFhIMExyRXZTeU9BKzVnbkN2OVdIM0ZJZ0l1UlRKSGFp?=
 =?utf-8?B?azVGaThnMC9qWTNUMXdwSGV4OVh1Z1IzZVBqRzV2Q3dQZllacEJkYUwwalk0?=
 =?utf-8?B?MWo5M3VyUHY1S2hQT01waS9qVXNObytqSDVKTGdSSGtsblVjOFR5T3cwR0tD?=
 =?utf-8?B?RWlGdHlzbll5WXlmc3I5YUwrMWR3WkcvcEtqbkFsYzFIejAvY0ZNckZ5TWtY?=
 =?utf-8?B?N0NKZWxSL1c1QSsxSWhtOXFEUHdlR3NuZ1ludHhVOU5oREhYSGh3SmQzdjJ4?=
 =?utf-8?B?YlhmSXhjSXcwMjJndHY1T0dtY3NCNEJnalNFNWhNVzl2N3h2VTFWSTFVRXBQ?=
 =?utf-8?B?YkFsNEt6NFh5WmVzUXR1SkpsdkRpSzNndlR0UzVtRUVKZ1VqK0JUeEJBSE12?=
 =?utf-8?B?citMU2JQWHpkNlI2V1B1bmV2VmExT0c0dnZhNmU4TXRKbVM1VGRGTnZPNTNE?=
 =?utf-8?B?N3ptKytiRjh3YVN3SXovK1BTMUtlRVZFdlR3TkdhMkFzdXYvNzBvVWwxWFpL?=
 =?utf-8?B?OXNjYkVna2plUGhvMWQ0TnlJdGpXaEg5MFd6NW1RUEo1U2hkNlZMc2phNk90?=
 =?utf-8?B?NmFtTTZ2ZFhHUDdrbWk0UktYaStoczIzQ1dXbzVocHhCeFJTUk1XVlJuVzIv?=
 =?utf-8?B?L29TLzBXQkRuWlZxUWpDWEpUTE9lWFJpeXR5RTlvNGdrSFBneHd4NitYTmI2?=
 =?utf-8?B?VEVqOFhwb2s3VGtMNVkrN05teW5KMlltRENTSE9Yc1ZxNy9HWVFjeWsvMmZ5?=
 =?utf-8?B?Q09EZXpBblZYN1RVSngwN2FGUjl6U0FEWFVnVG16Q2tYYUFGYmE4cnlVWFFj?=
 =?utf-8?B?TXFqa2FnOXIxZUVGUlZ5bmN0blpqZ3JSSTNYbEtZMitzVjZpb045cjBNb2lL?=
 =?utf-8?B?UGVZZ1lVU1QxMjRvSWQrUFcxMTkwYSt4L3BobmJiOUJleTV1WjYxNGZjdHR1?=
 =?utf-8?B?OXFaOFMzNjNSS0JoODFTRkJvU3V5MU14cFRJSXpNMDhrR0hIanhMeE5Xbllk?=
 =?utf-8?B?V1hQUmxobWdkYlBhdHhGZzZzMnRqcG9ZaDZ6YS90SzlPdHE0MVRNNFl4a3VV?=
 =?utf-8?B?eENCN3BGemtrMGswTWVoMjF3ekFHTjFFUmk0L05PRit4V2xJQy9tVHArZE5w?=
 =?utf-8?B?aHAzaTJ4RnRtb0J1d1NIT2x0LzhobVo2UEZ4eHJBd2NsTyt3VzBzVFlWdnN3?=
 =?utf-8?B?dDF4eHRWWTM4aUVDSVJFelpJWUdLSmExY2hIVVJldXE0L3k4ZlYrUFBkZXZB?=
 =?utf-8?B?cGdleTFZRWlwd2FabDJQbGsxNS9YRnZDdjhlWEZPZFdUWnR6VU16YllhemtQ?=
 =?utf-8?B?cU1RejBnRmtrNDF6ZW52WHRwNjdscVF4LzlTWkx6UDJ0SW9paDFoYTQwcXM3?=
 =?utf-8?B?bGlJL2VHTHE4LzFkamJndXRQSS9TcmEwZGQ3amhVVU9OVW8xd3lLeklLd3p3?=
 =?utf-8?B?c25VeG12b2E1U05xZmZMVUpGY0JRTzRqdVlzamF5c0hFd0x4eTdyNkJhN05G?=
 =?utf-8?B?TkdjVzZIMmtpOEJ2anYxSSswRmJ1LytueVBDL0JWRXNpT0JDaDB0cnRoNDdi?=
 =?utf-8?B?bnBXY2pWa2hUelFqSHRKbGR2TkF6a1BOMC93MkZiR0hwbllRZWZucEVlNXRK?=
 =?utf-8?Q?TAOAnFErR3toRMD5WvWR1K3A0iZNIPpPKMaxE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Wm81cTVoZGJMbW9ab29oMjkwYzVlbS9nQzBERldLcitKK0RFbFQ1aWwvUWVy?=
 =?utf-8?B?SVRtWnlSZktnQzRqVW5NaFluN1JOckFSR0FMa1BOVXgzcjlZOWk4bkVKV29p?=
 =?utf-8?B?Z01JNW1KOE9RYW1FQS9aZUtRdTF3RUd4RlkyblV5SU5JMmZXcE5sQlFYVzlH?=
 =?utf-8?B?aEoxaU00S1FsblJGUFp4ZlFkYU9LanhCWk9kUVVPb1JxOGNhd1oxV01OclFG?=
 =?utf-8?B?QW1pTHpOVDNzUlNqcURxTTJkMEpadWZEbHpRdlBoTnpJSnRESVpvRk03OUlS?=
 =?utf-8?B?K3FkMmxZT0I5eFNoaVFnaDhSUGpWRC9uV1ZCS1RiT2Z5ZnZLRXl5d01yeG9U?=
 =?utf-8?B?NUU1Ly8rZEQ4cHJLQ2tBZmJLQzlXaEk1dkRNWDZlZElYV3RyamlRQjA5cC9M?=
 =?utf-8?B?REw1UWV3MW1UYnl4Wll1azg5SnhJaFBpN2I3bFEyTlRrS1F3N3FBS3pucXl1?=
 =?utf-8?B?L2h5d0RyVTlUK1FHMDJKdTZHak9WM1cyb2t6WmNodWtaZE51bFZYTlNZNjk5?=
 =?utf-8?B?aDd6aWxMMVRmSTJaNnE5K25IWmdBdTZwSW91S3MzOEcyWnAwN1NtMHp6alEr?=
 =?utf-8?B?MlIwVXoyTEU4bnZ6RGNFWHpnSGpTbzlPTmV0NDV6dHR2SXpnclhHYUVaTEZl?=
 =?utf-8?B?ZjlVeXZBSVJtek0vWlJnb2pSQzVnczY3MnoxMWV0ZnBmbFBVMnV0NTVHbGNY?=
 =?utf-8?B?bDBaTyt2M256MjY2dzB5dmowM0lmQXlYdlk0QkQrdWFwV3ZaSG1oeGh6cnht?=
 =?utf-8?B?SDcvUUI5UXAwMEVjRWdwK2YyeE5XaE1ubGcwVkdmQTMvaHJYdm83R2pJVWVn?=
 =?utf-8?B?YlNuUDE2Nm9EVnJmWjBtaWJjUW5KN2VuYkRsa0Vka2Y4SVFva1NRbkFBM08r?=
 =?utf-8?B?S2FNaTJSZ0lHSTdxZTZ4YUJRZEtTdUlHMlVWMVI1bkVQbmpiNjgrTkxnWEZU?=
 =?utf-8?B?SnVQcWwvODhqbS9JajE2K1prRGJxRUtWQ1JKNmgwQThQQUV6U3BXVEdqQ2RL?=
 =?utf-8?B?ZGROOHFydkdrU0wwTFhRUHpUYkZwSGNSbUdTQ0l0UjdaRnJOdXdsdkVHOHUy?=
 =?utf-8?B?bUVncUV1M3g5QWI0QkhyNFhzVkpWaUZxMmRFVk5jQ01jaXRESXdqeTBIWmhU?=
 =?utf-8?B?Rk9QbWJNSjVNb0tWVy90SEZUNmVCY01yRHh3SjluODhNZFhON2hlK3RyRjRo?=
 =?utf-8?B?N0Q3LzUyQnNFb3lVY0EvcU9nZnBaME8vY01lbkNFMjUwenUwY0VNSTZtRDM2?=
 =?utf-8?B?clRkcnZOOVVmSmU4SmxWU1dUbjJ4QlA4amhFS1RSdStuRUorL016RjFLbzNn?=
 =?utf-8?B?b2VXNG9yUVRkc1o4dHR4WnY3OEJMSjFBUkxaSjZ4S0RpalBmVVlIZkZZYmRy?=
 =?utf-8?B?ekNkTXFtMDZienA2ZmNRR3RDQ1NGa1VnbFNmNkV4Q1BhQ0RWZzRodWI2UVUv?=
 =?utf-8?B?bkRIS3pHRUtibDJPdndEWVAxVllvT1M1QzJ3aWxpc0Qxek5DRjZsRGxUbVBi?=
 =?utf-8?B?MXBYRTZvVDJrVkRBY1M5d0YyNFNoc0NOeTc2Y21hNE90QXc4N2krTXZ2SnVj?=
 =?utf-8?B?RlR4aEczTXZ6UGRuOXZjRGI2T0Y4cmlOemR1YTJGWkw1N0pJM2dvbk1EYi9U?=
 =?utf-8?B?NXdZVlIvNExpbmkwdWVjT25aYUhYak8rTUZZcytnaWlqclYxb2xTcUZGZWY1?=
 =?utf-8?B?RTNlYS9OS09zNXpxT3phSEtrRVh4Q0xUMmZuOTdab3RYbUFESkd2NGtlKzlw?=
 =?utf-8?B?SVZKTWFONS9PcTQ2andZWmpHUjJzZ1FqcmpDK1pZeUh1eWxGUkpaZERZSGxX?=
 =?utf-8?B?bDZoMExuckRwTUJFVytvUFkxQnJLOVQwRjc2Q3E0dUx0b2xjaXpNNzRPRmxo?=
 =?utf-8?B?TExqM3ZJN2RvK1lYSXNWaFVqQnRkS0hUL1RkMXZGaHlXcjdZQ0ZXYm1RWnZE?=
 =?utf-8?B?T2pTUzBIaTRRZnVWa0dWZjdkZTVMaUVkSmlEZ1BWVkdtVkxadytLN3NlcXRB?=
 =?utf-8?B?VkU2b2d0M3RIWVEzeERQdXJPaGUvTGswWWNsUmtva0JuRytkTkRRaTBhOUwv?=
 =?utf-8?B?aVFsaWdGLzNYK1NhUGJvOFVOUGY1SnVsOE9aMGRGQzZIdmk1OEMrNlhxRExz?=
 =?utf-8?B?bHhEeVhqbDFIcXZGb2RHRkgycWRxMWdjNi9UMVJteDg1MkxKeHlvWW1GdFVG?=
 =?utf-8?B?RXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6cfae1-8899-4c56-594b-08ddc98e1921
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 02:10:30.5282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TgWkU/B1r8Up5reybQjprUIvBV67wEaoBQta5ZQ8KukX7sGAk/cU1kiUoM4w0fF82GGTKghbieuLW6ubOWIQkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2EEA5C68E
X-Proofpoint-ORIG-GUID: K5ebSSXghRtj4wlxYRWrbPfiI-Dz7vJk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAxNyBTYWx0ZWRfXxpW3UaxyH8XX
 XexbD1cWpYeLErEPRYWRkQvL4Y3T/eIMRDwrLIaLTctbdyM+9Wq7WE5DLHm6X4sJkaM8UScYFsS
 NtnjzxGXD45ygj2HuHnSGtxKC7TUE5/+KF8+Ek5BH1bGb/KLlb6fO47eC+Hoh++mJMfHBCEI0Z0
 Hl1neSRGRhQ8Z2np/Alj5HxrD2YoNBGw6IAGH2NQyK6ApnnM/Mw8r63KKNDuXHM+Dk3vP/XPu4a
 11BxJdCwel0Bo6Dw/U4E/P0nubh8521UmvR3Z7PNTIS/jPyto/6T6YdZ0Tbsaxaw15Gsokg0NAr
 HSDQ4+F9gyn1sUjaDeQ+XWlmJLd3hqN0Mf1L3TOVzbTPdOX/BfbkprLf3m1/Fyh/ProKcGsk2mI
 ENVwO775
X-Proofpoint-GUID: myUWiNvtMyblEzNTQnJvW7eZQU7afMSo
X-Authority-Analysis: v=2.4 cv=Z9/sHGRA c=1 sm=1 tr=0 ts=6880449b cx=c_pps
 a=o1GL6qPhpQKcewKYPH0org==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=a5LkSv8FAAAA:8 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=7d_E57ReAAAA:8 a=P-IC7800AAAA:8 a=YOZERUjlfa8-DLhrHooA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=E2cWBXyb0kjxxB1PlMdk:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=jhqOcbufqs7Y1TYCrUUU:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_04,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 56N0X3pr1299583
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 02:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220775



On 7/21/25 16:09, Joao Marcos Costa wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>=20
> Hello Mingli,
>=20
> On 7/20/25 11:00, Yu, Mingli via lists.openembedded.org wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> * The lttng-tools test fails as below as it needs bt2 module.
>> ERROR: ust/high-throughput/test_high_throughput_snapshot.py
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> Traceback (most recent call last):
>> =C2=A0=C2=A0 File=20
>> "/usr/lib/lttng-tools/ptest/tests/regression/./ust/high-throughput/tes=
t_high_throughput_snapshot.py", line 26, in <module>
>> =C2=A0=C2=A0=C2=A0=C2=A0 import bt2
>> ModuleNotFoundError: No module named 'bt2'
>>
>> Enable python plugins for babeltrace2 to provide the above support.
>>
>> * Add swig-native to DEPENDS to fix the below configure error.
>> =C2=A0 | configure: error: SWIG 2.0.0 or newer is required to build th=
e=20
>> python bindings
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>> =C2=A0 meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb | 6 +++---
>> =C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb=20
>> b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
>> index 8bab7f677a6..88f589eafbc 100644
>> --- a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
>> +++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
>> @@ -5,7 +5,7 @@ BUGTRACKER =3D "https://bugs.lttng.org/projects/babelt=
race"
>> =C2=A0 LICENSE =3D "MIT & GPL-2.0-only & LGPL-2.1-only & BSD-2-Clause =
&=20
>> BSD-4-Clause & GPL-3.0-or-later & CC-BY-SA-4.0 & PSF-2.0"
>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3Df6b015e4f388d6e78adb1b1f9a887d06"
>>
>> -DEPENDS =3D "glib-2.0 util-linux popt bison-native flex-native=20
>> virtual/libiconv"
>> +DEPENDS =3D "glib-2.0 util-linux popt bison-native flex-native=20
>> virtual/libiconv swig-native"
>>
>> =C2=A0 SRC_URI =3D=20
>> "git://git.efficios.com/babeltrace.git;branch=3Dstable-2.1;protocol=3D=
https;tag=3Dv${PV} \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://run-ptest \
>> @@ -19,13 +19,13 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>2(\.\d+)=
+)$"
>>
>> =C2=A0 inherit autotools pkgconfig ptest python3targetconfig
>>
>> -EXTRA_OECONF =3D "--disable-debug-info --disable-Werror"
>> +EXTRA_OECONF =3D "--disable-debug-info --disable-Werror=20
>> --enable-python-plugins --enable-python-bindings"
>>
>> =C2=A0 PACKAGECONFIG ??=3D "manpages"
>> =C2=A0 PACKAGECONFIG[manpages] =3D ", --disable-man-pages, asciidoc-na=
tive=20
>> xmlto-native"
>>
>> =C2=A0 FILES:${PN}-staticdev +=3D "${libdir}/babeltrace2/plugins/*.a"
>> -FILES:${PN} +=3D "${libdir}/babeltrace2/plugins/*.so"
>> +FILES:${PN} +=3D "${libdir}/babeltrace2/plugins/*.so=20
>> ${PYTHON_SITEPACKAGES_DIR}/*"
>>
>> =C2=A0 ASNEEDED =3D ""
>> =C2=A0 LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-ll=
d=20
>> ptest', '-fuse-ld=3Dbfd ', '', d)}"
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#220615):=20
>> https://lists.openembedded.org/g/openembedded-core/message/220615
>> Mute This Topic: https://lists.openembedded.org/mt/114249009/8026893
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=20
>> [joaomarcos.costa@bootlin.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>=20
> There are some ptest errors in the autobuilder:
> -
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/192=
3/steps/12/logs/stdio
> -
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/193=
1/steps/12/logs/stdio
>=20
> Could you please take a look?

I will look into this.

Could I access the ptest-runner.log such as=20
tmp/work/qemux86_64-poky-linux/core-image-ptest-babeltrace2/1.0/testimage=
/ptest_log.20250710153833/ptest-runner.log=20
corresponding to=20
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/1923/=
steps/12/logs/stdio?

Thanks,
Mingli

>=20
> Thanks!
>=20
> --=20
> Best regards,
> Jo=C3=A3o Marcos Costa

