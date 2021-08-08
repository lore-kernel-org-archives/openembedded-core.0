Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web09.7108.1628405115580926025
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Aug 2021 23:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mn+vqsDl;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id y34so27152977lfa.8
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Aug 2021 23:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LlkbNOpawSs+UHrenUn0Nz70VW4CiSZYLDyx0tWoN6I=;
        b=Mn+vqsDllB2ZkYbTVejd3EIHqq5i5kSCPuWD4Jq8WZFuV0gFGGlnpVxuY2hJ55VZOH
         u9nfrUfvImTvdcZkwhVAu8ffMangfi1l58mEp7p5bz/f36XfOEWNcrP8+Lrvje+na0P7
         nAgnUU3itXVSLBGprlkISJGYNq0Q+jLr9GWqb6TKxzRX4PKH06NTR+KoHxrbjjzmwK87
         0JBSFXNMQCOqpxrcsLXiLzyBcZFU/dDkOqk4mrn8Vx8xbLpX0QBWqtsINO8gvcxnxcyr
         Y3CbMjVOc3+rq7hsIjDU4fPU7TW8qbWzzo4CyN1XSqKiZtF7GxDQS3YPH0Xix46l9iM4
         wwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LlkbNOpawSs+UHrenUn0Nz70VW4CiSZYLDyx0tWoN6I=;
        b=V3mtvm/euYCHmUiZoQOdDBjou5baA3XF5qf+e3XNh61qO8cT1nb1IZFh+coleSKcO9
         mw/vmhJf7mNZe8uhJwJMVB+HT6604Kc6wCSutnIigBfqhRHEv+74JyA/k3fYaQVOnh0s
         BhyOCuJoBJEIXQmvcQjHzMfEwtcK7rQv/PDLBfQIFDzV3/6bd5XYTRuBRFppgCtDGju/
         oeQ9YkmdsS+eGzBeNDAVJFLYae1E+KZguZH2UALsoy/1sPdYjQA8Icm2ChgginytYG4h
         4b0zYKZ1x5g5P7YhZoDOXspa6cJYdiSKIdpd3wV1WmDnJlaKqMVjGvrgthE8/5f+Wf7D
         kxZw==
X-Gm-Message-State: AOAM533RexBS/aS297pipstNXJsDvlESp1Zixk89vgAIBTKjwB29l9Gf
	93e1RFyDOhQelCSJeNIuOSrSVP+8PCkHe8L+Iuk=
X-Google-Smtp-Source: ABdhPJxQZmKXPyiybkQqsZzCPdrVBJdWferhsXnTnuOWzkS2cgE2z4KnblBdsZn9P9WwRqwTAl4aaXXyYqBdVbc/7DA=
X-Received: by 2002:a19:c717:: with SMTP id x23mr13387559lff.230.1628405113506;
 Sat, 07 Aug 2021 23:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <d21730c5-d43-dfba-89bc-71d113f049e9@crashcourse.ca>
In-Reply-To: <d21730c5-d43-dfba-89bc-71d113f049e9@crashcourse.ca>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Sat, 7 Aug 2021 23:45:00 -0700
Message-ID: <CAJ86T=UfJrFc2sGcw9kHdpyJSAdELGarfjM2p6QxEVDbF2uOjQ@mail.gmail.com>
Subject: Re: [OE-core] would reducing BB_NUMBER_THREADS solve parallelism overheating?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 7, 2021 at 8:26 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   i've asked about this previously, but i finally got around to
> thinking about this in detail, and i'd like some feedback.
>
>   i've described the overheating/lockup issues i've been having on a
> dell latitude laptop building a sizable (wind river linux-based) image
> represented by 5-6000 tasks.
>
>   if i start the full build from scratch, it would take about 2 hours
> if it succeeded but, on a very regular basis, when the load average
> well exceeds 120 and i can feel really hot air blowing (even with t
> laptop cooler), the laptop will simply lock up hard.
>
>   the CPU is a i7-9850H, so 6 cores/12 threads, and i've refactored
> numerous proprietary in-house recipes to really crank up the
> parallelism so that, a lot of the time, i can see all 12 threads
> churning away on some task. of course, that's exactly when i get the
> huge load average/overheating/lockup.

Running all CPUs at 100% load shouldn't cause lockups unless there's a
HW problem. Another possible cause of lockups is using all available
DRAM (which is obviously related to how many simultaneous processes
are running too). On my laptop with 4 CPUs / 8 threads and 16GB DRAM I
have to manually over-ride BB_NUMBER_THREADS in order to keep the
system responsive and avoid running out of memory. The default
BB_NUMBER_THREADS / PARALLEL_MAKE are often too aggressive for laptops
etc running a desktop distro.

>   a couple colleagues suggested using BB_NUMBER_THREADS (BNT for
> short) to dial things back a bit but, after i pondered a bit, it seems
> that that would potentially make things worse, not better, so a couple
> questions about cores and threads.
>
>   first, given the CPU setup, let's say i set BNT to 6. does that mean
> 3 cores would be taken out of play entirely, leaving the other 3 to do
> all the work, or would each core simply use one thread, or who knows
> what would happen, and would any one scenario be superior to another?

The kernel will schedule processes to CPUs / SMT threads, not bitbake.
If you have exactly 6 processes to run then the kernel will most
likely schedule them on the 6 physical CPUs rather than 2 SMT threads
x 3 physical CPUs.

The only time the kernel might run 6 processes on 3 physical CPUs and
idle the other 3 would be if you enabled a power saving scheduler in
the kernel, but that behaviour wouldn't be the default.

>   my other realization(?) is that reducing BNT might be the *worst*
> strategy, and here's why. if i have a huge load average, that suggests
> i have lots and lots of tasks waiting to run (lots of stuff on the
> wait queue). but if i reduce the number of available threads, wouldn't
> that just force all that work to wait for a smaller number of threads,
> making the wait queues even longer?

No. If you reduce BB_NUMBER_THREADS then you reduce the number of
processes being added to the run queues, not the number of CPUs or SMT
threads which the kernel has available to execute them.

In summary, it sounds like reducing BB_NUMBER_THREADS is exactly what
you should do. It will reduce peak system load (ie the amount of heat
the system produces) and the peak DRAM usage (which may be the cause
of your lockups). Adding more DRAM (if it's not maxed out already)
might possibly solve the lockups too (but not the amount of heat).
