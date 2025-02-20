Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB4BC021B2
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 21:11:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8198.1740085910901782343
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 13:11:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4146d021df=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K7wCGs030249
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 21:11:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00jawp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 21:11:49 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51KLBnV0001423;
	Thu, 20 Feb 2025 21:11:49 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00jawp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 21:11:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymUpwj5LdJp+8k5lpza6lsI763r5EcyPDwyg9lTF/MOcBYAow+2ec7KLer5mpZKiB8cYbjOFpEbL3YLhjd4ABnHjH6d8RzRCwdEhXUcRpbhMANuDL6ErGdjGbhDHAZ/70Lp+nYBj4cdNlXh8EJwOF4y4tK5lTYfRtr5Ce6AexTydEzq48/06WINA+Rh+J6EVkXEcyPzoHY4WcXCT5Zb3VQtk+TXBl3fed1/1bGVqoiZtwg85hAkIr7m5EPHa4K6A8d3qKwR4qSAzmHrE3w5eWWsVXjX14/mt7q7FcS7qsHuJaCM7Nw2Q1aEC8ZrQa7k0olHEgecOZBJKHLsa/6GIgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbGVwLHagw4sFzTgXPtIQhLDSU+5eqKOYjtoKwWk4Xo=;
 b=TRnBQpAQ6dNQHSd2J126Jh8ck8GPryWqlrVG4SqcJSgLXEClV+0KdX0GFqX/FjaH/hejI86u8OdqHX6akLk4YR6VnoDUB0xs9ahC8cJv2hS+sJKOAlegp+2cq9hBLt/u2VMHkEDJBUxbLXKZdLCVnTLCzs3roYutg/GgXhg0gIK2iM+sWG3GZJcyI2g1jPI9ldmPyA1RlwqCC/4nDCLBlrJ12+vrbY9AWPkN+2qvshmAfPnUKn6jjmLQn7YLjzYrnUX7fw3cj6iz0CzCfSSKvs7ewzsgeQ6HLJ+G+ilBCtye7xli37Xu6z9d8uWEw6xeJSdoSnDiE4p8537Y9B/tqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SJ0PR11MB5104.namprd11.prod.outlook.com (2603:10b6:a03:2db::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 21:11:45 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 21:11:45 +0000
Content-Type: multipart/alternative;
 boundary="------------imySstJutY78Ls1VgUuguMmB"
Message-ID: <4c6f452d-4dc1-41ca-bb21-2da530dcd755@windriver.com>
Date: Thu, 20 Feb 2025 16:11:42 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 1/3] go: Is anyone working on 1.24 now?
To: peter.marko@siemens.com, openembedded-core@lists.openembedded.org,
        Jose Quaresma <quaresma.jose@gmail.com>
