Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web11.22452.1600263507844877962
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 06:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=iKCGc9Zj;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.193, mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f193.google.com with SMTP id h11so6440698ilj.11
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 06:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bkWELlDEmOZ3luHxQue2wJQ9+gKhd619u/ETL6DnvhY=;
        b=iKCGc9Zjj8gAuNmdyoJU+DVP9/ecj9L7SRzPWhHTvCBdWBkogWq1s2uBAPHWLG4Fex
         WrRiDX49ccCJd2NOF15yTXfT3V+/A+b8gKztpvxygrtDgONS1VuOuaNYcVOradBdiroe
         nS+/jqzXzCcG94iprj2szJJRNBkqh9Z4OM6vFQ5AGC8hyiVYV2jbvB0DwF6FWKbHJLgK
         QdLhWiQJqEBfbZhC3ipLwbYDGejju5Z25RTfOnf5VPGYmMK4zDQdOwBFtQBy+9UVBzKW
         0bfrIG8O+Tz9c/ZJnUt7V9MSeIHqSrn6Nw8uSycgufrbisw6LX8zRgiDieK6Pt42VsJ1
         qzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bkWELlDEmOZ3luHxQue2wJQ9+gKhd619u/ETL6DnvhY=;
        b=uY9I3eOwMhmr/OWJCU2G+zSTLt8L/0ZduJsjsx4dnIOBaXxy5QdIDFvqnZAXyRvCPZ
         dxiw7aHDll8XynECbIbaMBgYXqQ5saOdEZA7jO6YvQnJ0mEJnUgeOassu5GyYtSg8EQY
         tD1GeupEfPX8nVpa8T78Yuy99Jua3okzNuWDer4apWwUb+1C2/7p4Ye8ywLh4Uj2WB5P
         CobxZAMRRE4nCDy1BpqfBbnIwEcvLc19lWCyy3txW587/elHDbj4cUizS0xGSfZDiCeb
         tVRJayn15dUDJi6TusxTzMfxlTa2I0YYRO2V5Q+Wp7SqKEnz6CHYZ+UDN5+k3p5IuorJ
         sgiA==
X-Gm-Message-State: AOAM530Fhj0NoXJ3BsFAtVk235Hdya5ysDeXM20gX+qAkhhEvDngEJsT
	C3xTP7ZmWzuEMhOMezlMVsu46asg2scGsmwk8+eSDg==
X-Google-Smtp-Source: ABdhPJxjQNtl08x3oZwbPCMqt47YYoCkBqmYj/+il5HR9NGA1ZBN//UpfdYg+OC4lP3eLyvKjvnlci8AR+uy6jF367c=
X-Received: by 2002:a05:6e02:1086:: with SMTP id r6mr18931634ilj.159.1600263507051;
 Wed, 16 Sep 2020 06:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200914151359.11240-1-jon.mason@arm.com> <442cfca7-9e64-c161-3f7e-af858472e910@gmail.com>
In-Reply-To: <442cfca7-9e64-c161-3f7e-af858472e910@gmail.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Wed, 16 Sep 2020 09:38:15 -0400
Message-ID: <CAPoiz9wRF+A4UntZeE=OieVkYeAxts5iLqRUpwfg8MJTTWx_Yg@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH 0/5] ARMv8 Tune reorg
To: Robert Berger <oecore.mailinglist@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 15, 2020 at 3:09 AM Robert Berger
<oecore.mailinglist@gmail.com> wrote:
>
> Hi Jon,
>
> That's not really a comment on the reorganization of compiler tunes, but
> more like "Do they actually do something meaningful?"
>
> I posted here[1] some benchmarks and at least with the benchmarks I
> tried on the chips I tried there is no obvious impact.
>
> i.mx6q:
>
> TUNE_FEATURES        = "arm armv7a vfp thumb callconvention-hard"
> TARGET_FPU           = "hard"
>
> vs.
>
> TUNE_FEATURES        = "arm vfp cortexa9 neon thumb callconvention-hard"
> TARGET_FPU           = "hard"
>
>
> i.m8mm:
>
> TUNE_FEATURES        = "aarch64 cortexa53 crc crypto"
> TARGET_FPU           = ""
>
> vs.
>
> TUNE_FEATURES        = "aarch64 armv8a crc crypto"
> TARGET_FPU           = ""
>
>
> [1]
> https://yoctoproject.blogspot.com/2020/09/compiler-tunes-benchmarks-with-yocto.html
>
> Should we expect so see differences?

There are more things at play here than simply performance.  But
speaking of performance, there might not be much of a benefit between
a generic ARMv8.0 and a ARMv8 based core (like A53), but I do expect
to see a performance bump for a ARMv8.2 based core (like A76).  The
delta between the former is much smaller than the latter.

The differences are not only performance.  Tuning for A76 versus a
more generic armv8a allows for security features like
branch-protection to be enabled (as it isn't supported in older
versions).  You get these kind of things "by default" when tuning for
the specific model.

Thanks,
Jon

> If so can you suggest benchmarks which show those differences?
>
>
> Regards,
>
> Robert
