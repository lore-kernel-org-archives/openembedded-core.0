Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web08.9718.1606323755763966501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 09:02:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZeaSDB1K;
 spf=pass (domain: konsulko.com, ip: 209.85.167.193, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f193.google.com with SMTP id f11so3572989oij.6
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2020 09:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fu5uhmi2AJujTxwfkOSJ2hztgj1U0zKX8JNZl9IBwXY=;
        b=ZeaSDB1KFDY8pQt7Wtrtikqg3rBTcnJoRTiq9NgRUSz90vMVU1Fxtri+s0+Bavb8Aj
         UlAwNBpyH9VF0ECs86zFO9F+0nKmGzo50PJqG87K6U75qqDe0EkInAYh+bTf0Kw2p5rx
         DkwX3bFWxnqn+7oaREmfPTS/j4/c/AylLeXbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fu5uhmi2AJujTxwfkOSJ2hztgj1U0zKX8JNZl9IBwXY=;
        b=V4ATtSnTVBBOTwbnPc5c3XwTrYZAerBi/48h/1m9eprf6G409RSpFM0dXzf763WiRg
         5Sg3u0Zw+mP7jgZ+R+QHafHMqSwAUftncKTNXtIftmsbI4XvQVTYc1l9Yar8l5FwpB3I
         eJaIb3b8umzyOjNBeI4/92a7hsiDL/TvehCleAiDUUa5rEAEzxq11ajij/eGWilJLQYs
         P8goTTjV6uozpAe1Bj85vjjTBJnuTozdWRI+6iq8nWe0XBeBiOQjT+grmk9KNnrmuVjK
         y0EdIM3IyyHsuUbKbv7FPzBfVvEq+KIxTEi19Tkca+9qvyVlfdg+xZssaiLc94rDRmes
         Iv7A==
X-Gm-Message-State: AOAM531YwL9t7C/VVeQWwNlZMchijtm9ecjEYMeyfxc0Kv2YZwzPkmOT
	XHZFpgY4AZW6TqtjjksPk6lZQZT9uvvH/GunVX++JA==
X-Google-Smtp-Source: ABdhPJwjKbbIenRKRejNoVegIHdLoEA4PuA4BlnOk48UsCeNEXL9JrCfJMD4HeXgr3xOcrQZISO47VvPkYS80wWKkQg=
X-Received: by 2002:aca:ebce:: with SMTP id j197mr2860864oih.6.1606323755026;
 Wed, 25 Nov 2020 09:02:35 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sqcyGMvvSGN0-iZ-pkgdFuZo-K_qVtqOYHXb3tFiM08-w@mail.gmail.com>
 <20201125165417.29781-1-andrej.valek@siemens.com>
In-Reply-To: <20201125165417.29781-1-andrej.valek@siemens.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Wed, 25 Nov 2020 17:02:24 +0000
Message-ID: <CAM9ZRVsZ8ZSytwqsYwixJ7cgh+GDX56xyQQvQj3XLHkzaawHAQ@mail.gmail.com>
Subject: Re: [yocto] [OE-core][PATCH] kernel-dummy: fix executing unexpected tasks
To: Andrej Valek <andrej.valek@siemens.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Nov 2020 at 16:56, Andrej Valek <andrej.valek@siemens.com> wrote:
>
> - refactor kernel dummy recipe
>  - remove unneeded COPYING.GPL file -> change license to close
>  - remove unneeded tasks (fetch, unpack, pack)
>  - do not run unneeded tasks, but keep deps (configure, compile, install)
>  - save files into sstate
>   - fix: ERROR: Task linux-dummy.do_fetch attempted to execute unexpectedly
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  meta/recipes-kernel/linux/linux-dummy.bb          |  28 +-
>  meta/recipes-kernel/linux/linux-dummy/COPYING.GPL | 339 ----------------------
>  2 files changed, 12 insertions(+), 355 deletions(-)
>  delete mode 100644 meta/recipes-kernel/linux/linux-dummy/COPYING.GPL
>
> diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
> index 62cf6f5ea6..e98a29d5c6 100644
> --- a/meta/recipes-kernel/linux/linux-dummy.bb
> +++ b/meta/recipes-kernel/linux/linux-dummy.bb
> @@ -4,11 +4,12 @@ provider for virtual/kernel to satisfy dependencies for situations \
>  where you wish to build the kernel externally from the build system."
>  SECTION = "kernel"
>
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
> +LICENSE = "CLOSED"

I don't think "CLOSED" is a good choice to use in the core metadata.
The usual way to handle recipes like this which don't require external
source code is to say that they have the same license as the core
metadata itself (MIT) and reference the license text in
"meta/COPYING.MIT". See for example
meta/recipes-bsp/formfactor/formfactor_0.0.bb.

Thanks,

-- 
Paul Barker
Konsulko Group
