Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.9544.1625232588034308439
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 06:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=Yk1cQCeu;
 spf=pass (domain: qtec.com, ip: 209.85.208.172, mailfrom: daniel@qtec.com)
Received: by mail-lj1-f172.google.com with SMTP id d25so13303824lji.7
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jul 2021 06:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=+3aPTVyUpn3kvv1pzzRd8WGG5xM9t7aWml7xoSqrVKU=;
        b=Yk1cQCeug4xQ00h+W/yDOhpqylLramZKARjdQYiQfKOCGadPqkazUnBlXB47Y0i8b+
         PdAcTGmRd8kN6Ze7vs8DkznE/NPuI419aH7FBuR1JOj/Vf2RHeo9maXRUXfiF/8i1kMn
         Qvvtxj/Wh3ta6MYVgTQzzkzE2dmaIYS1A5KcbGUF4WeaL4ny9DS+HxpyEdu+HVM8K3fz
         VOrT+d8gp5NRFbimFkt4ZJf5Is82gTOXdzKU9JkXpMfEz4MC40Q3Wsit9xKcJhtq4LTG
         v99yFwDxJFnBgD8+IVvIdch2lY3iMVRONeHWyZz7bb+MTtuUkQ8HpxV7FG/e4guz/su3
         YQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=+3aPTVyUpn3kvv1pzzRd8WGG5xM9t7aWml7xoSqrVKU=;
        b=Ia0s+RYRI+Me2xvwZ0BsP/eZsEcqH0mMCZN0wUD0GaQFrFJOq3HKEebLqAA/FggcbC
         RIhwj6JQ7zqIK+XakqnN2mQ4PFMtZlqGWutpR8vzOYFkgUQeRHDH0qCeTbOGQxH3uQQ1
         wODHQJD0ZL0CmbADf4XiYIfhkLIrY6ZWv8jBuwvLJ0jSYmtS7Z5KjTFEjZvFLZ/O1RH4
         ogWblq1b9oGISGjY2OTFLUC71Q7uzB2sS7zBbdpFNrOMGktiXHcjo+VBi1q43yi7ltd+
         YqQjMLNsVPIX/IDJG5O44aJfnHdPoTIYxCraxFtz18DLFeEwp+FWoPpEtw/bue8KeYKp
         ty2w==
X-Gm-Message-State: AOAM531dcFwqwmEzA43UEhZKuE0iCIbRH2KxsZY7UyNTSY4mxS7AyL0o
	fV7XONQC98lba8LTp5wb0Y+8nO3Al8Py7fXWs2iO+IfvjYQRdw==
X-Google-Smtp-Source: ABdhPJyRM8kcGtrbUEl6rSMrkHwvdPOJZtQ1jr/+zbatQTbxlEjyiAgMctze7rOghazIczhImUOrosmWInUtBMcLAVA=
X-Received: by 2002:a2e:8e33:: with SMTP id r19mr3926710ljk.222.1625232585784;
 Fri, 02 Jul 2021 06:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAH1Ww+Tuf+jwcvybK1KyrkKOg6nvygR3+=YGKRGM0am5OAcdHg@mail.gmail.com>
In-Reply-To: <CAH1Ww+Tuf+jwcvybK1KyrkKOg6nvygR3+=YGKRGM0am5OAcdHg@mail.gmail.com>
From: "Daniel Gomez" <daniel@qtec.com>
Date: Fri, 2 Jul 2021 15:29:34 +0200
Message-ID: <CAH1Ww+RHDziZot3faTKTOaOQ0y=L+bNTkS-x4m5q1=vt6dEtKg@mail.gmail.com>
Subject: Re: sstate not used due to runtaskdeps
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Jul 2021 at 13:10, Daniel Gomez <daniel@qtec.com> wrote:
>
> Hi all,
>
> I'm having a problem with perf recipe sstate not being reused in one
> of my 'sstate clients' due to the following difference/change:
>
> pokyuser@da642d39231a:/workdir/build$ bitbake-diffsigs -t perf do_configure
> runtaskdeps changed:
> perf/perf.bb:do_deploy_source_date_epoch with hash
> 5bb942d026e5da1235e70eec6e1568262f9d3efc5f73e73500192308d8ee09a6
>   changed to
> perf/perf.bb:do_deploy_source_date_epoch with hash
> 366a660a6f7db7d5222216e8100b50ce8baccc22b0ab8df940a5b721e666994c
> Hash for dependent task perf/perf.bb:do_deploy_source_date_epoch
> changed from 5bb942d026e5da1235e70eec6e1568262f9d3efc5f73e73500192308d8ee09a6
> to 366a660a6f7db7d5222216e8100b50ce8baccc22b0ab8df940a5b721e666994c

