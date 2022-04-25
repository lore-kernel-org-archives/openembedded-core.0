Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5250BC63717
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.34281.1650912804107419391
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 11:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VPQICBt5;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=1114c45423=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23PENxnj019270
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 11:53:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=aC87uAPn9SODAbEeLbkHB4hkfQTUdEnV9ucuxRkdSeA=;
 b=VPQICBt5ExrcByNdo8gLU7UCWnRgd6oDUS1R4JZNVx+DUF4FRqVhvHlkroZW7xe7Zo+L
 urhMWxxD4Cy9MjEpfcInZs9qAC5c8NprU/quR7EBGPNaqA6g3K8QO6qM4BYHG4POj5IT
 VADJAxjed1WPXPJtdvxStRMWCJ6e3skztQuMaVVrrequngksz1Cb+qpslxGxnc7Zqh3N
 jvP48tsLj7tltCsEsDtasLeI78dk+hV5LLMHZSy1/HSbYrZPLzl4lYTRS9b0k7lKhkRz
 Ku9EfnMXqsCRIoEef6e9P4agy2AGgoJccheISGWkeapy1ujyw4b8R+Ccd4VWO4u4/Q2L HA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fmgyksj8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 11:53:23 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23PIrMVX018583
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 11:53:22 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fmgyksj8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Apr 2022 11:53:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdHW2kbKyNK1K1tzRg1IREgpVlWRYTEdIjazDfenl5CmIz7bBWabVF+07G1ShfbM1DmCd7/Qsy1xw/ElezhWN9ytIbmVNzLfZwdW24dTxgpgyPa6s8hEmcU7Fo7/Kp/k5SJvJnxWqR/PgBIRUPB+jcBVzD449e9UVsaJy3ejX57zs05cGnBD8l0WFFX3QzF9d83B9tkH56CDg0eibxlqkQpCad4GEaCXplgCKzLo19U02++UtFkdLaCD7xEfu9Xp6KCplSRcqePFOW7oBBzSLK1vmFIa7qkQ3U4ky6JMO9fmdsmkyf/HnACWThI9z2TNVEVPgMIiBznfQwUaOupAxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aC87uAPn9SODAbEeLbkHB4hkfQTUdEnV9ucuxRkdSeA=;
 b=dE/vYO3TaFmv0+yo1dVu12FyhT61jupEIfFgvZjImaSQIvTs+AmhLyGOnkwy8slm1gjbpNN2ptPd7mQidWU+OG+/LvZi2BkM75bdvSJTlGtKE1JyubkhzJ8DYl/1PB+nIsfA+CteKB3pidgf3UKwoCg86YIdmu5ay6FEBlJYiNzuc64uu0TwQiYj6a94D40Uf5Tv1CRO835iAIJH3OGMMyXEbu2kXboXoZqiqtLfQAGXqLCR/x4NIgupm/oqkzwJodqnzSh7ed33gSjPDuI9/h1ZRlLy2QymMhDquKdlmtov/U2H+pIE10YO/W25kb9Q4o9os18xi4NYdrO3ASxQfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BY5PR11MB4481.namprd11.prod.outlook.com (2603:10b6:a03:1bf::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.20; Mon, 25 Apr
 2022 18:53:19 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::4529:9749:17c6:d1c2]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::4529:9749:17c6:d1c2%7]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 18:53:19 +0000
Message-ID: <5391aff2-122e-f527-a0d4-2807ce85d980@windriver.com>
Date: Mon, 25 Apr 2022 14:53:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [hardknott][PATCH] bind: Upgrade to 9.16.28
Content-Language: en-CA
To: "Yu, Mingli" <mingli.yu@windriver.com>,
        openembedded-core@lists.openembedded.org,
        "Mittal, Anuj" <anuj.mittal@intel.com>
