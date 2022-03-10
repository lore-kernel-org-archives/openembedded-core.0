Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 049E1C433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 10:16:57 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.72])
 by mx.groups.io with SMTP id smtpd.web10.7911.1646907412457171474
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 02:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=C6UviAB+;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.72,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UN0vU0aifX8EUq3ep7l0s6ChjO6KeoYzLoiRnTlnBEh6O1C0LzkjBlb5CMI0Pfx77dJOzUdQw++fqGb9T2WDtPkZLoceDegG2p1i2IquNVEODUAq6S0CE1b+jWy4VaXaY+eAx9OI0fvv30kaFKNNYcY2h2j67N9MzRIT5Pc1PrVGdn6+3fEvMr3hurrRzukVJzhtOvES2XVFE7GrF6V8X/5sdmrytM47XPENdnKDbuzp5KUZ3av3eltEPWZdSZ7NkDhDs3EA9/Tum1OCh9ks4Q9y/MCK227kltXLePMHtJxrSmMgVSFdZNc8q0HOEU+EH87E8Kfe5tQfcWr4xTS/IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8XzJF8VxrzUPOuZoGow1AjP34umbVPcr3KOYp8U/3w=;
 b=aJPt1hRGGF2dom2fKxeroYrdxPAYgKZS7R6BbZBnZHl2dn0bOA0IngXjmgjt8hXMJUO41uZDBmJ4osMEgtIFTLKJhVcDwXEseXtGdfpZb955K1YRa7E6tby/hhR2ksRy5VB3I83sR5jztodj9Ag/mFqsh+XOSuUL/Qx+Iwcxl4kGRPZZnWrcKXCB5oBBiBvmBpXAc4ms27h7nZ3zAYOxSN4HkGkvpDlXZbHi6gALv9bvnCIiueqBV6CKumcp4N/b0BIevd4Prj6UC50WiUaNRctvdofDZifY2YwSHg7DY9mXHg/0iMivhPmw2aRS9ZNR0E+sCWJkA4RPb12oIJZRtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8XzJF8VxrzUPOuZoGow1AjP34umbVPcr3KOYp8U/3w=;
 b=C6UviAB+NR5xocaLCBlgwjPC7adIn2/Up/VLU1JYqdNZO/raHnGT+wqTaMU4AmpHZowoLcy8I9yE9jJoQsU+h7CxE6boC9NwzcD81UJ4nXVsgIwJiAfKqEUpgkDqYrgkOZNqL9xqXyyzoB+7aKi1mFCZgqxhxD5sjHnMJD1+KmE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM6PR04MB5351.eurprd04.prod.outlook.com (2603:10a6:20b:29::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.25; Thu, 10 Mar
 2022 10:16:49 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3%9]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 10:16:49 +0000
