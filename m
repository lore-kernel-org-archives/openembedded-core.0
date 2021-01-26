Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.11878.1611666637597684936
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 05:10:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ANZzo/Un;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id q8so22601361lfm.10
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 05:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lne3xKLtnhlaEtX9B4rUtqFg/4/FgSmX1tckWGlJBJE=;
        b=ANZzo/UnKLE27e1etgQDPB8MTeJcHJ4FS+MZXKK2DQoqmopFYr57eDs3KgCp4bt32j
         RSyucihpLJtlsf8yEqUNnqR7wDKGlkq5c0G0A4QzjCMdhQDBcbMb76Ltv2hNhS64HQDs
         PzwbFZqH4AjfTGgRX14awMOpalIeR1Hxgzg0uWByfgMKn2/I5aPteJavLrZv2O5OzbZf
         tV/EApFQ4AMqHFojsZbc/XSCff217p+u5uGkdlzG8feWaLtaT78ga4GCbqRVd69gKB2L
         qW3sbM4HIKYvOL7v2ZoSrGyAvcVeeQIWp5svIimD3fR3iVolfPCNweiGcQ0lYTuEiPpR
         3Ltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lne3xKLtnhlaEtX9B4rUtqFg/4/FgSmX1tckWGlJBJE=;
        b=WDt49z8I3q310q0zlYGGrZVzpCTYBH05CvEm9emQnHJ8N4g2eSGs6s3Ch4OBRpHsKd
         t9C0XrSp4riMmVNkfOd8U53hrTNWHAzza1tpnHCUmLbhiAi0eVjhCw5CslMa3XX55TO1
         d5X9N+M0pK8q6rrc+mKNLwoHvh+sjXnlA0lxlU5JJcBBGIaeEdlQgWLiYjVDdL8TUxpL
         hzdk+G+rbPZWdO590j7ms03DqFiGsOJG7WEvXGNKgAIjKivDA9ocZQu8MjuLc/uFU7dG
         d30sQyh8sGTlpuEu0Z0GVHMGs9w1EOQ1QaTNPL1ELvumRXQM8ZhwsR93LXw4jyt0La1F
         PzxQ==
X-Gm-Message-State: AOAM5300BX6RIk3zZnf/y9ox1TpURHS3mebQjR1CD+MlkVKkFyYHgyGR
	//r654pGPvr55N5zAYwikFYYa00nPhoKOVayQ6c=
X-Google-Smtp-Source: ABdhPJx4+o/cC+3JxXbHpKuIm+lX2bq0LljtFpy/dQFiaONvehIiwXK4gG8zRdNXs27mhJQeYCdQPYKxmTuXh2m8Aco=
X-Received: by 2002:ac2:4310:: with SMTP id l16mr2893908lfh.138.1611666635574;
 Tue, 26 Jan 2021 05:10:35 -0800 (PST)
MIME-Version: 1.0
References: <CAHtQpK71uAoq_hwDGJCvt5O_=kNXHkWFkmHC-BQkzcSCM3ys7A@mail.gmail.com>
 <CANNYZj9eoz-9xvEpCSD6mgMwETMn_R8xPEtYc1jVK0FSF3qpSQ@mail.gmail.com>
In-Reply-To: <CANNYZj9eoz-9xvEpCSD6mgMwETMn_R8xPEtYc1jVK0FSF3qpSQ@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Tue, 26 Jan 2021 14:10:24 +0100
Message-ID: <CAHtQpK7ZtJ9edRJeCyjvdH3eQXur4pqaSd1btpS1S-MC5KvNyQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell]: gpsd recipe (3.19) build is broken
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hello Alex,

On Tue, Jan 26, 2021 at 1:48 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Can you rather identify a single commit that can be backported to fix the specific issue you see?

This I did tried at the beginning (was considering to get a
low-hanging fruit), but it appears that it is not quite trivial -
there is a significant amount of commits in between 2 versions...

If that would be a preferred option over version upgrade - I can try
to bisect it further, just need more time to identify it.

>
> Alex
>
> On Tue, 26 Jan 2021 at 13:13, Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>>
>> Hello Steve,
>>
>> gpsd recipe build breaks on the dunfell branch with following error messages:
>>
>> | /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aarch64-fsl-linux/gcc/aarch64-fsl-linux/9.3.0/ld:
>> ./libgpsd.a(ppsthread.o): undefined reference to symbol
>> 'pthread_create@@GLIBC_2.17'
>> | /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aarch64-fsl-linux/gcc/aarch64-fsl-linux/9.3.0/ld:
>> /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot/lib/libpthread.so.0:
>> error adding symbols: DSO missing from command line
>>
>> This cannot be reproduced on the current master branch, where the
>> version of gpsd recipe has been bumped up from 3.19 to 3.20.
>>
>> Can you please consider to cherry-pick following commits from master
>> in order to upgrade the gspd version on dunfell branch:
>>
>> 98e61961c gpsd: add new init script
>> 04afc692a gpsd: mark CLEANBROKEN
>> 33a15c790 gpsd: fix build on aarch64
>> cecab9c4c gpsd: Upgrade 3.19 -> 3.20
>>
>> I've tried to cherry-pick them locally and they do apply clean. Also
>> the build of gpsd is successful after this upgrade.
>>
>> --
>> Regards,
>> Andrey.
>>
>> 
>>


-- 
Regards,
Andrey.
