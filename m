Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7626ECCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 12:33:44 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.31514.1761568418110849866
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 05:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i2H2aWrL;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-33bc2178d6aso3454504a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 05:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761568417; x=1762173217; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p2UDGAXkHpPfSWApki3oBFruKgmxCF2a2cKJZp3tk/M=;
        b=i2H2aWrL2FPGvhImjrehkPvv85IGvxrW1nMWoO986t9uF/YEuUKoaysKdOQDY8iUe/
         /tHfZcX6Ph92Xw/WtXGhNJ/DCMHIIwSHnp06X2nl9YCP1SZSdIiPKC6BnpujklNhysY6
         Gt9LcsFLyfipWkxWdcrGoc3iXtxMYBo4efC/IU2rt+MsRNX9uAa9da5FwdutZYDsjMqx
         gCowTZy8LcoZttSzL5gKoWEp0SuSGmsoyVZoQWlJSJYDo4tOKvaXCuGC5fwBKt7PnqZ3
         tXSb/rI7r//4EI3hltQZXpVhvUt8Z2fqfWA4JBVewTaOmp4vZK35ije3NfN5LTWRZ78X
         auWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761568417; x=1762173217;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2UDGAXkHpPfSWApki3oBFruKgmxCF2a2cKJZp3tk/M=;
        b=cVHQrytCTkEeza5zB7vF6nJ2VvtUWD6a5ic1HAeaBbQzaO7CPzRnt392y7kPNjaR8i
         jkQ1JSL6w614d9r147jqB2M9/oDH6exHi74ZN6SrvXQnNhbCZ0rdGJKQb5PoXkTluXld
         TOEqaB/JLfKk6Gda9DximnI7/1Ai4P7v/K8wXrc/6AukT+YPk/KoiVupvFOlyQx6ZoFm
         PZBfjSVSDLueTQwCDtmmoL+ktLqN8/Vz//zIbXljZ7Mo/LeXtSHU81R3r3HUZ0KQqscr
         s4iCklOFVSJez8dp5mb4NqhBsiMCtMzZytTwocyoWbouLqvvHga2eUrGltg2qfyQrVSl
         DuYA==
X-Forwarded-Encrypted: i=1; AJvYcCWEUuz2nfVMtWjzFB5eL9RpV5k+hEU5s2HStcS+8BWqjk6oYl8Tm9ZwWo+K+nkqH2t8a2+BLn7wV/lDYZOYiH9cTQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxhx2AyTFNNBPsFDvBKtPzxjedbz91Uab1m3t8M2SUgwtVaoIgI
	iXPkdyMI4Pxf9INNbyGEgEDfu58ijTTbARtVXrsFHmTw9KSs59afabfzHAcuhe+d7Uod1oy5drW
	Q8FC5oM9r72WHcidGhGw/tEF4twl3FhyhJyhwbaQ=
X-Gm-Gg: ASbGncsdnoLxrMrznGdKONtH9kLXjXhR4iQKXcpqpBw5Vx0iWG9/CEPQzra3h/vokyr
	DA724eZsAayfp2egFWt3ePbZSEs2tDufcH2KaffzICWSl6NuQb03Xl1qGY1q+lvHw4+cGaNOUun
	ZZRww2SWmw50jCEt0/5Ky2gJdw/7CCo5uQMWIoFkZzj8J7TF7XYs88LPquJEElfqfmW4RrHPBjf
	QEY/jq+YAo+MxyFH89fldDJHQD5kOdS5MHXtI+mSRRMROMINAy6JO7lxFgGsw==
X-Google-Smtp-Source: AGHT+IFrQ3ec/QZkbs9D+vB3W50BwsZaBet/5UPhvL+9HG3PI85lx/G3chwbpeb8TUIfco4at+RufoFFd8DDpDJ84Ks=
X-Received: by 2002:a17:90b:2d90:b0:33e:2d0f:4792 with SMTP id
 98e67ed59e1d1-33fd66d85fdmr13520489a91.28.1761568417374; Mon, 27 Oct 2025
 05:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1761360245.git.bruce.ashfield@gmail.com>
 <65b6f4cb57e6738e48560539cf2c0485e0469b65.1761360245.git.bruce.ashfield@gmail.com>
 <DDSZYF5TWBO9.2Z5Y4SR4SE5D8@bootlin.com> <CADkTA4M90CB7qmkO=dxr1KUkfxbotH_trwL3mgpo4abj8=Mbrw@mail.gmail.com>
 <CAOMZO5BXLizaBKmOQFKreoCr1OkzBUZMUfD5CrRg6g_JAgib0Q@mail.gmail.com>
In-Reply-To: <CAOMZO5BXLizaBKmOQFKreoCr1OkzBUZMUfD5CrRg6g_JAgib0Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 27 Oct 2025 08:33:25 -0400
X-Gm-Features: AWmQ_bnO7jNQGmZNNN2Vns20OQ7TC3dRGbli3KJJWl1LKQXx2w87S4vL5MJyfK0
Message-ID: <CADkTA4Ogj_Jk3-L+EH+-JSBKKF1+dr=QFc3yQHVUNmsc2Gtc7Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] linux-yocto: introduce 6.17 reference kernels
To: Fabio Estevam <festevam@gmail.com>, Ross Burton <ross.burton@arm.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c3e59c0642231b8d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 12:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225333

--000000000000c3e59c0642231b8d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 8:32=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:

> On Mon, Oct 27, 2025 at 9:17=E2=80=AFAM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> > It boots locally, so I don't have any great ideas.
>
> Shouldn't "check access for rdinit=3D/init failed: -2, ignoring" be
> added to meta/lib/oeqa/runtime/cases/parselogs-ignores-common.txt?
>

Probably. Ross already knows about this though, since we were discussing
it last week.

I'll wait to hear from him on it.

Bruce


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000c3e59c0642231b8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 27, 2025 at 8:32=
=E2=80=AFAM Fabio Estevam &lt;<a href=3D"mailto:festevam@gmail.com">festeva=
m@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Mon, Oct 27, 2025 at 9:17=E2=80=AFAM Bruce Ashfield via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" ta=
rget=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
<br>
&gt; It boots locally, so I don&#39;t have any great ideas.<br>
<br>
Shouldn&#39;t &quot;check access for rdinit=3D/init failed: -2, ignoring&qu=
ot; be<br>
added to meta/lib/oeqa/runtime/cases/parselogs-ignores-common.txt?<br></blo=
ckquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size=
:small">Probably. Ross already knows about this though, since we were discu=
ssing</div><div class=3D"gmail_default" style=3D"font-size:small">it last w=
eek.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">I&#39;ll wait to hea=
r from him on it.</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</=
div></div><div>=C2=A0</div></div><div><br></div><span class=3D"gmail_signat=
ure_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- Thou=
 shalt not follow the NULL pointer, for chaos and madness await thee at its=
 end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><br></=
div></div>

--000000000000c3e59c0642231b8d--

