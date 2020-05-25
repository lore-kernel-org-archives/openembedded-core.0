Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web11.39792.1590441990317146707
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 14:26:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fiFvGCZj;
 spf=pass (domain: linaro.org, ip: 209.85.167.65, mailfrom: daniel.diaz@linaro.org)
Received: by mail-lf1-f65.google.com with SMTP id x22so11156897lfd.4
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 14:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fDKFHdujGfzRR3NalDuESJ5Va/Zc3K51mC5+aPpvC2I=;
        b=fiFvGCZjPQk18Jwzi77HmrvK/qnuicSYkSJbQd1/UYoaaZFBoF9lnkEOMcDkqUxmZw
         akVJYr7MLvrNemt3aPbkqZ/lmBSVvwX608eMB4PeTSsCsJcVFncrHT+WGFCvPQFDTCwp
         h7cmyKpR1HlMrY4b0+lad/D9DIL4pRq7jvtg2Obmvpjz5MjIh7axgvpCDMAbdG/G2Zap
         9Dw9lnjwWI6QlGST/2VGYNGHnQIuo1k7JSmZXs79yWELgEYuTg3MRQo+jtHsy1R/tpQi
         S5ZBX6+ziuAh9pvB7w1XlHZSRlWgbZkodGIW6q5gnTahSFBA+l66FCkdirf9uXpFJ1Sb
         gC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fDKFHdujGfzRR3NalDuESJ5Va/Zc3K51mC5+aPpvC2I=;
        b=KXzOi/NeaveTZ9VQo5N8FX5+a/7ubrK8TP/eDKo1vRwBmW51X2Asm14dvKMd3eCyW9
         9Va0BJp0yocWGEWnRXqpvErMIhSgh0IIRZLsLIvqKU+2YQxaM28NfBcyJko0J5coi9j0
         JJxPkdPxhIJnKWNLmG+rE0Tbrwpdtcg+CbJJv8kJCz1lOv4T+Lq103G4AoW+r07lsWba
         MVxQubw3Ao7LvWixilQzVtwQTkWPUTJCF7XfYkOSE1QCsiYi+fp8OIbMfjAF3yWLxSJL
         nXDrXTbYP4xGr73iAynieSocnchVR1c1SQ3dGabFe6usCcs6Grjsebga05i2Xq3CHfQS
         89rg==
X-Gm-Message-State: AOAM533OZfSfdi4ledoqlmU+N8MIFg/mdil75coDqm0qbBAMLLeQJVbK
	3IO7u+Gg+OhWLo0plZDGQ8URaUQ/x7O6NjfFVnm54g==
X-Google-Smtp-Source: ABdhPJxmSYOzIIJNhZoo7iMzvI1Mud6V43oBplwqsPSsm62CyCo6PBUuxAAmJaW4Gu+XmutRKy49WAjkUOJ1NHLmMHw=
X-Received: by 2002:ac2:4143:: with SMTP id c3mr15261841lfi.131.1590441988428;
 Mon, 25 May 2020 14:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200525170706.14494-1-daniel.diaz@linaro.org> <af89295856ed85a7c8b206db7a3ce49a7388f042.camel@linuxfoundation.org>
In-Reply-To: <af89295856ed85a7c8b206db7a3ce49a7388f042.camel@linuxfoundation.org>
From: "Daniel D?az" <daniel.diaz@linaro.org>
Date: Mon, 25 May 2020 16:26:17 -0500
Message-ID: <CAEUSe7-qVEjJTfCbJ1o_Haswk7ehicAYuDO2j5fyBC3snSogBA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ltp: Add net-tools as rdependency
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

On Mon, 25 May 2020 at 15:38, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2020-05-25 at 12:07 -0500, Daniel D?az wrote:
> > The version of ifconfig provided by Busybox is not enough for
> > some tests. Here's an example of how it fails with test
> > netns_breakns_ns_exec_ipv4_ioctl:
> >   ifconfig: bad address '192.168.0.2/24'
> >   ifconfig: bad address 'inet6'
> >
> > This works with net-tools' ifconfig.
> >
> > Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
> > ---
> >  meta/recipes-extended/ltp/ltp_20200515.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-extended/ltp/ltp_20200515.bb
> > b/meta/recipes-extended/ltp/ltp_20200515.bb
> > index e82f6b33a1..317a4e461a 100644
> > --- a/meta/recipes-extended/ltp/ltp_20200515.bb
> > +++ b/meta/recipes-extended/ltp/ltp_20200515.bb
> > @@ -89,6 +89,7 @@ RDEPENDS_${PN} =3D "\
> >      ldd \
> >      libaio \
> >      logrotate \
> > +    net-tools \
> >      perl \
> >      python3-core \
> >      procps \
>
> I think there are a few more issues like this too.
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13802
> has some logs which show:
>
> /opt/ltp/testcases/bin/run_cpuctl_stress_test.sh: line 242: nice: command=
 not found
> /opt/ltp/testcases/bin/run_cpuctl_test_fj.sh: line 66: tac: command not f=
ound
> vma05 1 TCONF: 'gdb' not found
> memcg_failcnt 1 TCONF: 'bc' not found
> Owner=3Dnobody; perms=3D-rw-------; sudo: lsattr: command not found
> sh: systemd-detect-virt: command not found
>
> (some repeated many time)
>
> I'm also worried about the memory size of the VM we run the ltp tests
> under. Is there a recommended amount of memory they need?

I wouldn't know -- we run LTP on actual hardware where the minimum RAM
is 2 GB; for Qemu we provide 4 GB of guest RAM. Probably Petr (CC'ed)
has more insight on that front.

Thanks and greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org