Message-ID: <cbf4c8ee-11e1-fcd9-c2e3-d682386412d7@theobroma-systems.com>
Date: Thu, 10 Mar 2022 11:16:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH] mesa: make sure GLES3 headers are installed
Content-Language: en-US
To: Samuli Piippo <samuli.piippo@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@intel.com>
References: <20220308085812.973165-1-samuli.piippo@qt.io>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220308085812.973165-1-samuli.piippo@qt.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::18) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39d6a7cf-dc98-4b31-f8a7-08da027f16d7
X-MS-TrafficTypeDiagnostic: AM6PR04MB5351:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR04MB5351D1B37C0DE64111C46C5EC20B9@AM6PR04MB5351.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U9jh5pvvZ63mmRY8XMm3TaLL+96jA4lbjDgoyylDpHTeCnpBiAkDU/zpaksxVrUPFriwoXppgepOOMrVl8n6Xs494+o8xXBq3CckEbEKcAwpjva+GFkLYGIZonsYleMBvIxsAELlw0zGxjrgVAPi1JjcyN0il3taY0nWe6pE1S3O6dlvkDzgwMxFj2m5Y+SQlJdlAqRTJHshQtxpD1clLpkO1Dl33NmZn6p756FsYlTDjVQRdZkbKDHU1VjlwWvaQtN9jwkoQISHkmn8QmVbqpNytRAQzgv5piq8fuhM7mrpZUg/b3CawhEnf284f+r0YbgBfJrS21Nj13NDG9Drk7CIbXhLE1x6i8PlMm/egnft7gh2WRxPnoyaKC9sbPDK0zTAms+x5OfdYr9iR1P5e6yYRwwMzPYGNNel6UFE3OUJd0LXz6OZxi8a787wu7vPY3ztSki5wPPkKbtzaZdp7fwvtxHaWHhmalXPRPUtJ2M5euvZ+cBXjMzYYFbDuAnquuX2cmwdFxK6NqAZS0fupHAnyApam60a9KZUETJbridHW+8dcxb5CY1lG8/Cj+2iE2V/2E7cJiZAjh33umHdpPw8U7odjuL1btSj1Ha9UF1FFZKQ8r6RNHXGpybwaeV1mjBTXx5owzTIhPg6IAR3vvJ+FZt5FK2glqVHIUEUTiFtAYpBgOt5aRUqNZu6hqZnrA6zhxeV/CiRn9uhYTVKYD6R+rqrxK9y6aRt8++HpCg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(36756003)(31686004)(66476007)(66556008)(316002)(4326008)(66946007)(5660300002)(6506007)(26005)(186003)(2616005)(8936002)(53546011)(31696002)(86362001)(44832011)(6486002)(2906002)(508600001)(6512007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ckJCTmpnZzBMMWU2WEE0dnJDS2RLTVdwR2pmaTZwblYvenczUWhzMXZGRDFR?=
 =?utf-8?B?TFdRY1FmZ2FoTThBQ0k1UkRWRG1iMzJha0k3NUw0OHJuNnhzem5ISlVVQWJp?=
 =?utf-8?B?azMrZXNOa2NLTDY5TWJJdU1ZellXR1BBdnJ5UXplamhxeHo5VnBBVUZyWnlr?=
 =?utf-8?B?UUdFc1FWR1FjT2R4cElYWmRjZDdZV1BpbHB5NzdHSXlkMFpxWnlJOG5OR2Rr?=
 =?utf-8?B?N016K3RKc2JJS2pzWmR6c3hGSVN4MGpIbC9YLzNZN2RVQy9vQjk0Wjd6R1Fr?=
 =?utf-8?B?VXl2SnF1aUhHRVhTZEEzZUtCcm02R3kyTEZMdFV0c3lPK3BzTFptUGg5NXpS?=
 =?utf-8?B?c0tFSjN5YjE3alB3NlFoOFFzR2JqQm9zcXdlaHNua0tKQ3E3WXFxZUYrNlpH?=
 =?utf-8?B?TFZMS2g3TTFUMCtxWnFkS2xKZTg1cmUraWhrOFpmbmxQRmpaVEFZNEgxaDY1?=
 =?utf-8?B?YUhZUGhZcXlkUHYvQ2o3R2djOU9paU1TMVhZTkV6TUNjWkQrVmpVdUhScnhp?=
 =?utf-8?B?VzBtaU8wanhRdFNpWk1tY2dWblJib2xpWDd1dnpVcnFEaVFCd3pteHRuTWkz?=
 =?utf-8?B?L1BUZGxxVFFBcEhyenhSYzBudVhEUFVwT3p3Vm9wNitPZ3c0YVpGVGw0YmJn?=
 =?utf-8?B?WGFZQVVFL0FYdmlnY0t5WCtudVhBdVdjZFM0ZXE2YmNEV2NTR1RObUoyYWVL?=
 =?utf-8?B?MXJsUDBienNTVjBWQWVZY2QvREZGSEVWSi9lQUc5LzZWLzZHTHFOWE9CTzJC?=
 =?utf-8?B?S1c4Q1ZmWUprMEJabHYrcUxyNEhMRTMrQXZ2UzNyS2JEcXJjUUtIWlRjM0NU?=
 =?utf-8?B?VU1mMFdRRzRXVnAxdVJJS0pHdi9pUEpnVUMvWG4vZzc3c09DaU15RHppeHdN?=
 =?utf-8?B?MkVTbFdBNVJRTUZFM1FRTFVRdjNnczE0dklTVEVONzJSVWdMeVpJMXU1Z1RC?=
 =?utf-8?B?K2laTVBtQlZkNEUzK0RpbElPTm1UdG9CNE9uOU9XcWZYYnR6eXI2bkFRY3NQ?=
 =?utf-8?B?cjIxNjNOazA1d0pOdDlwSWprWmhwdm1iRWtFbkxlaW1MQjVBWThqRm9FL0JD?=
 =?utf-8?B?TnZrbjRiVEIzdlZUV0VvYnVob0ovQi90aU4xc2NUN08zclRlTC9PcHY4WnB1?=
 =?utf-8?B?N0F5MmZBUlpEOGprQ0NCZGxUWGV2SGpId0VHbS91SmJ6TXhZZ2xZVTZFeXgr?=
 =?utf-8?B?UDl1N3c0RC9mOERNOXFoWmpMSW9FMjBQdnVZLzdiVUk4STAzdVNndjZWOXpu?=
 =?utf-8?B?MlR3b3U2c3dJampadU01RWhqTFlqbllmMzZWa1BvV2pHMXlmTGxhMWxRZHVt?=
 =?utf-8?B?SEVQazJmVCswT3FlakJyZFMzejUvanJyTzJMREFRM1IwRVlNZ3lFOGx6NDAy?=
 =?utf-8?B?N0JUMkhMZnBXZGc5eitraDgzWDVNaFkrVVpHaGw5QUlscVVJVlU0Z1g1MVJL?=
 =?utf-8?B?aTFNYjlyQmg0VFlGbEdCUnBEUXN1ZnNIdW1HUnkrRFcxU0Q3MUpDM05remdI?=
 =?utf-8?B?bDd6eGVPbkpCR01wRkpNQWgxZWpEaGV1cUhKRXQyU05WSEpVVHNVdldsQURW?=
 =?utf-8?B?dEVIY3JvaUUzVFpkK0JsMkhjaTRTZDYwa1RXak9zNDlVbnByNWlndno2OWg3?=
 =?utf-8?B?WkViUGVUK2Q2WDk3OG91aCtHWGx6aE1OZkxhRU4zUklmdnVtVS9qR1greHJy?=
 =?utf-8?B?cG9HWWZpUkV4VlorcjlyODVtM25GUGVPTVg5V0dFOFV2Q0ltbEZNTUNxZlNa?=
 =?utf-8?B?TFFzWk96WG5JS2FhREZrWWV3WXBwd21LVzR3V1BXQ2NCZE13NWxWSzhya295?=
 =?utf-8?B?RnY4bGxtL0xRVklNenhtUTB1RlQ4L2Vyd0FwWXBjbVFhNis4VzJwa2xzSWFE?=
 =?utf-8?B?YzhCaW9MU0pLSkt2QmpzUC9aUUh3eGQzNWR0OGxXVmNJL0lwUDZTZjVRUVFC?=
 =?utf-8?B?Z0VJNHBNbldwUVhJSTNORTNhTUxGNzNhU1l1dUQ2TzNmZ3RGMi9lcFVuZUJQ?=
 =?utf-8?B?UkgxSUxDOWR5eUxIQzFLT2hobWlOZ043QXNxQmJyeUxSemh4UmVUSGRpNmc2?=
 =?utf-8?B?L1QxUXhjWDZydHdPQldUbWZSYWRQK2Z6ZSt0dDVDSlNWRmxLVWZxeEJyNEtC?=
 =?utf-8?B?Zm5XcE1qUnRYejNSTlJMWGFaSzh3c1crdnNnQWhKYVM1aXVEbWt1N2lSd3Zs?=
 =?utf-8?B?ejhnR3QxRVJ4UnlGRGJJYXo0TFk1VEpaWWRIZGZ2c3FWaGppWFFjdWhoNkIx?=
 =?utf-8?B?K0pnVEpEajlXaUIrblFBMjcvenk2RngrNG9vQmdURnBqbFF3Z0pIdkgrVXBx?=
 =?utf-8?B?d2NKZjJmcVFVcGRUNTRyeUQ2QUc2bW5tQjMrY2sxV3k1dlJ1NTlUUT09?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 39d6a7cf-dc98-4b31-f8a7-08da027f16d7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 10:16:49.5588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UF84r3wAttJi+NJ82xikuQhhBkOdMa6/iTl7LUv8sGObxYR7+Pml+hqvSeVO8KoSjWqiUnMgPUFaTkGaqVYKMY68Y7q+eYCdVruvNh2gwshAND5r53JXudmK0YGsxlX4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5351
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 10:16:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163008

Hi Samuli,

On 3/8/22 09:58, Samuli Piippo wrote:
> Since there is no libgles3-mesa package that would pull in the headers,
> add dependency to libgles2-mesa-dev. Now there no need to manually add
> GLES3 headers to image or toolchain.
> 
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-graphics/mesa/mesa.inc | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 2f79e8b34d..713a82dc7d 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -193,6 +193,9 @@ RDEPENDS:${PN}-dev = ""
>   # development package of libgles3.
>   RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
>   
> +# Add dependency so that GLES3 header don't need to be added manually
> +RDEPENDS_libgles2-mesa-dev += "libgles3-mesa-dev"
> +

RDEPENDS:libgles2-mesa-dev += "libgles3-mesa-dev"

There is a new override syntax since Honister with colon (:) instead of 
underscore (_).

Also, this adds a circular dependency, I don't know how well the package 
managers handle this case (we have deb, opkg and rpm right now so all 
three of them need to be able to handle this circular dependency nicely).

Cheers,
Quentin

