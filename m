Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web09.15654.1612078107959537433
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Jan 2021 23:28:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kHDn1raI;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 2so6702571qvd.0
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Jan 2021 23:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aanCEjfoXI/Ml8WsfbP3UlaaeB40U/4tRwNexI2UJwA=;
        b=kHDn1raItVBdmypogBlfxhdb+lwDQpFX+UlKYl2PQ43elLFMtrPd7G6C1u6qH+jf0O
         uU+GPJ7R8ko0AZLMd42XbJn9eeDaSs/kNYZ2YacsglrC4WIe5+ckybaF1wbMsdDANjAz
         OTRfN8a6oDbU7jHbgSQinh09dqvgUE/D1ljyVjzjuNcoLU7Q9MDMouroVjipiEku5veO
         cO1mrTyWy/6AZDs7l8+ZCKv8M6/1rZ8TJqSzUfFK53MccNPRb/+Ra214A/faEdA2GgHV
         o0gx/GTyeJr4RQ/6kjjdy4RBJAXD47/NvI6XdmeU/UTir6dUZBY2iB766G0qGjltkDY7
         jNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aanCEjfoXI/Ml8WsfbP3UlaaeB40U/4tRwNexI2UJwA=;
        b=AQhFc1eenH7hefFxRSGhJzMlvk7Ge0CTgbnVZm0EDalBriQHy6C9XuuN22CNBFVUv0
         /2UxSbEUZh1hKINlq8w4t/Npedx1MCh2Z5IpXS+U2vmpVUsvVdcyvmVSxDV4Dye/wgL3
         YnqXKaNxE7sMKsomLPpfVKhrh7eZE0YZISyMRR5yOr6g5uszWPIrNqqCl/Z8INyuXCq0
         dcJznlfs30mIK5TSO/npmQwWN5Z5dSafmchu8OVLbz4W9BwBedkdi+QA/o6BgWnOSaIz
         SeaJ5IDjd5Nwi03J2MQijJNzNeHMArDWIA8tebYNfqDdnGF9oUe7gah47omkBogHgZV1
         i5ig==
X-Gm-Message-State: AOAM530XCbvz7D8NOW06A3XArl0uYKxzxLb8ghJ81cUn6GKZZWGC7R8T
	/esj0urJipls3AyG55hW5fkg/L6RufvnAEsosjA=
X-Google-Smtp-Source: ABdhPJzPiLuhEv6KWPMMn1L2igjdkv32W5gZDz4CFXgsK9+sQUbkajoyKjoueTWPW4pnilV1QQr2kzRocvPeWHelezU=
X-Received: by 2002:a0c:c688:: with SMTP id d8mr10914037qvj.8.1612078107044;
 Sat, 30 Jan 2021 23:28:27 -0800 (PST)
MIME-Version: 1.0
References: <20210130071954.2695419-1-raj.khem@gmail.com> <dd06d0409cccb1a4bd6728a8b16e8e46b6fbc115.camel@linuxfoundation.org>
In-Reply-To: <dd06d0409cccb1a4bd6728a8b16e8e46b6fbc115.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 30 Jan 2021 23:28:00 -0800
Message-ID: <CAMKF1sq7Qaw5VOkTRRo4c7=QkjG-uuSRfoV=16FVKvXBXiAz=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] binutils: Upgrade to 2.36 release
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, Jon Mason <Jon.Mason@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 30, 2021 at 9:17 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2021-01-29 at 23:19 -0800, Khem Raj wrote:
> > Drop backported patches which are already present in 2.36 release
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Failed in testing:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1806
>
> Looks to be at least two issues, the 5.10 kernel doesn't build with it
> and maybe that nativesdk-binutils also has the parallel make race?
>

Thanks for trying it out. you are right about nativesdk race and I
have fixed it locally and will be in v2
the 5.10 kernel issue seems dicey

make[3]: *** [/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work-shared/qemux86-64/kernel-source/scripts/Makefile.build:279:
kernel/entry/common.o] Segmentation fault (core dumped)
make[3]: *** Deleting file 'kernel/entry/common.o'

make[4]: *** [/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work-shared/qemux86-64/kernel-source/scripts/Makefile.build:279:
arch/x86/kernel/apic/apic.o] Segmentation fault (core dumped)
make[4]: *** Deleting file 'arch/x86/kernel/apic/apic.o'

I wonder if we can find which binary is causing the segfault. Is it
assembler or make or something else.

> Cheers,
>
> Richard
>
>
>
