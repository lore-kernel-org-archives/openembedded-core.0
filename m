Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4229F417EE
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 14:50:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16424.1773067856008091053
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 07:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Hd3ygdPP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7528379c80=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629CcZhA2939223
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Mar 2026 07:50:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=BNoCeMrZ+EZDhW+0o82Bz7
	UhPwlZ3D+OdaRPvlCq/aU=; b=Hd3ygdPP42CjxRw1jvPH1KNW8riBuIxNusrFJG
	9dpY8IHUGS5ydLnII+9oulgcivISZWo+eJdiTER9knauab3z8Yj5okUqBkPcY5cv
	aoXt9HFBHK1GgW+ddghTPBlFrU8MbL4GfGXpOJXfn55f4JRN11zgVLLumPWt9nW4
	0/zNx7c3MLYaOGbxAjxn9IsQ6C6qeGwP9f17U24uQNMpjXxUk4onV/dUGOAYr6vh
	g+f2QYE6m1K8graX4O7Q16/R6xqiETtbDLZW+6uB+vjOk8kPMRVUq3x+9OYuhQpO
	U8csEApq1KDd0zozn+OaL6Z/nNpwcwm9Xifxq3s91p+2+2Bw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010045.outbound.protection.outlook.com [52.101.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crmdm1n8k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 07:50:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IAKrX98HwB0APWL8U2GVEHeDk0OqbKQMtUSC2We+D8eAWUYWCAH64ZuYbMpeGs8bBj1qoCVUJHI3GYzyW24KTIsMG/BYFda6YmdnzBcA7qd7oAm33AhqiBCcu2o4WPK1K+NFIIXtm7YD9/O5/iKW/d5PG4kTB66GHnSjtrWofKGozb5k9XHYNhTwKJN16kUPt1eBBjJCK3AuEjpz1STqv9XZ/DEdIWYKiMIaEFVxBPX6HwHFicqVkWqbtOkvCvw4jtdE2xhqcjnJH2vQu8Af+L0+ocjtJGhCIkfOlIwaaa3FHjbN+oCPBB2lu5DQvor8PaziKj3b7GwHZUSpz+jYqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNoCeMrZ+EZDhW+0o82Bz7UhPwlZ3D+OdaRPvlCq/aU=;
 b=B5HSK/IFbKeak/HOPqQGoIguXcWKAkhzxxUxoSqDNAEZwUgVhF+DvaDlw/4L823XM6Q17iwUCRuO5NT6wc47gst8DF3QHf2JQKtUgk3SrSuh3QLAheUrB2WTsRFLh5+HuLZe7K5RaRkRGLvcyDxWSs1HVWRjExpZ+hgr/rOIiFmDSBzBjBCsvtGzQLCFnpazXHbu5v+WkfYoAEyDytyeOv3jXV/jIqX26yId6cIRH3omfn4EuSCwBgxj/vuEgZmt29Va3RC/c83RLfqV7BVKaAfwHW94EAivUvfTpxmzP5I4jMBppz7xii6SqJHqrSOkVW3+cx7/6tL6O+sS1vbD3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DM3PPFA4B6D88E3.namprd11.prod.outlook.com (2603:10b6:f:fc00::f41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 14:50:50 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 14:50:50 +0000
Content-Type: multipart/alternative;
 boundary="------------i51n4pvGi5Wfbe6N3Rn5tcIH"
Message-ID: <8855ae4b-6399-4f5c-ba08-f995ce2df8a0@windriver.com>
Date: Mon, 9 Mar 2026 10:50:43 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/7] gettext: Upgrade 0.26 -> 1.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Hemanth.KumarMD@windriver.com
Cc: Sundeep.Kokkonda@windriver.com, openembedded-core@lists.openembedded.org
References: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
 <20260308150834.2508331-2-Hemanth.KumarMD@windriver.com>
 <DGY200N2IVAT.31AXPCZZ9K6JG@bootlin.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <DGY200N2IVAT.31AXPCZZ9K6JG@bootlin.com>
X-ClientProxiedBy: VI1PR06CA0215.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::36) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DM3PPFA4B6D88E3:EE_
X-MS-Office365-Filtering-Correlation-Id: 766f878d-e999-44a5-e930-08de7deb419e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	jBIPpGnSIvRaj4jdiyePMZBYSRn/u4piKneKO6Mt3X4y5JovvsUZBEfZ3NsR6LQbKXXAuKPfUi22Zt0ftjRi+yxiAdiFCtFw7X9CHVc9TfxP6XSHtLpbFSHNMjcOqwsAmUDgWaUf2f1w3jthoQT7/jbEv7JqiFpfmvE2uHpTWBOVlTb3SLTCLaeAlVMtL+o4N7Od4miquiQWe3D3nNT0ch/Xmw2jEgU8W3uanI8VJV9FNgPwHqPCVkmpbhxQBuTHuYF0MMao0dwETba+YJWipp208d0vbFHGrIbSPNytgUkMN5FaLKfTMlLOcOPt/NWqDdFp1S0ECv+gFtY0AEEqj24hqIhj6d0+qE+YFfOBjZYXcSHHQ16i+KAm1isj9JldXqUZhl2wtQkAmTJeTVw+PencFiHkfLMR9YZ6qWPQJLkbPfTfHXmMEAofe9PBu0nNEz9pz3o0SNWnhG6abfdYsX91LUWUfsMOH1WXLtQwt3j1HFm7EA9ernQ4Kwof3RUs9XCUhtu2Nse2xJLBcCrD1H4935tbzvMgoucnwlakrdH1XzNf40jsZUdLRYuCLqaVW9EuNaJhOyKiNZk4mECfm+kfyqMGbN8KnV5aJBZjEESgf5uFSRWmDakBnH3b2qIlyUPdvQQI4/Cx4Xx/7qeY2Lzvc9CHDMJFR3VU/eeZhH1xJJ0QWd/iOUYBAUykmTut
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VWdxRS9IRkJpaTB2SUdWSnZSWW5DbTRpU014Wi9tZ0kvWVBjc3BXSWZpUklt?=
 =?utf-8?B?Y29GVzV6TUxvd2JFc09vRU5vYXo5ZSswVmxjLzl3YStUN2g2MXN2c1g3Y0Rv?=
 =?utf-8?B?T08rK2MvQnphZW81bXJ3SUJTNXpPRjliRXlPOWx5dURlKzlkcTBiRFlqY25R?=
 =?utf-8?B?MnJabjNNRmVVNXhkblFYbnJ4dm1yK0dtT3pacm1RTDhPSkE1Wk9wVzBqMk1v?=
 =?utf-8?B?RFZCcC9KSnpCdng2b2lqeHZudjkrSW1ENk8xb0pWc1h0ZHEvRVJYblk3RGRq?=
 =?utf-8?B?TkV2OWFUS2Vvd2dpMVdvc09uVUVYanVZbTFpQzNwUWpkbDNIT0Y3VjFJbmtN?=
 =?utf-8?B?NmFQeU5HemFUR3ZWN0pBaDlhK1FSdlpoVDc4SllnMTZEdEtodWhhZXhxZkta?=
 =?utf-8?B?KzFKL3ViUjdaV2xWbG9hRFZoWTlnY0lOZGU4dXd3ckxNUjl3MWF0SXlYREJj?=
 =?utf-8?B?bElnbDRVSVcwa3cyS2M3cUpWaTZLOWMyQ0lqekRyN3BJeEFob3N5dW5MZDhL?=
 =?utf-8?B?b0ttTU9xcnBSR0ZkR0YvUmVVbDg1dVZzbVE2VGdRYjVoVEVOYlNLd01vQkp3?=
 =?utf-8?B?WU1RckxpTWhXaWtXNHc4YlhsRmtwWnlETnNyN1F5cUUwNXhVdWZNUm1DbTJL?=
 =?utf-8?B?TmxnOUh3cVUyc3M3aU13Y2Y2bEpKa29FVE5kOTNWTnJkeDJtQUZITnpXNWE1?=
 =?utf-8?B?U0d6dE5oTjY1aUI4V2dXdlFNOWpibTlRRUhmUi9FWkNHc3RIbWUwREZCS0V3?=
 =?utf-8?B?Ykh1MFRBaUFETE9haElLWTlGK0Z0enNqWjd1R0xUM0pYUUNwdmd5NTEzWHFV?=
 =?utf-8?B?eEJibnJrdmovTkJrZmFabEpTejFQVHl5ckdoVTAzQWxaaGlyN0p5endEeDJr?=
 =?utf-8?B?dFJYZHBjelFyRUEvUXZ6Y2lOMFJVMm1GU3pMbmJwZE9tWUdJUGVBVTAzaWpq?=
 =?utf-8?B?UU4xQksxT1ZjNVN3b1RKbzRTUk94R0I2R3E3ZkZEdG1QNlkzZjNFRGZUeWI5?=
 =?utf-8?B?aVpUT0ViQm9HeWdyblNPbkNLNlEvSENCdWlXZlJ1N0F2TTRqN2E4QmhKSjZj?=
 =?utf-8?B?WndFVlY1YU5GZ0hIbG45V3pwMmNDVHhlZStUd1FNLzFpS3VkMUFXdTd1QTMz?=
 =?utf-8?B?VytQVFQ2Tmd0cVJWMWxYekpEcDZITkRRbnZQTDltZWdieXFvY20xdHg5dUgz?=
 =?utf-8?B?OXFxdHJ6U1FUbzRIRTVlcUxNZFZLQVY0RW16MERJV0FlaWtjK0c4Z08zVUN0?=
 =?utf-8?B?ekRCbmhGOFY5MWs2ZjI0OU82Zk9JNWxsamM1dGlMc1I4OUZiQlRldUJZN3o1?=
 =?utf-8?B?emUxL08yUTN4T3dSa1JJTTJSbjc1clBmV09ROEh2WFJsYVhWT0QrSU5ES1Zr?=
 =?utf-8?B?b2dWRFI0bVRLMUpWOUp3R1pvUVVRRnVTN2NBUmpqeTd0ZTZoYXhRRVR1Q2Yr?=
 =?utf-8?B?YnFJSW1FMUJpSXlKTzJTM0FBVkZwK3dnT3pYR0dxUUFrTFJEb3UvVmNwMlVT?=
 =?utf-8?B?Q3QwUm5QUjVKRlZqLzhCZFRudFJYRFpmSUNlbHprSXB3dllHajB0UlU5K3M0?=
 =?utf-8?B?cFBmbWtZbjRRK3JqMmJPY2tnNzlKTEdPUS9uVGc3WXlDVE5kNFZPUkVGVVA1?=
 =?utf-8?B?dStFVVpGSGhTckNSVEJibGJENmNjS21FdDd0anMrU3p1Zk5rWjhrdkN0dkVT?=
 =?utf-8?B?MDB1eW81UjJMOUg5Q0MydGdxcEd4QnA3SFdzVzVjMFRCUWtXc0RjUGQ3RlBN?=
 =?utf-8?B?OXBHSWYxNU5wSUxOVmY2ZVg0RTducjIzaW9MZ1Qxbm83YlNNZ2J3d1d2ODM4?=
 =?utf-8?B?OGYrU1VBR0grL1VrY3RSNnRvenVwRE5Pb0JqT3VvYlNrS3dJRXpQVTlueGdG?=
 =?utf-8?B?aE9BaVVsRUhqZldBdFBoSk9SS0cyTjFRelp1Z3EraCtPRkNJcm1DVU9jQlJW?=
 =?utf-8?B?MCtWeHZaZmRWcnduV0ZhUVdKeEw4T1hhdGl1Sk5OUk5icGRCUmhHZ1oxVjg1?=
 =?utf-8?B?R3VUMEpYc1dFRUF3cURXLzVSQ21XaFVhTi94Q1RlOE5PQkp6dlNaYjVRMGk0?=
 =?utf-8?B?RzFJSjE0VE9TZWRnMDJjQU9HNlZYVHp5b25LaU9HZkYyejJqc2VlL0grY1dD?=
 =?utf-8?B?MVpBN3hLL0pycG02ZGFhUHBVS20wMHB3RmtueGVpYSsrVlVRdU1aK1lXVnQw?=
 =?utf-8?B?dUljN1AyNGNHVGZXRkdLMjY3RnF3MGtTOVdzT1VuTFB0emk1c1dtK0ZIVEQw?=
 =?utf-8?B?YklOOEd1Y0pNaDlMVEgwQklkLzJ6Qk9xOHZHUDVDMW8zVFRPVmFQcXlqdURt?=
 =?utf-8?B?T2EyV2hKMk41dTVNWW9xalFmb1c2VUhCU2FsakZpU3lHeGpVZXdkYnlUclhT?=
 =?utf-8?Q?k7JHHopYkCWgGXkM=3D?=
