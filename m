Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D27F5C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 09:43:36 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.51])
 by mx.groups.io with SMTP id smtpd.web10.27151.1698918211011873105
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 02:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=hPjfufdj;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.105.51, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=askTPTHLW0re/RFS09/QCmbDNEmysGDav6j04n6qUqDRwu/43jQrscbeV5xbjquYtn2Gf3iiHSTNYi+pvNkcMLIloMmYAf6UfPFhKzpZIyYFK0MhEYtpkuS0VLS9kCtDn7j3komedglOELJOilS+M4sBlb93Yu8cGzUQO5xLDHJmdPTZJfVGgfwJ/8WLmyauF2dZE5ijVij1QIimnR6ghdGdqYQYaO0i/EzZzqum9ggZTKiknkkXeXkn4W0YhoPCuaTMX5oD4s1G1g7PI28fShwj9qXlRzhzgzg5Qzx7XZdvH8qBDACollN5Xle/K/hdvmRHGsZrsAOh4/vj1LZZBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEZWFXTpu3CG24TdAKKkV9XxU8CocX7jg7EaOaM1pbk=;
 b=dkAL17Rlah/WD2ujoo2VNz/U3+PbdGQsQWI0RyWsrIUFlRykNPIJfX+TXr07N994VNPsImQtWSlzf6yvtSbGLHxrAi4O96o4tCuzX6+xY2tdeqDxiCW7CNJX21GsrLBjkFL4PLTyYk0aNRzRA80nGMTuAeOIldFLgrYvbppbT+Lmbwb4cqYVcf5EuwTGyFpJSxJBBhso6Iccn0u1kHUsViTbdGWecUSW/Fy+qQIGnxjwlZ4gv030UXlLg28Sp6IiTUc0MV8Qi589pS5b4fTKg4I/RO/0mccMg/B+76w5UW7LOgWhokbtBiOv1FgQqJoAyKASqVCJtsMyFepPl+mpqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEZWFXTpu3CG24TdAKKkV9XxU8CocX7jg7EaOaM1pbk=;
 b=hPjfufdj6q2KpQWuQUg4jGGVpQ/ZrNzSnU6AMW9x50a5bh8yeuTMdYurM9dl4seFlbX+fWPlh5e7e2389/rM/vh5pQGak2i7HzOR3aV4k9Zd+Fc4206dA1q/J807X3d6lSy3hbQpKMyi6w9vOKV/oBV2rVjiHuTfP0iDv40++93xJJXFfLrWJQj/vEhNCnCevIwz78WDhMiy4T/SwQDDrGrwBX5LRcnzpieiWOQk6pEyPoFXZ6hPz0groBCiKx9G/EIjTVMaSb+4PK6nmxKGWoT6N2riGOiULvYOOUWOs3SgF6Z2+FiDrA9H7/npzl162q/f00K5AUdhO9pL6UTuRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM8PR04MB7265.eurprd04.prod.outlook.com (2603:10a6:20b:1d8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Thu, 2 Nov
 2023 09:43:27 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::8b7:c8b9:d800:8b4d]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::8b7:c8b9:d800:8b4d%3]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 09:43:27 +0000
