Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.14171.1628106843694290264
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 12:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HB2BoENl;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.54, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f54.google.com with SMTP id l8-20020a05600c1d08b02902b5acf7d8b5so1427068wms.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 12:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SP61TU+IPtr8skC2Z0tc+MCrfQwrNaycc1371CrJ5ns=;
        b=HB2BoENlVp1WbL+vAJLSNRAzHVDWSx03cdann+k1m4T+vsMhOdNdrIJxNT/fEdyj2s
         bmU0oG47VVmEZqDgDdZAJ2auPMA9sVOJkTkB0j1d3RN8/PAMQ9lQQ68WLg27uVfxyOVT
         7/qa/dbblB67abI2+Ha6LazAYW8MQpVK3AmYBwxpjz9jpFhnIHBTm0VUi8PBdhE7Oz+P
         q9zlKjLDQ2sxC7GXyVZa40BnBuYUdwM2fwd3zVTbUgPBD/8EorWCVdcP+dOJhivtSAzc
         HdjOSsQjz2uGe2ROWKlVm3Vpevu2ayhoHKfHA2fE6yXcgduhCuhTL/xeQSdhPn3EJy5z
         CPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SP61TU+IPtr8skC2Z0tc+MCrfQwrNaycc1371CrJ5ns=;
        b=SVDsnpnVNiuQUYEMd4EyD5hCfVkQ+VcUIL7vGm/Dwoqu5xQrkV7RKodKO1e9xKg7+9
         +GQcrHpbYLBgY9aapriXH1kCw5XFKNnpppMxxfbkRmZYVA9mCnR9TPkxza6r5aUubHOm
         UlpFmMEXJ3OMRJ/ZVi+oN4bkT8ilrpMoXMdUVlnUDb0Br6PPG6gnx0lzDgAGrl/XR4vQ
         uOhhITrOeaPzdzYeoU0mXnqiAHDj1Kl4zd+3OW4UxzbVH8By0EXO3ScEYdctwIVR7Ili
         Oj0QZ2r/WlmhID8Je6lsvUJ8/o6wcXCiIKtGKwBbxPShq3p3spNjIoN9UF8E44ck/Yvt
         8BPw==
X-Gm-Message-State: AOAM531reR4klvWAhUazt8s9XJiS4L6PePtjHOkfhY3DCxhdEzlfqVVT
	QE6gsoaBNf683KupxQjx7Ht+6fFPJ8OGHKWtYzKlmA==
X-Google-Smtp-Source: ABdhPJye0mCCkiqIqFO1UX4PmphQPNRpM5xoYgumuqbpOyWU3eKmlWu+O+VbJvSZW4tu4KG2i6tP2qxfArIopF+nSh0=
X-Received: by 2002:a05:600c:4a12:: with SMTP id c18mr11245659wmp.3.1628106842006;
 Wed, 04 Aug 2021 12:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210804170552.1163928-1-mac@mcrowe.com> <16982A916A07A38B.6121@lists.openembedded.org>
 <CAOSpxdbthf5JtAGYri==t=izjpTXFbWU733YtxRXjTgQ+pjcTg@mail.gmail.com> <20210804194217.GA18303@mcrowe.com>
In-Reply-To: <20210804194217.GA18303@mcrowe.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 4 Aug 2021 09:53:49 -1000
Message-ID: <CAOSpxdadmUrxeJ0wERYZWZhR8DiCLCO220ONaO2fyLcOvej8AQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH v2] curl: Fix CVE-2021-22924 and CVE-2021-22925
To: Mike Crowe <yocto@mac.mcrowe.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 4, 2021 at 9:42 AM Mike Crowe <yocto@mac.mcrowe.com> wrote:
>
> On Wednesday 04 August 2021 at 08:05:27 -1000, Steve Sakoman wrote:
> > On Wed, Aug 4, 2021 at 7:27 AM Steve Sakoman via
> > lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
> > wrote:
> > >
> > > On Wed, Aug 4, 2021 at 7:06 AM Mike Crowe via lists.openembedded.org
> > > <yocto=mac.mcrowe.com@lists.openembedded.org> wrote:
> > > >
> > > > curl v7.78 contained fixes for five CVEs:
> > > >
> > > > CVE-2021-22922[1] and CVE-2021-22923[2] are only present when support
> > > > for metalink is enabled. EXTRA_OECONF contains "--without-libmetalink"
> > > > so these fixes are unnecessary.
> > > >
> > > > CVE-2021-22926[3] only affects builds for MacOS.
> > > >
> > > > CVE-2021-22924[4] and CVE-2021-22925[5] are both applicable. Take the
> > > > patches from Ubuntu 20.04 curl_7.68.0-1ubuntu2.6 package which is close
> > > > enough that the patch for CVE-2021-22924 applies without conflicts. The
> > > > CVE-2021-22925 patch required only a small tweak to apply.
> > > >
> > > > [1] https://curl.se/docs/CVE-2021-22922.html
> > > > [2] https://curl.se/docs/CVE-2021-22923.html
> > > > [3] https://curl.se/docs/CVE-2021-22926.html
> > > > [4] https://curl.se/docs/CVE-2021-22924.html
> > > > [5] https://curl.se/docs/CVE-2021-22925.html
> > >
> > > This patch wouldn't apply because there's another curl CVE fix in my
> > > testing queue (curl: Fix for CVE-2021-22898):
> > >
> > > https://lists.openembedded.org/g/openembedded-core/message/154145
> > >
> > > I went ahead and did the required fixup so no need for you to do anything.
> >
> > Sigh. I spoke too soon.  Your CVE-2021-22925 patch and the previous
> > CVE-2021-22898 patch both touch lib/telnet.c so your patch won't apply
> > now.
> >
> > You mentioned that you had to tweak the CVE-2021-22925 patch, might
> > this be related to the CVE-2021-22898 fix (which is a one-liner)?
>
> Ah, yes. That's the change I had to accommodate. You can either tweak my
> patch (just adding the "== 2" to the patch should work - that's the
> opposite of what I did) or just drop your CVE-2021-22898 patch since the
> CVE-2021-22925 patch supersedes it.)

OK, I'll tweak your patch and start testing.

Steve
