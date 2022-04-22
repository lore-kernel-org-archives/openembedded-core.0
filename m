Return-Path: <henning.schild@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B9BC47094
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.86])
 by mx.groups.io with SMTP id smtpd.web09.6503.1650620877022277544
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 02:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=BFd4hUPA;
 spf=pass (domain: siemens.com, ip: 40.107.22.86,
 mailfrom: henning.schild@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6t6xd9rOLjdQ+g/PsDQlG0l8K+3H2hfsUdTHf9ZNx6CwYJm+Q1gOkaFpCvTPhT1Jey65OpVzgrxqrkwqYUbijqXNQ1x7zr6gDkqCDBmA3YlYeSiekgnO0iN47x0DTyLHqoraIlBUMAN/zRI5VM6bPwGqY155cUp9gD+wWrxKp5HdqjoQPj1j+O+wMQRTshBEz4RZyfBDd4ME5Kq4AAqLTPzRDGnJFBIYdIJDhWrkoks/gkiWqDvcXMmnxGAEDfxr0iwBGCUlIEF0BjHLWMPFSUssbxc5DQGCLIGeS/jOZkKYOBPRPfeL1dODb6PGvUSMIjD5DM08BrNSDsYdySF4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ip5cM99GxTo/Urwyv5OWjb7hpRV5WhNqh2VJBDUlPJ8=;
 b=SmRWEtMsQDHUAikdTm9SsTO2slZkpbwurJbRT09UGiWm3If+HtW/pN245eBKHUprby0TEq2Fovwz6fcXohKB3s1e+W0ckI5v2GuSAWHxn1KBQtIu6ZD/bTE5RJHZSy9H5A4/zcPk39+nN6jZQLjKw452t6YxC9L6taWsQHxu1dWM7za6XK0S7aReOYEsuEefGytaE4CeU3HOfda87TAHMBVZV6sfLITon/ojJhmMtcUF+bk8Cw+xR+QN0iSCqG0lDnpkzSXX/bl/hJ6j+u7RKx4sX2VkH8VanZ/9OPgkrg9KVuWeKuz9F5J31fvRrz9AZ0NZ8HZXwdNyCfNDJ52t2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ip5cM99GxTo/Urwyv5OWjb7hpRV5WhNqh2VJBDUlPJ8=;
 b=BFd4hUPATNq3i5wegKgyTSwxtH7v69icuAgnzcoL130VkkPs72fmwklKxIPHNE+0GiP113wBxU1uw5lRj/aWOWcVDs85q3UmyGe892YyLc41yZvj0/LV5FPok3finPAjVkj2fM2Z5WY+13FylTvJS6kg9weCA94NaO1VWFoLd8RNsTIaDj6KdutRWoEix5v3n2BNZ0wb6Y3BEj910XgUggCPforkRrGCSG5UG2q3Ei6a/f0fEWZUG6aEsimTXm41U7S3u4hW6kZ+r26LdgOFnhrb4O4zXd7FRgDiPhAVOdlN36gfmLmLoOu5+CB8Vna8sPnzR63XpInu238MgX8L+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8)
 by PAXPR10MB5383.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:284::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 09:47:54 +0000
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f4be:8b5d:4314:c2d8]) by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f4be:8b5d:4314:c2d8%4]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 09:47:54 +0000
Date: Fri, 22 Apr 2022 11:47:51 +0200
From: Henning Schild <henning.schild@siemens.com>
To: <openembedded-core@lists.openembedded.org>
Cc: Adriaan Schmidt <adriaan.schmidt@siemens.com>
Subject: Re: [PATCH] wic: do not use PARTLABEL for msdos partition tables
Message-ID: <20220422114751.6b904d9a@md1za8fc.ad001.siemens.net>
In-Reply-To: <20220422094448.27342-1-henning.schild@siemens.com>
References: <20220422094448.27342-1-henning.schild@siemens.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0101CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::37) To PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:269::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf24ac9e-2957-47a2-06f8-08da24452c35
X-MS-TrafficTypeDiagnostic: PAXPR10MB5383:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR10MB5383851062A14B0DC7B1ADB285F79@PAXPR10MB5383.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zumTN3xCUNyH89NofBmXvNBFYrWsCHfu0IgbWQykK/LLKKNO29jzcoZktKyGBU+IaziRn8DnqOocGYP4NlSt5+LeCBPxp4sCwavW2LNgS/wMOWfdFPmEVOHmXtscUYr9ES6YvGd8kIYnvJeXlP5l276n6DE8fFowwz5GJ7eAmXLfaBQonLNnDhdEiJwEuG4xxfQC1jbjGwSoAPxwCgMmLlTmaolPebPOVrZENAENK3J8rbbij1VXrObAzBrOdwcidx8JhqpKzIGQLXU2ZtWapzEFA4AiovVnoW+G7z0mSEA6NHuoKyTWZhWsfV2om3LheS2cLhWwORA1ow+TxQnE4C9gC2ghlMe0tQyfkoA5muX0Yo1ufhQDHPTV97QNaKFI40d83N3/mXUXVuVzim4Y5/Zm0tzTU9Xwq7IoJ4lV6WA0CT7XOQpHpgX6hd8Ee8fSND+Nfkxti//5yuCASy75kj/Rqb5iYlkF7ZTQpb8uZkidKtsXEfwYCMx67sk5yH6qF96CN/s+Ij/ssqm5kdwV3WkDY1JIjYs8IGYdlgWCDZYhZu3rvF9gc6jvKON+DkXKcMf4JvFMH2e8QW0kyMQNy96ElYUnLNSlLkLgCF5lTz5w8EbOeVzvOj3cRkuSZNYgwQgkHDjZztHKLrVx6e1nIA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(44832011)(6486002)(6916009)(316002)(1076003)(83380400001)(107886003)(186003)(66476007)(66556008)(508600001)(5660300002)(8936002)(4326008)(6506007)(82960400001)(2906002)(8676002)(9686003)(6512007)(6666004)(86362001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dqaZhOzngcZofFcrjB3u536/aMqM3wG9++u0NrYi6gPMIFrVNhFG/ahD45PJ?=
 =?us-ascii?Q?8Kf+UkyEb00cMtd0RD3y51qJ+tRng+3lDAQHb/MVqEZaaB2dCCGVVaqTZwZf?=
 =?us-ascii?Q?R4tWYM9i8KFQLNFvJkj37i+C2ob4gcGk0tfjy8NO7l4Df2PhNtPxzicD8fzA?=
 =?us-ascii?Q?dfn4f9bXF9kje9POdPQd2KfC3KnJpBAzL+UdiE9yvZoNhyWwXYfY/nAIBkJ4?=
 =?us-ascii?Q?0XkSM5Wg+6SCxCQ4KkdI7Z7/HjLZ/GUcI9CVBL6DR3xuD1osL6Avuy8hVMl2?=
 =?us-ascii?Q?7aN0cQEx+0CeTddve5Jb9RQsbSy6BMP5tGv1zTlfZD7hvMOLhSPDKz2WqEYE?=
 =?us-ascii?Q?HSGoHh+nMIoILyudTt6rLAQXe8jRm8CmiOuFAcd5K2tQ0w9kbwYvyRgRuH1r?=
 =?us-ascii?Q?E6OZ54NtANThT3C6vo5CInaourMNH3yg8RQCxUxoW1Fm59pKyJmXKF6xstC8?=
 =?us-ascii?Q?Vsi5mzdG14eVpjk5qnlPFlKJOym/HQgt9dgofQYR8D2WFj3nIiJyquxmDbH9?=
 =?us-ascii?Q?JMuUt6xR7vmbktT9zwwVNM8Q3CZQUjGXRW/ZTBGAu0LtrZrvp/hQHyYJ8vVD?=
 =?us-ascii?Q?iNGwF7xH5vIG5kaKig5omBGmLEHqdng2YGIfvYFlAm6V8us2TLJc+IsHsqzw?=
 =?us-ascii?Q?jybTTi/Ogrc519ZpqLm4JvNuX396JaTiJXhK/lMg/AvFI9xwaAz1SUQLYESN?=
 =?us-ascii?Q?rBz3ARMXCMEejRnyUvkjbzaRzjR73L4aziMtIB+m930BxeRgcEE2fb9HqYjA?=
 =?us-ascii?Q?UXPMjpJzuR9XgyDIU0KaYQWx1r//ybxZ/mDuzjkmvK1awox15diOYy4DYkQc?=
 =?us-ascii?Q?hy+E14DddYaobSZAHDoMkZEJ6kw/eiGGoDf9Da5IcJOVxW9uUOrxl2+ZtUcJ?=
 =?us-ascii?Q?PzmEEX0nkHH+1YTmqwE/GpU6YFjv1ZdWGashVQlOVfb+9zHSeNE5g5T2Jghu?=
 =?us-ascii?Q?kbtoTTh+0dtWu+fQ7o+jo9OnAGw4Vk4aieN8dQECSJeJtq0E4UwT8LJpl4ay?=
 =?us-ascii?Q?8A5+HffbrNExA/JyfqrC2jUQF2UTPz3arueY8Q32w0ZMb09HwDcZSYgU0B48?=
 =?us-ascii?Q?5CEJulsCsNTrJJYm5JNsXWS2RLA4mes4xDA40X+ONx99539cQtk5hij2NCdA?=
 =?us-ascii?Q?vUYk8XP//SteOkBZ2MiO8cdxXqNRzmMSjt4vEYJwrda+4+NDSi5xwIQpgwJi?=
 =?us-ascii?Q?oHpnIVr8KhAb5B3OPmosICCc9uSlRR7fZqEqRDC+v6PFAr9K4ZeLj1WR+Qo0?=
 =?us-ascii?Q?KarPOcj2C3SswXE5mwBal1Byx9zj7lRNCZLvfX4bAqvQg+z8V9Hgr7K3kKjL?=
 =?us-ascii?Q?mwFJWqT6F4XkZSDyN5ii8Wi6tSYehzE/eu0rxZX3zjozg2FJxmARbI0Hvik5?=
 =?us-ascii?Q?rfXE9p9H8qwkQUaJdNpVSCKLx5+iHZTRoiiFbEo9AewLY79BvPQ+9R/acyCK?=
 =?us-ascii?Q?r/Wa944g2wU9JIoPIL+7xMW5az4r9MJRcn7tTAUoUJ1HraPhRfo2LFfvbjoA?=
 =?us-ascii?Q?JgBdYqjL/9CJFwqzVa06/K9r0CuTm02/2GcAFaL0K3nEOcVr3HTHtux0TOzR?=
 =?us-ascii?Q?80bgeySHrgQehi9L/Es6o9wmcF+rzzctyEsigSfLWdvNi+hrbpqArXDlOlOQ?=
 =?us-ascii?Q?AuTHIYkbHbY8LX9gjgR3CnPzoUacmeTXa3lpKz1x6iTNG6Hi9FsAFAwJ75/G?=
 =?us-ascii?Q?EL4ojYIM9GXNrfq4EIyFLdbJzi1w5mg17+fdJt4iiNMpqDHSygJJpG+axMri?=
 =?us-ascii?Q?TPCkK01Zo+Ue8ELw7JGFnehHnKZOrEGbBgh7AU028R6dCWANqDEfg2Xq7gcE?=
