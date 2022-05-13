Return-Path: <henning.schild@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595C2C433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 14:40:52 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.74])
 by mx.groups.io with SMTP id smtpd.web11.9122.1652452850857694564
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 07:40:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=tsD9owKt;
 spf=pass (domain: siemens.com, ip: 40.107.7.74,
 mailfrom: henning.schild@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lU+JYEuMEbFFOUyOvu253YH5lpt+A3biJg8qFMRF6MW0xG9iwMZw0Wq1tK54YVkwLWQg10NKGVo3umX11C3gkjMj1HzFUCNYS8YoKcqHnGrqL3tQECFG7VyjMgEfGYNjwU/lURH3Ey2UIwyg/E0YAxVWwdDZPn1f9bwaGofJNg5SU+Qa9qhNE/Pfd1rORAcMR6TNWn1+CTRjtUFcLUAHG1unQC1Vlg8/5NSqXXoQa6/o3yT3Oq63+xnyrMtyVfVZn7SUKbOair7WthZ90IzEGlTZRWky0dP92ocsR7tDDwekhhMgyDSK7fV7DDh74vru2EavdFeFyqvPpR89/DZ6vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pD77vpD1jeSbjwHsb8fFp4SvO7ZkvddLtxESwR4q+5M=;
 b=E/DSPNv4np6px0/Hs+4ivuXICkDgFdBBkAw+PF9BL6zhmU1hiOQjkiu21+85EHyaKTuWshfSEwPJyM15NluOBLIyvevkAeJCTPg7u1UdbxQ1/ApwNstSmABG3MP3NqyF4lVkISAF4ggVWMOzf+eAfQepjG5jZ1anSlSMuE5IovhLu4CBuhGz4HDphgAV/Fgw8i3wqpgq5x7MUK2b4OO62cychZErEBjA4giEnFR6JyfEDqbCFTOtDFf9C4epRd6aT5rQv+cjsMe30zBfP81bLUqKtreJ7GxtQd9KHbYdHm433Q8gREsN/PKuRZU346tPXNyAOU/NqB+7bxWv2Xe/Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pD77vpD1jeSbjwHsb8fFp4SvO7ZkvddLtxESwR4q+5M=;
 b=tsD9owKts3z1UvH/0WSAP+8y/QE9RWqE8fbwBUTwy7dpcTTGvnWqbY4R/n69EpmgZMpEnKEu8FiUl+XhBE1lechhOSv45QJ3o19bDSSbu0WoCBH5mQx8Q+t+4SJod26irO/cjj3x2aYAtZEkUCV7KA/6CEvxaVuAf6fvsePGKkO13naQioA/9yyQwZcK4Vqf6AWAiVPPxtHOcNf6sMllXMbCp9uIz8/EABGeS4/kqzGnpIgFaew0+9A8psZhY/qpluXC5m3Dg7QCxdo2wVxt1WVLw0MQaPAm5lVWpK5iyS2f72eK8HEK+xFfbe9TZkmSrxA1qWGwOcZAFl4LmUnrjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8)
 by AM8PR10MB4787.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:369::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Fri, 13 May
 2022 14:40:47 +0000
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::160:83bb:cf0a:10da]) by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::160:83bb:cf0a:10da%4]) with mapi id 15.20.5250.014; Fri, 13 May 2022
 14:40:47 +0000
Date: Fri, 13 May 2022 16:40:44 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Claudius Heine <ch@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>, Tom Zanussi
 <tom.zanussi@linux.intel.com>, "Kanagarajan,  Vijaikumar"
 <vijaikumar.kanagarajan@siemens.com>
Subject: Re: [PATCH] wic: added fspassno parameter to partition
Message-ID: <20220513164044.4ad41b6b@md1za8fc.ad001.siemens.net>
In-Reply-To: <20201106102722.3674813-1-ch@denx.de>
References: 
 <f75a25804d34913e592233c06a9dfdafe6be0830.camel@linuxfoundation.org>
	<20201106102722.3674813-1-ch@denx.de>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0210.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::35) To PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:269::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 040f4393-a938-42f8-6687-08da34ee9131
