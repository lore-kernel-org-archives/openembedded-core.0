Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.15218.1595951415755754742
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 08:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X7nDlgZh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id c80so35438wme.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2020 08:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ZSMRLNNu3nqdf2PG1w29jnNMO/zugzeedqmmaVxIDtY=;
        b=X7nDlgZhGcN5QDdarGtTw5u6gj8MqumsymVNihoguML0q9OHCFTwzMZ4o+ThpJLFnD
         YY1DI+335pTBpdj3fp0jYuD8MAgdit7hWhxqXskmUZia+GkPG+f9JVkx8lLayG/Khpfd
         A/ECBAbctXFrOmDNEHtXayPpmonhKImmnTQyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ZSMRLNNu3nqdf2PG1w29jnNMO/zugzeedqmmaVxIDtY=;
        b=PEAco9fu0LW0hfpOuFNUD4FtPhX7fOOj4fy07MeC30a9I2cduBhd9HcSfNM9euKCSG
         qiuJ7Pi/s8wT70uaCaxA8jQPTlJrcufGHK39PE5uiy4sTC8HLmP2vHYaRv/wiQphc8kU
         mSnOyGVOexIPDpmNTXjiJCY52Q5RU6Z+BRKKyJ5FnWwxHTi3WYvkAJrfaMAStXl0Zmr4
         RGPGWPm6dGGw33r6JWwBdda4+ZuSCOxFlhuBXzBw+9947+1s65R0/bGDI4Cb7zfCl4di
         z5qES1gt4bhyCRZIfpYyXnHVJyfW9noT6Meel08nsWciRj5bE+gCXxdV+obu392kKJiZ
         5luA==
X-Gm-Message-State: AOAM533defz9EQmUqFITjMD8qSKCm0atyxUa5uNWQY4yWvLjQPgqHWv8
	HMHhWWXQnqkVjyur3+2gnaLuhg==
X-Google-Smtp-Source: ABdhPJwFrRCV56mWiYu6p8cow6ADlHl6Y1zXuMkzajXjckDL0vilFk6J2yfZgKAy+Qib+XZ62fz5Gw==
X-Received: by 2002:a1c:bc54:: with SMTP id m81mr4524902wmf.60.1595951414192;
        Tue, 28 Jul 2020 08:50:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.6.3.d.4.5.3.d.8.9.d.0.a.0.d.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.6.3.d.4.5.3.d.8.9.d.0.a.0.d.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:d0a:d98:d354:d36f])
        by smtp.gmail.com with ESMTPSA id t14sm8012468wrg.38.2020.07.28.08.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 08:50:10 -0700 (PDT)
Message-ID: <edc83a1a101292425dce9dd1c9df51d6b8db8e7a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH 0/3] Log colorizer
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: chris.laplante@agilent.com, openembedded-core@lists.openembedded.org
Date: Tue, 28 Jul 2020 16:50:07 +0100
In-Reply-To: <20200728013557.111830-1-chris.laplante@agilent.com>
References: <20200728013557.111830-1-chris.laplante@agilent.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-07-27 at 21:35 -0400, Chris Laplante via lists.openembedded.org wrote:
> This patch series turns on color compiler diagnostics. It is especially
> useful when doing edit-compile-test development work with devtool.
> 
> It is based on one I've been using internally for about a
> year now.
> 
> Limitation: Note that the *.nocolor and *.color logs will only contain the
>  output of the task itself, not any prefuncs or postfuncs. This is
>  because the color filtering is implemented using progress handlers,
>  which don't see prefunc or postfunc output.
> 
> Chris Laplante (3):
>   lib/oe/log_colorizer.py: add LogColorizerProxyProgressHandler
>   base.bbclass: make oe.log_colorizer available in global context
>   log-colorizer.bbclass: add new class
> 
>  meta/classes/base.bbclass          |  2 +-
>  meta/classes/log-colorizer.bbclass | 49 +++++++++++++++++
>  meta/lib/oe/log_colorizer.py       | 86 ++++++++++++++++++++++++++++++
>  3 files changed, 136 insertions(+), 1 deletion(-)
>  create mode 100644 meta/classes/log-colorizer.bbclass
>  create mode 100644 meta/lib/oe/log_colorizer.py

This looks interesting. Could we add something to the manual about how
to use it and maybe a test for it as well please?

I did write something similar in a different context recently which
applies here near enough as well:

"""
By documentation, I mean that kernel-fitimage.bbclass has no
information in the reference manual:

https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#ref-classes-kernel-fitimage

generated from:
http://git.yoctoproject.org/cgit.cgi/yocto-docs/tree/documentation/ref-manual/ref-classes.xml

and also there is also no header at the start of the class saying what
it does or how to use it.

Could we add something to these locations to give more information
about the class?

For testing, have a look at
meta/lib/oeqa/selftest/cases/imagefeatures.py. Its testing target image
rootfs settings but I believe the concept is similar to how you'd test
something like the kernel-fitimage class.

You can run these tests individually with "oe-selftest -r
imagefeatures" to run that file or "oe-selftest -r
imagefeatures.ImageFeatures.test_bmap" as an example of a specific
test.
"""

although there may be a different selftest which would be a better
example to base a test off for this code.

Cheers,

Richard

