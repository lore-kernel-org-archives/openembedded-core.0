Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B57E8FDB1
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 10:52:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41251.1767005539644497765
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 02:52:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=R2SZa1Ky;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5458eb3737=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BT9QRbi4032974
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 10:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=S8Z02FyX4+Ua6mw7zcQfn3VGNfm/AJioHZFwpGFGfKk=; b=
	R2SZa1KyVb+5MTadf/ibMAiFQEPCCNDmvdVL4Uxh4pxpHVn1ahS6ueSKHKYk/l3l
	+5+kAXaQgK8dfhIt8yeu+p7FfbB0GKD1RM1I8WBiPROMfeDetugP/i5XMr4NEAo4
	Z2aFc0Mc2SQ50Q61NWd7ngwaIWIVvodcuhvAuNdRVaNZFk3a60R5OFuSNbv4UnjI
	SLDYbA5WDy3/UaVlGVytGVRaAH6nvIrXPJO0f8DpTd2eVHZzGn95MulTdj1a4Vam
	NItrvtoodhQ8sdE4hTlwyOrW86EGTyAC93ke25tDzhVJUyfBJ+lq2kliImU1Pa1m
	YhaLZVJd8mxHs6R10CW+uQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011022.outbound.protection.outlook.com [40.93.194.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba4nxsn5u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 10:52:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i7NQI72irLcJ2vKLeu4lKcVuj3r3wsuRZJz/lbib8zqOod6bpiEQtKHLRVo9AuCAOKhQoTHRtN+jWunnBAnOX1BeB7zGlFJ+0qjhWiIbIkm79bri58B47Z/z81aQn1cn6U/umuYlmt+pK1FXu/SEyvizr6ctblg1UevYLUxRJIrmKYwVtvnNfb61yqTdlDswEWqaYZv1wDykKen609nwZYCmWwt92E8fAuGf1xBbIDzyNfJNY7q8EqgHs0O83EwEGDSyvqCh1jAmfC0mUeDwWcl0U3SJf0FwO6LxxGMyPFi3BVbiz0D7VCkxdMGoHfgTk8jsy/4J1Yo3qaiRWbT6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8Z02FyX4+Ua6mw7zcQfn3VGNfm/AJioHZFwpGFGfKk=;
 b=L0jryvWmR2VeXka/t9nz/tnnaj1oRHOQMlMDR+3h1Fh8fRhTp8XHJbbNKDSymeJPXV3ExUMfUKEd+bb7drmaoxsa9FTbjk4xbuSO/RJ3xH6HMEJPbS4Seh3rUJbEpKynTwKxGN+ywYOyXUSjtkmG7ORTUqYDyEWs9w2pMV4xEdSDtS3xEgf13rIEeAgcfiL53cQfZmJiSIgx50ebMujPkr8QZY833ZZdzFtJ6LuWE/H25doozlPNmrLWIlwUMpwqlotuipvVPYTVPWsglaHeiS9N6ZCsn8ZEr4H35Lr/cQ8XZjCYiG7fq3LXREMwF+pmah004nt3F0sTV2rJ6cMkxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MW4PR11MB6910.namprd11.prod.outlook.com (2603:10b6:303:225::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 10:52:15 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 10:52:15 +0000
Message-ID: <2d51fa16-5dd9-41b8-9acd-c1bfe7a26eb4@windriver.com>
Date: Mon, 29 Dec 2025 16:21:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] Enable rust support for linux kernel
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
References: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
 <CADkTA4MoSUEOqqoY08-8NS9TE1NSkbpJaAoYgSNDP0bE+6DJ9g@mail.gmail.com>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <CADkTA4MoSUEOqqoY08-8NS9TE1NSkbpJaAoYgSNDP0bE+6DJ9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0073.jpnprd01.prod.outlook.com
 (2603:1096:405:3::13) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MW4PR11MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: 13711897-376f-40ab-d4b2-08de46c8541e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d1FkaGIvU2x5YXI0bWE5R09Ibm1wajdvaGtNWXQ5R0xqRFUvbTdWbzA5eW1I?=
 =?utf-8?B?T3IzY3JHUW53bTJqSWE2UURmVHpQcWY5N2lUTXhScUlCK040bjZkNEp6aFRB?=
 =?utf-8?B?ZDFmMHRlOVJ0anpQSzVnRVhxZzkrUEF1Q3pSUHVkcU01NHdOUUxkMXROZ3Zq?=
 =?utf-8?B?VUt2Y3JUT1NCWE9GRXVoQk1nR3E5SFNLd21oWEhSYzIrYjN5ZUtSOTJUVTJJ?=
 =?utf-8?B?cW9NTzB4QkRjWUpmK2JqQVFocTJURk5pS08yaERVaDQ4UzVKZzNya1duMmMr?=
 =?utf-8?B?aUpoOGM3OG5WTDYvL1NWMVZnTTNRMFVQUnU3bHZrN3FEellBWnJoR3lDQjNr?=
 =?utf-8?B?UDViWEthNS92bndONHJSd1lOazJ0eEQ0QmhTZy9aNSt3eDJxUElSNnkwVlV0?=
 =?utf-8?B?UzA1NTNZc3RtdGFIRExZTFd0eVpLQXM0cVhHQTRQRFZheFRRa0VpTUxTYlkz?=
 =?utf-8?B?bGFlQ1Vqb3hMWEpyZzMrVVdjejlZZHV2Z20xNVU1R0I1L3JmZmRJSkE5UGVK?=
 =?utf-8?B?N3llL2JHTDBZZnM0RVNEaEpHeDlKK3l4ZkJ6eFoyOHRKRG1CVUhPYzhJcFd1?=
 =?utf-8?B?S1JTVkVqWldWV3FLWU1TYzFEQ1psRS93UkN6MUN2VmhiNHphbTVjVm5neHds?=
 =?utf-8?B?b1lmeEdEZkpvd2kwOWtPYVFkZk8xeFdUY0F1MGp1OUpKOXcvb1RtRDJpZjNZ?=
 =?utf-8?B?U3YxWERka1hkVytHMXZacXJXeE9zNFNkdmY3R2RSVjhxUWxzNUcyNUpkbkw1?=
 =?utf-8?B?ajY5TSs4cXU0NW9jaDRvd0pnc0l4dTdPSXNZblEvbVBPemlsSzAra2l2K0Fr?=
 =?utf-8?B?bDh4UjBHajR6cElvSm1sQldmVjUraHJCOXhDSW5aTm50YmRkTEUwenFOTUlT?=
 =?utf-8?B?WDdxMVhoSEFnYWJaUlMvbFl0KzR4amx6VndCa1BVS0dhQjBPY2l6czhRaWlS?=
 =?utf-8?B?WFljK295eVNYU0VmVXhlSE1YalVIRzI4RloraEFrZnpGTXJsYzBQc1lnV2h5?=
 =?utf-8?B?SWxadUVvWU5tZU9RcmhQeXEyRkFRN1Z2dXRVNW5FQUthN1pqZmlvQkMwUnNJ?=
 =?utf-8?B?bUVKZTFMU1VhVEJDTmNtRW1pNWVaSjlOTTY0ZHZUMHhIakI3dHU5OVJrK1Ew?=
 =?utf-8?B?TThvOXltVHRoN3dSU0pXTXBCWCtIelBya01NblYycEZXb1NoNENLRHdyTFlz?=
 =?utf-8?B?bk1qQWtNNmdnSjRPclhTVFdMVGFUU09ub2NpeDBPeGw4cG4rZEhtVjJXaXRa?=
 =?utf-8?B?c1BWUXo2V1JucHRWK0Z6T3RJekRpblJrNGROZ3pLVEdXL09wN1R0bVF0MElj?=
 =?utf-8?B?NHB1K0dqckkvaEN3QnJreXM3VkswbWdvSThBdDZvaTI2OEZWd3UrWnhIZDRk?=
 =?utf-8?B?QjlITFJScDJJS0RpczMwV3plaFBkRUJHbitpZjRvY0FYeTZiSmVOeFU2cFNy?=
 =?utf-8?B?ZnJlWWlnZzFSNHdwTmt6Z29zc2hYZE8rbEFpK2lUeGR3QXZxNmx2cC92Wmt2?=
 =?utf-8?B?N0tNd0IyWmxkOUtVZU94T09ZRWJXb1AveWxLQk1CLzBUU3NxMlZmMms0cUY0?=
 =?utf-8?B?d01LeEtUNU9vQzR0bERaWWZxVzhYQVJUeE9URlhPRFpxYk1Tb2hYTmtoUHFh?=
 =?utf-8?B?Ulkzc3V5V25wRm5wY3NyVUNObDhJZWo1c1FGZFVCcFpkMjRFQlVUQ0pFRk9J?=
 =?utf-8?B?TVhEaHZIbXpmUDZWVGpjdksvNFB5YThERDdKNmYvZFcvVkFldzhwb0xZZlEv?=
 =?utf-8?B?bFdPc3QyN1VScVNUejE3Q1I0MVZaL25pTTVjU1dRbU9heFBORnkvWUxCUDEr?=
 =?utf-8?B?WlBrUklSa1NlQ2hUeE9JbHRDNnBJV1kxaWFxVk90d09NOWZRUmVUZHh0R0F3?=
 =?utf-8?B?RXNSUzZsUWROSEJLUlpKbXp5NGsrUWxFYlZqeXN1Rko4MmI3RnljUUQ1QnpQ?=
 =?utf-8?B?Z2Nodjh6b3BXZU9oK01vdjBOVThXVnIyY1NGa3QwMXQzeUgxSmZlS1JkbTM3?=
 =?utf-8?B?ckZyTWt4UW4vRmxDNWFzZHVubW5LUGlNVm9JcUFia21jVTZDSGJmK3BCT0ZX?=
 =?utf-8?B?VzJ4dzdVenVlUUdUTVNKVmFoTGlHWkc5Mkdudz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eHpxZTdkSU9VeEtFakw5M1A5Q0paaUNIU1czMzVuRWp4TXNTeGJKOU80RlNw?=
 =?utf-8?B?T25aRm9kem51TFF0ekNTREJZNEFXb2lTTTdSSC9qKzY3Nlo0ejV4ek1mUEU2?=
 =?utf-8?B?UVVxODNkeEgxbHRBbU1uUW9hdUlMcE5CKzJqQnJJeVE1bmJKZCtjUWVxblJS?=
 =?utf-8?B?NXJyM1JONURkTC95WTk2Z1UrUEtNdGwwbFMvZTJNdk52VzN6bmNwdjhzZDU0?=
 =?utf-8?B?U1MwZkpTTDZzY2N3TzBmTTVycGtTU1poWENObVVXWXJyNUs3WUVvYnZWYUtq?=
 =?utf-8?B?K2gzSHpEMmp0Zkh0b1Vtcys3WUJXeFpwbWlWWmUveEVUZVhKemkvZXBFcml3?=
 =?utf-8?B?dFlQYnAyUVFhNEF6RFl0MzlFU3hpK1pmdUhTNXQvb0NlVUJwZU5ob29JVVdK?=
 =?utf-8?B?a2Y2N0FKY291RFhZT2hIZ2VDZUEyOFZzUXdhNVRSV25Vcm9QcnAxUnluVkRQ?=
 =?utf-8?B?VU04cTljdkJVTHdwSWtwYkRHUk9nZkt5UGdSbjNPcVh2U3VWU2JYcktHTWVm?=
 =?utf-8?B?cHpNRUM3R3JyREJQaU5Jd0VuWi9VVXBVempvNDJpcjEwR1ZPNjBTdUcxRStT?=
 =?utf-8?B?NEtWWFpjbVN0c3U0UHNiQ3lDVXU5Nm9UeDBYb0k3aGlNVjJhbHJEOGJaQWR3?=
 =?utf-8?B?UThYZ0hkL2JSOXM0T1NUa0EzalBUQU5MMzY0eFJwMWx1R1NDMUFVSHdTV1Yr?=
 =?utf-8?B?T1l2eTYyU3V4b2Nwc0FBQ1VOV01acmh5YjdiQWIzUmNKdmZueU9CWnZ6bjdR?=
 =?utf-8?B?OEtzaGN0LytHS2JOWUwyNEp2RkZnSWh4Zm5DRXYvWkJ5Slc5SXVHeU1ZNzd4?=
 =?utf-8?B?MHFRYTFxRTI3dUVtZDlMSWlNYzMySldHNXpZODQ5bFE0cFdWeXRvQnBMcnhj?=
 =?utf-8?B?b0xEOUJhdXZ5T3JnTW5wT3Z1SEZ3Y3NkcFhiTzlVN2FNMXZ1TWtiQ2FsY24y?=
 =?utf-8?B?QlVYQTFjTU5MTXBPM3JRUW9OOTBHNi9DUTVFd3l3RWtFV29RaUNJNkJRK3RY?=
 =?utf-8?B?bzN2OHFTYlYrZnFmamRVeVMyOVFQcEgra1lZYTBKKzhoTTVENEJyTmVDUnlw?=
 =?utf-8?B?ZVJvNWViUFFicFU3Z01nMDQ1cGo0OVNPeS9DbEhYTTlZVk1lS21hbFBrSkly?=
 =?utf-8?B?VFROTGNLS2hDcEU1dlNoQnd4cmlDYWhNTGtCck5Kb1RCUzVGQWtoSTc5WHVu?=
 =?utf-8?B?cDFjMytQODRNYzJRZ0FBdXlNUGNncGhFam5rQUZpekRGOEdFM0hYcHNKa1ZN?=
 =?utf-8?B?L1dsbGlGRHNReDFBdytPT2dZS3pYeVhDa1ZjVUVaWTdoNUl5Wnc4UkgyR1Nh?=
 =?utf-8?B?Mm42ZU1EbUYwUFVsQjZhWlEwSGhqZVRiNVJzVjI3dFdreWs0enFyOVFrWlpz?=
 =?utf-8?B?VmNsM0NHMndWUlV4UmNQMTVGNXlQY2c5dnlGWXluclQrWS9jdldGYWtSb2xV?=
 =?utf-8?B?QjFIZncvTTdkWEJOTC80N0xLajVoVVJqdkNMREEycldhM29Ia05GYS9NS1Fq?=
 =?utf-8?B?cTFFaU9ZM3pNWlI2bS9TdWd1aFYxc3Z0QUlEbVZsbWFTVVVWc3FyK2ZENGhH?=
 =?utf-8?B?U1V5b0dqdGZWdHIwSDY2OWYxWEtuaDJqYi91TDV1NDZRaUxYSlhhVHY5cmV0?=
 =?utf-8?B?UnJ0cnM5RE1OWmxWbTU4TFJjMk9hNGRKdHVUSy9kZEtTOW8wRFhPZmhqZ1NF?=
 =?utf-8?B?YXA5US90bHNJeEFYaUwwQy90dno3V0VDYkoyL1Bac1FjOVJmZTVyOHoySEIx?=
 =?utf-8?B?M0l5dDNiL09wRFdpT1BBdksxaTdFY2tGcDF0eTA2ZUtPaFZmZnVxNkxSSUc5?=
 =?utf-8?B?bzh4RUxjZFN6a0tqNFh4SEFrNi9vRXVYOWJnTjEyU0NqbncyN2dMa0grd1ds?=
 =?utf-8?B?REpPNTVXV2NZOGJZRVVyOVhnSEJXTC8zRm5uaG01TlRHOHE4N2JCTG02Vjg0?=
 =?utf-8?B?UitPMTFTQzZqd20yMjZJWlBvRzZwS0tsaHNwSi9STkFVeGJMaHBRbzNFTXdX?=
 =?utf-8?B?QmlqV21Vbm9sQkNvR2NadHl4UUM0SGZyNzZxSzMvUjBvcVNvbVcwWVNYVUpY?=
 =?utf-8?B?WSsyemNNMzJ4dHdGQ205TVZvaXVoak9LSkJ5MW80bmJkcUpVUXpJYkhrNkJx?=
 =?utf-8?B?WEttYmNheTN4bjVTZjhVQVBjSjVJeG5KRDJLNHRTaUFweGNoNytqdFl4bElT?=
 =?utf-8?B?TDRNYU80QW9kNEtuL3RPdW9MYkpnSnBkeWYwSEl5S1YySWxzSGhkbHhrelhi?=
 =?utf-8?B?Q1FoNjFia2dSdnZISThBYkRVdERXYXl5SVQxNVVxalJCbDY2d3JNQ1dXcHdB?=
 =?utf-8?B?YUVTbDRGbzRic0UrNUluRFhvZ0NDSXB2ZzEvcTkyamg3SktYQ0tOa3l1RzJK?=
 =?utf-8?Q?D8eq3vC2EPt66H9A=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13711897-376f-40ab-d4b2-08de46c8541e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 10:52:15.4610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYR7yQvIpB/oKvp6ieqSguXm2/UOSv/58PpRTeA/45UluxqqXcnKCZQ4R73DnPFoKtHXopfhRPq/C3h88AzZawQyRrceJ8l6cNAxKSFp6D0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6910
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEwMSBTYWx0ZWRfX4Z0r0uZ5qRB2
 itjo+xXra/PysuHsytCuQU0yE86lLH/LVc+8Zj16dr9Y722SRZxmvjVEuCnSZPxkSZvMflR33cD
 1zhMJLUoP4i79T6vOYYipvrgqJ3Wiw/Ow4Wgq7bzBh3/6kW2qCjkbAT93kzgPc8873HARLgr4S0
 y1VQkzpuEevhyD/0J1qF30UCRkcsyWescLWhbtU6zivHxlmazLTBcTTLPoNbd9oAVbewyEvKndA
 /qBjxvfRHG7DN/+KzkwPLLPJP+/77Kec7pl/HHEdkynDjTIy3toTaT/nsyA6Xult8yfnO5E2NxB
 xQBLmTxbMUbNlT9EQS2YcT58usGSsmvsXZ6izhPM0634I81IKe8dQBxPCjJr8u5b/NDYzf9P8Wz
 5r+08A5BKh60b3SpAxRue7qWX5w+Kix1EsXrhkK8IgrQbwkb1D98Y0U/wWyo7M4Ji5Rp+JiQaE7
 tX7Lu1+ulPW/4PN+rWw==
X-Proofpoint-GUID: 24kkIEec7YTqEKQtJU2lFlbIlQeToJkL
X-Authority-Analysis: v=2.4 cv=OO0qHCaB c=1 sm=1 tr=0 ts=69525d62 cx=c_pps
 a=nhquEFRPp8Cuo1IKRjcF3Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=ktMQgidfe3c9mytpCMkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: dU_o0rozg7rfW2iKx55wGR6kGzk4ohkQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_03,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290101
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BT9QRbi4032974
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 10:52:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228594


On 12/27/2025 8:29 PM, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Sat, Dec 27, 2025 at 7:33=E2=80=AFAM <Harish.Sadineni@windriver.com>=
 wrote:
>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>
>> This patch series introduces Rust support into the linux-yocto kernel =
recipe
>> and related build infrastructure in the Yocto Project. The goal is to =
enable
>> building the Linux kernel with Rust components and provide support for=
 building
>> kernel module which is written in rust and also provide support to bui=
ld
>> rust kernel modules in sdk.
>>
>> And this series adds test for Linux Rust sample and also added support=
 for out-of-tree kernel
>> module written in Rust as well as associated test.
> What are the changes in this version compared to the last ?
>
> I didn't get a chance to look at the previous series in detail, but wil=
l look
> at this one. Knowing what was done in the different iterations is
> helpful in guiding what I look at.

The previous series was RFC v4, "Enable Rust support for Linux kernel"
(https://lists.openembedded.org/g/openembedded-core/message/226623).

In addition, Yoann Congal posted RFC v2, "Kernel Rust out-of-tree module=20
support"
(https://lists.openembedded.org/g/openembedded-core/message/227281),=20
which builds on top of RFC v4.

The current patch series is a unified version that combines both efforts.

Compared to the earlier series, the main changes are:

*Kernel configuration fragments have been moved to yocto-kernel-cache.

*The kernel fragments have been removed from SRC_URI and from the files=20
directory previously stored under recipes-kernel/linux/files.

*Updated the "[PATCH 11/16] selftest/cases/runtime_test: Add test for=20
Linux Rust sample" by appending KERNEL_EXTRA_FEATURES:append =3D '=20
features/kernel-sample/kernel-rust-sample.scc' instead of adding this=20
directly in the linux-yocto recipe.

Thanks,
Harish

>
> Bruce
>
>> Summary of patches:
>>
>> - Patch 01: Extend 'bindgen-cli' to support 'nativesdk', allowing it t=
o be available in the SDK environment.
>> - Patch 02: Add required dependencies ('clang-native', 'rust-native', =
'bindgen-cli-native') to the kernel to support Rust binding generation.
>> - Patch 03: Install the Rust standard library source ('library/') into=
 `work-shared` and which will be later copied to
>>             linux-yocto recipe-sysroot-native.
>> - Patch 04: Added 'rust-kernel' to DISTRO_FEATURES_FILTER_NATIVE and D=
ISTRO_FEATURES_FILTER_NATIVESDK, the 'rust-kernel' feature automatically
>>             propagates from target DISTRO_FEATURES to native/nativesdk=
 builds
>> - Patch 05: Stage the Rust sources into `recipe-sysroot-native` for ke=
rnel build compatibility, making them visible during native builds.
>> - Patch 06: Update `kernel-yocto.bbclass` to invoke `make rustavailabl=
e` during 'do_kernel_configme', ensuring Rust readiness.
>> - Patch 07: Add kernel configuration support for Rust (via 'kernel-rus=
t.scc'), enabling the Rust build options in kernel config.
>> - Patch 08: Fixed buildpaths errors when rust is enabled for kernel by=
 appending --remap-path-prefix to RUST_DEBUG_REMAP
>> - Patch 09: Disabling ccache when rust-kernel is enabled for linux-yoc=
to.
>> - Patch 10: Copy Rust kernel sources into kernel-devsrc build director=
y which will be required while running 'make prepare' in sdk.
>> - Patch 11: Added oe-selftest case for the Linux Rust sample.
>> - patch 12: Copying include/config/auto.conf in STAGING_KERNEL_BUILDDI=
R
>> - patch 13: Export artifacts needed for out-of-tree Rust compilation
>> - patch 14: Prepare out-of-tree rust module compilation
>> - patch 15: Added rust-out-of-tree-module recipe in meta-skeleton laye=
r
>> - patch 16: Added rust-out-of-tree selftest
>>
>> Patches have been build-tested successfully on:
>> - qemuarm64
>> - qemux86-64
>>
>> Benchmark test-result for x86-64:
>> +-------------------------------+------------+-----------+-----------+=
-----------+
>> | DISTRO_FEATURES               |   real     |   user    |    sys    |=
  FS usage |
>> +-------------------------------+------------+-----------+-----------+=
-----------+
>> | rust-kernel (enabled)         | 46m1.720s  | 0m28.864s | 0m3.696s  |=
   58 GB   |
>> | rust-kernel (disabled)        | 30m1.053s  | 0m20.091s | 0m2.748s  |=
   33 GB   |
>> +-------------------------------+------------+-----------+-----------+=
-----------+
>>
>> The increased in time & fs is due to kernel rust dependencies in
>> linux-yocto.
>>
>>
>> Harish Sadineni (9):
>>    bindgen-cli: extend BBCLASSEXTEND to include nativesdk
>>    linux-yocto: conditionally add clang/rust/bindgen-cli-native to
>>      DEPENDS
>>    rust: install Rust library sources for 'make rustavailable' support
>>    bitbake.conf: Include "rust-kernel" in native/nativesdk feature
>>      filters
>>    kernel-yocto: stage rustlib sources for linux-yocto 'make
>>      rustavailable' support
>>    kernel-yocto: add rust support via "make rustavailable" in
>>      do_kernel_configme
>>    linux-yocto: enable Rust support in kernel configuration
>>    kernel-yocto: Fix for buildpaths errors when rust is enabled for
>>      kernel
>>    kernel-devsrc: copying rust-kernel source to $kerneldir/build
>>
>> Yoann Congal (7):
>>    kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled
>>    selftest/cases/runtime_test: Add test for Linux Rust sample
>>    kernel.bbclass: Copy include/config/auto.conf in
>>      STAGING_KERNEL_BUILDDIR
>>    kernel.bbclass: Export artifacts needed for out-of-tree Rust
>>      compilation
>>    module.bbclass: Prepare out-of-tree rust module compilation
>>    meta-skeleton: Add rust-out-of-tree-module recipe
>>    runtime_test: Add rust-out-of-tree selftest
>>
>>   .../rust-out-of-tree-module_git.bb            | 18 ++++++++++
>>   meta/classes-recipe/kernel-yocto.bbclass      | 28 +++++++++++++++
>>   meta/classes-recipe/kernel.bbclass            | 19 ++++++++++
>>   meta/classes-recipe/module.bbclass            |  8 +++++
>>   meta/conf/bitbake.conf                        |  4 +--
>>   meta/lib/oeqa/selftest/cases/runtime_test.py  | 35 +++++++++++++++++=
++
>>   .../bindgen-cli/bindgen-cli_0.72.1.bb         |  2 +-
>>   meta/recipes-devtools/rust/rust_1.91.1.bb     | 17 +++++++++
>>   meta/recipes-kernel/linux/kernel-devsrc.bb    |  4 +++
>>   meta/recipes-kernel/linux/linux-yocto.inc     |  2 ++
>>   meta/recipes-kernel/linux/linux-yocto_6.16.bb |  1 +
>>   meta/recipes-kernel/linux/linux-yocto_6.18.bb |  1 +
>>   12 files changed, 136 insertions(+), 3 deletions(-)
>>   create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-mod=
ule/rust-out-of-tree-module_git.bb
>>
>> --
>> 2.49.0
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

