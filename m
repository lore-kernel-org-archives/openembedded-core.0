Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5EFC00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 13:23:52 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.133])
 by mx.groups.io with SMTP id smtpd.web10.10715.1661347425911572266
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 06:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=KG8+u7yE;
 spf=pass (domain: prevas.dk, ip: 40.107.20.133,
 mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRLEmE+B2UBzd+HIfBh3Hhg/lLbFNq1d7RJHX8ENunG6feK96GVtf+/nSm2+y712IBhkGFwt+a+yFoJ5y1+PAUZ/5Mteh5j2PGXF2Iq/zBgL4hEElLV1qB2YQJFGbpwoyWgAerXgrR74MOPPwgqN1zYwYnRI9fEqiG+ljnobppc88d7rwq2kH/xs4zsmzWZhhecrOq+PqAeT2MBV/DYvdym2QjhCz5hCLUUQ+9Zz+vyRht/0k6JFnzUBzSqqIuCVnhxXJ6lv3KK0TzVCeQfJChIzQXvCXGZ1GJWjqG9k4N4bkcgz4vtjwN3WBKdxOn4u1M2WbG0cbK8eLLbYjKBONw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nn5C3MIOgOoYaxDuTZZNcnnvXA7zdlQTj7oEi8qPUtA=;
 b=mevRyElXZnqGd/1VYC++jbqiPfhP4F7mmJocwXJemE125jNYrBk1FAGmAneN64hRw5faTwIUvLVtTNbyt1gO+9gjrHfaUqZL4fLDQpM9zZms8ngkMvw4OqiDSrsA3B7cR4Bhd4kffLNiL4y9qJVMMHw7uAJC+YzbuILK68v6hOMvWl749KOxnEDjN21+hfAaiDa7u38roiD9JisNSxeAHSVCVxxd31ykJPKrS0VPD9wWU00uM7sLmCWDv3k8Qb5kdUXQPxxUublhfKdlC8j2qN1jwRQNaD8oobrDhZtxAjOBYpYxmxBJ6BTOTe3iN3UYeGZK101qrwRJkAziP4bQag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nn5C3MIOgOoYaxDuTZZNcnnvXA7zdlQTj7oEi8qPUtA=;
 b=KG8+u7yEkkxLD1lhoZZMX+s/Ac95TcKgnWzvpOjFFwuKRmf6VSCjTN6OjpmcvlbxuQ3AJpgcYpdSqNgUgRo6MfSOr1E15jX7mH4Dq/7ehQQinNTRTb7OsNDuCBWLA2px2m6UVxzpXwbhEcSgsjld10ECUHLYm0pSzW2LwtUfavI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by VI1PR10MB1918.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:31::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.20; Wed, 24 Aug
 2022 13:23:35 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::84cd:fa2:ffc0:456e]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::84cd:fa2:ffc0:456e%9]) with mapi id 15.20.5546.021; Wed, 24 Aug 2022
 13:23:35 +0000
