Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.1254.1619631620786757867
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 10:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TTf79ZQG;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id o16so73198576ljp.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 10:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yg+tGPHJQTtnVuYOqPnRRuFC5mPThi7aSQgGG8jtd5E=;
        b=TTf79ZQGSrjnpg7FrRRH1KRmicbjbrKG8BelAm92RXL00fFzWmqaLzkvPNQkmK3877
         KIynSKjIzWI5LOC8IjEuEZ0FPaN5sg6gMDQyBTSZvi9eBgoUKcjsT2UOv2nM7KyEJb+4
         xAzJ9wBQbfKQjkoCIXyAQhu3z/OEG/12nGlqeFoaomFo80kV0/UfjXGCKVhZf8LM2GS/
         VZr6G3MbR3WMhpAZJZHwlSAS985LiJpgvLyAO88T08zndz+592asfH0VEdhaVOzUKjQD
         rG0C3K5V5HHWXyIGEERg5pVr44wEDgRuqhT3P8XOTUtYCxx7lidHlYlhcciAuTz9rvhi
         NIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yg+tGPHJQTtnVuYOqPnRRuFC5mPThi7aSQgGG8jtd5E=;
        b=FCJO7yNdNbPBK8pvBCFWP4lNJ84BEnRPRZCZ251SoPehdWYg9KMY8jTN9g/MbF/0K2
         XZQLgJLspv1wWytsHGQ5v/LjEXEbHIl7GMNUkzAQTWypjw2Rj31tAoqQt1fntd7k//pj
         qYE/1et+F/I7hiCllzjMpjyctpVcUAKmI/60dV8Zq3r2O8w/90Q2sDqpmUgXqjQFSWMG
         JDpl7uWHzxe1F2/5BTTY9SyE8VY0sZrQTsyG/O4OCMOjZ5l6xWXwVbvuMt+no2zsx7C5
         KZVIGZGWVX5Q6LsqhYB/WHpYqY1A2CzUgZeRYtVrq6EciN6cj2QyY1IViA1Alcbcl+d2
         16lA==
X-Gm-Message-State: AOAM531LaLUkeV2DwNu4nhQtojc0gsoDHW4GHLvMKdWH6jmr0Bo9zACj
	GXVvyoiFlSsCt+KKfqCx/Su3I/pWZ1j43xbjGSY=
X-Google-Smtp-Source: ABdhPJyzui/kHP6qNriZx8xTNKqMQOtoliNa+oa++Yf0k9d6zVTRQGFOFs4JQyeLMa+qD1EV7qX21AJ1yk2YI/S6Wgk=
X-Received: by 2002:a2e:880f:: with SMTP id x15mr19647967ljh.507.1619631617527;
 Wed, 28 Apr 2021 10:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210428050546.1708751-1-raj.khem@gmail.com>
In-Reply-To: <20210428050546.1708751-1-raj.khem@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 28 Apr 2021 10:40:05 -0700
Message-ID: <CAJ86T=VMvrV=b9WX32UKJCcJRKYPpUAoZyaT++ms4ECt=BzTNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] busybox: Enable long options for enabled applets
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 27, 2021 at 10:06 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> certain applets are enabled but the long options are not enabled for
> them, it results in subtle failures in ptests where its expecting these
> options e.g. gzip --best is commonly used in many package tests e.g.
>
> root@qemux86-64:/usr/lib# grep -r "\-\-best" *
> acl/ptest/Makefile:GZIP_ENV = --best
> attr/ptest/Makefile:GZIP_ENV = --best
> coreutils/ptest/Makefile:GZIP_ENV = --best
> ethtool/ptest/Makefile:GZIP_ENV = --best
> libxml2/ptest/Makefile:GZIP_ENV = --best
> lttng-tools/ptest/Makefile:GZIP_ENV = --best
> opkg/ptest/Makefile:GZIP_ENV = --best
> perl/ptest/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm:    COMPRESS     ('gzip --best')
> python3.9/test/test_gzip.py:        for compress_level in ('--fast', '--best'):
> ...
>
> this ensures that these options are enabled by default, which makes them more
> compatible than now with coreutils provided utilities
>
> busybox size grows by 4K which perhaps is acceptable
>
> --rwxr-xr-x root       root           817704 ./bin/busybox.nosuid
> +-rwxr-xr-x root       root           821800 ./bin/busybox.nosuid
>
> This makes autopoint-3/gettext pass
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/busybox/busybox/getopts.cfg | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-core/busybox/busybox/getopts.cfg b/meta/recipes-core/busybox/busybox/getopts.cfg
> index 8db0a4a8f2..aeb5ac691f 100644
> --- a/meta/recipes-core/busybox/busybox/getopts.cfg
> +++ b/meta/recipes-core/busybox/busybox/getopts.cfg
> @@ -1,3 +1,10 @@
>  CONFIG_GETOPT=y
>  CONFIG_LONG_OPTS=y
>  CONFIG_FEATURE_GETOPT_LONG=y
> +CONFIG_FEATURE_GZIP_LONG_OPTIONS=y
> +CONFIG_FEATURE_TAR_LONG_OPTIONS=y
> +CONFIG_FEATURE_CHOWN_LONG_OPTIONS=y
> +CONFIG_FEATURE_CP_LONG_OPTIONS=y
> +CONFIG_FEATURE_INSTALL_LONG_OPTIONS=y
> +CONFIG_FEATURE_DIFF_LONG_OPTIONS=y
> +CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS=y

What's the connection between enabling the getopt applet (a utility to
help with parsing options in shell scripts etc) and enabling support
for long options in a bunch of other unconnected apps?

I think enabling support for long options in a particular app would be
better done where that app is enabled (e.g.
CONFIG_FEATURE_GZIP_LONG_OPTIONS should be enabled where CONFIG_GZIP
is enabled - in the defconfig file).