Message-ID: <70aaf433-20fc-482f-9f23-dd5e18fb98a4@theobroma-systems.com>
Date: Thu, 2 Nov 2023 10:43:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] scripts/patchreview: rework patch detection
Content-Language: en-US
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Cc: nd@arm.com
References: <20231027152941.232042-1-ross.burton@arm.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20231027152941.232042-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0391.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::15) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM8PR04MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a2b433b-2021-4a2e-fb17-08dbdb882a1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yPXCMWbbut+WHno15bYP8F3+wqFmP9r79RR1q4JXcN46GGQetrx8zv4IZ5THzUsaLAO/TcWKvrqD3xGi6EEwsGfXa/qjo947GTV9Z93r6QcMBX4amJWRl7syjoS9t0/ro7GssJ+RvnHma5b5RZB09mZzhxLRkTyjqvmXtjCLMqE06ZNFnXqUSMz6NrEUMZMCSzNsFPTyDuVmlSPFwEKae1WGKi1dEl3kgOQP8SVnz/zabLxJifo0PaQ7BXy0RlN0v4i3+MtOgJRhy++H6dFeXBqzkspbmYLtvebfFngmCxZElLATgVK1dmNx9umuU+mw14AOPTfqmW1zw3uTF+bH17dQVOR/HlM4kKxThA1ZVCIPNY3+MSGAtrrCYAW0YU+5ErSKJoecsmsfv6HYgSBEJ+sXqnSi9r9AVVCzfg17BMgLhon7vjtkO2tYw8uuRflLvUR5HFOb9n1xqLZZuoOmcokLbfi6iUXqISmh5DzSeWhLj0jJQvp5p2/p/WsAwyNjkKH//aCJmwGM6WxJYXk2/47q2XsIfd4r7NYM0tzCQXqnlMOlezq+hSk1FXsrutvnc0SRMyZWVtU4qVmcpzIo1qfb3ANBRWxM0UTGePfruGya7VKQa2vMoPwEVjW4KtbdhNKe2Hhv3TuSSd2UqKh9Gg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(136003)(39850400004)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(6506007)(83380400001)(6512007)(53546011)(86362001)(2616005)(31696002)(26005)(36756003)(38100700002)(31686004)(8676002)(4326008)(6486002)(41300700001)(478600001)(5660300002)(44832011)(2906002)(66476007)(8936002)(316002)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N3lnNTE1REdYeUNTZ0FmdFJzRW1hMEx5WWpEUGhBVWpJR3JoQVRWNVMwNXl2?=
 =?utf-8?B?VldROWxBSmwwb29INjlVZzF4SVE2b3BHbkVpT2RscXhmSlhrNTV6MkFPbHV3?=
 =?utf-8?B?ODhsSWhYSVRFSFRaQkxJQ2RTK2FJUWRnVTlrOFRGZExDcVpQYzFlNTQrRThU?=
 =?utf-8?B?bE5UQUk1MW1sZHBwVFFRY0l1OWNnUlhnV1JXR250U2lTOTFHM0Y4WTdjV05w?=
 =?utf-8?B?MlFubGZjZ0tjZlJpK1E0SS9teHJMVC80UFA2UnNaY0czOGRCUWJ2YmxPc3l5?=
 =?utf-8?B?RmxON1o4TkkyY0JZVTJNRk1NY1k0KzNuVHhqTnlYY1hBVUFvNDRzYVNhb2c4?=
 =?utf-8?B?VnI2bDdrTEx0UXlWSDlWeGdjbitVN2FqL05BYjhTRXgwY0V1a0ZQdVpTbWlC?=
 =?utf-8?B?Z044ZjZFK1NkbHVsTFkxcVB6VDM5VlU4cVEwbVY4UUxKZUV6OW9YNFRGTjFm?=
 =?utf-8?B?RUJmM0lxdTIzbkVJY05rY01zSlloMDdyeGQzVzhNNVV2aER0ajdiZW5ZZFZ4?=
 =?utf-8?B?aVBVS3RaTnRIcDJIZUN5S2ltc1ZUellocjN6ckxGakJZYVFqUXFoU01NV1hT?=
 =?utf-8?B?a0dmSDNDS0hUWVNBYWhaMzFna2FiOHF1S2t1eE16Szk3NENpOGF1dVltU2xz?=
 =?utf-8?B?SDdmOWwzNnk4RWUzK0hpK20vaHhOb3pIc00wUit1dTdybVRCUVlRaHZHMlBB?=
 =?utf-8?B?cnAxR3I1ZkpFbDZOMFU3RkhtZEVsb1BRUlR2ek1GMitmemVSSUg2Wms5OTc2?=
 =?utf-8?B?cXZVQkJGL2tBWDg4SWJ6d3RYU3dkbVYrTkE5aFFiWkd6YUxoZUs1TUtRSmQz?=
 =?utf-8?B?YzF4aHVnbnY4ZXRwV3FTeDhVbVphNFNpNWJTT0d4elFnV2loWjRVWStLWDRU?=
 =?utf-8?B?VXJjcUljcDIwQXo3aXk3QWFYeWUrb25lcmZsQ2tHMjAycENTbG96OUY2UHpn?=
 =?utf-8?B?RUp0aWhZNVUrTFFUY2xadXZRMjdnZFJFMjNOcWdyZ3Q4RFFFZUYyQWhlcGVC?=
 =?utf-8?B?ZU1LYk1NYTF5UCsvUnlyVFNvdmp1TkEzeU1xMzZzdGhabUdORG5hT29uNm5z?=
 =?utf-8?B?UGJ4QXFsZVFCa3RlWGdxRjE2RldpSVhXQW5BVGV6RlhNb0ZFMU9hMXJVUndO?=
 =?utf-8?B?bW5mT2lqdUZYYnB5OWlPS3pRVjIyb245YTNSMmRlYittZHhHUzlRTURaV1V6?=
 =?utf-8?B?QTRQdmhHTEk2SVR4alhlTXpCTDk1VnRFSWw5QlZEQUlwZCsvUjdHdmtMdDFQ?=
 =?utf-8?B?cUdpZkF1RVNMc25KVHh4TVlsazZQNjl1VVk0SXRZK2tpSnpmaGxJNkNPeTRx?=
 =?utf-8?B?TDk5NnNqVmgyYWhZSW1KMXhweDduMkVXcFViYktzbVBRZ3Q2d09XV2IzbTZE?=
 =?utf-8?B?QndESzN4Wm44T3dUZVQ0Z1Y1R3dCalVlVURZQ0dlS0taQStwU0U3d05nNFFL?=
 =?utf-8?B?UFoyNVdyUm8wNm0xTzIwaHIzbXFvMVVuMUhaSXpnTVo2bUNtbGVzcmNlNHFC?=
 =?utf-8?B?UHgyMSs5QkExWXJEUUpFWjJFejBRcHF0NFVydDhmcDFKYWZ2SlNMZm9jVlUr?=
 =?utf-8?B?RUFOR3k0UzVjeUo0RUNlOUR1OEFNNWtwZXhFWXgzR0w4VElyTlZrZVZ5VXMv?=
 =?utf-8?B?ai9BWjlNZkZVazdNOGlNS3B1aXR1WS8wL0tsQVhHSENmNGdZNllXRmZ2YjlD?=
 =?utf-8?B?RTJvdkJxV1JxVzRYaXkwY216YXorQUFrUnpqR1YrZXF6d0pFNWpHN05qd2Rr?=
 =?utf-8?B?aGNqM1BBdDJVRlpVWmF6QWt2akJCQ2lDSFRjSW5Pc2lSUHJzcUZpUFZReTFV?=
 =?utf-8?B?Ung1dWZFRmxWaGVpRW1walkxTHZ1YmZ1My9XN1lvU0FTTXB5VFVOZ2xtY2cr?=
 =?utf-8?B?alJzS2tmMk5RMkppRFdiM2ljV2RwWmVSbFArK204TFh5YUFaN2s5T0d4Ylp4?=
 =?utf-8?B?TXpYNGxIWWxLV1RmZlp2Ulk1V3NkZGtFbTh1c3grWEw5TjIzTWxJbkZLejl5?=
 =?utf-8?B?ZXlScE9GcHp6VEVuY0VUbUtIR1ZNWXlVdXprTWk0eStzY0RJeHlsV0Q4WFl4?=
 =?utf-8?B?c1phY3Z5MGo1YUtqdlBkclRyK0lobXcrS1J3dTlaVHRNMnpjUDI2d2Vodnlq?=
 =?utf-8?B?U0ltd3J3emJXQjZ2Mmk3eU5HcFo0RUJ3UE1TSldsVy9sOWFCVHVhZUpoZFpH?=
 =?utf-8?Q?3DBRmk8J9ygisiOYzakxsUs=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2b433b-2021-4a2e-fb17-08dbdb882a1e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 09:43:27.3206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BDwfTwhRAA1llikiyxlmPDONO824FzCoQFjj4hEgbFWQOwLXjLGJ+b40UxDmtorFz17alTu4iG7IHuRWiByH5whU0TKil5BzL1THkYSsPj1Cv7FuRKVffoueO99/q47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7265
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 09:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190071

