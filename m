Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2EBFC4332F
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 12:51:17 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.62])
 by mx.groups.io with SMTP id smtpd.web08.9550.1666356670063533909
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 05:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=bKlGtUdd;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.62, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOBO0zBlItlYlcymr95FziopInVXqVd5tlJK59Yq2GaaCEx4zeFSQf/O3aaa0bthrHfHx+ekmjZXAiDflaEOcV1wgEWmRcfENWhyUv0otLm7LuzrFav6J2X73UfpTDYI2OgwkHvgseNoYrjUwIU4V4UFpe0QA4zvGZ85/E48SxoG5b9+KxCUzrxByI+0Sw46/CA1N/Go7DQw42tyDJqHH2bipsIQIGy5+fQEd5gZYGSXIrL8J7wx/sIjlddqTag0/9A1GhfzzWna+0jIWQWVOJwGwFXJSzxTwWkYUtA8c9B7H94YC4IMxTVmxeQh9BOlhQmYhmdssI8V06cyKm78tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiBiXL8rdp3MrVSEJCvLXwwYFmuJImGHQT0tTcqB3QQ=;
 b=PJCY8jMBJhbMyFoP08fNUbBOA5QNMxb9o1YrvMTp9b0arD+60dqWZVcKELsWwqNkzfaKnp7PC3bp6pq4fTM2APng7njXTmv5h+6m4TZBQsGjgAiCSRO03UYL2DJm4ukmYGWsdcn9AF+yqSRZahsV8vNauIsvzL8rtJncDDn0MYjny7UUSO37L6vZLIVD3LKd1vE8sgvm//YmTUKA/lIttA7W0Q+O5mEVpdokHl9g0O3VsQAUYpMhxdNLMa/G55H0EBrn4C23V4DIFOcB4VVH9qA0xYHkOWjn4vo1UxnVYa9uWXgNkLAELm/sGkaTzIxkAvauq3dkRVn3JQwXU7nTPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiBiXL8rdp3MrVSEJCvLXwwYFmuJImGHQT0tTcqB3QQ=;
 b=bKlGtUddLFuCW5shSTuXh+ZZLLSesO/itEL+Fkxy1Qe9b6iGk98iSJVdsNF7bUL/cv31WJfxM95ki6lWiHcKBcGC2LOlBS2lRfBAR5dcfC3l58FdCDYrwCB9VZlh7ZB5dbG2jExe+olmjkgDfjXxkNQmuR48BkBAVBgDLIM7xbghoCc5KxwzpxCPuiK4jvePJqishNDPHgTr4zowsw0A0OaIUSxrpndDZBCtUlKJIPy5SmHp6LRfwdmzgQ4hVN2/8coVbo2OjjmthlxGm2mPPWLfrucylRW7kOLtmruFueEKT/OzAfLuNjRmU1VHfZ52KaFDqdbOUmZuVbiYnWqYkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB8884.eurprd04.prod.outlook.com (2603:10a6:20b:42f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 21 Oct
 2022 12:51:06 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5723.035; Fri, 21 Oct 2022
 12:51:06 +0000
Message-ID: <49baff87-9628-1ab7-eb4d-4bfa7bd30624@theobroma-systems.com>
Date: Fri, 21 Oct 2022 14:51:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [OE-core] [PATCH] ref-manual: add wic command bootloader ptable
To: Adrian Freihofer <adrian.freihofer@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
References: <20221021120119.559136-1-adrian.freihofer@siemens.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221021120119.559136-1-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CWLP265CA0480.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:18a::15) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: 32221905-19e8-416f-9cd4-08dab362eb3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	R8m1C40oaLSe9nydAilB5JxD+9J6eY7oHocoGyvAUesQ9CrNj914s6g3tXws4wAjx1gfrj8asvSU8HlAopjXmbFWLSrFB8/E7EFKMG1cw9MCVJRy9pWT3d0MSZ3fm+VueguTkdN2CEUAwDUdiUR3wFVgQIjmHGRPBF6+ocfKZCQ5SPfvcNM26TjvZoLqb4Qc11TxQCTCZo5CYnYs/FnlGWOtMycffaN7LZDBz4bhzqwEyU/n3VaWHjJd1pQQTfPKXnBDLAwBCRP8hQlMzoro5X5OTGvysDzVnRBDOX5H/yGhMxTy4vlI/7V3Ow01nEohtYvO6zdbdg3tC3CAes8Z8u64H4954YeNQ0V0ZA1yZF5d4Ns/Wt6sOy8JcbpDKWuDX/juUQgLOrwmy7OfDqN4bZ3TrcOn24zlAQm/AFzb/KoFIpOajiAjdhsy/j7DB0MnSU7YneMxhm++2wlWWrur32NVMb/Gozv6slvyUVffLYwfEjorsQlwDMeYHoF0XThd2rku7ZBn539X3UA3kc9xBvHrSsNzEnXuMM5QrEK8NgX3hf5A7oWm+IVL3T7VUu5+uLJ9voXbpY5MKr03qxV/tOLEuXP9x9v0CRPndjtjI5gn3FQMxVjwrnP/Ue+ZRo3mrCN3k/vMVNrFMX6xcROB3mt2Wpl5PEJhmucHYAI5bKkfgMX3FJJfLVNO9H7Ub7yG21SgRACN5qlI/nr/iiw0CCOhQ0E0TZ5MO/pRmO4CrZSScLMmeDazKJxOOlmwiUi6+GuFldXdvlX/UFJOrRxP5PC+7JqH9Nzsd1pqHPltDx0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(376002)(39850400004)(396003)(366004)(451199015)(478600001)(41300700001)(66556008)(66476007)(36756003)(66946007)(4744005)(44832011)(4326008)(8936002)(5660300002)(6486002)(316002)(8676002)(83380400001)(31696002)(26005)(6512007)(38100700002)(86362001)(53546011)(6506007)(186003)(2616005)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YWV6S2dwazV4TnVUSE5JazlObnljelp6cXZ2STUzMEYrR1k4bFJzZTRJRXZM?=
 =?utf-8?B?V1d6LzQvS2EzU2txU0xmVVk1YkJyZCtVT3pwOXpCUWVVbWJId2NpcHRXYTE3?=
 =?utf-8?B?QkFYUkZvZm4zSHo4ZEdMNWZ2M2d1cnFvQjA0RlZjWlgvT1Bwc0pieHI2anBr?=
 =?utf-8?B?OGRwaWEvUXFvajVHSVNBODhKOTBCVmNoRVdubk9iVnEzdjdvcE9uVUpnZ0ZP?=
 =?utf-8?B?dUFEWDBXZkFrN21Kd2Z1QWN5UW1UK0xpV1l3d0JmNVZoa0lBVVM4MnZZZnRl?=
 =?utf-8?B?b3lTOU1QL3NtWCttd2IvZjRUUTBkYUt4QjB6ZVhaVGhpQkF4cG1RT2p0VEk3?=
 =?utf-8?B?dURKZ1N2dXpKVFVQR2lMMFFwMHo3Zi9FYlFWSDhYdUo1OXdKNWh1YkQxRHNt?=
 =?utf-8?B?eXVodCtIcmhNbm9BNy9jZDg3ZUVCUXpFeHFCM3gyMS80djdCcXhhcFNrY3JQ?=
 =?utf-8?B?Ry9iM3FvZ0NBb3FlazVTT0c5d25La05jNHhORFVsY3BwczZVLzBvb0RuT1pq?=
 =?utf-8?B?Z01CeHJTaGgvVDdzM1NkVis3QThHQmtjdVkvcjc3SjRXdHcxaDB0MWNIZG04?=
 =?utf-8?B?TXl6M1krU2ExR0xxTWZEa055RzV5am5Sb05YdkdrNVl0TjV0N0dkOWJKdktZ?=
 =?utf-8?B?UHhSVGlDNldXY00walpHY0FmcjFwQ1kyd2kxSjZWU0RMeG50NXI4SGdFcDdK?=
 =?utf-8?B?N0tDTElPUUtUVjkwM2NOSDdmWmVGOEMxTXhQWUNhdTFxYllPRlpYZHZSelR6?=
 =?utf-8?B?MXV4bHZLaDFoTHlpNVJQRVhXU05nZ0J1TUVZOW8wdCtDTk1JaXFMSHlqeFVq?=
 =?utf-8?B?NjBEWE1wemNGL0dCbElqTExRYzMzYXBDR0cwblFNandDOWVJakx6eXZsNjYz?=
 =?utf-8?B?V1FXVnpxWG9TbFRCSTRXWmpsUGFFWEozYTRxR1VicTdxSlVnUDRhVkI1UlV4?=
 =?utf-8?B?QVhQVGo3c0VBb2Yya0RVc3pscUd2RDNvWkRNay9FRlkzd1NQamprUUUrT0Ew?=
 =?utf-8?B?WmEyU0ZLSHdOR3lPRFNYbEV2L2M4MFh1SEFhL1BvODZsejVYejhOOFhLN1V4?=
 =?utf-8?B?N0w3NmtONk1UZG5EZFVxS05saVNQd3ZGR2NIWTNFQUFSeHF0alFTQ0h6SFRY?=
 =?utf-8?B?SEQ5ejBHbmhUYjlVWjB6SFVwZUV4dDI2SEdNMW1kM1ZqNjRqaGRpSFZtKzZV?=
 =?utf-8?B?dzAzS1hyTVZSUHJZRHRmaE04VGtSNmxHQVhWT3VFVnU2ajlKdm5Says4ait1?=
 =?utf-8?B?azArMTNGdGpRbm9uSldoK2VNS2tWNlBNc1czZWE1cDRHV2dTUzU0dyt0WjBH?=
 =?utf-8?B?VUZLbnp3WjZ0cEFGdHRaa045TEJtd01OdU5VSVdvRklnczZ6RWM0OUhTQVZ2?=
 =?utf-8?B?bCtKMXlobGZOQlkyV0E2VFh4M2o0OEdmdG04TzNqUnc5STJ2enZRVU11Mkor?=
 =?utf-8?B?V1l0bDQzcThPZGRhTnhKSTZDVkQyVHJibnV2d25hVHZCR3VUZWZwS25ZQ09t?=
 =?utf-8?B?b2t6aGIveGxKdU8rZWdBUG9yRXdKUUNEdjJuUVNKZjRGV1VPVVBtZmhMZUxW?=
 =?utf-8?B?eXcveG1LSU9Pd0M2T1ZyRWNJMkJ6QkxQeTVtV2xaR1dsLytwdmtTQklqYWNm?=
 =?utf-8?B?YzZ3ODQ5YWE4YTQ2WGx0bnlHa0JoNjE2M0FoMmdPcnRWMTFSWTBkVFdzcXJY?=
 =?utf-8?B?RTVGcitSRkNaUzBObzJ0alBEZG5Db010VWFXaEx2OUJYejZuY2xPV3ZOMnQ4?=
 =?utf-8?B?Um9nZU8vQXpIVFVzbGhHMVRSNnBjWDkzN0xVMzVzcGZHM2NwSTR3RE1YWity?=
 =?utf-8?B?Wkk5MnpkZmFwVUVUY0dDSWhZWlpSR2l2L05UbzFqL1lxSzlUY0xYMTBnOS9B?=
 =?utf-8?B?SjUyT1J1QXo0aHdhK2ttUWp0OVdqS2FNaHNISVRDUDFnVEsyQ2o2R3g0V09K?=
 =?utf-8?B?blhIeTdTTEFnVW9LQkU4MmQxNnpsMVVnZ2FPUi9YbnNSL091Wml0dDY4dnNN?=
 =?utf-8?B?K2VxTkg2Wlo0MXBOSTFnRVl0RWZPbjRURHhzcHlOek9XdGREQ1VFbVRzeDJS?=
 =?utf-8?B?WHBRSTFyenpiS3NRa015ZEg1T1VUMWJBbFdPcHY0RHdIQlMyRUhCTVV3UDYy?=
 =?utf-8?B?K2ZVRW1va1lHc09XYTkvblRKeFJCTkh1djUyZ2hXdUtRdzRYeHdrbzJ4ajZm?=
 =?utf-8?Q?9PzqEy7WmKLGODAbJhaG51U=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32221905-19e8-416f-9cd4-08dab362eb3e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 12:51:06.2512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wIdUQ98xs1t0g8BcUXhwqTIo8KmXt/3MPWYdC8TqiCstyB3k2TJ5M8/sxge3uyGXV8toGLpSDk1qAnYFeaWa5dCM/AV2rLHY4nSOECgvJxbwmdLHekjFmeTJ3IsjaFeJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8884
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 12:51:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172014

Hi Adrian,

On 10/21/22 14:01, Adrian Freihofer wrote:
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   documentation/ref-manual/kickstart.rst | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
> index d82da0ee75..30629563f2 100644
> --- a/documentation/ref-manual/kickstart.rst
> +++ b/documentation/ref-manual/kickstart.rst
> @@ -227,3 +227,9 @@ supports the following options:
>      the bootloader. You can provide a full pathname for the file or a
>      file located in the ``canned-wks`` folder. This option overrides
>      all other bootloader options.
> +
> +-  ``--ptable``: Specifies the partition table format. Valid values are:
> +
> +   -  ``msdos``
> +
> +   -  ``gpt``
> 

Thanks for the patch but this should be sent to the docs mailing list 
(yocto-docs) (maybe order the possible values alphabetically also).

Cheers,
Quentin

