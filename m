Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056CFC433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:45:59 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.95])
 by mx.groups.io with SMTP id smtpd.web08.5904.1633679157477161860
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=EX3Px81O;
 spf=pass (domain: outlook.com, ip: 40.92.74.95,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5ykrgDTEfkMc1Utj/xOr+45r1klCWEg1otM2PKUAcK4rK957cLN/GwyMPhgqXimBQghXfFiyKGr3SPWR6uVq4HAXIoLau22LZNdq/nqHZ6+54ehgmIgv55Mbf8Whr7rHCCRZZUUVGJ26YFLRZ7YGl3t4N7pO9ohNiiupyngn06SBP9wAAY8Zyn+xAAOTR5gDnv15fzpoXjIRzkZGwntpKtABOT/0IrUNrP69JoCaoMnuOnbGFaIbOe/PZjn/HQ4og7RakSRBLr3YSUEzp3131w7RqyoqTuBR6vPMWaukquOt6oIdo+jClDGeAFpteeXWcYZTkGf4yD3DaAzQsL4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcjUpV+TiEmAVwKPGEnHrW4JBIwzLDflrpgMJBhf+P8=;
 b=l4h+DLfXgjUr8s+IDZ6Njj5KBGAa6Fdb6etKEpcYKAlmFOhn2xUcN+L4+mTHWpUzqbsivcMyr1TRbK942w3QInuZuWT53+wCql9K/Ua7KXYpdCf/Nib0dQtSzGIjWQVUNstmgNtE+ujnbObRKd/cWXqaJKG+HY8NLGQ8pt0oc1Noy8so/4njAMhbj2m9Yz50+IIapGVtnUZ1QpYqYv0sjP+Wn0QKNSMzlkrJbQbLzt9ypAfbWc909lWOimT5XNUe+QeKQ0obDf9pgXf0QNj6VT7eO5MJ/YUv0k4naCci/QXqxWK+5ivs8NztcmVx1sD3eChf45us3v24AbToTjChnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcjUpV+TiEmAVwKPGEnHrW4JBIwzLDflrpgMJBhf+P8=;
 b=EX3Px81OKW3+DP5tp9jmLuku6l8haT1mBYv5J5HVydreZFwOv+UECiY94vJ6UYe101RI1D/wiKJ1LPy+fyiSQrMBCg+8NU+NxqTYn5mh9jYpj5MO08PwMoXYFQMrpaEjtzTzrF0H7wUuhUHyz8grmBKSXPtq5ADZgFOSmiaYyqzQ9OFwbcnmQMpt3br/Kc4VbHqyY1MNT1HExLPBLKCgPg4x7Zh0bzJ3DSvt0Uv5LVO9H6reppgnMXWMXzYa5n6N/W5Dvf6RoR1H4rtGpvhHWaTn7MUW3XbRLIWIV00SGs82pZkWRzKwaBTr6dAjS7p8Kln94PvDub7epFwqNR+FRw==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2529.eurprd09.prod.outlook.com (2603:10a6:208:dc::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 07:45:55 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%4]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:45:55 +0000
Subject: Re: [OE-core] [PATCH 03/12] recipetool: Skip common source files in
 guess_license
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
 openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20211008074228.8635-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20211008074228.8635-3-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642A1F4033A48A1FF7EC20CA8B29@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Fri, 8 Oct 2021 09:45:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: 
 <20211008074228.8635-3-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [vDri9bYN/JLs7J90E0w7UOTkzkhCChW+SvuFc8h6jrSXCuxCooTTw7hsaShSeSem]
X-ClientProxiedBy: AS8PR04CA0209.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::34) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <893cd023-b024-2ac7-3727-8abd4ad3a543@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AS8PR04CA0209.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Fri, 8 Oct 2021 07:45:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6c0086f-ab0f-4cef-f87e-08d98a2fa8c6
X-MS-TrafficTypeDiagnostic: AM0PR09MB2529:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tjlKncX5U5eYUIYwEFFPyXF2K75Q0W/mrHIAz64twZYpOSUk6mtUtZn7imam1m1VKCTiHWI5q+Yqm3vuBOp4kCeFT8io4O5fWmpfSSugLBOHQIp+6b2JIlCPOHItIfS+wBeLVi3nSpa0Jn6DGdIVEYNsEJcqac+qX+am+GGmG9W3EIcpoQvGk71HGC7ssYVBXwBO2t28lL+YTDRZAkWTS1qjNCAAljS7QraiuTJnmwkLuIJQWF4dXpydxe00OIVZ/aOBUpCn43DInCDev7HV24Q8F3zlxPE6fHtMnd4YvjCwxTSY5+H3mtbmgj7um3n5OU9hR8RgQmJ+VNgKMTeaL4S90w94/psQH+++uekE7BYQH9izk7cHUrml56tENqmqzJcW3h/A/xSfmCpvWOacv9eKYxLB/VIn953m3tMT+slqGFG1Hx9mKI/uNfBSuVSEUNAs+/FAsR88YFTU8Ogk2+yZfjpKBO2s39VzEqIL4ezLkgpM2bbQjYsD7QKVoVhzXkjdFnmEtCgNAErdE9rgFg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sdX/ERx9sek4S5PXq2fh59/uceXO1MYP+lyyizZmp7tVmNhfyOlyFH1CZnE1l5q6LlY3jzFuB7cRb3dY53L1KM7gdbrKOB0aJoIZuR3mQfoJwMIju3LuHVXWfMBkQHwY1GiiH+szGjkAIXPFZ5+1YQs4l0GEBo5begUe6GsrR6ycl2jOVvFBjeU/bSAQ8GBKV/GZajWfsOZbrQOxiN9SJg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c6c0086f-ab0f-4cef-f87e-08d98a2fa8c6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:45:55.5835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2529
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:45:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156757



On 08.10.21 09:42, Stefan Herbrechtsmeier wrote:
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> 
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> ---
> 
> (no changes since v1)
> 
>   scripts/lib/recipetool/create.py | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
> index e88a4253da..83cf25d9b7 100644
> --- a/scripts/lib/recipetool/create.py
> +++ b/scripts/lib/recipetool/create.py
> @@ -1114,6 +1114,8 @@ def guess_license(srctree, d):
>       licfiles = []
>       for root, dirs, files in os.walk(srctree):
>           for fn in files:
> +            if fn.endswith(".html") or fn.endswith(".js") or fn.endswith(".json") or fn.endswith(".svg") or fn.endswith(".ts"):

Why not

_, _ext = os.path.splitext(fn)
if _ext in [".html", ".js", ".json", ".svg", ".ts"]:

?

to me that would be easier to read and maintain than this ever growing 
or clause construction

> +                continue
>               for spec in licspecs:
>                   if fnmatch.fnmatch(fn, spec):
>                       fullpath = os.path.join(root, fn)
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156745): https://lists.openembedded.org/g/openembedded-core/message/156745
> Mute This Topic: https://lists.openembedded.org/mt/86165223/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

