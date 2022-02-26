Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950B5C433F5
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 07:56:09 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.80])
 by mx.groups.io with SMTP id smtpd.web09.3985.1645862167487772742
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 23:56:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=UD9xm+FV;
 spf=pass (domain: outlook.com, ip: 40.92.73.80,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXb0Zk8mWyMR0bWYe+W+55jfLnXv5+nvU60kwp4mK4HvZU8ug+juophYW0Fn1ozLfXIWO0NsMK9LHSYbTHv2Wy2tc+FV5jtKt4BEyxXtXfiDWZGpNP8hecSGGNciqTSzOEI1+HUe8zUn+WogsHFazDSVDCNSGxLBM/5A95lqWHOb+w/XtlMDKUA5qsyj9hv+ircgqqKBAg2kt4uyk93uj+pL65WjjZ+PT+jLHU7NEHvYReTPaE0fGes8/fqUZ+B6d9/i+5prT34E+JcpgfWG9FLNikDHFucokFbayaQ4ONG/18UAnHucQ7unUEijFI9/szWGv7VgWUl9DpPMUS3ZEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93wztky+joTUmJqnb2qz3BefjYEtMVQRgWQpmnRIEiY=;
 b=IXCz6P2sfbriiBvA65n1qUuk0qZ3BVpQA+kNU4He2kzX9/rBFCbtJ8euqZ7SPxhvTF5kicBST9PEEU2BNHxVqavRpqIa+uQ7uXcwVX4fJg6Df7hqz3Ew4BTYGveHTDR+x6LDcI1iclr3O9Cz3H8qhOqAEmEF191jHZ5KL8LU+Ikl7rh7MKK2j+d81AG4DLGHSoo+eHiQMHq8vTsw0jBpCwP1UzCoWk5PyXFrCZEClbijBNDnY8SAMlW0N8cXeN7QBJ3quEMAYfzpDBSiiQ64kPKBnVWBlB3HsHBEHLy2TmpsgL4bSWKYUmL9SRQypUcZLEjq073x/0iOxspZxgHN8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93wztky+joTUmJqnb2qz3BefjYEtMVQRgWQpmnRIEiY=;
 b=UD9xm+FVWdpBqvCJ0mGTkbzB3EoYyup/dUFBgeZ37Hb7qmqG03PeujRe9qn3L0ecAe06jOLe9ZbXKKZRofMEaehEhyAaLrKk8Od+byq+gYDLf62ljnyK56w0477hniHLtfWMJzhnthlHduFttSSlvdyP7vwqVe60qYSV0DD3sIGhvYLBZP9wD6a7MDh7ENNsvmTT9TNrpBe82eANPYCAZeRy3q/pGw87RBnOpuikMMwtjPc5B5YmvxUswNWni/66VSY//mhW28Gh18w2hxYjUfl2heKsZ6yOMSR9r4NVvHn7bg0344P7IjnNijVZOY2Y629tBNURfxelpqiO8Vcygg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by HE1PR0901MB1657.eurprd09.prod.outlook.com (2603:10a6:3:54::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Sat, 26 Feb
 2022 07:56:04 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%6]) with mapi id 15.20.5017.026; Sat, 26 Feb 2022
 07:56:04 +0000
Message-ID: 
 <AM9PR09MB4642BA292AF82C2512FB07C0A83F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Sat, 26 Feb 2022 08:56:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH v2 2/2] pip_install_wheel: improved wheel
 filename guess
Content-Language: en-US
To: Tim Orling <ticotimo@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
References: <20220225040329.813595-1-tim.orling@konsulko.com>
 <20220225040329.813595-2-tim.orling@konsulko.com>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: <20220225040329.813595-2-tim.orling@konsulko.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [GqkcQta0VwQSDxYn1vuD1OVP73f7Dv7uv90IKxmDoCiKA7mddKtJWaZmAvZFBWNq]
X-ClientProxiedBy: AM5PR0601CA0025.eurprd06.prod.outlook.com
 (2603:10a6:203:68::11) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <3cc84691-754d-c6b7-7fc4-af5719391693@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf4da189-890e-4936-f21e-08d9f8fd6fe8
