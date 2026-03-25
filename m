Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D864109C047
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 17:00:50 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27867.1774458047132940579
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 10:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Cuf7Ty0i;
 spf=pass (domain: cherry.de, ip: 40.107.130.53, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vF0ke7OSad5NORwaaL2+t89nyPrOj0crnIkMnj31v9qZ0Egp2z4XE9dLLADnT3Iyps22p9RwXdFxO5p3DKp4GNZQ4D1Cgf531lIVolFB6OJ6LgBUd0SJp4dNsvZoGThuffBJeIdfSIrmHE/jjbHFVBAsujfH9U46piqXpmZ33ynJpwoh2EPaaOmxNiwx+x7Sh3MGT2CNtT776YliS38mFnCrzrjkhFt7+fkJ+bXWf5jYat8tTmFifeOXpFSy8J/Ht4AsTlrX6FARGkq0r8BswP1wMzpU8MzkYMOj2reM52PqMAKm2pXb8oqtZmTYQPvkFiCkD5w9MZX7aLbKYcu8QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPtO/DxMUwSAIH50/o8eDHRjJwknTKwo4wnJiTW2GFQ=;
 b=XVJyseY9Mjks1WGCiFFPX0b4lL/p5/J9WI0xyAWVG41ugUEpG2wP1Vk1XB/dtpA59vrzU57KQf/KeDVZFCts6vBnpvtl0kzUg1b2dEtZXwvCJoREd0JPtzoVG5jlYEY2GSEfxBPmTHfDa50WwmxrOBt19Tbi+mqRoK3+usC3qCzmeVQHSeGZbpA+++yZm8vqKwrNW2gISpaEYxMtlm7K3Ba7lErtueSsMWQcz+TJu8S8/2pjZhExwEVy3Vf7+CXAQZjnL2FWzrE0DX6v+77WtmwgCZgXkkn5GqLj/mC4T/UIOU28E97cA/ShFk/HJPa7jzGJOdKw5B5DYFcPd9LIaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UPtO/DxMUwSAIH50/o8eDHRjJwknTKwo4wnJiTW2GFQ=;
 b=Cuf7Ty0idxhd6k4KXa5PulEDBpHjtumm7XzvzZeTt9y+zHpO+SomZHj76iExSzjJold89IjOqlPq6gZuQLcljevP0hmGf8xNOsXqEXSnwh6rXbYwdXZuvFv5f6ZZWw3ab6UV3j1ZTxGgRiX0MfRKNDkHzLoiEtQ2IH8K67qbPe4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DUZPR04MB9726.eurprd04.prod.outlook.com (2603:10a6:10:4e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 17:00:42 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 17:00:42 +0000
Message-ID: <6864521c-ea84-48ba-ae36-c23ca6f68232@cherry.de>
Date: Wed, 25 Mar 2026 18:00:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mesa-tools-native: Add dependency on libdrm-native for
 panfront tools
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>
References: <20260325163842.2672762-1-khem.raj@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260325163842.2672762-1-khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0003.eurprd05.prod.outlook.com
 (2603:10a6:803:1::16) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DUZPR04MB9726:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f2d1d6-0b78-48cf-7dfc-08de8a900cab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|7053199007|22082099003;
X-Microsoft-Antispam-Message-Info: 
	/qYa/psw1dX5Y+b9IMjA/ewjNPx3F7H1OEVk0iw/Q0qh+C6C1+IwjGye/gF6F/g9hyws4NdPBckKka8yT4V+4X6xwv9f/cC9o9Qcq6crKtbpaXXwScxrIO1AFLO8GYxnnlYlReJ9It8fXm6sqltKG4j77Kd7WOl6we4XehufYUI8rrCHGzl06aNU6NBGdf/T2DYl8ZjNpAC/e1L5Zwuw0WxtWZhXhrPCMC5u3pfwx/ts9s2UngeiNIgTkKSRgs5rQFJRphu1rgV7X+Pg5ayNZvedhXY4o+BVCaD6SbuoS5ge2FIR3Os06B2U6tYKoozNW2Y+CcxcWToEq61Jwx2YjPIrYgp+tFAaZSzh4LnecI0gkgsWmedZHDyTvXL8kPvhWv74gv/yA2Xaqliu+F1Z2SjeWK2dkWDS93mmaVZKR4ojm473fSI2azMmCDPlbdAsg+uRQnYmon+7wIsnk4KxjdYvXfEKnZv6CKDW+yIgEBp4hAr82L20YZWS2aYGYxFWjmB+or6Efx+S+hDsebr0FxXaRjCcRjw+lQ6zPfYd4Zocpoyd5HQQJ35v+G6O7gMURu9IAddEQY3Cez/s6UqrNKY+zi0PBpBH8G1uKLpk32BiPi4yd3zN56Xekk8WZay3YfPYiv0PSMhvUHf6ZY7OGBwou8tG9tCm8JAmuEFyaicqbLrE3ihPjh5mCrv8RH2Qj770wPiLrbZLdoTEMLFXsLU+fV0450f4Edfg43ofszI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(7053199007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WGxKQ09GZ3JtQWdmOVJ3OFdsQTNxbDlvM0tiOWZRV2NSVlR5YnFKbElFMEFP?=
 =?utf-8?B?ZUFmdWFRTE9wWGkrUzM1UHllSUFMb2dYUDl6ak9taWpSdHlyS0FpMUhYaXZ3?=
 =?utf-8?B?dVZSSy9POGRLZzhlMGJQRnpMTllGVEJUNFpIWFlKU0dqRTFCR2VvdzF4WWVr?=
 =?utf-8?B?SGhXZ1hROXNGa2JoQ1hEekpDR1Fwak1YVEV5TmduQjFrZURCNDc0cnNFSTg1?=
 =?utf-8?B?VWt0KzgyYW10U0VmTkcwcnNyYy8zeHpiOU1wTHJCWHZqWm5wTUF3S0o5V01Y?=
 =?utf-8?B?bnM4MEVuS2U5TlFoNzY2dnBSZ3NSNzFTWDR5TGxXc2YweUdrVzRNZnNXM254?=
 =?utf-8?B?Zm15bGYreFFxaVB6dUdrUGR3UVF2dXppS2hBRCtOZDJFdFUwYVFNdG1EcExJ?=
 =?utf-8?B?V3cxamFVMkRKMlp5c3VZZDlHUGhrMW5ORE9EeFAxWThteXpwcEt2RS84R3Bi?=
 =?utf-8?B?andvRUdPZGhKVjVUN2dYMlpXbCtGMWlVYWxnS1k5aGVEQUZPK3hCV0U5K2Rz?=
 =?utf-8?B?RUFxakFyMUNWc0kzZHlHc2lsV09UQ1ZiWEZ0NkYxMFNHcU5zYnRMZGgzMXRY?=
 =?utf-8?B?bjJFNVg3Tjk1NE1xN2lrV09VRnNjSXpzVFg1cnY4dTNzaEIvVWtlN3gwWDBu?=
 =?utf-8?B?QzJDbnNLbW1vRnozRFB0Uy8zSExHMG9yRHBHMHZ5am9CY1RPbVR3aTNJZG0z?=
 =?utf-8?B?eG8zenlKM2dYWk0rTmVRMVhiMzA0azlmdWlGa2xYY2tTNzJ1SDhqKzI2Z2tJ?=
 =?utf-8?B?UEtzZ3N5YkszbXcvUDQxdk94OUdjRVhpdzUzbFlNNFVkVnR5KzQyOElwSS9E?=
 =?utf-8?B?bnNha29DSW1nNVV2NzJ6TmZkdUVNejdFc20zRk1XQVI4cEpGOHVZbUZkbUxl?=
 =?utf-8?B?L2gxemJMeUZMQisyRmxNa3FJZXpuSlNIR2p5UG5Ub1hRMHY5cnBqbUs2WGJm?=
 =?utf-8?B?cFhWM3FRN3NmWk5YMEU1R09IV1BXR1MzaUtKdXo4Y1B6NWZ4YVVmTy9iRHEv?=
 =?utf-8?B?TmhZWWlUNU4rcHNSYitOYWs3TFB0TXN3RzZ5c2I1TTAyMUFSRm04cWVnNG9S?=
 =?utf-8?B?eDlVMTVyOTN2MlZkb0svQm9mTHdyQzlzc2lvZUQ1UUxDdng3T0ZBZnRuY25K?=
 =?utf-8?B?MDkwVmkvb1BBblBCVkFTUkFyTk85Y014aTVjM3ROV2RTMkxGQUxvTGFwVjhu?=
 =?utf-8?B?WHREeHdCalR1d0wrbEtGWU8xWkRjaHJjOWRlUm4vOUN2eDB2ODF6UFVWYWpv?=
 =?utf-8?B?ODF4ekZtT1JZZXJZaU81SXpZOWNIRlY5bW5rUlpMSEcxVzR2UXNWK2N5SDJV?=
 =?utf-8?B?K0Rtb1dsbndyL2RtNDBJVzQwbERaZFBjOElDbXR4MS9TSmtZR1ZjMnVEVWtq?=
 =?utf-8?B?RG1reENRNGZHRERtR0gwdnZ0ZGg3elh6QXFjSzNXZ3JjNExkekJEeDBNMFRy?=
 =?utf-8?B?Z0hRNzl2MnhXaUw0d25sNkRoeXlHbS81bDV1VysyWGN2a2Y3Mk5lem00SU85?=
 =?utf-8?B?eHlzczQ5VStzQzNQMFdBQUovSUlQZk42VnREczhzejc1U1lKVG5zbXdlQ2tx?=
 =?utf-8?B?RklFRnZzQmUyUWM2dWtnUnNsTEtJamY1OUhUNUtkb2YwZXNmRTFjelRMRzR3?=
 =?utf-8?B?cC92bGcyUFBvczJCR2E1Y3Flb3hMcXFNWXJ1U0hVMWhmYkVhNjlBR1dlRFdp?=
 =?utf-8?B?YWQ5dUh0SjY1aW5JWE1RVjRXTHJ0ZzFBaFhkSitlV3AwSmtuaXMzRmF1S0ty?=
 =?utf-8?B?VkZsZEJrdzIrUUdNSVVmZFE4SzZmZUk1aDMvSzVoZ0NDZ2dsUHBKakU0VjBJ?=
 =?utf-8?B?K0poaXBDNTZDSHFmZXUzMFl5ZVNQVlNpUENUY1IvSUVDUTBtYXpwS2ZvZllQ?=
 =?utf-8?B?RzZ5bXdhUUE5em5xMFdQMGRVK1prNUdDYlZlUFVmVWVza0pidllqYzlaQVBS?=
 =?utf-8?B?cG9GTWFzSnJKTGpFM08rbUJIc3FydkdUc1NCdDN2VCtYSGZNbkUwQk5XVnNj?=
 =?utf-8?B?WVl2K0JCYU9VTmtnTVVXczFOVko0bG5Kd1MxZzQzNjdWUmJYaUdJeHMzVldS?=
 =?utf-8?B?K1ZXTVFNa2pFK25RdWNWdFAxV09ydUJTSHJlU1dGbDFIRDVhYU1EVGVMbGxn?=
 =?utf-8?B?Nm9ZWHU5bk14SUVmK1oxSnhKKzMvL3ZwMW1QLzhYTGRJeVh2VXh6NzFPZ010?=
 =?utf-8?B?RjZwTVBCL3hHYzlrQytlRlcvM1VDbEZJRmZpMzk4VVFLNFpnUHQvNURlL2pl?=
 =?utf-8?B?QUtSR2NrOXRXT244disxY21PdmFyT1c1L2dNUGtXWHNnWXAwWVFrMENsMUxz?=
 =?utf-8?B?dFRvSmQ2a1oxZlVaU0k5Z1dYZUVCS1ZnZ2RibXlqdFhCNkpBMDlSQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f2d1d6-0b78-48cf-7dfc-08de8a900cab
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 17:00:42.7027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ejJcVbhomkqkDy5DEQcjhHqEqCBoQiEm+sy+c3BGrywAsAauitWbGxzacRPueOvPipUqALFhRr43LeRFgjjfWideUHaj6ZIHRohO9DhEtgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9726
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 17:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233929

Hi Khem,

On 3/25/26 5:38 PM, Khem Raj wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> Fix do_compile failure:
> ../sources/mesa-26.0.1/src/panfrost/lib/kmod/pan_kmod.c:7:10: fatal error: xf86drm.h: No such file or directory
> 

Hold on a second. In v1 you patched mesa-tools-native and I based the 
whole discussion on that but the error message is actually about target 
mesa? You also said in v1 you're building mesa-gl so the error message 
is also not related. The commit title also is wrong now as you're 
changing mesa.inc.

What's actually going on. How do I reproduce? Also mesa-26.0.1 may be 
**before** mesa-tools-native was even introduced.

The gallium PACKAGECONFIG should bring this dependency in. If vulkan is 
selected, libdrm will be a required dependency and it should fail the 
build if we don't find it and try to build Vulkan panfrost (panvk). I'm 
suspecting we need to add libdrm to vulkan PACKAGECONFIG but maybe it's 
not required for *all* drivers (though all vulkan drivers currently in 
mesa do seem to require it for some shared/static libs so maybe that's 
fine there).

So we would only be missing this dependency for the panfrost (possibly 
others) tools. Then, this needs to be put in TOOLS_DEPS like I suggested 
in v1.

> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>   meta/recipes-graphics/mesa/mesa.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index a95adfc960..ecd3b3780e 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -111,7 +111,7 @@ PACKAGECONFIG[imagination] = "-Dimagination-srv=true,-Dimagination-srv=false"
>   PACKAGECONFIG[intel] = ""
>   PACKAGECONFIG[lima] = ""
>   PACKAGECONFIG[nouveau] = ""
> -PACKAGECONFIG[panfrost] = ""
> +PACKAGECONFIG[panfrost] = ",,libdrm-native"

Also, I'm pretty sure it should be libdrm and not libdrm-native, as 
what's gonna happen when a user requests building the tools for a target 
package? It needs to be the same architecture as the one you're building 
for, hence not forced to native.

Cheers,
Quentin

