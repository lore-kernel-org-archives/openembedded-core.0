Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED363C61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 11:46:07 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.web11.17459.1700653565386741522
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 03:46:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xw90BGpA;
 spf=pass (domain: gmail.com, ip: 209.85.221.169, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-4afe5fc8ad7so1477475e0c.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 03:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700653564; x=1701258364; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oi4bf8GsHYD+gda74xSN7pvqc1NtLb+9eLuTs9EDhDY=;
        b=Xw90BGpAART08JgvPTZfwWSqXI2OWNDEFnd0QNDk0GfloMYI7qV20b936aMoZmI+4P
         fyHp/jFaY8+TOpqpXLmd3Uox2D8ZipLW99oMdkMTTy7wGBZgEGQo6yRYCG7AFmVWgUSK
         55ekCQv26mhaG1zEIOBagKqnWU7s6zJyBDiACzDAkR/ZEZSZitaQ3GB5mPxbM3vjB8BQ
         gl7Y4aIyFov8SC2RJ/qem1TAxjk6hNoPYlcBJGWokLRbJJIhbmlKkbjCEFcczSXG+pSz
         knACva18PY0jHPiARft7m1f1bpzAq9TEjqbVuByepVNSu6P1gkLmtWHSJTDvGnoakxHb
         Yc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700653564; x=1701258364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oi4bf8GsHYD+gda74xSN7pvqc1NtLb+9eLuTs9EDhDY=;
        b=pmN9NLqrAzni1KEsEhi4pYgsAKn5WJ1u3rMBMzzHVlalgdO9F6Skm49YpdMHUuAtpJ
         +Go0hW9LHqFJQyPn6tsib5SK5S6wQsSo7A4IplqIDJeoqAAdtjA4r8aeV2feSXk+gHU1
         ZdjiJ5Eu/P6yb6fdnvFWrJ7LkNf37OKMMD+il4v6KI59S0HG3UcPwoMYJ9IKsUXFR8Pk
         SpfvHpAV+aHhHwyUlV9k+Rv71hakl3bOzv/URef4RGNy1Hm1ffvB1xKILJafwtczowwB
         hs4NTZfV4K+oFIXadRkVHzmv4KKE2vpLl/qg+ocZxkhCYrGGTa1zV7qmZ2KVo97hkj/e
         LGJQ==
X-Gm-Message-State: AOJu0YxHaQ8isNrzrt+8Zq1d4ChWBUmhI0rrvZCeo4/KvA3a81QMpHrt
	fQyqzo/2f7wqZhJ7PH6NABa3+OwE7tsR4iEsJFI=
X-Google-Smtp-Source: AGHT+IGEfTqe8h//5ja6B3xgCTX7ZpE9fLcVheJu6Lk0Hpl/jP9XkeU85d+hSC2feOU0xzRgsSU3w7PVI+Lfbw4SnUM=
X-Received: by 2002:a1f:dd82:0:b0:4a8:fcf8:9c77 with SMTP id
 u124-20020a1fdd82000000b004a8fcf89c77mr1954853vkg.6.1700653564376; Wed, 22
 Nov 2023 03:46:04 -0800 (PST)
MIME-Version: 1.0
References: <20231120144628.52664-1-adrian.freihofer@siemens.com>
 <20231120144628.52664-3-adrian.freihofer@siemens.com> <17996456E4E8A103.7061@lists.openembedded.org>
 <CANPvuRkN=exsjS1EUiM-MKDc+HN_LT2vNrsOSYuBsnP4jmzZFw@mail.gmail.com>
 <d9c8d5ec4c8ae98f8b065501292fbe2d32fbbfe6.camel@gmail.com>
 <CANPvuRnvgaH1_RMhcgSXcWen-+Dz6dv2RbqBNyMq0bsGQVTQMQ@mail.gmail.com> <CANNYZj8_mfVEY5Q6LMAdifXcFnMYJ-y-UekpZRpVzuyqpg76qQ@mail.gmail.com>
In-Reply-To: <CANNYZj8_mfVEY5Q6LMAdifXcFnMYJ-y-UekpZRpVzuyqpg76qQ@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 22 Nov 2023 11:45:53 +0000
Message-ID: <CANPvuRkWiLa4j8ST8-zXfAEkxijt41R_uQs3oc9uFnmU1UHaGw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] cmake.bbclass: optionally support qemu
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: adrian.freihofer@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000973ca6060abc4393"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 11:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191068

