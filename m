Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02256C27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 21:42:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.71149.1718660570530845700
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 14:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=689898b718=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HJj2rE031638
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 14:42:50 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ys682j39d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 14:42:49 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45HLgnoH032426;
	Mon, 17 Jun 2024 14:42:49 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ys682j39c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 14:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFkfEDMUmumkGpYaIora069mu4JShvAG2c+UBMVpwqRajTxwLsWWDi0BF8s9EBa9ql6XnmGiaacIZfoatSVwmvK9D+FpZF2ywzWmXZP2kEpi+7765oPh9XcSi6hfqwqi3PrCA1oqIU0pMoloxH0f3aQqQNnZiYgucbV8VyVICs3p6djGD7122OqfQsLU5016okRBJsVS0Rv012yYUwS8abBM6egLvHmTQfFkD30WHPM6Wgcy7SBMOVCTDlD1lVxaEVCNrsMCD4TsyjJMcjHAKPF/exFJwQasHPUiRDygKVyDYY6pIRWcxedupYPSB0b9cFLrkE3qmtl0mS2zYvBCXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58eeBYpkWPoO3Jq3zVSSQW9EItY380w3kDaDUOTYI2E=;
 b=dkip+1MiCqO8WQ2hJafOFil5p78JYaeh+f0npRWMDNJmYD94BE+JmIA9+B/U0TDJjh+7z6EW3nsTNt7uwwO69/OLE0tczkO2o9OwuSpTUgtQpwVN46YlkTObED0thWVKECLQPbOUCfSF2ms0NQ0Ueu3B20MQCaeaXeXB6+PwL50H2UdUdkisKC4NM79yiWrwtH6ps4ULUxRTMkNjwPNr4Iu9FM6WR5oybttDSAF/0sf/l7CB7dZJ141/Em1PFXnUFUCk+crQTCXJHp86zEwjtAAAIaJYGybD1nXKWdGeR6LrHsOXCyeIqJwT5QV7wxpQXJquVvV/xJuKymwTh+K07g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CH3PR11MB8186.namprd11.prod.outlook.com (2603:10b6:610:15a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 21:42:37 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 21:42:36 +0000
Content-Type: multipart/alternative;
 boundary="------------RJLlAnzRJMnvaI7M2xL0ttYu"
Message-ID: <9ca83d43-f53f-465d-9a4e-6fa1df2d4b9c@windriver.com>
Date: Mon, 17 Jun 2024 17:42:34 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH] dpkg: upgrade 1.21.4 -> 1.21.22
To: steve@sakoman.com, yi.zhao@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org,
        Ross Burton <ross.burton@arm.com>
References: <20240606033233.2634220-1-yi.zhao@windriver.com>
 <CAOSpxdZ_U3=ot4HZtqph3U2RN3e7bK+PgHdmwzB_WG8JxuQn8g@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAOSpxdZ_U3=ot4HZtqph3U2RN3e7bK+PgHdmwzB_WG8JxuQn8g@mail.gmail.com>
X-ClientProxiedBy: YT4PR01CA0321.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::15) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CH3PR11MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d435e49-ca5f-4c43-611c-08dc8f166763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|4022899006|366013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cktYQ0dNM3RNajVGa3IrbnRuYlNyS202WUlUdTRaRUQ4Tk5KYjBsOXNFbzFG?=
 =?utf-8?B?ak9jbDR2ZTczdjN5ak9jeGZWT2pTQ256WW9qVWc2V0kydEpJOUQwdktkRjFX?=
 =?utf-8?B?SnFjU2ZSaURhbEs2c0NKRmN0SHJPRDhFUEtBbUhPd0U0L2cwbHRWcE9WM1p5?=
 =?utf-8?B?aUQxYUcwT3ZKRlZvdHJmOVZVUWdBSk5MQnltRTNiS2JmMUVuWGxvdlQwV3RQ?=
 =?utf-8?B?cHlnbWJXbnJ6RHZ5VVUrU3NTcWdvblJ2NlNSTTArbHYzdzROcEVGLzBLeGpM?=
 =?utf-8?B?VWpVOVZZTFQ0V2trb0pqYkRsQUFKd2Zjbm9FRFlSSVgwNDhOMElHKzlaNk01?=
 =?utf-8?B?Wks2K3JKVy9Cc3JBeFAyRmJIYlc0ZWlmVzd0bTNrRmN6SEZNcFFWYlZSdjNQ?=
 =?utf-8?B?dzAwblhaNTZla1JtK1hYUFlMT1BodUNxeU96RHNGWlYyR0RIMmxRdHZXNzY2?=
 =?utf-8?B?UmluNm5heHNNS3N3T09wMnZwRjVSeENaU2o0SFhQT0hqYWZFZjZFa0swTURm?=
 =?utf-8?B?YVVHcWZsc01LUVZPSUZWdldVbHlpNU1iVzlrU21PNy9EejVUWXMvbkxHRjBq?=
 =?utf-8?B?Q3VaM0hyTHJ3R09FR1Y4V2xlSnFFeXdQRFBjQVgwMVBMYThPMEdudExnajBa?=
 =?utf-8?B?Q29uVC9OWms2T0cvR1hVSXUxVkdqLzJvNGRqUUM3MDU2Rm45ZnJteEFDakll?=
 =?utf-8?B?Ymw5cGRZUUNNM0poejh0QTQxbU9sOVZraWdrN213cWNQZzZzS1NmdS84TjFh?=
 =?utf-8?B?ZkdkWjFrN1lRU3dMVnFCOHV0RitydUVidE1GNWpGWm04MFQ2NU94VXk4NTJK?=
 =?utf-8?B?Lzc3L3BjR3JNd0xJb0tjUG9vTjRMbWVOUkJDZENRd3hyT1VHMFFuclU4QXpR?=
 =?utf-8?B?cFJ0MEtiVS9hZnozSGo3Y3pmL0VKemQrWGdGejkwMDloWTJWU2RCMURQV01h?=
 =?utf-8?B?QlZ3OWpzUHZhdk9OYlF1Q2llTTdGRzlvVHNpeU9PSVBncngxVW1WN05IS0xv?=
 =?utf-8?B?N1JsdjJGQTJmYnVJaytoYm1JTHdrVTY2NTh3OGk1U2g3aDdKKzhGMUY4MUw2?=
 =?utf-8?B?U0c4K0ZjTTU0WWlGdjBSZ1VqU25kM2F3RGRBVVY4TDBoeGN1MnVFVGtneHl3?=
 =?utf-8?B?c2xZTG1kV1I1azdwVkU3ZUpUS01FMnF6UEpkSUtKd3dlOXoxRmJIUDRmc01r?=
 =?utf-8?B?TDlYcHMwTTZZZkh2S2JpR2ZqZDhsQ0dKUy9waGNxdmJxZ0NOUzVEaERSdFBT?=
 =?utf-8?B?WiticjZJNzVRaHJNRTA1NEs0Q1Y5ZWdVS2FpdmFPZzI3WDBxZSsyNkVBeHdX?=
 =?utf-8?B?ekFUNkV4UjFjM1A2aDVXUGkxeTNTY0daUUF1cEFRUXljOGdkdExScDAraXcz?=
 =?utf-8?B?WXBweWtKdjQwUkluNDhRdkNEYmxabEptV2F5bXVVWllTQnNJYmVJUWRneVBD?=
 =?utf-8?B?YXlUTTZGY2xwaHY4ZTNlOUpiL3hic3NiY2s5a0tWRTFNM1RmT1RMSXVNR1dj?=
 =?utf-8?B?NzEvKzBSUVQ2RTRVWWh0TDVTTXlKcTZQWDA5WlVIdjBiM0RFWUdUek9ua2lR?=
 =?utf-8?B?dEJQajBLQ2dTa25ZbzdTaDFCTGY3a1RvM0VRTGJOaWZtNG40VDN1U1V6T3dY?=
 =?utf-8?B?elR6b0RHdUdXMCsrc042QmxmUllRTUw3S1ZGdG9OMHVWeU9QY1ZsTjZVRVR3?=
 =?utf-8?B?Q3l2UkhvdjUwSU94aEFXNnRvU0xKalh5MElwWUpUdFpMN1dKYzBaRkNRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(4022899006)(366013);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eFR3Y1VEc2dMQVJuOEc3ZE10aWRVL1hrcHBuVWRIdUNPVzNlNWNxR3RlZ1NP?=
 =?utf-8?B?V0J0WWhOZnpvQTVKeER2TU9SOHJyRnh2RWtHMnlKZkxJVjdlZ0JwQVRJUVM0?=
 =?utf-8?B?TGppcFBjNDRvUWpBSWZzOEkxcW8zQWhpTkp2aTF2SmkzOW00T1MwN0lvMjRJ?=
 =?utf-8?B?TVVSdXBHV1c3WWVqSklEZU9YZ0J5Z3lSS2toV3BBT2NPU0JoM2tXd3BlS24v?=
 =?utf-8?B?ZXZ3ZzFHbWdNSHFLY2Z1c0JVWUQ4cm5RekF3cVUzYmdPY0xWYXVlMkdiemwr?=
 =?utf-8?B?b0FoWkMrbjdKS25UelhiQ0hmTFNxcVRjMFlXKzhuSUZmZTFoR244alRlam5L?=
 =?utf-8?B?RHVDM2NVVDlyd2ZxV0VVM0lkNy9RSTlSeGhGSkd5azJ3Rkg2Q2dRUk1wd25x?=
 =?utf-8?B?VjU2L2hJbmtneW00V2p5SXdvM1JDMGJTTWIxQWdvR2trNW0yTk4zTC9HOXl2?=
 =?utf-8?B?RS9vcFBWQmJHVGRoWDZnSVpjbUFJZGtxcXpuc0s1ckprU2hJU1BmdEtLTXhl?=
 =?utf-8?B?T2wxVDdNZFJxWUxXSWlEMmxsd3dvWVNMZXQvMFlrWUozUW5FS0RtUFJHekVs?=
 =?utf-8?B?bTJFNzh3TTlMS000VWVheGN3KzJyOUw2UXFKZGRLR3JkTi9oai9QNUgrTUt1?=
 =?utf-8?B?U3YrMkhEMXJVb2l2QTQrT1lWdCtZWnNtM01BbnBqVzB3Q284M2ovZjhzc2oy?=
 =?utf-8?B?WW8vNElHTjIzVTRONzFvNnVGSzBMRmdZMmdYOUxicHUzMmxGT3ZqVU1rK1Y4?=
 =?utf-8?B?RHhMcWJDTWF0eFhJUFFMaFUxWEJmZXRsejZXa2l5SHhDcG54Z0I3UUJpSGUw?=
 =?utf-8?B?eFpyTkhCYTZUbzhaRFFUd1hDMk1rNE5RZ3RYR2c5V3JidWZydVJDTE9ncWxo?=
 =?utf-8?B?QjltazVFT2dtTU9USjhncmNmRm01NE9XODN2cXo5Q3dZc28yWE0yWE8zeVlq?=
 =?utf-8?B?R3ZsaDlob0dwa3UwMHdHTldFSGZGWG9HY3kvaVBDbVp2YlRaYmpEZldhSE9i?=
 =?utf-8?B?dW9VaEJ4a1NCRGNxaFZMc1B3MHg1dEpqYzVMd3pjVEE0NUFrYktkQ0UvY2JK?=
 =?utf-8?B?WXNwQVl4dXNJb3FQTWdhN2VUeUxTMkVHVFdFS0d3ejNQaDNlRlBiTUdSbzNG?=
 =?utf-8?B?N1BTUDNWcjNwVWhQWUh6anBHQ1d4WDZUbVhKSm5JYlhTdk5JRlhPdFI3Qk1F?=
 =?utf-8?B?UUFiYjZ6emduVkJaNi96ZjNGOHd6bEZ0cUk3ckVoSWJ2YnpaZWNUZHpvUmNJ?=
 =?utf-8?B?d0hpZ0hlYjZIcWdocDZBTWxud0RXdEZuSkllakU2QTFhNE5RN1FxVXd1RzRL?=
 =?utf-8?B?dEwrSENCcUtpQ3VhVnNTbngvbHlvcURrcFJNSFE1Z3d1NnVNZ1FmL3V4WDdV?=
 =?utf-8?B?bFRrTlBKZ2ppcURCdk9iOTh0TVJBdWlHb1ZzYUZERmR4SEd5cHZiRUlWcHhL?=
 =?utf-8?B?ektwYTlTNFNEb0FIWTBGcU91Qld2MDNtYWlYUTRWSkI5NDVodUdQdVIwUVBq?=
 =?utf-8?B?dnVOVEhQZXpjQnEwNlFYbWtoWFZxTXpsVlZiL1JWd1JhdG1GL21jbWZOL1p1?=
 =?utf-8?B?KzlWQjZwS0ExdDhTOVUrWS9LSHlCSDhEZDhIeVB5MEZqdlRLNkcxSkNGM2NZ?=
 =?utf-8?B?N3pWaU4waEtHOTFnUWlTUE9tWktBVHNvN3U5Z1FCZTZZTXdCQzdrMlhVSjZU?=
 =?utf-8?B?RnVKWXd0ZmRQUnlIL1c1Z0ptU1QreHVMWmw1RFhONGtudEZRTS8vVUE3V0hm?=
 =?utf-8?B?ZWRJcGphd3dXL2V5TVdzRFIwNWJKT3VTTjMvMVJiTzNscFIxNm85SXZWYk5p?=
 =?utf-8?B?SGwyb3RDM01WZ0hCSkhXd0llelJNZlEwbjN5SzgyZlpXNVgxZGl5Y1duL3JB?=
 =?utf-8?B?M3hFSU1UaDZhaEVXTzRsT1ZPTitOVS9GM3JSR2M2RGttTHNKcWJHSWtKSHBD?=
 =?utf-8?B?bmU1SitJck0vVjlsVWpyRW9JYmJmSzNmQzlkTTlJVm41YTB4c25VSExQT2c1?=
 =?utf-8?B?eDRzWU5aaXdwcVExei9mVDhKQmZ1LzZhSGVlVGh2a09tK3FRR09JQ2pvR0to?=
 =?utf-8?B?eVlZeGRWNzlGWXdwblNzdWIxci9IU3pidUM3YU8zSkt0UWluMVVKTy9pYUYx?=
 =?utf-8?B?eVB2NzI1Ri9sWEZhcVpFQzk2QmtiVXlxYmZZcWhScytEdDQwa00xaWdsYVdY?=
 =?utf-8?B?L1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d435e49-ca5f-4c43-611c-08dc8f166763
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 21:42:36.8014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDJPtrKGJNGin1mxgh4PS3VHAaXFbKBM0Sln6B4NqOhTPDvSvv5BjeQDswAaQ6Ds9pw4DJrdsk3Twc+dNBUbLYQ5sqHuX+ImjTgMoJpgTDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8186
X-Proofpoint-ORIG-GUID: tq7CuJq_JR_-B2zuB9VjH_zG49vcmBJD
X-Proofpoint-GUID: kVuGxUYMF3K35nGPvBzTQbqW4ZlBz_8n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406170168
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 21:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200851

