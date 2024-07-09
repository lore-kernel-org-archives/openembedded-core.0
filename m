Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287B2C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 20:28:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6090.1720556895518620268
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 13:28:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7920e2992e=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469K9q23020303
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Jul 2024 13:28:15 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4075eg2vct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 13:28:14 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 469KSEAM013510;
	Tue, 9 Jul 2024 13:28:14 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4075eg2vcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 13:28:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkEkc+yuhYpzbXVU1MZ9Sukb9ClHTe4TsIE0mzsqRvQNLx6drHY6314FeO6yPT+64njKu2oaJOK52o0pedY6PF6SxNkGAj4v74S+Etbr9Jn0On1HVAEJlnIPTrgTNVBHk4xGR98IT9iSl9u4l+D/VxSEUw2HlDGDHHZW9AcG4CywZiDo9sze4DMlR6J0cwZExXvvsgJa4U+wkDZapG/3CBA7Q0NpPB2rHXXO90zTbZhnrcdR+r435ayqcD0ePLB29RD+q6RpGKruNZFwlGS5RN2ya/iPE7xUQLtDXOWniVu33TxKrrKKf5Z7ooFB++BWZy7Fi79EJm7MSThkfUEydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLlmTSjYKup9gUrWUpX3SjOtChVDGUiQUvGB/7nnU/U=;
 b=XbT6lr1dMMg13sILs45RMrUcysjY+WyW0kn12bxxxp9K+7U2kNcMtjpQr2vvioda7+ymDzsyCGHdZ9TMcDmu1BPUunlA69bSJWr27DuX9BgY0dTXhMEUHSyj4JtpwuAUwIOvcFvZwk4PAjp4u+lbGdFl//F1fuJNM4D9BVKps4iWF1Kf8K0t7ag8/Uk7aHrqnFgB+AMoTsAXfu76VvDM3nr4HL+JMNHmdH6VORLHs15MZtqFeFOPC9hpTbm11TckTHXBobrfzkCNudTKORU93GdnGbYEsZU0k+XWbTquTYLev+E1DHX+g5y36jNaAvZ/G8obfu557lNwPJzAc6WmtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CO1PR11MB4945.namprd11.prod.outlook.com (2603:10b6:303:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 20:28:02 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%6]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 20:28:02 +0000
Content-Type: multipart/alternative;
 boundary="------------ckj553nE0zBc10gpduqbvATk"
Message-ID: <140fdc26-b2c7-41fc-a561-a96f04f7b77c@windriver.com>
Date: Tue, 9 Jul 2024 16:28:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH] llvm: Fix CVE-2024-0151
To: "steve@sakoman.com" <steve@sakoman.com>
Cc: Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com, Ross Burton <ross.burton@arm.com>,
        openembedded-core@lists.openembedded.org, Deepthi.Hemraj@windriver.com
