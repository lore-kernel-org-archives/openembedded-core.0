Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DEAC4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 10:31:19 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.53])
 by mx.groups.io with SMTP id smtpd.web10.4091.1668421877233563029
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 02:31:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=Dyzyt3or;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.53, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYBNYFEBZR2rjRPyba8Tcd8oZDN7xGFdkaFtFLHB/EJpbAWGyVhWlA2jf+jQ45RM/WszTKkOdFJIN2s9uUh+tCw1ddPZY7N4+1ljZYsVJIEdzX3AP0b8wpQRoWJMGcHHdNSY8Osmnpynh8HBw8pQ5vGEKpTjncvq13bQ7o6FgDl7X6ihllQkVoJEkk34bJiqEURPRHemH1Lv/ui6WNVamJkrvjWCz4RV2IArWu5Z/m+qaEdN57XmJXLQc2sVrqvac0Jt7+Npogm/+qUdf8xTGrARo7C9AC31oi/grquplK2BwY4t+hCXMxRTRE4E3vBAvivfjl63GIJZKCGSd8HzUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3zZwziYbG7g6leWFDDuh3/jsc7Y7q1RFSqI0RF8n2g=;
 b=DgM4rL77MXKfM1JWmb5KbFy5a/nMbUb3AMCPpvAHHKJk6ZQ7tLsHwxOmh/MOD5fBcn1H9dzkxIPQ3MkaQeo4d7ggRA4agYEu3p8Fs8pRqr1cAA+LsCAevUZYHftpe6ZLLI8qQGkocBSOeV1d5vc5FVdBcYFE5/MsUMvCCgYO/FfaDBXHfgW6kM3f5zhLPdawf+pIOgp8NYTL0BMX1Zj6d00C9GeNKFeXklp0DsVMgDUxrcGyTu5/RoyKniffzsLVKH2Ea923WeYw2uJCMNmTmYN9vqxI2oBnpjk/g1aJXPmkhmsU6dtQjGckzpdHcc4QXvpLUBwzrr5SwvRz+bsyFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3zZwziYbG7g6leWFDDuh3/jsc7Y7q1RFSqI0RF8n2g=;
 b=Dyzyt3orYm51/hmGpy9xMhoYFCbiCgFCMCddheLBJhneQioDUbjTfcd7FVh6zyhly71whnWwUyPual98Z3VZ3D7nUVaaSmaaLfaEq/8O3r85jZyDPIfHlNJc1PTICvwXdxlPAfSj1cykbOcCQDev6xh6j7StxTW/qoBI0xT1KkFNBU5dm39NLa5XbH1sd4ZEeMc6Jy1v963TO/gC5F/FHkeeLRC5SF8PHU9ky97AF/38eoMFhzd4AELu16kXFt7L4PVZlsLELS+d8+M1aNcAA1l3T+m/P7W4p1PXhDFciIPscM5L2etDRbSQNsS4vke2/tsFJqz9ekUQz41yYJf0LQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AS8PR04MB8261.eurprd04.prod.outlook.com (2603:10a6:20b:3b1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Mon, 14 Nov
 2022 10:31:13 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9584:94ee:73c6:bed4%5]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 10:31:13 +0000
Message-ID: <89da82a5-06f3-312f-cbe0-733974fbe908@theobroma-systems.com>
Date: Mon, 14 Nov 2022 11:31:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [OE-core] [PATCH] qemurunner.py: support setting slirp host ip
 address
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
 openembedded-core@lists.openembedded.org
