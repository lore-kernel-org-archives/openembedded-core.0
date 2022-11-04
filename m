Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBEFC433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 14:08:01 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.61])
 by mx.groups.io with SMTP id smtpd.web09.11564.1667570873312521215
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Nov 2022 07:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=eC04eTPy;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.105.61, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNbCyXAelbeNBcNKKE2dGzBmJv5jA3l6HdYrabMoq4WmabKKCj2FmN3wWwtPDVovlMkU32hmgRhrcifX5Z6XbZ0OZ1xk/AM36kN/cAJUUmiPpkih2al1MfFydjKUObXvR9ba+a0pocmMHuhnDOfZFtaSmtM27eLMjP/yAlSdg0ZbHRKeTd1Hfy8Uo5PS4f5jfoz89GxHeNVz+PdMTwQ6P4pQPejBv5ZcvnHvmxpTz29pDzQc4quve/NvopW/9pcgcZTkYjXkG/Wo0eOLI9XGyiusiufHwD3/b2SulVffDgwVu3ystnTXpdiiqcmhp4RAIwtC6LMXrOIx6my8SoOX2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyXLe7Mgh0vEI+uXt4HLWtXyjDq6qR9xcgFVsY61LFs=;
 b=LjgoyKb9GAU1DNebxsCbRhC5V+ScKIRCTshcctpa7/mTTp8rEmjxdnJsIdtzQOsLuQZ+TMaFO2E9fYqRUbidwNgs2ob9dG1uWMRWp4Y8ZXMYmH+rxWOyawIMegR1j0UMiuQ6It+iKFLS+eYQVsn8sLpiQrwFxf2hrfDrWIPrAgacQWdmQB7K/LziltiZlNqwT9Wt1UUPQfoDQ+7cTHhpXw01oXvK12gNP2QuPx/PSqLrYy/qjdrPSN5Txw92bhoHzYp9S+E3XeEw57ZFsq4/3gZnSyshe/pYUvnsqMQf1oZN/RiGhhdR6lgqDle5Tw09Hng9EbdCSWZy5IUOfeU+tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyXLe7Mgh0vEI+uXt4HLWtXyjDq6qR9xcgFVsY61LFs=;
 b=eC04eTPy2OdnBCvZlW3Gl9rAc4Wqcg5MDf5BOH1Z3iOlDyxVAz9xCPcxn8gHGOvQMXtFQaHDkuOSqcj29UT5n63osNmFGw3ubBv4JH8Q40U1yUfU+qJiH04xaccsRwCXPGOTt0A/IwQqrjNsWMjmDgPJ8gVi21jukticJQeGI8SgwGfxOe+nU5m8T6tFcBhEK5Bjk8+iGC0eozAKAHU0oAJemSQK0v6EsPLdeEKcWy2kCYyJsohJaBHydwUW+D53d50/i/qsFulv+ymtQKK7N9NIJqt7o4pdsiNBclm99JzV70DfDj/jzBK7xvtuHDPNgK1Ro0MSrXat5C+TUG7iLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by PAXPR04MB8704.eurprd04.prod.outlook.com (2603:10a6:102:21f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 4 Nov
 2022 14:07:49 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::5e5e:1989:e5ec:c833%3]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 14:07:49 +0000
Message-ID: <d682bdd7-ba1f-8708-fb64-6ae29b2ac074@theobroma-systems.com>
Date: Fri, 4 Nov 2022 15:07:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [OE-core] How to use linux-firmware to install single firmware
 package? #kirkstone
Content-Language: en-US
To: Livius <egyszeregy@freemail.hu>, openembedded-core@lists.openembedded.org
References: <3ac2df35-d9be-5b2d-1576-38ba5a712d56@theobroma-systems.com>
 <17126.1667565726738758884@lists.openembedded.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <17126.1667565726738758884@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0077.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::22) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|PAXPR04MB8704:EE_
