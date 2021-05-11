Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web08.11462.1620732848413393442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 04:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PUd+eISz;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id g24so6226567uak.11
        for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 04:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iF4zHVbzA4NntgenBIKi2MdNarYhP5u5ytM5lkeqQzA=;
        b=PUd+eISzSvPb048USY+NlwHsUVFyYb93O0uDlio1xV201ZbWEz9TdStHllM2f0RvKz
         tB+F+mme7mSwoXuMrIK+y9pKJKDjzsOWMjAhDzwV6zGTXPZmjRCLnSwVabyfCEGaXREH
         WZZgasS6wu8XIJ3MeqjH4pl0JaMWBbRiVClb8viaSDmOKPwoGCdJLS2JO18189+1wAr+
         6Qc81kJeyThZYfvGOeL9e5aAfkmhzje5fABMQKScRWntCL1f9iRcS864jsPZaWJ94VUt
         JYnLV6kGcx9RBqSbSo5l2PIYaSNC3JioPjUaS3J1v1TqL/uK07Qn55IpN2dHVR4+AU8s
         UlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iF4zHVbzA4NntgenBIKi2MdNarYhP5u5ytM5lkeqQzA=;
        b=OlgnCP/y5E62pR3xZq1/FwYCP7q2AMUuEzxn57vbsuN0D4/nc/8mDeXxv/+jXX1qFW
         FZTh3bAQdr/RbEZtnsdafNidGGpBmBkzJ+UOZaxnPmUlDGFKMNeVdCXDZx/PvSTTJhMn
         UGKKk4QLV2/M6ndZQPGxP4Rikp7bFA2keuMkrcOOAB1Xx0fkT3U8Bub9T/o2cU8wQqfW
         Vt7kaKBGepE96Q1Kl3xUvJbhsikhY7p/n7EbD4ihoLx8QNEPvkS7GIAH/hLhKBphyf6o
         HijnsiraJc2RcT2Ml0jHLrPALNNe65Bg3P8FXa288aOQtICx8Kq7Z9SvIgZD8jHA1x5b
         8QrA==
X-Gm-Message-State: AOAM532Y/rf0swmwEyUq/eQYiBw6hrMarKeD8DByjmt9sANdBobqcbsS
	aQd8Mg/N6UxEFvxIWnGyzXvNsGHsKdVzJUfr5+U=
X-Google-Smtp-Source: ABdhPJyghYGowXu1Fs2yMdiViKITijxaoWRyQ4PLGqXQo//wmvC6HL8teCXNBe5OojuulLvJS4k/FMbC5t2wJq5nk8c=
X-Received: by 2002:ab0:4e0b:: with SMTP id g11mr6665447uah.22.1620732847597;
 Tue, 11 May 2021 04:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <167DF913750C3E0E.1178@lists.openembedded.org> <82398336819fe90e1645fb2176037e28b11eb360.camel@linuxfoundation.org>
In-Reply-To: <82398336819fe90e1645fb2176037e28b11eb360.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 11 May 2021 13:33:56 +0200
Message-ID: <CANNYZj8ujWetFPd+S4KpiV22ZrQMO7ozn2cpBmzs44RcgO-zgQ@mail.gmail.com>
Subject: Re: [OE-core] QEMU rcu stalls on autobuilder - not what they seem?
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Tim Orling <timothy.t.orling@linux.intel.com>, "Mittal, Anuj" <anuj.mittal@intel.com>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000a82e9b05c20c4558"

--000000000000a82e9b05c20c4558
Content-Type: text/plain; charset="UTF-8"

A quick question: are the AB machines using nested kvm, or are they
baremetal?

We've seen similar errors here with qemu SMP that were only resolved after
moving to baremetal builds for qemu targets.

Alex