References: <20221114101907.626251-1-mikko.rapeli@linaro.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221114101907.626251-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::11) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AS8PR04MB8261:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6f4a5b-e272-43c0-8bc9-08dac62b5a7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6ajnRLsJJnkoWV+SfTXIgICcycXy2GHDofqYdiAsghk9Z41uAPoEP6QWNHgn9s6bDi/wir8UtNVd3HEIg4+P3GMmjsquAdQVZGJl1BmpnvBPKiMOb7P/YoROWWVaP85NqM+cT8o31OaRVVBe8PXeRsT7b/JVnqjhu2SJyMC3LMfS84j8NNBOppL4V07Z3lQJSaMP0bIiDl90vamOHRpGqL7NDPTFMSVsgngBkmiGSzJX1w4ukIOtZ0PpwjAb9EeVZZfsxmMS0S8d13S4oVGU9dDwjgL1QYo5rGv6Les4BgBVLH3tKjGlK+3cKRfLxVlEChziDOsfcaLOfcUhG5Pfj2ri2l7mNRMeIJzM0afRi5jfbb/jj+j8VEAUn1yfgBo67p+FZ8FJhqlaoSreoARhhsKUYbgu/XzQUKL6HNpPBHCfCU9nHEKbK1tIjLi3xo5ypO2f6UH5ZP7Xe9Di3pP1VWCVWK7F952bKooSiMe7ZPb0MLL4SbBu+763GPhojvDD5twJPYOT9Y7JAs1JOY5Eentaz40I5wg3xn/sN4ClSmsbmW+CxoSub6xTEqOYb3U22QUYuGm62xxrGGSKj0Od7rrUy8wWwy3fAOV78ZIbdyhoACBsw+ySdYjFXpL+zHPlEgXyGR+0vLcfeJhhgtOibUOGi1yikdeKZLpoS89Ar9cq7R6rFSYppcTQsoNGNzWMsCX34NVhRCU8LI0XnnvP5Z0iG/1Cuk3pWUzgGFKTOH77y71ETfg6VJxP7nDjZ6yswpKAIS8Gi6YkbQHuG6eaVFkyEA/3f9dfDSoCtXRgXh4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(39850400004)(136003)(396003)(376002)(451199015)(83380400001)(6506007)(53546011)(2616005)(26005)(38100700002)(6512007)(186003)(2906002)(5660300002)(8936002)(44832011)(6486002)(478600001)(8676002)(66556008)(66946007)(66476007)(41300700001)(316002)(36756003)(31686004)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aUdrUzE4c3lja0V6cHcrWlYxMFRFWUZEbTB5NlVoQkdKaWdYdkFmRG9DWXQ5?=
 =?utf-8?B?VXRMcDdpSFZBVS96RVRtdmx1SjRkeHlzbWF3MTdlekNJWmw0OCtXZFhpY1Va?=
 =?utf-8?B?UDdhcDVOQ3dWQXE4cXJ4QzZ5SHR3VUtlVEQvaXdudTI0OXNRcDQ3Tm9DSXU1?=
 =?utf-8?B?MHQrejZxdDJkMEw3eWZhV2NobG5CNVJ0VWViNUNCemFXa1VDaERJaXpTVEo5?=
 =?utf-8?B?aUMvV25XeU52S2YrOFNZN0FKdTY0S2lWUGs2QnJQbWpCZkVvdEl2cjNmNi9s?=
 =?utf-8?B?MkllS21qT2dHQ2cvY3c2Skw5aDd3bWZOK0xxQUxHRS9sOUx4V3Ewb001WHJa?=
 =?utf-8?B?aXVya004K29HM1MrNHNtUHQ1eWNoZFRWUmg3b3I1dzRhUTRwWlNkWU5vcEtZ?=
 =?utf-8?B?dDJaQmozbzg0MGZwTHhZem94Kys5a2FBOVAwTm9VeFRHSGI2YUk1dENVaC9V?=
 =?utf-8?B?dVl0YjcxSm5Td05YcGYzdzBJSGoxeHJWUFBwdkRxRjFObXFESEwvRVFlcmE3?=
 =?utf-8?B?MlFnM2tVQVhaQ3pQdTQwdHdSQzQvYUdEUTBIYUR5K2NldGI4NytvMDkxRzdD?=
 =?utf-8?B?ZFY2Vm50d3RWdzZpQUlrYm8rRVozMVpwVDd6T2tUeHlpVFZMbjE3QTR4QUg0?=
 =?utf-8?B?VVVSU0JRQStkT1VCcEgyVnl2ZDJWaWk0SnBtN3VGWFYySm9GeCt4SXJnNmE1?=
 =?utf-8?B?bTVMaFpQb0NxbHUxNlZtdUIvTC81cFJYQXkydVh5MjN6VHc4Z3Q5SW9DZlNt?=
 =?utf-8?B?ZDZXa3V0NVZaV01tQ3FicUo1SGhNTTZtQzRWUCtoWjRvY0Q5M2t5WFcrTHdD?=
 =?utf-8?B?dW5hK2RlYThRZlVXUERTTDY3N2JoQVNEU2pLcEpmMWlXM2tydzBQWWdrY0t0?=
 =?utf-8?B?d0V2T2pkM2JDMjlveEJMMHpZRk5ka1g4WWtlS01DemYwRzBSZUJ2K3AzU0la?=
 =?utf-8?B?SFVLNXFIT05SRlpEWVFzNFE2QXh1ZjRZYjhFQnFLV3BmSXNvSE5IVUdtVWRN?=
 =?utf-8?B?dWR0UjF0a1ozZEtZTXBmeHJsNjJ3eWJ2QVorck5CZFB4VnBDTC8wZS9VNHM2?=
 =?utf-8?B?RDF0ejVRaSt1ZmhMb2hwYnh3SkVXQUd2dmprbFE0SWVkOHJ3cERTRDNuS0ho?=
 =?utf-8?B?UUxGWEFWa0dTRFdwbzdEZkFsZ01yYlRDUmtRcmZONXlKeHdTOVZ0eWxaTUdO?=
 =?utf-8?B?dWFkY0kzU0RYZVJOdFgxNnp2VU0yaERha3F3NEMzSTczL3pINkd3LzlYTVN4?=
 =?utf-8?B?K01PUi9uaEhwL1ozYWNmSm5BaFdsWXpmbVdrYWJNSSt0UmxUOWZ6SU53OW5z?=
 =?utf-8?B?YTgxem45K0duWEpNc0doZGVJdTZ3dUtheHZVVlhYbFFnclJjcWhtT3pKZy9I?=
 =?utf-8?B?LzRCSWwvdmg5VVRXcXBwU0VFcEdFMkFKVzVPcGdzSUJsVU9TMlB0SjFZazZB?=
 =?utf-8?B?Q1Y3eUNZMi9Vd25yMUk5dVRmZndsUkJEV2hvM0JhZW9TU0dudG1XbnRvb0Nv?=
 =?utf-8?B?S1E2RGVIVUJaYnZOM1QxSGZxVXIwaWlON0VpV3NOZjh0RFY1R0xwT3kyR0FC?=
 =?utf-8?B?bDVNODlBTFM5Tk0ybm1SK0w0N0tzcU41L1l2TC85VXcvR0VidVAwZEhFQmlK?=
 =?utf-8?B?M1B2N0R6SWxsaS9tNVdtT3lFU2d0Y0R0TnpqRGw1OHBjVGF6ZlV2aExxdWJo?=
 =?utf-8?B?YkNPdEhSRW9nQUEvSmR2eW5DcTV2RVNhYlMrRGU4N3MrN2orYWtnSFFvTkVt?=
 =?utf-8?B?TXhmRzFQcjZuNnh0LzN3WjFtUXJ5RG5CWVkweUVwSjBoNkhYY3lLcitZQXk4?=
 =?utf-8?B?YllMSXdWeEZlYUUrZWVOMWZZTEs4VUNyaHpoMzV5QTZWL2VlQk82WGp2QjdL?=
 =?utf-8?B?Ty9KUmMwcks2S1hMQ1F2S0hEdW5KTVE1MTJsZUJVZ1BXZGFMUWdLQy9WUEY4?=
 =?utf-8?B?aDd4T1pXeUkwTGRLOEttMWRkMUF3ZUQ1ajVMQ2NiR0lIYUdmSkpyN2pmUFZa?=
 =?utf-8?B?OCtCQzlWM21mc1FEMkVySTdlMzlkZm0waTNHTjJpRnZjWlltSHUvdlJVYk9a?=
 =?utf-8?B?SitXNWVCL1RFZHJQakQvN2dwbUhqN05wVjZLTVVLOFdpd2NJSWZjdXRMdDIv?=
 =?utf-8?B?ZWg3SzNtc28vTHFxUHZ4NC9ZbVhpT2dueUkyRnBtRWZ6VlBQS3RIVXJhc3Zk?=
 =?utf-8?Q?S185/S8XrZwXHqciSuWVx2Q=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6f4a5b-e272-43c0-8bc9-08dac62b5a7b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 10:31:13.1379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: grXN2bacUzHjimwILFM56KHZw+fagzWhkQgPOuTErbIgV7K+W3atc/bAiDXPs6lPUXYxEkxvyW4mmsfKm7prZcW48axp5qzCtkKlrTect476iRIDh/worQXi95Z58bNj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8261
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 10:31:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173235

