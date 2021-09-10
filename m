Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.6744.1631266557340985919
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 02:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=LxmTGA08;
 spf=pass (domain: burtonini.com, ip: 209.85.221.50, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f50.google.com with SMTP id n5so1692283wro.12
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 02:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f+1HFMDWUtvTaqRt5dFixaFpzLq8UBeaP9koB9xaa+8=;
        b=LxmTGA08/N+6vXXD5ZUU4r1fhJY6NeUbJxdVN8DdhUrwp0yYjeVE63SCAzr07YxQe9
         kzW9TgOSB4Ih9Tb9eP1N6y/eu92dLu5GJlXj802HRXYXBUSyPXfdSdAR0jPDf9tgHFCF
         Wjik5kZia2WrGxxeWb9vI8t8u55tvSelitPc2J7AFgvJIFmttq5+Q6XA7nsTbsD9b3Y0
         3cs/9EVf0ujz2hojTa9O121iAlgtZUeooo1Q6CJnfapbptMSKCWA/Pp/J7Z9BXFs4rxW
         R3ni8Td56W13vD6uZ9rPbXkrz+fgoKDQ70RYYPbcfGhlTPAUX4wRZF8KY87BUMrBVnJ5
         SwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f+1HFMDWUtvTaqRt5dFixaFpzLq8UBeaP9koB9xaa+8=;
        b=J8Fy/cm5kBqKBs4wAMwu/BbB5mrdmfjyqD3WNXJBzYU4qCJD7mtaVfj/KsWuQiuYXB
         kPWM6euZ7rTz2MPS42JIaUvxDhgdpcdJfD7mqwIhy4RfrT/MYCKDFtblfBG9Ab0uCDoO
         GAfDMDGyOChVW1Bdf43tn6xX8WCuOaglHjlS2vICQoAnabzNqdsDuqUc4iJ2WYKQZwQR
         U57dDlBnM3RR/cL5WpHwG98MNgQxF0JmB/nSJAhr2HfDxsXUqHWCFE+gmPsu2d0jvPXC
         dIjcl0UdNmvOb5Vd4eCIAMMXkTJcZvXMd9AdHIpDZZ387CTfAb43mOi0JPDIWrg671+o
         kUgg==
X-Gm-Message-State: AOAM532hy0l8OTwPlr5su0cyBfLzw6u7fximGIpMhR91ur4oOu/tzyJK
	F7BjYNP1K+nNmDNiQ5vbsPkYfIj1ey1DLlBIZPoJiwoJPfIzxA==
X-Google-Smtp-Source: ABdhPJxtky6OAXpmCIyqfeqjj+4/9g4cUWflod5LI6JilFh/msrKUH1pK+ephI/15Gvsgmtm5gHBt0UbQVPmKVuabMk=
X-Received: by 2002:adf:e44c:: with SMTP id t12mr1996672wrm.49.1631266555583;
 Fri, 10 Sep 2021 02:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631260941.git.liezhi.yang@windriver.com> <5c90531f95216929b0e3cc55784a25f3a2386b28.1631260941.git.liezhi.yang@windriver.com>
In-Reply-To: <5c90531f95216929b0e3cc55784a25f3a2386b28.1631260941.git.liezhi.yang@windriver.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 10 Sep 2021 10:35:44 +0100
Message-ID: <CAAnfSTsfHCM=aGJZ4SVEaBGezDan0wifzhnh+UTARxmb6uHXhw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] oeqa/sdk: assimp.py -> cmake.py
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Sept 2021 at 09:08, Robert Yang <liezhi.yang@windriver.com> wrote:
> -            self._run("cd {build} && cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON {source}".format(**dirs))
> +            self._run("cd {build} && cmake {source}".format(**dirs))

Verbose makefiles were turned on for a reason: when it breaks, we want
to see the full log.

>              self._run("cmake --build {build} -- -j".format(**dirs))
>              self._run("cmake --build {build} --target install -- DESTDIR={install}".format(**dirs))
> -            self.check_elf(os.path.join(dirs["install"], "usr", "local", "lib", "libassimp.so.4.1.0"))
> +            self.check_elf(os.path.join(dirs["install"], "usr/local/lib/libexpat.so.1.8.1"))

Using join() but passing a hardcoded path string seems suboptimal.

Ross
