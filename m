Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB08FC4332F
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 08:31:33 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.53])
 by mx.groups.io with SMTP id smtpd.web08.21255.1664958691130522767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 01:31:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1
 header.b=Bnl75f6c;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.104.53,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDiRTwv3eOGJy5zuEyTUHx/oSWLBxkE3CWmR2IhMxqKbncDv/Jvu4/PX9cI8KfFm37YmbP1Unou1N9EownWejppWSKVU56u42lXXR8kTZNSj4a/699zHjqw3kwIrurxqmi0UhgWHpzKSGh8CFaGUSB8d7oIpTrrcHaOQMgl5kx25YsBH9V2RbFcIjLXDMNZr8eiwJLh09Gpz7z9Ga0yp+kieyoEoXU+jQ/jFUenMfOommVATGo86D4qsUSuC0ojdH94JxTsxUTx4nBw9CSJJ4TWPCcKzZ1ZidRoOH/Mh62g1aGXTzpOjefgUXf8q+6a6CiE3LFS54IJE3sTi5SRilA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+/1DOZjHsBSrS7pFz85V5MXWUoja8qWOxkzhlWi+r4=;
 b=K+8QujrERRoY0xyJSg24HO6rdBMKDtqZqv3z14TU5ExOH0CJ4FN9eLYBXAADKhWbaVZA5YYdeVLEMwzlo7KeoDdaw0WkO4xsersfDE/4uIEHjJ4GuSftD/5mHjgH8aYK5Q9sUn1RjjzfxOkXnQAKnxLdul2eoLP88OoUIuFaSiFA0WIowinSesckjCcpOh7yRX3wqMuIv17FuAppONLJmcQdry2AWaAFnIEDa3a4ZkdPvFsJL7Hxkw5mQSOwLVTtpBEswYp3s21Zlx2ofV/wFkh8V1GZNi0O1a90FnY0Kzd44SuS8IHIWTH9+nVBK7e0AFF0TEMZZO20LaI90F/I8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+/1DOZjHsBSrS7pFz85V5MXWUoja8qWOxkzhlWi+r4=;
 b=Bnl75f6c0PPhzarcy1bZV+BiGQtLW4Ehb8tD5XPD9RRYpMy5m4tQz+ssGd4PiPUE5iKMM6uUXk8UNlGpjc0ArzG+qYzOAn+fedTyC52oh34/tss0nDuZAkwx+QBGP5dcxjbRhYYjwEhDAtzaBNAdo9GvN7RzLagA0YtdXMQmIfebGHS1ZSRjp2CsFntANTNPMDrHWUfxmw/Es1WKwrxgAVjVwS1tZxGUkevXReJbGSwvg1QM4wUw0u178VZ4PO8ke2BFMIieVR1iWtDIJDhP2Nr3OwjXRJqq9h9RL27m6i50SzI9esUZzBn81+qGkg73DhzSZblLlUDgWK1IJNLEwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM8PR04MB7362.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Wed, 5 Oct
 2022 08:31:28 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5676.032; Wed, 5 Oct 2022
 08:31:28 +0000
