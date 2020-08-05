Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web11.7898.1596636211244538299
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 07:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=Exl72N3e;
 spf=pass (domain: qtec.com, ip: 209.85.208.196, mailfrom: daniel@qtec.com)
Received: by mail-lj1-f196.google.com with SMTP id 185so37590777ljj.7
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 07:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y+n7jUxuDDvJuJSdT09L2kKr8jpbE+CMw0lRv6qDeEc=;
        b=Exl72N3ecKrprt8TRzOBR81CvDRDJlbbpmgzqeocRA2UHDiElGP+cfyQZxGKAYUPpx
         ZM3ypjBEhyzimb+lMw5XeFhbUBAsLyHsTmIhE+Zz5e1RxKAqttCkhCwWdvE0B3nji7Ko
         SYj22hh9LWmiVbFW4MGWEcC+xCydrl6PsIM+x9vmbwELeVFrySgGOr9nZ9ogwQwlm1Et
         1PbS0Gk/kkT81HLJxQuAN/5V6iFOzL+BBA3+/Zd1tZOOWyZyzwlVrtL0zS1x8Ku/E2d/
         DWYrf3HQABpqWZSd825NPpcz6hGgzWDJW221GzyVaawDvkvhPKkbBaHmuIrSCCFEK8J6
         +P9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y+n7jUxuDDvJuJSdT09L2kKr8jpbE+CMw0lRv6qDeEc=;
        b=a1OemT2JI0kzRKdw9i2hyQl/AIeCxlZ0gzZFe7avdZyvlS1ZaIFWMab5VxZNgDZzDm
         /GTF7wnV7hYcwBesBjgaFLS9rpp2nZQZjXJMkT5d3yG7RfbNmih0d3LJxmda+ETR/NlP
         wFHF29eiEWviHOUkcbhlFOehSUeUoJOlIYszwlKXIY+KbZH8TrC+sTDIvRSHv8xQrtev
         OhcVOQdpYpfebBK6GdvSG5d/1/X/vtEobo3o2+M8BuqPSOqGDt9dHK8NrQmJ9uiEEqXL
         45fJgJCUQZPJxFnNEQqeJSN8pDTmy0tZYyUmkJNd5sn7dmYpVVTB1kPituS3qSi/98eh
         TYfQ==
X-Gm-Message-State: AOAM533+MY5+/n/56NUcZjxMepbBO97mma2uKMmJ+MCxhzvYR+mc78S7
	+oBWZO4vwkJuigSljgBWIETpanqCloHsKSpIzct4Eg==
X-Google-Smtp-Source: ABdhPJyCx5KFXUd9QBMxMrvJqplmdnfdGbg5mn3/8rNWWf+jcKndXYFaXiGFJGwkar24IB/0duqip2IRp8ilgyUF89k=
X-Received: by 2002:a2e:87cd:: with SMTP id v13mr1657519ljj.180.1596636209428;
 Wed, 05 Aug 2020 07:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200805132224.616205-1-daniel@qtec.com> <41aab2e8335492a1e8aed97ee75219a3461504b0.camel@linuxfoundation.org>
In-Reply-To: <41aab2e8335492a1e8aed97ee75219a3461504b0.camel@linuxfoundation.org>
From: "Daniel Gomez" <daniel@qtec.com>
Date: Wed, 5 Aug 2020 16:03:17 +0200
Message-ID: <CAH1Ww+STONG=Qy08U9KLY+NanZ5rRjNTHY5rQdPkJYNnXjRKYw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] allarch: Fix wrong dependencies
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

On Wed, 5 Aug 2020 at 15:31, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2020-08-05 at 15:22 +0200, Daniel Gomez wrote:
> > In all these cases, allarch is used but the package dependencies are not
> > allarch. It generates a conflict when the same package is built for different
> > MACHINES at the same time.
> >
> > Here a build error for the ttf-ubuntu-font-family in a multiconfig enviroment:
>
> This is on the wrong mailing list. I also thought there was code
> somewhere to remove font dependencies from changing the task
> signatures?
Sorry! I mixed the lists.
>
> http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/layer.conf
>
> see the lines like:
>
> liberation-fonts->fontconfig \
> cantarell-fonts->fontconfig \
>
> Perhaps meta-oe has some of those missing?
I didn't notice about that SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS list and looks like
meta-oe already implements it so, what we actually need is to include
that recipe in our layer
conf.

On the other hand, I think the following recipes are missing the
inherit allarch:
meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb

And then, add the ttf-bitstream-vera recipe as part of the
SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.

Will send a patch to fix it.

Thanks!
>
> Cheers,
>
> Richard
>