X-MS-Office365-Filtering-Correlation-Id: a4476a22-dbdb-4305-e1d3-08dabe6df486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kYQkOl66iz1fnG9tolN0iIJziXKgc6C79q2zF+spkXdvX9mYx5NdG6yHiZHzE6cmlh6X6flY9+mipAiEeQmCgZ5e/MsSMUfBdrIRTJpFUCwtQf0MZyBvkJQybkgGeRh4JuDORY0JXGtYoueMTufv1ueQBK42QkeVPZb8hZ9/JkdoQ4HSVlKsE2G84ooKnSfDsFMREov4pZEEdJzH2sGTm5mMmkfSryfFJkV8zEJzfnes3KzTiIf8SA9r7apLMBsHke3xWSnXO7z3IFQFUl7KnZ1ri1mru71GedrMTcdC2tvWvSPXvPKOetuSlzZelMTK0LP8BabJ7zpxAVFq/+npWOFiIw/N2utaSb3xtlFwvY3G998nN+fieg7aHcvQwMIFgrnbWZI0SDcFg6TujTQruMpck24ekiiVz10NVu/FoCWki6UVWnocyM/ji7bllJzlUDaL5T0snMmMPYM/mhDcvtUK6WgyDEe8Rv3Gw91fStipg3/IpVz6rCsvEmcPuUAYWy7rqWvYecOYc+b5lqGn3v31wD0iZDuEInvNcowo2HMuDK4gzX/harLeTluCeqloQXEQLALBCYABwOyB3eD+xhPP+gfLA0PzEPatrNt7OVWZPpqaivf1/fy23aVPrBRTI/uqCjG7cm2EeI+XpNS5nTPgSQnjRsd32IHYU4TzGjZAKUg5TQNGl+MLbl+VXJN1gJdH9tyXy+SD35Mz7SusYMLZ3TuPnpv81BlTM9dfzPo7zPtrY3jJ/cI7c5zOsnxxf9gcgQJr3GsHumEq2F/819kcvC5v4jwpzeBsT8v7FMo802cibF4m7UVech6UemYt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(366004)(136003)(39850400004)(376002)(451199015)(186003)(966005)(31686004)(38100700002)(478600001)(6486002)(44832011)(86362001)(6506007)(36756003)(66946007)(2906002)(2616005)(5660300002)(8676002)(8936002)(6512007)(41300700001)(316002)(66476007)(31696002)(53546011)(26005)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OGZ6SkR6N2JSUkNDK2xYZ3VXcVM1NVdCSDFOOG8ycFBldXJSOFFuSzFmOFVV?=
 =?utf-8?B?cElRVklXbEZscVRnN0xsSE1jYVBjdVdKTThpZDlHTU1wakRqa2tqVkw0Uy83?=
 =?utf-8?B?Qi9hYmRwM0o4bVhkSlNpNUt3UmlwSmkzRFkwaUFUT2Qwb2NRNmNjNkZ6L0sz?=
 =?utf-8?B?REQzVUVMcnE4cFVUN0tMQjNFS3dhMVV1OTFwQ3RoaVIvSTlkTW1ld1ErWjhs?=
 =?utf-8?B?MnFjd0hYcWdxQkNuNTlrbzFZeEllNEp5ekoweEJGQ2lacjk1eTdZRzlkTUdZ?=
 =?utf-8?B?SmNlSTZqNWtBTHBXelBYeHoraFFwMXhxMWRQTkMwd0FVaWtDWS9JWnFlbHV0?=
 =?utf-8?B?N2sxTVN0eG81bVg1aXNkN01rNXp1WXNONXhvVWdVTXRyei9hTHJFTGVaY0s3?=
 =?utf-8?B?VVJMRTAyaU5lbnA0YzBucVFuL213aHJxTDhXSVZmZlJ2Wk5iMnlIZFJVQWMr?=
 =?utf-8?B?UkNYdGVjemNYTHdKd2dKdituejBKcWFUcXVnNUM5RCsrcDI5UDFJSUhaWlBG?=
 =?utf-8?B?V25BZ2ZDZHRYcmxiUlVoWmZqZG9vN1NnaEVCTlpIektIenJVUFJHbWJka3VT?=
 =?utf-8?B?UVU2UkE5a1lrQmJlcEZpVHdtblZNQm1NV2JTcXJJVVp5QzZHWGRvdlNGdHI2?=
 =?utf-8?B?dnJ2UGNRUWtRTlBiS3JhVHlNelk2Qnl5MXVXNkdnWWJiWHJCeXZkUmFsUEp6?=
 =?utf-8?B?eHNxeEhHYm9RRVZ4VTg3NFhpc3lML09NZnhieGUvSnlrYkFDVk1pWHVXYXdw?=
 =?utf-8?B?QndxRFFNNFNrdm4zYWI1WUhEYm9ZckUwdFRSVnpTUFE0RmMwWS9mVVhUQzhq?=
 =?utf-8?B?NjRQY2s3Z2xKaXpxaHZuK2luM005cGhlVWhUbkFtSExoWGdYZXhHNjQrM1ov?=
 =?utf-8?B?ckd6WUxlNWgwR1F3akRVNUJMWjkrNmRHVmxvY3BFOFR1bGFyekVIbitTa29x?=
 =?utf-8?B?cEhPR0plV1ZFdjBUWnI3Q3k4ay96VmhCV25XMzBTbFJLaVNDSGRyVllJYS9E?=
 =?utf-8?B?NS85VVQ4V2JHcUJLTjVjcTdwS1RzK2xyaG9xVitNU3lWbDNXbUU5NTdDRmx4?=
 =?utf-8?B?K2tpVnNROTBuMEFFak5UbFlFTVAxWFhlb3pocTY3bFVxUm01M0xGQ0xvNjlI?=
 =?utf-8?B?dzRBZ0ZHdThHVGw5M2xnQk5BcUh0TDFIQmJvVUJSaURiTU8zY1VENXNuUElD?=
 =?utf-8?B?MkYwdmRqaURMNnVCcHU5OFgvSEY2c3JQUXpPU09RL3Fpc2ZBNlZMbHkwU0VI?=
 =?utf-8?B?WnhmTWxDcFErUXoxc1h4VTFhenpxTlJtaFltWmdQY0QzYU1rWllQZG80WSt5?=
 =?utf-8?B?VjdUVTBWc090ejNPUDNNbHp0UEpDSTF4d0FLRGJkN1Z2b1dFZEpzR0xTcXZn?=
 =?utf-8?B?NHZtR1hTeDJZN3dkUHVmWU81ZCtXNmU0UnVHamJVak1JdFEvYWdEZkR5MStS?=
 =?utf-8?B?TDNMYUlIM0hqUXF6ZU5qUjFoK1FTQlNMSU81Nm5YOWRqZkVkZFVaQndBTjcy?=
 =?utf-8?B?TUJ2bmFNU1EyYVF4OUFwNjlYQS9jaFRQOXVjdzVlUkNxVG5HdWNkaWkwa2Y5?=
 =?utf-8?B?UVJFbzZzRmxKcTE4N0ZPTTdQOHpCWnloZC9YcVpGdVVYY3kvV2RJK3EvSnJ4?=
 =?utf-8?B?UEdtSnR6blFzYktkdnVYeUQycUVEdnpLKzRHeUs4SWFIc21rcXpjazRZQUJk?=
 =?utf-8?B?aGpPSVA1UW8zTFUrMUVIQlMvQThlbXZhUEJEMzNYQS8zaEJUSjNSVEdua2Nv?=
 =?utf-8?B?YWNacjl4a0JXbjNYeE9pYXhucU85cHFBbVVJTVlNaTRYdXRNQ2dJZkkrbWFo?=
 =?utf-8?B?d0J1RFBCYmw0N0lOU01NRHEvWUNjMDVMMjlDK3dhZTVwSVVWSTM2QVp6WWY3?=
 =?utf-8?B?NmhuUlFJMmxCZW9scTRHTjNSUVMrV0J6RmlzUWVMSm1uYW5KeEdLNkZFWndJ?=
 =?utf-8?B?S2JEc2k1NnZwdWxrVG0xbmZPMVpQdDVCMXp0QnpJYUQ3cGV6ZHpLWlovaUo5?=
 =?utf-8?B?a21GMVNwNndPY3R0NDM4dU15N2grUk9BSFRyWGxURDJMK3RjTDJHcEtDQVFh?=
 =?utf-8?B?NWM0aXZML2ZDVDZqeDlMaWtoUkF4Q1J2amE4NGt2Wm9DSXlCakhvVjBhRUMx?=
 =?utf-8?B?OGFqd2RqcVhjMmZzeUZ0LzhHeEhGQjE4RUtTeExWZTZzeHA0MTZSdTFoQU5o?=
 =?utf-8?Q?pqICg+PxOW69ZGPtV3xyLBY=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4476a22-dbdb-4305-e1d3-08dabe6df486
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 14:07:49.1715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1aq3cVzVzSY8UnPvOFpwPoSZDZ4pi0etK1sV2MRloRvctvzhqj7QTwe++AfG/3cpZiqCdim4KOom7q78ldbSLxa1XmQA2dPaczZ4pQhC21IwVPzksaec+fRMe69Rv6u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8704
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 14:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172712