References: <20220425083632.3473657-1-mingli.yu@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220425083632.3473657-1-mingli.yu@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:a03:255::31) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c8b2f24-b626-488f-54a0-08da26ecdd61
X-MS-TrafficTypeDiagnostic: BY5PR11MB4481:EE_
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB44817A2283F1C95B2FD10687F8F89@BY5PR11MB4481.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sPnokGGb3ZG+/ZqIcMD+hg9KeaAuCls2pQ9sUOZomCHrr/7x+UQ7zZfPnie/9IIVe3Rz+rscJ9I7D5NVnGH/5aVpLEDC8Pgu8OutIWgcufrAtvDl2Be4niLRhwvGiWl4vZ3DUp4JqBC0z+Cjr98WVMFiTrHCRcCQVlCAuaXATLzlC6m0kZe8MMv6nBw7tbRchsraDTpK2jXbkNf3inAJiTkQ0mu6quriFJJNRC0yhXIMQl10vKQeoFRHmdC8jAQ4GrPRcKJPQykE/WL7jXdrIuRg6Jd1WmFV0RYBb+djHzWnbj7CnIHy+u/ELaiiiIicq5eJv9m+qRycUDbaQer+9i5INf8mpWosMCF00qOw+VOWhD9RZEuZbZIKQZt85WdCfMN93KJeCndTLCEV8MWJvSV7EVzPih/K6nNAz46BBRLLiC/xLIZoI1wwlqXvedIRJfg7uJ80r3PVybQ0BmnNNke0THir7iXKhz6TrkD+EB0rE6jhhTK9V5helpNqO8q/zXM4t0Ebx/MdDpsSLygU5YbnfJa0cOcwWUxqoKwfl5qxntWP0vfYm5CXXzd4uihQq6Yw7T3x7ggL8NkSrgTNPinThH/LgdKB4Dj/mXIAZ1DGbza1/e6OrNuHgvXg6iHE/wpwIXdHmxHrttjINkwdQMKhibz9CD3ijoV/EqzHOEOOzy2RwbYFa3E0tfsvAae8ZKmCVBTR3g+ufmQauLk8jht1mlHnWGxnLKDTFS5qA125svAx0s8yi39PYwKYCYpC8P/QywI822c0/t6sGQHSTj+V4spQi8wRD1eURR03UvMpxzU1yvOZsyceNrCilT8m8GWvsGyVe6njmW6luC9u6LuVul0mwLxDTNXKKvv3akY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(508600001)(6506007)(53546011)(110136005)(83380400001)(966005)(6666004)(2906002)(52116002)(38100700002)(38350700002)(31686004)(36756003)(316002)(66556008)(66946007)(86362001)(31696002)(186003)(8676002)(66476007)(2616005)(8936002)(5660300002)(26005)(4744005)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RGNoWGxmaWFVTG9FVXptdmdQcEMyZDVCTW1Jcko5VHN3bXJyZEpNUHMzR01p?=
 =?utf-8?B?VllUVjd1TVcrMXB5LzR2aFhKWGR3dDF3V21LbzZRdUg3Vll1SGR0WFYxVGxj?=
 =?utf-8?B?VVl2a3VaVUd0eWN3OGJwbVI3L00vd0pnUldTN0kwSjJ3TVBqYU41eC95R0or?=
 =?utf-8?B?WEdhNWg2Rk5PNGJRWWRPeGV6a1pteXJ3WExKQnVZRWN1VmtFaU1odXRDY0U5?=
 =?utf-8?B?WVVoRVRTRCtNazUvVzh5NHRrdHZNZWR0WHVQcnQ5TGtQUWJVNEpGbTNlT2xl?=
 =?utf-8?B?b1dGTkMyN2NLcjNocUdmd015bUFiZmUyODBQNGd2WmRWamc4S2tKYzlBME50?=
 =?utf-8?B?WHNEMEIwdThDSDE0Vi9rZ1VWUmdpREFhNUwyNW03WVZNR0FyaUorMzQ5VC8x?=
 =?utf-8?B?UXppczJQS2xWaDJobTVkeUlHeW5VYUNZMGFOZWNMNm5DaE1uYnpKQmFuNmt5?=
 =?utf-8?B?d3ZuSEw0OGkyU3ZLUHBaVFgzQXNSTXFML1dhOVpwQTR6UnZCNEhGSTlLZFdk?=
 =?utf-8?B?R3pzaDltY3pKMHBlQUlsQ29UaTVrVXJEbGpNNGMyWnBWUTY0Y2duUHZyQU5I?=
 =?utf-8?B?Z1hUeXFycGxGazdEeFl4c1hKSnc4NVRkQWFKYUlKUU1iL1pva1lRbjdGZmdt?=
 =?utf-8?B?TldGMUxkVUhnUHMwUzFSaG1MQ1oyZTBrZEdWVWxUZFVRd2Fta2VhaGJEZk9h?=
 =?utf-8?B?ME9XeE1yZys2Q0VJa3lVZmNOeDJONVg5RGJjbjM0Zmp4VEhuM2F6S1F3MFpV?=
 =?utf-8?B?RjRWbk12OWl3NlNpNStkMjB0QnV4SXFkVVNISEtZTHNUU3dJdzdNbnNYNW9C?=
 =?utf-8?B?a1N5VTVnR3Z2V3MxVzdDYTZ0V3pra0duR2tsQlV6T1RYb2JFYkdicUI0MXM2?=
 =?utf-8?B?SHBzUXQ4MnVheEpDK015cGxrdDNqT2J1Tm1YbkxTcXU5TFJnRlZKUmc1Q28v?=
 =?utf-8?B?RU1yZnI3NE9MNHRZYzl0M2QvVXhFMythU2NIY2prei9qQ2ZsdldlTFhlTXhJ?=
 =?utf-8?B?cll3L3I5S0VYVXdMbDN0UkdrY1FJd1BFQktEbVIxbXM1TUJMVGI2NmxtUXpE?=
 =?utf-8?B?MDM1SVBGbCtGYlBtbjZlaWJRemhyOGpUdTdhcFNOYVhCbXdTN0RLU2VaT0FU?=
 =?utf-8?B?aDNsa2NjSlJHSWxMZkVCSWZOVUtkZmN2eVh4aTlMc2djQ1FkRnVFbml1Z3Nr?=
 =?utf-8?B?UnNrbjdieVRYUlFVd3lVeTJtVGZibHR4VlFxWDNuZVlSZkxZdVBHbUVCbWxZ?=
 =?utf-8?B?REk1dDExUXhQK0R3S3NIQlJRTjNLdi82UUdHSWZVdnlWVWhaS2F1QzBUckZz?=
 =?utf-8?B?QmRJZzEva0xrcVgrRDNJR1B6SzlGM3dIYUdtYUMvVE5IUGZ4dW1MNmJoNENF?=
 =?utf-8?B?TWhaYXlBTCtpeXBOSEErb1ZZaXJQbDJndTJ1Q0tvVFpzSUdiaUN3YXI4NDFY?=
 =?utf-8?B?UVl6UFpoSWQ2dVcxNUc2Mmd1VFhZZmVhcWNRUVFkV01VSlZId2VEaVE3U1kx?=
 =?utf-8?B?Z2lRdnc1V3hPcFdKK1RnN3RpRGhHZkxPNE9tVzFPOW5ReXQrbE9zSXFWUVRG?=
 =?utf-8?B?ZFRCT2ZlRDdyLzA1cEdNWFpqT1hnd1VzakJKWVU5ZzhqcGFmaC8zWEY4Y3Q5?=
 =?utf-8?B?RFllOGl2dExvOTJwaVFVbE9LL2FXaUxyYmU0SS93TUZnbktjWThHaXhnZDlR?=
 =?utf-8?B?dlQxZ3ZsZisvUHpiSlAyejk2U05Vd0dkemc2UjZYM0NjRVdZNFRmUFZEdU1L?=
 =?utf-8?B?bG15UHpJUnJDbGVlR05wVDYrYm1ob2hkZCtveVArdDFVa2ZBN2JESmlGc3oz?=
 =?utf-8?B?T3prU1N4TmFQbFBQTC9ESVdyMm5zMm9SVWlpbWUzRlk1WTNkeGl4MDJtdEov?=
 =?utf-8?B?SVZ4Sm1rNmV0eFRtOFZMaXhtcG5oYjkrbkNrUHVNdEpnTEJoQkduN2R2K2Zl?=
 =?utf-8?B?cjZCOGh6TjgreGpSVlNLOURxTEFUWjRQYzFvWms5LzRyNldiYnVMN1F2N2c0?=
 =?utf-8?B?ZnJXT3FTRjg0ekc5Z1Vua1liRG1Pb1ZCY0VweE9oNWJqMDh2SW9Xa1dpeHcy?=
 =?utf-8?B?amVYblJOc3dpa1JlaWQrZUErUldXdWV3R25ZOVRWNmNmOW5VMHZxalF4NnBW?=
 =?utf-8?B?S3owUWRiZHhuYmhmcjRTcWNENCtNOTNvVGhPSlVmRkFzYzYySk1BeXVnZnJP?=
 =?utf-8?B?MGpHUnpiNmVCVnBKbHdsL2ROdkhESXZKM3pMREV3dVVJRFgrdGxEQUFGU1hz?=
 =?utf-8?B?c2dUTko2T2NTT0FkcVB6dXU2YkNYaGhqM3BZWW5EWXl3VzZyVWNOaytaeGgr?=
 =?utf-8?B?ZENEZVZVY1FBTForQUo3OFl0N09RbGt6ajFFLyt1clFrVmRRRTI0TGNFMFRM?=
 =?utf-8?Q?Q9VmUp2Iw+xsXv1XsnBqE8dw9VHTngmvcXjaf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2c8b2f24-b626-488f-54a0-08da26ecdd61
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 18:53:19.6033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ibbmft7gWJpWgasiERh7HfOW2Pvfb+CAAq23iSiPVJjtZ76EXRKJ41lvPHuV5MOP7ajBhM8ZHx3BasHBukt6NpL3/oyt5Gynbp0Vh8UzO7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4481
X-Proofpoint-GUID: KpY2vU9w01-Q-VUErJ-nyaIS-EOWqh4M
X-Proofpoint-ORIG-GUID: k-AspkFDroGVqcJCIKEwVndeOFXjR-N2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-25_10,2022-04-25_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=995 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204250084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164841

On 2022-04-25 04:36, Yu, Mingli wrote:
> From: Mingli Yu<mingli.yu@windriver.com>
> 
> * The 9.16 branch will be limited to bug fixes [1] now and upgrade to the
>    latest 9.16.x release to fix some security fixes.
>   - CVE-2021-25219
>   - CVE-2021-25220
> 
> * License-Update: copyright years
> 
> [1]https://bind9.readthedocs.io/en/v9_16/notes.html#notes-for-bind-9-16-28
> 
> Signed-off-by: Mingli Yu<mingli.yu@windriver.com>

Hi Grace,

hardknott final release (3.3.6) has been through testing now (1) and
no issues were found, so new commits are not being taken.
It's EOL.

We'll have to handle this locally in WR Linux / LTS21.



-- 
# Randy MacLeod
# Wind River Linux


1)

https://lists.yoctoproject.org/g/yocto/message/56878?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2C3.3.6%2C20%2C2%2C0%2C90578883

