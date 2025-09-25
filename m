Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C698ACAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 08:23:17 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.6335.1758788589948836727
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 01:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ColUZFUv;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-7e3148a8928so4674046d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 01:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758788589; x=1759393389; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DjFRJ5WpU5Jbov+0Ol57AbIuigNanruubw0ndHurItU=;
        b=ColUZFUvItJPj4cxAD3V2JvN99+MKzEiOMqh929vGwRPnOXYrFUeNZ0XookLkV/sQp
         v+d0M2LOENVrsdtyL7Ids3YbfyTrBAm8fmzBnLmTFqZ9YUKMbD8Bs15HUSmfPnV5FY85
         AIRkiUtEPlIF1ZBtNVLz2nMMh1ZBxvXcvhpPe0Aq84p1GEkjl2sQloPltyVVGSox/GwT
         zfuy9uvgv/te399IUsFmu4pF+fXlfw5/7qgdS961PZaics31XpRiDIPALAX4FmCsEcmA
         VLb1LyMUHS4vYHyaWjbP0627gPiJ3rshcQ0Ll8j0GoM2KZQH5AZ+f8qYIge+YmESCqDE
         eDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758788589; x=1759393389;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjFRJ5WpU5Jbov+0Ol57AbIuigNanruubw0ndHurItU=;
        b=a7H5Pr7trifUlZw2run3S3fASLH1E7IZUfV6d7w4dlMCy9qVPeDhxb4bZNm7Ca846D
         wX3swspdfHEtPojFgITWRCVLKMtHQUHgQZSISAZuMVRhEBMMc2+axhaKXNRreDNNf/08
         C7WNg+hsGbVS1jDTGeK4cTWzRBqYNt86pvRICz31JY8GNddEOExzSBfM7uUr4J4MuJtX
         5P1PPhVVqDGllITBgX/A2WFY6hf2B4kocuyifUQGa1r9fpE5xX4ao8175ivH4t+mgQQL
         tNgtHDzAoeikKYCp/O0p4jW9vNHJ+/f9i4fOmUnN5PX0Je3iA4jpnSctsdHtF10UiALk
         XllQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqkyyh6PFx7tm0dsz5KHcdyvL8xF/MmIpUmGnOzU09lUW8QKZeSxxeJ0vRRJrbmRofITZ8XVSUlD2wXOcvW8jSRw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx2tRbPF1hdDM7Yzpq43dqpsMZdJTn4NvS7LNgutXmH9bfQukLs
	X/fe216GhQ5rnYG52l+tntGfLpV3hlcvQscbd8D+8TioTNH8q+fHFWbjviShdr9Zee3VZyadajW
	DXWBzGFVI1ziFuXDfulv1PedJTjrJPaw=
X-Gm-Gg: ASbGncuqk2rnpjnP8TxiBZ+VbDy4p5okdQEUL6Svzpn9k7RyqVeU2UJN4doxXmJo6+g
	ZIwfQNUC7Ll0OishyjAtOY9AD1e/M/vo74QIlOG9kl8ET3hBlICk6n1vBPmK1ceiMR7CqdUg9Uu
	b4RzRgrMhglIotBP9G30MPlfT+UMxk3S2xpE1yBvwV56y90CDmL3eGZFnb9tucDbJaSh9tioQkb
	Ve515gaTdGEt5SM3H9UKe9EQBysKalg+gAd+CC/0nxA+AU0pyMFR5OUUl/G1XvftYz5T3HzEgp5
	/npQMW4q2nTf3trtkTRX0zmmTQSpisyDwPuLwQ5na3XWd5/dDxE=
X-Google-Smtp-Source: AGHT+IFWUhLgKu6lOiDbRrbtxQGQq6zKa6BbNH5l2/2Ud3wjY0yJCAOq/dIO5u+2rQ3cvJuO/OcOluN+YVKOAqPPqgw=
X-Received: by 2002:a05:6214:c65:b0:809:19ab:599f with SMTP id
 6a1803df08f44-80919ab5c3dmr7364976d6.27.1758788588887; Thu, 25 Sep 2025
 01:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250925072203.3490596-1-pierre-loup.gosse@smile.fr>
 <20250925072203.3490596-2-pierre-loup.gosse@smile.fr> <CAMSfU+4LjK0K9Mh20oJxhTvW8Dw87nriJakCwQiFfr_T6TSLOg@mail.gmail.com>
In-Reply-To: <CAMSfU+4LjK0K9Mh20oJxhTvW8Dw87nriJakCwQiFfr_T6TSLOg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 25 Sep 2025 10:22:58 +0200
X-Gm-Features: AS18NWAvBGuXKMaN4ZNXotGDO5HT0FlcchNC00xBkLSbxR0lh0fqFVKH20eBL2A
Message-ID: <CANNYZj9PfFUcESHwT_6-CzDw8QB30hva_o5V2gVX5uB+LjaOng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/1] wic: extra partition plugin
To: yoann.congal@smile.fr
Cc: pierre-loup.gosse@smile.fr, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 08:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224005

On Thu, 25 Sept 2025 at 09:56, Yoann Congal via lists.openembedded.org
<yoann.congal=smile.fr@lists.openembedded.org> wrote:

>> The extra_partition plugin allows populating an extra partition with
>> files listed in the new IMAGE_EXTRA_FILES variable. The implementation
>> is similar to the bootimg_partition plugin.
>>
>> This plugin provides an easy way to install files that are not part of
>> the rootfs.
>>
>> Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>> Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
>
>
> To confirm, I indeed did review it internally.

I don't object to the plugin, but this looks like a very common use
case. How have people been handling it up to now? I'm sure I saw
builds and products with such 'extra' partitions, but I can't for the
life of me remember how those were configured. Did they all write
custom wic plugins for themselves?

Alex

