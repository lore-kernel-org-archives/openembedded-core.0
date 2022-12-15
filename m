Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC4DC4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 21:45:47 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.147400.1671140743658449776
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 13:45:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: aehs29@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id z9so338626ilu.10
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 13:45:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UpfZfRQvxXdK3+ndJ+9yMSmxN3W5SzOaRGcmgGsk7Q=;
        b=XpfpmbPuyeyPLUK+6hEKbjRmBr94K6Re/yozwa0RM3GwHDNbeAGNZvT+gj201gAyxe
         gEAhomGaaZEUyANynH3A2Ipr5lEjhwLTsd2gT91ANHerN1U+ZhcK71hFgbunUkgiBQPK
         3tZEwrafq6OZMOst38GOgvmgnDtkErf5kKVqLh6QmQFi5CmaTtKQpSguXbkvI1jvY+8i
         z/+Jo/ACT7EP2+rxO3xTuFyZIN3DBT7In0Dfd25HSOsCuI+6QDGy/Bar6lc4nqRz/77Z
         1cHcDrYrmLXy+8sedIGJEPWU9slt5KGeUG5Pm2bHMNLcBeb8sI3ih8pA3bcdlAr8xqBx
         YD5w==
X-Gm-Message-State: ANoB5plVDXG9hOx7oK7bR8WqyVkmvO/98mVM6ohdYxe8tpu7tTjqoUu4
	aJxxZYSvbuNsIYac9ojIXYtUh/lFYJ/WQA==
X-Google-Smtp-Source: AA0mqf6hqGTNxlGAqqeqOGh3x2cRfKePih/qhyWcebsmAMhSYrGxd4MH1i0KgPSahg1Dz6WA6lmKag==
X-Received: by 2002:a05:6e02:1b0d:b0:304:a619:c3f2 with SMTP id i13-20020a056e021b0d00b00304a619c3f2mr19743675ilv.9.1671140742754;
        Thu, 15 Dec 2022 13:45:42 -0800 (PST)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com. [209.85.166.173])
        by smtp.gmail.com with ESMTPSA id y16-20020a056638229000b0038aa0e5e9cfsm146010jas.75.2022.12.15.13.45.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 13:45:42 -0800 (PST)
Received: by mail-il1-f173.google.com with SMTP id d14so336458ilq.11
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 13:45:42 -0800 (PST)
X-Received: by 2002:a92:904:0:b0:303:1869:3a84 with SMTP id
 y4-20020a920904000000b0030318693a84mr25800806ilg.37.1671140742186; Thu, 15
 Dec 2022 13:45:42 -0800 (PST)
MIME-Version: 1.0
References: <20221215073224.3061128-1-alejandro@enedino.org>
 <CANNYZj9qbT+fGQ=18hjLkzR4D=eyr1amX2qxpwM5u_XQTqLo3g@mail.gmail.com>
 <CAHMutrae2sCtGqa-aXVYz1_kDkCtnY2qjKLhGunA-U3-ZxthnA@mail.gmail.com>
 <CAO5Uq5S2reaaVJe7hZwL2okWjKBbVhU_=g6bMjguQ7T9UNC-Vw@mail.gmail.com>
 <CAHMutrZnL2e4_7AuPkacEb-Rgyw0cb7eaErjWRuXZYXu_fUZgw@mail.gmail.com>
 <1731096B411C6A99.9432@lists.openembedded.org> <CANNYZj9BmxffYxhd1gWy6dUBcsjHi6kXgswC=4LVXUnePSOo1w@mail.gmail.com>
 <CAHMutrZhNPdLoiFTfOVvHiqqeYwSOyPB3v2qmmy7BUoraj=GZg@mail.gmail.com>
 <CAHMutrbJo2ocWz88UbQsRjBDccXr0yVDC60SZ35bdMaXHw8LAw@mail.gmail.com> <CAO5Uq5QT1zg1jC0wHFMxv0T+m7y_GSS2Wdg_vbuG3Yi5hOZpgQ@mail.gmail.com>
In-Reply-To: <CAO5Uq5QT1zg1jC0wHFMxv0T+m7y_GSS2Wdg_vbuG3Yi5hOZpgQ@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Thu, 15 Dec 2022 15:45:32 -0600
X-Gmail-Original-Message-ID: <CAHMutrYvqcZ806jGpOYwgNrQJKUhoRicf_6M+9REPV5L2Mttxw@mail.gmail.com>
Message-ID: <CAHMutrYvqcZ806jGpOYwgNrQJKUhoRicf_6M+9REPV5L2Mttxw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust: Enable building rust from stable,
 beta and nightly channels
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004ed2be05efe4c623"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 21:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174728

--0000000000004ed2be05efe4c623
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 15, 2022, 3:36 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:

