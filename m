Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701F2E784AC
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 12:24:11 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.80114.1696249442408359902
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 05:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XRNIk1zw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-325e9cd483eso2696849f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 05:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696249441; x=1696854241; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YHG++QHIDXYjurFvp+5XqEnDRODzR/VoW0XqWAmCX0=;
        b=XRNIk1zwWCsqBm3RVWEyQge1bm6CrUDQ1G7G9rsdRYKsVuNPfhrQHJS146aXKa1vkX
         tCTGGtOjFlVKqQg4CMwvRX2fGFj+df/BivwSd1nxo5o12g5SoqOnaNDN58IYAVYvGgwl
         eQopIlLRTlG32S+N21LDYx2R7qYo0DSNkqrN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696249441; x=1696854241;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+YHG++QHIDXYjurFvp+5XqEnDRODzR/VoW0XqWAmCX0=;
        b=o1IeAEO4DrDpR9kHJx+D9ZKbCZqezmvn1daGvtzUeYvjZL/Hkb/irD+VeIABl2S7m6
         Ldp3q0JxgaowaR6Asv4lGX2+2SDa20ocvnOoPxJOs7JnF/wOrJwmrdXO1uCfzrj8k+NN
         ujqosmaqj1QChKiPg4l5sY2ChDwvYx6yupfu6rvHLTsJiIDzr7mrLkPCqITnv2S5QXVf
         VrTUvPZjBGC9FvXKb1uggv/eFGZOiTr9eBjEvhQkWFAisesbGvBVU8C3OSV8MmlEy2KD
         pvGzPPefiBHIgtzJzZGKHxWuJFETqmz3X4zf0ccy2DVZkmgBx6wztVdB8lUuklMhSDyF
         AjwA==
X-Gm-Message-State: AOJu0Yyyu8gfGx+1bGz8ITQ0Z+KCgX3Rjkchav7XChZT/tAYun386sX+
	p9T/opy7Mo/i9DK0rI2n/IS1vg==
X-Google-Smtp-Source: AGHT+IHpK0fyEHKhe9+P7W6JpXNDjTErsdINFY0hSY1wKd4AzZ8P72jGXHp6gPZkrNRFZKXCCRGySg==
X-Received: by 2002:a5d:5902:0:b0:324:7a6b:d503 with SMTP id v2-20020a5d5902000000b003247a6bd503mr10026336wrd.11.1696249440742;
        Mon, 02 Oct 2023 05:24:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:56f3:dc47:6cbe:b39e? ([2001:8b0:aba:5f3c:56f3:dc47:6cbe:b39e])
        by smtp.gmail.com with ESMTPSA id x13-20020a1c7c0d000000b0040472ad9a3dsm7098931wmc.14.2023.10.02.05.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 05:24:00 -0700 (PDT)
Message-ID: <24e9ad263e69414d450bdaaede58b994a271b015.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] wic: bootimg-partition: Allow root
 placeholder in custom config
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel Semkowicz <dse@thaumatec.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 02 Oct 2023 13:23:59 +0100
In-Reply-To: <20231002121936.133895-1-dse@thaumatec.com>
References: <20231002121936.133895-1-dse@thaumatec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 12:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188604

On Mon, 2023-10-02 at 14:19 +0200, Daniel Semkowicz wrote:
> Allow using `<<uuid-of-rootfs>>` placeholder in the custom configuration
> file. This placeholder is then replaced with the actual UUID of the
> root partition, generated during do_image_wic().
>=20
> This allows making use of dynamically generated partition UUID instead
> of hard-coding it in the WKS file.
>=20
> For consistency, the same root device placeholder tag was used
> as in the `fs-uuid.bbclass`.
>=20
> Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
> ---
>  scripts/lib/wic/engine.py                           | 10 ++++++++++
>  scripts/lib/wic/plugins/source/bootimg-partition.py |  4 ++--
>  2 files changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
> index 674ccfc244..c68e5adacb 100644
> --- a/scripts/lib/wic/engine.py
> +++ b/scripts/lib/wic/engine.py
> @@ -626,3 +626,13 @@ def get_custom_config(boot_file):
>          with open(cfg_file, "r") as f:
>              config =3D f.read()
>          return config
> +
> +def configure_custom_config(config, creator):
> +    """
> +    Replace placeholders in the configuration file with the actual value=
s.
> +    Does nothing if no placeholder is found.
> +    """
> +    rootdev_placeholder =3D '<<uuid-of-rootfs>>'
> +    if rootdev_placeholder in config:
> +        config =3D config.replace(rootdev_placeholder, creator.rootdev)
> +    return config
> diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/script=
s/lib/wic/plugins/source/bootimg-partition.py
> index 58f6da72c3..969f99476b 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-partition.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
> @@ -19,7 +19,7 @@ import re
>  from glob import glob
> =20
>  from wic import WicError
> -from wic.engine import get_custom_config
> +from wic.engine import get_custom_config, configure_custom_config
>  from wic.pluginbase import SourcePlugin
>  from wic.misc import exec_cmd, get_bitbake_var
> =20
> @@ -110,7 +110,7 @@ class BootimgPartitionPlugin(SourcePlugin):
>              custom_cfg =3D get_custom_config(configfile)
>              if custom_cfg:
>                  # Use a custom configuration for extlinux.conf
> -                extlinux_conf =3D custom_cfg
> +                extlinux_conf =3D configure_custom_config(custom_cfg, cr=
)
>                  logger.debug("Using custom configuration file "
>                               "%s for extlinux.conf", configfile)
>              else:

Do we need to add a test case to "oe-selftest -r wic" for this?

Cheers,

Richard