Hi Mikko,

On 11/14/22 11:19, Mikko Rapeli wrote:
> By default host side IP address is not set and qemu listens
> on all IP addresses on the host machine which is not a good
> idea when images have root login enabled without password.
> It make sense to listen only on localhost IP address 127.0.0.1 using
> config:
> 
> QB_SLIRP_OPT = "-netdev user,id=net0,hostfwd=tcp:127.0.0.1:2222-:22"
> 
> Support detecting port number from this too.
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>   meta/lib/oeqa/utils/qemurunner.py | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
> index e602399232..f175f8a1de 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -401,7 +401,8 @@ class QemuRunner:
>                   cmdline = re_control_char.sub(' ', cmdline)
>               try:
>                   if self.use_slirp:
> -                    tcp_ports = cmdline.split("hostfwd=tcp::")[1]
> +                    tcp_ports = cmdline.split("hostfwd=tcp:")[1]
> +                    tcp_ports = tcp_ports.split(":")[1]
>                       host_port = tcp_ports[:tcp_ports.find('-')]
>                       self.ip = "localhost:%s" % host_port

But localhost is enforced here?

This patch basically allows to pass
hostfwd=tcp:127.0.0.1:2222-:22
instead of
hostfwd=tcp::2222-:22
but with the exact same result (which is, localhost:2222 will be used?)

Also, this could be migrated to using re instead of doing manual lookups.

I'm not sure the commit log matches what the commit is actually doing?

Cheers,
Quentin

