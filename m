Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web09.408.1623969082032719555
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jun 2021 15:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s6jjl+kz;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id c9so6218266qkm.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 15:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t+9THB7eRi/1tnxAhkPERub7mqMJVWfJOGtlobKFuAw=;
        b=s6jjl+kzVeO8zfQNDUXiUxEV8Rr5RelAOky33YBzTTgme3rKzdR17lw91pouJXZ03h
         HZpY+ReieuakKOuJB/5LHquEvaL5L5ruxQKKCZS2hWQEakDOCzhhDOAgBEIIpfZi6S7j
         kfPu3ysUeINstHA7T74xS8gfuTIcCtqmjvUBkbbKPPwoQ1Es3sJC1w4IOQ7fB2bz8k4t
         ecx9NQDXVV4nSCTia86PNff5Ju/tt7x2PPGEDL8Xo3e0bvezdgl8TJstZi6ddLPCIyc8
         4T1r6SSBTvseNODRZrrLVGL4ddtLjzj6twmT/W/3mRGxQCVH61ahKgZWmdM33NIewLCS
         FcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t+9THB7eRi/1tnxAhkPERub7mqMJVWfJOGtlobKFuAw=;
        b=QHFWrjDswkWJehwBoE76zSYTjEseu7FA9VXLm2Cwf5NGkh2zXqjrdOEtLBwFIgibNk
         ua0i27xRJU6+WK4D2zcRAyFAhY3WK+LuqA6ZHpdI7gH+gfPQIuMXE7n3A7camGq5o+gQ
         s/UkD4fDYBr3xkrWXclRGtiLQWqx5W7E7emZuL0ayoHqZBBHWAhMfR2Crsqpa/yKAk2P
         01EJdph5t1HAE2BfyepHDL5FiIcAOzGQKWVhBZkDfBAbVHY9IIsndBYvlCQ1f3vCtj94
         8xr9nbuxVjIQ6tD9P4e/nyrHbKv64C+1AEMwJFhC2iCjiYTHQKgzC7OfT41Nh7bX0xMW
         t4Uw==
X-Gm-Message-State: AOAM530A9/JmB4ehXAysYH6XMw4mI7TxpdyKq3vJBLJimO4n8nILHJ5n
	pOl84ZKtYjxdFFgQmIhhJlwusAa3YfIjmf2gwLo=
X-Google-Smtp-Source: ABdhPJydeqpNznoqfOsL5WrbazlK1udxRRloUCBm3gUBefitByC54WwFbc/hnydN8JssBrlRk1RSmXt7aioM2+p1IXk=
X-Received: by 2002:a37:bb82:: with SMTP id l124mr6033388qkf.119.1623969081028;
 Thu, 17 Jun 2021 15:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <e28daac3-9131-6f27-f8cc-577b821323d1@cybernetics.com>
 <c60f1f1c-a16b-d850-72c9-f87a04b42aef@gmail.com> <df353805-0ac9-f1a6-a6ab-5494ca886516@cybernetics.com>
In-Reply-To: <df353805-0ac9-f1a6-a6ab-5494ca886516@cybernetics.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 17 Jun 2021 15:30:54 -0700
Message-ID: <CAMKF1spRhiFVMJ26_tHqx1-0=ckfoXE76TgmrPm5Tkg7F9A3NQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: fix path to place zdump in the tzcode package
To: Tony Battersby <tonyb@cybernetics.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 17, 2021 at 3:16 PM Tony Battersby <tonyb@cybernetics.com> wrote:
>
> I just looked up the history to see if backporting is appropriate.  This
> patch should only be applied to glibc-2.33 and later.  See glibc commit
> b4f020c9b408fb3d1d3d4901c4a71839145f8791 ("timezone: Change zdump
> installation to bin directory").  Applying the patch to glibc-2.32 and
> older will introduce the bug rather than fixing it.
>

OK that makes it just hadknott then.

> Tony Battersby
> Cybernetics
>
>
> On 6/17/21 5:25 PM, Khem Raj wrote:
> > Thanks, I think this needs to be backported to dunfell and other
> > maintained releases too.
> >
> > On 6/17/21 12:06 PM, Tony Battersby wrote:
> >> zdump should be included in the tzcode package but is instead included
> >> in the glibc-utils package due to an incorrect path in the recipe.
> >>
> >> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14427
> >>
> >> Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
> >> ---
> >>   meta/recipes-core/glibc/glibc-package.inc | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
> >> index 8d0cc8047f..8841c5e3ca 100644
> >> --- a/meta/recipes-core/glibc/glibc-package.inc
> >> +++ b/meta/recipes-core/glibc/glibc-package.inc
> >> @@ -43,7 +43,7 @@ FILES_${PN}-staticdev += "${libdir}/*.a ${base_libdir}/*.a"
> >>   FILES_nscd = "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_unitdir}/system/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \
> >>                 ${sysconfdir}/nscd.conf ${sysconfdir}/default/volatiles/98_nscd ${localstatedir}/db/nscd"
> >>   FILES_${PN}-mtrace = "${bindir}/mtrace"
> >> -FILES_tzcode = "${bindir}/tzselect ${sbindir}/zic ${sbindir}/zdump"
> >> +FILES_tzcode = "${bindir}/tzselect ${sbindir}/zic ${bindir}/zdump"
> >>   FILES_${PN}-utils = "${bindir}/* ${sbindir}/*"
> >>   FILES_catchsegv = "${bindir}/catchsegv"
> >>   RDEPENDS_catchsegv = "libsegfault"
> >>
> >>
> >>
> >> 
> >>
>
