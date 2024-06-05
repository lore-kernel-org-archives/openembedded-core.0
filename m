Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49794C25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 16:03:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.19630.1717603426449623141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jun 2024 09:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=68866e7383=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4556u28e012962
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Jun 2024 09:03:46 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yg35f3ywd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 09:03:45 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 455G3j2R012009;
	Wed, 5 Jun 2024 09:03:45 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yg35f3ywc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 09:03:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAaGoZm121BYIVPUmFJCA2Orty2y4JuRAv43fw1FPuW5tt5bOk3eBi1l5MDGvA+7Rf8as87Lcc18V5xmhuwAWzIGYYYQX0duJN+nTcrqjsoa74zCvx4IDrhBEd3IyxwwHxpLLEN3GI81DgS5eTB5XuQ4NGAC4hOiCjUPFwsx83EapNuKZSrmvvaKKJnxXhbF4F8G256KIQNC1ppU6g4rXtynRapEO/+s8uoS6AtMQ7JICEh5NNtX65yqxuiDBB6R447XhLQh0/rlH3TZAaBXDMUqD1x+M99JVmst3RWJGMtsBTA7KzVhWyGSAvFmfbpZPazlwNbXJdwLV1jfsiYbwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGDvWbwhHu0TmCbT5TVdPY9JocdXKcrVzJU4o4R4ZxM=;
 b=jZND4/JMYy/5JAidvAKpj7Tz7uWK5U96Uj25+ECxI07KvL5VwCYjnH/THLfo6oUUCz29vKkRsM/USVUKzSg8SZgLo5ALe3QmVvQrfu/4+k4J0yZ5anUS9FrBtZBUvntp9Nyg21KzqGziLKpGUqMww6w6rxprOkTzvEzLUd4L7Ult4hd+GQMSm9CNsGu7xoUOXOevYlVbxBpkcmYrWLEoF5qHXqOIBayRd78gZfR7Oy8SqE4ZAvXXI+P5H0Gqgdz6NTDDcD0HvqgNY6o+eHLUYuzbzI8eFngTOidP0h0wZ5X6IhtcmsDj3jB/KUWhQocpmRgW7Y2Uke9CxIVTdzd7Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SN7PR11MB8262.namprd11.prod.outlook.com (2603:10b6:806:26e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Wed, 5 Jun
 2024 16:03:35 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%3]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 16:03:35 +0000
Content-Type: multipart/alternative;
 boundary="------------PbYueegfkCkQC0OdeRZ7b9g9"
Message-ID: <bcfc7bb9-fdb8-4dd8-841b-3266f354ed51@windriver.com>
Date: Wed, 5 Jun 2024 12:03:32 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH V2] gcc : upgrade to v13.3
To: Steve Sakoman <steve@sakoman.com>
Cc: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org
References: <20240605143945.405558-1-Deepthi.Hemraj@windriver.com>
 <18618.1717599402117239778@lists.openembedded.org>
 <86ffc957-8b91-48d9-afc9-629b0e1dcaad@windriver.com>
 <CAOSpxdaNze=WcFwW_6A=o7-HN85bW9wuONgJtPpQyzcPVYx66A@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAOSpxdaNze=WcFwW_6A=o7-HN85bW9wuONgJtPpQyzcPVYx66A@mail.gmail.com>
