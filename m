Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web08.13054.1611071659057053664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 07:54:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Age14TLe;
 spf=pass (domain: konsulko.com, ip: 209.85.210.43, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f43.google.com with SMTP id v1so2146697ott.10
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 07:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T/bJ1RSuTkCaNprctsUd1G3w+V/olOh1d43rUz1lgOY=;
        b=Age14TLepBbFU64HJHp7ZRGYTFpqMGbY9JDJP7tLdHFPTM3RkEmMADtuRT6E3JoAEX
         qmYOJ4Jnv2sIfjaHdgd4pGnxm6+ZCVlCuZjCdJJyYjr4q6CocVrqz6PEmo1t+2aIWJDQ
         g4ba0gX+4McIN7zR39pkwcLf4iMlYorWbMiS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T/bJ1RSuTkCaNprctsUd1G3w+V/olOh1d43rUz1lgOY=;
        b=RYHuNN4g2nWYgw2NID1zU9Jph2mu65RagJV5efKqaSvuDuWV25GweODuiRbJKaXgh1
         ZZuTMdl1pD+qcvuDMG9UFVPYmIk2F/RXUU9GrzI0siAmOVR51ehlvgWyQkaXhnebk2CO
         Wa/r6Bxl4fGUhsDJ73WsOnSPjG2mBkUF06WKPy7BFvNzrnbuY8uhT6ZFJEs57k22sL1i
         EwGpKKLoYOx4vCb76tAeNKx9kcYzEN+YiMoF0xdDIQJ/l6DBfLgvtoGcqRRrq3g/bgi6
         fTV4KhXdvYiysRo9G6GCTqdQw9mz+cijX6JSi4jbp2JxK8nCXHs4cvf2GeCsCJuO3WkV
         J3bg==
X-Gm-Message-State: AOAM531l8P019FXN791QHQ6sF8f53Iu7u5uhSyI46xTQU4GCU5hRfoxb
	97ek/RVBsmeYfyBfp4GygY0on3ZBoAvGt2egw7U/ng==
X-Google-Smtp-Source: ABdhPJyeL71JVZIduzh3Si9rQ4dJxgjxws9+PktmF1oDI8WdGpXPIkiKy8cstQKX5bBkyOMq7hsVX6tTlqpe75W/Iqk=
X-Received: by 2002:a9d:2f08:: with SMTP id h8mr3829362otb.258.1611071658479;
 Tue, 19 Jan 2021 07:54:18 -0800 (PST)
MIME-Version: 1.0
References: <20210119155325.351554-1-tomasz.dziendzielski@gmail.com>
In-Reply-To: <20210119155325.351554-1-tomasz.dziendzielski@gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 19 Jan 2021 15:54:08 +0000
Message-ID: <CAM9ZRVtdsL=v4mbUWT-tVqJyC5US4+cNK7Lfm=YAKLbz9ip3VA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] devtool: Fix source extraction for gcc shared source
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Jan 2021 at 15:51, Tomasz Dziendzielski
<tomasz.dziendzielski@gmail.com> wrote:
>
> If do_patch task is disabled then prepare do_configure dependencies to
> fetch external sources and create symlink to ${S} in devtool workspace.
>
> [YOCTO #13036]
>
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> ---
>  .../gcc/gcc-shared-source.inc                 |  1 +
>  scripts/lib/devtool/standard.py               | 30 ++++++++++++++++---
>  2 files changed, 27 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recipes-devtools/gcc/gcc-shared-source.inc
> index aac4b49313..9ef80f2074 100644
> --- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
> +++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
> @@ -2,6 +2,7 @@ do_fetch() {
>         :
>  }
>  do_fetch[noexec] = "1"
> +do_patch[noexec] = "1"

Have you tested whether the archiver class is still working after this
change? If not it'd be helpful to run `oe-selftest -r archiver` to
check.

-- 
Paul Barker
Konsulko Group
