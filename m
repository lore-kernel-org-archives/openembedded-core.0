Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web08.1490.1607021840954847758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 10:57:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N+6T8SjE;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id z3so2129132qtw.9
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 10:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zz8zfBLlBiBjMqtw2bup0lSOsa/lhbRGl0su/b8eEmI=;
        b=N+6T8SjEJ49e1ytOfDqYWQubexjXQnXowVk3yLO1CCO6dQehdk14+/KO1eJhKcMX6g
         66VcbfxRT9F0ML8xwIn/SBEpdJYagt1m4kW82Gy1cUsWZmVjXktVGG+O64mnecukuOCt
         8bPRlTSCw0vlanmRfAqK0zpmxMcy8Vk7tspCPIMQjnifIitGvipWR7gdhMImtsjsk92k
         k8o8rQ+9vWOBhwpUdlhMqQfD8Zx7pyAA6s2CEglxZAywEEUh3E2Gngg0rdH/jftQhKFR
         /aYDYfCK1WytoAGi7TuIIFc8e1sSKheXdk5jU3Vq1d7mLalp7wr0EnjyT3wp9jFLV8UQ
         7Qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zz8zfBLlBiBjMqtw2bup0lSOsa/lhbRGl0su/b8eEmI=;
        b=YgskaUnp3B3yQorm7NuwZHW/Q2H9dWYRU7Yu9ZNcMvnV2HR68EiLaiCCWe5g78wLVf
         43r9CMN48hu1A11s49T4AHC8EAqnOVVNp7xncPSdcXpZcSYmHqkq7ZY6qnyovcIlWTYZ
         NjAvoz9umX3DgKQdn2ytqJM58RVoZp7YGZ2JieXn0NgyE1085TFTNDj1rmVmh7w+T3VM
         ck2dJZWiAR9XuN/0XqFtO5zwjLOLHsuSLhQE1CYpP6K75HwlMhnZpBZUFC3KQtVQksFH
         AasIaqR9FRRBgKL4/hzZx8a6qfkauUce99GdGhL2IQLvUqMWX2hzrFh5A9erf5fDwz/n
         VDiw==
X-Gm-Message-State: AOAM530UEbOYykrzbDpuRfoDOR+panmutpQrHrevS78F7vAMwWmCI1ez
	Yh6urC6+kneE1bq2LuGInr+cgMwzEYwwhdWwMdg=
X-Google-Smtp-Source: ABdhPJzPXMQXJCFoYgyI8t/RgwawYsh/jvDJKfOC5yboXdri+Ax7j3pde91KDRaVVdESaN3FwA2s096RV/klPpBUNx0=
X-Received: by 2002:ac8:5a0f:: with SMTP id n15mr4789072qta.88.1607021839951;
 Thu, 03 Dec 2020 10:57:19 -0800 (PST)
MIME-Version: 1.0
References: <CAAnfSTuCTy4U60iJwtMm=N1PEaWjz6XyL_idgRXJVbzuLHggUw@mail.gmail.com>
In-Reply-To: <CAAnfSTuCTy4U60iJwtMm=N1PEaWjz6XyL_idgRXJVbzuLHggUw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 3 Dec 2020 10:56:53 -0800
Message-ID: <CAMKF1spd0OHieyUi6Px+_j21B8Cv5_aPA8+9Po-sVNxBLk-o_g@mail.gmail.com>
Subject: Re: [OE-core] Automatic cap on BB_NUMBER_THREADS and PARALLEL_MAKE
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 3, 2020 at 9:48 AM Ross Burton <ross@burtonini.com> wrote:
>
> Hi,
>
> Currently, BB_NUMBER_THREADS and PARALLEL_MAKE use the number of cores
> available unless told otherwise.  This was a good idea six years
> ago[1] but some modern machines are moving to very large core counts.
>
> For example, 88 core dual Xeons are fairly common. A ThunderX2 has 256
> cores (2 sockets, 4 hyperthreads per physical core). The Ampere Altra
> is dual socket 2*80=160 cores.
>
> At this level of parallelisation the sheer amount of I/O from the
> unpack storm is quite excessive.  As a strawman argument, I propose a
> hard cap to the default BB_NUMBER_THREADS of -- and I'm literally
> making up numbers here -- 32.  Maybe 64.  Comments?
>

I think capping at say 32 might be fine also think about how can we
then make it known widely to users since this
will be important to know.

> Cheers,
> Ross
>
> [1] http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=1529ef0504542145f2b81b2dba4bcc81d5dac96e
>
> 
>