Hi Ross,

On 10/27/23 17:29, Ross Burton via lists.openembedded.org wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> A previous patch[1] added the ability to allow the search pattern for
> patches to be changed, so that patchreview can be used across the entire
> meta-oe repository by changing the patterns.
> 
> However, this means the caller needs to write long patterns when calling
> patchreview.
> 
> Instead, we can see if the specified directory contains a layer by
> checking if conf/layer.conf exists.  If it does, then search for patches
> inside this directory.  If it doesn't, assume that the specified
> directory is a repository that contains sublayers (such as
> meta-openembedded) and look through each of the directories that match
> the pattern meta-*.
> 
> This means patchreview can both scan either a single layer (eg
> .../poky/meta) or a repository of sublayers (eg .../meta-openembedded).
> 
> [1] oe-core 599046ea9302af0cf856d3fcd827f6a2be75b7e1
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   scripts/contrib/patchreview.py | 36 +++++++++++++++++++++++++---------
>   1 file changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview.py
> index 43de105adc2..af66e32e02e 100755
> --- a/scripts/contrib/patchreview.py
> +++ b/scripts/contrib/patchreview.py
> @@ -41,7 +41,7 @@ def blame_patch(patch):
>                                       "--format=%s (%aN <%aE>)",
>                                       "--", patch)).decode("utf-8").splitlines()
>   
> -def patchreview(path, patches):
> +def patchreview(patches):
>       import re, os.path
>   
>       # General pattern: start of line, optional whitespace, tag with optional
> @@ -56,11 +56,10 @@ def patchreview(path, patches):
>   
>       for patch in patches:
>   
> -        fullpath = os.path.join(path, patch)
>           result = Result()
> -        results[fullpath] = result
> +        results[patch] = result
>   
> -        content = open(fullpath, encoding='ascii', errors='ignore').read()
> +        content = open(patch, encoding='ascii', errors='ignore').read()
>   
>           # Find the Signed-off-by tag
>           match = sob_re.search(content)
> @@ -198,21 +197,40 @@ def histogram(results):
>       for k in bars:
>           print("%-20s %s (%d)" % (k.capitalize() if k else "No status", bars[k], counts[k]))
>   
> +def gather_patches(candidate):
> +    # candidate can either be the path to a layer directly (eg meta-intel), or a
> +    # repository that contains other layers (meta-arm). We can determine what by
> +    # looking for a conf/layer.conf file. If that file exists then it's a layer,
> +    # otherwise its a repository of layers and we can assume they're called
> +    # meta-*.
> +

