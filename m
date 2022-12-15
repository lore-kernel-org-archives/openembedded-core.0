Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1BEC4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 18:24:13 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web11.142044.1671128647938497867
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 10:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: aehs29@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id z18so60086ils.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 10:24:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NpGHT9XK3J+NwIzd1QFR+oKbQScX0aSsUtVl95nRKcA=;
        b=2fHBLg9C0I8y9dlMab7XtvqrwcMNPEOQdUZzHWaEq2AmDZg+7XKTxa/GJQ8zaPKBoV
         /UGmu2PxcihDMn0S4lDknt3LEl1IuzOHyXXlmdkewx+OEeLReK4XMHpL+FLtZSpewOVp
         L3wLui6uG3z2abGsz0WQG27ZRSK7yAMSwe2mA5EfhIwGzRQApmuBJAQdSBbxLlKACc9M
         ge6c2E2RBaTj+UWssPe1qq8VGuqSzonXZS9PnLz+L1fOsNubHMVU60YigXK73tCnDFJ1
         mCUMOW5oSlNUIR7e1ucoDG0G9f4l9rLFRxNHSKTcDQ6RRUsMaPstfCJQaeea/aNGNi0l
         v8gA==
X-Gm-Message-State: ANoB5pmUHL50CeoJ3mrwlJ40Ox54Zry2pPqHT8Bky+sDlinHbK8hBW5g
	zm7SPA3AbD81P1Ly38IkwZGIp5uEQKw9cQ==
X-Google-Smtp-Source: AA0mqf5TgWTHLMA3UXQj5f8QEmdszcQzXHk73rSIuuSw0MiCvLI6iHcX6w8T0bv/OP7qrOD9EOSimA==
X-Received: by 2002:a92:2808:0:b0:304:cd82:6459 with SMTP id l8-20020a922808000000b00304cd826459mr6258580ilf.24.1671128647008;
        Thu, 15 Dec 2022 10:24:07 -0800 (PST)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id y24-20020a027318000000b0038a6ae38ceasm29607jab.26.2022.12.15.10.24.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 10:24:06 -0800 (PST)
Received: by mail-io1-f42.google.com with SMTP id h6so38729iof.9
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 10:24:06 -0800 (PST)
X-Received: by 2002:a02:85ab:0:b0:389:fed9:fff2 with SMTP id
 d40-20020a0285ab000000b00389fed9fff2mr19597233jai.123.1671128646625; Thu, 15
 Dec 2022 10:24:06 -0800 (PST)
MIME-Version: 1.0
References: <20221215073224.3061128-1-alejandro@enedino.org>
 <CANNYZj9qbT+fGQ=18hjLkzR4D=eyr1amX2qxpwM5u_XQTqLo3g@mail.gmail.com>
 <CAHMutrae2sCtGqa-aXVYz1_kDkCtnY2qjKLhGunA-U3-ZxthnA@mail.gmail.com>
 <CAO5Uq5S2reaaVJe7hZwL2okWjKBbVhU_=g6bMjguQ7T9UNC-Vw@mail.gmail.com>
 <CAHMutrZnL2e4_7AuPkacEb-Rgyw0cb7eaErjWRuXZYXu_fUZgw@mail.gmail.com>
 <1731096B411C6A99.9432@lists.openembedded.org> <CANNYZj9BmxffYxhd1gWy6dUBcsjHi6kXgswC=4LVXUnePSOo1w@mail.gmail.com>
 <CAHMutrZhNPdLoiFTfOVvHiqqeYwSOyPB3v2qmmy7BUoraj=GZg@mail.gmail.com>
In-Reply-To: <CAHMutrZhNPdLoiFTfOVvHiqqeYwSOyPB3v2qmmy7BUoraj=GZg@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Thu, 15 Dec 2022 11:23:55 -0700
X-Gmail-Original-Message-ID: <CAHMutrbJo2ocWz88UbQsRjBDccXr0yVDC60SZ35bdMaXHw8LAw@mail.gmail.com>
Message-ID: <CAHMutrbJo2ocWz88UbQsRjBDccXr0yVDC60SZ35bdMaXHw8LAw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust: Enable building rust from stable,
 beta and nightly channels
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005b2fa305efe1f5c1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 18:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174590

