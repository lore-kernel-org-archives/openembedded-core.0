Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B6DC369C2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 11:21:17 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.6210.1744888876600973033
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 04:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=bGtvNkKF;
 spf=pass (domain: mvista.com, ip: 209.85.218.44, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so109006966b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 04:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744888875; x=1745493675; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eF2DBxNZO3WMCwS1JuAVT8EdV1KBQbTy0x3QpTqpTpA=;
        b=bGtvNkKFLHRrDpaABbCn5p+dQRhtkRgGMwjxFRlcNYsrH8RpRmw+8nUdUf/Hcf9b6L
         Vy156bRZJ2rQaZtCkUl90JoUVCnZ4LopMFYsCO/MsDV8EOQ0bOOIBiO7mG3j0tEeIyMe
         +zHRcSnF1aw7nnjvrWeKR8mEYzrayBOkPE+ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744888875; x=1745493675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eF2DBxNZO3WMCwS1JuAVT8EdV1KBQbTy0x3QpTqpTpA=;
        b=dz+2RPtjjaDEUHwRJqGLLxEM9O2q+L6flJZqntX1qkpZHmFrF3s7MaMyYSSsaNQoQA
         2zZ+TmR2Cuc08GzG9czpNUqN2b4jayBdP/f9Wlh8g34ZSXhXQ4WNeZtubH07VIQ0c/hq
         HzFG7UphEteEtI57KvK8KGt1NhtLEEWIHaazIOl6Uq/6IIapeSAOSAAUWqURC2g5Km3b
         zUTfHQGxRtRuiKpS52eiI56TGsd9b9UFFJbtEJIShuynemXLUFJeZRpGHM+tN7Ol+kJ8
         hopvMOFB5bkcOYjZmu1qOoWZZeG4buDoVVs3P3I+nMa7uzy0pwzPFBaSIveXVXe4Xq6L
         FnAg==
X-Gm-Message-State: AOJu0YwaD59XTW9ymzAuz6hQjbWzsnO1IaSqbxJi5mGxIoB+cWMnC0Oy
	85DQpqyB4zQvva4NcSV0L7J0ZLncJhJbknzIEH8hIAqiKh0VByzPJCNov9+v10dj6Teo/Ro937G
	bCGtU/84v0m5mP8Nx3Hj/gyl+do/hdj1jlsBLNA==
X-Gm-Gg: ASbGncuk0ThbqrPZrZUNhlaTiPkErV/ShWbfsqm68mCNxXBPgxNU5ht6gr6oi8CgOu4
	Cf0xZtVldDgb/D+iv4V96XALZgtUO1+6x5hIUqGRG291XmeUGz+bozJhUyalv7+hVvtlgZnnDhi
	aDKWdQrJMVgQJVe8KUjNAeODf7jHLcbl8nbw==
X-Google-Smtp-Source: AGHT+IF+bmeJz/VoJ2CAGJNQ+egVUfXR7woAobpDi3npL9/NAl7lgQzxJv8tSasG6bj3HTbBv8VW8AT26v/d35+JMlM=
X-Received: by 2002:a17:906:1d01:b0:acb:5f17:623d with SMTP id
 a640c23a62f3a-acb5f1769b4mr154114866b.24.1744888874729; Thu, 17 Apr 2025
 04:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250417104258.64180-1-vanusuri@mvista.com> <5d660e04-3839-4af3-a2d3-398e199448bb@gmail.com>
In-Reply-To: <5d660e04-3839-4af3-a2d3-398e199448bb@gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Thu, 17 Apr 2025 16:51:03 +0530
X-Gm-Features: ATxdqUGI7JRJLhIlnYLHHsY57eSiMwAGS1iqWLX2O6AivVCCtcbCWMcqNHtE7YA
Message-ID: <CANQUz19f9DEyCkbHkaGk4wbeX2OaRMdx3AqcVAiE=uaT+jWCGQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH v2 1/5] libsoup: Fix CVE-2025-32910
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008d1d510632f79970"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 11:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215070

--0000000000008d1d510632f79970
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have renamed one of the patches in the v2 patch.

Thanks & Regards,
Vijay


On Thu, Apr 17, 2025 at 4:45=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.c=
om>
wrote:

> This seems to be identical to v1.
>
> On 4/17/25 12:42, Vijay Anusuri via lists.openembedded.org wrote:
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Upstream-Status: Backport from
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b7=
05e5eab34b13832
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  .../libsoup-3.4.4/CVE-2025-32910.patch        | 27 +++++++++++++++++++
> >  meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
> >  2 files changed, 28 insertions(+)
> >  create mode 100644
> meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch
> >
> > diff --git
> a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch
> b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch
> > new file mode 100644
> > index 0000000000..32e0c86e62
> > --- /dev/null
> > +++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch
> > @@ -0,0 +1,27 @@
> > +From ea16eeacb052e423eb5c3b0b705e5eab34b13832 Mon Sep 17 00:00:00 2001
> > +From: Patrick Griffis <pgriffis@igalia.com>
> > +Date: Fri, 27 Dec 2024 13:52:52 -0600
> > +Subject: [PATCH] auth-digest: Fix leak
> > +
> > +Upstream-Status: Backport [
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b7=
05e5eab34b13832
> ]
> > +CVE: CVE-2025-32910
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + libsoup/auth/soup-auth-digest.c | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/libsoup/auth/soup-auth-digest.c
> b/libsoup/auth/soup-auth-digest.c
> > +index 350bfde6..9eb7fa0e 100644
> > +--- a/libsoup/auth/soup-auth-digest.c
> > ++++ b/libsoup/auth/soup-auth-digest.c
> > +@@ -72,6 +72,7 @@ soup_auth_digest_finalize (GObject *object)
> > +     g_free (priv->nonce);
> > +     g_free (priv->domain);
> > +     g_free (priv->cnonce);
> > ++        g_free (priv->opaque);
> > +
> > +     memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
> > +     memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
> > +--
> > +GitLab
> > +
> > diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
> b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
> > index b2e32b892a..757e6432f7 100644
> > --- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
> > +++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
> > @@ -18,6 +18,7 @@ SRC_URI =3D
> "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
> >             file://CVE-2024-52531-1.patch \
> >             file://CVE-2024-52531-2.patch \
> >             file://CVE-2024-52531-3.patch \
> > +           file://CVE-2025-32910.patch \
> >            "
> >  SRC_URI[sha256sum] =3D
> "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#215059):
> https://lists.openembedded.org/g/openembedded-core/message/215059
> > Mute This Topic: https://lists.openembedded.org/mt/112311177/6084445
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000008d1d510632f79970
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>I have renamed one of the patches in the v2 patc=
h.<br><br></div>Thanks &amp; Regards,<br></div>Vijay<div><br></div></div><b=
r><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Apr 17, 2025 at 4:45=E2=80=AFPM Gyorgy Sarvari &lt;=
<a href=3D"mailto:skandigraun@gmail.com">skandigraun@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This seems to=
 be identical to v1.<br>
<br>
On 4/17/25 12:42, Vijay Anusuri via <a href=3D"http://lists.openembedded.or=
g" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<b=
r>
&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;<br>
&gt; Upstream-Status: Backport from <a href=3D"https://gitlab.gnome.org/GNO=
ME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b705e5eab34b13832" rel=3D"norefe=
rrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea1=
6eeacb052e423eb5c3b0b705e5eab34b13832</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../libsoup-3.4.4/CVE-2025-32910.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 27 +++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-support/libsoup/<a href=3D"http://libsoup_3.4.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">libsoup_3.4.4.bb</a> |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 28 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CV=
E-2025-32910.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910=
.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch<br=
>
&gt; new file mode 100644<br>
&gt; index 0000000000..32e0c86e62<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910.patch<=
br>
&gt; @@ -0,0 +1,27 @@<br>
&gt; +From ea16eeacb052e423eb5c3b0b705e5eab34b13832 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Patrick Griffis &lt;<a href=3D"mailto:pgriffis@igalia.com" targ=
et=3D"_blank">pgriffis@igalia.com</a>&gt;<br>
&gt; +Date: Fri, 27 Dec 2024 13:52:52 -0600<br>
&gt; +Subject: [PATCH] auth-digest: Fix leak<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/=
libsoup/-/commit/ea16eeacb052e423eb5c3b0b705e5eab34b13832" rel=3D"noreferre=
r" target=3D"_blank">https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16ee=
acb052e423eb5c3b0b705e5eab34b13832</a>]<br>
&gt; +CVE: CVE-2025-32910<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + libsoup/auth/soup-auth-digest.c | 1 +<br>
&gt; + 1 file changed, 1 insertion(+)<br>
&gt; +<br>
&gt; +diff --git a/libsoup/auth/soup-auth-digest.c b/libsoup/auth/soup-auth=
-digest.c<br>
&gt; +index 350bfde6..9eb7fa0e 100644<br>
&gt; +--- a/libsoup/auth/soup-auth-digest.c<br>
&gt; ++++ b/libsoup/auth/soup-auth-digest.c<br>
&gt; +@@ -72,6 +72,7 @@ soup_auth_digest_finalize (GObject *object)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0g_free (priv-&gt;nonce);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0g_free (priv-&gt;domain);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0g_free (priv-&gt;cnonce);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free (priv-&gt;opaque);<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0memset (priv-&gt;hex_urp, 0, sizeof (priv-&gt;hex=
_urp));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0memset (priv-&gt;hex_a1, 0, sizeof (priv-&gt;hex_=
a1));<br>
&gt; +-- <br>
&gt; +GitLab<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/libsoup/<a href=3D"http://libsoup_3.=
4.4.bb" rel=3D"noreferrer" target=3D"_blank">libsoup_3.4.4.bb</a> b/meta/re=
cipes-support/libsoup/<a href=3D"http://libsoup_3.4.4.bb" rel=3D"noreferrer=
" target=3D"_blank">libsoup_3.4.4.bb</a><br>
&gt; index b2e32b892a..757e6432f7 100644<br>
&gt; --- a/meta/recipes-support/libsoup/<a href=3D"http://libsoup_3.4.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">libsoup_3.4.4.bb</a><br>
&gt; +++ b/meta/recipes-support/libsoup/<a href=3D"http://libsoup_3.4.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">libsoup_3.4.4.bb</a><br>
&gt; @@ -18,6 +18,7 @@ SRC_URI =3D &quot;${GNOME_MIRROR}/libsoup/${SHRT_VER=
}/libsoup-${PV}.tar.xz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-52531-1=
.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-52531-2=
.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2024-52531-3=
.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-32910.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;291c67725f36ed90ea43efff25064b69c5a=
2d1981488477c05c481a3b4b0c5aa&quot;<br>
&gt;=C2=A0 <br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#215059): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/215059" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/215059</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11231117=
7/6084445" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/112311177/6084445</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:skandigraun@gmail.com=
" target=3D"_blank">skandigraun@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000008d1d510632f79970--