--------------RJLlAnzRJMnvaI7M2xL0ttYu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45HJj2rE031638

On 2024-06-06 8:27 a.m., Steve Sakoman via lists.openembedded.org wrote:
> After reviewing the very large number of changes from 1.21.4 to
> 1.21.22 I don't think this appropriate for an LTS release:
>
> https://launchpad.net/debian/+source/dpkg/+changelog

Getting caught up...


If you can't trust Debian to adhere to semantic versioning for dpkg, who=20
can you trust? !!

;-)

I'm not certain that this update makes sense but I think it's worth some=20
discussion.

I've CCed Ross since he may know more about how=C2=A0 dpkg is maintained.


We're mostly looking for support for zstd (1), which was added, due to=20
an Ubuntu change,
in 1.21.18 but unless the package really isn't using semantic=20
versioning, we should be keeping it up to date regardless.

I'm trying to understand if there's something about dpkg maintenance=20
that I've missed.


FYI, Mickledore had version 1.21.22:

https://layers.openembedded.org/layerindex/branch/mickledore/recipes/?q=3D=
dpkg

so at least it has seen some YP soaking and testing.


You can see that Debian developers do a good job of having a branch for=20
each major.minor release:

=E2=9D=AF rg url .git/config
8:=C2=A0=C2=A0=C2=A0 url =3D https://salsa.debian.org/dpkg-team/dpkg.git

dpkg.git on main
=E2=9D=AF git branch -a | rg 1.[12]
 =C2=A0 remotes/origin/1.13.x
 =C2=A0 remotes/origin/1.14.x
 =C2=A0 remotes/origin/1.15.x
 =C2=A0 remotes/origin/1.16.x
 =C2=A0 remotes/origin/1.17.x
 =C2=A0 remotes/origin/1.18.x
 =C2=A0 remotes/origin/1.19.x
 =C2=A0 remotes/origin/1.20.x
 =C2=A0 remotes/origin/1.21.x
 =C2=A0 remotes/origin/next/1.16.x

=E2=9D=AF git branch -a --contains 1.22.6
 =C2=A0 main
 =C2=A0 remotes/origin/main

=E2=9D=AF git co 1.21.x
Your branch is up to date with 'origin/1.21.x'.

# alias gl=3D'git log --pretty=3Dformat:'\''%C(auto)%h %C(blue) %<|(20) %=
as=20
%C(auto) %d %s'\'''

=E2=9D=AF gl 1.21.4..1.21.22 | wc -l
526

~ 1/6 are i18n updates:

=E2=9D=AF gl 1.21.4..1.21.22 | rg=C2=A0 " po: "=C2=A0=C2=A0 | wc -l

93

version updates:

=E2=9D=AF gl 1.21.4..1.21.22 | rg -v " po: "| rg "Bump version" | wc -l
18


and if you look, we've missed updates for 2022 and 2023 since dpkg=20
hasn't been a priority for
any of the Yocto users it seems:

CommitDate: Sat Mar 26 08:53:31 2022

dpkg.git on 1.21.x

=E2=9D=AF git log --pretty=3Dfuller 1.21.4..1.21.22=C2=A0 | rg CommitDate=
 |=C2=A0 cut -d" "=20
-f6=C2=A0 | uniq -c
 =C2=A0=C2=A0=C2=A0 105 2023
 =C2=A0=C2=A0=C2=A0 422 2022

Any thoughts Ross?

Steve,

What can Yi do to help us understand the risk of code that worked with
1.21.4 not working with 1.21.22 ?

We should certainly add ptest support on oe-core/master and
depending on how this discussion goes, backport it to scarthgap and=20
kirkstone.


../Randy


1)

commit 2c2f7066bd8c3209762762fa6905fa567b08ca5a
Author: Guillem Jover <guillem@debian.org>
Date:=C2=A0=C2=A0 Sun Jan 8 20:32:42 2023

 =C2=A0=C2=A0=C2=A0 libdpkg: Add zstd support for .deb archives

 =C2=A0=C2=A0=C2=A0 This adds support for .deb ZStandard compression and =
decompression.
 =C2=A0=C2=A0=C2=A0 The main reason for this addition is due to Ubuntu ha=
ving forked the
 =C2=A0=C2=A0=C2=A0 .deb ecosystem when they added support for this unila=
terally, so now
 =C2=A0=C2=A0=C2=A0 there are many .deb in the wild using this compressio=
n format, which
 =C2=A0=C2=A0=C2=A0 cannot be handled by the upstream dpkg-deb tool.

 =C2=A0=C2=A0=C2=A0 Although at least now the ZStandard format is widely =
used on many
 =C2=A0=C2=A0=C2=A0 projects, has been specified within the IETF as RFC88=