X-MS-TrafficTypeDiagnostic: AM8PR10MB4787:EE_
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-Microsoft-Antispam-PRVS: 
	<AM8PR10MB47871EE65C0051DA5177A7DD85CA9@AM8PR10MB4787.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F3/3yXBwVv/qwQ2lSjSWdBFopQrU3smmByD5RkIr5ZUohmjYB0kLe4/Q/BH/hiiDg4opfz3kTsmHa25bdO+XF0RzOeXsHjhDit0UYVRpOlyaqFlmULHQgpfNyuRcRG3uGvK1yzPnOaLeN48ArhHHpqxdhtE5YjOMevUpArO+JcuVR4VGbK2+proURivvWyEa/NUHk7RnGu3pAt2isQ/clh8Au8XVIMZm2l1Gv8xo5PJuSaNrNEbWfMQ5svNoPNtS3sWYr8Puwn7E4Xn+VVUOiCZiJ/uY0wf+rGNCUNvypU1sXeyVA/33Q7IG1cSb3Fze1hQ6NpvpEdzNocxBOWSqO3T+HP1I+xCJRvW5bdJjWNBp0Yx7UIeyov2ov2ebawna8sGQMJ67c55O5Ko/D/XJ87JZMoc8JSjhbsVczk3th/jd1LuzcspmeHHprdczS9uqaDQeOUsQhWcUUwbm0E/9FYgeX/yKDAeobV9XRHh/u3/ay2USzeg4hXDr1NzhexcFNhSrRUV5dZIKVbF6u2oiXcf/CTWF36nAvHFche8/jhGml7FsDEjcVmrBEx4nvFesGghAZ+fu1MAv9+cOcN6g+UZckEpTgAQ0rimicc9QqEh07+jBx3sQ0E3/94ayJ+PMUN74oRCcO0bh3fbJaOkrNQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6666004)(6512007)(6506007)(26005)(66476007)(8936002)(2906002)(5660300002)(44832011)(9686003)(54906003)(82960400001)(66946007)(66556008)(508600001)(6486002)(86362001)(316002)(4326008)(8676002)(83380400001)(1076003)(107886003)(186003)(38100700002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?78zBgymY4pNwcnKByCV93HkfiPxF8xfyafFjtizhXf50K44erLGWs28o51Bd?=
 =?us-ascii?Q?xzAJHdER04jXgGNXjbWVYj0LrG2BKc/A4zYM6CXv9AdfxOrYxWxTYTmK3TcU?=
 =?us-ascii?Q?sU1J6fga+8s12DBbHcoBo9B60ZYNwHajP6OOXEHRFHk6wH1f6UR8OMrLfh+e?=
 =?us-ascii?Q?bH34/JSjrwDXgBQ0fnGWjNklIcgxhlD6O4gnEc9MQdvjuTpH+CBYxYXoY7W6?=
 =?us-ascii?Q?ddHNLzGc3nn0oxLRH7LsXifTbe/XooE2aCbIj0UfGHyznA/NKnuK4R8muXBG?=
 =?us-ascii?Q?Azn7HdL3f3YGSAhlg/kv6ckIyX0VsKc07SSyCTq/8AxbSfvl+goj+dUlTu4U?=
 =?us-ascii?Q?RPcDN1xoMrUCDRkNJCF3sfny1pMjdYgxnDry3Kp6yqTgNShjACEqBXZmP0pc?=
 =?us-ascii?Q?Csxtgwzrs1+3tO4nBP2cSBa8NItvSA6xf9OhblWbxgPcS6MwiTTKU7WCMaLD?=
 =?us-ascii?Q?Tb7eVS/tkDW/mdEBsh4n2nDVQdjeW2kc/Bma+CiUq9WKG7TGUaCG1Q+B5XR3?=
 =?us-ascii?Q?FrCm3dSYoXKG/qn2rRG/kYED4jLnH3inzziPj1OIg0RgF0tMbkvfSYJRE5XF?=
 =?us-ascii?Q?bB9O3Cfpwkj5eMR7eZXyXvUhjtrVzrUaywRpI2klBM781gs7WaqyxSDUtYr3?=
 =?us-ascii?Q?PZlA2xKZpRdZLg8KvX9oq+5wdCMKGvMFGkq52E/yDjYDdl5CSjgkRGG1YgUa?=
 =?us-ascii?Q?AuDK+mBuU74PgxMifefe79+6EWLvKOJZdnIjPuRUFlPi5MXa922UOEJEHqxY?=
 =?us-ascii?Q?GjyJoO//Qozo43ywU+ThmAlf2XBkaP8/uiGNvuObKIrQEkkm5fy+qTZCGuNF?=
 =?us-ascii?Q?ZMLaMkvt5AfdQemJ6Jn9E+uY1dC62ahc6uTbUwV0tGnpdVuKQHoYID0/Bpkk?=
 =?us-ascii?Q?fnEhQkh2BGA6P0N57eUYM7mokrXopVaa3adKr9hFlF5ceELctE/4E+FWAI1V?=
 =?us-ascii?Q?VSOv+PP5bLWvrUM5UJBcbmMvDpWty8Sajc5ZpbDl0l9sn90QSonJ6zusC5Vx?=
 =?us-ascii?Q?1rZOsAErWKPKf3mwufWiLvyGIVJY4B2poOMiGRG43IgIPoqbZxPVs3C+GnsQ?=
 =?us-ascii?Q?HVQjFFZ0V4RfkYEx7TiRdTgeYmaNmJWJzMfVipdR8TjlqO3O/H/jbrVfdIWk?=
 =?us-ascii?Q?PrlRMSvz5ZNteLCyR1dg/5GpkgE3C9hCF6wA9e+viz7RdNgOMictqdUrO6Q2?=
 =?us-ascii?Q?ue8o2hf9x7oXa5UkXnXXZUgbARMH8z2hNpAeeOCvWmxNGkQH4+WMC6sLWjsP?=
 =?us-ascii?Q?KxBtp6We9lrGKFmTh618nGE68gMl9orboH+LjRhwOvEWewBySChoCmbIVmG2?=
 =?us-ascii?Q?lSzm7nLfP4/xnoVUvqs5R1XSeX0I1xxl/uZejbGLsXQ2WwcYbAtkXY3O6Ukk?=
 =?us-ascii?Q?6YGwHuNXfW10a8tT1vw5aeiWavrPEzYQ/TvqX58sBcUFPcHFNaZopUP4e7jJ?=
 =?us-ascii?Q?bGc0vm74EIhqqOyHaZ/cX8zjAK5TQ6gLqSWi0AKG0ggQ3KbCX1edBHyX6I3w?=
 =?us-ascii?Q?oiIycLXjXcEuqgTRu0kvkIPa/ftGtuiBWBv714olYQCVlmftuYxcftbXlUe4?=
 =?us-ascii?Q?UKtlV8VJDjI1FUOaChcNjy+wWZEE4B7Q+t+dGS6XDo/o4RTTDpNRxqzpQPfr?=
 =?us-ascii?Q?yWYUfh0GpMBCNfoJ11dFS+8BJ46PiW4wuA3iZ7fAP5RDxZHTk0/ecRw7KP4Y?=
 =?us-ascii?Q?uDyMvHu4V9EGjmm+0gKKo/1hiyx1PnKQlY3E9dFfdNTkao3rF8BnUZNIqLNN?=
 =?us-ascii?Q?S7Ex/tZvNOw1OyS30W2w51RGcBi6RjVm61EPjmg7v2fyqtYjnoo3?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 040f4393-a938-42f8-6687-08da34ee9131
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 14:40:47.0716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fGh8BynvN6qbymNcRkeUios92qgd3YiR9gVZXYUBI0Hky2rpPlpgZmKgMhpjhmZ24YS30N7OG5GoAW71rlQNJCUS1E0bhOu0/nCpYxiskdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4787
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 14:40:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165572

Was this ever looked at? ping

regards,
Henning

Am Fri, 6 Nov 2020 11:27:22 +0100
schrieb Claudius Heine <ch@denx.de>:

> The `fspassno` parameter allows to overwrite the value of the last
> column (`fs_passno`) in the /etc/fstab of the target root file system.
> This allows to have periodic file system checks.
> 
> Signed-off-by: Claudius Heine <ch@denx.de>
> ---
>  scripts/lib/wic/help.py                  | 6 ++++++
>  scripts/lib/wic/ksparser.py              | 1 +
>  scripts/lib/wic/partition.py             | 1 +
>  scripts/lib/wic/plugins/imager/direct.py | 3 ++-
>  4 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> index bd3a2b97df..dd0a02fc12 100644
> --- a/scripts/lib/wic/help.py
> +++ b/scripts/lib/wic/help.py
> @@ -939,6 +939,12 @@ DESCRIPTION
>                        quotes.  If not specified, the default string
> is "defaults".
>  
> +         --fspassno: Specifies the order in which filesystem checks
> are done
> +                     at boot time by fsck.  See fs_passno parameter
> of
> +                     fstab(5).  This parameter will be copied into
> the
> +                     /etc/fstab file of the installed system.  If not
> +                     specified the default value of "0" will be used.
> +
>           --label label: Specifies the label to give to the filesystem
>                          to be made on the partition. If the given
>                          label is already in use by another
> filesystem, diff --git a/scripts/lib/wic/ksparser.py
> b/scripts/lib/wic/ksparser.py index 913e3283dc..b1ade01ed4 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -155,6 +155,7 @@ class KickStart():
>          part.add_argument('--change-directory')
>          part.add_argument("--extra-space", type=sizetype("M"))
>          part.add_argument('--fsoptions', dest='fsopts')
> +        part.add_argument('--fspassno', dest='fspassno')
>          part.add_argument('--fstype', default='vfat',
>                            choices=('ext2', 'ext3', 'ext4', 'btrfs',
>                                     'squashfs', 'vfat', 'msdos',
> 'swap')) diff --git a/scripts/lib/wic/partition.py
> b/scripts/lib/wic/partition.py index ebe250b00d..44b17b5bd7 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -33,6 +33,7 @@ class Partition():
>          self.include_path = args.include_path
>          self.change_directory = args.change_directory
>          self.fsopts = args.fsopts
> +        self.fspassno = args.fspassno
>          self.fstype = args.fstype
>          self.label = args.label
>          self.use_label = args.use_label
> diff --git a/scripts/lib/wic/plugins/imager/direct.py
> b/scripts/lib/wic/plugins/imager/direct.py index
> 55db826e93..c2225ba067 100644 ---
> a/scripts/lib/wic/plugins/imager/direct.py +++
> b/scripts/lib/wic/plugins/imager/direct.py @@ -138,8 +138,9 @@ class
> DirectPlugin(ImagerPlugin): device_name = "/dev/%s%s%d" % (part.disk,
> prefix, part.realnum) 
>              opts = part.fsopts if part.fsopts else "defaults"
> +            passno = part.fspassno if part.fspassno else "0"
>              line = "\t".join([device_name, part.mountpoint,
> part.fstype,
> -                              opts, "0", "0"]) + "\n"
> +                              opts, "0", passno]) + "\n"
>  
>              fstab_lines.append(line)
>              updated = True


