Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D27CD11C2
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 12:38:17 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.10170.1712320691218997132
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Apr 2024 05:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hwsyqk8l;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-343f1957ffcso254947f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Apr 2024 05:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712320689; x=1712925489; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZE1FxsDGRRnguw5DKK7kfzfk9TikvGPADpfm7NY2Bc=;
        b=hwsyqk8ldaOn7NP7oZnviYVJ6VBa+fIilmstbIWSr/8jXeKj1TlY/9KqWFd+2EgB3X
         mAY8DRwUAMbtlDs6GMhYUv1xbcikCXJRQAScjbyewFz7TgNvogGC4zMto5ygZdOL+cEZ
         zCDqcC7adwgMTTUL+68+RZ9BIEQj7uh/ZawlbQouI/6sa60UZEfjvoBmhpBmgJhW/nwW
         CNa0twyGvZjTsngzVa3uryLsZo33MBAHajSq/LKsXZXGKvyiq0loSS0nrBSmVptZ7eAF
         /iM3dK1o2xS2gc2jAC80MU6+8/4DofnrUhafN8aEnNsOk0hcdtyVSlav+6IWZlgzkoJO
         07cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712320690; x=1712925490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZE1FxsDGRRnguw5DKK7kfzfk9TikvGPADpfm7NY2Bc=;
        b=wZgIQwvS5oAVWvmhwJtABGrfu0mqPdKzq9Eaykf52UA4WvR3X3S5kS+QJVt43CrI7q
         KsWTL1Wisqo/ocAAav7/vg3YUcruOcGcngZ/NLFZDQ5rJfV8Zz+b5BIng4vZRr8aqxtq
         bPtbBrcUiPGMFBuakUrn28lT+24h6+0OMSHIfGJ1CggqKsm3RsGb82XKOtmmVVVkZv+T
         RDjSncAd15FHPAPD/WCIeFmATv2KlGXG8ttTD8rGaJI2PQfu+yCONbjN4juB/i1OzT7h
         oReoYjf1ybpJxfseUzzT1tRN6JF6clLfNnFJF58bxkjMIGfqFtUMY1WY9WXv61ZCFEUt
         OQ8A==
X-Forwarded-Encrypted: i=1; AJvYcCXbLV8ZcIAsFlke1UPCJJ1CIKYzwn9oBslhxWyoR7/hMDaomcXZE+Rm/933PcUdBNKKiEtNOkcr9NKoEzMZDI8BMa9GSREIXaG/yNgVuXAxHl6U7/vzVbeI
X-Gm-Message-State: AOJu0YzLzmzdM4ZLVgUsoN2vo5jsPwKS00cCZreAPWV7iBTV69C2OXP7
	QgTlsrjPGSZo23z5jHJ95jEtBk4GvDrjsGp847+GUg3dQvjCCOZirVLcxzD3XJG+X9ddy/hOhlo
	DUbVEIm6SVkUemW3v93iI68vNY28=
X-Google-Smtp-Source: AGHT+IFqwIvG430P68Wo2TtKe4qN4qKI+KYwhoMzzsvhQdQoNjNClsCmRc3kPEb6fGSADqg1FB1kn03FMF/ynRhDgy0=
X-Received: by 2002:a05:6000:e09:b0:343:dd9b:76de with SMTP id
 dx9-20020a0560000e0900b00343dd9b76demr1734616wrb.0.1712320689406; Fri, 05 Apr
 2024 05:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240404204702.3380236-1-bruce.ashfield@gmail.com> <20240404204702.3380236-2-bruce.ashfield@gmail.com>
In-Reply-To: <20240404204702.3380236-2-bruce.ashfield@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Fri, 5 Apr 2024 14:37:58 +0200
Message-ID: <CAEHkU3WEdLDW=cOxWkp8vjBbmsGa_b8Q3XZwSpEYkxywdWq4NQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2][RFC] perf: make bpf asm include arch conditional
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Apr 2024 12:38:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197984

Hi Bruce

Thanks for working on this.

On Thu, Apr 4, 2024 at 10:47=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> To keep the perf source copying as small as possible, we can
> further refine the arch/uapi copy to the single file that we
> currently need.

With that design goal in mind I would go with this solution,
Tested for an aarch64 target, 6.9-rc2 builds perf for me while before
this series it failed.

>
> To avoid a warning from the general perf source copy routine,
> we make the .h conditional based on the architecture.
>
> The supported architectures will not change often, so updating
> this arch list is very minimal effort. Alternatively, we could
> add a PERF_OPTIONAL_SRC variable and not warn if a file isn't
> available for a given architecture.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>
> This is a further refinement of the perf header that
> is required outside of tools.
>
> I'm trying it this way first, versus making the perf
> source copy not warn on missing files, since we risk
> skipping warnings we want to see!
>
> Bruce
>
>  meta/recipes-kernel/perf/perf.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
> index 2f540cd54b..3cc7f63610 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -129,7 +129,9 @@ EXTRA_OEMAKE +=3D "\
>  # honour a JOBS variable.
>  EXTRA_OEMAKE:append:task-configure =3D " JOBS=3D1"
>
> -# include/uapi/asm is for: include/uapi/asm/bpf_perf_event.h
> +# the architectures that need this file can be found in
> +# ./tools/include/uapi/asm/bpf_perf_event.h
> +PERF_BPF_EVENT_SRC ?=3D '${@bb.utils.contains_any("ARCH", [ "riscv", "ar=
m64", "powerpc" ], "arch/${ARCH}/include/uapi/asm/bpf_perf_event.h", "", d)=
}'

s/powerpc/loongarch/
If I get it right from tools/include/uapi/asm/bpf_perf_event.h powerpc
is not needed. (I didn't test)
However "loongarch" does and seems to be supported in OE.

Cheers
Max

>  PERF_SRC ?=3D "Makefile \
>               tools/arch \
>               tools/build \
> @@ -140,7 +142,7 @@ PERF_SRC ?=3D "Makefile \
>               tools/scripts \
>               scripts/ \
>               arch/arm64/tools \
> -             arch/${ARCH}/include/uapi/asm/ \
> +             ${PERF_BPF_EVENT_SRC} \
>               arch/${ARCH}/Makefile \
>  "
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197973): https://lists.openembedded.org/g/openembedde=
d-core/message/197973
> Mute This Topic: https://lists.openembedded.org/mt/105337225/3617484
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
x.oss.09@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

