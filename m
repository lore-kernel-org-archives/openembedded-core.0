Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6B4CA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 18:37:09 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.3057.1757443029552282541
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 11:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gtAWEI8k;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4b61161c32eso27486241cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 11:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757443028; x=1758047828; darn=lists.openembedded.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjDTpOpvpGmif7x8rlax04GfE9tK5vvMCSp3HXUBBzM=;
        b=gtAWEI8k0DxIltCzZDh0YqyZ6Pk2WX5aHa5KX8AxoMJC9Dm4i1chB+KZZ3TtdyOCe2
         fnouNbDIL4t/8agTtHY4lmOnuKCQf1M3YSR1okN2MD/VpgEE2yzu4wdvFGad6VAsYmFk
         m5vQhM2v1FTvDms8X/GH+JC1bkF5URP2wbioeqM7SHO5DXYQLt+Q6ba/w+U84k49PAwD
         VEywf2B6iilItLJDapJvmmq2N+pyq8NK2s9zEHvndU0SdDRBxvusc/R2dHzPihbIpEXo
         1EBXT4lhy/BxrwqkqU+KVDCboQQCW41syC0X4nST6xB22wsKdI5hW/q0BdAnjSX0IVPl
         3GGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757443028; x=1758047828;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjDTpOpvpGmif7x8rlax04GfE9tK5vvMCSp3HXUBBzM=;
        b=kyLqewZoL0MPEVlqtx22SU6aK1HHpjL/HakXjKWsN5DjAV7Eg3wspwuBqwHcgKQQCM
         V2g5Z7rGlUbHv33rA9VwVBOhtEtMzJFhj9SuUbgB/ihaj+PJiUxCZHm528QI+4vyQbIV
         Dixh9strze7MD6zbnyFnrgZAu9ad709CuXk5P38W9sSKVj1AMhPZJ/oTGsxcOx76keKg
         hAQL2O/X7lNWe0K9gNY0J2QhsCIpfVSjYxrwvq/5b9sxKWMIJbHED0w3ITzWcH7hm4LS
         75FLQr4QGAKBD+mVidxmjIRiqTbBLXSQXvwzIa8qWdsuGSyykKXR2f7wG94GGk9mx4WE
         QDcg==
X-Forwarded-Encrypted: i=1; AJvYcCU/iRXPi8lKNubskbpSmeXjUMFeUHCQ+W8urS7ZdmDnXjTPMp9Mztji+jta8hu+qT9nigxvIl8qY7lQAHU/b25tqg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxDlQldscqTF9JT6wH1Q+l5INA9G8AYUds9odFg5RwkWh1PCtGI
	a2FGguGpwkdNVduc+QkzjnDDE3eDjuYIaLMGzyKGAbU4WovHZfPlITIq
X-Gm-Gg: ASbGncvCRmKaQQHzn12x2drL5Fi8EhJvrd/kwOaH6mEUD1KMpzpFQLMcqivrjfnmorK
	ZRRBbJ/1HQ3I8sWeUXrAunbBaDnT6cKfmXbWLjOSacXFN7Z29I6hipSK80LZLb1iWl2VA2GeDth
	RTiIDmbIzwtNUH34Zfe5S7ndptV1Z5/TaUjX+FSc7neU8mZjR8XIaKY1O1GXRW70iTLMWWdZ3G/
	6HxmyVQAuRgh8kw09/vgvenGijKpi/LE1fChOw2voKWeHYbbhLmrJAxHaLrt9wXb+VlrfloKuhO
	yPGjHnHluHHSLouZr7yyDqZzqOJKkfzdOxnKVuaxzGLd4vV/D2SI50tUI+XEQ7xJbR+WOazVnAd
	Su6BE0APiCwlntaLeUjHbGzJpx2OyEfaboTvpD5LxZ0diEBYuJw==
X-Google-Smtp-Source: AGHT+IGMCajUeKfizOJqQVhFcl1eyNryyRosP0pVqpt+CWNHfoSvyCOR9Y77TGZq2rzojscDhZz6EA==
X-Received: by 2002:ac8:5754:0:b0:4b5:f621:2e0 with SMTP id d75a77b69052e-4b5f848885bmr159081631cf.71.1757443028503;
        Tue, 09 Sep 2025 11:37:08 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-72925b87571sm109876006d6.6.2025.09.09.11.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:37:07 -0700 (PDT)
Date: Tue, 9 Sep 2025 14:37:04 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: macpaul.lin@mediatek.com
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexander Kanavin <alex@linutronix.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>,
	Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [OE-core] [PATCH] wic: Add sector size support to WIC partition
 and bootimg_efi plugin for UFS
