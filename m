Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D3FC433FE
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 13:32:15 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.64])
 by mx.groups.io with SMTP id smtpd.web08.10933.1639402334568256253
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 05:32:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=nIwsAiq4;
 spf=pass (domain: outlook.com, ip: 40.92.91.64,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DNZvZdtGM92aYO33cVYxT854tHmUSxQ+IfmD3iXCFmOd0gjwUeCmouz/1+2UCEsKgol6E7Orlo5m1SRSXr5h2zBzHI9Kjh9EZ+zw8vkzdXpynhjwNTGbLfVT7K/mhro1f7EcXr4u+b/W8EH2LSoyRlqB77Ebp2jPdrevnSuw1ZBjpdY1Lc9qlAIYGsV43buwEAyLTd15Fp3UwzSXzOaubbjO5GqNOG9Lm2Vmv+YMDKxbQq4WhlYQ71xNPuMEtlWfrjAf5SN3QzUllDDjq2uUsbMnPhAjPdzyEzm4TE5NmXmF8MCCIerDvh1uJvutFKAwfBR6vbES83zz59okcT0guA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGK8wPjK1diJ7eaubPxmF3O6dHmzJ2t7ZnGDK7Ffp0U=;
 b=TTdAf4vDM34PIg10X6+eDTh4MdKLeZPut2JufSMzWzWZZZkkgfR3rhN+dMXI9g+GqcUtKkHZoW1V71D7+9vPQ4FEhwGlabkh2M+8vlcsOjVPdDuq+wY8zkf7kKyuFhV4T4DQffg/1NGjpkih8CWU7z2Rn6GYZ794ySe5HwZ+8G/O0r3KBzIErzQIIHBU1+L3ifsA8bZHrEukflL6zhX2liOOBle2VuB8ugf7tddMq8jNGZqOohHbBVVDY8cyrKU6bDWXTZ47aT8UpjJUSWGFtmwAg37UOhsP93QdCFM46nohbMMkgR/fOfQ7s3KP9mbsZ9SMSFNObuCRMMvyHu8Nbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGK8wPjK1diJ7eaubPxmF3O6dHmzJ2t7ZnGDK7Ffp0U=;
 b=nIwsAiq4DctMX6Pg6q6kFbL7ZMXkVzXsu7GqS6AtcceMZqI8KYDmMp1Jg+0X7wr/vamY8G7In50p3CFPDXBm2hk2GlW5jPv4EW9qkJh8hBNQYToHidcvqzI8FRhKU2NxyMl+BpYJAT5ot5fsE1MYU/gJrQYfK8YgAsBoIYCsq1krzNJr3zYx1/FH3xavX1nkgxIeOi5e8fV/dMc8q0VDkGn7oKBgSMYnw/Tes97byakSk5CUjmXNCpJxxwSEPT7s7RphPGa8vxpvur7ozTDb3kYU/xR7LkaTGG9LsjVO+gk6OetNtPN3Z9CK/cI9yBVl73YmKel4eLKaVVVF//UKOQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2772.eurprd09.prod.outlook.com (2603:10a6:208:124::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 13 Dec
 2021 13:32:12 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4778.018; Mon, 13 Dec 2021
 13:32:12 +0000
Subject: Re: [PATCH] [OE-core] [PATCH] less: upgrade 590 -> 598
To: zhengruoqin <zhengrq.fnst@fujitsu.com>,
 openembedded-core@lists.openembedded.org
References: <1639434614-2679-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642A5E9322A13691D5534D1A8749@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Mon, 13 Dec 2021 14:32:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1639434614-2679-1-git-send-email-zhengrq.fnst@fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [XJpqo5TwVDLszPycXICxNw41+bRs8/uK4I/bqF4dyhblDmjOU2fOhWyWbT5lM69Y]
X-ClientProxiedBy: FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::12) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <08ac7410-54e0-7e46-4514-eecce7893d5e@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b27d3a12-1651-473d-5ca6-08d9be3cf811
X-MS-TrafficTypeDiagnostic: AM0PR09MB2772:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xhmnH5HpOecfbjO7M8X0lDGKgVu0fdasbtexHpIvj/u249yhL8VcqAc+A3hD4XC87Kfs0F0SvBFZWDw+pAtUMk2yj6CQKkaK0+UxEl43c7Y259PMsL/uJ5ofYqKQKbBXZg7yLFj4R9+CVPlwkgz36IlA7w632g85FgKlh39rpXXWwZIbPDNmSyZhJTFLepzZVEm7hRfYenw8tVLN2VpenBh79zDwpO5usWpVya/Y6IHW9rEuUBQop0fp3kzYRchlJw701r6XgleZqzQFhj/G023nxonsAedXOMLbT6b0Pt1q5PU4RnIcmR0d3E4ClixkaKkIjYCRKR0Dhc85YUqvL5L+tLH4AgdcUBaolxIOqeGzFMTXUlpqKwusOGjBcW2XHD8zuym1mvIjPCEDodRZAfoNVja1J6vHzrwpu/UN8jXY50D1rOe1gvjm9B9wl18RzPj9q92I59XxGj0rLnRrDp1v2in6GfdIRybR0zjGmKSa/HTfU0zbAhlHcFgN2uckykLfXKszQuXdO9GEatdMFeYzSv3py0bh+SAOdCZ4SJFvij9wFRXkmfiAzhF2oFXBfOh5KJVKF03WY0Fty3rVeKf4Bq0NFUOw37mLS641q8QCyWhOXWbn6X+OMjFIAbgyn2U0Kfbo0CE/DwLN43BCPIqMzeNS5Z6S7qEWCak4bIk=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dnJVUmtjcmV6RFg5VHlQNCtkVi9PV2hVNWdza2JQdk9YSmtsOCtXQ2pCQURV?=
 =?utf-8?B?Nm5DcHMrQ0F6b2ROSDNqSkQ5ZHgyekpUSmVsYkNCbXFDT2k3UEt4YkNqY0c1?=
 =?utf-8?B?aFFGR1hkWHFBT05Pc2lSSVdvV084Q0VVbllQUzRSSTNIdUtLQ0E2TnVPZG1n?=
 =?utf-8?B?MDFMSE9mSFBzR0RsdDU1TXRwLzNLaERkVS8rMWVBV3BNMXJxTlBlRDA1WCtu?=
 =?utf-8?B?aDVaR2pNVzhyUTBwSDI0eTljd0VFaEJGTFZzb0tObU1PTlZZK2k5ODhGVFBX?=
 =?utf-8?B?UTRiYVAwVE1naFoxb21vekZkS3pvTGlkQ0VKOCtOOE14RjYrN1NZTnBXaXRB?=
 =?utf-8?B?T1NEaFd6ZjA5Y1J3MzZlNk9kWHhaWjA3UDk2NUgvTXh3SUhKbnREYVdOdUF1?=
 =?utf-8?B?MEJZVnNGZGprdFRTdmpjZktWTFQ0RnIvbUVHbHI0dG1tZzBDR1hIbWRpMlJH?=
 =?utf-8?B?QzZHVGhzZnp0UUJ3b3NqU3JjNitpZ1Jic0liNXlsdTdRMGZqUDNKcGNXVmhi?=
 =?utf-8?B?MUNScnNHS3pIVVA3L2Q0WTlEQjA2Qk9qQkVWT0EwTWc3UTQrbzVuc2U0T0dN?=
 =?utf-8?B?K3k3dkl6SUNzaG43cVBoNTVXQ3VxR0V5eXl0ZG5aSHU1UzV0cTNLUGRmM3JX?=
 =?utf-8?B?bzZDa3h5VWJxdS9QVkw4eGVWa0RwZlFYc3lFVWdkamMvZHdkSUM3RU03KzU0?=
 =?utf-8?B?Z2VTV0djY1UxdnF2K3BISWRHQ2lQNk03aDdNL0ticTBsMmVsak95ZDE2OTgz?=
 =?utf-8?B?QkxDN1F1di9WZy9wbXEzM0x1Tll2WWV4NThSdmYwaTYvdzdLN1dxSU5ZYnlQ?=
 =?utf-8?B?SnRUQ3JJRXdtU0VNbUp5TVJ5TURrM2F2TFk4TmFsM0gvUWdLMitqdHF4L3hl?=
 =?utf-8?B?Tjl0cGk1UlRQTzExeSs1VkRHOWt5cFFLQmtubXJFUHU4cHRQeGdoRGtMMkZ4?=
 =?utf-8?B?R21pRnJqTVcvK3FQenBxb2lPWEFkVkVTUDV2TlRlL0xNSnpwdThjMXdnZk5G?=
 =?utf-8?B?UFdOSUtvWkpEVk5laUpDVWdEbW9xdU4veWhEcExiRWVsRjh0alBDMmNRQmpE?=
 =?utf-8?B?bzVTMjFiYTZYZnlIMDdodm5mRWRjOHVJcS8wd1o4MXo2UEJlTmNsQzdwTnlM?=
 =?utf-8?B?OStpcnJJa0RZZ2lYcmRqMGhjcUs1VGhieDhyMGdTeGQxeGNMd282ODNUNVJk?=
 =?utf-8?B?aXBESnVHb2FJeXY3OUV4bk9XbUczQno0UlIyWWN0SUZ3K2FVTTBreDh2QjJ2?=
 =?utf-8?B?aTljOHc4Q1hWc1lEUUJVTWFGS1JnMkFTVlV0RHp4VnlyRk1od3AzcnBmOVNo?=
 =?utf-8?B?VEZ1ekQzRG4rWGlqS1QxL3E2bVlXdE02WWFHWERxZmY4UVYxNkV3MmJocDlq?=
 =?utf-8?B?MTBEaXE2eGJjeGc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b27d3a12-1651-473d-5ca6-08d9be3cf811
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 13:32:12.4764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2772
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 13:32:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159636



