Return-Path: <henning.schild@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB17DC3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 13:24:51 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.55])
 by mx.groups.io with SMTP id smtpd.web11.12365.1672925086313382959
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 05:24:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=SbP5Gm+9;
 spf=pass (domain: siemens.com, ip: 40.107.20.55, mailfrom: henning.schild@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kqy34JP3vguvaueu8BJQIoPodxm0mdvYPThg2aN9/Em2NQrcGt39k6e7TOsnbkcSOBVducMb44R3QFifW/ZLbeQuOCKgDtyheFTsMCVweLNnR5YsTnpzUEMzK78BpBk/zuWR0Bfb8Rp+OTNCNuNuV2ACcROeZQyw2mn/lQleGPqS40dsSWGg52jBK86UZVNsLpL30EVlgmd93Cvg0cc9Mk16g9Wj98EqCd6+SfFKVA9eWJjUADwIIsEiAisiHoSmT6msgRIQRGfqdgtY9VO1T7nDwyeT4FzpRXXci9c6i7/jDpM679+73udxFHgYe4eIObHb8HvTQNi+XooYPRcNCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXXzEsXeve1hN+HY08VseCJF7YkQo41/wPFaGwXw/J8=;
 b=jibJs6j51TUMtwDasXWCqJqIi3RMuJcOJvs7CuMwPj6VOemuriW7Mz/jDsfmGNTpotl7Rg7LFaSn31gUodS4/vw2RsOIxdJhydkNWCi/BAD9zUaR5fonkDMKGZeoOg4FTf3gwaGq0oxDg0QlhmvCrpIgnSe2BPB46On/VPw9o1eBfahx7flblNDY3Ht6+/ujbqu4+saOeOXS31Y+5PEcmYUnmrJXlERFg1JpuvYn9S3R6wr85n4sBfnBz40ZcpuxeldHXtQ1d6NO/Rq3si6/FO1BXgnb9QUJ1+UgWBU7FyVhBbEknoNwD2ycMHI9o/OPhBqUi7U2lCZbg0npJo7X6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXXzEsXeve1hN+HY08VseCJF7YkQo41/wPFaGwXw/J8=;
 b=SbP5Gm+97AzAz9B0mXLFGfeu3Lb9tW74l6T4setCe4FNgvP5o1rstjJeiUSn7zqkiat7BNDTbf7S3V7bbnjniH7IwW3fEWQo4rNycQAIEgjKCFLm/2qr364DRXF+hqRFb2Vi10Q6ltry3Jf6x4ekrZnLonekssCv4/eR7NapnMIodCStpYVmVzGakm+4z8W1WHLk0qqsfl2Y1d0QfYOMWtIIIKM/cCuPmQy8Ql4IHNztlOkiRAb2IPlkmh1BOSIpjOoXPBCk+yHdAVVs1TAtQSjI4b2zPUGpdC0wYQQ1NKJt9GAvCGB66jpbtntH6LWkxTJNfRSS0pVL4kvrbIR5fQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8)
 by PAXPR10MB7927.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:24d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 13:24:43 +0000
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bdf0:fdeb:f955:bc79]) by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bdf0:fdeb:f955:bc79%3]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 13:24:43 +0000
Date: Thu, 5 Jan 2023 14:24:39 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Felix Moessbauer <felix.moessbauer@siemens.com>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com,
 alexandre.belloni@bootlin.com, richard.purdie@linuxfoundation.org,
 tobiasschmidl@siemens.com, luca.ceresoli@bootlin.com, Florian Bezdeka
 <florian.bezdeka@siemens.com>
Subject: Re: [OE-core][PATCH 1/2] wic/plugins/images/direct: replace fstab
 entries
