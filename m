Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73733C25B79
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 21:15:57 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.7666.1716844551693729589
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 14:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BlfZ6Htm;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-24ca03ad307so89027fac.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 14:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716844551; x=1717449351; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zYmSdAB9N0pVICabF9fgF1zwPy58YzMCiOKJ+GZfx/c=;
        b=BlfZ6Htm0+ZrKmrnVicU4AKgifJFibiqXPuPSezX2fr48OzrAXdU7IbeeBd+KHAa8T
         gmStw+V/UwiKUtlSkqVIR8PVQVtDprtgc/7ZtCBPkPhMf+UdrxC5/qfOtFE3k34EhdUd
         jElHyLuEE+funFIA2yvF7BiVJqVTDqyKGSStTb7g7D9nZI9VEUkO+rrZJGQB63VVschg
         EImn/4X8/F7yzyLBV8Vva3irFaEUBXiyl/vPPglHA4YPb5EldLVn4GziFCrrxNG+87m3
         V6UL/O7HdLjBWoH5kHkg9K9TEVH3U2+DonqHgDW5cAdLRJOAEQRNgLEzQtVih98/XVpm
         OotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716844551; x=1717449351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYmSdAB9N0pVICabF9fgF1zwPy58YzMCiOKJ+GZfx/c=;
        b=bHH6wKe7iFXF4qMBZJSP4tyfzPs2UCrpsOkr7paYCYI17PH7LiUpnwp5DQI5+MF3NQ
         l/u4dbs0KbcB/6i6cKUL1NQUtBn2lVsS7i1pcCmsmC+O7KHWNjq3JpLfESEq4mkSneha
         AboWQANpMAYHET9RifYF/Dvjrhp+ZzPVU4t/ajOTiezsTjkvcprJ94nFbnDzT0fEG9YF
         fgFu/mFSyIMK+0Z3C9SSi4jFxqT/OpDZZDgV49DasEv9tRy+eFyFYlCQ0bOccg3b9rpx
         dRGuRpIYUaElb9Y7vH9JDlurf373WYvyyeqOzTN3c4U5vnottMDcqFH9IrbE6hHfYFh2
         CXKA==
X-Forwarded-Encrypted: i=1; AJvYcCVuk3QGJSgw/iImV3MpWAH8ofrjQYhBk315gDJzDgvcpJgLnHYT4rr8DuoA/1Z5v9JuStz65X1bf5SOkogY9U4+tkRhzOUqnfMCi71F060U5w4Mdp6KfsGj
X-Gm-Message-State: AOJu0Yy3XAs815mCzsSpv76MbjCHoQXHP/wdIp5nAr8Ac3P39LGCw5t/
	Ww7r3Y7dX7Uzk1mas6DsWE0Ae0taeSCDu2LYM8On0Vx/XNFvMxgVG5lq4gtimpaaksSWslXfNyo
	FGDebpVoX6G+X3ey5wkJWsjG4E04=
X-Google-Smtp-Source: AGHT+IG/i1Z1iYv9VLBgUdbEEb9cDDe9SQjb+P9BLOB8UEaae6/NsHG130oIqimacDbFapFdDfamdTNZfwj5018WFps=
X-Received: by 2002:a05:6870:b155:b0:24c:bbe3:c567 with SMTP id
 586e51a60fabf-24cbbe3da21mr9513614fac.18.1716844550841; Mon, 27 May 2024
 14:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240527181214.1778037-1-alex.kanavin@gmail.com>
 <20240527181214.1778037-7-alex.kanavin@gmail.com> <CAMKF1sr3rzt545xOEiukEpVPGPxyQ_VX+scB8gzySuP6tbuGMw@mail.gmail.com>
 <CANNYZj-282UQn2iELdYkQHBunkNDn1nZq6a=EKBx-BSUTvZZ8Q@mail.gmail.com>
 <CAMKF1so2JOiUdm=g5b8X-OSvXZCwG76t6N+hUAZUr6JAxK5BLA@mail.gmail.com> <CANNYZj843hMDSK3bcFwSVy5z4Xgvfj8YxVA8KeRsYrwSXp+izg@mail.gmail.com>
In-Reply-To: <CANNYZj843hMDSK3bcFwSVy5z4Xgvfj8YxVA8KeRsYrwSXp+izg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 May 2024 14:15:39 -0700
Message-ID: <CAMKF1srO2NTT--oM3Bw06WzfuqUFqTjU6rUPxrGTo-13LqzWaw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 07/13] icu: upgrade 74-2 -> 75-1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009670080619760540"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 21:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199944

--0000000000009670080619760540
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 1:26=E2=80=AFPM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> On Mon, 27 May 2024 at 22:22, Khem Raj <raj.khem@gmail.com> wrote:
> >> harfbuzz resets that to c++11:
> >> https://github.com/harfbuzz/harfbuzz/blob/main/meson.build#L7
> >
> >
> > I see. Thanks, ideally harfbuzz should have done it as a fallback if
> default were not > c++11
>
> They want to stay at c++11 even when default is higher, no idea why:
> https://github.com/harfbuzz/harfbuzz/pull/4733
>

I guess they are open to use it if icu is enabled so may be that=E2=80=99s =
an
opening


> Alex
>

--0000000000009670080619760540
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, May 27, 2024 at 1:26=E2=80=AFPM Alexander Kanavin &=
lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, 27 May 2024 at 22:2=
2, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj=
.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt; harfbuzz resets that to c++11:<br>
&gt;&gt; <a href=3D"https://github.com/harfbuzz/harfbuzz/blob/main/meson.bu=
ild#L7" rel=3D"noreferrer" target=3D"_blank">https://github.com/harfbuzz/ha=
rfbuzz/blob/main/meson.build#L7</a><br>
&gt;<br>
&gt;<br>
&gt; I see. Thanks, ideally harfbuzz should have done it as a fallback if d=
efault were not &gt; c++11<br>
<br>
They want to stay at c++11 even when default is higher, no idea why:<br>
<a href=3D"https://github.com/harfbuzz/harfbuzz/pull/4733" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/harfbuzz/harfbuzz/pull/4733</a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I guess they are=
 open to use it if icu is enabled so may be that=E2=80=99s an opening=C2=A0=
</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Alex<br>
</blockquote></div></div>

--0000000000009670080619760540--