--0000000000005b2fa305efe1f5c1
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Dec 2022 at 11:11, Alejandro Enedino Hernandez Samaniego <
alejandro@enedino.org> wrote:

>
> On Thu, 15 Dec 2022 at 11:03, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> On Thu, 15 Dec 2022 at 19:01, Alexander Kanavin via
>> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
>> wrote:
>> > Ok, I think what we should do first is to actually drop the version
>> > from all of the .bb file names, and set it once, inside some .inc, and
>> > probably next to SRC_URI and tarball checksum. Then this should allow
>> > a convenient scheme for including and overriding things.
>> >
>> > rust_1.65.0.bb - > rust.bb, and so on.
>>
>> Oh, and upstream version checks must be kept functional. It needs to
>> both correctly report a newer version, and match the recipe version
>> with upstream if it is already the latest.
>>
>> Alex
>>
>
> How should I test that upstream checks are still functional?
>
>
> Actually how would this make it any simpler?, if we remove PV from the
filenames, the correct place to put the variable is in rust-source.inc
since all others include it (rust-cross-canadian, rust, rust-llvm), if like
I said, rust-source.inc gets included from somewhere else, wouldnt that
override PV for the other recipe as well? beating the whole purpose of the
change, this, or creating a new .inc file just for this seems too
convoluted IMO.

If changing RUST_VERSION is too problematic on every upgrade I think
approach #2 its a lot simpler just specifying RUST_VERSION on other recipes
since it would be very seldom used and it wont conflict with upgrades

Alejandro

--0000000000005b2fa305efe1f5c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif;font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 15 Dec 2022 =
at 11:11, Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"mailto:aleja=
ndro@enedino.org">alejandro@enedino.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><d=
iv style=3D"font-family:arial,sans-serif;font-size:small"><br></div></div><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"><span class=
=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:small"><=
/span>On Thu, 15 Dec 2022 at 11:03, Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 15=
 Dec 2022 at 19:01, Alexander Kanavin via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.o=
rg</a>&gt;<br>
wrote:<br>
&gt; Ok, I think what we should do first is to actually drop the version<br=
>
&gt; from all of the .bb file names, and set it once, inside some .inc, and=
<br>
&gt; probably next to SRC_URI and tarball checksum. Then this should allow<=
br>
&gt; a convenient scheme for including and overriding things.<br>
&gt;<br>
&gt; <a href=3D"http://rust_1.65.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>rust_1.65.0.bb</a> - &gt; <a href=3D"http://rust.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">rust.bb</a>, and so on.<br>
<br>
Oh, and upstream version checks must be kept functional. It needs to<br>
both correctly report a newer version, and match the recipe version<br>
with upstream if it is already the latest.<br>
<br>
Alex<br></blockquote><div><br></div><div style=3D"font-family:arial,sans-se=
rif;font-size:small">How should I test that upstream checks are still funct=
ional?</div><div style=3D"font-family:arial,sans-serif"><br></div><br></div=
></div></blockquote><div><div class=3D"gmail_default" style=3D"font-family:=
arial,sans-serif;font-size:small">Actually how would this make it any simpl=
er?, if we remove PV from the filenames, the correct place to put the varia=
ble is in rust-source.inc since all others include it (rust-cross-canadian,=
 rust, rust-llvm), if like I said, rust-source.inc gets included from somew=
here else, wouldnt that override PV for the other recipe as well? beating t=
he whole purpose of the change, this, or creating a new .inc file just for =
this seems too convoluted IMO.</div><div class=3D"gmail_default" style=3D"f=
ont-family:arial,sans-serif;font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-family:arial,sans-serif;font-size:small">If changing=
 RUST_VERSION is too problematic on every upgrade I think approach #2 its a=
 lot simpler just specifying RUST_VERSION on other recipes since it would b=
e very seldom used and it wont conflict with upgrades</div><div class=3D"gm=
ail_default" style=3D"font-family:arial,sans-serif;font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-=
size:small">Alejandro</div><br></div><div>=C2=A0</div></div></div>

--0000000000005b2fa305efe1f5c1--