References: <20240701123752.237702-1-Deepthi.Hemraj@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20240701123752.237702-1-Deepthi.Hemraj@windriver.com>
X-ClientProxiedBy: YT4PR01CA0448.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::22) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CO1PR11MB4945:EE_
X-MS-Office365-Filtering-Correlation-Id: a0edbd31-f3aa-4444-058f-08dca055a16c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YzRJN1hnTURxMUl0bDZ3RkMvRUt6V2lYbU9mOUZGYjVoa2ZzUWV1NFdBa0sx?=
 =?utf-8?B?SGpsTWpsWHptYStTVVdma1duK3g0N0c0ejY3UFF3R1JhTzExWFNjY2YrNHdh?=
 =?utf-8?B?dGZ2MWhpb2QwNmxqVDFiWG4zNHV3Mjc1M3QvTVhmSEhuOU8xN21qbFUyTDBC?=
 =?utf-8?B?bkErbmR5eFJlYnVzYng5VXhkcTl1QXpLM0psSkNxVWN3emtuSU5OZ3hzSFBh?=
 =?utf-8?B?Q09uR2VkUmRSMkFHOEppcEMwSmZtSDA3VXJ0Q3ozRUszeEZuOE1iUWFpdmxh?=
 =?utf-8?B?dVBta2dHUGJ2eW9iNkQ1RDFaRXJudnFFQjJUbDhPMXl3NzRkbmtJNHlDeEFx?=
 =?utf-8?B?VlFHcmRSSXowT0VzR2dSYk9rdnptVmlWTjZlZU8xVm96UzFyazM0V2VGVGpO?=
 =?utf-8?B?S2FpRXV5bW1CZDFWUW1Fb25LQ05lNjkrVzdxWkszYjhYK2JTU0Z1eXNUZ1Ir?=
 =?utf-8?B?cjUrbVFBUVpRd0VtUG1SSEdYSUk3Sk4xcEhKa0d2VVJubVg2R2JUclc2VWhx?=
 =?utf-8?B?VTBoeVZ3N21NVlNYRnVjWWZPaXdGay9oYUM1cVdGTmNpaC9tbWM0YUxmNDFV?=
 =?utf-8?B?SFpHRFhLZWJWVjkvTDV3NkVVT1ZDWjFteHIvbHJVSUUvNW9xQTBBdW05WlVw?=
 =?utf-8?B?aEpKZDM1VFZEZThMWVpqdmxGUEdNMGcyUTRGZ1IwdFJleE1qdGdOaThBamds?=
 =?utf-8?B?OElzVENJL0VsN29TdytNZUt4a3NEL1pFRzBwY0hhR1NUaU9Kc1RLUkk3dlpS?=
 =?utf-8?B?K3dRM21wOUJicGZtd2dURGhKLzlrNnVFVkFDdGJiM1E3aXBjN04rZEJHcFBw?=
 =?utf-8?B?c1NMRkYzZUlWNTNVcWdrem11MEgydU1oVmRzekFQQ2NXLzJrSWJwQmIxMUxY?=
 =?utf-8?B?U0RVLzV1QWlkT0pxNFZEOFZKeU91TTdYY0NYdlYvVThQRW5tMm0rWWIxckJp?=
 =?utf-8?B?bVBNZHdOQW1EeVdSanExdDNBU1VUQmwwUkhiUk9weEYrT294ZDR3eG9qVkxP?=
 =?utf-8?B?MEpkWW1YbzVTQmhJMUdKWVFNU1dLYmJseVU3SmZId0Y5OFhRSFczU2U5SWs4?=
 =?utf-8?B?b3o1ZEJmaWFmNWQ4ZU9YYVRkRkp2ZmlweGMrd2FoL2VvMUx0YnFGR2hOYUxr?=
 =?utf-8?B?bEVtbE5nbWVVK3VqRlBLNWdvdGpSbWlXVzZzTTBQaXg3YnZBeWk5azQxZUp2?=
 =?utf-8?B?SmNjWDhQNE5zSUkrYXNZUjV3Q3JJSDBKZElCcU5uTFZhcDVkcGhVT2F2ZjNT?=
 =?utf-8?B?N3BNdnQzUGNacUlXUVFZanZacCtzU0pEbXdycnhVVzZqbVBDeTY5Vnl5cnU2?=
 =?utf-8?B?dWY4VlpWdHpGSS91ZENDbm01RHd6amhXaUFzNmROdzhyS0U0UHdGNzUweHMv?=
 =?utf-8?B?ei9qZkZRYTI5Rkl4Zkp0aTJvUEVScTVYWVdmVUJEOU95TmFIUW1DWHdrQkVJ?=
 =?utf-8?B?V0F5Smt5OEQyK2F6WUV5SVpFYklBOFFuZHdvQ0lqa2hFODNya2FDR2JlSHB1?=
 =?utf-8?B?cUd6czg4STRHYmVOZHlzSkR1Sit0aDRhQUI2b1M1VGliTno4WHRxTFpLUm9G?=
 =?utf-8?B?TXFNbVhxRW9HQzJCSnVwMVpSZWdJK3RCZTVaSHltWldsWFcreVgxTkVUNU5S?=
 =?utf-8?B?VVVWMm55UGZzRFh1Vm9CemNCUDJ1QnhLYTZlOENQUVNEZ3hkWVFGQjE1U21X?=
 =?utf-8?B?dmE0dUhEYmlDbDkxTFE3UU41SzcwdUJTcDRaMFlBZEJPWW5tdXpmNHFveng0?=
 =?utf-8?Q?/VGTD5SU/QzmjgRmRY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bTFGb0RQQkJUTndmWStyb0poUnA1SlJTZFBEQTFFbWphbkI4bWJYRlBQeXc1?=
 =?utf-8?B?K2VTT0U4bW84aXFlYnJsd2ZTKys4WUhENU85OXpHb3JCVTgwYmNjRWV4T0Zh?=
 =?utf-8?B?SlB6Q3dpclpKWGd4dXY4Y09YYkRsS0c4REd0eWtyYnQvbWdZcnpnaUwzWUZB?=
 =?utf-8?B?S2JDcVNyVUlYUVNBNEltZzd6NEE1aEJZVm4wZW9wWWJDMFNhNmcyVTViQmVM?=
 =?utf-8?B?R2hMVCsrUHdkODZZYkVPcWFSRUJodkl4OWxnK3pySEEzUDdyb25STEpYVUxU?=
 =?utf-8?B?OG9BbHd5alY1WjdpWVlDalIxREhPNWdUbDliaCtrZk5PNEZiN2J1VUd3RGVq?=
 =?utf-8?B?L3JLS2wyQ1FiZy9IYThSZFFHRm1jVnU4Y0tJRFJXaVNDcVZZbWFFcDZSVVRn?=
 =?utf-8?B?VXBRYURjWXU5Uk5xS3BhZjFjblJHSVh5NHVDUjJ1cHpQMVBzUWNGb0UxdVVX?=
 =?utf-8?B?UStiRDRGMlVLOG01USsvYjc1QVZnQlMwS3BkL1FYa3pLUFl4R3htL1Y3WUVo?=
 =?utf-8?B?d21kWmdRQ015QytrU1ZITXRzR0RyeHZ1QnJtQ2doNGhnU3FzdzNIZ0FhRlNT?=
 =?utf-8?B?aERxbFQyWVlOWWJDQll6K1RWeXdqRkJVTEs1ck9WUnVuL20yZVFoR2VPTnRK?=
 =?utf-8?B?WjdjN1F1MHllc0Y1WHNhcUROT3k2NDBaMDN3M3RWWVZGWkx4U0lWVU1LK2Jh?=
 =?utf-8?B?WW9nRnZoVlFhamVUcSt2cU9OYXZGU3FEMG52K1NmSHA0cVJYakdCcmF6UHBR?=
 =?utf-8?B?OWJ6UmFHcklkamxMY2VXN2lOdnBHMVhLUzNSU2xGL1lzOVRKK0VBN0VOSHM0?=
 =?utf-8?B?RkV2Mlk2UFVZUUNNMENlWUtmOGtabUZSVldMdklGd0xERWtDNTVianJYS24z?=
 =?utf-8?B?RjJ0RE95Yzg1NFBhUDNhQmFKSHQyNThTaUFkM2dueWxQUFcwOWhZT0ZyTVVt?=
 =?utf-8?B?ZlBzN2t0M3JnL1FZKzJqZ0F3UFllWkZGTTRZem5DL1Y2RjRUL1JRem5IaEtG?=
 =?utf-8?B?YXN6aGEwcW1TZXJ6Z290Y0M5Y3UwREJRbE1waDdOUkFjUmZjdDA2a2tjWjZt?=
 =?utf-8?B?QUxqeldJYVJSR0JJMmplcE9LNHNFVHZYQ2hiMFgrTTlYM2g5ZHMzQU5uaHBk?=
 =?utf-8?B?Sy9OQmgxSTdYcnFIdE1KdEFPTE5XR21HK3ozY1o5WjlBd0VJZ2YzWGFUblUz?=
 =?utf-8?B?N3pFSXhPM1hNblpmSElWN1dNcFk3N1lqMzdQaWh2VWNQQkZ6bmg0ckk0a2Vv?=
 =?utf-8?B?UlZybXlwWGhtMERYRUo0QWJCQVRxRmEwcUc3V29QVkN0cElWbHVPQnpzSmpr?=
 =?utf-8?B?RmYrOXRGaDc2M0xNa1hXdjZ4a0dabEZLdUF6aEF2ZmpVOXc4UlhFMTNTMitl?=
 =?utf-8?B?R0FMbjRSd3RnWnlTRDJQZlhVWnhucm5oTXVIaExnMW5xTWw5Vm12NnFwYzZY?=
 =?utf-8?B?RGt6U0tRT0dGUElxMmU5YTZEdTQwdkZVQ0NQMWJFcWIzcCtNQm13NStIZFB6?=
 =?utf-8?B?aEhiVXI4V3RkSHVualg0UVBMNzY1Z2FqNTVYK014YVF3TkdDNVJPMnA1cEt2?=
 =?utf-8?B?RW9kSTRTbTFPcEh2Nk9ZQkcxcUZmYm03MEM3RUF6T3A2U0FuZEY2NC80K3J4?=
 =?utf-8?B?cTc4aDZOMU5PWWFDdVFzUWttN0hoTVJ5d0UzMGU1Rm5lWTRXWktXRU5jQStQ?=
 =?utf-8?B?NU54ekpsKzlLU3VyR1ErSEd1VnhDYUkxbXp4ZmlsZmxDMjM5ZjVwSDhjeGp0?=
 =?utf-8?B?cUF6dHJwaXRuSFVlQ0plUXFLekcvT1EwSVlwdEY4VTk1QWlMUTJYWG8zNmRI?=
 =?utf-8?B?elpMMFpqUitTRnhUelUwcmlxTjlzMGNWcWhTcEw5T3NGZlkzZFgzRkJxS1dn?=
 =?utf-8?B?Mm91RWhRbCtOdmRrR0dBajJtZXhtT0h3OVB5Ty9MbnhRcTlYc2tvNjRXcmg5?=
 =?utf-8?B?WmFvK1RNY2xUb1htZGpIUTQ0VVpScUVqT3FVSHQzVDdlWVV3UjlGb1VRYVBF?=
 =?utf-8?B?d3RkYWdNWFBpNjZNZ1ZqbHhiaXFTYkcrTTdEekNTVmsweGxOZVpsNy9KTFdy?=
 =?utf-8?B?VkR0MXpXSVIxejFLN1h4NzhMVzd5RHU3TUxFQk1MellHc2xhOFNDSlMvWHJT?=
 =?utf-8?B?c0NjdVZ1OWErSmZqL0RFQ3djbWI4NVB6eEtobUhrS29SczFOeFdnQmRuQzNC?=
 =?utf-8?B?SkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0edbd31-f3aa-4444-058f-08dca055a16c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 20:28:02.2469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RxWqKb0t4OptrCRAyIDbTNbJmGUHBrmRSLcTY7l0HHeGmQ6nyXeElZXYs3yBtM2WyFQFbeNFUNcGcmESv+RESVLX/3vub8CwhWlwNMJ2k4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
