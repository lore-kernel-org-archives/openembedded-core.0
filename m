Return-Path: <henning.schild@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2D1C4708D
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 16:14:21 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.83])
 by mx.groups.io with SMTP id smtpd.web11.17682.1673021656190303617
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 08:14:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ku6t5bBM;
 spf=pass (domain: siemens.com, ip: 40.107.15.83, mailfrom: henning.schild@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F4drKqpILCi7uQDF5RMTL7LrbMLrwnNjF8a/qFSg2H81Rxrpq7/u05Li37s9yav7F8R75kMFHSNewXdNofh2tKgggEyzl3HcoICw0mWUqlF/5YERSqSjDq7FRatu38tWHiIdOWzxhdm9NYIZZxnCUKqhf7xB4qMU2nc/3pqdFu5rJSobGfrV0u8n/EL5MzumSKI5QodY0YKZtzejOjmWQWt+KX/5InjAJraP0knYHqO1ax8h1s238gEA0CyT6f1qxILElD3ZZD6OxN+Ttsyikq/TO/jLqsjtNSDZLdDFrksz4apSMMIq6H2FBT/Y3LDdP/PoD9ZzhIrCw24zynReUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLWOtobFRbNvW7edSt9tzeUousB12N2R5xU0FnzHg7w=;
 b=D8DvmWtf5R28y/xkxp35NzV9cVrZ3uG7+OeiSZtifXWZ+D/HaSFPp4EhqrkAfS9EM+ohuRS53JOkZet3Ujh/1E31QhxDQKRN7fqq3e3phxrZNNwx7R5hUlG+FcjBNY1ryiOVpuKWkFF/0ieB6LlbqclsTNZqkPkHHqal1hLnQl4T3gFFQ3fYzKjdodjdbFjSwrF2VnIoyBRd3Qtg5q6nY3Jx1eanh3CDkGgD3VBMUGXXAb6N8B45TV9zo6kCDO9dhf+SDSjnzjNITGtCUEbAXci7r+383/lFUwU0c9sqwlijMrNkV4cbfxHD5sWxNJjLGdoROzRyeNq5VOxmdsGCUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLWOtobFRbNvW7edSt9tzeUousB12N2R5xU0FnzHg7w=;
 b=ku6t5bBMKJ6LRZ5KSbDSu71JMhhQ5/3NfDxmwajVgwJ3Eg+NoklPJXeGACgbMA8LP9c7iaKn7a86WBx5V2u0/A6A6xFO8AXQzCcTviTviBYqEWWtk7mvDqDRsy4nFiYfayRkVpkQRW2aqVmg0NvZS2kjD+jNO4ZF3B0d2aceTZgRxnchE3DrSXZ5VnZ7dcm8kvz6/R7Vi5DmDUH6QjJwMrxKO03/FXfWvGi4+CNISVNANGUOqkWmMRQqw8OWOz0zJcDNurXfLHPNugkUHyX2dc09TrQOANN0OxN9wr4IblHMzSccRunf7uWrI7eerdI98lyzxeafBOeCq5jKGF9/RQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8)
 by DB4PR10MB6119.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:38c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 16:14:13 +0000
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bdf0:fdeb:f955:bc79]) by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bdf0:fdeb:f955:bc79%3]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 16:14:13 +0000
Date: Fri, 6 Jan 2023 17:14:09 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Florian Bezdeka <florian.bezdeka@siemens.com>
Cc: Felix Moessbauer <felix.moessbauer@siemens.com>,
 openembedded-core@lists.openembedded.org, ross.burton@arm.com,
 alexandre.belloni@bootlin.com, richard.purdie@linuxfoundation.org,
 luca.ceresoli@bootlin.com
Subject: Re: [OE-core][PATCH 1/2] wic/plugins/images/direct: replace fstab
 entries
Message-ID: <20230106171409.5d6fe31f@md1za8fc.ad001.siemens.net>
In-Reply-To: <9e1cddbf-1214-0571-3826-bea0c182a7a7@siemens.com>
References: <20230105125223.398216-1-felix.moessbauer@siemens.com>
	<20230105125223.398216-2-felix.moessbauer@siemens.com>
	<20230105142439.42b893f6@md1za8fc.ad001.siemens.net>
	<9e1cddbf-1214-0571-3826-bea0c182a7a7@siemens.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.35; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::6) To PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:269::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5780:EE_|DB4PR10MB6119:EE_