X-ClientProxiedBy: QB1P288CA0025.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::38) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SN7PR11MB8262:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bd6a042-042f-4dc2-f84a-08dc85790dd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ekhlTXVPRVREQnZnT3FwSnlRVnZrdUl1ZCtPS0xxSCtMSU9zcDlPbUR2UTBC?=
 =?utf-8?B?U0h5c1JhWFM3NENqaDFkV09zOEFQWitTbWVSb3FnZytqeW1nSDRaR3RPbWFT?=
 =?utf-8?B?RlNSaVlacVpiZ1BVYUUwa1dETmMvOUcreERncklldmNzcUpGN1J6REtvcjZj?=
 =?utf-8?B?d2xBNktxYTN6c1ZpRkU1MUU0UVBVc0pZV2UzNHRCbmsyRTRQSVhlS25CT3RW?=
 =?utf-8?B?UFlPL1J1d3d4US85c1Jha0NCVGdQQmZ1VGVyTU5LVWVVVXNzVFppYW1TWDR3?=
 =?utf-8?B?cmJBSVk5VWsyZUJqN0oxYytDbG5kM2xDa0lkaDg2b3NWOEEyOTI5NjhvajBW?=
 =?utf-8?B?cFppR1pwQWxWUnEyU00yc0FhZjNNeU1YbXhCZ2gyclNITEsrZkk5L3N6bFQ1?=
 =?utf-8?B?UTE2eGxhcjdUTlBxYmJvQkY4K09HRHFoalY4UXUyWGNwS3crR1FCazZOSUJo?=
 =?utf-8?B?aCtIOU9uT28zRU5yNVdJM2x1dnA3SEY0S1YwejV5Y3kvMnpsODZNZU1OZkdu?=
 =?utf-8?B?YkxVaXJJTzZvUVpIUzVrbEhtVGpJY1NCdkVEaVlGeS9pTEwram9NQlVOTS82?=
 =?utf-8?B?U3BjRjhUU0grRXMzcEgrZGxydE9vSkVQYTlLV01abWFocUdZZTBhc1JLZmha?=
 =?utf-8?B?MVlkcnRTTEkwUFcwSzV2OXFzelFmMzBLeWJmZjUzMzhSMUd6RmE5WXpzZWZO?=
 =?utf-8?B?bHBUTkhoT3J3cjhQTk1CcnVsOG1GTzB6aUFiWG5wZ2lSV3JFOGdVUGorY2Iw?=
 =?utf-8?B?bFovdWI0SDh6d2RhdnV1c1lxbDZzcHlDaHQzU05ZYWVkNG1SZW9Kb0lPN21o?=
 =?utf-8?B?NkQyYm1WaGRFb016eFlKbE5WZWZXMWZWMWlzSmRieVRqMEp0cVJGQ0gvTkpZ?=
 =?utf-8?B?cW5wR254WTQ5bC8wQjd4RGlnbllGY3NDK3ZrRURaZVE5bEJ4QzJFd1l4Z3lE?=
 =?utf-8?B?U3Z3bnlFcEVDek00RDZkdnhCbU5ZU01CUkdSSzRHbTZmbTFZZkdraWxHcmFz?=
 =?utf-8?B?VG5kVC8xSzQ2VHNkaXZUblJFc1JSKzNBelNxQ1RlSlloSjE2czhzRXliMnFj?=
 =?utf-8?B?M0hzQXZGRzBPWDBMY08rd3lwV0xiKys3UUtPa3pMZ1pEaU8yM3dGQTREdkV0?=
 =?utf-8?B?aHdmYkNGTWdUeE9nVmxKbGNsRkVReERvN1pIVVlqMzF2bUJRaUxXbkE3V1JX?=
 =?utf-8?B?Y2lLOHQzOGZmSm9vRUNPQnFqdHRJcHdCN04rV0lHZmJTQTRucE9YemxORUFE?=
 =?utf-8?B?Vi9kSmlsNjZNdEc0M3JTZ2RRM1U3OHV3SStoRDNKM2FmZVBiZFMxRzBxa21W?=
 =?utf-8?B?ZFUvUitQKzZ1OE1YbWlubWZvQTJHZDZmVCs1dFVSUzk0cDlLTDFzWEUrbkZl?=
 =?utf-8?B?b1hJMVcyK1dGakNlRCttcVNYRVRGVCtYek0wWkhoTGtQTFVEdjFKMU5KdFNP?=
 =?utf-8?B?UFFNTWVZalJ4MkRtOHV1ZGxXRlk3Y1RyM1V1eUFGOVArM2JWSlMxT0laM1NP?=
 =?utf-8?B?MU1HS3g1YVBYaW03bHNJRVVyN2RCOFg2SGRKSjdrdW1HYndHaXpKc3hTY3Ux?=
 =?utf-8?B?dDg0VE9ZLzlLeVFYK0xZNGlnTHYzclh0Sml5Zjl1VU5pdmFlbVdLOU50ZHFZ?=
 =?utf-8?B?TkxaVkVBaWw1SHRPRDFNMTRNM2lZTXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V1ZaZmtZTUQ4U3RndFJFaDJoK2tTai9WelptVzFpVnZ2QWVCNTdFcjVjR0Jl?=
 =?utf-8?B?U05CVVhiNWVnekpvK2ROdlErVkR4c2xadmV0NmgwKzFmSzNGL2Rxc2RrRXVM?=
 =?utf-8?B?Zit2cG1mbnQxS3hEUmZvcHgzd3JWdkdJUVY4QmlvcnZuNkw1Q3o1UkhudG1i?=
 =?utf-8?B?MlZQK0ZtSy91ZE9ya25zOXpyNmh3YVJwWE9iWlJOeUx3QTVjOHMzTlJuUHdT?=
 =?utf-8?B?TE1SeXNUZHBBMmxzOWF6Mk5OUmc3Vi9Hd2dKTkVUYkJIbGI4emZhdk5DSnFk?=
 =?utf-8?B?aWg3TmpZTGhoWk5JLzkwQVdIME1vSEwwRldTUSswME0vNUVUQmMrMTBIVG1x?=
 =?utf-8?B?eGhPZTVkaFBSTVFFN0FyZm9PaUhyQ3NyNFp6aURwTHByb1pRR2VJbVBXTzVp?=
 =?utf-8?B?ZWlubGlmUU1jRkFjRU1NSytEY2lDTmdpVDQxeXArL1gwVVZJTWlZUVdCYTFu?=
 =?utf-8?B?bzl5bkZjV05DcllZdTgxbzFWN09ZLzNqV3lseDFoalh2NjZINGsxSWxlMG9t?=
 =?utf-8?B?bkFrcUJCVTgxeVNKRjdWSnBTMEI1dFJMa2ZqNDBQSEdLcDJieHhlRjNTck9u?=
 =?utf-8?B?NFc4Z2xXQ01UWXRaallvMjYrV1JZZmpPTWdNc3c2Y1BUUDdPTjV3eiswS2JJ?=
 =?utf-8?B?M3lxT0t1Q1VwVWJaczBSVWM0Uk9TaXVMWkIwUll5KzhWUkZITXNqaUNBQVRs?=
 =?utf-8?B?TUYzTkhJVTdLNjVBWU9jYlFZQlBaSnlUR2pldVVpZnpGRERweUFZOFM4Nmxv?=
 =?utf-8?B?MW0wWm1SYkF6aXdURHRxUFVKWVVhRy9KbWVoVHQ2ZkwvRXRrWVVzQ2VOc3pt?=
 =?utf-8?B?ZUhCU2NLRGJZcENHL0wyNHNWV0lIRWxUNXFiTURmK2JnOUI1NXVlZC9OS3Zl?=
 =?utf-8?B?NzBZRitzRkpvOGZqcWpCWWorK2ZHbk1VUWgrWmdMUVJ2blAwUWtucW03M3dw?=
 =?utf-8?B?K0o1Nnl2MzdrWWlVTlRkYXNnSlN5eDJ1d1liQVpmbDFYRGZiT1lSbVZsdFdt?=
 =?utf-8?B?NlZJSncyVjN4Z2wwajdJNjhuNHNudXVQSlBkZThwR243RndrM0ZnK1phWm01?=
 =?utf-8?B?MHAvelVvV3FCVkg3cGFPSUR1c2M3UnBGam5TWUl1UU9tU1ZkZW1HRGNPV1BU?=
 =?utf-8?B?Y2JaNk9yUVk0dW1ZcWlwVVNUT1F6cVMzQklUZmsyb0tqTWdQOG4vRlQwU1cz?=
 =?utf-8?B?aFQ3OHUwQWJNNzhFNS8rSjYxalRQcHpqVjNMbVh0cmVoNDlER0w3OSs4R0FS?=
 =?utf-8?B?bERsUzV0NWNvZUw3UFFmWHEydGl3RG5hV1NqSVg2cEkxcnVOdGJWdDNhdDFG?=
 =?utf-8?B?Ylhnc0dSekdWUmt6QjQ4dXFEUzM4ZVAwRjIwVTQ3c3M3RTEwSHVtam45eHRV?=
 =?utf-8?B?cC9iQTRjSHFvLy9WdnpFMkREamVDUzZGcm5yWlJOWURXQWI3cVpkZ1Nvend6?=
 =?utf-8?B?RlY3Y0xTTzVvZlJvQysrUEt4WkFOU1pKVi9Ta25OcVV5a1dWaDRNT3RDV2lK?=
 =?utf-8?B?enZkaFo5N2dvRjlLOU1PRmtXVWU0SEVlNGNWQ3lXTFhzZDZ1TkQyL29jaU90?=
 =?utf-8?B?UjNKTkdRRmU3aHVoSHp6SmY4THR2ZUM4WC9zVi9JMUMya0Jhd2VOTzVIS0tm?=
 =?utf-8?B?NHhFMkh2V0xtbW02NzRHNVdXVDFhRE5TcU53TStaOUQya3p0ODdSWFhSS3pa?=
 =?utf-8?B?Ujg5eGUrR2piVzR1NytFUnYxb04rdWJsSHEwWHBNSG9BU051UitnY0Jrb3g1?=
 =?utf-8?B?cjRicHA1MXhEdU11WWFNWEQwOVZZL2RrblNyc090cHE4bzNJY1VIVGNQcWRN?=
 =?utf-8?B?M3NBcWpFSTRnZnRxSVRQTzJob3Yzd09VTVJLTGgwbXZGV0NXRXhldEUyNEpC?=
 =?utf-8?B?d1NXMGp5OEdlNDgyVkNjMmlaVVAxdXRPNU52aFpkN0pFOGhUWEU3WE9RVmlZ?=
 =?utf-8?B?NThVcVJCejJYLzQ3bW1KbkNIbW9NejhtRzA3SkhuY0xRZHQ0RW5vWGtGaGVs?=
 =?utf-8?B?RTZvRUV3VlFpMkNtVUZQc0ExejhLRW96QjEyRjhXK20rNkMyd1F4S0ZYYzlu?=
 =?utf-8?B?bXdWTjBHZTk3c01OKzBQY01HNmE0elpGVi9NT0VrN3ZaSWF3TzI4WElWSDY0?=
 =?utf-8?B?WFdhcXZtZ210dUhrNFo3SWNCaUJHOURmYjVYNkVRTEo1N2dQL3ppbUIvV20z?=
 =?utf-8?B?N3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd6a042-042f-4dc2-f84a-08dc85790dd3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 16:03:35.0459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WlrOR06ZqhmfJV8mHvloprwz7LZIQK3opDfRu5RXL8PgxDfL0LQVoCsI3qtuhWr7y1lGrF2BliLm6IGPF730HKVkzRCk+NvJgRSfVpAt0x8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8262