On 13.12.21 23:30, zhengruoqin wrote:
> Changelog between version 590 and version 598:
> =============================================
> Add the --header option.
> Add the --no-number-headers option.
> Add the --status-line option.
> Add the --redraw-on-quit option.
> Add the --search-options option.
> Add 'H' color type to set color of header lines.
> Add #version conditional to lesskey.
> Add += syntax to variable section in lesskey files.
> Allow option name in -- command to end with '=' in addition to '\n'.
> Add $HOME/.config to possible locations of lesskey file.
> Add $XDG_STATE_HOME and $HOME/.local/state to possible locations of history file.
> Don't read or write history file in secure mode.
> Fix display of multibyte and double-width chars in prompt.
> Fix ESC-BACKSPACE command when BACKSPACE key does not send 0x08.
> Add more \k codes to lesskey format.
> Fix bug when empty file is modified while viewing it.
> Fix bug when parsing a malformed lesskey file.
> Fix bug scrolling history when --incsearch is set.
> Fix buffer overflow when invoking lessecho with more than 63 -m/-n options.
> Fix display bugs with --header.
> Fix bug restoring color at end of highlighted text.
> Fix bug in parsing lesskey file.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>   meta/recipes-extended/less/{less_590.bb => less_598.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-extended/less/{less_590.bb => less_598.bb} (87%)
> 
> diff --git a/meta/recipes-extended/less/less_590.bb b/meta/recipes-extended/less/less_598.bb
> similarity index 87%
> rename from meta/recipes-extended/less/less_590.bb
> rename to meta/recipes-extended/less/less_598.bb
> index 5d0d0a5afe..574efff365 100644
> --- a/meta/recipes-extended/less/less_590.bb
> +++ b/meta/recipes-extended/less/less_598.bb
> @@ -20,7 +20,7 @@ SECTION = "console/utils"
>   #
>   
>   LICENSE = "GPLv3+ | BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \

Could you please highlight why the LICENSE checksum changed as part of 
the commit message - apart from that thanks for the changelog, which is 
indeed very helpful

>                       file://LICENSE;md5=ba01d0cab7f62f7f2204c7780ff6a87d \
>                       "
>   DEPENDS = "ncurses"
> @@ -28,7 +28,7 @@ DEPENDS = "ncurses"
>   SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
>   	  "
>   
> -SRC_URI[sha256sum] = "6aadf54be8bf57d0e2999a3c5d67b1de63808bb90deb8f77b028eafae3a08e10"
> +SRC_URI[sha256sum] = "64e0eb24534ac70d15ff3a36c8853f7a48196aa230d2a104707fc4ff1a45e982"
>   
>   UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159632): https://lists.openembedded.org/g/openembedded-core/message/159632
> Mute This Topic: https://lists.openembedded.org/mt/87697195/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