X-MS-Office365-Filtering-Correlation-Id: a087b893-eda5-4791-131e-08daf0010caf
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KTB5QohbPWBmj1ZDzIaQPl75hx/GUxNIF+Ce88Bs8jZ5iSfgu8uIehRcJQfnr5bZ/HZoo0mM3q57AMxFTag1YBTTp71nsi8ZfciggMWkv+kHN/DluPzJGWTKWxvehVodzMrWg6li49jSk3+hCz+SUBdVuZ+sovuq5fdqvVOwNFNa9CD35AR/tmWvxXsj4ShYy3t1QNnWcWh4J7TC0MEX3jkJ5rtcYWbuJ+Rl6FX5+ejI6I+T21qUck83sqnzxkFUTIwwfcK41OOR7Q8N3Zr5rei7wtul1tOIP/eJ86kkK3EzmvkoAwfU/01AjH776vfs9od6wpQoOeOy0DgmqHaYNdL3q3Vk6NgCPvcpg7uZyaZI4nXYTmo7N5qluxeGRLId4VjGHnuU0+o1ghO77181fybfxrju7DSmhwc3RjhM9uAjHMeygZAJ5hP/7EcfWirhw+vkR4wtHf0B0J4gdzwO0g9zOqm1Tj3iDeGWZLOjUGGQXSTErZfP+PUMkJMj+VLeiVsO8AP2ZQE2jpmnO3oQ6skwunKmxglROrjN23FQMrvW0aTlC0G0qDZoFUw0hNsRDRuJrS3CCq/tDoJFE+U6Qadr13vGHvie40K2gYAVTkpJn29qzbY3R0L3NPL/2TB8A/KZD5GKRggMF9r5les5Hg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(451199015)(6666004)(6486002)(186003)(6636002)(66946007)(66476007)(1076003)(8676002)(9686003)(478600001)(66556008)(6512007)(41300700001)(6862004)(44832011)(5660300002)(83380400001)(8936002)(2906002)(4326008)(316002)(82960400001)(38100700002)(86362001)(53546011)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b4oUEVi6O/HUU9yny32EP/HXiX9vYPsXjC72gSzw2z4gB7JB7xuR6uDExMZc?=
 =?us-ascii?Q?xhr5LFbhSZ+jF5VkJgYDcmx8p9e5r2CpZMhK7YZta3mIH4TYnC6/ewk33E1e?=
 =?us-ascii?Q?zKGe5RReQl2PCfoip6Likz8mo2KpQ11cxfZ/ZC77e/cFvZq6NusgkMg/sWhe?=
 =?us-ascii?Q?xEXSrfrQDWFEshfQfb0LrwqQUfBxjsHx3WpI8CXlD7r6zC5qg7a7zk7aewTd?=
 =?us-ascii?Q?vK/TEWGHgJ2bZD/wezeBvUVp68RvOGhnNJy//mMwNkbL6qmAOgj0JF2zyNQN?=
 =?us-ascii?Q?W4RS422Z4WOZMJNaH3+/DCMC4T+hSHDPVPSkgkXcdazezZI68FPK7oDervAF?=
 =?us-ascii?Q?nWCxULHT+PI8MiDpNt4Nkk9nwgWnP6C3UxGtZCrfZ7U2K1hxe9fne1TyJoVb?=
 =?us-ascii?Q?JB0UkVTtQASUB7KjNvr1aEzv3EqeT1yAX8pNsSbiuyiAHEVaaxWapLgvKDwp?=
 =?us-ascii?Q?gWLrkajb9KuUKMN4RH4DOezw8qXvBFG5X5VpTu16WTjcvaOOkIOQj8C3sVDE?=
 =?us-ascii?Q?/WaDGzQsRvbK0chZu2VRKBzb0PXRjVqu/ss4v7iL8RdBj6vS1ImBtJ9UB1TH?=
 =?us-ascii?Q?33K5QaQ47DO2E3aOxXHVd0+YlLHyYBq2Lb2/2buQfVAvfjAg9Fj8Kp+Y2KYR?=
 =?us-ascii?Q?pZkrfZZiq6Q4lE8bmZJZr1CF4PYK2LxV/hMA1himNAzmUN1Oz8tODe36cycY?=
 =?us-ascii?Q?8WjBWGJZiydzarrewwChOhGvUI52MZPCcqmsVWeF7LcNbFSX7BZO3opXqsqb?=
 =?us-ascii?Q?oRkX06LJrT6twsFwAHC99d0J1gcAkYpk14KrhHUj4IL68IwZ2auw25BzBtjp?=
 =?us-ascii?Q?rcoMLoT7g5Tjpf/OKnYyZBVkGPZ4l3xHlAVCkOkcmjJz7P/fCuUspMr5cAdT?=
 =?us-ascii?Q?Ta6Lp+akzEbbUPIu5het+j0pfJkeGRaHAuw/bJzM6CKHlzsAilTDyMcbX5pK?=
 =?us-ascii?Q?eHjMkbWr3lgU8qWvKCARaGIJkfbcTwHNxCkgmkyPJgXr+lF1ZVvgwxpzYSoe?=
 =?us-ascii?Q?KNmOQGqymZxLCQEc1r/iMPvGjFGOd3GtKdpSe9Sojl5/tgHtqcSyKad2Jaca?=
 =?us-ascii?Q?WAq/E0Z8saPhVRCveaDfg4SDaZ+pZK8j9yKY+e2DhfkAwGNouKGOjWWXysQ3?=
 =?us-ascii?Q?1y21cn2oRnen1eX6hoJ/0e65kxMPsr2eq9zSx6/4xTUnXUyRpTvQWhZqdmDI?=
 =?us-ascii?Q?lRBjvYsk2YNYFqUIld2C7zVHD/BtgFlyiybM1d0oqcbwbnAGAvBXV5G7fjKF?=
 =?us-ascii?Q?9wPc6mk4fNFIkZmHYI2GUx8sl4qw9OVwH2rEoOxtN8RQN2l8ze3mATNo2XXS?=
 =?us-ascii?Q?xUYtdd1mYOM2s7+Tz/gFVGAh+PPyJcsxcbhSa2ebaY7Jva74csqYd36pU4NX?=
 =?us-ascii?Q?WbwfbVjMO1gswa/cV69r1BwJV4LQdqIC6qoueZi6TfnAtdGhJKPVTXm8rNTy?=
 =?us-ascii?Q?0sr25wtZ61r5KxZcywLmSjw0i0Ne4vAU5cM/mi7qZgZ1gZOrGBu2HK5VoqOr?=
 =?us-ascii?Q?IyMSrNkaaAQEchKiJhEDbNGKFuQEl+GAOnCNUJA7eY0HkTsQQ7HKBRirWfa1?=
 =?us-ascii?Q?Old0B/mClPV4fuJm2feu8EYx2nd64dsrdwVLhupy3ITl7+PMSggBKOBAFFlA?=
 =?us-ascii?Q?QlXePf1RX3aT0Tm3nIXxQY5WVvxgVFM0olo9cF7hutjrrh3zg3yn6f73gFx7?=
 =?us-ascii?Q?mrT1MQ=3D=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a087b893-eda5-4791-131e-08daf0010caf
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 16:14:12.6811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/d9NB8naD+gVRfaUBNDzSXELNV/Htfg77rkxJWnfe0Do0JbubJU07X3v+BdslovyjmfgrGeFgUsTVlwp8YZ8HJhpDzSHdc3A05bMG605z4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 16:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175596