Message-ID: <20230105142439.42b893f6@md1za8fc.ad001.siemens.net>
In-Reply-To: <20230105125223.398216-2-felix.moessbauer@siemens.com>
References: <20230105125223.398216-1-felix.moessbauer@siemens.com>
	<20230105125223.398216-2-felix.moessbauer@siemens.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.35; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::12) To PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:269::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5780:EE_|PAXPR10MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c8bf5c9-32b8-4caa-7e7a-08daef2034d7
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	goukFgVj/f/JUZqeRKMaDM8R3n0lJQh6N3nxY49vhwMtf+i2FauJBk2QpDe7za42+ANFeOIIGORP+OuiP7zXomaGzq5ynCnOT87RcePzHnyAWcKF/nuKpcDaXebmlnKBXnlWqcX5A4gdEwfr3DhwPd4B8yhuMbczd4/YOBSbgsXQnZW43gnHXUKysiQJBrg7Zrlr7TKShuSuuLyty4SC3DrLDWjdO56QormDQPAbaeL5sDMaL3qI9fWZPDaW91IpuLKZrhT7AOydvqyyC4wC9SGWmCPluSX0YJeYxjmy4VgUQXejRjGLw49Z2P0NVu8eOR6o/ydPd3snNGcpl3GXeoa7JEtZm/mNPjGnmO6YsJhldCdOeTmozFx80cVvuI6vOTR8BVd0kuJ9LFCLmAm3g8v332xUwk5TjM0XFFysUBh738IQmGi6KF6djWYWxlOZYq8E+1zYeoffLz6TF1bhCl1oA8itrL0j+QVqKiU7xBjtALEDH+5wxJwaIzr3pOt/8ov+Hc6G5P8uLigCy66+8Ff4eacp2MzUZZSmK3w5C3X0l7kEZ5Zou6QSDQIX4UtljIXpQOv8OMUl1mS+4iPylw4oHliEZ/6/mK/TBlgJTehYVZwormaUOObdOfl+9VAucH3LTv8LOl77CSIa7ZrcUw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(451199015)(6666004)(186003)(6636002)(8676002)(6486002)(107886003)(66946007)(66476007)(1076003)(478600001)(9686003)(6512007)(66556008)(8936002)(41300700001)(44832011)(5660300002)(6862004)(83380400001)(4326008)(2906002)(316002)(6506007)(38100700002)(82960400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iRv0WhKEBVcxmC7yrvucBVfyfgLqrAxfu48mX4Ug8RR9JXs+kDExZf1RtWSg?=
 =?us-ascii?Q?fPAv2StSw+jkYwGvLV0G5hUhTUzGa/EmaRObEPUNHK+EAsS85gKhAVCVbrsi?=
 =?us-ascii?Q?sz15xVIfZkhcd4bzLZ2HigCpkII/sK60SsoVG63UXNF6AlPpv2WnSeBvWB08?=
 =?us-ascii?Q?3B5A/01v2dxE9vpRpnVYm2YIDu08McsowYGRQrXemBkzZwKXnaJTJDDohwQE?=
 =?us-ascii?Q?EI4sHLriExoNLF7FqZxWh+SX74R0wneleHWCi4JT/kkGVSim9FVxuwIakXF4?=
 =?us-ascii?Q?4EwQlDu9Nhmt8GNqKYl+upb2/sz6TIxGhaEn8rOohle334obL9HuqdfUdhTO?=
 =?us-ascii?Q?fpjkz8fGPuLfS2c6x2NqChl+GVqtFDuDGAa3oVMU4Kt9qIRY9VR8GTnWmEvn?=
 =?us-ascii?Q?s1WnQoc4RHPeWQlbxUurj9tadMe2sUPT08sWGGet1FGC1RYT9uIbRrUpk7FK?=
 =?us-ascii?Q?qnWBQVUG9Ql5lFON3jndB2VYVE7BTw2xyPOARriGOHCVpnn03RtbUxvtPiyq?=
 =?us-ascii?Q?HzcjGDvmF7H8xl7nkoWlVTpt8x8CSoCuLjd+ZpJwflFSVc2skD6XjkgOmtHi?=
 =?us-ascii?Q?UqgDbdRcdaXOkFDSH47sFipd8j2f3Y9mlJVj7TMtjpbJ47reB/ct8X0RQbGH?=
 =?us-ascii?Q?5oInOckmBRk8XV6LFM3Fyxncs/6luB+6/6y0prxmYwh3kcHiVcjysx77hbU0?=
 =?us-ascii?Q?AU992myvgmo6QXHuaX1t21FHmGEPoXH+6K0qwqCb9G3s6a54vBU/rMZesVSS?=
 =?us-ascii?Q?L6PWb90NW/2hEnXwlfpNGBWWEo3vrH/MPAdQ/kC/djnq0WCVbQCVz4oQhPH5?=
 =?us-ascii?Q?eCFBafOrmSmZMMQHDqYsf2m0c1ZjdnG+RkhfuxmfuxkQKOz7UwyhFaIQ2KlA?=
 =?us-ascii?Q?FHEctefHnyGsTUTigiMxGS6o6p2lBNwLtbHNJYkpZc7/sTbCAnB26jIf0+gX?=
 =?us-ascii?Q?n+iKKzM5T382XUAyH/1DjutJcu6G2cz3d9siOHTcGSAvBShV1oFwlCc9/SLL?=
 =?us-ascii?Q?GR38nrYYnQVnYZPBDxsMQSxRtQvEezXKgwd8v+4Ayc655SYouE0E5MWuC0r0?=
 =?us-ascii?Q?MtusyPDBmRbZwUxXrTWS09FY4h/C9R1O50EvJ+sas5ok0i2y8E07jvuVDp4E?=
 =?us-ascii?Q?3GU/CxHoz8wAoDbtIFthDIbZwzyRYTC9ZtyBVKfeIFqaFA7r6gRUJRueXcit?=
 =?us-ascii?Q?Grlh7uDWWgJYKJhizf/WpUEQe2Fsub2OR1Gr91t4hBpMtFG48Gvy63WNVY8D?=
 =?us-ascii?Q?kjlT7lWAMJifkoliZosGf28SZ21vIEtnwp/FfFOxzWaFZpLVAuRdwzbSH5AI?=
 =?us-ascii?Q?9RRrtkN7PwKbJZ5tTqWG636a+oBKNRnUGQwnLxuMdLTVtAofNSV0HdJZ5Fgn?=
 =?us-ascii?Q?P37cCE5DnC3Iykk0DGLWP0ZC1Tf8xWo3CeLSVG+8Ggk4UzTmLoh/cDNqE+lP?=
 =?us-ascii?Q?/6SFEFjU9PieUGUW5qnZFY+N71DMIGZmyWn5iqYwrmZhknVy2MaK1ndf2NTS?=
 =?us-ascii?Q?OI/l5qoUShvdertA6vaGiTSmOmh/MKclbmUsVUF455K9ycOYpHOUmCkn6vyi?=
 =?us-ascii?Q?Yifija2lGcyge+qfMbJBleKvDaC05Ix7wQxZV55fQtu2CybNl0o5K4QO4NG4?=
 =?us-ascii?Q?IQDx9fbe8jgTCl5mUyK50SmIgb8FL96oygPgKR5Vhg0nOb75falrTsClsKVD?=
 =?us-ascii?Q?FW87MQ=3D=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8bf5c9-32b8-4caa-7e7a-08daef2034d7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 13:24:43.2907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1xK0dDnr3ibhSd9t28kqNl0lU8og+z3Jkj7JfzYlLLd4mXGeLDDFNlIL5xnYEvR5dI1VmTQpZEoJR5nOuwU6QpBhSykbsKv46VjV7gOtyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB7927
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 13:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175525

Am Thu,  5 Jan 2023 12:52:22 +0000
schrieb Felix Moessbauer <felix.moessbauer@siemens.com>:

> This patch extends the imager direct class to check if the mountpoint
> of a to-be-added entry in the fstab is already there. If it is, the
> old entry is removed and the new entry is appended.
> 
> This solves issues with duplicated entries that come from the rootfs
> itself. One example where this happens is when generating images for
> both direct kernel boot and EFI. In this case, the rootfs mountpoint
> needs to be in the fstab of the rootfs and needs to be replaced in
> WIC.
> 
> With this logic, the reverted commit 20d43a2 can be included again.
> 
> Reviewed-by: Florian Bezdeka <florian.bezdeka@siemens.com>
> Signed-off-by: Felix Moessbauer <felix.moessbauer@siemens.com>
> ---
>  scripts/lib/wic/plugins/imager/direct.py | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/scripts/lib/wic/plugins/imager/direct.py
> b/scripts/lib/wic/plugins/imager/direct.py index
> dfaa901567..085bf8b463 100644 ---
> a/scripts/lib/wic/plugins/imager/direct.py +++
> b/scripts/lib/wic/plugins/imager/direct.py @@ -104,6 +104,14 @@ class
> DirectPlugin(ImagerPlugin): 
>      def update_fstab(self, image_rootfs):
>          """Assume partition order same as in wks"""
> +
> +        def _get_mountpoint(line):
> +            """return the mount point of an fstab entry or None"""
> +            parts = line.split()
> +            if line.startswith('#') or len(parts) != 6:
> +                return None
> +            return parts[1]
> +
>          if not image_rootfs:
>              return
>  
> @@ -142,6 +150,8 @@ class DirectPlugin(ImagerPlugin):
>              line = "\t".join([device_name, part.mountpoint,
> part.fstype, opts, "0", passno]) + "\n"
>  
> +            # if this mountpoint is already in the fstab, replace it
> +            fstab_lines = [item for item in fstab_lines if
> _get_mountpoint(item) != part.mountpoint] fstab_lines.append(line)

please bbwarn here, while this seems ok it indicates that two places
write different things and users might want to drop the offending line
from their template

Henning

>              updated = True
>  


