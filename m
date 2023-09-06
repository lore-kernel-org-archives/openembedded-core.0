Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0508EE14CD
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 18:20:24 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.6667.1694024416318502726
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 11:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=p7MR3V+9;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1cc61f514baso109443fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 11:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694024415; x=1694629215; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4J35ph0yjs9srH8tXlJs/kf+Ww7oleAaSuXTCd9UffQ=;
        b=p7MR3V+9FI4f+Dp/30163eS4kO02ogYDZGDlXa2Hs3T2w3kgE1+ZGJcEWncrXM7UsL
         4O2/PateGWGI2d9C4fPFAQ+jCdRbR4JUKg29kGHxiyvZfMXiXR7Gaj5b7ECM5M4KBjno
         hC4Am6YsT5F1ivYLxNhq/ElMwbNTQ+IrEemZN5hPzjC5PhiZzGjiaRTPzBNu9/N3Wr37
         N0ub8ftF8RYgiaF4UjobJRKzVZTveeqiIPkQ2hA0t+R1sUfEmTZQqbXycAZcoZTzGied
         JY69lE7LZLOslh+6ms7/6HjI8+4cGQ7ZGw0Eps89rgYH1BM4181MzlpTrsbOpgHUkUYv
         HWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694024415; x=1694629215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4J35ph0yjs9srH8tXlJs/kf+Ww7oleAaSuXTCd9UffQ=;
        b=IYMaLgfNLuUxfZTasqwrVtdN33vDx/3EdivWojGrGaVKvj0uP8dFo5PVq/3pjQwg5F
         EnM5gcyocKQXzPAMxu9UBB3lELEB9O/Nq9PNxviTF09J5TeW6JdJNhB+eNMDogxzyEqw
         Ethvz7FzKBEMyufrbreVQ5N1DnYtSWfGOe0mHrFyCmIX6bOGMWIft+hTtcbNi/zpS+CR
         w+L/NGLWvoEoc4hqM42WqYzqHh/aPM4kueEH5/JIaw3+lYAyMibVMubkZ2NLCWhOXw9L
         ztWrA5ooZudAkNi6VnxmSamPT7MFNc6B+ZQPPZkYvvymYY4mwKIR5TYkmrqjBcGPvSiM
         Obzg==
X-Gm-Message-State: AOJu0YytzBTLRFyen5wYOiT4CcMob3Zmg6z1MEY1a1xekWBbr68P+miO
	c2p1Cbdc7GKXlUxsiFAtz4EaZGKh/lvOjHyk3fG+VaGO
X-Google-Smtp-Source: AGHT+IGEYnVvq/edM8xnNPvhw/u5DZlkbFp2eOz64JUIxizcVc6Jo/D4qb21nHTtpa5fzRka0K5KVfc/UGAVJZwK+Nw=
X-Received: by 2002:a05:6871:a7ca:b0:1d5:2616:1403 with SMTP id
 wk10-20020a056871a7ca00b001d526161403mr1973062oab.51.1694024414655; Wed, 06
 Sep 2023 11:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230906151247.312252-1-ross.burton@arm.com> <CAMKF1sqCfbe25rBAR97etyoYtMNMowPiB1EK3HzhVT2O15b=Kg@mail.gmail.com>
 <65C77DD9-C7AA-407A-A023-80DF7A62D483@arm.com>
In-Reply-To: <65C77DD9-C7AA-407A-A023-80DF7A62D483@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Sep 2023 11:19:45 -0700
Message-ID: <CAMKF1srzovwsZCg641qbW7dAxPNfHVohHT3b+TqxPG0R+3fqvw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: explicitly enable strlcpy()
To: Ross Burton <ross.burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="00000000000079f6f10604b4cb18"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 18:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187349

--00000000000079f6f10604b4cb18
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 6, 2023 at 11:07 AM Ross Burton <Ross.Burton@arm.com> wrote:

> On 6 Sep 2023, at 18:30, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Sep 6, 2023 at 8:12=E2=80=AFAM Ross Burton <ross.burton@arm.com=
> wrote:
> >>
> >> From: Ross Burton <ross.burton@arm.com>
> >>
> >> We have glibc 2.38 which added strlcpy(), so enable the use of it
> >> explicitly in the Meson cross file for when the target doesn't support
> >> qemu-usermode (which will result in the default of not using it).
> >
> > will this be effective for non-target variants too ? In that case we
> > may not have
> > glibc 2.38 on all distros yet.
>
> The extra cross file logic is not used in native builds.


Superb and I checked that this is already set for musl cross file so all
good


>
> Ross

--00000000000079f6f10604b4cb18
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Sep 6, 2023 at 11:07 AM Ross Burton &lt;<a href=3D"=
mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 6 Sep 2023, at 18:30, Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
 wrote:<br>
&gt; <br>
&gt; On Wed, Sep 6, 2023 at 8:12=E2=80=AFAM Ross Burton &lt;<a href=3D"mail=
to:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt; wrote=
:<br>
&gt;&gt; <br>
&gt;&gt; From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt;&gt; <br>
&gt;&gt; We have glibc 2.38 which added strlcpy(), so enable the use of it<=
br>
&gt;&gt; explicitly in the Meson cross file for when the target doesn&#39;t=
 support<br>
&gt;&gt; qemu-usermode (which will result in the default of not using it).<=
br>
&gt; <br>
&gt; will this be effective for non-target variants too ? In that case we<b=
r>
&gt; may not have<br>
&gt; glibc 2.38 on all distros yet.<br>
<br>
The extra cross file logic is not used in native builds.</blockquote><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Superb and I checked that this is a=
lready set for musl cross file so all good=C2=A0</div><div dir=3D"auto"><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Ross</blockquote></div></div>

--00000000000079f6f10604b4cb18--

