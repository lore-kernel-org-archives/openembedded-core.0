Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714B9C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 10:56:10 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.76])
 by mx.groups.io with SMTP id smtpd.web11.10563.1635245768172248881
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 03:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=Go0Gk2VN;
 spf=pass (domain: outlook.com, ip: 40.92.75.76,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpPQt2ODRhNeT32uU6ksUdp8b8jHbGHskZ8rTMnObp7IlCZP3j4rcew8OKeCo47xG08Qa2pqNO5AoDDs240TFiHWI8fAmT8iYTH6+NeUiI93kqZJuMJLe56BzwLVA3jYNbNILcMMFxEQFxWiLLHDeH2mp4WcfO0BewiuwQ62WPHsYdvRlwRa6hY2bmvjhEMltdse1UlzjRPMLm4sXPZ0/m/WxVDP2BhbDXyr6Bs6NkghZ9Gdl+diwVwHhdTkk80ZTtJqYIR/EiAPGcbrW9o5PeKkNFTGeskD5EzhInT/G0M4FvmwG1zanj4FZFh+iUf3IllsbTRP4XOoxdG68lwEDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9yb9iMuRtek9R/NnMCM7Tt4BR2m1FfXItZp+kplAm4=;
 b=dh7x9iSCv/nkRrqoa48F839eJrDXs2COM1pBbseEDc6ecQyew1f+5/0tcVUosH2xstV7t9bbm43nPbDZV/BLqdzkM+Hz0aaR8fwDya0wZvRkYhKbdcF0424J+csXXtk5yEBXfmHhfE/veekzIK6Fn24uAFqmwEi3a6ulrvoHglclmk2uvbOQCj7RQHXy3KdfGC8KHaJ0aC3LIcQcGO6Cux3PipGitMX+b5Z0SgJjhjb/Z/RJ4H+Ic9GaCNyfh06IBOlxK5PiHDCZODyJ6690d8kCcALpgDRiRhDLJQuIbWOOnliRUqjLJmGy2U4uugUkiiIjAk7SomItE/usSc/6zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9yb9iMuRtek9R/NnMCM7Tt4BR2m1FfXItZp+kplAm4=;
 b=Go0Gk2VNLEeqetz2y4jdFlCoVw0N5Tg2YDnXIIrKFtrxcf8efGaKZLVapG2doH+JBHHCbT9Ix2vHNqBcc1r5V2xn9UrY1gIr2yXE2u+/i/lncPl9bynd/6Df7jLfxNlfjQUQyPRAw+fMR6geFSpiRZfd029VLgvb2SznNty8/qi+L7+nwlWBByevezp1xqvkTAPikZw5nG29Wtlx9a6k20LSmnnepXVlvR3deO2Oe2lbg207DR2leFdC/lNemeSVZpsbzrCeDQpLnBUJgtbGB6qcVqxfjlLAOyaNtgN2BlU38Q+klvZGNpNR4HWgZO6qvuPLym6zniS4/Ush53J3fQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB3891.eurprd09.prod.outlook.com (2603:10a6:208:19c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 10:56:05 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%4]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 10:56:05 +0000
Subject: Re: [OE-core] [PATCH v6 2/2] core-image.bbclass: add default
 IMAGE_QA_PROHIBIT_PATHS variable
To: Martyn Welch <martyn.welch@collabora.com>,
 openembedded-core@lists.openembedded.org
References: 
 <06387e0dd040237457de963fd13ff3db3e02be61.1635240032.git.martyn.welch@collabora.com>
 <e1285a97073645957532749c71d2de3a02310198.1635240032.git.martyn.welch@collabora.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB46423424A75EE5AF6AE482C5A8849@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Tue, 26 Oct 2021 12:56:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: 
 <e1285a97073645957532749c71d2de3a02310198.1635240032.git.martyn.welch@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [RaVg/wdb86bXwvgwKjTw2jPQLyCdgd5xyRRywuO/dmWpq1w0iag2yLpFP8yjGiJ0]
X-ClientProxiedBy: AM0PR10CA0060.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::40) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <df69f661-1188-2130-0f0e-75d8911772d2@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM0PR10CA0060.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Tue, 26 Oct 2021 10:56:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e6e75dc-44af-4388-87ac-08d9986f3579
X-MS-TrafficTypeDiagnostic: AM0PR09MB3891:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xG9SrksfaEmPiT3JXWutLrGY+eMJWqrPZh1HE2xQg05At+pzI7dSUVC5DW424nzy+fRad93siwoW7pc4kucs85g24vjhrxwjrEwaJaF0CbaZ/ew242jriv9xOXcCE5tGHblnbMh00RqyZqU1o+MPetd7XhFmxyBnQTVJbKpg4T6XVMcANcjtHHx4ltDlJwJ2f5v0QJTlu3U30e7P3cQZAY+ditZPBBnkfYYdKP/UF3tck1l4pl6vjpkMXSBSjvLTMU+QTCmtSKgpQzihG1as0gKaABJEY4svEYTwZ+vUcNeOf6YH/+OltVl2XA65Vvv37OSuV75OOU90wGDZMzU9+luFJ2PcHzn6UWdNt/937xh7jXI1EAEkGA/bOwZTuxDesoBMad6gceDY2DWHn23JqlTdDODHWr32nJvjtZUqHIp2Ad+tA6W5t/831Bv7WGfVOgy2y0JI9Sf+1KuwZR5XiWCvWgwvoLkZhGWynWqbOQp1ymyLGW4vbS6adrYpKT6flDs9vdsKsbYTZgFG4cbSAlS4+GePc1sVacWyEMO+DRV7rnh0uCG5J+wXEfKuRDLRgVGGH7NUmarpnJjUpfcGnDLXE9rUR2SsW0D1ufPl04erDS3FVMpxxnob6K3EOLcg
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	skGGvRHfCB68UCLuQ54PXLqN/OLADbw9Sfxpb7hbGRDmqvQbLfXS6yH5uslIYddXUDc+ncelYD+95DieYMiBte8/ACqw8g4o2NR+FLBR2IGtVmLAGsDQnoghqgcOg0HUcAPFKG3csh4JFTnEfFbkYCi6llvQa7mHOgLSIU9f7U67iOM6OPavdB86aZEbDWsLaAk6IvOBv0PKSjTRErNee+FRc/0UxI/mn0uMS3ux3aTsCXsEM5HZ+ZskSjb84r5tqBSWSlq6z2cT43xJOHKuamm8zljo6LtNdsQq7rwH167eSRA6L413oLCzcfT66c6umPS3C/dV+FlfSwqCWK83lPdBHpPR8elYI7uBmpgq8AzFQlXBbxu173SNhdV03VeHBh/gqPodQacfTuhHq+Lk2qariSEciYVpGsIFHZt+mDeqR2tY4wk3kOmatEtL40Bbyu3qs6A2CW3lcRFjIiaNh0FJmMT8eZTC9ZjvQPXLvuh8bCCgW/rl/BHHqm4jBJ5TOiW+OfGuJNFbGhTdpYOCAMzj7bd5feeT5daB17k95R7/X4Za77P+/6ZDJaIbufUxrymtiovTWNfq4sRP79M3ljxWDxeaabobYLoeUpxqalIcCpK+zG49mSifF0y+1LjB+YLpg+PaZeQ8EHI5uXToT4kb+w2spfnKeRj6O2W01VdZjOFFqT/HftkoMNdl9I61IRbBGIiUDqVToZRGCKFkKRlsXZdnc685x7uZ1LjMCDipuuBsPT0WR7pOegYALAl+muMH3isjJSCXGXZzKFb0wg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9e6e75dc-44af-4388-87ac-08d9986f3579
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 10:56:05.8910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3891
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 10:56:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157380