Message-ID: <40098bb7-f655-ba79-3516-d77ea6041bbb@prevas.dk>
Date: Wed, 24 Aug 2022 15:23:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] Should BB_DEFAULT_UMASK be set with ?=
Content-Language: en-US
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <16F3D7774B148A57.31466@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <16F3D7774B148A57.31466@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0082.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::10) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38ecae84-12bb-4647-977a-08da85d3d8c4
X-MS-TrafficTypeDiagnostic: VI1PR10MB1918:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EhGNNv7oKQVhCroDC3T0oWSf7DTO1gPfkA3AwIMjqGKPv/jJigk+G81vC/nuSmlyRnOra6+jim+Eohh4ydHtiW4oROXPrgJhUi44YbKrzKl8SQ7ek5OpCN3+Gav8aWCTQUwxBjzw4IlJR1Xhg526rcflTGInPVuwtuRGGL+Ibj6TmH0VSx0cArM02aIAdju0hratMvXu+BVGTWiVgl1DPe0S66Y6PS7rzBYZ/EMnWQzi8sK9udzxwIhTSD9YXSZfEFYpxSm08OUbfRVsRW7OUya2Og056gISLcqNrztc7BJl+tQOENyDQey/kw0ARxhNVYbSqHrKqOyBL54Oc5TXdr1kL+DqDzW0sbi0g8fAxco+tVN+SYadQBDE7ZZlEqvIPIkA69BB44mcY+w0VJF/CxTFmQiK63s+IkxSQcH9Evf9fMl8in5y6n/yinxQ8RcyBTKzcPklFuX9vYKNus7BlLKYE7NNoOBaDenTn0F7uL8CFIiHXu/InE2bRME88F8acasqVprI62mrauwLIH4Eqy7kRbzataa2hJ6PK0gKFZxoitCugkc8I8bwP/DnEOAstnk9IbmEdhSq0MfTeoUfns60QC4+D3CpSHnLZqTgQ1Q1PMU2Klq3pJDDXBVapXybrBYXaZZd3m8z9xABXmMD6UY62nOfKVwx7fIGiYYFEVSDmNkQ+XntDNJbFlWvdhZ5lHfPVDtZ4+rO3dWnXeQ92f/1qsGi5w2bzRlhNJZxir5dsgVAJcC3uMbUVLoNYL+q4Ttbd+grPR/9O8L62jF2PgK1lvaCKFmKwXgGKwalbk68zcShnt5mn0Pzh5v/lAHg5/p5svSbgR+fAPpFdbWOfw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(376002)(396003)(39850400004)(346002)(6506007)(31696002)(86362001)(2906002)(38350700002)(38100700002)(8936002)(41300700001)(8976002)(8676002)(44832011)(31686004)(4744005)(52116002)(6916009)(6666004)(5660300002)(66946007)(66476007)(6486002)(316002)(4326008)(66556008)(186003)(2616005)(36756003)(6512007)(26005)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QTNZQXhQRWFzWGNydDVWWlorOHhGQmJlS09yQStUU2NlMlN5MnoyNmV2djNl?=
 =?utf-8?B?MGhuRCtESUVWeG9LWnVOVTNNdi84Q2dSSFN6VjVzc08va2F6TEFFaDkrNitv?=
 =?utf-8?B?MnBHUFpKS0hXcWlSV2xsWFNiOTJENEJBMVZ0QXd1OGNDd2dNd2p1OG9hdTBv?=
 =?utf-8?B?RWZpa09ZNzZ1RHAza29ZOEprRkJoUzl5bkZSaXZWK0VCQjlWNm1FbFFTMzRD?=
 =?utf-8?B?OXZsMlIrWXE3VGtEWlpyRzhzRGRidWtSU0oxYUk0c2d1QmNHalRLdEFPQjZS?=
 =?utf-8?B?TE1WcmMxelNQV0xHbmZvWjNRRTN6bXYwU0d1LytQb2FqSmxHcklFQ2cyYXYx?=
 =?utf-8?B?UXdvVFptU0pPOUFHUEhkMExHaVVqeWJuM2hXc3JKTEJLL1RMbGpGaWF4NE5F?=
 =?utf-8?B?em1YUmc1QUZuUWFsVzhZT0c3SjNaaVlUQVRHQVZzVnBnWGJ4Qjl6YW9ZRGlG?=
 =?utf-8?B?VnRIcGVaN1NhRzlwWVFvVCtSU1RMeFZiWHgrUGdvYndSN25WLzRlU1ljd3dE?=
 =?utf-8?B?MWpseUYrU2VzM01sL2tQVHJWNXlVMzgzK3N4NEQvWm4vcHpuTXFIOGJCdXl4?=
 =?utf-8?B?TXZBYk9uZFNqYlRRZVVVV3M0ZENQNWRBQXJZZlVNMk1kNU5JSDkvV3pHQkhq?=
 =?utf-8?B?UkRPVCtYVFE5QzBoMWd2NnpyWVc3UzlabTgwT2NjRExKMEtjTnc4WkIyUXNn?=
 =?utf-8?B?NkpNbHdKVkMweSthWWRDSzRmdnFQQ3h0dW5NNDZpYUpKVjNGbVMzdVBRek9N?=
 =?utf-8?B?SS9xMTNVTnNsVHpLNUZWd3FONnZ2OGN0YnAvNDRTbTBpVTQ1dlY1Mm9lSkow?=
 =?utf-8?B?V1d0Y05lNnR2dnYxcEFDU3pPdnkzRzFUYXZ3QzJOZm1sRWNNUGVTTVNIR2VG?=
 =?utf-8?B?WHlZV2JZZUx4UXlldjBsTklqalZ5cVZaSjl6eVBkZit4Slp2RlI3UjBCSWhm?=
 =?utf-8?B?S0ZXNUdRK0dpT01CUFcwM09Nd1hvd0k3THVpWDl3SDFHTkt0VGFDK05kbkZo?=
 =?utf-8?B?SE9RbE1vVXhjK1lEZ21FeHVVUmtKQktwRnZ3YzY1S2lYT0lTWnBRUnl0czl6?=
 =?utf-8?B?bVdHSUgzaUc5UENsVWRVTEpDS25IMWJqMG03b0U4L2tPMEowS2tTaWR2SGxv?=
 =?utf-8?B?Z1Z3VUpndFArcmpTZ0F1eG1qMGM5NDVsRzF0Yy9VdmFBQUduL3BwcVVtS3hW?=
 =?utf-8?B?a3FLWDZuUzgvdTlxN1dodjNKdEhOdlIxd0tlaDl0Y2pjeFRRa2RQL3lnbU9T?=
 =?utf-8?B?WjdXTzhhR3lZUVdQQ2l0TWczZVdxUXlOK0VybUxiUWt3Q3NJeUNQUU1qb2Ny?=
 =?utf-8?B?bThqSitUVnMwZkxKcTBOUWpwRnVWcjE4bXh3U3pDN2JGVlRtSlpIVTRzVmp5?=
 =?utf-8?B?SDNvUkFDaWhrM2E5b0lRQ29oWHozUGxpQjNkenNGdjVsb0MwMWNFY29PSlVU?=
 =?utf-8?B?K2FtcXM5eFVEMG9vc1pBWmpFeFJsV3pBWWU0a2k3NzF4Z1BEUnpyTTY4b0RT?=
 =?utf-8?B?c0dwVFJDSGdNU0dGQ1pqbjVqenovVFFsbFpGcnJGUU1qLzQxdDlQajdrczk0?=
 =?utf-8?B?ejd6VEwrNVZFT2xZUTJZakR1QkRteW5QYU1lY1dYV2gvNzBmVmtQUk5pMTdo?=
 =?utf-8?B?bnRCRGg1K2RteC9pN3lHanJWdEJ0Z1NyNlNJbDJPMDlGT0dSNkU5QWJYcktP?=
 =?utf-8?B?aW5ZWDJySHo1eHFua2FnRWlndU83NXNUdnZQMGZyU1drUE1iZ0JTWHZSR2pl?=
 =?utf-8?B?VnNSVVpyTlhiZ3N3WWl5bXBqY3RRdU5RRHlMMWR1L1V1TFVNcTB3K1hmcDAy?=
 =?utf-8?B?YjczU2lTcjg4Zno1enE0bTZwaVFpQmNPdVljbmpBdERoVVdvT1JhUlFzdG1M?=
 =?utf-8?B?SVpTTVZaRUlXUjZ3d2JSMGZ6YkdSRUJTckx5bEJVbXlsN2txWUVQOGlHcFVZ?=
 =?utf-8?B?bWhWVEZKeXVpenpZcjJNeUJNLzcvVDJrZ3hab0Q2YU5CYUgxbmNidDFOeXZM?=
 =?utf-8?B?bkU4UGRWYTBjajlPTzA2cFdjRS90amw0NGZUS3c5M1NXWTNEWExVTE85YUVF?=
 =?utf-8?B?UlBqT0R2dDAxNHVvZTU4ckdHZnVWWW1obzNlSlFTMUZlQWkrSlJuQmZDS1hP?=
 =?utf-8?B?Ym5TMG5HNHJZNWZrWnlXMWdISk5ld0JDaGtYUlNGWk5raHVZdlEvNDVUdVdK?=
 =?utf-8?B?eHc9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 38ecae84-12bb-4647-977a-08da85d3d8c4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 13:23:34.9421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ele/0lqiaA7hA+KESm/EHhJx8brH5I7wFo3wyJ+2zACgJaopNtE7cFxLGk9+5PjtM30MLahy0KGlfNEHt5wLSFpTQjzmZOL4ttk/wU1e480=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB1918
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 13:23:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169815

On 30/05/2022 11.19, Rasmus Villemoes via lists.openembedded.org wrote:
> Hi,
> 
> Suppose I want to define BB_DEFAULT_UMASK in site.conf or local.conf (I
> do have a use case for setting it to 002). But bitbake.conf includes
> those files before it then goes on to use an unconditional assignment
> 
> BB_DEFAULT_UMASK = "022"
> 
> So how/where is one supposed to be able to set BB_DEFAULT_UMASK? Should
> the assignment in bitbake.conf be ?= or perhaps ??= instead? Or should
> the assigment instead be moved above the inclusion of the user's
> configuration files?

ping (and cc += RP)

