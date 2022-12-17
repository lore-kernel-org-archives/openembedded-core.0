Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF0BC4167B
	for <webhook@archiver.kernel.org>; Sat, 17 Dec 2022 01:20:32 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web11.970.1671240024756939660
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 17:20:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: aehs29@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id y2so2135106ily.5
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 17:20:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRIoN1F6gYuSJjk5SGDfc49gavkzxvX5njoBJKjOBYM=;
        b=wBt2xVp8ZAodIeA4b3SsLCuDmaG10uTWosVNZVxka2CX56LVedTpbo2fe8gjPRLLBA
         UiR58fD199o6Mlt4W7rXprAlbViiClpjgVfAZVKbkBPYkUmNQ39+eWho9KrYckYsgCBo
         MZVfKpoFFBmBKaWtBYdYvREyivVx5GvrHxnO9P9CSiOpM1xaL4uZ7e0tZFBfzlkYpTz7
         Gmz//rC4v9qZHnYQ4yj+P5VD6+HndEtWcVbbIBV5LEUg/sskjAWYBH/cTCa5JdpvzY3Y
         D0F0p7wazPwI9zY+P+pKmn3+XYKe0slbkUltIlTLaYdrKBh7/kH9RDs75lpaNcDrlKPU
         CznQ==
X-Gm-Message-State: ANoB5pnBPY8g53EUlSmCU+l3kmH26SMh6O4AEc3yLOfl2YvUyZC/dqOB
	wpsbsMP9kV6d1wG9hmACQdKu38TnanrbJg==
X-Google-Smtp-Source: AA0mqf50FPPbcxz9wXqTJds4CpQTGxkyWj/mdmh8lPWBOcW68bI3ReYH3/zedXaqc/nkTqC6gbK53w==
X-Received: by 2002:a92:dd03:0:b0:303:2528:6d90 with SMTP id n3-20020a92dd03000000b0030325286d90mr18209974ilm.24.1671240023884;
        Fri, 16 Dec 2022 17:20:23 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id i7-20020a05663815c700b00374bf3b62a0sm1192184jat.99.2022.12.16.17.20.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 17:20:23 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id n63so2111211iod.7
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 17:20:23 -0800 (PST)
X-Received: by 2002:a05:6638:240a:b0:38a:2f56:d739 with SMTP id
 z10-20020a056638240a00b0038a2f56d739mr14956353jat.111.1671240022915; Fri, 16
 Dec 2022 17:20:22 -0800 (PST)
MIME-Version: 1.0
References: <20221215073224.3061128-1-alejandro@enedino.org>
 <CANNYZj9qbT+fGQ=18hjLkzR4D=eyr1amX2qxpwM5u_XQTqLo3g@mail.gmail.com>
 <CAHMutrae2sCtGqa-aXVYz1_kDkCtnY2qjKLhGunA-U3-ZxthnA@mail.gmail.com>
 <CAO5Uq5S2reaaVJe7hZwL2okWjKBbVhU_=g6bMjguQ7T9UNC-Vw@mail.gmail.com>
 <CAHMutrZnL2e4_7AuPkacEb-Rgyw0cb7eaErjWRuXZYXu_fUZgw@mail.gmail.com>
 <1731096B411C6A99.9432@lists.openembedded.org> <CANNYZj9BmxffYxhd1gWy6dUBcsjHi6kXgswC=4LVXUnePSOo1w@mail.gmail.com>
 <CAHMutrZhNPdLoiFTfOVvHiqqeYwSOyPB3v2qmmy7BUoraj=GZg@mail.gmail.com>
 <CAHMutrbJo2ocWz88UbQsRjBDccXr0yVDC60SZ35bdMaXHw8LAw@mail.gmail.com>
 <CAO5Uq5QT1zg1jC0wHFMxv0T+m7y_GSS2Wdg_vbuG3Yi5hOZpgQ@mail.gmail.com>
 <CAHMutrYvqcZ806jGpOYwgNrQJKUhoRicf_6M+9REPV5L2Mttxw@mail.gmail.com> <CAO5Uq5RTVPLuTS8JePuTy2jgGq6troObiMiPcoUg0VMzbq=geg@mail.gmail.com>
In-Reply-To: <CAO5Uq5RTVPLuTS8JePuTy2jgGq6troObiMiPcoUg0VMzbq=geg@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Fri, 16 Dec 2022 18:20:12 -0700
X-Gmail-Original-Message-ID: <CAHMutrajquaPOofJH6YaF5kqLk2kWif-WVDuRXNRUfUv7f8ZLQ@mail.gmail.com>
Message-ID: <CAHMutrajquaPOofJH6YaF5kqLk2kWif-WVDuRXNRUfUv7f8ZLQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust: Enable building rust from stable,
 beta and nightly channels
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e6878705effbe3a4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 01:20:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174765

--000000000000e6878705effbe3a4
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Dec 2022 at 22:33, Alex Kiernan <alex.kiernan@gmail.com> wrote:

