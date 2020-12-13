Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web09.13584.1607826624558876733
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Dec 2020 18:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GtvSVqPL;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id 19so12517139qkm.8
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Dec 2020 18:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vjHwq+euS6sHbpKqxaoWMT9omt1xcV6vs7KU/CCsLa0=;
        b=GtvSVqPLiq+9xvJyiKErnWux39ogh2BON5xAO/agWPthHT6pyF1TerA5DiKFKuMwgw
         fdm6eL/AgE+LTediaQUClZeVyCWGi1U3wXvPuAZsc8DsHwg3mF1Y5Yd+QptvPhHQNrpy
         oWnhmIdFn9MwCW4ZjYpp2veiZC38kwDUPGBf9PL6yZ+5Q8teVIBTPovXzVsxsWraE+SP
         xJz9FbrpDmYj/XF2lnwXWTPoouSFuyhQO7i6eC7wwIO8SmlfToSRLt0Flx6m245w9pHB
         PKLD+vsE7LTlwFBwXVC499cf7wej1RBV4hMLEqRR2OHPVL32/ZKXzUvHcsTtDxU0aN9X
         mDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vjHwq+euS6sHbpKqxaoWMT9omt1xcV6vs7KU/CCsLa0=;
        b=Y4QZ+i0iZgjNbh0xY9iX8yaAmoKtx/JbDA7JJodsbK3/wvwU9uv+gkb/AyD9Lg+3n/
         vfL9pfNM3yGL56srp/2LE+afedJxAGibQxB9cI9LGkUqSmvUFLbhMbwtdqsOpjKj/oad
         KOk3yUPXlPyOQkU727obrflT/5Y3fcPigCIZ37fzzUyMVI7Ikx5sAoHheLxy69SEq6Jf
         qizSqnVy+xiTttFkjmzjNGAKoHtVdN00hrSKkgmfVJDftbIV/3RfcarmuHmd8Rgx356C
         Q78UsGgOY1rFcEYB6LsIdNTbaOjXo2EAWhTGC73UVOlRiPAtZwneRc8YLW4XNDO3dKoL
         xmrA==
X-Gm-Message-State: AOAM530wWq5W8VDHgLkWCo8BQi9zBYkYXc335fBN7EjaI0Rju8dfj0FE
	mz9zO356Wvnxag84byJm/LGrHKtei1HnKvucfId9m1hwpuE=
X-Google-Smtp-Source: ABdhPJyLX48KIBSkZvPHPz2C91uYbeYZHdhozon2HtLjZ9o8DyfseTgCMmcCJhanMtaEKQQEywpACShDn4m6U783j6c=
X-Received: by 2002:a37:744:: with SMTP id 65mr23521107qkh.71.1607826623491;
 Sat, 12 Dec 2020 18:30:23 -0800 (PST)
MIME-Version: 1.0
References: <CAP9ODKpXfVcDjtMwUvSRi68+-BHnK9nF6B-5wFX7nzW2wi2adQ@mail.gmail.com>
In-Reply-To: <CAP9ODKpXfVcDjtMwUvSRi68+-BHnK9nF6B-5wFX7nzW2wi2adQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 12 Dec 2020 18:29:57 -0800
Message-ID: <CAMKF1sqj0epXj_cFBniiEvYmfTgcVuCxaAfLh7_Y7oPZ==Tq1w@mail.gmail.com>
Subject: Re: [OE-core] Strange segfault on native Go binaries
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 12, 2020 at 3:52 PM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> Hello all,
>
> I am trying to debug a strange issue on native Go binaries. We're
> seeing it on 'glide' for example.
>
> If I build 'glide-native' and I go to its tmp/work/.../image/bin/glide
> it works just fine. For example, running it we see the expected error
> as I am running inside a clean environment without any extra tools:
>
> otavio@yocto-env ~/.../build %
> ./tmp/work/x86_64-linux/glide-native/0.13.3-r0/build/bin/glide
> [ERROR] Error getting version: exec: "go": executable file not found in $PATH.
>
> Now, if we run it from the sysroot-native, it segfaults:
>
> otavio@yocto-env ~/.../build %
> ./tmp/work/cortexa9hf-neon-oel-linux-gnueabi/updatehub/1.1.1-r0/recipe-sysroot-native/usr/bin/glide
> [1]    26085 segmentation fault (core dumped)
>
> And this segfault is also happening inside the build. I ran the
> readelf on them and it seems to have been modified to use the
> uninative libc loader but I am in doubt how if this is the culprit.
> Can someone shed any light on this?
>

it seems relocation is not working in some cases. whats your host
distro, are you using gold linker by any chance.

> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>
> 
>