X-MS-TrafficTypeDiagnostic: HE1PR0901MB1657:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eypbnKxkn672l83GpklIXo1YqUUQaGi1Sn5S32uqyhfaYql4x9X/XdCHyvCkz8j6By0y0kkB4oXRVPpRwifZp6Qy5kRkVuMsJg0wfZOGEEj5MttGzR8M5l0IUhoPj1VmH0fuBn+ga8RJsTDBAunndUjI9l4xKzEm1KZysKXfnQocd+0Oolei58rqDW3Amdz6KnElEVzzFWXUqqqH3UKvJzHdxBB8P4Lh08MD1lGQThMwpKJK6nDLucf7t8d/FoysBxU955n7iUNHqksg3g+7F7K91rj/Cc19mGzyWWf48AjRkj0ZwZoMYAoSehOvxjdb7BPvkdRDYKIdQSsdf9NU6RIsYDcRA1Cx/w4DPad0/hesA55QixKO9qLUwhrHy1EJK8LMIF2VM/R6M5xSQXRMf0Z/8H1ic+npuq8ASTmM5umosBq9inG89xfYCm71jRpk9aqN9f/Qln4N4Fb4Sj4NwVUZupECMe7/jslyXfiJOj/BeZaZPP+spckeuxznLspj4kTTTSQnV4jCwMEOlX0rEBFett7Ivtk3OSI5xVzQNe5x2zLnodrGDgRrA5WN4LmqrNNjH56GD/kxwXlyN6hWJ9HBFUieSBS1+a/D21lhqLr4nsnSvsmS6AMAS9BTanCEx7dDN1DdtC9LI3EKJtFssVm0JW4qAyVCfVzbu/EcAH0=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y1JpV1QrVVd1Y2YrY0JpYTAyRW03cFJEZUFXcWVaT0tQVmhaZjVESVZoMFNC?=
 =?utf-8?B?aVlQYy9pYjZFeEFlQ2tEU2FaVkIwWWo4L1JyVFJFV0duZGRsYWhmUkw5YUtH?=
 =?utf-8?B?d0lhYVByYzdqMUFhL2t0bDhDd1d3c3FENGk1S3V2dVJrcVIxTTlvbGJHT2x4?=
 =?utf-8?B?OUtuOTkyK2dEOGNSbGgxQ3RmcEZ4VmJ1MjEwTllHdll6MkJZKy9zRDZyMWEy?=
 =?utf-8?B?YWUwTCtiZTU3TFVFckd1eUU4NFdnVWxNeWZ6RjNKRkMvc2ZKYTRuMURtR1o0?=
 =?utf-8?B?RktLUDlBdnpLc2k2WmNvQzJPZVVrRlFPRXlOSFNXcWRyTmVtVEpuRXZxeHIx?=
 =?utf-8?B?UEY4bmdUNjR6TDBUdVloTFdoNFRzeXNYVys1OVlGbmFGem5DenRNby9pUTlu?=
 =?utf-8?B?TlhZTmhMOFB5L3UwaEx2MkhQQ1FwSXZpMjZ2Q3U2cDhHU3ZPN3ZXcWsxYmI4?=
 =?utf-8?B?NGFoNnFXV2FDcS9XOC9JcnV5M0xCUjBjc2VjYnkzZmxmOXAwZ0pLNFZrNitV?=
 =?utf-8?B?aWViNG5ZODdBdVcyYUNQclBTckJmR2tyYUo4ckcvdjJMM01QVDQyS0pORzRG?=
 =?utf-8?B?a2hBUm44T1hVR3V3VFcyT2tWTnA3YUJxYkp5cVNtR0JaQzRINnJMWmJ5NFlx?=
 =?utf-8?B?YWtmZkVZMzlzNDV5Zm84am1oZVR2OGZQZWk4M3k2ejFVYkZNbndSSWFzK01q?=
 =?utf-8?B?ZnE2WFBySlN4L2RmWmdXbW82enJSYmNrNDlzYi9JZXhpczNiNmJkd25uMk1w?=
 =?utf-8?B?RFAzbU1nM3F1TlFIdW9tRXpEb21QeUh4ODlBQndHalg1clllTmliNFlKSW5p?=
 =?utf-8?B?Y3o2c1VESTZWaXM5cUMwNUtoR1RnQUFkaHdxUFUzTUZKUS9UcHhyeEg2V3pr?=
 =?utf-8?B?MXIxK2daT0JHS1ZEK21iNi9jQ3NoQjJqc21zbXVKckcxbGhuWXc1eElWTFB6?=
 =?utf-8?B?QW1xc2lWZUxIM1VLajhTVVN5OWRQVUVNdGtsbWVmS29CeDB4MHRvcmR3RHdU?=
 =?utf-8?B?aVFGNzVTYzhmeGoyVmFWYlY5dytHMVFaVEQ1dFR6bC9hU2JHMkU1VVdDNjhh?=
 =?utf-8?B?RHBnZXg2OU9YTEMzK05JZ3dNdkxyTi93bk8weE8yKzVyUlQ3NE4xUFlLRDZh?=
 =?utf-8?B?a0craUpPb1VlYTk3dGtjVEMvVllQY3FCK3RXMUFyQXJkMkhnNlVIZ25LeWpR?=
 =?utf-8?B?UTBtMlZ3eVlKZHNIVDhmZHVaU0pDUkJNMnphWlloNmhJcDQ1NlNRbDg2endT?=
 =?utf-8?B?YkIwUW9IS0lTa1UvcVpBbEN3YWFiejBxSXNUR2ZwbVdKY0NIODhzUURPMjhy?=
 =?utf-8?B?V2VJQkVqY3BrT3UvOW5PNFV1WVhDTk8wNEF1WWExYzRmOUZOanpnMUtRdndE?=
 =?utf-8?B?T0FVU2k4d3BESWc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cf4da189-890e-4936-f21e-08d9f8fd6fe8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2022 07:56:04.0244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0901MB1657
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Feb 2022 07:56:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162422



