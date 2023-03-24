Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C6EC6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 10:14:15 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.97815.1679652854852257692
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 03:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Qtgdhb1X;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1480EFF803;
	Fri, 24 Mar 2023 10:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679652853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zFCopjuELdyuFCBl4COGDgaZEmntbO9N1ZlIRAncjMI=;
	b=Qtgdhb1XGs3a1/ZLTSYO67GQX96AOMghOICi9ag7h/hMy5scWsNi+4O2revbjwD+hzsV1m
	mbcHb5D6we4X6+QMLX9fyJ5HJU9Vglj7xQmKoO56/RXUkZwasd63WNO72vC+tsvgPDNzQj
	EDh0wM4KChiHJwwRn65cIhnIzaT+apPgw00b6/W3eVVrNQDxeuPvspyEbb6I6ixukfGtDi
	VsuFPsypc/eOQd2EeLU0umNZ/r1luVVFJzRYWGOSIhKVuIVb1a2JSqsA24L2IfgeaX4db+
	5TZ9zuXFSlegADxdEwU9fO3FGxGETYQe1/rMMFWRs4gSPOIlxVAJSDbKufMx3w==
Date: Fri, 24 Mar 2023 11:14:12 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: romuald.jeanne@st.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] oeqa/selftest/imagefeatures: set a test for
 mutliubi in test_image_fstypes
Message-ID: <2023032410141257c624e3@mail.local>
References: <20230320134818.4510-1-romuald.jeanne@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320134818.4510-1-romuald.jeanne@st.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 10:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179031

Hello Romuald,

This doesn't apply cleanly on master anymore, can you rebase?

On 20/03/2023 14:48:18+0100, Romuald Jeanne via lists.openembedded.org wrote:
> From: Romuald Jeanne <romuald.jeanne@st.com>
> 
> Allow 'multiubi' fstype image.
> Set 'MULTIUBI_BUILD' with two entries to allow configuration for two
> different '.ubifs'.
> Configure 'MKUBIFS_ARGS_*' and 'UBINIZE_ARGS_*' for both configurations.
> 
> Signed-off-by: Romuald Jeanne <romuald.jeanne@st.com>
> ---
>  meta/lib/oeqa/selftest/cases/imagefeatures.py | 27 +++++++++++++++----
>  1 file changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
> index bdd4d3200e2..cc374663e1a 100644
> --- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
> +++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
> @@ -203,7 +203,7 @@ class ImageFeatures(OESelftestTestCase):
>          image_name = 'core-image-minimal'
>  
>          all_image_types = set(get_bb_var("IMAGE_TYPES", image_name).split())
> -        skip_image_types = set(('container', 'elf', 'f2fs', 'multiubi', 'tar.zst', 'wic.zst', 'squashfs-lzo'))
> +        skip_image_types = set(('container', 'elf', 'f2fs', 'tar.zst', 'wic.zst', 'squashfs-lzo'))
>          img_types = all_image_types - skip_image_types
>  
>          config = """
> @@ -211,6 +211,12 @@ IMAGE_FSTYPES += "%s"
>  WKS_FILE = "wictestdisk.wks"
>  MKUBIFS_ARGS ?= "-m 2048 -e 129024 -c 2047"
>  UBINIZE_ARGS ?= "-m 2048 -p 128KiB -s 512"
> +MULTIUBI_BUILD += "mtd_2_128"
> +MKUBIFS_ARGS_mtd_2_128 ?= "-m 2048 -e 129024 -c 2047"
> +UBINIZE_ARGS_mtd_2_128 ?= "-m 2048 -p 128KiB -s 512"
> +MULTIUBI_BUILD += "mtd_4_256"
> +MKUBIFS_ARGS_mtd_4_256 ?= "-m 4096 -e 253952 -c 4096"
> +UBINIZE_ARGS_mtd_4_256 ?= "-m 4096 -p 256KiB"
>  """ % ' '.join(img_types)
>          self.write_config(config)
>  
> @@ -219,10 +225,21 @@ UBINIZE_ARGS ?= "-m 2048 -p 128KiB -s 512"
>          deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
>          link_name = get_bb_var('IMAGE_LINK_NAME', image_name)
>          for itype in img_types:
> -            image_path = os.path.join(deploy_dir_image, "%s.%s" % (link_name, itype))
> -            # check if result image is in deploy directory
> -            self.assertTrue(os.path.exists(image_path),
> -                            "%s image %s doesn't exist" % (itype, image_path))
> +            if itype == 'multiubi':
> +                # For multiubi build we need to manage MULTIUBI_BUILD entry to append
> +                # specific name to IMAGE_LINK_NAME
> +                multiubi_build = get_bb_var('MULTIUBI_BUILD', image_name).split()
> +                for vname in multiubi_build:
> +                    image_path = os.path.join(deploy_dir_image, "%s_%s.ubifs" % (link_name, vname))
> +                    # check if result image is in deploy directory
> +                    self.assertTrue(os.path.exists(image_path),
> +                                    "%s image %s doesn't exist" % (itype, image_path))
> +            else:
> +                image_path = os.path.join(deploy_dir_image, "%s.%s" % (link_name, itype))
> +                # check if result image is in deploy directory
> +                self.assertTrue(os.path.exists(image_path),
> +                                "%s image %s doesn't exist" % (itype, image_path))
> +
>  
>      def test_useradd_static(self):
>          config = """
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178830): https://lists.openembedded.org/g/openembedded-core/message/178830
> Mute This Topic: https://lists.openembedded.org/mt/97731135/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