References: <20250123184440.2431629-1-peter.marko@siemens.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250123184440.2431629-1-peter.marko@siemens.com>
X-ClientProxiedBy: BYAPR07CA0051.namprd07.prod.outlook.com
 (2603:10b6:a03:60::28) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SJ0PR11MB5104:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bf89aa8-2ba1-4f48-d1ae-08dd51f32e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L3YxWGUzUGdSMVpySGlJN0NKS1RqNjUzR0pyNUdFcmU5SUFUM0ZkNkRaTk5I?=
 =?utf-8?B?Z0NyNWR5ZUR0RDQ1S0dyZ0hTMlRaR3NsUU1MdlNDaUcrVmprYlRVYkNUdlJI?=
 =?utf-8?B?RWF1eGNhanlXRVNTNnExR1hhN21uUnV5dkJBeVRqcFhjZDkwbk96WCtsTGpL?=
 =?utf-8?B?QmlsZytISlQ3T1dnci9TMjlIeXFXQVdzUkZoNmhXRmtFcUo4MG5MNXoxT3Qz?=
 =?utf-8?B?V21aN0hIWUwzcldndHFDV2IwZ2hhOSszbkVHa2xxRmxLT3VBU3Nyd1RPMVJm?=
 =?utf-8?B?NytrelJpNTZFd1FvLzVqclZsa0NxU1laa2lyMFQ0SUlucnJiL2xNdFJWTFp1?=
 =?utf-8?B?c1U3N1BQbHhZZHppSGVwNlF0ZmpNTzBkK0R4c2IxcFRuK3hyUlIwd0dMbEMr?=
 =?utf-8?B?MnVtWkdEQUg3NnZ2c1l5ckNzd3VidUZIY0ZnU1FPM0ZPRW1DaUttaEU3T1A5?=
 =?utf-8?B?aWRRRFM5amJoaExRcnlMUzBYWGlLS3pCUjJVVTQwYTE5eVpzUFk2elozZ0ZG?=
 =?utf-8?B?akZoOVFlRTduOTZTVHVvNVFISndvUmhFekVsMnFZOG4vZWozbzhLaWIvSngy?=
 =?utf-8?B?YVY2d3htbzlKeUsrNnFrSTB4T2RBQXUvWlozQVZmaXlFUCtYRVB1NTVWM0FG?=
 =?utf-8?B?YVNmV1R0QmMrMWh3ZGlhUk1KcktqSUZnSFhxZitrQ0paNkhHQTh6aVovMHEz?=
 =?utf-8?B?b3o3VjR6a2hsTlg0cUtWUklaWUEzVjNsVjlWbklnNnJsY2x2ell2VVRyL1ZB?=
 =?utf-8?B?N2lkTVRyLzZWbG1wRC9tMXQ5aXJ2SDYvaEE0cVRCWjdFVmltYTJRSlBCcllv?=
 =?utf-8?B?cWl0cXR1Tng3TEtQUGV1RlJhdFR0VkZXRTlKSVJUeFAxZGpkaWxvNHBjZlMx?=
 =?utf-8?B?WU42ZERoM0toZFZMcEtNTk9yT3QxRjMvQUYxR25rZUUxc1Axa3B4ZU9zOGMz?=
 =?utf-8?B?WXdQeVo3dUtZb1FyVVZlYldkd3hYbWRTby80eVNjZXhONTRJSHY5eHk5SmUr?=
 =?utf-8?B?d2ZiUDdSdlVEdk1oaUViUWxUd0g1K2pQWk1rNHl4Mitxb2ZlK2VmRVlzcjB0?=
 =?utf-8?B?K3lmRk1nenBUaXA0NzVlM211OWZCcncybkV5aVE0ektQVmJYcDhpMm1UMXlH?=
 =?utf-8?B?YUhLTzh0dUZQODYvekYvYUlSNUlPT013RjR6bE1pMWVPcnVKbFMrVGdDR2VE?=
 =?utf-8?B?UU5ZbXZmQ25ibEFuYzcvZDEwcWoxL3F6Q0N2ZmM1NnVGckV2akh0aks4V1Jt?=
 =?utf-8?B?SzZndUpzMngwRzdXOWJyTEhqVUkzM1gvK3M3dXpzTnViQkxZdk43c2Z6Qk5h?=
 =?utf-8?B?dDloc1RGeCtDL1pZMWlURzgzM1d6N3FiWXNMS1FyMi94ZVltVnJmOExYT2VN?=
 =?utf-8?B?Z2pUaVhPUlIrMXVoak5COXlZS2NRWlRxWmJKZHFHTnozcG9Geko3eDhpWjBr?=
 =?utf-8?B?b0p1WjFLUnVWUmFLb3R2RmxBMWdNcU1kaGZ2WFhDNmQ4ZjU3UDVqYklRSk5Z?=
 =?utf-8?B?K0RTUHlPc1I1QU5BeElST3VaKzZzdmpQNUhGWDU5T1lRWnh6c2Z6c2xlZEtV?=
 =?utf-8?B?UThWSFN0SDBRbkE3bTBCRUJidy9mbzZnc0ZmaFEwNkUyWXdqb292OUdXUHEx?=
 =?utf-8?B?b1RRdnM3d1ZDSDdEQytQQlMwckJ5Q3VNSW1ySHpqbFk4WldmTUlVTzV1UXZ6?=
 =?utf-8?B?eFIzYmpKYmg0bk1wSGVuTmM4alpiOENkS3F0ZnFYdytYOGxlR1lySTBPZndX?=
 =?utf-8?B?a0d1eWRBZWdpSDNvYTEvTklPQ1BvQ0VLbVFaTU85NUJaUXhxbjUrNEg4MVdO?=
 =?utf-8?B?OUJaSTFaRU0rZ1kxdVJuUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Vlp3QlZWcFB3L2grMlM0WHdpNkJ5NUR0c1pRNXoxSWZ2cDZjRXdZSjViTWlz?=
 =?utf-8?B?aEFGNzJ4djc3bmFWVEUzRThGMW5TSDd5akRZK1NNRE45TThPUGphTHZMZUJU?=
 =?utf-8?B?cVdORWZhZHZYdjNVSk56d2t4STRCeDBVZWd6ZG9YL1dNaE9IdWVISnpJTG9X?=
 =?utf-8?B?UWZKQmNOeUNZbXlpMDFFQmpFZ3AyTnF4ZGRmMklWeU8wUkFoelo2cFFoZmlE?=
 =?utf-8?B?MEpUbGZFOE51SytRb216SlZidnl6Y2VEZzFLVXh2VFdjRUNKak1nMnFiTXE0?=
 =?utf-8?B?R1JoTk43cnd3SWZ0dVpkc2JDdlRadVlyZElQTFhTMjBNeWhIUWlKY3FSQWpL?=
 =?utf-8?B?cnpsZHdGc1VhRC9sc29OWE5XakQwL1dIWHVMeCthWTVkZnZIYyt0Skhibm9I?=
 =?utf-8?B?enBQUzZmczBVYzYxMFM2dENhZjNYbkFNUWFJTmtJcEJ4YVlHaXZoWmtsL3NQ?=
 =?utf-8?B?clhUT0NORDcxZmhTVjNmczlrRDhaT1p6SWUybGN5S3pJeWRZNUU1UVNGeXM0?=
 =?utf-8?B?dzZQNTNxdnRIVzNQMCtrWFZ6TTBFU0kwQUNNS3lRcjNKYVY5MGY2YUl2UUsx?=
 =?utf-8?B?dkF2Z0xYNWplK1ZNWnJPcDUwU0JTRWZxRE1sZmtza3dmVHArOVhGRjhIR2xV?=
 =?utf-8?B?dndMRy9qWGJXdnNxSUptcTlpYllNQjJlNUZGejIxSnBRYjMrNUhWLzFPYkJs?=
 =?utf-8?B?cjN0UmZhWEE2TlJCSVFObVFMN2VyeExBZkUyWFZJUytNclY1TnlLUEVTZXV3?=
 =?utf-8?B?Z3ZOSHJDSU5kMEFpbUNnVFVOWDZWcFJtSGwvN3VjY3NXeHg1a0hmTWNDNjVO?=
 =?utf-8?B?ZkUzK0ZxNG9tQ0R2SXdWMVplWnFHOVlUS1lHVlg0UzYwbTUwWjhWcVQyOTlM?=
 =?utf-8?B?QVZZeTFsR2R2Vkh0dmVLY3g4T0R5czA3SWtla3RuLzRjR3czVzhvVU5YNGdI?=
 =?utf-8?B?Qi9NWkljOE45L3FnMllSYXozaWFXZndRYjBvWHcwSjkwWHd4TlZldUhQV2xZ?=
 =?utf-8?B?NlZSeVB1OU5TL0tiaFo2MWlzSVQ3WUlTck9HU3RQaDdmZVhpTnhJNDNXelBu?=
 =?utf-8?B?ZEVkYkxIQ2lQRzc3QnQ2c2RxMHBxalZHTUF3MFUwRWhzOXdMeWdlSE5vZlBG?=
 =?utf-8?B?ZE5xTWFETlU5aGcxMVZjSUFCc0EwN3A3Q0xlWVhBL0V4TE5wK3ZYTk9jRWJS?=
 =?utf-8?B?N2hqOFk4bHl0MG9YWHh4WDM0OUwxZnFkLzlQY0ROd0w5aGVMejBXejVWMysx?=
 =?utf-8?B?dHpHeW1vWXk2NDc3QVFVZE5GT082alI4YTVTMWxFYmhjRkFDU0FZTGNqaXV6?=
 =?utf-8?B?dXdKb0hSZEpLZlRFUWFPcEJYZkNiZmdLcytNbFErMHZFM3RaQ2lTcjN1MGE1?=
 =?utf-8?B?VHJmSUdqK3V1K2YzYVhsbks5a1lFWnByR3JjSjVzbnR5alVtaWJFWHY2alQy?=
 =?utf-8?B?RHFNdllQRFpzODBMaUhJQS9zRVpISkNZUVY0Q0kxUVAyZi8zQjYxUjg2QUVW?=
 =?utf-8?B?bFlxWWloQlBHaHA3Wll3SXJFNWZJSkdHWUF3RC9qNUJVR25qQW1pS1gvbERT?=
 =?utf-8?B?bi84amRhM0hVMzFEclNHOFBaM0ZLeWhFc0t1VUhmUEVvZkJDbkMvb3dDYkFm?=
 =?utf-8?B?WFlBZ2hUYjlpQk5ldllrVHBOdWZzb1BFVGUxaGFrb3NyS0lNSGFtWlBTR0Iv?=
 =?utf-8?B?RWZLTzU5QkNDSjBLdGRJc2ZnTVJQRjQ5djFRdzdOUXhNMi9yTlkxSGRKVHcy?=
 =?utf-8?B?aHAvbU9FcFJ0TEdVN3FZaXcwZWluZ24zMTVPUTJVc2RIL1M4aWFVSXhhdWFy?=
 =?utf-8?B?akRPTWtyNnBhWVpEOXRQWndESkFYUGZxSjRUdk1GbDJGdlFLcW1ILzZtZ0xa?=
 =?utf-8?B?WkxodS9qamhUc1FHSWdWWU9HRXUvZWFacU1VZVowNDNDaHlrSGJXSHI5VHBH?=
 =?utf-8?B?Sng0WUhIWlpxRU5BcCtHVnBLR25oS1YxVm9QeC9acTN2cjcrUDEzMnhORVhr?=
 =?utf-8?B?b1lKMlVLY0t6M1pYUC9oQ2o0TjFtM1ViZkxHNHJrVEFmc1dVbFMrRXFyM3cw?=
 =?utf-8?B?bWxHQjVuZFh6WFNxR2d3cFR5T0dIelVkV1Z4MmhhM3VSQm9UMmx6Q2EwZ042?=
 =?utf-8?B?Ky9NWkdVL2w4UlVOaUJEZ04wQ1dtNmp4RUVpZElScmVFRVNWS3MycmxWNjVS?=
 =?utf-8?B?Tnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf89aa8-2ba1-4f48-d1ae-08dd51f32e1c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 21:11:45.0980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 37uUD0tvX/KvcrILziBX9gL4T1Ur+xxX6n/1sK4W4RwNN7VsVF/IyPt/01WIevlSXzKksoERp6zvCiqIA29nxkKKKPepf3hlSPMBvcrGNcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5104
