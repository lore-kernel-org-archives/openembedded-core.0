Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D70AC00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 15:35:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.7257.1660145709757798244
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 08:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gH2bxjp9;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5221100a95=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27ACXh0m026913
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 15:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : from : to : references : cc : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=DXUYvmkNc7ExbVqGRy8gWJXSjv9JKVOf/1Cp0o8AaxU=;
 b=gH2bxjp9J5oFDvD7HfMqjS5nIscoA3HCuGKRLpl3HHoaCBAo+a5I1AjvGLk+3w32Pa4k
 2dl3FvESl5/RqEMA90rZkD5SUCycWjc8aU4003qu+txg6SwKtRb+ZFy2U1x7GL5j8Xv5
 b+jfOcmWcos+6mfWfdyQnNrAMTpWHm+6YD9kzyLYKtmpnJQEEaoNMknSVoVZw7gW2FJx
 CBlq8wkJhltuPmWkn+Ihv2vm6H1LjZ928ve1ZYiIlyJe22Km1OJ39k71+9zoOjMqDQuR
 L2oM+lvF0nzlIHyR/DI6m3p0zU062JozNDMCtjJfsz/YGaVstIi8tAsltT8H021vrV4F 1A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3huwrd0p0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:35:08 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27AFWEKW032597
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 15:35:07 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3huwrd0p0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Aug 2022 15:35:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9gyeii758TvObGa0jD888tokGJBPaRu8YgW9PgRi4mPcsy6Y8H869jMiD26COWBdPj5DyO+Dwr7BNCDzpX03XQqVOn0aE5wWTdXaKzjFKitPSU2j7w4OILQuInQ8tfYoyrr6gDpi9ojSulp4zKSm0lsbAg+Cmx+kdqJrc16BODO8xqWVNgsL4oLJNwjDdO39t43fxf6z3D8KIguEplAXzfgVf2rB4irLeBfa5/AMKEkaIm8f0N9dH8nTcUJvcauhYMjk+W0DJo44Mlu65dYS1O4HkvX3YDrs7768N8mbL3idFyqbpMdd3+KAGvYyxdso+EuwEzDUK1ZjlxZoLUZaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXUYvmkNc7ExbVqGRy8gWJXSjv9JKVOf/1Cp0o8AaxU=;
 b=d3VPa4zhkJcdIDN3NtpI2Ua33OV0FwLisqoqbrV7EZgVkU4vbwoEYjvVViitrRtes5cjVaxVgrcxMES+5AkNCwpHh6/QCbhYQ7bSnbXDEIi8H5pzcx0Tlr0sxxNjCY7H/F48BSX/rbUgKVXM7GN5QGQ3yvrtKSlhMaCtZRvTAqHDbC26kNu2gPEjlpxIICNvlGmgzWcASnMyQUDjs4v5VciyJl1VHol23in0KPjeGn/JN2WxoSikqi/4P/CwZEi30aNnLVYtQQjB/hQD9E9bXCXqMTrgwrNv3onK04MdWzKFGgv/QlqxkoN5u1c08DJpmdmgTpOR/ptDjWRuUYwlvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.10; Wed, 10 Aug 2022 15:35:05 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3c53:9479:88d3:bdcf%7]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 15:35:04 +0000