X-Exchange-RoutingPolicyChecked: 
	q42RqRn9c108KSqjLbNhovSPsog+ykmwIUxgEE+Hq8YHg7fVaVNqlHMYVQ23KpNKDOaOfxTKWlt95aogCucXhGdNHLDbP38cz8gRDzV83vkpKLdZJV16XeoWnrOe9OLspQCFcPIZADu/JuvTo5DRdxZpUwUuF/ukxIyZUN3RF2m6SljJITTXYJrMp302N7dOJwufNEF8XybKDCkL15eZwRSyrJpimAPbQnxaC5pEJiBv0iYxVT3o85e0j+NvLeQB5wFICHJ50y/Q+ayZsywyKBe1KUeFgKSEazam+jZJtRJAH0jGJLAiz0fa4h0XSqgKcpahm8SuE3Iw3NraSg7hsw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 766f878d-e999-44a5-e930-08de7deb419e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 14:50:50.7434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5gxhcqS8JgjXPcQiJxAN71UCNwzV7/VmYl8gW8poGQmehncIdoCWdwB5y+OfUgfKPHdd03aMFi0NUkCfxmIUHvSLHWQgrECA3bwGDxOitU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA4B6D88E3
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: dt8RWqosLZgv_ZZveRVLzi-cP5AoM5zl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEzMiBTYWx0ZWRfX+Qo928AfW8Ia
 khc23DH8EyByJRit/H9DiwUponCsJxgtJa4xwG5OWxQ4ybDgnZU4vkUlr7Am5NL9ZUDvLe21hIk
 +FENN40tUcSjSoIp30XWabn208nD3pVpC4CEaVVlGN8fMZYh3OQ0JCvSNdeVnwwzbaf7ztVq+CS
 Vac5arMLnYZsRwQ1U6xC9qJSWUjrvUN3vyeTBwq8jlDXAtaKaB+BUsIuau8CtEqdYhxxnJmEA/9
 AFQWQA/NcIE9DOkFX0OsNhqLR4kyyKVonRU9dQV+w5yyrnFZl9ev1kXiP9plA5lX2YTyv0wnu/y
 XnhMB2y9xLKL1PEd2zGaOiBzk8f9oJH6vV0htxoOXfI3/0gC6bU2OGBQX5rB+J5yYmzXsSeHg3C
 uGGqAafFJ4qtMVRReHHu+D2lrkZkipCVnqaqXAgAaTU8EMJMvUYe1m4o/ZTJ/Ur5m6VcgxitvbQ
 tZ+TIgdGIjHTw0qBvAA==
