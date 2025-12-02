Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EB0D11705
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 16:11:15 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.879.1764691870010111739
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 08:11:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QsLjyYA+;
 spf=pass (domain: smile.fr, ip: 209.85.208.50, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so2898715a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 08:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764691868; x=1765296668; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2RgtDK6VlRr8Uj/kf0Wpgk+xyuMUI83v9LJwlHfrnCI=;
        b=QsLjyYA+UNkeJ8XUKbBa+UVY99F8VI8GxlSJzwGmEPNyZ0hsoUf1o/3bUSs8YNr0gR
         XyazV7hKMFYswRjDtPAIHkzYI/oN9kB+ZapBWy21bTlH7BdIdJD8JqdTrQvjhODd0LSr
         Qq6gdxm0/KVinygpcMIIRMY58oO/vUhj/lldY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764691868; x=1765296668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RgtDK6VlRr8Uj/kf0Wpgk+xyuMUI83v9LJwlHfrnCI=;
        b=SPr5MB3+2j0GACkmTF9p8bijWuHLEwTXwwb0E/sITbEvKvVJAUuqX3pDoxewwaTO5I
         s8ZnoVJ8XiG22Ef3Lbk3XiilMb6Ksmn3TCFUixmI0KsqGXJH1mISyU1IVLhGE+zaMXgV
         od15y6f5Zq4c8WGt5sRVhtOykgrH7mCqJTpiRvCcG4LjntGKm0jZfgPCY6jNrVymD7bZ
         HwXe5ysfS1KsotGeH1u1KROYI8rZ3tl1ZVXrsjZdEGSNl3Vo1bgpY4iPqVOPfJVVBz9K
         zoAUy8hR4uuEyAhntfU2BJSx/ik5Cod6HmxvA7RYPD59yadzvDyB/en/RwoMuE2f9/U/
         W1GA==
X-Gm-Message-State: AOJu0YzKtEKkq9n1IAGb2k2P4HXVooTPOFniHCfb2nxnzCZRCmjtzvlT
	2NMDu54ySksbdDpU3+9PJ+08Ncg7m7//FwkgSUSaLkeHybgdDG8TIX/RGn2CIZmrpOJvhgewwSu
	Y7SdN6xv4UZkC0Tok4JsWpwKPKXA67TzWYZVc4WU2ng==
X-Gm-Gg: ASbGncuM6grYuVFrGf+fcsBHKKYKpCtAqiyMoxX5ue8UxSy328jqg7J5oYzILF195Rf
	9WHvhedw+BYFZ9JCy6UsFm5Oewg44N2R+hO0b0yCFLFfxy2sAWTdYOdWAVL99IsDEyc/QWG2XO4
	XTf2D++Mk8rNEPy0E3ZojBUEpRrMDz8wxa8KU6XcdV6f7OM+DA/JzFYVejffF0tMgkHp8j7HeUO
	y8Zxjr89q8oIbD/5DdqAbIugWTKeQlPS/56fq+ECug3EdebgPcK2U0idrDbbgPpF3wxxjJzVxUQ
	Y71QoWzGqfcPpK6Jv793yvAHAWpY
X-Google-Smtp-Source: AGHT+IFDFDtYyRJPDGhIAlo6jSVkYjEvQFdey+BzzeJm0hRowGxwLcDWcTlOMRFgMP5h1qxHERAPFS1MC4FkYDYDqtM=
X-Received: by 2002:a05:6402:50d2:b0:633:d0b7:d6d2 with SMTP id
 4fb4d7f45d1cf-645eb2a9007mr27413420a12.18.1764691868385; Tue, 02 Dec 2025
 08:11:08 -0800 (PST)
MIME-Version: 1.0
References: <20251202155043.815098-1-corentin.guillevic@smile.fr> <CANNYZj9qxZ4KmoP_8YeMUY9j12us8iNkhp3rs7UViSYpL5gRag@mail.gmail.com>
In-Reply-To: <CANNYZj9qxZ4KmoP_8YeMUY9j12us8iNkhp3rs7UViSYpL5gRag@mail.gmail.com>
From: Corentin GUILLEVIC <corentin.guillevic@smile.fr>
Date: Tue, 2 Dec 2025 17:10:57 +0100
X-Gm-Features: AWmQ_bltcVsezqo8HqVQ85AgF6D_u3fwxZI-ROBy_DrovAEathc7IKzolbg-UM4
Message-ID: <CAMFqQmq_WSfqdXFFZ4dXXZ4reSvi7B3f=XKY5TPVwQL489GJpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oe-setup-layers: support inline URI
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f4138d0644fa57d6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 16:11:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227174

--000000000000f4138d0644fa57d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Alexander,

Yes, I have pushed more patches to bitbake-devel:
- https://lists.openembedded.org/g/bitbake-devel/message/18507
- https://lists.openembedded.org/g/bitbake-devel/message/18508

Corentin

Le mar. 2 d=C3=A9c. 2025 =C3=A0 16:56, Alexander Kanavin <alex.kanavin@gmai=
l.com> a
=C3=A9crit :

> On Tue, 2 Dec 2025 at 16:50, Corentin Guillevic via
> lists.openembedded.org
> <corentin.guillevic=3Dsmile.fr@lists.openembedded.org> wrote:
> >  scripts/oe-setup-layers | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
>
> I like the idea, but this is extremely incomplete. You need to update
> the schema in bitbake repo, the sample file in meta-files, and the
> generator in 'bitbake-layers create-layers-setup'. You also need to
> update bitbake-setup and its tests.
>
> Alex
>

--000000000000f4138d0644fa57d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi, Alexander,</div><div><br></div><=
div>Yes, I have pushed more patches to=C2=A0bitbake-devel:</div><div>-=C2=
=A0<a href=3D"https://lists.openembedded.org/g/bitbake-devel/message/18507"=
>https://lists.openembedded.org/g/bitbake-devel/message/18507</a></div><div=
>-=C2=A0<a href=3D"https://lists.openembedded.org/g/bitbake-devel/message/1=
8508">https://lists.openembedded.org/g/bitbake-devel/message/18508</a></div=
><div><br></div><div>Corentin</div></div><br><div class=3D"gmail_quote gmai=
l_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 2 d=
=C3=A9c. 2025 =C3=A0=C2=A016:56, Alexander Kanavin &lt;<a href=3D"mailto:al=
ex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2 Dec 2025=
 at 16:50, Corentin Guillevic via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;corentin.guillevic=3D<a href=3D"mailto:smile.fr@lists.openembedded.org"=
 target=3D"_blank">smile.fr@lists.openembedded.org</a>&gt; wrote:<br>
&gt;=C2=A0 scripts/oe-setup-layers | 11 +++++++++++<br>
&gt;=C2=A0 1 file changed, 11 insertions(+)<br>
<br>
I like the idea, but this is extremely incomplete. You need to update<br>
the schema in bitbake repo, the sample file in meta-files, and the<br>
generator in &#39;bitbake-layers create-layers-setup&#39;. You also need to=
<br>
update bitbake-setup and its tests.<br>
<br>
Alex<br>
</blockquote></div></div>

--000000000000f4138d0644fa57d6--