--000000000000973ca6060abc4393
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia ter=C3=A7a,
21/11/2023 =C3=A0(s) 11:21:

> On Tue, 21 Nov 2023 at 12:12, Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >> I was using it for running Unit Tests on the host before I deployed
> >> them to the target device as ptest. This worked well. It is well
> >> integrated with cmake and therefore also with IDEs. So I thought that
> >> there are certain use cases where it would be nice to have it opt-in.
> >>
> >> meson offers qemu-user as well (because of gobject). So if qemu-user i=
s
> >> not usable there will be other challenges as well.
> >>
> >> There is also a MACHINE_FEATURE which allows to support it for ARCHs
> >> where it works well but not for ARCHs where qemu-user is known to be
> >> broken.
> >>
> >> I think it would be a nice optional feature.
> >
> >
> > I agree without any doubt on that part.
> >
> > But I believe this doesn't work for applications that are using the for=
k
> system call.
> > So consider this will also break any ptest using fork, giving the wrong
> impression the test is failing.
>
> I think this needs to be double checked. I find it odd that qemu
> usermode would fail on such a basic thing, and it would not show up
> anywhere in places where it's used in core (not just g-i - all the
> various postinst utilities for generating indexes etc.).
>
> Alex
>

There is no recent information on the internet about the fork issue on qemu
user mode
so this may no longer be a problem.
I can back again, not now, testing some of the oe-core packages who uses
the meson build
system to get some results about failing/passing. The approach is the same
used in this patchset.

It will be good also to have some numbers and example recipes in oe-core
where we can use this patchset.
In conclusion, this is really a great future imo and improves a lot the
integrations of new tests in the ptest infrastructure.

Jose

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000973ca6060abc4393
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Alexander Kanavin &lt;<a href=3D"mail=
to:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; escreveu no dia t=
er=C3=A7a, 21/11/2023 =C3=A0(s) 11:21:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Tue, 21 Nov 2023 at 12:12, Jose Quaresma &lt;<a h=
ref=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmai=
l.com</a>&gt; wrote:<br>
&gt;&gt; I was using it for running Unit Tests on the host before I deploye=
d<br>
&gt;&gt; them to the target device as ptest. This worked well. It is well<b=
r>
&gt;&gt; integrated with cmake and therefore also with IDEs. So I thought t=
hat<br>
&gt;&gt; there are certain use cases where it would be nice to have it opt-=
in.<br>
&gt;&gt;<br>
&gt;&gt; meson offers qemu-user as well (because of gobject). So if qemu-us=
er is<br>
&gt;&gt; not usable there will be other challenges as well.<br>
&gt;&gt;<br>
&gt;&gt; There is also a MACHINE_FEATURE which allows to support it for ARC=
Hs<br>
&gt;&gt; where it works well but not for ARCHs where qemu-user is known to =
be<br>
&gt;&gt; broken.<br>
&gt;&gt;<br>
&gt;&gt; I think it would be a nice optional feature.<br>
&gt;<br>
&gt;<br>
&gt; I agree without any doubt on that part.<br>
&gt;<br>
&gt; But I believe this doesn&#39;t work for applications that are using th=
e fork system call.<br>
&gt; So consider this will also break any ptest using fork, giving the wron=
g impression the test is failing.<br>
<br>
I think this needs to be double checked. I find it odd that qemu<br>
usermode would fail on such a basic thing, and it would not show up<br>
anywhere in places where it&#39;s used in core (not just g-i - all the<br>
various postinst utilities for generating indexes etc.).<br>
<br>
Alex<br>
</blockquote></div><br>There is no recent information on the internet about=
 the fork issue on qemu user mode<div>so this may no longer be a problem.<b=
r>I can back again, not now, testing some of the oe-core packages who uses =
the meson build</div><div>system to get some results about failing/passing.=
 The approach is the same used in this patchset.<br><br>It will be good als=
o to have some numbers=C2=A0and example recipes in oe-core where we can use=
 this patchset.<br></div><div>In conclusion, this is really a great future =
imo and improves a lot the integrations of new tests in the ptest infrastru=
cture.=C2=A0</div><div><div><div><br></div><div>Jose<br><br></div><span cla=
ss=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail=
_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div>=
</div></div></div></div></div>

--000000000000973ca6060abc4393--

