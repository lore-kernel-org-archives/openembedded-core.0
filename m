Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70866CCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 05:27:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5052.1761629216044389231
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 22:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Gq/3bceE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23964b911a=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S5O8Sp3792318
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 05:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=hgokf3+KFQeGhEUX2fVONTjIGdaUg+Jn9xCw1+jBx/Y=; b=
	Gq/3bceEJcWqAo7gvpwlRkNuM8J4Oryngraj+S58zGD4UluWkXeNYS8NM5+WIY5L
	o90H3T9XJOmO3J3EJjnQgSuVUCkvsklcOguXHBB8EI0dB1dqgzK7dcxA8d+xs2+r
	+U+B0GlNqMJKD10DsXA8mbXfAYSgWkYvwPI6wpyOjKIdVQa4p7T3/JRNe9PoCb2C
	lEPAt7/h+GNCc/f7vfHcFmvffv4WVcUWDzcm2YZ/B/JZSzBlWLgV+e/18CoOwGPs
	3LHv0ImBv2mjpRvum6JDKhDUUO1lHRDED7umnXPar8bEBAJdAC8IxiQFO4daA4XS
	Nh12LhxzCGT40qpwXjkmoA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013007.outbound.protection.outlook.com [40.93.196.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0nh5ts7d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 05:26:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbIuXG5DitRCDkjbRsjtu20QmCLKN/2ebX48JvUle6FUeZmjHb3+AvWKYMDHjsisbFA/C4oBmZJOBe4IZqFZBqAjzGonuWqAs+invTAuDQiBs4vg/lgmY3DoDSfjffg5LKUQsezGjqEzAISG3ce6X5R0kfyjdlTqntISUlm63RFifuTIGOLtwPBvEjp/GEJ89UxsOSe2Y+1IShFPtmzKsRKzuoQB5srgIjnSf7cUh6qJjZ//FJesYt79FsWAq+DNaWoqIBDtzqLjLYXL2b53EyX3WSWUTkrXlvaBTouC3xdbHh69nrKVWwTCOdgJysgBoRzqZGnYpjrTWFfwFPY2Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgokf3+KFQeGhEUX2fVONTjIGdaUg+Jn9xCw1+jBx/Y=;
 b=LA9kDjchKaiv1fOgPX1y+YjA7V1k3Ec/qV9bXrR4Z+yZWlyVoG/QmTMRexst8Bhc/tbvbOMqqZQS8507aCGdEcnhiLO0Ow3AqRqEVYBZlCwwN7Cl5KUIJQzuQ4CnHC71XYFt8uPlK38sWj7V8xUjKPYUV83hs5ZbRuYgjkABJZeIsWquwmSC0w3Z54ELfU20XNiXJ7BGjg0RWE2kdtDBw8DRGUEiiidFt28KdY1m9Gkt1AvCXnwbDdhoK/zL89yi2ZzwGLmBcHA4t0FwW9q/eAHmbSCqW9/YRn91jKQRw+lutvenUU1yfv52uFRdYMAiFrdYn4J9d/UEFkjajkYGeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 05:26:51 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 05:26:51 +0000
Message-ID: <7a1ea0aa-00e5-4630-a45d-1c1abe0909b6@windriver.com>
Date: Tue, 28 Oct 2025 10:56:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust-target-config: Set elfv2 ABI for powerpc64
 when using ppc64p9le tune
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20251023161522.994070-1-Deepesh.Varatharajan@windriver.com>
 <DDSABAGDJDZ8.O3KH5LWYYAAW@bootlin.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <DDSABAGDJDZ8.O3KH5LWYYAAW@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::13) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e77cbb7-6ffb-4b84-63f9-08de15e29938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?enFyaXVOUDZUR2FteExqYzZBRjdyamNVUTNYc0Y1SWlwLzJHb011c3ZJZGc3?=
 =?utf-8?B?cFlJQ044V3M4S0xDbXgyNERVL21kb0FKWmh0cjB0ZllyT2d6amZTSmRuN2NR?=
 =?utf-8?B?ck54R1N3UFlCSG5nTEpva2ZZRWZXUUN1bGMrZ2hWWDJkN1dpNHpTNlBBZUNX?=
 =?utf-8?B?UWp2S1lQQ1J4bEpJa1hvOU9COW1jSU5zaUEwQVZYeEROMjFZeGdaZE0raXJ4?=
 =?utf-8?B?QzN3SW1BeWtMNk9hTGlkeXA4b0JOZDVZcTJMRkZOc0VzcWM2OFd3NnBNb0hP?=
 =?utf-8?B?WDM4MDAxR0lYSGlPM0szRkFPbkJ6UllKeUlCUWRScnkxWVZVc29iY2UxWXh2?=
 =?utf-8?B?Q1lZQ09xVWsvUmtxWEZoV1FBR0k4UmxoelcxQUFPWXo1czI3Yjd4dGE5N3Zz?=
 =?utf-8?B?cWk5WmVXZzl3Z09hNzdkWUFwK3FUMFo2WG9ITkkzM2pZV2UyU2g1TWp2MjEx?=
 =?utf-8?B?aE9TdXhPdnNjREdjdGY0ZndCRm5MZlRQUGo2VGdVV0h6bllhL3NMcUFhd3Yr?=
 =?utf-8?B?M3M1eEtSSTY3eFE3Ri9xKytrd2x6bk4xUjY0QThXajhhOEY1blEwSFNNOU1Z?=
 =?utf-8?B?MEkvdk1GUzh4Z1R1Z2ZYQjZuS0w2Nmw5RE5SaU9OaFp1K28zc2kzWFBjaVRv?=
 =?utf-8?B?cENPbXBxQ3k0dXVZRFBOaHQ3V3JBV2tkMi85b3R5NXF0a1lWUU41YkZnb2lZ?=
 =?utf-8?B?ZWNKOWNMMXNRUElxaXdmR0svSm56NWRUaFlYVzBpV1hFSllNbzZxYkxaS3Nx?=
 =?utf-8?B?ZXZBY1BNMnE4c3E3WFhJWGQ2eTFtQ0ZEU3pSd0gzbEFYdmdoZW5KOTNkaGQv?=
 =?utf-8?B?ZFZHSzVNdWJ1b0pKZHpQa0J4V3UzNi9lZzVSRUd4OTNiTGpGVHU2enZGYTZq?=
 =?utf-8?B?RmRMY3owbFNSS0E2VlFHTnI4VkZRVm9udyszM2MxVTUyU0ZyamlxckxqSDF0?=
 =?utf-8?B?NnBlZzd5REVhcWtRRlBreE5ib3Q1M1MzRURYdzJiOFlMOFdHakNLZWExVmNQ?=
 =?utf-8?B?L2pnNE9MWmNMVEdRSkJNckxBYmR0Y3lsT0t5MlIzTFNEN21mWjB6d2Q1WDB6?=
 =?utf-8?B?a1V2QjN3TkhOSWlhWnQzNzJLTnBLSUR4Q2pRTkZoT3RBQlQ3Q0QzcFFvTnJC?=
 =?utf-8?B?T3NCYlRqa1hoYTAwS0NYTzNsZCs5MjgrcmUvTzJsN0ZYMUFkSU9seXVBMUZX?=
 =?utf-8?B?NmZKamVocmZmR0tieDBnMCtFOWw0Mm9GOWZVZ1FnVnBQRFpxWXduYjZjMVVL?=
 =?utf-8?B?aUVva3owTmUxWHI3VFJ2Zm15aGpHakdScDdoSUkzWWNDL3E1UVRsYmprMGtW?=
 =?utf-8?B?NCs1eWp0enZSMEhkZWVKQTYzOHFUTU90OFcxcENMNDErWDBtZDMwSGU5T2Ro?=
 =?utf-8?B?N05KODRrd1k1VFA2U0lnYkdPVEx1S0k2ODN4TmlqYWg3YVJrbHpBa2FRT1VH?=
 =?utf-8?B?WVJsK1c3c29lTVI1ZURQQUNnODlBcTF2dTRSbkNZQ3hOOThzWjl4LzgrRkdQ?=
 =?utf-8?B?Z2JyWWVCMlFydVJZSzltQk4rWXpJdFlaTG05UlhiTk8wdzhkUWhnUllBc1Vx?=
 =?utf-8?B?NEdMd3pVMzAvMGI3Mis0dFFDbWhZMlQ4MXJwN05GaHU4R3BoY2U4NE5xbndl?=
 =?utf-8?B?RE1YV2w1YlNOQ3lXNXBpZ0RUSzNGUlVmSzhWVDFLKzJTUGNDK3V4bnRrdXY3?=
 =?utf-8?B?a2NZUVpJcGkyN3hPaFpPVXVOKzltRGErOUpzZEZ6SnptSGNOMlQydlJkVVR1?=
 =?utf-8?B?QVVVakZwcG0wbGEvY3U3b24ybFQzM3N6ZzVCSWhSRFJ0Uy8vWEY1MGt2VXRD?=
 =?utf-8?B?ZXlkTzJCam5CUW9raWVJTWdIV1J6WFNZZnZDMHpxeG1TVWpPV0hVOUdUSjY2?=
 =?utf-8?Q?hCKSzeQ1XIYCi?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aThRUXQyNXNWVlkxRTZubFBJaGw3UlJWTXpOUkJ1bmhrM3I0UTM3MUdQSnJQ?=
 =?utf-8?B?Zm9xQmxidHd6WWE4bkFWUkJPSU1GdXBvczFMYlhDUXhVR3JOTGRrRFFVYm9h?=
 =?utf-8?B?Q3EvOXUxdzM2anUybHpjRU11bkdOS1dhNnArQ3ZEbHB5YVR0ZFFQWkJ1L2JO?=
 =?utf-8?B?R0NzWnRXSE1RVGU2bzNvekJHNVJRd0RLRmEzK3UrWGhCUWpVTklpSzJSS1dU?=
 =?utf-8?B?Y2FDYkkyOGExVzl3bmVvTmRpUjRjL1hDVk9za1ZOd3FjckkzcVlyRVRHeXJm?=
 =?utf-8?B?aG9LZjRqN21UK3lLQldXVFMzWkRoQWR5WDhrUlZjYkd2ZWY1NGhBYm9OeEd3?=
 =?utf-8?B?TzhQbFBtZksyVitvTmJEeC9rM2hGQU9KUEtBOU9BbVFDV1NVN2drU2ZlRFBz?=
 =?utf-8?B?MlRhcTBpRmFybWh3OFVkV0RWblltNGpwbVA2MTY1bXlRVHBJY3FKaHhZT1VJ?=
 =?utf-8?B?Y1U4Ym9wcTRlYm1HYzM3ZXcwUWp2SkhiWSt4Sjh0eHJ0Q0JVR0FuZk5IM1VU?=
 =?utf-8?B?VzB3WkhVcWlMQktmajBkbkhwU1U3STRBNldKb3ptWS95aFlyRzFRWTdoY1hM?=
 =?utf-8?B?TXhvNEdmODZPMVVFVC9sVmNoQ2t5aGhUT1lZK3hYNk4yb05scEJsaGl0dWZM?=
 =?utf-8?B?azh1ZXFiQzFwa0JpUkxPZUhQV3ROVzlqNURLaEc3RFZHMTAyYWltVGd6b3hF?=
 =?utf-8?B?am9Ta1ZJY2xsWERVWEo5eHI4eWFtWWV3MXRjL0dUS0RCZVk0cEFNYjlJb2R2?=
 =?utf-8?B?NktkSFJ1Q3pzY3RCK1ZWVW1jZVpJYlBUQ3JiNi9PMjZ3SEt5M2pOU01vNlpx?=
 =?utf-8?B?N0RPQmtDeUtJS2JpRlVJVTFMZHQwTEJ4QkNOWW5DVEJQRk9UYTBGTndYQ3M4?=
 =?utf-8?B?R1NOM3RVRDNyUktJYkJLYXhXUWt2ZlM2bWpESStyMlhDbXRwa0FzL2lyUkVU?=
 =?utf-8?B?OTdrZktHaDd3S1NhcERObmRieEFsUFFaNElZSU1yS1VZTFd2QUphMHZRVDV6?=
 =?utf-8?B?c2VzNytiUVAyR3MvRzIwM0hReEFIMGZCV2c3RllQWEoydi83ZVdEc2RUbW5G?=
 =?utf-8?B?T1hETjd5eVYrSlI4VG40LytranhvQzhROEJVb3dxMDVFVFd0MG9rVG00a1dS?=
 =?utf-8?B?OUllck9ma1Q2Z3dJRlZ2KzYraXpGY2ljaDNGc1NnL2FLWWwwT0RzWHFlb09q?=
 =?utf-8?B?LzJ4WVJFVzU0RTg5T05MbVJBOW5USDZteXVNWkMxN01sRUlpYnRwRmRzSXo2?=
 =?utf-8?B?SkhtNC84Y0lRU3ROZ29OL3ZMQTZaUG5kMkdESGZUK0laaXlmRnpXSFRmNFJa?=
 =?utf-8?B?VTRwMHhEUm5NazhXQnFFS2ZBbXNBK2QrdVBvcTcycldpSnFhZXk3VVQ0WEQ1?=
 =?utf-8?B?b1VGT05Reko5VU5tQjFqM2dseGJwcDc4ZUVTTUt6Z3hqSGk1ZjBSWC9xRDIv?=
 =?utf-8?B?bUd0Q1FhZDZEQnd5RnFGYVhBSk1QN0h2KzlKQm1ZanlEY2pQc25IT3I3aTlE?=
 =?utf-8?B?STgwN0FhSS91V21QZm9jRUM4YUVFQzZHdHprQjQrcWlQT3RYTWhCbC9PMjFS?=
 =?utf-8?B?ZFlUaUZnTWFjNnorWk56T2NQYVVaU0xmWTFKTHl0b3d2dldBcWEwaTQvMUY4?=
 =?utf-8?B?MHZBWkpoa1RpcVhlOWpSRGJDU1RvTjFiODBQRGkyNC9QMS9zSjBtS2t6RjZy?=
 =?utf-8?B?QU5MNFRDYUVXYytDOGxadEFlc3RMWEVLb1FlR2hJZDF2VWsyTWdzd0JqczdD?=
 =?utf-8?B?OGhhMTBJMm9WZmZ0dy9OMll4eHQ3TFR0S3l2b01vSEt6aU5PNUhWVkcvVmJj?=
 =?utf-8?B?TnJnQlpmRFpUMWxaZG53OE9KeDdyekpwOVUxZUFRVnFTSW9wTVR5KytpaU01?=
 =?utf-8?B?QUhyUWlEOTZBdG91QU1JdFBDeTdqdlBvRzY2bUROekJsZ2ZYZm5rNS9nT0Y0?=
 =?utf-8?B?V2hQYkJueG9GTlBwUGhJd3Y3R1NCMXV6NUc5bTllSXE0UjVGRDNTQVJyckIz?=
 =?utf-8?B?c0xuN2JjdkdCVklPc015UzFDQnF1aEZOMGp5ZkxaVTRWRXhaMlBaTDg4THAw?=
 =?utf-8?B?SzFER1lzT2R5R0Z5NGZtaEIybDBMUjY2RFp4b2U3VzIxWFV6NjlXSVRSUFFG?=
 =?utf-8?B?VnlhTytBMFhvZGdUWXJ0aUdLYy9LbVo0Skt3dHl1WWlpVVZiWGF4VTJmNk56?=
 =?utf-8?Q?lJKsRND4RzDqbBcIhBzbqQ8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e77cbb7-6ffb-4b84-63f9-08de15e29938
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 05:26:51.6701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vWLq1wUmBkKJPWjZeybSI1LiNTU1B5Flw73q329q/GKSgZ4M3+QpQmuXk2yAwE5j4S/zOvbppKRiWFWWUSvlAujMr1CLlqds+GjfKVkGLvLde38bErfzEqRgFeXmQTMs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: heRhoQnKjkMXKlX6iOmDUawl18ORFxl1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA0NSBTYWx0ZWRfXz0U1AeBol2fW
 XpVG+n1U7hnN/SNGWNnP5L68ouiTmfYsbwE4iVopoHNxs9p0bIJKIlW8bXHWhKnElLivGmOqWc6
 5d68NTYMhN34QtA+xvHINVh4HikaiHlobvJK/NR5bcwE9no7/ix2vWK+j5sbUsxJL3NPNq5rCz0
 vzRBP/XLZpoxSQuBVCiOKFVY3z3V6aSRB3JHI//gVttJGX48y5iUJZa/UPoS7z16fah90BOzl/V
 HOJO8Y+8meuRMgtppcpHMJRVX38H6lz8kI6HOoq06+sh1Bw0dumW2OO7ZhT5SwZq7jb8/Frp8c4
 +xreMbRhyqoBUn4BRy23t0sf1wMKB6Hgu3HUn+w12EDzfenaiPtP02OrzGTb0qCS6fnGf8afvcK
 s+DEZ/OlkB9xYjIh6uIWE+H6eygU/w==
