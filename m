Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A07C433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 15:32:47 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.11908.1664465564361263475
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 08:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=csRG5Ing;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id l8so1220055wmi.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 08:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=mJT1WKM1ZiiaWzqyE17UHciTNyjdrlcjd+46PVBD0ao=;
        b=csRG5Ingf1hkUbpATilY2+XB96SVHfCO4+quvZlNzThCWdhmjPAMqePNZYnfziGQB9
         zRXaefN0rAqLYv6TEm6tUSln4LrqtXL3i1Z7iBrcs5WYxuOVY2UbpU2C6RnoD2niFB/c
         vKib/YcG2txhJ6roLx2qUZy5KOt8unWIJbH9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=mJT1WKM1ZiiaWzqyE17UHciTNyjdrlcjd+46PVBD0ao=;
        b=raHJL7DbXnmCp9uPXm4t70RXjU8GkxIJQ4N7Euqc5FZNeAu3jz3Zhe9wbkR815oYmb
         qiiZe1Xz2Vwrq+cgTn5Ql5/FXMztMFVQnBaKDFPcgD8kjiQcqqzn82McohZTOeNTREwy
         kAXSc24rIabChSpeEIUbASaJOxINUYxRdux/zIX8ZJ5NjypI+VQatXYq65fvKp4M8+Ik
         9A9yxpzF+/qj1m+IqA9BlKQYC8e49yn+O9WgX/c71a3WrsZfEL7OX0A09kD479Bt9pxv
         dMh6ZUKLjUT2TpXZChfE+1qJdkrJ8LARyuxE6mtS+alPfcVOSPzuxJNgk9RyDFM8hn3h
         WE7w==
X-Gm-Message-State: ACrzQf0vDIqHqZ6JEC+3+YN/kXHeH/SoHhLic1rq7UvwhzqnrGVKxvEb
	8w7UBxzF1SRAvc2IZDSUucJtvw==
X-Google-Smtp-Source: 
 AMsMyM6DYD8l0M/UCgURReSKKZuCOMnH6EtnnUkzsQyijcDgzEPBynJAhbCTBLkWGzDq4osCJ4HRYQ==
X-Received: by 2002:a05:600c:1da8:b0:3b4:8fd6:5132 with SMTP id
 p40-20020a05600c1da800b003b48fd65132mr2800551wms.99.1664465562517;
        Thu, 29 Sep 2022 08:32:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6fd0:d3d3:fcc6:1fd6?
 ([2001:8b0:aba:5f3c:6fd0:d3d3:fcc6:1fd6])
        by smtp.gmail.com with ESMTPSA id
 bg14-20020a05600c3c8e00b003b341a2cfadsm4682712wmb.17.2022.09.29.08.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 08:32:41 -0700 (PDT)
Message-ID: 
 <f0eca98f9324c537e2aee3c655258f98372d7926.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH] wic-imager-direct.py: use fstab update also
 for root device
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com
Date: Thu, 29 Sep 2022 16:32:40 +0100
In-Reply-To: <20220929125750.3338743-1-f_l_k@t-online.de>
References: <20220929125750.3338743-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 15:32:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171192

On Thu, 2022-09-29 at 14:57 +0200, Markus Volk wrote:
> Remove the hardcoded root device entry from fstab when updating to
> avoid duplicate entries.
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  scripts/lib/wic/plugins/imager/direct.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/p=
lugins/imager/direct.py
> index da483daed5..fd86a094d9 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -117,7 +117,7 @@ class DirectPlugin(ImagerPlugin):
>          updated =3D False
>          for part in self.parts:
>              if not part.realnum or not part.mountpoint \
> -               or part.mountpoint =3D=3D "/" or not part.mountpoint.star=
tswith('/'):
> +               or not part.mountpoint.startswith('/'):
>                  continue
> =20
>              if part.use_uuid:
> @@ -145,6 +145,11 @@ class DirectPlugin(ImagerPlugin):
>              fstab_lines.append(line)
>              updated =3D True
> =20
> +        for line in fstab_lines:
> +            if '/dev/root' in line:
> +                fstab_lines.remove(line)
> +                updated =3D True
> +

Do we need to worry here about whether we're actually adding a new root
entry? Is there a case it does need to be preserved?

Cheers,

Richard