> On Thu, Dec 15, 2022 at 6:24 PM Alejandro Enedino Hernandez Samaniego
> <alejandro@enedino.org> wrote:
> >
> >
> >
> > On Thu, 15 Dec 2022 at 11:11, Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org> wrote:
> >>
> >>
> >> On Thu, 15 Dec 2022 at 11:03, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >>>
> >>> On Thu, 15 Dec 2022 at 19:01, Alexander Kanavin via
> >>> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> >>> wrote:
> >>> > Ok, I think what we should do first is to actually drop the version
> >>> > from all of the .bb file names, and set it once, inside some .inc,
> and
> >>> > probably next to SRC_URI and tarball checksum. Then this should allow
> >>> > a convenient scheme for including and overriding things.
> >>> >
> >>> > rust_1.65.0.bb - > rust.bb, and so on.
> >>>
> >>> Oh, and upstream version checks must be kept functional. It needs to
> >>> both correctly report a newer version, and match the recipe version
> >>> with upstream if it is already the latest.
> >>>
> >>> Alex
> >>
> >>
> >> How should I test that upstream checks are still functional?
> >>
> >>
> > Actually how would this make it any simpler?, if we remove PV from the
> filenames, the correct place to put the variable is in rust-source.inc
> since all others include it (rust-cross-canadian, rust, rust-llvm), if like
> I said, rust-source.inc gets included from somewhere else, wouldnt that
> override PV for the other recipe as well? beating the whole purpose of the
> change, this, or creating a new .inc file just for this seems too
> convoluted IMO.
> >
> > If changing RUST_VERSION is too problematic on every upgrade I think
> approach #2 its a lot simpler just specifying RUST_VERSION on other recipes
> since it would be very seldom used and it wont conflict with upgrades
> >
>
> Actually changing it is clearly straightforward, the problem is that
> upgrading the rust version is already tricky because of the need to
> regenerate the cargo checksums, so every extra step is something that
> you have to remember to do.
>
> Which leaves me wondering how introducing nightly/beta actually work
> with those patches?
>

I understand that , the checksums/patches shouldn't cause any problem since
as its explained in the commit message beta/nightly builds from the exact
same sources, hence patches should apply and checksums wouldn't change.

I'll be sending a v2 later today

Alejandro


>
>
> --
> Alex Kiernan
>

--0000000000004ed2be05efe4c623
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Dec 15, 2022, 3:36 PM Alex Kiernan &lt;<a href=
=3D"mailto:alex.kiernan@gmail.com">alex.kiernan@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">On Thu, Dec 15, 2022 at 6:24 PM Aleja=
ndro Enedino Hernandez Samaniego<br>
&lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank" rel=3D"noref=
errer">alejandro@enedino.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Thu, 15 Dec 2022 at 11:11, Alejandro Enedino Hernandez Samaniego &l=
t;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank" rel=3D"norefer=
rer">alejandro@enedino.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Thu, 15 Dec 2022 at 11:03, Alexander Kanavin &lt;<a href=3D"mai=
lto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanav=
in@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Thu, 15 Dec 2022 at 19:01, Alexander Kanavin via<br>
&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer no=
referrer" target=3D"_blank">lists.openembedded.org</a> &lt;alex.kanavin=3D<=
a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank" rel=3D=
"noreferrer">gmail.com@lists.openembedded.org</a>&gt;<br>
&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt; &gt; Ok, I think what we should do first is to actually drop t=
he version<br>
&gt;&gt;&gt; &gt; from all of the .bb file names, and set it once, inside s=
ome .inc, and<br>
&gt;&gt;&gt; &gt; probably next to SRC_URI and tarball checksum. Then this =
should allow<br>
&gt;&gt;&gt; &gt; a convenient scheme for including and overriding things.<=
br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; <a href=3D"http://rust_1.65.0.bb" rel=3D"noreferrer noref=
errer" target=3D"_blank">rust_1.65.0.bb</a> - &gt; <a href=3D"http://rust.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">rust.bb</a>, and so on.<=
br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Oh, and upstream version checks must be kept functional. It ne=
eds to<br>
&gt;&gt;&gt; both correctly report a newer version, and match the recipe ve=
rsion<br>
&gt;&gt;&gt; with upstream if it is already the latest.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Alex<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; How should I test that upstream checks are still functional?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; Actually how would this make it any simpler?, if we remove PV from the=
 filenames, the correct place to put the variable is in rust-source.inc sin=
ce all others include it (rust-cross-canadian, rust, rust-llvm), if like I =
said, rust-source.inc gets included from somewhere else, wouldnt that overr=
ide PV for the other recipe as well? beating the whole purpose of the chang=
e, this, or creating a new .inc file just for this seems too convoluted IMO=
.<br>
&gt;<br>
&gt; If changing RUST_VERSION is too problematic on every upgrade I think a=
pproach #2 its a lot simpler just specifying RUST_VERSION on other recipes =
since it would be very seldom used and it wont conflict with upgrades<br>
&gt;<br>
<br>
Actually changing it is clearly straightforward, the problem is that<br>
upgrading the rust version is already tricky because of the need to<br>
regenerate the cargo checksums, so every extra step is something that<br>
you have to remember to do.<br>
<br>
Which leaves me wondering how introducing nightly/beta actually work<br>
with those patches?<br></blockquote></div></div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"></blockquote></div></div><div dir=3D"auto">I understand that , the checks=
ums/patches shouldn&#39;t cause any problem since as its explained in the c=
ommit message beta/nightly builds from the exact same sources, hence patche=
s should apply and checksums wouldn&#39;t change.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">I&#39;ll be sending a v2 later today</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Alejandro=C2=A0</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
<br>
<br>
--<br>
Alex Kiernan<br>
</blockquote></div></div></div>

--0000000000004ed2be05efe4c623--