X-Authority-Analysis: v=2.4 cv=FOoWBuos c=1 sm=1 tr=0 ts=6900541e cx=c_pps
 a=B1kIKGfTVomdQYahC0fm5g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=AjblcJP-MoKAwFHSfCEA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: a-eZwJ5aP6ejFwTFwCuqdo6zo1xu1an0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 05:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225376


On 26-10-2025 18:53, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Thu Oct 23, 2025 at 6:15 PM CEST, Deepesh via lists.openembedded.org Varatharajan wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> For the powerpc64 machine with ppc64p9le tune, the supported ABI is elfv2
>> but the default elfv1 ABI is used and this causes link-time errors such as:
>>
>>      ABI version 1 is not compatible with ABI version 2 output
>>
>> To resolve this, the powerpc64 machine with ppc64p9le tune is updated
>> with elfv2 ABI otherwise, default to elfv1 ABI. This change ensures
>> consistent ABI behavior across LLVM and Rust builds.
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>> ---
> Hi Deepesh,
>
> It looks like this is making the
> sstatetests.SStateHashSameSigs2.test_sstate_nativesdk_samesigs_multilib
> test fail:
>
> 2025-10-26 08:51:57,797 - oe-selftest - INFO - sstatetests.SStateHashSameSigs2.test_sstate_nativesdk_samesigs_multilib (subunit.RemotedTestCase)
> 2025-10-26 08:51:57,797 - oe-selftest - INFO -  ... FAIL
> ...
> AssertionError: {'nat[45104 chars]o/do_fetch': 'bdd296fda030801a2ec723f040ed3f24[267479 chars]6d3'} != {'nat[45104 chars]o/do_install': 'ef30ed01cb16a4f54ae283891c27ba[267479 chars]6d3'}
> - {'adwaita-icon-theme/do_collect_spdx_deps': 'e9c8aa9cb0da1323bf4df9c657378e80fea1073a8965b8a3a93d343cb1682b32',
> -  'adwaita-icon-theme/do_compile': 'c77f720ad728595247f0191ce3f416d1bbb29452cb6ddd29abcf4ef5b7d5675c',
> -  'adwaita-icon-theme/do_configure': 'c42cce9d1f3dfc4af7d4ee6896de1148dea92979785fc33826d877747b2d07e5',
> -  'adwaita-icon-theme/do_create_package_spdx': '701aeb10f9e4da9c6d1ab2c1d97d2b43c621b5cbd5b90c89cfc4f49123ed28fb',
> -  'adwaita-icon-theme/do_create_spdx': 'c7b48fa5ee7aa7e2183567d8eecf53bd1ef32266d89c55b05a75f1e2e91a0f54',
> + {'adwaita-icon-theme/do_collect_spdx_deps': '26bf70dce8eafe543e4577a0a25ce6c70f70a8c43413115a7e428c2fd00e2242',
> +  'adwaita-icon-theme/do_compile': 'b83691bddde426f52318e31a2fab6e17807abeceb5ccc7441f1008f6c77e5291',
> +  'adwaita-icon-theme/do_configure': '6e38f74c8d0a14e3229cdf96058639c1f9269bf34e035c83874a0713256b6dd9',
> +  'adwaita-icon-theme/do_create_package_spdx': '57a8b2eee13c7e4df83c7c88cfb2f0acd479f072c11a082a14acc5345fcf8228',
> +  'adwaita-icon-theme/do_create_spdx': '72ee25314fee38c71794368ce1030dc9ce103a5e10ca09c3412066effad6e684',
>
> ...
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2744
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2596
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2506
>
> Can you have look at these errors?
>
> Thanks,
> Mathieu
The issue was addresed in V2.

Regards,
Deepesh
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