X-Proofpoint-GUID: wiDJPHqEOEgfJlysjaBy5DF1GaDDIQsS
X-Proofpoint-ORIG-GUID: RjKaWB7xxaKrY-g27_qfMyYHxfAdWIz2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 mlxscore=0 phishscore=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406050121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 16:03:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200375

--------------PbYueegfkCkQC0OdeRZ7b9g9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-06-05 11:49 a.m., Steve Sakoman wrote:
> I had no issues applying the patch when taken from patchworks,
Huh, that's odd.
Thunderbird and my email delivery chain doesn't usually mangle patches.

Looking at:

https://patchwork.yoctoproject.org/project/oe-core/patch/20240605143945.405558-1-Deepthi.Hemraj@windriver.com/

and downloading the patch by clicking on the 'mbox' option in the top 
right, worked for me too.

Bloody email line wrapping!


I guess I'll be using patchwork from now on.
Thanks for the reply Steve.


>   only at
> build time when applying the CVE-2024-0151 patch:
>
> CmdError('quilt --quiltrc
> TOPDIR/tmp/work-shared/gcc-13.3.0-r0/recipe-sysroot-native/etc/quiltrc
> push', 0, 'stdout: Applying patch CVE-2024-0151.patch
> patching file gcc/config/arm/arm.cc
> Hunk #1 succeeded at 19157 with fuzz 2 (offset -53 lines).
> Hunk #2 succeeded at 23668 with fuzz 2 (offset -8 lines).
> The next patch would create the file
> gcc/testsuite/gcc.target/arm/cmse/extend-param.c,
> which already exists!  Applying it anyway.
> patching file gcc/testsuite/gcc.target/arm/cmse/extend-param.c
> Hunk #1 FAILED at 1.
> 1 out of 1 hunk FAILED -- rejects in file
> gcc/testsuite/gcc.target/arm/cmse/extend-param.c
> The next patch would create the file
> gcc/testsuite/gcc.target/arm/cmse/extend-return.c,
> which already exists!  Applying it anyway.
> patching file gcc/testsuite/gcc.target/arm/cmse/extend-return.c
> Hunk #1 FAILED at 1.
> 1 out of 1 hunk FAILED -- rejects in file
> gcc/testsuite/gcc.target/arm/cmse/extend-return.c
> Patch CVE-2024-0151.patch can be reverse-applied
>
> So I suspect that V3 of the patch needs to also remove
> CVE-2024-0151.patch, since the version bump seems to include the fix.

and documented in the commit log!

../Randy

>
> Steve


-- 
# Randy MacLeod
# Wind River Linux

--------------PbYueegfkCkQC0OdeRZ7b9g9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-06-05 11:49 a.m., Steve Sakoman
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAOSpxdaNze=WcFwW_6A=o7-HN85bW9wuONgJtPpQyzcPVYx66A@mail.gmail.com">
      <pre>I had no issues applying the patch when taken from patchworks,</pre>
    </blockquote>
    Huh, that's odd. <br>
    Thunderbird and my email delivery chain doesn't usually mangle
    patches.
    <p>Looking at:<br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://patchwork.yoctoproject.org/project/oe-core/patch/20240605143945.405558-1-Deepthi.Hemraj@windriver.com/">https://patchwork.yoctoproject.org/project/oe-core/patch/20240605143945.405558-1-Deepthi.Hemraj@windriver.com/</a></p>
    <p>and downloading the patch by clicking on the 'mbox' option in the
      top right, worked for me too.</p>
    <p>Bloody email line wrapping!<br>
    </p>
    <p><br>
    </p>
    <p>I guess I'll be using patchwork from now on.<br>
      Thanks for the reply Steve.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CAOSpxdaNze=WcFwW_6A=o7-HN85bW9wuONgJtPpQyzcPVYx66A@mail.gmail.com">
      <pre> only at
build time when applying the CVE-2024-0151 patch:

CmdError('quilt --quiltrc
TOPDIR/tmp/work-shared/gcc-13.3.0-r0/recipe-sysroot-native/etc/quiltrc
push', 0, 'stdout: Applying patch CVE-2024-0151.patch
patching file gcc/config/arm/arm.cc
Hunk #1 succeeded at 19157 with fuzz 2 (offset -53 lines).
Hunk #2 succeeded at 23668 with fuzz 2 (offset -8 lines).
The next patch would create the file
gcc/testsuite/gcc.target/arm/cmse/extend-param.c,
which already exists!  Applying it anyway.
patching file gcc/testsuite/gcc.target/arm/cmse/extend-param.c
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file
gcc/testsuite/gcc.target/arm/cmse/extend-param.c
The next patch would create the file
gcc/testsuite/gcc.target/arm/cmse/extend-return.c,
which already exists!  Applying it anyway.
patching file gcc/testsuite/gcc.target/arm/cmse/extend-return.c
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file
gcc/testsuite/gcc.target/arm/cmse/extend-return.c
Patch CVE-2024-0151.patch can be reverse-applied

So I suspect that V3 of the patch needs to also remove
CVE-2024-0151.patch, since the version bump seems to include the fix.</pre>
    </blockquote>
    <p>and documented in the commit log! <br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:CAOSpxdaNze=WcFwW_6A=o7-HN85bW9wuONgJtPpQyzcPVYx66A@mail.gmail.com">
      <pre>

Steve</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------PbYueegfkCkQC0OdeRZ7b9g9--