Maybe mention that this expects a pathlib.Path object?

> +    if (candidate / "conf" / "layer.conf").exists():
> +        print(f"{candidate} is a layer")
> +        scan = [candidate]
> +    else:
> +        print(f"{candidate} is not a layer, checking for sub-layers")
> +        scan = [d for d in candidate.iterdir() if d.is_dir() and (d.name == "meta" or d.name.startswith("meta-"))]
> +        print(f"Found layers {' '.join((d.name for d in scan))}")
> +

What about just looking for all layer.conf files recursively instead?

e.g.:

scan = [l.parents[1].name for l in candidate.glob('**/conf/layer.conf')

This assumes a layer root directory is the parent of `conf` directory in 
which a layer.conf file is, which I think is a good assumption.

But this does not make any assumption that the layer should be prefixed 
with meta- or be meta, as opposed to the current implementation.

> +    patches = []
> +    for directory in scan:
> +        filenames = subprocess.check_output(("git", "-C", directory, "ls-files", "recipes-*/**/*.patch", "recipes-*/**/*.diff"), universal_newlines=True).split()

FWIW, recipes- prefix is NOT enforced, it is derived from BBFILES 
variable in each layer.conf. (I have used layers where a typo was there, 
with recipe- or sometimes just recipes/). I am not saying we need to 
support those, but just merely raising this as a potential shortcoming.

Cheers,
Quentin