I've continued with this issue looking at the task dependencies for
the perf which are the following:

bitbake -g perf
cat task-depends.dot | grep "perf.do_configure\|perf.do_deploy_source"
"perf.do_compile" -> "perf.do_configure"
"perf.do_configure" [label="perf
do_configure\n:1.0-r9\n/workdir/repo/poky/meta/recipes-kernel/perf/perf.bb"]
"perf.do_configure" -> "linux-qtec.do_shared_workdir"
"perf.do_configure" -> "perf.do_deploy_source_date_epoch"
"perf.do_configure" -> "perf.do_patch"
"perf.do_configure" -> "perf.do_prepare_recipe_sysroot"
"perf.do_deploy_source_date_epoch" [label="perf
do_deploy_source_date_epoch\n:1.0-r9\n/workdir/repo/poky/meta/recipes-kernel/perf/perf.bb"]
"perf.do_deploy_source_date_epoch" -> "perf.do_patch"

In my case, both recipes linux-qtec (custom kernel) and perf are not
using the sstate. I have also compared the sigdata for the
linux-qtec.do_shared_workdir task between BUILDA and BUILDB and both
have the same hash:
qt5222-poky-linux/linux-qtec/5.13+gitAUTOINC+e6f9eb0341-r0.do_shared_workdir.1c27b593...
and still they don't reuse the sstate. The rest of the tasks locally
generated in the client have the same hash as the server.

Any idea what can I do/debug next?


>
> Basically, my BUILDA (yocto server) has generated the perf sstate and
> for debugging this error, the sigdata which I have compared with my
> BUILDB (yocto sstate client) figuring out that do_configure task was
> the first one to differ in between builds. According to [1] I should
> see the changes in between builds so I assume in my case it is the
> runtaskdeps but not sure how to proceed now. Comparing the 2 sigdata
> for the do_deploy_source_date_epoch task using bitbake-diffsigs makes
> no output. So, I tried to use bitbake-dumpsig in between them and
> compare the output with diff:
>
> bitbake-dumpsig
> 1.0-r9.do_deploy_source_date_epoch.sigdata.366a660a6f7db7d5222216e8100b50ce8baccc22b0ab8df940a5b721e666994c
>  | less > 366.log
> bitbake-dumpsig
> 1.0-r9.do_deploy_source_date_epoch.sigdata.5bb942d026e5da1235e70eec6e1568262f9d3efc5f73e73500192308d8ee09a6
>  | less > 5bb.log
> diff -u 366.log 5bb.log
>
> Where you see things like this:
> -List of dependencies for variable libdir is {'baselib', 'exec_prefix'}
> +List of dependencies for variable libdir is {'exec_prefix', 'baselib'}
>
> Or lines being added/removed.
>
> For reference, here the links I've followed:
> [1] https://wiki.yoctoproject.org/wiki/TipsAndTricks/Understanding_what_changed_(diffsigs_etc)
> [2] https://www.openembedded.org/pipermail/openembedded-core/2014-June/211563.html
>
> Any suggestions on what I should do next to find out what is causing
> the sstate not being reused on the client/consumer of the sstate side?
>
> Thanks in advance,
>
> Daniel