> On Thu, Dec 15, 2022 at 9:45 PM Alejandro Enedino Hernandez Samaniego
> <alejandro@enedino.org> wrote:
> >
> >
> >
> > On Thu, Dec 15, 2022, 3:36 PM Alex Kiernan <alex.kiernan@gmail.com>
> wrote:
> >>
> >> On Thu, Dec 15, 2022 at 6:24 PM Alejandro Enedino Hernandez Samaniego
> >> <alejandro@enedino.org> wrote:
> >> >
> >> >
> >> >
> >> > On Thu, 15 Dec 2022 at 11:11, Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org> wrote:
> >> >>
> >> >>
> >> >> On Thu, 15 Dec 2022 at 11:03, Alexander Kanavin <
> alex.kanavin@gmail.com> wrote:
> >> >>>
> >> >>> On Thu, 15 Dec 2022 at 19:01, Alexander Kanavin via
> >> >>> lists.openembedded.org <alex.kanavin=
> gmail.com@lists.openembedded.org>
> >> >>> wrote:
> >> >>> > Ok, I think what we should do first is to actually drop the
> version
> >> >>> > from all of the .bb file names, and set it once, inside some
> .inc, and
> >> >>> > probably next to SRC_URI and tarball checksum. Then this should
> allow
> >> >>> > a convenient scheme for including and overriding things.
> >> >>> >
> >> >>> > rust_1.65.0.bb - > rust.bb, and so on.
> >> >>>
> >> >>> Oh, and upstream version checks must be kept functional. It needs to
> >> >>> both correctly report a newer version, and match the recipe version
> >> >>> with upstream if it is already the latest.
> >> >>>
> >> >>> Alex
> >> >>
> >> >>
> >> >> How should I test that upstream checks are still functional?
> >> >>
> >> >>
> >> > Actually how would this make it any simpler?, if we remove PV from
> the filenames, the correct place to put the variable is in rust-source.inc
> since all others include it (rust-cross-canadian, rust, rust-llvm), if like
> I said, rust-source.inc gets included from somewhere else, wouldnt that
> override PV for the other recipe as well? beating the whole purpose of the
> change, this, or creating a new .inc file just for this seems too
> convoluted IMO.
> >> >
> >> > If changing RUST_VERSION is too problematic on every upgrade I think
> approach #2 its a lot simpler just specifying RUST_VERSION on other recipes
> since it would be very seldom used and it wont conflict with upgrades
> >> >
> >>
> >> Actually changing it is clearly straightforward, the problem is that
> >> upgrading the rust version is already tricky because of the need to
> >> regenerate the cargo checksums, so every extra step is something that
> >> you have to remember to do.
> >>
> >> Which leaves me wondering how introducing nightly/beta actually work
> >> with those patches?
> >
> >
> > I understand that , the checksums/patches shouldn't cause any problem
> since as its explained in the commit message beta/nightly builds from the
> exact same sources, hence patches should apply and checksums wouldn't
> change.
> >
>
> Sorry, now I'm properly confused, if the sources don't change, how is
> this beta/nightly?
>
> cargo-checksum.json is basically completely non-patch friendly, you
> have to fix it up every time as its based on the vendored sources in
> the tarball.
>
> --
> Alex Kiernan
>

Yes, I was confused at first myself, the channel actually works as a build
time flag, setting it to "beta" would enable the beta
features that already in the source code at the time of every release, same
with nightly hence why there are no extra conflicts
when doing upgrades..

I actually just did the upgrade from 1.65.0 to 1.66.0 to test this (I just
wasn't able to test target/native/nativesdk and all the arch
variants before yours went in) and using different channels worked like a
charm, no extra checksum changes other than the ones
we have in our patches already.

I'll be sending a v2 rebased on top of your 1.66.0 upgrade.

Alejandro

--000000000000e6878705effbe3a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif;font-size:small"><br></div></div><div dir=3D"ltr"=
><div dir=3D"ltr"><div style=3D"font-family:arial,sans-serif;font-size:smal=
l"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu, 15 Dec 2022 at 22:33, Alex Kiernan &lt;<a href=3D"mail=
to:alex.kiernan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, =
Dec 15, 2022 at 9:45 PM Alejandro Enedino Hernandez Samaniego<br>
&lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank">alejandro@en=
edino.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Dec 15, 2022, 3:36 PM Alex Kiernan &lt;<a href=3D"mailto:alex.=
kiernan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt; wrote:<=
br>
&gt;&gt;<br>
&gt;&gt; On Thu, Dec 15, 2022 at 6:24 PM Alejandro Enedino Hernandez Samani=
ego<br>
&gt;&gt; &lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank">ale=
jandro@enedino.org</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Thu, 15 Dec 2022 at 11:11, Alejandro Enedino Hernandez Sam=
aniego &lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank">aleja=
ndro@enedino.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Thu, 15 Dec 2022 at 11:03, Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.c=
om</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; On Thu, 15 Dec 2022 at 19:01, Alexander Kanavin via<b=
r>
&gt;&gt; &gt;&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"nore=
ferrer" target=3D"_blank">lists.openembedded.org</a> &lt;alex.kanavin=3D<a =
href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.co=
m@lists.openembedded.org</a>&gt;<br>
&gt;&gt; &gt;&gt;&gt; wrote:<br>
&gt;&gt; &gt;&gt;&gt; &gt; Ok, I think what we should do first is to actual=
ly drop the version<br>
&gt;&gt; &gt;&gt;&gt; &gt; from all of the .bb file names, and set it once,=
 inside some .inc, and<br>