78, so backwards
 =C2=A0=C2=A0=C2=A0 compatibility and format stability are no longer a co=
ncern, and it has
 =C2=A0=C2=A0=C2=A0 good trade offs between size and speed.

 =C2=A0=C2=A0=C2=A0 This has been implemented from scratch, based on the =
initial prototype
 =C2=A0=C2=A0=C2=A0 code used during the early request evaluation. Using =
the new advanced
 =C2=A0=C2=A0=C2=A0 API, with support for multi-threading, and using an I=
/O loop resembling
 =C2=A0=C2=A0=C2=A0 the one used with liblzma, as the plan is to eventual=
ly switch all
 =C2=A0=C2=A0=C2=A0 compressors to use a single I/O loop implementation.

 =C2=A0=C2=A0=C2=A0 Closes: #892664


=E2=9D=AF git tag --contains 2c2f7066b
1.21.18
1.21.19
1.21.20
1.21.21
1.21.22
1.22.0
1.22.1
1.22.2
1.22.3
1.22.4
1.22.5
1.22.6


>
> Steve
>
> On Wed, Jun 5, 2024 at 8:32=E2=80=AFPM Yi Zhao via lists.openembedded.o=
rg
> <yi.zhao=3Deng.windriver.com@lists.openembedded.org>  wrote:
>> ChangeLog:
>> https://salsa.debian.org/dpkg-team/dpkg/-/raw/1.21.x/debian/changelog
>>
>> * Add new dependency libmd
>> * Update SRC_URI
>> * Refresh patch
>> * Drop backport patch
>>
>> Signed-off-by: Yi Zhao<yi.zhao@windriver.com>
>> ---
>>   meta/recipes-devtools/dpkg/dpkg.inc           |   4 +-
>>   ...ive-Prevent-directory-traversal-for-.patch | 328 ----------------=
--
>>   ...s-expect-D-to-be-set-when-running-in.patch |  14 +-
>>   .../dpkg/{dpkg_1.21.4.bb =3D> dpkg_1.21.22.bb}  |   5 +-
>>   4 files changed, 11 insertions(+), 340 deletions(-)
>>   delete mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-Dpkg-Source-=
Archive-Prevent-directory-traversal-for-.patch
>>   rename meta/recipes-devtools/dpkg/{dpkg_1.21.4.bb =3D> dpkg_1.21.22.=
bb} (86%)
>>
>> diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtoo=
ls/dpkg/dpkg.inc
>> index 0d17a98b80..b3e8c05d62 100644
>> --- a/meta/recipes-devtools/dpkg/dpkg.inc
>> +++ b/meta/recipes-devtools/dpkg/dpkg.inc
>> @@ -4,8 +4,8 @@ HOMEPAGE =3D"https://salsa.debian.org/dpkg-team/dpkg"
>>   DESCRIPTION =3D "The primary interface for the dpkg suite is the dse=
lect program. A more low-level and less user-friendly interface is availa=
ble in the form of the dpkg command."
>>   SECTION =3D "base"
>>
>> -DEPENDS =3D "zlib bzip2 perl ncurses"
>> -DEPENDS:class-native =3D "bzip2-replacement-native zlib-native virtua=
l/update-alternatives-native gettext-native perl-native"
>> +DEPENDS =3D "zlib bzip2 perl ncurses libmd"
>> +DEPENDS:class-native =3D "bzip2-replacement-native zlib-native virtua=
l/update-alternatives-native gettext-native perl-native libmd-native"
>>   RDEPENDS:${PN} =3D "${VIRTUAL-RUNTIME_update-alternatives} perl"
>>   RDEPENDS:${PN}:class-native =3D ""
>>
>> diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-Dpkg-Source-Archive-=
Prevent-directory-traversal-for-.patch b/meta/recipes-devtools/dpkg/dpkg/=
0001-Dpkg-Source-Archive-Prevent-directory-traversal-for-.patch
>> deleted file mode 100644
>> index d249d854fb..0000000000
>> --- a/meta/recipes-devtools/dpkg/dpkg/0001-Dpkg-Source-Archive-Prevent=
-directory-traversal-for-.patch
>> +++ /dev/null
>> @@ -1,328 +0,0 @@
>> -From 6d8a6799639f8853a2af1f9036bc70fddbfdd2a2 Mon Sep 17 00:00:00 200=
1
>> -From: Guillem Jover<guillem@debian.org>
>> -Date: Tue, 3 May 2022 02:09:32 +0200
>> -Subject: [PATCH] Dpkg::Source::Archive: Prevent directory traversal f=
or
>> - in-place extracts
>> -
>> -For untrusted v2 and v3 source package formats that include a debian.=
tar
>> -archive, when we are extracting it, we do that as an in-place extract=
ion,
>> -which can lead to directory traversal situations on specially crafted
>> -orig.tar and debian.tar tarballs.
>> -
>> -GNU tar replaces entries on the filesystem by the entries present on
>> -the tarball, but it will follow symlinks when the symlink pathname
>> -itself is not present as an actual directory on the tarball.
>> -
>> -This means we can create an orig.tar where there's a symlink pointing
>> -out of the source tree root directory, and then a debian.tar that
>> -contains an entry within that symlink as if it was a directory, witho=
ut
>> -a directory entry for the symlink pathname itself, which will be
>> -extracted following the symlink outside the source tree root.
>> -
>> -This is currently noted as expected in GNU tar documentation. But eve=
n
>> -if there was a new extraction mode avoiding this problem we'd need su=
ch
>> -new version. Using perl's Archive::Tar would solve the problem, but
>> -switching to such different pure perl implementation, could cause
>> -compatibility or performance issues.
>> -
>> -What we do is when we are requested to perform an in-place extract, w=
e
>> -instead still use a temporary directory, then walk that directory and
>> -remove any matching entry in the destination directory, replicating w=
hat
>> -GNU tar would do, but in addition avoiding the directory traversal is=
sue
>> -for symlinks. Which should work with any tar implementation and be sa=
fe.
>> -
>> -Reported-by: Max Justicz<max@justi.cz>
>> -Stable-Candidates: 1.18.x 1.19.x 1.20.x
>> -Fixes: commit 0c0057a27fecccab77d2b3cffa9a7d172846f0b4 (1.14.17)
>> -Fixes: CVE-2022-1664
>> -
>> -CVE: CVE-2022-1664
>> -Upstream-Status: Backport [7a6c03cb34d4a09f35df2f10779cbf1b70a5200b]
>> -
>> -Signed-off-by: Sakib Sajal<sakib.sajal@windriver.com>
>> ----
>> - scripts/Dpkg/Source/Archive.pm  | 122 +++++++++++++++++++++++++-----=
--
>> - scripts/t/Dpkg_Source_Archive.t | 110 +++++++++++++++++++++++++++-
>> - 2 files changed, 204 insertions(+), 28 deletions(-)
>> -
>> -diff --git a/scripts/Dpkg/Source/Archive.pm b/scripts/Dpkg/Source/Arc=
hive.pm
>> -index 33c181b20..2ddd04af8 100644
>> ---- a/scripts/Dpkg/Source/Archive.pm
>> -+++ b/scripts/Dpkg/Source/Archive.pm
>> -@@ -21,9 +21,11 @@ use warnings;
>> - our $VERSION =3D '0.01';
>> -
>> - use Carp;
>> -+use Errno qw(ENOENT);
>> - useFile::Temp  qw(tempdir);
>> - useFile::Basename  qw(basename);
>> - useFile::Spec;
>> -+useFile::Find;
>> - use Cwd;
>> -
>> - use Dpkg ();
>> -@@ -110,19 +112,13 @@ sub extract {
>> -     my %spawn_opts =3D (wait_child =3D> 1);
>> -
>> -     # Prepare destination
>> --    my $tmp;
>> --    if ($opts{in_place}) {
>> --        $spawn_opts{chdir} =3D $dest;
>> --        $tmp =3D $dest; # So that fixperms call works
>> --    } else {
>> --        my $template =3D basename($self->get_filename()) .  '.tmp-ex=
tract.XXXXX';
>> --        unless (-e $dest) {
>> --            # Kludge so that realpath works
>> --            mkdir($dest) or syserr(g_('cannot create directory %s'),=
 $dest);
>> --        }
>> --        $tmp =3D tempdir($template, DIR =3D> Cwd::realpath("$dest/..=
"), CLEANUP =3D> 1);
>> --        $spawn_opts{chdir} =3D $tmp;
>> -+    my $template =3D basename($self->get_filename()) .  '.tmp-extrac=
t.XXXXX';
>> -+    unless (-e $dest) {
>> -+        # Kludge so that realpath works
>> -+        mkdir($dest) or syserr(g_('cannot create directory %s'), $de=
st);
>> -     }
>> -+    my $tmp =3D tempdir($template, DIR =3D> Cwd::realpath("$dest/.."=
), CLEANUP =3D> 1);
>> -+    $spawn_opts{chdir} =3D $tmp;
>> -
>> -     # Prepare stuff that handles the input of tar
>> -     $self->ensure_open('r', delete_sig =3D> [ 'PIPE' ]);
>> -@@ -145,22 +141,94 @@ sub extract {
>> -     # have to be calculated using mount options and other madness.
>> -     fixperms($tmp) unless $opts{no_fixperms};
>> -
>> --    # Stop here if we extracted in-place as there's nothing to move =
around
>> --    return if $opts{in_place};
>> --
>> --    # Rename extracted directory
>> --    opendir(my $dir_dh, $tmp) or syserr(g_('cannot opendir %s'), $tm=
p);
>> --    my @entries =3D grep { $_ ne '.' && $_ ne '..' } readdir($dir_dh=
);
>> --    closedir($dir_dh);
>> --    my $done =3D 0;
>> --    erasedir($dest);
>> --    if (scalar(@entries) =3D=3D 1 && ! -l "$tmp/$entries[0]" && -d _=
) {
>> --      rename("$tmp/$entries[0]", $dest)
>> --          or syserr(g_('unable to rename %s to %s'),
>> --                    "$tmp/$entries[0]", $dest);
>> -+    # If we are extracting "in-place" do not remove the destination =
directory.
>> -+    if ($opts{in_place}) {
>> -+        my $canon_basedir =3D Cwd::realpath($dest);
>> -+        # On Solaris /dev/null points to /devices/pseudo/mm@0:null.
>> -+        my $canon_devnull =3D Cwd::realpath('/dev/null');
>> -+        my $check_symlink =3D sub {
>> -+            my $pathname =3D shift;
>> -+            my $canon_pathname =3D Cwd::realpath($pathname);
>> -+            if (not defined $canon_pathname) {
>> -+                return if $! =3D=3D ENOENT;
>> -+
>> -+                syserr(g_("pathname '%s' cannot be canonicalized"), =
$pathname);
>> -+            }
>> -+            return if $canon_pathname eq $canon_devnull;
>> -+            return if $canon_pathname eq $canon_basedir;
>> -+            return if $canon_pathname =3D~ m{^\Q$canon_basedir/\E};
>> -+            warning(g_("pathname '%s' points outside source root (to=
 '%s')"),
>> -+                    $pathname, $canon_pathname);
>> -+        };
>> -+
>> -+        my $move_in_place =3D sub {
>> -+            my $relpath =3DFile::Spec->abs2rel($File::Find::name, $t=
mp);
>> -+            my $destpath =3DFile::Spec->catfile($dest, $relpath);
>> -+
>> -+            my ($mode, $atime, $mtime);
>> -+            lstat $File::Find::name
>> -+                or syserr(g_('cannot get source pathname %s metadata=
'), $File::Find::name);
>> -+            ((undef) x 2, $mode, (undef) x 5, $atime, $mtime) =3D ls=
tat _;
>> -+            my $src_is_dir =3D -d _;
>> -+
>> -+            my $dest_exists =3D 1;
>> -+            if (not lstat $destpath) {
>> -+                if ($! =3D=3D ENOENT) {
>> -+                    $dest_exists =3D 0;
>> -+                } else {
>> -+                    syserr(g_('cannot get target pathname %s metadat=
a'), $destpath);
>> -+                }
>> -+            }
>> -+            my $dest_is_dir =3D -d _;
>> -+            if ($dest_exists) {
>> -+                if ($dest_is_dir && $src_is_dir) {
>> -+                    # Refresh the destination directory attributes w=
ith the
>> -+                    # ones from the tarball.
>> -+                    chmod $mode, $destpath
>> -+                        or syserr(g_('cannot change directory %s mod=
e'), $File::Find::name);
>> -+                    utime $atime, $mtime, $destpath
>> -+                        or syserr(g_('cannot change directory %s tim=
es'), $File::Find::name);
>> -+
>> -+                    # We should do nothing, and just walk further tr=
ee.
>> -+                    return;
>> -+                } elsif ($dest_is_dir) {
>> -+                    rmdir $destpath
>> -+                        or syserr(g_('cannot remove destination dire=
ctory %s'), $destpath);
>> -+                } else {
>> -+                    $check_symlink->($destpath);
>> -+                    unlink $destpath
>> -+                        or syserr(g_('cannot remove destination file=
 %s'), $destpath);
>> -+                }
>> -+            }
>> -+            # If we are moving a directory, we do not need to walk i=
t.
>> -+            if ($src_is_dir) {
>> -+                $File::Find::prune  =3D 1;
>> -+            }
>> -+            rename $File::Find::name, $destpath
>> -+                or syserr(g_('cannot move %s to %s'), $File::Find::n=
ame, $destpath);
>> -+        };
>> -+
>> -+        find({
>> -+            wanted =3D> $move_in_place,
>> -+            no_chdir =3D> 1,
>> -+            dangling_symlinks =3D> 0,
>> -+        }, $tmp);
>> -     } else {
>> --      rename($tmp, $dest)
>> --          or syserr(g_('unable to rename %s to %s'), $tmp, $dest);
>> -+        # Rename extracted directory
>> -+        opendir(my $dir_dh, $tmp) or syserr(g_('cannot opendir %s'),=
 $tmp);
>> -+        my @entries =3D grep { $_ ne '.' && $_ ne '..' } readdir($di=
r_dh);
>> -+        closedir($dir_dh);
>> -+
>> -+        erasedir($dest);
>> -+
>> -+        if (scalar(@entries) =3D=3D 1 && ! -l "$tmp/$entries[0]" && =
-d _) {
>> -+            rename("$tmp/$entries[0]", $dest)
>> -+                or syserr(g_('unable to rename %s to %s'),
>> -+                          "$tmp/$entries[0]", $dest);
>> -+        } else {
>> -+            rename($tmp, $dest)
>> -+                or syserr(g_('unable to rename %s to %s'), $tmp, $de=
st);
>> -+        }
>> -     }
>> -     erasedir($tmp);
>> - }
>> -diff --git a/scripts/t/Dpkg_Source_Archive.t b/scripts/t/Dpkg_Source_=
Archive.t
>> -index 7b70da68e..504fbe1d4 100644
>> ---- a/scripts/t/Dpkg_Source_Archive.t
>> -+++ b/scripts/t/Dpkg_Source_Archive.t
>> -@@ -16,12 +16,120 @@
>> - use strict;
>> - use warnings;
>> -
>> --use Test::More tests =3D> 1;
>> -+use Test::More tests =3D> 4;
>> -+use Test::Dpkg qw(:paths);
>> -+
>> -+useFile::Spec;
>> -+useFile::Path  qw(make_path rmtree);
>> -
>> - BEGIN {
>> -     use_ok('Dpkg::Source::Archive');
>> - }
>> -
>> -+use Dpkg;
>> -+
>> -+my $tmpdir =3D test_get_temp_path();
>> -+
>> -+rmtree($tmpdir);
>> -+
>> -+sub test_touch
>> -+{
>> -+    my ($name, $data) =3D @_;
>> -+
>> -+    open my $fh, '>', $name
>> -+        or die "cannot touch file $name\n";
>> -+    print { $fh } $data if $data;
>> -+    close $fh;
>> -+}
>> -+
>> -+sub test_path_escape
>> -+{
>> -+    my $name =3D shift;
>> -+
>> -+    my $treedir =3DFile::Spec->rel2abs("$tmpdir/$name-tree");
>> -+    my $overdir =3DFile::Spec->rel2abs("$tmpdir/$name-overlay");
>> -+    my $outdir =3D "$tmpdir/$name-out";
>> -+    my $expdir =3D "$tmpdir/$name-exp";
>> -+
>> -+    # This is the base directory, where we are going to be extractin=
g stuff
>> -+    # into, which include traps.
>> -+    make_path("$treedir/subdir-a");
>> -+    test_touch("$treedir/subdir-a/file-a");
>> -+    test_touch("$treedir/subdir-a/file-pre-a");
>> -+    make_path("$treedir/subdir-b");
>> -+    test_touch("$treedir/subdir-b/file-b");
>> -+    test_touch("$treedir/subdir-b/file-pre-b");
>> -+    symlinkFile::Spec->abs2rel($outdir, $treedir), "$treedir/symlink=
-escape";
>> -+    symlinkFile::Spec->abs2rel("$outdir/nonexistent", $treedir), "$t=
reedir/symlink-nonexistent";
>> -+    symlink "$treedir/file", "$treedir/symlink-within";
>> -+    test_touch("$treedir/supposed-dir");
>> -+
>> -+    # This is the overlay directory, which we'll pack and extract ov=
er the
>> -+    # base directory.
>> -+    make_path($overdir);
>> -+    make_path("$overdir/subdir-a/aa");
>> -+    test_touch("$overdir/subdir-a/aa/file-aa", 'aa');
>> -+    test_touch("$overdir/subdir-a/file-a", 'a');
>> -+    make_path("$overdir/subdir-b/bb");
>> -+    test_touch("$overdir/subdir-b/bb/file-bb", 'bb');
>> -+    test_touch("$overdir/subdir-b/file-b", 'b');
>> -+    make_path("$overdir/symlink-escape");
>> -+    test_touch("$overdir/symlink-escape/escaped-file", 'escaped');
>> -+    test_touch("$overdir/symlink-nonexistent", 'nonexistent');
>> -+    make_path("$overdir/symlink-within");
>> -+    make_path("$overdir/supposed-dir");
>> -+    test_touch("$overdir/supposed-dir/supposed-file", 'something');
>> -+
>> -+    # Generate overlay tar.
>> -+    system($Dpkg::PROGTAR, '-cf', "$overdir.tar", '-C', $overdir, qw=
(
>> -+        subdir-a subdir-b
>> -+        symlink-escape/escaped-file symlink-nonexistent symlink-with=
in
>> -+        supposed-dir
>> -+        )) =3D=3D 0
>> -+        or die "cannot create overlay tar archive\n";
>> -+
>> -+   # This is the expected directory, which we'll be comparing agains=
t.
>> -+    make_path($expdir);
>> -+    system('cp', '-a', $overdir, $expdir) =3D=3D 0
>> -+        or die "cannot copy overlay hierarchy into expected director=
y\n";
>> -+
>> -+    # Store the expected and out reference directories into a tar to=
 compare
>> -+    # its structure against the result reference.
>> -+    system($Dpkg::PROGTAR, '-cf', "$expdir.tar", '-C', $overdir, qw(
>> -+        subdir-a subdir-b
>> -+        symlink-escape/escaped-file symlink-nonexistent symlink-with=
in
>> -+        supposed-dir
>> -+        ), '-C', $treedir, qw(
>> -+        subdir-a/file-pre-a
>> -+        subdir-b/file-pre-b
>> -+        )) =3D=3D 0
>> -+        or die "cannot create expected tar archive\n";
>> -+
>> -+    # This directory is supposed to remain empty, anything inside im=
plies a
>> -+    # directory traversal.
>> -+    make_path($outdir);
>> -+
>> -+    my $warnseen;
>> -+    local $SIG{__WARN__} =3D sub { $warnseen =3D $_[0] };
>> -+
>> -+    # Perform the extraction.
>> -+    my $tar =3D Dpkg::Source::Archive->new(filename =3D> "$overdir.t=
ar");
>> -+    $tar->extract($treedir, in_place =3D> 1);
>> -+
>> -+    # Store the result into a tar to compare its structure against a=
 reference.
>> -+    system($Dpkg::PROGTAR, '-cf', "$treedir.tar", '-C', $treedir, '.=
');
>> -+
>> -+    # Check results
>> -+    ok(length $warnseen && $warnseen =3D~ m/points outside source ro=
ot/,
>> -+       'expected warning seen');
>> -+    ok(system($Dpkg::PROGTAR, '--compare', '-f', "$expdir.tar", '-C'=
, $treedir) =3D=3D 0,
>> -+       'expected directory matches');
>> -+    ok(! -e "$outdir/escaped-file",
>> -+       'expected output directory is empty, directory traversal');
>> -+}
>> -+
>> -+test_path_escape('in-place');
>> -+
>> - # TODO: Add actual test cases.
>> -
>> - 1;
>> ---
>> -2.33.0
>> -
>> diff --git a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-ex=
pect-D-to-be-set-when-running-in.patch b/meta/recipes-devtools/dpkg/dpkg/=
0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
>> index 75ae848264..5e52427caf 100644
>> --- a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-=
to-be-set-when-running-in.patch
>> +++ b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-=
to-be-set-when-running-in.patch
>> @@ -1,4 +1,4 @@
>> -From dd11ed66640f79143e42d778b58fdd5a61fb5836 Mon Sep 17 00:00:00 200=
1
>> +From 115fed94be9c61d2a8de21e7d169b5872e9ebd09 Mon Sep 17 00:00:00 200=
1
>>   From: Alexander Kanavin<alex.kanavin@gmail.com>
>>   Date: Wed, 26 Aug 2015 16:25:45 +0300
>>   Subject: [PATCH] Our pre/postinsts expect $D to be set when running =
in a
>> @@ -12,21 +12,21 @@ ALIMON 2016/05/26
>>   ALIMON 2017/02/21
>>   KKang 2019/02/20
>>   ---
>> - src/main/script.c | 54 +++------------------------------------------=
--
>> - 1 file changed, 3 insertions(+), 51 deletions(-)
>> + src/main/script.c | 53 +++------------------------------------------=
--
>> + 1 file changed, 3 insertions(+), 50 deletions(-)
>>
>>   diff --git a/src/main/script.c b/src/main/script.c
>> -index abe65b6..0edb8f1 100644
>> +index b4f369dfa..559a49cc5 100644
>>   --- a/src/main/script.c
>>   +++ b/src/main/script.c
>> -@@ -96,58 +96,10 @@ setexecute(const char *path, struct stat *stab)
>> - static const char *
>> +@@ -97,58 +97,11 @@ static const char *
>>    maintscript_pre_exec(struct command *cmd)
>>    {
>> +       const char *instdir =3D dpkg_fsys_get_dir();
>>   -      const char *admindir =3D dpkg_db_get_dir();
>>   -      const char *changedir;
>>   -      size_t instdirlen =3D strlen(instdir);
>> --
>> +
>>   -      if (instdirlen > 0 && in_force(FORCE_SCRIPT_CHROOTLESS))
>>   -              changedir =3D instdir;
>>   -      else
>> diff --git a/meta/recipes-devtools/dpkg/dpkg_1.21.4.bb b/meta/recipes-=
devtools/dpkg/dpkg_1.21.22.bb
>> similarity index 86%
>> rename from meta/recipes-devtools/dpkg/dpkg_1.21.4.bb
>> rename to meta/recipes-devtools/dpkg/dpkg_1.21.22.bb
>> index 7ef6233ee4..04bcc93321 100644
>> --- a/meta/recipes-devtools/dpkg/dpkg_1.21.4.bb
>> +++ b/meta/recipes-devtools/dpkg/dpkg_1.21.22.bb
>> @@ -1,7 +1,7 @@
>>   require dpkg.inc
>>   LIC_FILES_CHKSUM =3D"file://COPYING;md5=3D751419260aa954499f7abaabaa=
882bbe"
>>
>> -SRC_URI =3D "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=3Dhtt=
ps;branch=3Dmain \
>> +SRC_URI =3D "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=3Dhtt=
ps;branch=3D1.21.x \
>>              file://noman.patch  \
>>              file://remove-tar-no-timestamp.patch  \
>>              file://arch_pm.patch  \
>> @@ -14,11 +14,10 @@ SRC_URI =3D "git://salsa.debian.org/dpkg-team/dpkg=
.git;protocol=3Dhttps;branch=3Dmain
>>              file://0001-dpkg-Support-muslx32-build.patch  \
>>              file://pager.patch  \
>>              file://0001-Add-support-for-riscv32-CPU.patch  \
>> -file://0001-Dpkg-Source-Archive-Prevent-directory-traversal-for-.patc=
h  \
>>              "
>>
>>   SRC_URI:append:class-native =3D" file://0001-build.c-ignore-return-o=
f-1-from-tar-cf.patch"
>>
>> -SRCREV =3D "5563bdb608b3413639b69f1c76567cb66ff1a961"
>> +SRCREV =3D "48482e4f16467e05a08aa3b3b8048e08f0024609"
>>
>>   S =3D "${WORKDIR}/git"
>> --
>> 2.25.1
>>
>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#200400):https://lists.openembedded.org/g/openembed=
ded-core/message/200400
>> Mute This Topic:https://lists.openembedded.org/mt/106517331/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
# Randy MacLeod
# Wind River Linux

--------------RJLlAnzRJMnvaI7M2xL0ttYu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45HJj2rE031638

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-06-06 8:27 a.m., Steve Sakoman
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdZ_U3=3Dot4HZtqph3U2RN3e7=
bK+PgHdmwzB_WG8JxuQn8g@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">After reviewing the very lar=
ge number of changes from 1.21.4 to
1.21.22 I don't think this appropriate for an LTS release:

<a class=3D"moz-txt-link-freetext" href=3D"https://launchpad.net/debian/+=
source/dpkg/+changelog">https://launchpad.net/debian/+source/dpkg/+change=
log</a></pre>
    </blockquote>
    <p>Getting caught up...<br>
    </p>
    <br>
    <p>If you can't trust Debian to adhere to semantic versioning for
      dpkg, who can you trust? !!</p>
    <p>;-)</p>
    <p>I'm not certain that this update makes sense but I think it's
      worth some discussion.</p>
    <p>I've CCed Ross since he may know more about how&nbsp; dpkg is
      maintained.</p>
    <p><br>
    </p>
    <p>We're mostly looking for support for zstd (1), which was added,
      due to an Ubuntu change, <br>
      in 1.21.18 but unless the package really isn't using semantic
      versioning, we should be keeping it up to date regardless.<br>
    </p>
    <p>I'm trying to understand if there's something about dpkg
      maintenance that I've missed.</p>
    <p><br>
    </p>
    <p>FYI, Mickledore had version 1.21.22:</p>
    <p>&nbsp;&nbsp;
<a class=3D"moz-txt-link-freetext" href=3D"https://layers.openembedded.or=
g/layerindex/branch/mickledore/recipes/?q=3Ddpkg">https://layers.openembe=
dded.org/layerindex/branch/mickledore/recipes/?q=3Ddpkg</a></p>
    <p>so at least it has seen some YP soaking and testing.</p>
    <p><br>
    </p>
    <p></p>
    <p>You can see that Debian developers do a good job of having a
      branch for each major.minor release:<br>
    </p>
    <p></p>
    <p>=E2=9D=AF rg url .git/config <br>
      8:&nbsp;&nbsp;&nbsp; url =3D <a class=3D"moz-txt-link-freetext" hre=
f=3D"https://salsa.debian.org/dpkg-team/dpkg.git">https://salsa.debian.or=
g/dpkg-team/dpkg.git</a><br>
      <br>
      dpkg.git on main <br>
      =E2=9D=AF git branch -a | rg 1.[12]<br>
      &nbsp; remotes/origin/1.13.x<br>
      &nbsp; remotes/origin/1.14.x<br>
      &nbsp; remotes/origin/1.15.x<br>
      &nbsp; remotes/origin/1.16.x<br>
      &nbsp; remotes/origin/1.17.x<br>
      &nbsp; remotes/origin/1.18.x<br>
      &nbsp; remotes/origin/1.19.x<br>
      &nbsp; remotes/origin/1.20.x<br>
      &nbsp; remotes/origin/1.21.x<br>
      &nbsp; remotes/origin/next/1.16.x</p>
    <p>=E2=9D=AF git branch -a --contains 1.22.6<br>
      &nbsp; main<br>
      &nbsp; remotes/origin/main<br>
      <br>
    </p>
    <p>=E2=9D=AF git co 1.21.x<br>
      Your branch is up to date with 'origin/1.21.x'.<br>
    </p>
    <p># alias gl=3D'git log --pretty=3Dformat:'\''%C(auto)%h %C(blue)
      %&lt;|(20) %as %C(auto) %d %s'\'''<br>
    </p>
    <p></p>
    <p>=E2=9D=AF gl 1.21.4..1.21.22 | wc -l<br>
      526</p>
    <p>~ 1/6 are i18n updates:</p>
    =E2=9D=AF gl 1.21.4..1.21.22 | rg&nbsp; &quot; po: &quot;&nbsp;&nbsp;=
 | wc -l
    <p>93</p>
    <p>version updates:<br>
    </p>
    <p>=E2=9D=AF gl 1.21.4..1.21.22 | rg -v &quot; po: &quot;| rg &quot;B=
ump version&quot; | wc -l<br>
      18<br>
      <br>
    </p>
    <p><br>
      and if you look, we've missed updates for 2022 and 2023 since dpkg
      hasn't been a priority for<br>
      any of the Yocto users it seems:<br>
      <br>
      CommitDate: Sat Mar 26 08:53:31 2022<br>
      <br>
      dpkg.git on 1.21.x <br>
    </p>
    <p>=E2=9D=AF git log --pretty=3Dfuller 1.21.4..1.21.22&nbsp; | rg Com=
mitDate |&nbsp; cut
      -d&quot; &quot; -f6&nbsp; | uniq -c<br>
      &nbsp;&nbsp;&nbsp; 105 2023<br>
      &nbsp;&nbsp;&nbsp; 422 2022<br>
      <br>
    </p>
    <p>Any thoughts Ross?</p>
    <p>Steve,&nbsp;</p>
    <p>What can Yi do to help us understand the risk of code that worked
      with<br>
      1.21.4 not working with 1.21.22 ?</p>
    <p>We should certainly add ptest support on oe-core/master and<br>
      depending on how this discussion goes, backport it to scarthgap
      and kirkstone.</p>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p>1)</p>
    <p>commit 2c2f7066bd8c3209762762fa6905fa567b08ca5a<br>
      Author: Guillem Jover <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:guillem@debian.org">&lt;guillem@debian.org&gt;</a><br>
      Date:&nbsp;&nbsp; Sun Jan 8 20:32:42 2023<br>
      <br>
      &nbsp;&nbsp;&nbsp; libdpkg: Add zstd support for .deb archives<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; This adds support for .deb ZStandard compression=
 and
      decompression.<br>
      &nbsp;&nbsp;&nbsp; The main reason for this addition is due to Ubun=
tu having
      forked the<br>
      &nbsp;&nbsp;&nbsp; .deb ecosystem when they added support for this =
unilaterally,
      so now<br>
      &nbsp;&nbsp;&nbsp; there are many .deb in the wild using this compr=
ession format,
      which<br>
      &nbsp;&nbsp;&nbsp; cannot be handled by the upstream dpkg-deb tool.=
<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; Although at least now the ZStandard format is wi=
dely used on
      many<br>
      &nbsp;&nbsp;&nbsp; projects, has been specified within the IETF as =
RFC8878, so
      backwards<br>
      &nbsp;&nbsp;&nbsp; compatibility and format stability are no longer=
 a concern,
      and it has<br>
      &nbsp;&nbsp;&nbsp; good trade offs between size and speed.<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; This has been implemented from scratch, based on=
 the initial
      prototype<br>
      &nbsp;&nbsp;&nbsp; code used during the early request evaluation. U=
sing the new
      advanced<br>
      &nbsp;&nbsp;&nbsp; API, with support for multi-threading, and using=
 an I/O loop
      resembling<br>
      &nbsp;&nbsp;&nbsp; the one used with liblzma, as the plan is to eve=
ntually switch
      all<br>
      &nbsp;&nbsp;&nbsp; compressors to use a single I/O loop implementat=
ion.<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; Closes: #892664<br>
      <br>
    </p>
    <p><br>
      =E2=9D=AF git tag --contains 2c2f7066b<br>
      1.21.18<br>
      1.21.19<br>
      1.21.20<br>
      1.21.21<br>
      1.21.22<br>
      1.22.0<br>
      1.22.1<br>
      1.22.2<br>
      1.22.3<br>
      1.22.4<br>
      1.22.5<br>
      1.22.6<br>
      <br>
    </p>
    <p><br>
    </p>
    <p></p>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdZ_U3=3Dot4HZtqph3U2RN3e7=
bK+PgHdmwzB_WG8JxuQn8g@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Steve

On Wed, Jun 5, 2024 at 8:32=E2=80=AFPM Yi Zhao via lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:yi.zhao=3Deng.windriver=
.com@lists.openembedded.org">&lt;yi.zhao=3Deng.windriver.com@lists.openem=
bedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">ChangeLog:
<a class=3D"moz-txt-link-freetext" href=3D"https://salsa.debian.org/dpkg-=
team/dpkg/-/raw/1.21.x/debian/changelog">https://salsa.debian.org/dpkg-te=
am/dpkg/-/raw/1.21.x/debian/changelog</a>

* Add new dependency libmd
* Update SRC_URI
* Refresh patch
* Drop backport patch

Signed-off-by: Yi Zhao <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
yi.zhao@windriver.com">&lt;yi.zhao@windriver.com&gt;</a>
---
 meta/recipes-devtools/dpkg/dpkg.inc           |   4 +-
 ...ive-Prevent-directory-traversal-for-.patch | 328 ------------------
 ...s-expect-D-to-be-set-when-running-in.patch |  14 +-
 .../dpkg/{dpkg_1.21.4.bb =3D&gt; dpkg_1.21.22.bb}  |   5 +-
 4 files changed, 11 insertions(+), 340 deletions(-)
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-Dpkg-Source-Arch=
ive-Prevent-directory-traversal-for-.patch
 rename meta/recipes-devtools/dpkg/{dpkg_1.21.4.bb =3D&gt; dpkg_1.21.22.b=
b} (86%)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/=
dpkg/dpkg.inc
index 0d17a98b80..b3e8c05d62 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -4,8 +4,8 @@ HOMEPAGE =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"h=
ttps://salsa.debian.org/dpkg-team/dpkg">&quot;https://salsa.debian.org/dp=
kg-team/dpkg&quot;</a>
 DESCRIPTION =3D &quot;The primary interface for the dpkg suite is the ds=
elect program. A more low-level and less user-friendly interface is avail=
able in the form of the dpkg command.&quot;
 SECTION =3D &quot;base&quot;

-DEPENDS =3D &quot;zlib bzip2 perl ncurses&quot;
-DEPENDS:class-native =3D &quot;bzip2-replacement-native zlib-native virt=
ual/update-alternatives-native gettext-native perl-native&quot;
+DEPENDS =3D &quot;zlib bzip2 perl ncurses libmd&quot;
+DEPENDS:class-native =3D &quot;bzip2-replacement-native zlib-native virt=
ual/update-alternatives-native gettext-native perl-native libmd-native&qu=
ot;
 RDEPENDS:${PN} =3D &quot;${VIRTUAL-RUNTIME_update-alternatives} perl&quo=
t;
 RDEPENDS:${PN}:class-native =3D &quot;&quot;

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-Dpkg-Source-Archive-Pre=
vent-directory-traversal-for-.patch b/meta/recipes-devtools/dpkg/dpkg/000=
1-Dpkg-Source-Archive-Prevent-directory-traversal-for-.patch
deleted file mode 100644
index d249d854fb..0000000000
--- a/meta/recipes-devtools/dpkg/dpkg/0001-Dpkg-Source-Archive-Prevent-di=
rectory-traversal-for-.patch
+++ /dev/null
@@ -1,328 +0,0 @@
-From 6d8a6799639f8853a2af1f9036bc70fddbfdd2a2 Mon Sep 17 00:00:00 2001
-From: Guillem Jover <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:gu=
illem@debian.org">&lt;guillem@debian.org&gt;</a>
-Date: Tue, 3 May 2022 02:09:32 +0200
-Subject: [PATCH] Dpkg::Source::Archive: Prevent directory traversal for
- in-place extracts
-
-For untrusted v2 and v3 source package formats that include a debian.tar
-archive, when we are extracting it, we do that as an in-place extraction=
,
-which can lead to directory traversal situations on specially crafted
-orig.tar and debian.tar tarballs.
-
-GNU tar replaces entries on the filesystem by the entries present on
-the tarball, but it will follow symlinks when the symlink pathname
-itself is not present as an actual directory on the tarball.
-
-This means we can create an orig.tar where there's a symlink pointing
-out of the source tree root directory, and then a debian.tar that
-contains an entry within that symlink as if it was a directory, without
-a directory entry for the symlink pathname itself, which will be
-extracted following the symlink outside the source tree root.
-
-This is currently noted as expected in GNU tar documentation. But even
-if there was a new extraction mode avoiding this problem we'd need such
-new version. Using perl's Archive::Tar would solve the problem, but
-switching to such different pure perl implementation, could cause
-compatibility or performance issues.
-
-What we do is when we are requested to perform an in-place extract, we
-instead still use a temporary directory, then walk that directory and
-remove any matching entry in the destination directory, replicating what
-GNU tar would do, but in addition avoiding the directory traversal issue
-for symlinks. Which should work with any tar implementation and be safe.
-
-Reported-by: Max Justicz <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:max@justi.cz">&lt;max@justi.cz&gt;</a>
-Stable-Candidates: 1.18.x 1.19.x 1.20.x
-Fixes: commit 0c0057a27fecccab77d2b3cffa9a7d172846f0b4 (1.14.17)
-Fixes: CVE-2022-1664
-
-CVE: CVE-2022-1664
-Upstream-Status: Backport [7a6c03cb34d4a09f35df2f10779cbf1b70a5200b]
-
-Signed-off-by: Sakib Sajal <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
----
- scripts/Dpkg/Source/Archive.pm  | 122 +++++++++++++++++++++++++-------
- scripts/t/Dpkg_Source_Archive.t | 110 +++++++++++++++++++++++++++-
- 2 files changed, 204 insertions(+), 28 deletions(-)
-
-diff --git a/scripts/Dpkg/Source/Archive.pm b/scripts/Dpkg/Source/Archiv=
e.pm
-index 33c181b20..2ddd04af8 100644
---- a/scripts/Dpkg/Source/Archive.pm
-+++ b/scripts/Dpkg/Source/Archive.pm
-@@ -21,9 +21,11 @@ use warnings;
- our $VERSION =3D '0.01';
-
- use Carp;
-+use Errno qw(ENOENT);
- use <a class=3D"moz-txt-link-freetext" href=3D"File::Temp">File::Temp</=
a> qw(tempdir);
- use <a class=3D"moz-txt-link-freetext" href=3D"File::Basename">File::Ba=
sename</a> qw(basename);
- use <a class=3D"moz-txt-link-freetext" href=3D"File::Spec">File::Spec</=
a>;
-+use <a class=3D"moz-txt-link-freetext" href=3D"File::Find">File::Find</=
a>;
- use Cwd;
-
- use Dpkg ();
-@@ -110,19 +112,13 @@ sub extract {
-     my %spawn_opts =3D (wait_child =3D&gt; 1);
-
-     # Prepare destination
--    my $tmp;
--    if ($opts{in_place}) {
--        $spawn_opts{chdir} =3D $dest;
--        $tmp =3D $dest; # So that fixperms call works
--    } else {
--        my $template =3D basename($self-&gt;get_filename()) .  '.tmp-ex=
tract.XXXXX';
--        unless (-e $dest) {
--            # Kludge so that realpath works
--            mkdir($dest) or syserr(g_('cannot create directory %s'), $d=
est);
--        }
--        $tmp =3D tempdir($template, DIR =3D&gt; Cwd::realpath(&quot;$de=
st/..&quot;), CLEANUP =3D&gt; 1);
--        $spawn_opts{chdir} =3D $tmp;
-+    my $template =3D basename($self-&gt;get_filename()) .  '.tmp-extrac=
t.XXXXX';
-+    unless (-e $dest) {
-+        # Kludge so that realpath works
-+        mkdir($dest) or syserr(g_('cannot create directory %s'), $dest)=
;
-     }
-+    my $tmp =3D tempdir($template, DIR =3D&gt; Cwd::realpath(&quot;$des=
t/..&quot;), CLEANUP =3D&gt; 1);
-+    $spawn_opts{chdir} =3D $tmp;
-
-     # Prepare stuff that handles the input of tar
-     $self-&gt;ensure_open('r', delete_sig =3D&gt; [ 'PIPE' ]);
-@@ -145,22 +141,94 @@ sub extract {
-     # have to be calculated using mount options and other madness.
-     fixperms($tmp) unless $opts{no_fixperms};
-
--    # Stop here if we extracted in-place as there's nothing to move aro=
und
--    return if $opts{in_place};
--
--    # Rename extracted directory
--    opendir(my $dir_dh, $tmp) or syserr(g_('cannot opendir %s'), $tmp);
--    my @entries =3D grep { $_ ne '.' &amp;&amp; $_ ne '..' } readdir($d=
ir_dh);
--    closedir($dir_dh);
--    my $done =3D 0;
--    erasedir($dest);
--    if (scalar(@entries) =3D=3D 1 &amp;&amp; ! -l &quot;$tmp/$entries[0=
]&quot; &amp;&amp; -d _) {
--      rename(&quot;$tmp/$entries[0]&quot;, $dest)
--          or syserr(g_('unable to rename %s to %s'),
--                    &quot;$tmp/$entries[0]&quot;, $dest);
-+    # If we are extracting &quot;in-place&quot; do not remove the desti=
nation directory.
-+    if ($opts{in_place}) {
-+        my $canon_basedir =3D Cwd::realpath($dest);
-+        # On Solaris /dev/null points to /devices/pseudo/mm@0:null.
-+        my $canon_devnull =3D Cwd::realpath('/dev/null');
-+        my $check_symlink =3D sub {
-+            my $pathname =3D shift;
-+            my $canon_pathname =3D Cwd::realpath($pathname);
-+            if (not defined $canon_pathname) {
-+                return if $! =3D=3D ENOENT;
-+
-+                syserr(g_(&quot;pathname '%s' cannot be canonicalized&q=
uot;), $pathname);
-+            }
-+            return if $canon_pathname eq $canon_devnull;
-+            return if $canon_pathname eq $canon_basedir;
-+            return if $canon_pathname =3D~ m{^\Q$canon_basedir/\E};
-+            warning(g_(&quot;pathname '%s' points outside source root (=
to '%s')&quot;),
-+                    $pathname, $canon_pathname);
-+        };
-+
-+        my $move_in_place =3D sub {
-+            my $relpath =3D <a class=3D"moz-txt-link-freetext" href=3D"=
File::Spec">File::Spec</a>-&gt;abs2rel($<a class=3D"moz-txt-link-freetext=
" href=3D"File::Find::name">File::Find::name</a>, $tmp);
-+            my $destpath =3D <a class=3D"moz-txt-link-freetext" href=3D=
"File::Spec">File::Spec</a>-&gt;catfile($dest, $relpath);
-+
-+            my ($mode, $atime, $mtime);
-+            lstat $<a class=3D"moz-txt-link-freetext" href=3D"File::Fin=
d::name">File::Find::name</a>
-+                or syserr(g_('cannot get source pathname %s metadata'),=
 $<a class=3D"moz-txt-link-freetext" href=3D"File::Find::name">File::Find=
::name</a>);
-+            ((undef) x 2, $mode, (undef) x 5, $atime, $mtime) =3D lstat=
 _;
-+            my $src_is_dir =3D -d _;
-+
-+            my $dest_exists =3D 1;
-+            if (not lstat $destpath) {
-+                if ($! =3D=3D ENOENT) {
-+                    $dest_exists =3D 0;
-+                } else {
-+                    syserr(g_('cannot get target pathname %s metadata')=
, $destpath);
-+                }
-+            }
-+            my $dest_is_dir =3D -d _;
-+            if ($dest_exists) {
-+                if ($dest_is_dir &amp;&amp; $src_is_dir) {
-+                    # Refresh the destination directory attributes with=
 the
-+                    # ones from the tarball.
-+                    chmod $mode, $destpath
-+                        or syserr(g_('cannot change directory %s mode')=
, $<a class=3D"moz-txt-link-freetext" href=3D"File::Find::name">File::Fin=
d::name</a>);
-+                    utime $atime, $mtime, $destpath
-+                        or syserr(g_('cannot change directory %s times'=
), $<a class=3D"moz-txt-link-freetext" href=3D"File::Find::name">File::Fi=
nd::name</a>);
-+
-+                    # We should do nothing, and just walk further tree.
-+                    return;
-+                } elsif ($dest_is_dir) {
-+                    rmdir $destpath
-+                        or syserr(g_('cannot remove destination directo=
ry %s'), $destpath);
-+                } else {
-+                    $check_symlink-&gt;($destpath);
-+                    unlink $destpath
-+                        or syserr(g_('cannot remove destination file %s=
'), $destpath);
-+                }
-+            }
-+            # If we are moving a directory, we do not need to walk it.
-+            if ($src_is_dir) {
-+                $<a class=3D"moz-txt-link-freetext" href=3D"File::Find:=
:prune">File::Find::prune</a> =3D 1;
-+            }
-+            rename $<a class=3D"moz-txt-link-freetext" href=3D"File::Fi=
nd::name">File::Find::name</a>, $destpath
-+                or syserr(g_('cannot move %s to %s'), $<a class=3D"moz-=
txt-link-freetext" href=3D"File::Find::name">File::Find::name</a>, $destp=
ath);
-+        };
-+
-+        find({
-+            wanted =3D&gt; $move_in_place,
-+            no_chdir =3D&gt; 1,
-+            dangling_symlinks =3D&gt; 0,
-+        }, $tmp);
-     } else {
--      rename($tmp, $dest)
--          or syserr(g_('unable to rename %s to %s'), $tmp, $dest);
-+        # Rename extracted directory
-+        opendir(my $dir_dh, $tmp) or syserr(g_('cannot opendir %s'), $t=
mp);
-+        my @entries =3D grep { $_ ne '.' &amp;&amp; $_ ne '..' } readdi=
r($dir_dh);
-+        closedir($dir_dh);
-+
-+        erasedir($dest);
-+
-+        if (scalar(@entries) =3D=3D 1 &amp;&amp; ! -l &quot;$tmp/$entri=
es[0]&quot; &amp;&amp; -d _) {
-+            rename(&quot;$tmp/$entries[0]&quot;, $dest)
-+                or syserr(g_('unable to rename %s to %s'),
-+                          &quot;$tmp/$entries[0]&quot;, $dest);
-+        } else {
-+            rename($tmp, $dest)
-+                or syserr(g_('unable to rename %s to %s'), $tmp, $dest)=
;
-+        }
-     }
-     erasedir($tmp);
- }
-diff --git a/scripts/t/Dpkg_Source_Archive.t b/scripts/t/Dpkg_Source_Arc=
hive.t
-index 7b70da68e..504fbe1d4 100644
---- a/scripts/t/Dpkg_Source_Archive.t
-+++ b/scripts/t/Dpkg_Source_Archive.t
-@@ -16,12 +16,120 @@
- use strict;
- use warnings;
-
--use Test::More tests =3D&gt; 1;
-+use Test::More tests =3D&gt; 4;
-+use Test::Dpkg qw(:paths);
-+
-+use <a class=3D"moz-txt-link-freetext" href=3D"File::Spec">File::Spec</=
a>;
-+use <a class=3D"moz-txt-link-freetext" href=3D"File::Path">File::Path</=
a> qw(make_path rmtree);
-
- BEGIN {
-     use_ok('Dpkg::Source::Archive');
- }
-
-+use Dpkg;
-+
-+my $tmpdir =3D test_get_temp_path();
-+
-+rmtree($tmpdir);
-+
-+sub test_touch
-+{
-+    my ($name, $data) =3D @_;
-+
-+    open my $fh, '&gt;', $name
-+        or die &quot;cannot touch file $name\n&quot;;
-+    print { $fh } $data if $data;
-+    close $fh;
-+}
-+
-+sub test_path_escape
-+{
-+    my $name =3D shift;
-+
-+    my $treedir =3D <a class=3D"moz-txt-link-freetext" href=3D"File::Sp=
ec">File::Spec</a>-&gt;rel2abs(&quot;$tmpdir/$name-tree&quot;);
-+    my $overdir =3D <a class=3D"moz-txt-link-freetext" href=3D"File::Sp=
ec">File::Spec</a>-&gt;rel2abs(&quot;$tmpdir/$name-overlay&quot;);
-+    my $outdir =3D &quot;$tmpdir/$name-out&quot;;
-+    my $expdir =3D &quot;$tmpdir/$name-exp&quot;;
-+
-+    # This is the base directory, where we are going to be extracting s=
tuff
-+    # into, which include traps.
-+    make_path(&quot;$treedir/subdir-a&quot;);
-+    test_touch(&quot;$treedir/subdir-a/file-a&quot;);
-+    test_touch(&quot;$treedir/subdir-a/file-pre-a&quot;);
-+    make_path(&quot;$treedir/subdir-b&quot;);
-+    test_touch(&quot;$treedir/subdir-b/file-b&quot;);
-+    test_touch(&quot;$treedir/subdir-b/file-pre-b&quot;);
-+    symlink <a class=3D"moz-txt-link-freetext" href=3D"File::Spec">File=
::Spec</a>-&gt;abs2rel($outdir, $treedir), &quot;$treedir/symlink-escape&=
quot;;
-+    symlink <a class=3D"moz-txt-link-freetext" href=3D"File::Spec">File=
::Spec</a>-&gt;abs2rel(&quot;$outdir/nonexistent&quot;, $treedir), &quot;=
$treedir/symlink-nonexistent&quot;;
-+    symlink &quot;$treedir/file&quot;, &quot;$treedir/symlink-within&qu=
ot;;
-+    test_touch(&quot;$treedir/supposed-dir&quot;);
-+
-+    # This is the overlay directory, which we'll pack and extract over =
the
-+    # base directory.
-+    make_path($overdir);
-+    make_path(&quot;$overdir/subdir-a/aa&quot;);
-+    test_touch(&quot;$overdir/subdir-a/aa/file-aa&quot;, 'aa');
-+    test_touch(&quot;$overdir/subdir-a/file-a&quot;, 'a');
-+    make_path(&quot;$overdir/subdir-b/bb&quot;);
-+    test_touch(&quot;$overdir/subdir-b/bb/file-bb&quot;, 'bb');
-+    test_touch(&quot;$overdir/subdir-b/file-b&quot;, 'b');
-+    make_path(&quot;$overdir/symlink-escape&quot;);
-+    test_touch(&quot;$overdir/symlink-escape/escaped-file&quot;, 'escap=
ed');
-+    test_touch(&quot;$overdir/symlink-nonexistent&quot;, 'nonexistent')=
;
-+    make_path(&quot;$overdir/symlink-within&quot;);
-+    make_path(&quot;$overdir/supposed-dir&quot;);
-+    test_touch(&quot;$overdir/supposed-dir/supposed-file&quot;, 'someth=
ing');
-+
-+    # Generate overlay tar.
-+    system($Dpkg::PROGTAR, '-cf', &quot;$overdir.tar&quot;, '-C', $over=
dir, qw(
-+        subdir-a subdir-b
-+        symlink-escape/escaped-file symlink-nonexistent symlink-within
-+        supposed-dir
-+        )) =3D=3D 0
-+        or die &quot;cannot create overlay tar archive\n&quot;;
-+
-+   # This is the expected directory, which we'll be comparing against.
-+    make_path($expdir);
-+    system('cp', '-a', $overdir, $expdir) =3D=3D 0
-+        or die &quot;cannot copy overlay hierarchy into expected direct=
ory\n&quot;;
-+
-+    # Store the expected and out reference directories into a tar to co=
mpare
-+    # its structure against the result reference.
-+    system($Dpkg::PROGTAR, '-cf', &quot;$expdir.tar&quot;, '-C', $overd=
ir, qw(
-+        subdir-a subdir-b
-+        symlink-escape/escaped-file symlink-nonexistent symlink-within
-+        supposed-dir
-+        ), '-C', $treedir, qw(
-+        subdir-a/file-pre-a
-+        subdir-b/file-pre-b
-+        )) =3D=3D 0
-+        or die &quot;cannot create expected tar archive\n&quot;;
-+
-+    # This directory is supposed to remain empty, anything inside impli=
es a
-+    # directory traversal.
-+    make_path($outdir);
-+
-+    my $warnseen;
-+    local $SIG{__WARN__} =3D sub { $warnseen =3D $_[0] };
-+
-+    # Perform the extraction.
-+    my $tar =3D Dpkg::Source::Archive-&gt;new(filename =3D&gt; &quot;$o=
verdir.tar&quot;);
-+    $tar-&gt;extract($treedir, in_place =3D&gt; 1);
-+
-+    # Store the result into a tar to compare its structure against a re=
ference.
-+    system($Dpkg::PROGTAR, '-cf', &quot;$treedir.tar&quot;, '-C', $tree=
dir, '.');
-+
-+    # Check results
-+    ok(length $warnseen &amp;&amp; $warnseen =3D~ m/points outside sour=
ce root/,
-+       'expected warning seen');
-+    ok(system($Dpkg::PROGTAR, '--compare', '-f', &quot;$expdir.tar&quot=
;, '-C', $treedir) =3D=3D 0,
-+       'expected directory matches');
-+    ok(! -e &quot;$outdir/escaped-file&quot;,
-+       'expected output directory is empty, directory traversal');
-+}
-+
-+test_path_escape('in-place');
-+
- # TODO: Add actual test cases.
-
- 1;
---
-2.33.0
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expec=
t-D-to-be-set-when-running-in.patch b/meta/recipes-devtools/dpkg/dpkg/000=
3-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
index 75ae848264..5e52427caf 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-=
be-set-when-running-in.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-=
be-set-when-running-in.patch
@@ -1,4 +1,4 @@
-From dd11ed66640f79143e42d778b58fdd5a61fb5836 Mon Sep 17 00:00:00 2001
+From 115fed94be9c61d2a8de21e7d169b5872e9ebd09 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
 Date: Wed, 26 Aug 2015 16:25:45 +0300
 Subject: [PATCH] Our pre/postinsts expect $D to be set when running in a
@@ -12,21 +12,21 @@ ALIMON 2016/05/26
 ALIMON 2017/02/21
 KKang 2019/02/20
 ---
- src/main/script.c | 54 +++--------------------------------------------
- 1 file changed, 3 insertions(+), 51 deletions(-)
+ src/main/script.c | 53 +++--------------------------------------------
+ 1 file changed, 3 insertions(+), 50 deletions(-)

 diff --git a/src/main/script.c b/src/main/script.c
-index abe65b6..0edb8f1 100644
+index b4f369dfa..559a49cc5 100644
 --- a/src/main/script.c
 +++ b/src/main/script.c
-@@ -96,58 +96,10 @@ setexecute(const char *path, struct stat *stab)
- static const char *
+@@ -97,58 +97,11 @@ static const char *
  maintscript_pre_exec(struct command *cmd)
  {
+       const char *instdir =3D dpkg_fsys_get_dir();
 -      const char *admindir =3D dpkg_db_get_dir();
 -      const char *changedir;
 -      size_t instdirlen =3D strlen(instdir);
--
+
 -      if (instdirlen &gt; 0 &amp;&amp; in_force(FORCE_SCRIPT_CHROOTLESS=
))
 -              changedir =3D instdir;
 -      else
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.21.4.bb b/meta/recipes-dev=
tools/dpkg/dpkg_1.21.22.bb
similarity index 86%
rename from meta/recipes-devtools/dpkg/dpkg_1.21.4.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.21.22.bb
index 7ef6233ee4..04bcc93321 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.21.4.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.21.22.bb
@@ -1,7 +1,7 @@
 require dpkg.inc
 LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://C=
OPYING;md5=3D751419260aa954499f7abaabaa882bbe">&quot;file://COPYING;md5=3D=
751419260aa954499f7abaabaa882bbe&quot;</a>

-SRC_URI =3D &quot;git://salsa.debian.org/dpkg-team/dpkg.git;protocol=3Dh=
ttps;branch=3Dmain \
+SRC_URI =3D &quot;git://salsa.debian.org/dpkg-team/dpkg.git;protocol=3Dh=
ttps;branch=3D1.21.x \
            <a class=3D"moz-txt-link-freetext" href=3D"file://noman.patch=
">file://noman.patch</a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://remove-tar-=
no-timestamp.patch">file://remove-tar-no-timestamp.patch</a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://arch_pm.pat=
ch">file://arch_pm.patch</a> \
@@ -14,11 +14,10 @@ SRC_URI =3D &quot;git://salsa.debian.org/dpkg-team/dp=
kg.git;protocol=3Dhttps;branch=3Dmain
            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-dpkg-S=
upport-muslx32-build.patch">file://0001-dpkg-Support-muslx32-build.patch<=
/a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://pager.patch=
">file://pager.patch</a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-Add-su=
pport-for-riscv32-CPU.patch">file://0001-Add-support-for-riscv32-CPU.patc=
h</a> \
-           <a class=3D"moz-txt-link-freetext" href=3D"file://0001-Dpkg-S=
ource-Archive-Prevent-directory-traversal-for-.patch">file://0001-Dpkg-So=
urce-Archive-Prevent-directory-traversal-for-.patch</a> \
            &quot;

 SRC_URI:append:class-native =3D <a class=3D"moz-txt-link-rfc2396E" href=3D=
"file://0001-build.c-ignore-return-of-1-from-tar-cf.patch">&quot; file://=
0001-build.c-ignore-return-of-1-from-tar-cf.patch&quot;</a>

-SRCREV =3D &quot;5563bdb608b3413639b69f1c76567cb66ff1a961&quot;
+SRCREV =3D &quot;48482e4f16467e05a08aa3b3b8048e08f0024609&quot;

 S =3D &quot;${WORKDIR}/git&quot;
--
2.25.1




</pre>
        <br>
        <fieldset class=3D"moz-mime-attachment-header"></fieldset>
        <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#200400): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/200400">https:/=
/lists.openembedded.org/g/openembedded-core/message/200400</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/106517331/3616765">https://lists.openembedded.org/mt=
/106517331/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------RJLlAnzRJMnvaI7M2xL0ttYu--