Am Fri, 6 Jan 2023 09:56:01 +0100
schrieb Florian Bezdeka <florian.bezdeka@siemens.com>:

> On 05.01.23 14:24, Henning Schild wrote:
> > Am Thu,  5 Jan 2023 12:52:22 +0000
> > schrieb Felix Moessbauer <felix.moessbauer@siemens.com>:
> >   
> >> This patch extends the imager direct class to check if the
> >> mountpoint of a to-be-added entry in the fstab is already there.
> >> If it is, the old entry is removed and the new entry is appended.
> >>
> >> This solves issues with duplicated entries that come from the
> >> rootfs itself. One example where this happens is when generating
> >> images for both direct kernel boot and EFI. In this case, the
> >> rootfs mountpoint needs to be in the fstab of the rootfs and needs
> >> to be replaced in WIC.
> >>
> >> With this logic, the reverted commit 20d43a2 can be included again.
> >>
> >> Reviewed-by: Florian Bezdeka <florian.bezdeka@siemens.com>
> >> Signed-off-by: Felix Moessbauer <felix.moessbauer@siemens.com>
> >> ---
> >>  scripts/lib/wic/plugins/imager/direct.py | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/scripts/lib/wic/plugins/imager/direct.py
> >> b/scripts/lib/wic/plugins/imager/direct.py index
> >> dfaa901567..085bf8b463 100644 ---
> >> a/scripts/lib/wic/plugins/imager/direct.py +++
> >> b/scripts/lib/wic/plugins/imager/direct.py @@ -104,6 +104,14 @@
> >> class DirectPlugin(ImagerPlugin): 
> >>      def update_fstab(self, image_rootfs):
> >>          """Assume partition order same as in wks"""
> >> +
> >> +        def _get_mountpoint(line):
> >> +            """return the mount point of an fstab entry or None"""
> >> +            parts = line.split()
> >> +            if line.startswith('#') or len(parts) != 6:
> >> +                return None
> >> +            return parts[1]
> >> +
> >>          if not image_rootfs:
> >>              return
> >>  
> >> @@ -142,6 +150,8 @@ class DirectPlugin(ImagerPlugin):
> >>              line = "\t".join([device_name, part.mountpoint,
> >> part.fstype, opts, "0", passno]) + "\n"
> >>  
> >> +            # if this mountpoint is already in the fstab, replace
> >> it
> >> +            fstab_lines = [item for item in fstab_lines if
> >> _get_mountpoint(item) != part.mountpoint] fstab_lines.append(line)
> >>  
> > 
> > please bbwarn here, while this seems ok it indicates that two places
> > write different things and users might want to drop the offending
> > line from their template  
> 
> That is the expected behavior. wic has to update the entry for / and
> that is what it does. I can't find a reason why we should warn here.

maybe because we turned "auto" to "ext4" and "1 1" to "0 0" ... see
cover letter. And all pretty much without leaving a trace how that
could happen.

We see that wic messing with fstab / is useful but can have fun
effects, that is why that initial patch was reverted.

I say we only bring it back in a way that uses can not again see fun
effects, maybe by warning them and or requiring them to be explicit by
introducing a new arg for part.

Otherwise we might just be adding the next patch to revert later, and
we have to poll again because we are not on CC for that revert.

Henning

> > 
> > Henning
> >   
> >>              updated = True
> >>    
> >   
> 