Message-ID: <663d2c74-59ba-032d-88a3-dfe22237136f@theobroma-systems.com>
Date: Wed, 5 Oct 2022 10:31:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [docs] [PATCH v2 2/5] classes.rst: document
 openssl-native.bbclass
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@linaro.org>, docs@lists.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
References: <20221004152750.978712-1-mikko.rapeli@linaro.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221004152750.978712-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0209.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::30) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM8PR04MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: 547aaf72-4e0a-4b78-8e9a-08daa6abff43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bd6TbKrHPQk5mcmrQWPoIhzpu+O4vi/eUPC3xWUQt8gvICYltpq2E++6Q9JyDDJYIWRzX2MLbNkoSjPkgN6iW97sgwguCpdnsGby1ATQ+YtXrFjACVprpKodUL5bi5hYlwn9Og338F+G4c+Qb0svsvXmKDNK+GZL4hKj2aKfPwLHcDxBzbb2euvEK5yOLgRNmag90jLIA9zsrhONvayY6fYJ60W+tSbDX7W3rQgHfU+Ptn0rLFjYX8ROO1/vvpy0IEbv4GxhEYJ9iO86eQA5l8MwAnducwGHRcC5d2D0Kg3HS+JF9sG5WockhCFtPq4vrDXA4K6DPGwH5OQIKssG2oJxPbVkZaXf8C6wcb/Fs5GbC4DKoUaRg0h1TVJEetNbek0d0t9wW7cpV7WSpqTYdsjfWJUiKVjJnmuhRiYZDtYWrLfFgmT2YWmVIm/tFBW5zvHxiJVRTsWwaXPu2ocJb/wkNWQOPz8j/AFYPZLmJyOJNCdyEJpfKT/6t+bftfhP7GVhXWvViQDpj77hc4W+14xWoB0mxooETNMCqY4TgNydni0hBja9Zn1Y1/kJlvRsYIWQp8+WmhD9WVPiqtF9O9YpxmSXlK6tzRZ2V9icA+xjUJY5ghPMcU/VrIzxqFEW7+0wx4QmfQ9oF5yprZQ1hmQ0Kw1FhOBT2Yjb5Bo3F45A726353s8XM+tGVGcxAy3CVjoyltVEhPrgnPYFqzwEOw5YM19SFsijKEg45xdQia9uDkgCA3vrLIxTsW+vXdnsS5Ys3NU+BJbMDV11HWNkwZYRywEEpmyHyu2h3zze0E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39850400004)(366004)(396003)(346002)(451199015)(316002)(38100700002)(8676002)(4326008)(66476007)(66556008)(66946007)(186003)(6486002)(478600001)(6506007)(53546011)(2616005)(6512007)(6666004)(31696002)(36756003)(31686004)(8936002)(86362001)(5660300002)(44832011)(41300700001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TUlBRGZRSkRacjRIVDloOWtaNnBhK2JTTmNEdTZmWlFWdDJZN1NWemxqd0h0?=
 =?utf-8?B?OVcyL2owVTJvbDV3Q0pqMFo1SWl6bmV2aHVlZDRlNGVJYllNeEhES0VHbEM1?=
 =?utf-8?B?U1ROZXhRRTV4Zm92ZW02RWJ1Z1E4M3pxYVlYSW9ScGV0THlManhOQ0tqRVJI?=
 =?utf-8?B?emVzK2d4dkh1RC9LWXA5bk9lR3pIeWZ2bDR6Z0FUcjlZWGliMzhFOE9MTDVD?=
 =?utf-8?B?OEJwUGNZVXM4VkdIVzdmcnFWUFhRZ093TTRjR1IwY2Vlb0MxWmdocEtua1RG?=
 =?utf-8?B?eGIxWWZ1UjU1cUhwN1dLRkt6ZkZHNEdOZEZTbVAzczQ2VTNZWnRlalh3T25C?=
 =?utf-8?B?dkNmTE9pZHUyZXkyZFlZWm9mOGtJSVRERHZqRFVkcjFaeVIzNkROL3U5MFlZ?=
 =?utf-8?B?dnRvUGEyMkVtTFozQlZvL2hZSnpvZ3VUR2xPc2dTd1BDNWFIamxOUDJTWG9M?=
 =?utf-8?B?QkI3eDVMRjZ5eHhUb09GRG15QnIyc0dxcHA5OGJXcjZYNC9qK0VvT3hEanFY?=
 =?utf-8?B?a3FzY0FwcmMxZXhiYXkrcktVcGdHY1U3d2JPT3ZLT1lVN1piM0MzYTlIY0hH?=
 =?utf-8?B?ZmhlZEZydlo1SGg2c1ViQ0lGaW1oQU9IRklkemQ4VUdNdmYzSFNwcmpzSXpR?=
 =?utf-8?B?TTlYRVhEZVhmZElKNUdqU2pqaHByZDJ0TTRPQVVvMUJDb0U2eXptaDd2d2tl?=
 =?utf-8?B?NkdEQU81S0FYdkZUaVJvL2w0QkZLSFdWUThJR3lMRkdhY3lERVgxaDRZSmU4?=
 =?utf-8?B?b1QvYjZvK20zYkJ2TjJsUVV5cmxKR2F3Yi9FUHg0V05QZDVlZ2d2M2U0aThn?=
 =?utf-8?B?QUdaYndQY2pVM2ZIdElNMUhEMVRjTFlWY1htNWZaYURRQzVPWGMweTNqV01H?=
 =?utf-8?B?MmlGeUh5aDNaWDVnWEVtWlJnZHZLbldqWXNLMXMreVl4VVRQUDBWblRCSXln?=
 =?utf-8?B?RGZCbDEyRzlScFdCWGZjdlhoNFRRL2NibThKZ3Rna1NJek1XVlRRdXpOVmc0?=
 =?utf-8?B?OVdxTnRTNTJDSVVBcFhlcExtcVFWVjZoMXFKcFJSYzdPKzViWDVieHFiMXFV?=
 =?utf-8?B?WVR4VGtXMEZmbFpsaGVMOGRSRnNtNlBsQ3JTcDFobytSVnc3UlVTTnlHOUhP?=
 =?utf-8?B?ZTVxMFR5MnRWSnZZQ0ttdUh4cHRSZ0I4QmM0WWsyRTVYeC9EV1lOazIrMlJM?=
 =?utf-8?B?cjkzeDZneFVzOXIyWG91TjZlNGZFOVhWQ0IzZFlteEdRaitOL2NCZy85NUNU?=
 =?utf-8?B?WDIwSmdYV0haaVZSQlFkeTgzdGpDZ2llTENmVFRHVEdPUTU0SmVKU0IxdUhW?=
 =?utf-8?B?S2piMjJLUUlkNkxDZ3ZOMUVhb293ZkF6c2QzQUphS0lLTFQ1bUZuc25mcGsy?=
 =?utf-8?B?STFKRVRoQTB2RDlZMGZ4Z0p2VmoydXlUcnhUeEx5ME9HTUUwL1pwNmExWlVm?=
 =?utf-8?B?YmgzZ2ttQ1VjNkYyNkJBYjI4SGMydW5hRkpFSy9tQXp1Uk1jeU5ZOHNDOTFn?=
 =?utf-8?B?bU9PazRCc0Z0UE9tcHNjQTRXaXVUMHdtbitqUXRMLzVkc2NjQU9Vb2kzOW4v?=
 =?utf-8?B?cTI2alpxcnBnQXZUb29YaDFzQjNVRGhpZ2dxQ25yRm1TK0Noa21YeFo3bk0x?=
 =?utf-8?B?MWc5eklUcmpuaERrYS8zY05aSzdCZ2pBc3AvV0FHbEw5STFRUE9rRmpGQ2Nw?=
 =?utf-8?B?VGJ2NWdQckFUcjMzUnJxYzhQdVl0WkRIOGNUS0hBUUJJVTNPdEJnUmJvc1RF?=
 =?utf-8?B?Z3pRbFRUSks1K05wMVV6WkhGU2R5Y0daYWJWaWhnUldJV2RlYUZIbmNNcjRv?=
 =?utf-8?B?VkxGbEQ3YXM2ekdTTVQ5bDdJa0Q2MmxXQ0tSbjB2ejQ3OVRKSmVrdW1GS25J?=
 =?utf-8?B?QTM0VmQrZlJ5RmE3andkWS9icXU1aWJsOXdGb1poRnJvTE14YXJERXl5TllK?=
 =?utf-8?B?ZXBWTDVjWTV0ZzB0L3VSam9PdTdzcFVXMnZMbHQwZTR2OHkwMXJPdUI4MDRl?=
 =?utf-8?B?dnVvb0hXSWMzZlBIdmhMWlZveDZIRW1FWmdkeXZIenBVYmlpREFPVE95VFcy?=
 =?utf-8?B?WFlDVUdPZUVhRDI4K3F5citzSCtYTHdPejhDWGVrR3dhUExBaW1VbmxudGlR?=
 =?utf-8?B?eTN4aDdQbW1EZ1V0Qjh3SDhPdHFPc0Qra0ZGNVYxNWpDaEpSVHc5SGp2V0Va?=
 =?utf-8?Q?gForXZqyrH/qS+B5WFjgF3bej+KThXpbAgKtP9j2xjl0?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 547aaf72-4e0a-4b78-8e9a-08daa6abff43
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 08:31:28.0144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zlnwxW+EtyUInXsXkxenPZilxkosZKWVZuarkFvSIOiGg58BGzANkH46gRrHYBxONiY4+1RaGTUYijr0BDUe1dKVUKsyDRO3+G6bRQJT891qU3Go46z9rHIRHIgKuys6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7362
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 08:31:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171450

Hi Mikko,

On 10/4/22 17:27, Mikko Rapeli wrote:
> It sets various environment variables correctly for openssl-native.
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>   documentation/ref-manual/classes.rst | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> index 11e0d472e8..5fc30f9233 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -1672,6 +1672,17 @@ one such example. However, being aware of this class can reduce the
>   proliferation of different versions of similar classes across multiple
>   layers.
>   
> +.. _ref-classes-openssl-native:
> +
> +``openssl-native.bbclass``
> +==================
> +
> +The ``openssl-native`` class supports using the native version of openssl

The :ref:`openssl-native <ref-classes-openssl-native>` class supports 
using the native version of ``openssl``
> +built by the build system rather than support of the version provided
> +by the build host. It helps setting environment variables for engines,
> +modules, certificates etc correctly. For full certificate checking
> +users should also add ``ca-certificates-native`` to :term:`DEPENDS`.
> +

I could suggest:
"""
built by the Yocto Project instead of the one provided by the build host 
distribution.
"""

I find "rather than support of the version..." confusing.

I think we could also replace the "It helps" sentence by stating that 
any recipe requiring openssl to be run on the host should inherit this 
class instead of just adding openssl-native to DEPENDS. Maybe that could 
even be a new QA check?

I would still keep the last sentence though.

What do you think?

(Thank you for sending a documentation patch in the same series as the 
code implementation, this is rare enough to be highlighted, much 
appreciated!)

Cheers,
Quentin