On 25.02.22 05:03, Tim Orling wrote:
> From: Tim Orling <ticotimo@gmail.com>
> 
> Rather than only use PYPI_PACKAGE as a guess, fall back on PN for cases
> where a recipe does not inherit pypi.
> 
> Wheels can only have alphanumeric characters in the 'distribution'
> name [1]. Any other characters are replaced with an underscore. Provide a
> function to replace dash with underscore.
> 
> [1] https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode
> 
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
> Changes in v2:
>     address review comments
> 
>   meta/classes/pip_install_wheel.bbclass | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_install_wheel.bbclass
> index 8a848c0ebab..9f9feda6ee0 100644
> --- a/meta/classes/pip_install_wheel.bbclass
> +++ b/meta/classes/pip_install_wheel.bbclass
> @@ -1,6 +1,10 @@
>   DEPENDS:append = " python3-pip-native"
>   
> -PIP_INSTALL_PACKAGE ?= "${PYPI_PACKAGE}"
> +def guess_pip_install_package_name(d):
> +    '''https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode'''
> +    return (d.getVar('PYPI_PACKAGE') or d.getVar('PN')).replace('-', '_')

In my opinion this needs to be BPN not PN - as if you will build 
python3-foo-native (for native only recipes) it will result in 
foo_native-1.2.3-*.whl, that just doesn't exit.
What disappoints me the most is that none of this comes with unit tests 
- it broke for a bunch of stuff I maintain this morning, making my 
morning coffee taste bitter :-(

> +
> +PIP_INSTALL_PACKAGE ?= "${@guess_pip_install_package_name(d)}"
>   PIP_INSTALL_DIST_PATH ?= "${B}/dist"
>   PYPA_WHEEL ??= "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-${PV}-*.whl"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162335): https://lists.openembedded.org/g/openembedded-core/message/162335
> Mute This Topic: https://lists.openembedded.org/mt/89382270/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

