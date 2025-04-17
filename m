Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF7EC369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 11:45:47 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.6789.1744890344518583568
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 04:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=eMm/BoZj;
 spf=pass (domain: mvista.com, ip: 209.85.218.46, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac3b12e8518so126135966b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 04:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744890343; x=1745495143; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OO1H9UmN2UaY6LAROAQrmGEOv5t4Gk7zLBsm/49qoP4=;
        b=eMm/BoZj7T2+w5o1287Ksln+NMZx4duH/McBabKBuFVnAwWTLhyPwt307nFkHiIT+h
         Kbd6vCkksKEYTcEDhC+Oikx9WIGTCwDlD9GCByFXPW2nPRkKcpRBEHkPlvbXSWGEeEP+
         /EDNEhN389BO2AgIzBCrSIWOVQgNxF8jDmWKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744890343; x=1745495143;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OO1H9UmN2UaY6LAROAQrmGEOv5t4Gk7zLBsm/49qoP4=;
        b=XVuORwMngxN7JPothWAhW2aMND8pL73N6P0QBzUICab6CL3VdjMQMhsehIKjlEt5aD
         QT/NdH4F//wqSmODAAkFy/vbiXxIFZEoZbf2eIIyXV1gQuBDJ0bXN3sPwccZJsX3mSq6
         OYeusR1rfudx7Lb22/aeYkl+97Tdnc9BdIFP0DnnsZBc0eQKJz4HNToj+U/Xo8XkHEkZ
         G3GqcMhkC/yPVW5V5idiDA7m2xKADAGlO67PTIaPgJxASgX/oTdBqzgX6A8ZGWV5vDJY
         /+D19Sz1BdzAAOBK81x2UL5HCPgM1lCGm+3KRoiWLV7z4NoiiRv4OCzx7UTa/n231JmW
         pZaw==
X-Gm-Message-State: AOJu0YzdQ0+JS7Ljfvt5TqIKTIsarA3KBS0wfADytmZot30KKyjAYt1h
	b+ynDWO7zVwAWWqlVnYbdbiPxaZ7TNbxXfYS6Wi4D54vdGr85OrSbEErfd/i6BtjtWxGqZwKig0
	ajh4cMp6luslUMqm83jcW8bO6QHM55kwbh9W6dg==
X-Gm-Gg: ASbGncubvsD9puASlND2XDoUoeVsqZmIIjhrOkXbTG2oSjkozjaG2xyQvJSwwdUVcR1
	rfFHyavaHKn9sRefDhk64eLak4km5sWIotgeklSU1fy+cjlL0bBkLOjCd3uEqUhWVO5qRYgUM26
	6E0pBHW9y2MshsVnjcg/zeSRANqzLF4cc/lw==
X-Google-Smtp-Source: AGHT+IFIhUqvTC4u5oaR56lvAF4m3ezr2iskNq+HwVYIxaEEd5b/tvUW8kuTORdcq+qyd6w+SfE9GEzrUaGgULUENmQ=
X-Received: by 2002:a17:906:2412:b0:acb:5ec4:e944 with SMTP id
 a640c23a62f3a-acb5ec4ec4fmr183261566b.15.1744890342452; Thu, 17 Apr 2025
 04:45:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250417104258.64180-1-vanusuri@mvista.com> <5d660e04-3839-4af3-a2d3-398e199448bb@gmail.com>
 <CANQUz19f9DEyCkbHkaGk4wbeX2OaRMdx3AqcVAiE=uaT+jWCGQ@mail.gmail.com> <a4e0b8b0-95f6-413d-8f98-f750611b6e61@gmail.com>
In-Reply-To: <a4e0b8b0-95f6-413d-8f98-f750611b6e61@gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Thu, 17 Apr 2025 17:15:30 +0530
X-Gm-Features: ATxdqUHDDShLpDvECxa2OIk21NvGzM9apOwv96zKVzFYfJoeDT2tC5SLgRGpTBE
Message-ID: <CANQUz1-M-2qFX0PBH_YXVdiBSkv5NobYfCasaWu8kTZoW8dmxA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH v2 1/5] libsoup: Fix CVE-2025-32910
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000008d1a10632f7f1b7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 11:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215074

--00000000000008d1a10632f7f1b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I haven't seen your yesterday's message :
https://lists.openembedded.org/g/openembedded-core/message/214981

Those 2 missing commits were added as part of CVE-2025-32912 patch.

Thanks for letting me know. I will rename those patches and will send a v3
patch.

Thanks & Regards,
Vijay

On Thu, Apr 17, 2025 at 4:55=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.c=
om>
wrote:

> Your reply makes me wonder if my feedback from yesterday reached you:
> https://lists.openembedded.org/g/openembedded-core/message/214981 -
> don't know if you disagree with it, or maybe you just haven't seen it.
>
> On 4/17/25 13:21, Vijay Anusuri wrote:
> > I have renamed one of the patches in the v2 patch.
> >
> > Thanks & Regards,
> > Vijay
> >
> >
> > On Thu, Apr 17, 2025 at 4:45=E2=80=AFPM Gyorgy Sarvari <skandigraun@gma=
il.com>
> > wrote:
> >
> >     This seems to be identical to v1.
> >
> >     On 4/17/25 12:42, Vijay Anusuri via lists.openembedded.org
> >     <http://lists.openembedded.org> wrote:
> >     > From: Vijay Anusuri <vanusuri@mvista.com>
> >     >
> >     > Upstream-Status: Backport from
> >
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b7=
05e5eab34b13832
> >     >
> >     > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >     > ---
> >     >  .../libsoup-3.4.4/CVE-2025-32910.patch        | 27
> >     +++++++++++++++++++
> >     >  meta/recipes-support/libsoup/libsoup_3.4.4.bb
> >     <http://libsoup_3.4.4.bb> |  1 +
> >     >  2 files changed, 28 insertions(+)
> >     >  create mode 100644
> >     meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch
> >     >
> >     > diff --git
> >     a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch
> >     b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch
> >     > new file mode 100644
> >     > index 0000000000..32e0c86e62
> >     > --- /dev/null
> >     > +++
> >     b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch
> >     > @@ -0,0 +1,27 @@
> >     > +From ea16eeacb052e423eb5c3b0b705e5eab34b13832 Mon Sep 17
> >     00:00:00 2001
> >     > +From: Patrick Griffis <pgriffis@igalia.com>
> >     > +Date: Fri, 27 Dec 2024 13:52:52 -0600
> >     > +Subject: [PATCH] auth-digest: Fix leak
> >     > +
> >     > +Upstream-Status: Backport
> >     [
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b7=
05e5eab34b13832
> ]
> >     > +CVE: CVE-2025-32910
> >     > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >     > +---
> >     > + libsoup/auth/soup-auth-digest.c | 1 +
> >     > + 1 file changed, 1 insertion(+)
> >     > +
> >     > +diff --git a/libsoup/auth/soup-auth-digest.c
> >     b/libsoup/auth/soup-auth-digest.c
> >     > +index 350bfde6..9eb7fa0e 100644
> >     > +--- a/libsoup/auth/soup-auth-digest.c
> >     > ++++ b/libsoup/auth/soup-auth-digest.c
> >     > +@@ -72,6 +72,7 @@ soup_auth_digest_finalize (GObject *object)
> >     > +     g_free (priv->nonce);
> >     > +     g_free (priv->domain);
> >     > +     g_free (priv->cnonce);
> >     > ++        g_free (priv->opaque);
> >     > +
> >     > +     memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
> >     > +     memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
> >     > +--
> >     > +GitLab
> >     > +
> >     > diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
> >     <http://libsoup_3.4.4.bb>
> >     b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
> >     <http://libsoup_3.4.4.bb>
> >     > index b2e32b892a..757e6432f7 100644
> >     > --- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
> >     <http://libsoup_3.4.4.bb>
> >     > +++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
> >     <http://libsoup_3.4.4.bb>
> >     > @@ -18,6 +18,7 @@ SRC_URI =3D
> >     "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
> >     >             file://CVE-2024-52531-1.patch \
> >     >             file://CVE-2024-52531-2.patch \
> >     >             file://CVE-2024-52531-3.patch \
> >     > +           file://CVE-2025-32910.patch \
> >     >            "
> >     >  SRC_URI[sha256sum] =3D
> >     "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
> >     >
> >     >
> >     > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >     > Links: You receive all messages sent to this group.
> >     > View/Reply Online (#215059):
> >     https://lists.openembedded.org/g/openembedded-core/message/215059
> >     > Mute This Topic:
> https://lists.openembedded.org/mt/112311177/6084445
> >     > Group Owner: openembedded-core+owner@lists.openembedded.org
> >     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
> >     > Unsubscribe:
> >     https://lists.openembedded.org/g/openembedded-core/unsub
> >     [skandigraun@gmail.com]
> >     > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >     >
> >
>

--00000000000008d1a10632f7f1b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>I haven&#39;t seen your yesterday&#39;s message =
: <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/214=
981" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/=
openembedded-core/message/214981</a> <br><br></div>Those 2 missing commits =
were added as part of CVE-2025-32912 patch.<br><br></div>Thanks for letting=
 me know. I will rename those patches and will send a v3 patch.<br><div><br=
></div><div>Thanks &amp; Regards,<br></div><div>Vijay</div></div><br><div c=
lass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_=
attr">On Thu, Apr 17, 2025 at 4:55=E2=80=AFPM Gyorgy Sarvari &lt;<a href=3D=
"mailto:skandigraun@gmail.com">skandigraun@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Your reply makes me won=
der if my feedback from yesterday reached you:<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/21498=
1" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/op=
enembedded-core/message/214981</a> -<br>
don&#39;t know if you disagree with it, or maybe you just haven&#39;t seen =
it.<br>
<br>
On 4/17/25 13:21, Vijay Anusuri wrote:<br>
&gt; I have renamed one of the patches in the v2 patch.<br>
&gt;<br>
&gt; Thanks &amp; Regards,<br>
&gt; Vijay<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Apr 17, 2025 at 4:45=E2=80=AFPM Gyorgy Sarvari &lt;<a href=3D"=
mailto:skandigraun@gmail.com" target=3D"_blank">skandigraun@gmail.com</a>&g=
t;<br>
&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0This seems to be identical to v1.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 4/17/25 12:42, Vijay Anusuri via <a href=3D"http=
://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.opene=
mbedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org</a>&gt; wro=
te:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanu=
suri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Upstream-Status: Backport from<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-=
/commit/ea16eeacb052e423eb5c3b0b705e5eab34b13832" rel=3D"noreferrer" target=
=3D"_blank">https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e42=
3eb5c3b0b705e5eab34b13832</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"ma=
ilto:vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 .../libsoup-3.4.4/CVE-2025-32910.patch=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 27<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 meta/recipes-support/libsoup/<a href=3D"=
http://libsoup_3.4.4.bb" rel=3D"noreferrer" target=3D"_blank">libsoup_3.4.4=
.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://libsoup_3.4.4.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://libsoup_3.4.4.bb</a>&gt; |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 2 files changed, 28 insertions(+)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025=
-32910.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-20=
25-32910.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-20=
25-32910.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 0000000000..32e0c86e62<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-20=
25-32910.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -0,0 +1,27 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +From ea16eeacb052e423eb5c3b0b705e5eab34b13832=
 Mon Sep 17<br>
&gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +From: Patrick Griffis &lt;<a href=3D"mailto:p=
griffis@igalia.com" target=3D"_blank">pgriffis@igalia.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +Date: Fri, 27 Dec 2024 13:52:52 -0600<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +Subject: [PATCH] auth-digest: Fix leak<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +Upstream-Status: Backport<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://gitlab.gnome.org/GNOME/libsoup/=
-/commit/ea16eeacb052e423eb5c3b0b705e5eab34b13832" rel=3D"noreferrer" targe=
t=3D"_blank">https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e4=
23eb5c3b0b705e5eab34b13832</a>]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +CVE: CVE-2025-32910<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"m=
ailto:vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + libsoup/auth/soup-auth-digest.c | 1 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + 1 file changed, 1 insertion(+)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +diff --git a/libsoup/auth/soup-auth-digest.c<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0b/libsoup/auth/soup-auth-digest.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +index 350bfde6..9eb7fa0e 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +--- a/libsoup/auth/soup-auth-digest.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ++++ b/libsoup/auth/soup-auth-digest.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +@@ -72,6 +72,7 @@ soup_auth_digest_finalize (=
GObject *object)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0g_free (priv-&gt;nonce);<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0g_free (priv-&gt;domain);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0g_free (priv-&gt;cnonce);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free (priv-&gt=
;opaque);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0memset (priv-&gt;hex_urp,=
 0, sizeof (priv-&gt;hex_urp));<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0memset (priv-&gt;hex_a1, =
0, sizeof (priv-&gt;hex_a1));<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +--<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +GitLab<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/meta/recipes-support/libsoup/<a h=
ref=3D"http://libsoup_3.4.4.bb" rel=3D"noreferrer" target=3D"_blank">libsou=
p_3.4.4.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://libsoup_3.4.4.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://libsoup_3.4.4.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-support/libsoup/<a href=3D"http://li=
bsoup_3.4.4.bb" rel=3D"noreferrer" target=3D"_blank">libsoup_3.4.4.bb</a><b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://libsoup_3.4.4.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://libsoup_3.4.4.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index b2e32b892a..757e6432f7 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/meta/recipes-support/libsoup/<a href=3D"=
http://libsoup_3.4.4.bb" rel=3D"noreferrer" target=3D"_blank">libsoup_3.4.4=
.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://libsoup_3.4.4.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://libsoup_3.4.4.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/meta/recipes-support/libsoup/<a href=3D"=
http://libsoup_3.4.4.bb" rel=3D"noreferrer" target=3D"_blank">libsoup_3.4.4=
.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://libsoup_3.4.4.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://libsoup_3.4.4.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -18,6 +18,7 @@ SRC_URI =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-$=
{PV}.tar.xz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://CVE-2024-52531-1.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://CVE-2024-52531-2.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://CVE-2024-52531-3.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://CVE-2025-32910.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;291c67725f36ed90ea43efff25064b69c5a2d19814884=
77c05c481a3b4b0c5aa&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Links: You receive all messages sent to this g=
roup.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; View/Reply Online (#215059):<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/message/215059" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.openembedded.org/g/openembedded-core/message/215059</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Mute This Topic: <a href=3D"https://lists.open=
embedded.org/mt/112311177/6084445" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.openembedded.org/mt/112311177/6084445</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Group Owner: <a href=3D"mailto:openembedded-co=
re%2Bowner@lists.openembedded.org" target=3D"_blank">openembedded-core+owne=
r@lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-core%252B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core%2Bowner@l=
ists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Unsubscribe:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:skandigraun@gmail.com" target=3D=
"_blank">skandigraun@gmail.com</a>]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;<br>
</blockquote></div>

--00000000000008d1a10632f7f1b7--