X-MS-Exchange-AntiSpam-MessageData-1: oStmmTFIzMk3w/n5uOvAdLBii4XJFEzIqko=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cf24ac9e-2957-47a2-06f8-08da24452c35
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 09:47:54.0768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1s94VZAnO0pWRGMQm4eS9BPkh6uFQ6A6+vB8exeFiruUc15NSWJlmxkCxNTEtWJbr+YZerF6xt1EmP58HpScBizIdTW3Rnxzv4jvldebyxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5383
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164783

Am Fri, 22 Apr 2022 11:44:48 +0200
schrieb Henning Schild <henning.schild@siemens.com>:

> When using "msdos" partition tables and "--label" but not "--use-uuid"
> one can generate images which will not find their root, because
> PARTLABEL does not work for "msdos".
> 
> Fix that by simply not going the PARTLABEL path in case of "msdos".
> 
> Fixes: 2fb247c5ecf0 ("wic: support rootdev identified by partition
> label") Signed-off-by: Henning Schild <henning.schild@siemens.com>

I used the Fixes tag i know from other projects, indicating that this
might need backporting to stable branches, like 1.50.x

> ---
>  scripts/lib/wic/plugins/imager/direct.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/plugins/imager/direct.py
> b/scripts/lib/wic/plugins/imager/direct.py index
> 35fff7c10242..4d0b836ef603 100644 ---
> a/scripts/lib/wic/plugins/imager/direct.py +++
> b/scripts/lib/wic/plugins/imager/direct.py @@ -259,7 +259,7 @@ class
> DirectPlugin(ImagerPlugin): if part.mountpoint == "/":
>                  if part.uuid:
>                      return "PARTUUID=%s" % part.uuid
> -                elif part.label:
> +                elif part.label and self.ptable_format != 'msdos':

One could maybe bbwarn, i decided to go the silent way but would be
happy to change that, waiting for suggestions.

regards,
Henning

>                      return "PARTLABEL=%s" % part.label
>                  else:
>                      suffix = 'p' if part.disk.startswith('mmcblk')
> else ''