X-Proofpoint-GUID: VSLhP_6yjTmGoQL9pdDVev6xOVamY_mx
X-Authority-Analysis: v=2.4 cv=QppTHFyd c=1 sm=1 tr=0 ts=69aede4f cx=c_pps
 a=jCeAeT6ZWnoYcCLLvvbvuw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=iGHA9ds3AAAA:8
 a=1NWNoF9oAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=Y3nK6WsGKInEDHWclYkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=P-IC7800AAAA:8
 a=17tub2KkNIzAXnYT5K4A:9 a=47X8_6I1TXb-yPpF:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=97APRTa-CG6DvPMFVxHL:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 14:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232725

--------------i51n4pvGi5Wfbe6N3Rn5tcIH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 629CcZhA2939223

On 2026-03-09 2:56 a.m., Mathieu Dubois-Briand wrote:
> On Sun Mar 8, 2026 at 4:07 PM CET, Hemanth Kumar M D via lists.openembe=
dded.org wrote:
>> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>>
>> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
>> Signed-off-by: Martin Jansa<martin.jansa@gmail.com>
>> ---
> Hi Hemanth, Randy,
>
> Thanks for the upgrade.
>
> We have some ptest failures here:
>
> Failed ptests:
> {'gettext': ['autopoint-1', 'autopoint-2']}
>
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1202
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3207
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3237
>
> Ptest logs can be found here:
>
> https://valkyrie.yocto.io/pub/non-release/20260308-104/testresults/qemu=
riscv64-ptest/core-image-ptest-gettext/