Message-ID: <b6e3d481-675d-fc6f-b88b-81cfc6ca2aed@windriver.com>
Date: Wed, 10 Aug 2022 11:34:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [kirkstone][PATCH] u-boot: fix CVE-2022-33103
Content-Language: en-US
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <1705773DE10A5E2A.21236@lists.openembedded.org>
Cc: Steve Sakoman <steve@sakoman.com>
In-Reply-To: <1705773DE10A5E2A.21236@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0342.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::12) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86f03a49-3a18-4b0d-3d56-08da7ae5e5a2
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1ojqNjecxIU64jYUks1BWuWAQ6nAjaI+fWoxGRwCF+UWg4EJXlAHilYGvIzuJvT7nZ9Flx+qZZC9VWTNP+lpDXy2/NtujQtF+mbKZDRu1oPGVDGMSSxj0dF57MY8eRalCFUjviMZH0E96PX/3BWRX4Wb8OdlUir/60FId7wDXafnciBq/Gj6c9q0aMe/QKjWA+oeM7gdyZ2OUwMvGVwhd1BvzI0TyVFCwJFiLVzN2Iwi7fWyl2xXP0ECuFXVpq1IVTuKwWzyetKr5ipjRfH8lng1RmqG/4LlsnPyKfzANzo/5HGVv/axbzMEVL1aBnTO2escUZZFB+WS7jKSLKKBVA8wRnZ9v+nGXDPEC1kdoCTooHtaQoEsK5AM6K7GJe2KRPU1Oe260YMis/yCiI0DdknfIJri+i9YajIe6YjJjGUr3cQwC56yBduyr5B5MHnEi5Zw/159gIxCTC+H9KOqvbmhkbl6aaUUTBuxRkXoFfU6dKFCQzx4ziiqE6ds4JS1JkkRVXoAPprftyLsa+yllEOQXDE2MRLEnnAuQnk74pnFosCzoPPsZ8iDYrpoHt0kLhFbJcD1ZOgTMyQPzYc9fMbMHLJxMLYJoWuU760hl+AdAsdwxg5QRQR21M55wlAPDt5gonam+LR9J8EAt7xxN+f5ASEGpYc+cg5CUMoPLkw6NyyxOLrbAkeBkdECDlGOnW3tem1MDykTNacaaBkUJQ/X+DicUeWSb7Gp0Ptp3ZT7s/MzHBNwNNgGAL2F7N9IOei7MIyQnxiZ0URezyAunNTRFM7bVItj4ZNLZ3HKIFBjMiRS9gMDsMAxUp9sHXKcXc+ZDJHRDpmik11UdGuPKWQ3JTjhlD2kCqnols9UUHsszQT3hdAXadvh3roptIL/kil/zi8WKe6Z3/USAjXPTxiUOzcIrnyX5MGLUsCKCV0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(366004)(346002)(376002)(396003)(136003)(316002)(6916009)(52116002)(966005)(6486002)(478600001)(41300700001)(2906002)(44832011)(66946007)(8676002)(66556008)(66476007)(38350700002)(8936002)(5660300002)(4326008)(26005)(38100700002)(31686004)(186003)(86362001)(31696002)(2616005)(6512007)(36756003)(6666004)(6506007)(83380400001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TUJsdnl5VW1SMm5pV3Z5M2Fac1IyOXlrVjczTmZaVWZZRjhIbHNZSjFCMHdR?=
 =?utf-8?B?OTd5NGp6ZXVmUlNHWkIvQjFwM3g2S1gyeFpydXFpWHdSSE8xVU05bkppOHRi?=
 =?utf-8?B?R0tCbjBMMEJMNUg0ak45aHFNVFhEME5lZ1oyemNXMGdua2JKMFVndmtheC9Y?=
 =?utf-8?B?M1ZaNnkzYW1vK3BDb3lVTWJOQ1pJcEtjSkRobURZL1lpbTFDWjkvYVFYY09w?=
 =?utf-8?B?V1BOVG5UUFQ0Q2lFeTZxYitTOWI0dlczdXpsQS85UXBjMlVPTFZralB2MjdH?=
 =?utf-8?B?cGxVdzRNQ1dGcEl5cE9BalU0QlZPT0J5aTI3d0ZuNEk4TTBQZUUrbXVNSHhT?=
 =?utf-8?B?Unk5RTN2dGlIaW5nSHQ1RlBFa0w2TFM5bE5zR21FNklMZHpILzNLTGJ1enBM?=
 =?utf-8?B?UWJib1laem9GWkhXaW5ZenpKSzg4U3RMNDhqUUFzdnV6ZkFoc1BjdGNDT0ZE?=
 =?utf-8?B?blVyeWFyN0pDTkkxV2hXckdFcmxwdEthMUhEbWs1VWVDWmZKWjdJc3BabGZz?=
 =?utf-8?B?VHdIYUtVZ0RXNE80M2FhaUljUWpWTE5PdHdjNE1PRWFtMUdkRGtzTDltMFFw?=
 =?utf-8?B?cTJVTEo0RFZXWGtJQTN3YWkzZ0VNcy9NZjJDS2hCVGR5K3k0aGhqV1lsMEM5?=
 =?utf-8?B?RExYVUQ1UzFUVDVRQ2llSTJRaHNmTzZld3A0Z2JRNDVrdENtR2FhT25LYjdw?=
 =?utf-8?B?aHZWWjM2K0wza2ppdEVScXVyNHBqK3UvK1lacXptQ1p5dHRlM1BMQUpxWXl2?=
 =?utf-8?B?d3lMVi9VZy9JYlhQVXNONVBVVXhrd3RVYm4zOTFOSi9nRk9EOTlsOVdaVENB?=
 =?utf-8?B?UXExRVRvR2tyQjUyRmlqUVo4cUJOTWJ5dnAxYVhqSk16M2Q5REZhYU5lZjN2?=
 =?utf-8?B?UGZYaFNJN2tXaUo4L3V2ZSsvNXpPOW53Wm54K1pIb1k3Nnc4MVhzaFFITytO?=
 =?utf-8?B?YndHREc3YnU3c01XYXVSQVcxSFlUb0lka2hURy9GQ3hodzVGemtKTWkveUpK?=
 =?utf-8?B?dHZkeHJIOThHMFVVL01yNG4wTHhBc0pvWFFxSFU4OEQwWXRXendENDV3Zkd4?=
 =?utf-8?B?SzdkMVE5SGM2UzI3NkFoOTQwZVM5UE9mUDRtc2JXczJOaVZReXpuM0hxQlZa?=
 =?utf-8?B?QURDeUdPT3NkbjVvaFlxRnp5Z20wRUZrV01tQ3hCbWExSWw0KzM5dEw3Y01O?=
 =?utf-8?B?MDE1L0RyNkZ6eFR4VzhuK2wzbzBaNFpqSCsybWt3bE5UekYzN2hyT2pjTTBp?=
 =?utf-8?B?Q3UwMkVmbGJ1cGZJdnYyMHhzbk9qeWJGNmVXazRmTHJkdTR3bG54VkxvakZq?=
 =?utf-8?B?ZzBMbEV6RWRGQm5hL1paZHZ6d3FYWEpmeE1QU0EySFBxQXVGQnJaNDBZRVBF?=
 =?utf-8?B?RWEveVJ5K1ZIR1V6QjNrK2NWdS8zYWd6alJ5WkNUeWtYd0N5MnFmMnBRU3dm?=
 =?utf-8?B?eW5oNHJxeS9JWDRTZ29zazFjcVhEUG9aUUdYWXFEeDV5Q1VCbjIrL09maTBY?=
 =?utf-8?B?elZicXJVM0pZQVZyS2VEdW1UZ2tBMXdHeVhMUXhlSWhjR2VKOTgyUEE5RHRx?=
 =?utf-8?B?MUh2UEQ5SWhHVXFsM3U2MXdxOUJwM0lPU1B4by9zRFUwZlBmazhSWTVNd1ZW?=
 =?utf-8?B?eHRvSkFuenEzNGlpSHNubEoxQTVGbFNvT2lGTGx1M2hNUFlwbVpmTkZ2TFZ2?=
 =?utf-8?B?cmhoOGdMaEpnTHF1amtNTVhpU29zVUNTRGdyV0xUN2l6bXJrYVJkcGhJY2FG?=
 =?utf-8?B?VDN3SmYxRGE5cHFLTno3TVRJeFBDaGhOZDZsZXN0U0RiNzVHUGkvczVIZ0dO?=
 =?utf-8?B?WnVEQzdaRmJqRXJRalFCUkhaS3BkWkpNTTI5Y3dMeUUwR1JacFZGSmpKUUZC?=
 =?utf-8?B?cEQ0YkFnRlVLOTVmOVJoNlY1c05wWTJmeHJLOXBubzRyanlBcUMwUW5yeGlX?=
 =?utf-8?B?T0xtdjhPc0hLQjAxZHQyUVNnU2EwSmh6SFJqSzFQeTl4anVqU3VlUldhRm9W?=
 =?utf-8?B?cUlWZXQxNk85dW1yN3haWFFOZjRkakN6MDM1Njh4UTFMVW9GQ25BMVJsSDZ5?=
 =?utf-8?B?Zzdwb0VUbXdybjNGV3A3UWVxdXVqcWxXQklaSHRVb2ora0dmV0g2K3AxajA2?=
 =?utf-8?B?eW1MSHZTRWpZTVFkSVdDYlRDRXZOVk9BZmVEUlc4VFBWVGtPd01pUkV1NE9i?=
 =?utf-8?B?VVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 86f03a49-3a18-4b0d-3d56-08da7ae5e5a2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 15:35:04.7092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BUAYgdzAYc6S1ik2YqoPZCqgt7kgRnTwvKMYT9OO88tcpAfjcVkvmoHbxrXMOlB3MPJ6oY4baxXGpnpqpcFb1jGdcEjDCy5ImnH+Lzv37S0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6039
X-Proofpoint-GUID: fkVRaHbWXQnj_L2lbeKolKv0zdK4op-D
X-Proofpoint-ORIG-GUID: 0wyckUQWVL9QD9J76u41Ag7uX7PsTeRk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_09,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208100049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 15:35:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169198

Steve, did you miss this patch?

On 2022-07-26 15:18, Sakib Sajal wrote:
> Backport patch to resolve CVE-2022-33103.
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   ..._read-Prevent-arbitrary-code-executi.patch | 80 +++++++++++++++++++
>   meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |  1 +
>   2 files changed, 81 insertions(+)
>   create mode 100644 meta/recipes-bsp/u-boot/files/0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch
>
> diff --git a/meta/recipes-bsp/u-boot/files/0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch b/meta/recipes-bsp/u-boot/files/0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch
> new file mode 100644
> index 0000000000..b1650f6baa
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/files/0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch
> @@ -0,0 +1,80 @@
> +From 65f1066f5abe291c7b10b6075fd60776074a38a9 Mon Sep 17 00:00:00 2001
> +From: Miquel Raynal <miquel.raynal@bootlin.com>
> +Date: Thu, 9 Jun 2022 16:02:06 +0200
> +Subject: [PATCH] fs/squashfs: sqfs_read: Prevent arbitrary code execution
> +
> +Following Jincheng's report, an out-of-band write leading to arbitrary
> +code execution is possible because on one side the squashfs logic
> +accepts directory names up to 65535 bytes (u16), while U-Boot fs logic
> +accepts directory names up to 255 bytes long.
> +
> +Prevent such an exploit from happening by capping directory name sizes
> +to 255. Use a define for this purpose so that developers can link the
> +limitation to its source and eventually kill it some day by dynamically
> +allocating this array (if ever desired).
> +
> +Link: https://lore.kernel.org/all/CALO=DHFB+yBoXxVr5KcsK0iFdg+e7ywko4-e+72kjbcS8JBfPw@mail.gmail.com
> +Reported-by: Jincheng Wang <jc.w4ng@gmail.com>
> +Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> +Tested-by: Jincheng Wang <jc.w4ng@gmail.com>
> +
> +CVE: CVE-2022-33103
> +Upstream-Status: Backport [2ac0baab4aff1a0b45067d0b62f00c15f4e86856]
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + fs/squashfs/sqfs.c | 8 +++++---
> + include/fs.h       | 4 +++-
> + 2 files changed, 8 insertions(+), 4 deletions(-)
> +
> +diff --git a/fs/squashfs/sqfs.c b/fs/squashfs/sqfs.c
> +index e2d91c654c..a145d754cc 100644
> +--- a/fs/squashfs/sqfs.c
> ++++ b/fs/squashfs/sqfs.c
> +@@ -973,6 +973,7 @@ int sqfs_readdir(struct fs_dir_stream *fs_dirs, struct fs_dirent **dentp)
> + 	int i_number, offset = 0, ret;
> + 	struct fs_dirent *dent;
> + 	unsigned char *ipos;
> ++	u16 name_size;
> +
> + 	dirs = (struct squashfs_dir_stream *)fs_dirs;
> + 	if (!dirs->size) {
> +@@ -1055,9 +1056,10 @@ int sqfs_readdir(struct fs_dir_stream *fs_dirs, struct fs_dirent **dentp)
> + 		return -SQFS_STOP_READDIR;
> + 	}
> +
> +-	/* Set entry name */
> +-	strncpy(dent->name, dirs->entry->name, dirs->entry->name_size + 1);
> +-	dent->name[dirs->entry->name_size + 1] = '\0';
> ++	/* Set entry name (capped at FS_DIRENT_NAME_LEN which is a U-Boot limitation) */
> ++	name_size = min_t(u16, dirs->entry->name_size + 1, FS_DIRENT_NAME_LEN - 1);
> ++	strncpy(dent->name, dirs->entry->name, name_size);
> ++	dent->name[name_size] = '\0';
> +
> + 	offset = dirs->entry->name_size + 1 + SQFS_ENTRY_BASE_LENGTH;
> + 	dirs->entry_count--;
> +diff --git a/include/fs.h b/include/fs.h
> +index 1c79e299fd..6cb7ec89f4 100644
> +--- a/include/fs.h
> ++++ b/include/fs.h
> +@@ -161,6 +161,8 @@ int fs_write(const char *filename, ulong addr, loff_t offset, loff_t len,
> + #define FS_DT_REG  8         /* regular file */
> + #define FS_DT_LNK  10        /* symbolic link */
> +
> ++#define FS_DIRENT_NAME_LEN 256
> ++
> + /**
> +  * struct fs_dirent - directory entry
> +  *
> +@@ -181,7 +183,7 @@ struct fs_dirent {
> + 	/** change_time:	time of last modification */
> + 	struct rtc_time change_time;
> + 	/** name:		file name */
> +-	char name[256];
> ++	char name[FS_DIRENT_NAME_LEN];
> + };
> +
> + /* Note: fs_dir_stream should be treated as opaque to the user of fs layer */
> +--
> +2.33.0
> +
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
> index f2443723e2..a6a15d698f 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
> @@ -4,6 +4,7 @@ require u-boot.inc
>   SRC_URI:append = " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
>                      file://0001-riscv-fix-build-with-binutils-2.38.patch \
>                      file://0001-i2c-fix-stack-buffer-overflow-vulnerability-in-i2c-m.patch \
> +                   file://0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch \
>                    "
>   
>   DEPENDS += "bc-native dtc-native python3-setuptools-native"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168511): https://lists.openembedded.org/g/openembedded-core/message/168511
> Mute This Topic: https://lists.openembedded.org/mt/92635002/4422444
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakib.sajal@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