On 26.10.21 12:50, Martyn Welch wrote:
> From: Martyn Welch <martyn.welch@collabora.co.uk>
> 
> Add a default IMAGE_QA_PROHIBIT_PATHS variable containing paths known to
> be mounted in the default fstab, which are known mount points or
> directories which should be populated at runtime.
> 
> Suggested-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>

That can't be true - or the initial idea is very very old :-) pls use 
Alex's gmail instead

> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> ---
> Changes since v3:
>   - This patch added.
> 
>   meta/classes/core-image.bbclass | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
> index 84fd3eeb38..33ab1c85de 100644
> --- a/meta/classes/core-image.bbclass
> +++ b/meta/classes/core-image.bbclass
> @@ -63,6 +63,11 @@ IMAGE_FEATURES_REPLACES_ssh-server-openssh = "ssh-server-dropbear"
>   # IMAGE_FEATURES_CONFLICTS_foo = 'bar1 bar2'
>   # An error exception would be raised if both image features foo and bar1(or bar2) are included
>   
> +# IMAGE_QA_PROHIBITED_PATHS
> +# Ensure images aren't including files in places that will be used as mount points or that are
> +# reserved for runtime data.
> +IMAGE_QA_PROHIBITED_PATHS ?= "/dev/pts/*:/media/*:/mnt/*:/proc/*:/run/*:/tmp/*:/var/run/*:/var/tmp/*:/var/volatile/*"

I like the idea, but wouldn't make more sense to do that on a package 
level, as here the user is more or less left alone in guessing where the 
file actually does come from

> +
>   MACHINE_HWCODECS ??= ""
>   
>   CORE_IMAGE_BASE_INSTALL = '\
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157378): https://lists.openembedded.org/g/openembedded-core/message/157378
> Mute This Topic: https://lists.openembedded.org/mt/86599458/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

