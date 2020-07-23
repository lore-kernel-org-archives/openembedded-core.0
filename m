Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.8006.1595493138003826169
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 01:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gQYUV4yB;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id k18so3805378qtm.10
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2020 01:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=25M6dagTsM5g6vba1kysRWNJg9+FyBMvbVtl4xP3XUA=;
        b=gQYUV4yBaZdeybw470a3Rc7UkW/FfeY9vjsc2P6xKZHa1kZ0JYfZBMYzJJYU6GXs16
         SrKSBQBS592VfC37v/T4UyKNaw2bwdjT0A1z64o8AH2q/B97uHXnvTHJNvW1EndUtuxQ
         tZG78ReEuPyHjL4mkCCvkzCNba2aal5US3+xMgwidmQ1qWxS5e79CTeb6RL/jTvhIuf+
         O6uZEgnVY/XrhloSv+etRmu5m05szYf3ex2eW9lGWfNpd9vPkzpQntqy9sQHSxWg3Aii
         fvis/ho7GqdQKNd/NijQt55AS3a+D1YGZmxsqUL94bYHKVjrqNHRE8Y38O+nmtii4Z3v
         4Yrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=25M6dagTsM5g6vba1kysRWNJg9+FyBMvbVtl4xP3XUA=;
        b=Jtgv5Of0sqlG5NJDZGl6cgtRUK7YZv+NLEr5qDj/z4QE11vOP14M7tYKVJBD1MqLF6
         hSHD0MuDxVbQ3HKaHBvIzrvsuAzhiLQk3FdI3NHCPw6hdrMlzw3wpKtjWePBwSXkebb+
         4wV9V3Zvgtvgu4lhZa+qpxeZmVGw3Z3PAf7lZWxoBpwwB2n/Y5TuBcgBEQE7BuzsclTu
         RCgdqdHTYWDNTDoOU8QQ/rRVrVCBloAG52L26Sfr2YHtisTuAxi1q8Jh0WYHF0uLER3g
         e4QXyxa3ZBnhavZxYYuh8xGDgUb5a9fPcwjHiJvQ0zgZtH4HGt1YiVxSUCw9asY3lywI
         JVbg==
X-Gm-Message-State: AOAM533Q9Ic2GfCfAmOo0qLPqziTycyWk1pD0F9UVlQPUe9ro8TzVYIv
	1Wb1Fi9wUChrl1fyILPqhyMrssR9YydcbaR7fqI=
X-Google-Smtp-Source: ABdhPJxwsSh0PbB/C5AdTsfRN27UY/FOMDYv4LJD8S3DQQKmd8vPLrhyzPE9l81x0f0uyx+bb6m84+onFKwQfUcv7Sk=
X-Received: by 2002:ac8:748b:: with SMTP id v11mr3123122qtq.293.1595493136981;
 Thu, 23 Jul 2020 01:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200723043127.2821063-1-dan.callaghan@opengear.com>
 <ab49af9a-8aa4-9767-e6b9-daa18682b34f@gmail.com> <1595491143-sup-2728@galangal.danc.bne.opengear.com>
In-Reply-To: <1595491143-sup-2728@galangal.danc.bne.opengear.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 23 Jul 2020 01:31:49 -0700
Message-ID: <CAMKF1srjxVscx=cWo-geuvs0-NORhL1zEx5jKpbUppobpSobiQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] stress-ng: create a symlink for /usr/bin/stress
To: Dan Callaghan <dan.callaghan@opengear.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 23, 2020 at 1:06 AM Dan Callaghan
<dan.callaghan@opengear.com> wrote:
>
> Excerpts from Khem Raj's message of 2020-07-22 23:09:23 -07:00:
> > there is stress recipe in some layers which could provide stress
> > utility as well, therefore it should be using update-alternatives
> > mechanism so it fills in when stress is not provided by say stress
> > recipe.
>
> Hmm... The stress-ng recipe already RPROVIDES stress though. Doesn't
> that make it incompatible with any other existing stress recipe and
> update-alternatives?
>
> Personally I think alternatives is overkill here, and stress-ng should
> not RPROVIDES stress at all (that is, revert commit 72641004). In that
> case, we would have noticed that the stress recipe had been removed from
> oe-core and we could have just updated our image accordingly to depend
> on stress-ng instead.
>

yeah I think its a fair point, we already are providing it in that
case we can live with unconditional
symlink and let older stress recipe deal with conflicts if someone needs it

> > secondly please use ${D}${bindir}/stress instead of hardcoding the path
>
> Oops, yes of course.
>
> --
> Dan Callaghan <dan.callaghan@digi.com>
> Software Engineer
> Opengear <https://opengear.com/>
> 