Hi Livius,

On 11/4/22 13:42, Livius wrote:
> In my tmp/deploy/rpm/noarch folder i can see many-many other firmware .rpm files like linux-firmware-bcm43xx, linux-firmware-nvidia-tegra and so on, these were not planed to be installed. It seems to me, the full linux-firmware package was deployed somehow.

Yes, that's normal. When a recipe is built, all its packages are created 
and put into that directory. It's not because the package is created 
that it's installed in the final rootfs.

 > I think i am using poky now, this is my path for linux-firmware: 
PROJECT/sources/poky/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
> 
> So, my poky come from git.yoctoproject.org ( https://urldefense.com/v3/__https://git.yoctoproject.org/poky/log/?h=kirkstone__;!!OOPJP91ZZw!iE35Nh5nRc3nFT6cCWMcIbXJsRTSva3-k0ELYN7qrnPobvaTVmufMXyu6PTsr_2phXtEqT4WAHAyDmU3tfm0A0o7KOuVycOZZMX2Wg$  ) , i use latest kirkstone commit ( https://urldefense.com/v3/__https://git.yoctoproject.org/poky/commit/?h=kirkstone&id=2e79b199114b25d81bfaa029ccfb17676946d20d__;!!OOPJP91ZZw!iE35Nh5nRc3nFT6cCWMcIbXJsRTSva3-k0ELYN7qrnPobvaTVmufMXyu6PTsr_2phXtEqT4WAHAyDmU3tfm0A0o7KOuVycMxLdUTqg$  ).
> 

And there's no bbappend for linux-firmware anywhere?
Run:
bitbake-layers show-appends linux-firmware

> In pn-buildlist and task-depends.dot i can see only linux-firmware, i have no any listed single package like should be linux-firmware-imx-sdma-imx7d.
> 

Mmm indeed, less helpful than I had imagined. I think you can figure out 
which packages are installed by adding INHERIT += "buildhistory". It 
should create an installed-packages.txt file after a build.

Cheers,
Quentin