Message-ID: <20250909183704.GA1381@localhost>
References: <20250909134117.2219965-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250909134117.2219965-1-macpaul.lin@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 18:37:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223131

On Tue 2025-09-09 @ 09:41:17 PM, Macpaul Lin via lists.openembedded.org wrote:
> Introduce --sector-size argument to ksparse.py and propagate sector_size
> to partition objects. Update bootimg_efi plugin to validate sector size
> and pass it to mkdosfs, enabling creation of EFI system partitions with
> variable sector sizes. This change is required to support UFS storage.

For which branch is this patch?

Doesn't master already have sector-size support in:
oe-core: 2255f28b579b ("wic: add WIC_SECTOR_SIZE variable")

> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  scripts/lib/wic/help.py                       |  6 ++++++
>  scripts/lib/wic/ksparser.py                   |  1 +
>  scripts/lib/wic/partition.py                  |  1 +
>  scripts/lib/wic/plugins/source/bootimg_efi.py | 18 ++++++++++++++++--
>  4 files changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> index 6b49a67de938..35347b2df8ad 100644
> --- a/scripts/lib/wic/help.py
> +++ b/scripts/lib/wic/help.py
> @@ -885,6 +885,12 @@ DESCRIPTION
>                         is larger than --fixed-size and error will be
>                         raised when assembling disk image.
>  
> +         --sector-size: The sector size in bytes. The value must be an
> +                        integer and one of 512, 1024, or 4096. The
> +                        default is 512. This enables a variable sector
> +                        size for EFI partitions, which is supported on
> +                        devices such as eMMC and UFS storages.
> +
>           --source: This option is a wic-specific option that names the
>                     source of the data that will populate the
>                     partition.  The most common value for this option
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 705f98975084..0bfdabe1bf22 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -182,6 +182,7 @@ class KickStart():
>          sizeexcl.add_argument('--size', type=sizetype("M"), default=0)
>          sizeexcl.add_argument('--fixed-size', type=sizetype("M"), default=0)
>  
> +        part.add_argument('--sector-size', type=int, default=512)
>          part.add_argument('--source')
>          part.add_argument('--sourceparams')
>          part.add_argument('--system-id', type=systemidtype)
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index 0c9b1a5b9620..d64b2e731f5b 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -49,6 +49,7 @@ class Partition():
>          self.rootfs_dir = args.rootfs_dir
>          self.size = args.size
>          self.fixed_size = args.fixed_size
> +        self.sector_size = args.sector_size
>          self.source = args.source
>          self.sourceparams = args.sourceparams
>          self.system_id = args.system_id
> diff --git a/scripts/lib/wic/plugins/source/bootimg_efi.py b/scripts/lib/wic/plugins/source/bootimg_efi.py
> index cf16705a285a..a1b00d91bf53 100644
> --- a/scripts/lib/wic/plugins/source/bootimg_efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg_efi.py
> @@ -415,8 +415,22 @@ class BootimgEFIPlugin(SourcePlugin):
>  
>          label = part.label if part.label else "ESP"
>  
> -        dosfs_cmd = "mkdosfs -v -n %s -i %s -C %s %d" % \
> -                    (label, part.fsuuid, bootimg, blocks)
> +        # Validate part.fixed_size
> +        if part.sector_size not in (512, 1024, 4096):
> +            logger.debug("Invalid '--sector-size' specified (%s). " \
> +                         "Allowed values are 512, 1024, or 4096. " \
> +                         "Setting to default 512.",
> +                         part.sector_size)
> +            part.sector_size = 512
> +
> +        # Support variable sector size
> +        # mkdosfs -C expects number of blocks, which is (size in bytes) // sector_size
> +        size_bytes = blocks * 1024
> +        blocks = size_bytes // part.sector_size
> +
> +        dosfs_cmd = "mkdosfs -n %s -i %s -C %s %d -S %d" % \
> +                    (label, part.fsuuid, bootimg, blocks, part.sector_size)
> +

If you want to do sanity testing of supplied values that should be done early
in the front-end part of wic, not in the back-end plugins. Otherwise every
plugin will need to perform this same check (unless you're suggesting
different plugins should allow different sets of values?).

>          exec_native_cmd(dosfs_cmd, native_sysroot)
>          logger.debug("mkdosfs:\n%s" % (str(out)))
>  
> -- 
> 2.45.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223111): https://lists.openembedded.org/g/openembedded-core/message/223111
> Mute This Topic: https://lists.openembedded.org/mt/115150315/900817
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [twoerner@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


