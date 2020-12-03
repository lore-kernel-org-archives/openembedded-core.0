Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.1104.1607020346577638628
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 10:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ev0iC3zT;
 spf=pass (domain: konsulko.com, ip: 209.85.167.169, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f169.google.com with SMTP id o25so3230047oie.5
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 10:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7ORwNYs4eZhwNAo/ToGtpIMV+MRKVjJl9pp6ac5P8fY=;
        b=ev0iC3zTZ71Jth1lumpRSPAn3oYC8lkOoS8KcPurfaF0tVP/168ftmj0hQEyCJ86Fq
         vZmhOV0lfjZK/QCUSSPUOpyxGSY9MGXam4KNA3MWordnBHvh5zYh7WDyo71kv8vVjlGQ
         UZfNDBFe3yLxbPiPYVoTSFHic21xPEtCJW24U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7ORwNYs4eZhwNAo/ToGtpIMV+MRKVjJl9pp6ac5P8fY=;
        b=UMT1i18zJCdR5SHASMgR/R1kUITQnAw3Qnwr8XKVFnFKcl8jX2y2JMxoxQB5T0k7Cq
         hdQnZ83kL7+myPXkxHSljCnYo3SXf0qpjbMhTO9Jjr4KSoCRGWlHKj5f6zh6AsNhFhIN
         BCPwTBPkO2vBq20nhQ1xmIFqIMblUitZSokS0UPlgCeQEaqIXu2Sgf1tgz5DsGTYDHWW
         U75meKvl53nscLmfrMUFReQkl0tBnLVgnQ/h95UQ3zmPT7F9iEUSQQf/iX84SNpnXq9E
         7SPDbCcNtZFUHq7pMgIj49k9Bpj9Vw+sc+O84gzLaNd+5Hok3dhSGKcWZZqkOs12Dh23
         Y68Q==
X-Gm-Message-State: AOAM530p9+TPSXeUqpzGV7UoTnmBZ/GF3CN2iKRssFRhKZnArDEx3D75
	FaLPD+0+j8O6KKizzgIwDx6rxG7kcKF9QG4i3OA/pg==
X-Google-Smtp-Source: ABdhPJzwxThhEiNaiQL3gD09/AmboYg17HmHv3HruaKOY1oYRDA7OZfF4nJ/ucRQITJrCBD+Az6XRiFcjtsphNO4iK8=
X-Received: by 2002:aca:ebce:: with SMTP id j197mr261868oih.6.1607020345902;
 Thu, 03 Dec 2020 10:32:25 -0800 (PST)
MIME-Version: 1.0
References: <CAAnfSTuCTy4U60iJwtMm=N1PEaWjz6XyL_idgRXJVbzuLHggUw@mail.gmail.com>
In-Reply-To: <CAAnfSTuCTy4U60iJwtMm=N1PEaWjz6XyL_idgRXJVbzuLHggUw@mail.gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Thu, 3 Dec 2020 18:32:15 +0000
Message-ID: <CAM9ZRVuy_YCDe-Vc9ztvnSzVrWfFK75Bywbnrj8UhQr5CnsuCA@mail.gmail.com>
Subject: Re: [OE-core] Automatic cap on BB_NUMBER_THREADS and PARALLEL_MAKE
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Dec 2020 at 17:48, Ross Burton <ross@burtonini.com> wrote:
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

This is really going to depend on what storage technology you're
using. I used to limit both at 8 when I was using traditional HDDs.
With NVMe drives I see no need to limit at the top end of the systems
I've built on (12c/24t).

-- 
Paul Barker
Konsulko Group
