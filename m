Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD1CC38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 14:09:13 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web09.8102.1666793343908656653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 07:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Od2zo8aj;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id x2so14402910edd.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 07:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6GvpS1KXx/wAHATvOSNz5XdYCW0ExS7QZZkQr3PWI8M=;
        b=Od2zo8ajecNNqnKoM8Zc2BtJKkYpo58/+bT2qew05a941u1Xvep1/0ExkBYrI7l3lO
         PZYKX6iizurtZ/79aQkV29IcN8JRYzALn4x8y7IMfr/zEh3hSCC/YFkF7HAaaB2f6XIm
         Gc+K2AnKEBmKi3CAMNsG1D7ESdVdQn4+FEAMmyg41K7YbDSUgR90S6bbuDO0u/n3K4W5
         Froh9aEYc9RPplr4wUP2Gb7N75PFO5ndZgQjGAEfY4wSDfF8qtVLcYDw+VtL4jxw6Nvi
         GIoTTPqBZF9sYFoFZqNQ2rJhfcRxAg974hN0mmrs34XzJ/vlZ7PekUNdU8pbI6HOu7CM
         +dww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6GvpS1KXx/wAHATvOSNz5XdYCW0ExS7QZZkQr3PWI8M=;
        b=iiF07tI9ygBMlOHFDBC/wF7bNHjppBpsPlQX8VQ8vyCzuj/mfNJ+TQmYkKH0YwPV8j
         PWjHheJalfdLZXL2x2hiCGYDCIH1sV66TK9NMeWZD7ZHetxL8O3AF5DilUyIf8ouc1mO
         bsZFT57WD3xg2TXdUdpMEgtKckdY7/Nhx7skGIjR8U0rQ1IDBvtebrR9XRDY/SJz2tnJ
         aRDt1zAA8zHu4gB6ddut5KPXkms/siA90Z7P9a4EF+Xp9aXKKktlaFVKFJ73C/3iF2tQ
         v2yKGoCUnUrpxl2U+Mwi86nSEQZ1wBMe1vAiHnH4OzXjDkHL+dEJWWt53v1B1U3MnB4w
         nOsg==
X-Gm-Message-State: ACrzQf0/woHDc0ujumxF8i4oZJZdfBR2LMf1L2eLoH99WyTBNwv3RZpW
	lJwwNiPiKk/cnd4g91cljQx/ayTjM6qNIAld5E5yA/kLB4U=
X-Google-Smtp-Source: AMsMyM5okdCPoBGx1iCAsHwiooa7aVD76aI8uBdeldBKuIS9ShQuOLHuk7ss8U1kCPeOdk6XTegb/VnfvJdzaac98Rs=
X-Received: by 2002:a50:cc07:0:b0:453:4427:a918 with SMTP id
 m7-20020a50cc07000000b004534427a918mr41247144edi.121.1666793342029; Wed, 26
 Oct 2022 07:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221021145311.52133-1-JPEWhacker@gmail.com>
In-Reply-To: <20221021145311.52133-1-JPEWhacker@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 26 Oct 2022 09:08:50 -0500
Message-ID: <CAJdd5GZL1=vn+f2nAbJAYFwUVHZ9C-Msq888jCxSpUUQX01_5g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] runqemu: Fix gl-es argument from causing other
 arguments to be ignored
To: openembedded-core@lists.openembedded.org
Cc: jon.mason@arm.com, Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 14:09:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172158

Steve,

Please backport this to kirkstone at your convenience.

Thanks

On Fri, Oct 21, 2022 at 9:53 AM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> The code to parse arguments was inadvertently skipping all arguments in
> the elif block after gl-es if it was specified on the command line.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  scripts/runqemu | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 983f7514c7..189fc3da91 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -497,7 +497,7 @@ class BaseConfig(object):
>                  self.gtk = True
>              elif arg == 'gl':
>                  self.gl = True
> -            elif 'gl-es' in sys.argv[1:]:
> +            elif arg == 'gl-es':
>                  self.gl_es = True
>              elif arg == 'egl-headless':
>                  self.egl_headless = True
> --
> 2.33.0
>

