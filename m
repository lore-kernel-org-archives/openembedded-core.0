Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web12.8107.1625224266429662240
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 04:11:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=HRTTqP0d;
 spf=pass (domain: qtec.com, ip: 209.85.208.173, mailfrom: daniel@qtec.com)
Received: by mail-lj1-f173.google.com with SMTP id h6so12782686ljl.8
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jul 2021 04:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=SLYpmVDuzucFWGGUUbMkomTeJj26u8X5glhAnkk+sj4=;
        b=HRTTqP0dTUDNuPOe6R2dwr62c/2Yr9x1G/obUAnwmbKa2J+s9ylWQ5IS9RljG0oZae
         kb714Nyql7SNy4agkzy8dIh83wYRISlbKINyOqmFmg4exXRMlpSavnDx4Q+34unrzC4p
         oN/lPrmzF0az4G6f5vQFRgShkG1Pv2loo9wV25LWdZDZT5RfuNj82Q2szrLuD9RDVDpE
         pnilfrxk34p817PdHxlWYkxHdQiGVHMTQHNCvdI/iwolri6uiV6665uFlyBDTzun6chU
         Y3V0wortylmFjSi4Nkdxlo7WiP82jsTPOmwHUG7pr3xI1Foj2aylIPgx9I/mbW2MLiTJ
         a+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=SLYpmVDuzucFWGGUUbMkomTeJj26u8X5glhAnkk+sj4=;
        b=FLkTkJq+1/99cSTT9BS8X0bkLmch6NYe05GvTtPToNhycD3fq+BHu1G/b9M57tgu1u
         FHpQWKdutSAF78op8DrxE1HAKijG/OotwlhZi/VlKR9AcYrxSWMfQ+ckuhjw7s7i8uMy
         YIM+7k6fJqB2xicdLstV7AEt+MKFJKwd0VJq6n7Wh3rz2NjvIwnkw6IO1Ag/r8GJL+wU
         79F/gGDmln4tTzPnkZ1CLWib0MbZ/Cj0Pjxh3i6DJERt3zAxxdTaHJitgPvpchgpm/e0
         g3fmN8d6vUr8lyNO/PuKnjCX5leHbt7GOI387P/IOkOmljcAaIOXdzh+YGpvR+v6dG5i
         PVgw==
X-Gm-Message-State: AOAM532gysf5OfMxhiIQdf7LoZhTGpRS9O93Zzyw9skdoFJ2UAFVHh7x
	XJuAVs50Z1CR81NYjhbuKvHxnmNaG+DVANMnxHkV5IaE6bXUcA==
X-Google-Smtp-Source: ABdhPJyxzXyyX40OYpm7fIHlsP+cPcsKUmow0bm8t1qnbWH/hUGMLBWr+tgJFIsaDQPx40PGdViNhV7Elqw7RshvK+o=
X-Received: by 2002:a2e:b4e6:: with SMTP id s6mr3449717ljm.494.1625224264305;
 Fri, 02 Jul 2021 04:11:04 -0700 (PDT)
MIME-Version: 1.0
From: "Daniel Gomez" <daniel@qtec.com>
Date: Fri, 2 Jul 2021 13:10:53 +0200
Message-ID: <CAH1Ww+Tuf+jwcvybK1KyrkKOg6nvygR3+=YGKRGM0am5OAcdHg@mail.gmail.com>
Subject: sstate not used due to runtaskdeps
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm having a problem with perf recipe sstate not being reused in one
of my 'sstate clients' due to the following difference/change:

pokyuser@da642d39231a:/workdir/build$ bitbake-diffsigs -t perf do_configure
runtaskdeps changed:
perf/perf.bb:do_deploy_source_date_epoch with hash
5bb942d026e5da1235e70eec6e1568262f9d3efc5f73e73500192308d8ee09a6
  changed to
perf/perf.bb:do_deploy_source_date_epoch with hash
366a660a6f7db7d5222216e8100b50ce8baccc22b0ab8df940a5b721e666994c
Hash for dependent task perf/perf.bb:do_deploy_source_date_epoch
changed from 5bb942d026e5da1235e70eec6e1568262f9d3efc5f73e73500192308d8ee09a6
to 366a660a6f7db7d5222216e8100b50ce8baccc22b0ab8df940a5b721e666994c

Basically, my BUILDA (yocto server) has generated the perf sstate and
for debugging this error, the sigdata which I have compared with my
BUILDB (yocto sstate client) figuring out that do_configure task was
the first one to differ in between builds. According to [1] I should
see the changes in between builds so I assume in my case it is the
runtaskdeps but not sure how to proceed now. Comparing the 2 sigdata
for the do_deploy_source_date_epoch task using bitbake-diffsigs makes
no output. So, I tried to use bitbake-dumpsig in between them and
compare the output with diff:

bitbake-dumpsig
1.0-r9.do_deploy_source_date_epoch.sigdata.366a660a6f7db7d5222216e8100b50ce8baccc22b0ab8df940a5b721e666994c
 | less > 366.log
bitbake-dumpsig
1.0-r9.do_deploy_source_date_epoch.sigdata.5bb942d026e5da1235e70eec6e1568262f9d3efc5f73e73500192308d8ee09a6
 | less > 5bb.log
diff -u 366.log 5bb.log

Where you see things like this:
-List of dependencies for variable libdir is {'baselib', 'exec_prefix'}
+List of dependencies for variable libdir is {'exec_prefix', 'baselib'}

Or lines being added/removed.

For reference, here the links I've followed:
[1] https://wiki.yoctoproject.org/wiki/TipsAndTricks/Understanding_what_changed_(diffsigs_etc)
[2] https://www.openembedded.org/pipermail/openembedded-core/2014-June/211563.html

Any suggestions on what I should do next to find out what is causing
the sstate not being reused on the client/consumer of the sstate side?

Thanks in advance,

Daniel