&gt;&gt; &gt;&gt;&gt; &gt; probably next to SRC_URI and tarball checksum. T=
hen this should allow<br>
&gt;&gt; &gt;&gt;&gt; &gt; a convenient scheme for including and overriding=
 things.<br>
&gt;&gt; &gt;&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;&gt; &gt; <a href=3D"http://rust_1.65.0.bb" rel=3D"norefer=
rer" target=3D"_blank">rust_1.65.0.bb</a> - &gt; <a href=3D"http://rust.bb"=
 rel=3D"noreferrer" target=3D"_blank">rust.bb</a>, and so on.<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; Oh, and upstream version checks must be kept function=
al. It needs to<br>
&gt;&gt; &gt;&gt;&gt; both correctly report a newer version, and match the =
recipe version<br>
&gt;&gt; &gt;&gt;&gt; with upstream if it is already the latest.<br>
&gt;&gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt;&gt;&gt; Alex<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; How should I test that upstream checks are still function=
al?<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt; Actually how would this make it any simpler?, if we remove PV=
 from the filenames, the correct place to put the variable is in rust-sourc=
e.inc since all others include it (rust-cross-canadian, rust, rust-llvm), i=
f like I said, rust-source.inc gets included from somewhere else, wouldnt t=
hat override PV for the other recipe as well? beating the whole purpose of =
the change, this, or creating a new .inc file just for this seems too convo=
luted IMO.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; If changing RUST_VERSION is too problematic on every upgrade =
I think approach #2 its a lot simpler just specifying RUST_VERSION on other=
 recipes since it would be very seldom used and it wont conflict with upgra=
des<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; Actually changing it is clearly straightforward, the problem is th=
at<br>
&gt;&gt; upgrading the rust version is already tricky because of the need t=
o<br>
&gt;&gt; regenerate the cargo checksums, so every extra step is something t=
hat<br>
&gt;&gt; you have to remember to do.<br>
&gt;&gt;<br>
&gt;&gt; Which leaves me wondering how introducing nightly/beta actually wo=
rk<br>
&gt;&gt; with those patches?<br>
&gt;<br>
&gt;<br>
&gt; I understand that , the checksums/patches shouldn&#39;t cause any prob=
lem since as its explained in the commit message beta/nightly builds from t=
he exact same sources, hence patches should apply and checksums wouldn&#39;=
t change.<br>
&gt;<br>
<br>
Sorry, now I&#39;m properly confused, if the sources don&#39;t change, how =
is<br>
this beta/nightly?<br>
<br>
cargo-checksum.json is basically completely non-patch friendly, you<br>
have to fix it up every time as its based on the vendored sources in<br>
the tarball.<br>
<br>
-- <br>
Alex Kiernan<br></blockquote><div><br></div><div class=3D"gmail_default" st=
yle=3D"font-family:arial,sans-serif;font-size:small">Yes, I was confused at=
 first myself, the channel actually works as a build time flag, setting it =
to &quot;beta&quot; would enable the beta</div><div class=3D"gmail_default"=
 style=3D"font-family:arial,sans-serif;font-size:small">features that alrea=
dy in the source code at the time of every release, same with nightly hence=
 why there are no extra conflicts</div><div class=3D"gmail_default" style=
=3D"font-family:arial,sans-serif;font-size:small">when doing upgrades..</di=
v><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-family:aria=
l,sans-serif;font-size:small">I actually just did the upgrade from 1.65.0 t=
o 1.66.0 to test this (I just wasn&#39;t able to test target/native/natives=
dk and all the arch</div><div class=3D"gmail_default" style=3D"font-family:=
arial,sans-serif;font-size:small">variants before yours went in) and using =
different channels worked like a charm, no extra checksum changes other tha=
n the ones</div><div class=3D"gmail_default" style=3D"font-family:arial,san=
s-serif;font-size:small">we have in our patches already.</div><div class=3D=
"gmail_default" style=3D"font-family:arial,sans-serif;font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;fo=
nt-size:small">I&#39;ll be sending a v2 rebased on top of your 1.66.0 upgra=
de.</div><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif=
;font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-fami=
ly:arial,sans-serif;font-size:small">Alejandro=C2=A0</div></div></div>
</div>

--000000000000e6878705effbe3a4--