On Tue, 11 May 2021 at 11:59, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2021-05-11 at 10:28 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > We have patches in master-next where we test enabling SMP for x86 and
> arm.
> > This has resulted in a few build failures where qemu crashes with an RCU
> > stall. The SMP output is different to our non-SMP case. For ages we've
> > been blaming the autobuilder load/contention. The SMP case does appear to
> > have it happen more regularly but it was happening before.
> >
> > As an example, this morning I awoke to:
> >
> >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/2123/steps/14/logs/stdio
> >
> > and I've pasted the full boot log below. It is easy to blame the
> autobuilder
> > load as usual but I'd note that the kernel messages stop after about 1s
> after
> > the tsc clocksource message.
> >
> > I'd argue that the RCU stall message is just pointing out the kernel is
> mostly
> > dead, its also interesting the RCU stall handler crashes before it can
> print
> > the process traces.
> >
> > I read that the tsc clocksource message hang is notorious as it is where
> the
> > kernel starts initing other subsystems so the issue may not be in the
> tsc
> > clocksource but elsewhere. I'd also note it is using the kvm-clocksource
> and just
> > inited the tsc clocksource, it isn't using it. The TSC clocksource
> appears to be
> > know it init slowly.
> >
> > I think we may have some other kernel issue going on here and blaming
> the
> > autobuilder load isn't the right path forward. Is there anyone who
> understands
> > what may be going on here or a way we could debug it further?
>
> To follow up, some qemu literate friends looked at this and asked why on
> earth we were using a machine type from 1996 and why such an old cpu which
> didn't
> support SMP and had a broken TSC. I think those are good questions. The
> current
> options we're using aren't tested by others. They also suggested some qemu
> boot
> options which if nothing else could speed things up.
>
> It is time we changed the x86 qemu types so I've put a patch into
> master-next
> for testing moving to IvyBridge and the cpu options. I think these are
> changes
> we should be making anyway but I'd be very happy if the help the AB-INT
> issues
> which have been plaguing us.
>
> Cheers,
>
> Richard
>
>
>
> 
>
>

--000000000000a82e9b05c20c4558
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>A quick question: are the AB machines using nested kv=
m, or are they baremetal?</div><div><br></div><div>We&#39;ve seen similar e=
rrors here with qemu SMP that were only resolved after moving to baremetal =
builds for qemu targets.<br></div><div><br></div><div>Alex<br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue,=
 11 May 2021 at 11:59, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@=
linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2021-05-11 a=
t 10:28 +0100, Richard Purdie via <a href=3D"http://lists.openembedded.org"=
 rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; We have patches in master-next where we test enabling SMP for x86 and=
 arm.<br>
&gt; This has resulted in a few build failures where qemu crashes with an =
RCU=C2=A0<br>
&gt; stall. The SMP output is different to our non-SMP case. For ages we&#=
39;ve<br>
&gt; been blaming the autobuilder load/contention. The SMP case does appea=
r to<br>
&gt; have it happen more regularly but it was happening before.<br>
&gt; <br>
&gt; As an example, this morning I awoke to:<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/87=
/builds/2123/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">http=
s://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/2123/steps/14=
/logs/stdio</a><br>
&gt; <br>
&gt; and I&#39;ve pasted the full boot log below. It is easy to blame the =
autobuilder<br>
&gt; load as usual but I&#39;d note that the kernel messages stop after ab=
out 1s after<br>
&gt; the tsc clocksource message.<br>
&gt; <br>
&gt; I&#39;d argue that the RCU stall message is just pointing out the ker=
nel is mostly<br>
&gt; dead, its also interesting the RCU stall handler crashes before it ca=
n print<br>
&gt; the process traces.<br>
&gt; <br>
&gt; I read that the tsc clocksource message hang is notorious as it is wh=
ere the<br>
&gt; kernel starts initing other subsystems so the issue may not be in the=
 tsc=C2=A0<br>
&gt; clocksource but elsewhere. I&#39;d also note it is using the kvm-cloc=
ksource and just<br>
&gt; inited the tsc clocksource, it isn&#39;t using it. The TSC clocksourc=
e appears to be<br>
&gt; know it init slowly.<br>
&gt; <br>
&gt; I think we may have some other kernel issue going on here and blaming=
 the=C2=A0<br>
&gt; autobuilder load isn&#39;t the right path forward. Is there anyone wh=
o understands<br>
&gt; what may be going on here or a way we could debug it further?<br>
<br>
To follow up, some qemu literate friends looked at this and asked why on<b=
r>
earth we were using a machine type from 1996 and why such an old cpu which=
 didn&#39;t<br>
support SMP and had a broken TSC.=C2=A0I think those are good questions.=
=C2=A0The current <br>
options we&#39;re using aren&#39;t tested by others. They also=C2=A0sugges=
ted some qemu boot<br>
options which if nothing else could speed things up.<br>
<br>
It is time we changed the x86 qemu types so I&#39;ve put a patch into mast=
er-next<br>
for testing moving to IvyBridge and the cpu options. I think these are cha=
nges<br>
we should be making anyway but I&#39;d be very happy if the help the AB-IN=
T issues<br>
which have been plaguing us.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000a82e9b05c20c4558--