X-Proofpoint-GUID: 8WsUXVfAXb7POaO5jqygYwnQz-fEFyeQ
X-Proofpoint-ORIG-GUID: CRw7JPIxL2nfZMxbQPhdJGtSjES0WF1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_09,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407090139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 20:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201683

--------------ckj553nE0zBc10gpduqbvATk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-07-01 8:37 a.m., Deepthi.Hemraj@windriver.com wrote:
> From: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>
> Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
> ---
>   .../llvm/0002-llvm-Fix-CVE-2024-0151.patch    | 1086 +++++++++++++++++
>   meta/recipes-devtools/llvm/llvm_18.1.5.bb     |    1 +
>   2 files changed, 1087 insertions(+)
>   create mode 100644 meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-2024-0151.patch
>
> diff --git a/meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-2024-0151.patch b/meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-2024-0151.patch
> new file mode 100644
> index 0000000000..0b8338d35b
> --- /dev/null
> +++ b/meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-2024-0151.patch
> @@ -0,0 +1,1086 @@
> +commit 78ff617d3f573fb3a9b2fef180fa0fd43d5584ea
> +Author: Lucas Duarte Prates<lucas.prates@arm.com>
> +Date:   Thu Jun 20 10:22:01 2024 +0100
> +
> +    [ARM] CMSE security mitigation on function arguments and returned values (#89944)
> +
> +    The ABI mandates two things related to function calls:
> +     - Function arguments must be sign- or zero-extended to the register
> +       size by the caller.
> +     - Return values must be sign- or zero-extended to the register size by
> +       the callee.
> +
> +    As consequence, callees can assume that function arguments have been
> +    extended and so can callers with regards to return values.
> +
> +    Here lies the problem: Nonsecure code might deliberately ignore this
> +    mandate with the intent of attempting an exploit. It might try to pass
> +    values that lie outside the expected type's value range in order to
> +    trigger undefined behaviour, e.g. out of bounds access.
> +
> +    With the mitigation implemented, Secure code always performs extension
> +    of values passed by Nonsecure code.
> +
> +    This addresses the vulnerability described in CVE-2024-0151.

Hi Steve,

I see that this was queued to your -next branch but isn't merged yet:
https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

I'm not too concerned about the patch but I have a question about test 
coverage
that hopefully won't take up too much of everyone's time.

As you can see from:

https://nvd.nist.gov/vuln/detail/CVE-2024-0151

"Insufficient argument checking in Secure state Entry functions in 
software using
Cortex-M Security Extensions (CMSE), ... "

this CVE only affects systems using Cortex-M Security Extensions.

I don't think Deepthi did any run-time testing that would run code in 
this mode but
I'm not very familiar with such things.

Do we have any tests that would allow us to say that the patch at least 
runs successfully?

I suppose we can take it on trust that it's an improvement and that 
anyone who is using
such an environment can report problems.

Thanks,

../Randy



-- 
# Randy MacLeod
# Wind River Linux

--------------ckj553nE0zBc10gpduqbvATk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-07-01 8:37 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:Deepthi.Hemraj@windriver.com">Deepthi.Hemraj@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240701123752.237702-1-Deepthi.Hemraj@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Deepthi Hemraj <a class="moz-txt-link-rfc2396E" href="mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>

Signed-off-by: Deepthi Hemraj <a class="moz-txt-link-rfc2396E" href="mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>
---
 .../llvm/0002-llvm-Fix-CVE-2024-0151.patch    | 1086 +++++++++++++++++
 meta/recipes-devtools/llvm/llvm_18.1.5.bb     |    1 +
 2 files changed, 1087 insertions(+)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-2024-0151.patch

diff --git a/meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-2024-0151.patch b/meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-2024-0151.patch
new file mode 100644
index 0000000000..0b8338d35b
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-2024-0151.patch
@@ -0,0 +1,1086 @@
+commit 78ff617d3f573fb3a9b2fef180fa0fd43d5584ea
+Author: Lucas Duarte Prates <a class="moz-txt-link-rfc2396E" href="mailto:lucas.prates@arm.com">&lt;lucas.prates@arm.com&gt;</a>
+Date:   Thu Jun 20 10:22:01 2024 +0100
+
+    [ARM] CMSE security mitigation on function arguments and returned values (#89944)
+
+    The ABI mandates two things related to function calls:
+     - Function arguments must be sign- or zero-extended to the register
+       size by the caller.
+     - Return values must be sign- or zero-extended to the register size by
+       the callee.
+
+    As consequence, callees can assume that function arguments have been
+    extended and so can callers with regards to return values.
+
+    Here lies the problem: Nonsecure code might deliberately ignore this
+    mandate with the intent of attempting an exploit. It might try to pass
+    values that lie outside the expected type's value range in order to
+    trigger undefined behaviour, e.g. out of bounds access.
+
+    With the mitigation implemented, Secure code always performs extension
+    of values passed by Nonsecure code.
+
+    This addresses the vulnerability described in CVE-2024-0151.</pre>
    </blockquote>
    <p>Hi Steve,</p>
    <p>I see that this was queued to your -next branch but isn't merged
      yet:<br>
      &nbsp;&nbsp;
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next">https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next</a></p>
    <p>I'm not too concerned about the patch but I have a question about
      test coverage<br>
      that hopefully won't take up too much of everyone's time.<br>
    </p>
    <p>As you can see from:<br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://nvd.nist.gov/vuln/detail/CVE-2024-0151">https://nvd.nist.gov/vuln/detail/CVE-2024-0151</a><br>
    </p>
    <p>&quot;Insufficient argument checking in Secure state Entry functions
      in software using <br>
      Cortex-M Security Extensions (CMSE), ... &quot;<br>
    </p>
    <p>this CVE only affects systems using Cortex-M Security Extensions.<br>
      <br>
      I don't think Deepthi did any run-time testing that would run code
      in this mode but<br>
      I'm not very familiar with such things.<br>
      <br>
      Do we have any tests that would allow us to say that the patch at
      least runs successfully?<br>
      <br>
      I suppose we can take it on trust that it's an improvement and
      that anyone who is using <br>
      such an environment can report problems.</p>
    <p>Thanks,<br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <br>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------ckj553nE0zBc10gpduqbvATk--