> https://valkyrie.yocto.io/pub/non-release/20260308-104/testresults/qemu=
arm64-ptest/core-image-ptest-gettext/
> https://valkyrie.yocto.io/pub/non-release/20260308-104/testresults/qemu=
x86-64-ptest/core-image-ptest-gettext/
>
> Can you have a look at these?
I think the patch is my v1, and that Martin Jansa didn't bother with my=20
v2 since it "only improved ptests"! ;-)
I've sent the v2 to Hemanth.

It just adds:

+--- a/meta/recipes-core/gettext/gettext_0.26.bb
++++ b/meta/recipes-core/gettext/gettext_1.0.bb
+@@ -148,6 +148,7 @@ do_install_ptest() {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${PTEST_PATH}/tests
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${PTEST_PATH}/src
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${PTEST_PATH}/po
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}${PTEST_PATH}/autotools
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${PTEST_PATH}/misc
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${PTEST_PATH}/its
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${PTEST_PATH}/styles
+@@ -172,6 +173,7 @@ do_install_ptest() {
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/gettext-runtime/src/gette=
xt ${D}${PTEST_PATH}/src
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/gettext-tools/src/.libs/c=
ldr-plurals=20
 =C2=A0${D}${PTEST_PATH}/src
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install ${S}/gettext-tools/po/gettext-=
tools.pot=20
${D}${PTEST_PATH}/po
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 install ${B}/gettext-tools/autotools/*=20
 =C2=A0${D}${PTEST_PATH}/autotools
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install ${B}/gettext-tools/misc/* =C2=A0=
${D}${PTEST_PATH}/misc
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0find ${D}${PTEST_PATH}/ -name "*.o" -e=
xec rm {} \;
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chmod 0755 ${D}${PTEST_PATH}/tests/lan=
g-vala=20
${D}${PTEST_PATH}/tests/plural-1 ${D}${PTEST_PATH}/tests/xgettext-tcl-4 \
+--
+2.34.1

I'll retest here again for x86-64 an riscv-64 and co-ordinate with=20
Hemanth if there are additional changes.

../Randy

>
> In some of these logs, I can also see some failures related to glib-2.0.
>
> Thanks,
> Mathieu
>

--=20
# Randy MacLeod
# Wind River Linux

--------------i51n4pvGi5Wfbe6N3Rn5tcIH
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-03-09 2:56 a.m., Mathieu
      Dubois-Briand wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DGY200N2IVAT.31AXPCZZ9K6JG@bootlin.com">
      <pre wrap="" class="moz-quote-pre">On Sun Mar 8, 2026 at 4:07 PM CET, Hemanth Kumar M D via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
Signed-off-by: Martin Jansa <a class="moz-txt-link-rfc2396E" href="mailto:martin.jansa@gmail.com">&lt;martin.jansa@gmail.com&gt;</a>
---
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Hi Hemanth, Randy,

Thanks for the upgrade.

We have some ptest failures here:

Failed ptests:
{'gettext': ['autopoint-1', 'autopoint-2']}


<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1202">https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1202</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3207">https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3207</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3237">https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3237</a>

Ptest logs can be found here:

<a class="moz-txt-link-freetext" href="https://valkyrie.yocto.io/pub/non-release/20260308-104/testresults/qemuriscv64-ptest/core-image-ptest-gettext/">https://valkyrie.yocto.io/pub/non-release/20260308-104/testresults/qemuriscv64-ptest/core-image-ptest-gettext/</a></pre>
    </blockquote>
    <br>
    <blockquote type="cite" cite="mid:DGY200N2IVAT.31AXPCZZ9K6JG@bootlin.com">
      <pre wrap="" class="moz-quote-pre">
<a class="moz-txt-link-freetext" href="https://valkyrie.yocto.io/pub/non-release/20260308-104/testresults/qemuarm64-ptest/core-image-ptest-gettext/">https://valkyrie.yocto.io/pub/non-release/20260308-104/testresults/qemuarm64-ptest/core-image-ptest-gettext/</a>
<a class="moz-txt-link-freetext" href="https://valkyrie.yocto.io/pub/non-release/20260308-104/testresults/qemux86-64-ptest/core-image-ptest-gettext/">https://valkyrie.yocto.io/pub/non-release/20260308-104/testresults/qemux86-64-ptest/core-image-ptest-gettext/</a>

Can you have a look at these?</pre>
    </blockquote>
    I think the patch is my v1, and that Martin Jansa didn't bother with
    my v2 since it &quot;only improved ptests&quot;! ;-)<br>
    I've sent the v2 to Hemanth.&nbsp;<br>
    <br>
    It just adds:<br>
    <br>
    +--- a/meta/recipes-core/gettext/gettext_0.26.bb<br>
    ++++ b/meta/recipes-core/gettext/gettext_1.0.bb<br>
    +@@ -148,6 +148,7 @@ do_install_ptest() {<br>
    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mkdir -p&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    ${D}${PTEST_PATH}/tests<br>
    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mkdir -p&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    ${D}${PTEST_PATH}/src<br>
    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mkdir -p&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    ${D}${PTEST_PATH}/po<br>
    ++&nbsp; &nbsp; &nbsp; &nbsp; mkdir -p&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    ${D}${PTEST_PATH}/autotools<br>
    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mkdir -p&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    ${D}${PTEST_PATH}/misc<br>
    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mkdir -p&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    ${D}${PTEST_PATH}/its<br>
    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mkdir -p&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    ${D}${PTEST_PATH}/styles<br>
    +@@ -172,6 +173,7 @@ do_install_ptest() {<br>
    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install ${B}/gettext-runtime/src/gettext&nbsp; &nbsp; &nbsp; &nbsp;
    ${D}${PTEST_PATH}/src<br>
    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install ${B}/gettext-tools/src/.libs/cldr-plurals&nbsp;
    &nbsp;${D}${PTEST_PATH}/src<br>
    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install ${S}/gettext-tools/po/gettext-tools.pot
    ${D}${PTEST_PATH}/po<br>
    ++&nbsp; &nbsp; &nbsp; &nbsp; install ${B}/gettext-tools/autotools/*&nbsp; &nbsp; &nbsp;
    &nbsp;${D}${PTEST_PATH}/autotools<br>
    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install ${B}/gettext-tools/misc/*&nbsp; &nbsp; &nbsp;
    &nbsp;${D}${PTEST_PATH}/misc<br>
    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;find ${D}${PTEST_PATH}/ -name &quot;*.o&quot; -exec rm {} \;<br>
    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;chmod 0755 ${D}${PTEST_PATH}/tests/lang-vala
    ${D}${PTEST_PATH}/tests/plural-1
    ${D}${PTEST_PATH}/tests/xgettext-tcl-4 \<br>
    +--&nbsp;<br>
    +2.34.1<br>
    <br>
    <p>I'll retest here again for x86-64 an riscv-64 and co-ordinate
      with Hemanth if there are additional changes.</p>
    <p>../Randy</p>
    <blockquote type="cite" cite="mid:DGY200N2IVAT.31AXPCZZ9K6JG@bootlin.com">
      <pre wrap="" class="moz-quote-pre">

In some of these logs, I can also see some failures related to glib-2.0.

Thanks,
Mathieu

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------i51n4pvGi5Wfbe6N3Rn5tcIH--

