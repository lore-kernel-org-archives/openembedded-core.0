Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B2BE77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 17:39:53 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.26556.1736357990360414118
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 09:39:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wou7WNJ/;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-29fad34bb62so12668fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 09:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736357989; x=1736962789; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dfUxIhRnYPmkDoEuQkpD5GeFSxi77KvLcUHEKjW391o=;
        b=Wou7WNJ/YYNTG0Rps1T5y/bHvdXTbEtulh4qq4Qb2NOVyv/dNSfw1JeItSg3zyM+G/
         p/1EcW79bt46rAeZHmgYEB2e11UR2rjSKfShRiImYbhmTn0o0tBtH2gKIV/tc9zOihwH
         HExwVmGKG/QEWMjnq4TRzGm2EC5HkpbrGN5+54TIZVic5yGVpMsPuMMcR0USlS88pFRo
         2zPIB5VvexPR38HaMP3CUOZ768bY3mzHd1w+LIha58Xf7l40kXi5UfkWvXYSRl3fh/lL
         vJwyFDol06i5jMmJU92kGGuayy+pY8L4fbtyC/p7J3bzOxelu5DdIWrqY8bIBSUOaslw
         py/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736357989; x=1736962789;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfUxIhRnYPmkDoEuQkpD5GeFSxi77KvLcUHEKjW391o=;
        b=MRXoaYte2VDJt1vSYG3yEBbxbtGWa/LKwr/5Lma30vS+4g3UrP4lJSKHPltpoi6O2n
         T9/jdu4j0WXotscuJzq6yVvLpkXrsIdofd2FzGItMh0ViMw6pkAIeauo34giOXMn+1jW
         TlE2h7Nyn7H/SUW4TFEbmFdkJYZ519z0/oso3V7gS7ahd+rqjTsn/4JqvezjhxkAdNVV
         zgae0En9ugH/MCt8jrzeoFHUpgmwA2ke8t27pp6GcUjPZ2Dp4eSS+xW0EaJjqM6U82c5
         Yk3cKZKLhRsK2CGpzgr4dlltsIHs+RQMmw4U4rPGsbpHAkaKV2UH+Ym2IcRrtLy1YKCT
         7LgA==
X-Gm-Message-State: AOJu0YyFtZt5RpwSg7JVYLgP6WBSYh9QG9Ctx31ds9hFBNEMIrp5uVrI
	HbHxnSDhxm3OWjaA7PS/XpCS1YyhPDjd6MBN2Vrax43TPCyoFJ5huXatLyoqPTGIR/KxmhcP78j
	4XGHL3pf2ZXZgtfMAOw8Ks6q/hZs=
X-Gm-Gg: ASbGncssZpGMszG3P0ef5RfRxHH7ANYlfK6XQAWmQUHjebccEWfBqzS4sXKR6iY07fz
	ToEsrU7sNNn9E6mMh7UwhpH5t4lU5hwYB5q0vqnUEDSjZsg95mCm/e6E8WeejkmTdZKRyChk=
X-Google-Smtp-Source: AGHT+IFgE0KXhSjlTKvXa7m4Hl/XzIXZuJU4QjrxGfGA28g9kIwo7dQJmrfBYNAgVDyB5HptlgXSnY3Wbgz680BUSqY=
X-Received: by 2002:a05:6870:e2cf:b0:2a3:c59f:577b with SMTP id
 586e51a60fabf-2aa0673060amr1896805fac.24.1736357989482; Wed, 08 Jan 2025
 09:39:49 -0800 (PST)
MIME-Version: 1.0
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
 <20250108084226.117178-2-alex.kanavin@gmail.com> <008f6d87-3cea-49bd-b3a3-99a33666e09e@gmail.com>
 <CANNYZj8rWNynVz6JePDcbSX0iZ7UVfSOENrzxVhFh-+mgY1rFA@mail.gmail.com>
In-Reply-To: <CANNYZj8rWNynVz6JePDcbSX0iZ7UVfSOENrzxVhFh-+mgY1rFA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Jan 2025 09:39:38 -0800
X-Gm-Features: AbW1kva2Xn-bNtW4-_LZc12KMo-6aIzyJXpumrfh7s5ce3xM33cIV-mpM4UNxME
Message-ID: <CAMKF1sqsti5CrpgS960DjmSSu1Mg00f_wLspXw_y1FmoAWMm9w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/20] dbus: update 1.14.10 -> 1.16.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="0000000000002a8b8c062b35597e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 17:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209587

--0000000000002a8b8c062b35597e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, thanks.

On Wed, Jan 8, 2025 at 9:11=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com>
wrote:

> On Wed, 8 Jan 2025 at 17:48, Khem Raj <raj.khem@gmail.com> wrote:
> > > -EXTRA_OECONF =3D "--disable-xml-docs \
> > > -                --disable-doxygen-docs \
> > > -                --enable-largefile \
> >
> > there is no replacement for --enable-largefile but it might be addresse=
d
> > differently, is that the case ?
>
> Yes. Meson always sets -D_FILE_OFFSET_BITS=3D64 on all targets.
>
> Alex
>

--0000000000002a8b8c062b35597e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Ok, thanks.</div><div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 8, 2025 at 9:11=E2=
=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">al=
ex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>On Wed, 8 Jan 2025 at 17:48, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt; -EXTRA_OECONF =3D &quot;--disable-xml-docs \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disabl=
e-doxygen-docs \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable=
-largefile \<br>
&gt;<br>
&gt; there is no replacement for --enable-largefile but it might be address=
ed<br>
&gt; differently, is that the case ?<br>
<br>
Yes. Meson always sets -D_FILE_OFFSET_BITS=3D64 on all targets.<br>
<br>
Alex<br>
</blockquote></div></div>

--0000000000002a8b8c062b35597e--

