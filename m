Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F28AC433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 08:05:37 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.56])
 by mx.groups.io with SMTP id smtpd.web08.5089.1634717135776486012
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 01:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=IfVqI/Hq;
 spf=pass (domain: outlook.com, ip: 40.92.73.56,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1eZ8QrwX0OAeJGvitmoOkei/UwPezfPBjeBXfIJ/t8ls1FyBeVCcbRmZIEJzlEAOMNPpJvy1YxvSLMVCX2YAskc7X0ec/iv/159ySye9VyOAh0ebgozib6C5UT6oDFa4taqQPHnjiIjBdc/Z1pf1HuIV1okWVTeNhVjI+IM5YrrMZ7l5u2vn3lEpOr0Hwv1e32IWCl5TF7nLxLJFggASfk79r62waeT+t4VVDy4LuxnEJHwxc0r9toxLU9XrvZYzksJ0U7Jb+QfyVGr9JRlbG6L0xEJ+0Gj9Eu425PCtxrqFf7wKlJhcchGmKlhshhJQDciNmSa8p0cDmR4D7ZsMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZST6jJrto4BLJFCqohGmmtVmMLD+ouQJ+lDEw0+4E8=;
 b=Z19Y1w97dYMR3in4f13GlQmCfwBDF7aB8FG+pLaqqCqXKG4nMAwNFENRHyOg5iSpgTiVOGnRnKcbwtpTU4Km63b6/RQHXCGAbRSQBoiktx0DYR6/VITNhgj7JmGbaL47P99X3pK8+LwLfowBXH+/GePEPcu8gksymnZgxjvi9G0nDXcwszFu1jrinqt3ddhNm4TOrz4Ke/NAHV7UJ1NriCbEhVhUU51pmku/PYIF10+0zn5Hivp1/V/emhtcFvHlTgswU/g/UCtMMPSGXHDqx1kXU+elH6E3CoplMhl7KejgwQPjhPdW1h7+6vdbiGAOMjtEyIjtof1Se5IkF3bMJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZST6jJrto4BLJFCqohGmmtVmMLD+ouQJ+lDEw0+4E8=;
 b=IfVqI/HqM5kD/e4iQAxbhMS1fvgjfAhgacoE7Eb0GfBnKJIV2QzqdHT6CGvlOET8sS7f4vUM7VkZ7gifK727rSdiHPhNH4wBYnSQOwFAiYs7pPcY8Cxdu2dVk2WL5risv3pfxDs4PuvHfSRvESEeXsG92DSsv1Ncu50wY4/+W9f5jk4dYdCCbG2QKyAvEH/g2yTj+5jQ6AtlgCeq6Snx1sxfhG1wxsNvqgJYEx6Or54GB/IkAu2LWFXp2oPI+r5Ue5CT5HtDmbfmT93YHhzwUwhufHK6Ooaoju3h+9OOM9CmRJHDYzR8+RZ0IhVKkCHJjQx5TLFQa+kFY5fKUhLuQg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM4PR0902MB1825.eurprd09.prod.outlook.com (2603:10a6:200:95::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Wed, 20 Oct
 2021 08:05:33 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%4]) with mapi id 15.20.4628.016; Wed, 20 Oct 2021
 08:05:33 +0000
Subject: Re: [OE-core] [PATCH 2/2] npm: Remove unnecessary configs argument
 from npm run command
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
 openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20211020074015.860-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20211020074015.860-2-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB464242B99A9E63DF51AB7701A8BE9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 20 Oct 2021 10:05:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211020074015.860-2-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [MIpqc5fbaP6uZpx8Vk7c2lQkZoDdjAVANKi9E7fWN/Q7hQkssPgjP/ideMXJpb03]
X-ClientProxiedBy: AM6P191CA0106.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8a::47) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <afe64bd6-4007-7da0-8d17-f8c5c55a6b42@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM6P191CA0106.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::47) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Wed, 20 Oct 2021 08:05:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e54e385-f060-437e-cd63-08d993a063cf
X-MS-TrafficTypeDiagnostic: AM4PR0902MB1825:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u33jUbgi01tDFWQMd23CJESXhsjU09+7lg5Z/Z4Ht3kzUQJjHZH6U41+wDyJ9F1XwqmI89lgJ2dTJ5SyPyC/GszHbJxNeH19JPokKf5QSxos778aif4Rec9WlEYERadrYfnfE1faIcjZgTNxKy4upPr20TnCQQXF6vDQQN1nzpTRJn2Ucjpxnbsffou9qW2XaUXxhya5YcoMMWT5A6H1ca6y4vwWVwLSa9n7nOx7DqyrcLkMvRE5wI/LDuF905ziR4L7DFBCkzoap7BmPOoGyKMaO0tpxsKoj4OaRhcxtYUPqJF7igXzw5tV6LSIdTZs9U+K97tr4Ygm9K1GiwS0kaY7Ow6uKj+I6Ajg5r1tAKxu2sFJFZvfrVbo3xKbis+wclMjAUPfc0xJHwmqQTKvVrOBQdJYz88PiaXl42blqAMsZtF6mbz2WgvWWj60MFEufdPxcb2+yNZh8PLm7u+zp72trsS/6ZJApuEnD1pPnDsHqbZLMiPRdU7GXd3ro1d9DZBHmmzjG/8f5LUZzcGzZM+ogJeWs+cUse9rUS9yKRjsiaDoQIhcnB74BOKEZFEoNyWjHGumbbcfhW8LC51vdSsC/5m9VvvD84rftk5THd082whpThy80BD3ZHCEIMDj
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4jxnheeOvCQqg3q3NPhmNiDrMTx0jMT51NsFgGNJyoW9DJUaIGq7L313ESKE1RerluhtVhGu0BXXzuX9+e0+NxTe+rI/nFvMy5tj+gGwlrb0JU9BK454cILwRdnB/IsrFr7eoZghAlhR99l0xTkDgDIejdm2ss6QbAKY5ILuhRtdcKEfX7fed3FuEXq924mX5WxOVFYhJi71HD51Q3nuaw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7e54e385-f060-437e-cd63-08d993a063cf
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 08:05:33.2560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0902MB1825
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Oct 2021 08:05:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157253

Jutst out of interest, why is this unnecessary?
That might be worth an explanation as part of the commit message, esp as 
I think the assignments to 'configs' are still part of the class and now 
being unused

On 20.10.21 09:40, Stefan Herbrechtsmeier wrote:
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> 
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> ---
> 
>   meta/classes/npm.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
> index 547c531883..ba50fcac20 100644
> --- a/meta/classes/npm.bbclass
> +++ b/meta/classes/npm.bbclass
> @@ -259,7 +259,7 @@ python npm_do_compile() {
>           # Pack and install the main package
>           tarball = npm_pack(env, d.getVar("NPM_PACKAGE"), tmpdir)
>           cmd = "npm install %s %s" % (shlex.quote(tarball), d.getVar("EXTRA_OENPM"))
> -        env.run(cmd, args=args, configs=configs)
> +        env.run(cmd, args=args)
>   }
>   
>   npm_do_install() {
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157251): https://lists.openembedded.org/g/openembedded-core/message/157251
> Mute This Topic: https://lists.openembedded.org/mt/86459810/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