X-Proofpoint-GUID: IqJ_zXT_3ttnhiA-qzmHOJg4Ts1p7irV
X-Authority-Analysis: v=2.4 cv=I4GfRMgg c=1 sm=1 tr=0 ts=67b79a95 cx=c_pps a=yneE0G6ieORTwLKR6pgPXw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=pM9yUfARAAAA:8 a=OcDgyCx2X_MzzS7p7jwA:9
 a=QEXdDO2ut3YA:10 a=WsoKRE7CIvaIDP_GYc0A:9 a=_W_S_7VecoQA:10 a=YH-7kEGJnRg4CV3apUU-:22
X-Proofpoint-ORIG-GUID: RC1PALhFLpA2qhr_DMcs0bE6iakZagSZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=896 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502200142
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 21:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211777

--------------imySstJutY78Ls1VgUuguMmB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Peter, Jose, anyone,

Does anyone already have a go-1.24 in the works for before the end of M3 
on March 3rd?

https://tip.golang.org/doc/go1.24

../Randy

--------------imySstJutY78Ls1VgUuguMmB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Peter, Jose, anyone,</p>
    <p>Does anyone already have a go-1.24 in the works for before the
      end of M3 on March 3rd?</p>
    <p>&nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://tip.golang.org/doc/go1.24">https://tip.golang.org/doc/go1.24</a><br>
      <br>
    </p>
    <p>../Randy<br>
    </p>
  </body>
</html>

--------------imySstJutY78Ls1VgUuguMmB--

