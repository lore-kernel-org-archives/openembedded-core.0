Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3477CE83EED
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 08:11:45 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15448.1770192697379880885
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 00:11:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3l4v8+vo;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so4142643f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 00:11:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770192696; cv=none;
        d=google.com; s=arc-20240605;
        b=RpVhoZAL86tjYCT99JSBuXABCMVYdxsMzYsOmIcr0ugNrg8ZioPAQMAYz77iPPY+7u
         Xc7MCOTm+/LCBxSyXn469/vhqm4O7/l4WbMiirDj5ny5XOK8BfMoQFihAOY2Zy3dw3Xt
         ySwcRgojw0DZUIiMMPyKG8L0Y+bqbtHRwvVcWFh7mLk99UgKXajMJPBILZvhB9RcEE2h
         a4WQP55jYb0jvtBbhz0ylBB+JdAr9KG/Oi12TtLzfqcraBV2TonY3HXWWq7idoYhvDjH
         sN1+iy6VS5tKabWKzOvcw0myVCQUL5V/rg5OWEuN5irr7FwkWbdvO1PWYCSxPztzhNYQ
         zpqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CKe1GQ4gu5DEl/LVh6crqTSDj5ftkTIn/T6GrRGmbEQ=;
        fh=kyrcx/wGdP1K8AcZ1t5dlAg43e9Kck6gc8gLfroTQbI=;
        b=OWshu1X3d0pz9UYVeK6u/E8m5A7USJWLzyMXWnCbvllg7Br/JEV7njb2LP4sTCfaj/
         6DkkPrNUu56eHgxS22uJodc1TtCfgnsWIEiTLyDU31ewZ2e0xiOvbiM5o7GouYDnpjRC
         dfvIioC63bah33UVn68IJumhDAQcvi194QNr0/d1W+4hdAdOLIIP2demwQygxeR+8PHP
         tWm+WQHCvSdExXn6vzuqdBErZRNM9qp1nsyZMEbjkk8D5S7Gvg3MJWVP70rjh4U34ay3
         UgyTgSopoI0SIKXnonPKQ0KoxiRzb35VU2g2YUZEDbZV7GRdrq/0jBR445o65YLHD9bk
         Va+Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770192696; x=1770797496; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CKe1GQ4gu5DEl/LVh6crqTSDj5ftkTIn/T6GrRGmbEQ=;
        b=3l4v8+vozHem7iKB4SgEGzr0U/tuZFaQ9m43HeSakG652NtWGH9edIo8Aw0B3CDg0P
         N4i64Kp+lDvb5rrnt6yi0BO1APkaXuQUC+VP9cWZ0I+2X9Vo15d52p5MQQ6j+/6R17r2
         YzfFjsX+T/JcbBYhSUA09aVkO5a/TonDVzpOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770192696; x=1770797496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKe1GQ4gu5DEl/LVh6crqTSDj5ftkTIn/T6GrRGmbEQ=;
        b=s5+4KQkGJbNXBVQxMNqeSiqwj7p+2Dt/0Rb0FmGnaYRkpou0yAzfaqHXqkejfL/EZ9
         dho8FY0eq3rkXNDIG8ikvXmh+YqVV8S9vMb24oBpXY7y549FHl5ejaDg6+Dl83H1QSRI
         uN5kNCFldZHPG833m0N3+yXqYJmjBDvkdY+UDfIwvzy4IPMhsoy+/HUxA0bFB++twS5N
         bM6yf6HtsRnctocVefBTLScNZ1xyAOC9Cpf+HF4YX0+sVFLTV14RlyTm8WMq3/yxVM9Z
         0IIbW45g7BvOoiw3uB7c4Jvs7XkdEHBBg9bJG5WboJ/iY9lNPf1A0KICngvXI/QdBJdz
         /IYg==
X-Gm-Message-State: AOJu0Yz+d/XpZ0dqiO7GvE6Fm2wSRcLnTvyXgW/XIvn3w2VFT/pwByKj
	ZF+qfExadsJjDmQCsw+AF4Hj1cEI4ME1/54m9UlJ1J1Ksf0jpwlUu2TZplMWZzxg0TDcIGdq9u5
	Govl/Iy6PcWBK0RrORjFLwZfDD2HM02HcMBsVjDW61w==
X-Gm-Gg: AZuq6aJORmBhaT69WpnnukWI0IY1ZtDU1gpX3/6bGMP1mX/YjHwCTGo0lQ98DmOFpDK
	553z76OX5FEpAWCJakfEfKWQU/eqBWv6lPHnmFj+vOd5vPbMLYmbuocTb5xxQu9fUzKXjzV/g8k
	YpchDVFDS0ixnPkhdOV8hMZ8U0/2s6pYMW55RNnfXIS7qrJpNyohMt67T0HUFMHzd4yX4VsLoko
	Xm8b0SbWTyTmsbfIWH9izi+qthnsXo2RpCqiTsCZ7oxa7XV4+7UkcRzjTjr3HNVQSz9ZYwzvX81
	xV2++e4T0PFGp6h+AmaUi7q/crkgj2fZsIuQVr4=
X-Received: by 2002:a05:6000:200e:b0:42b:3b55:8929 with SMTP id
 ffacd0b85a97d-43617e42a35mr3021657f8f.19.1770192695683; Wed, 04 Feb 2026
 00:11:35 -0800 (PST)
MIME-Version: 1.0
References: <1889800F45802F27.2902090@lists.openembedded.org> <AS1PR10MB56976FD8DA8A295D941E55B3FD98A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56976FD8DA8A295D941E55B3FD98A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 4 Feb 2026 09:11:09 +0100
X-Gm-Features: AZwV_QgpoexKTfzV8wQy65yZQwV9yabvrA3TWUpUOAPvtH54ZdlY4zZzw4jTZRE
Message-ID: <CAMSfU+4Kx5baoR2ZB2qrJihZbvA5anQRxMLSevTZXhzC9Sx8cg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] gnupg: upgrade 2.4.8 -> 2.4.9
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cf7f670649fb1a76"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 08:11:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230502

--000000000000cf7f670649fb1a76
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 4 f=C3=A9vr. 2026 =C3=A0 08:20, Marko, Peter <Peter.Marko@siemens.c=
om> a
=C3=A9crit :

> Gentle ping
>

Thanks, I had missed it,
I've now added it to the series under test/review.


> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Peter Marko via
> > lists.openembedded.org
> > Sent: Saturday, January 10, 2026 23:45
> > To: openembedded-core@lists.openembedded.org
> > Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Subject: [OE-core][scarthgap][PATCH] gnupg: upgrade 2.4.8 -> 2.4.9
> >
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > Handles CVE-2025-68973.
> >
> > Refresh patches.
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >  meta/recipes-support/gnupg/gnupg/relocate.patch    | 14 +++++++-------
> >  .../gnupg/{gnupg_2.4.8.bb =3D> gnupg_2.4.9.bb}       |  2 +-
> >  2 files changed, 8 insertions(+), 8 deletions(-)
> >  rename meta/recipes-support/gnupg/{gnupg_2.4.8.bb =3D> gnupg_2.4.9.bb}
> (97%)
> >
> > diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch
> b/meta/recipes-
> > support/gnupg/gnupg/relocate.patch
> > index ea0252026aa..655dd3d0ce1 100644
> > --- a/meta/recipes-support/gnupg/gnupg/relocate.patch
> > +++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
> > @@ -17,7 +17,7 @@ diff --git a/common/homedir.c b/common/homedir.c
> >  index 6f99f3e..f22aa9e 100644
> >  --- a/common/homedir.c
> >  +++ b/common/homedir.c
> > -@@ -1284,7 +1284,7 @@ gnupg_socketdir (void)
> > +@@ -1294,7 +1294,7 @@ gnupg_socketdir (void)
> >     if (!name)
> >       {
> >         unsigned int dummy;
> > @@ -26,7 +26,7 @@ index 6f99f3e..f22aa9e 100644
> >         gpgrt_annotate_leaked_object (name);
> >       }
> >
> > -@@ -1316,7 +1316,7 @@ gnupg_sysconfdir (void)
> > +@@ -1326,7 +1326,7 @@ gnupg_sysconfdir (void)
> >     if (dir)
> >       return dir;
> >     else
> > @@ -35,7 +35,7 @@ index 6f99f3e..f22aa9e 100644
> >   #endif /*!HAVE_W32_SYSTEM*/
> >   }
> >
> > -@@ -1352,7 +1352,7 @@ gnupg_bindir (void)
> > +@@ -1362,7 +1362,7 @@ gnupg_bindir (void)
> >         return name;
> >       }
> >     else
> > @@ -44,7 +44,7 @@ index 6f99f3e..f22aa9e 100644
> >   #endif /*!HAVE_W32_SYSTEM*/
> >   }
> >
> > -@@ -1379,7 +1379,7 @@ gnupg_libexecdir (void)
> > +@@ -1389,7 +1389,7 @@ gnupg_libexecdir (void)
> >         return name;
> >       }
> >     else
> > @@ -53,7 +53,7 @@ index 6f99f3e..f22aa9e 100644
> >   #endif /*!HAVE_W32_SYSTEM*/
> >   }
> >
> > -@@ -1409,7 +1409,7 @@ gnupg_libdir (void)
> > +@@ -1419,7 +1419,7 @@ gnupg_libdir (void)
> >         return name;
> >       }
> >     else
> > @@ -62,7 +62,7 @@ index 6f99f3e..f22aa9e 100644
> >   #endif /*!HAVE_W32_SYSTEM*/
> >   }
> >
> > -@@ -1440,7 +1440,7 @@ gnupg_datadir (void)
> > +@@ -1450,7 +1450,7 @@ gnupg_datadir (void)
> >         return name;
> >       }
> >     else
> > @@ -71,7 +71,7 @@ index 6f99f3e..f22aa9e 100644
> >   #endif /*!HAVE_W32_SYSTEM*/
> >   }
> >
> > -@@ -1472,7 +1472,7 @@ gnupg_localedir (void)
> > +@@ -1482,7 +1482,7 @@ gnupg_localedir (void)
> >         return name;
> >       }
> >     else
> > diff --git a/meta/recipes-support/gnupg/gnupg_2.4.8.bb b/meta/recipes-
> > support/gnupg/gnupg_2.4.9.bb
> > similarity index 97%
> > rename from meta/recipes-support/gnupg/gnupg_2.4.8.bb
> > rename to meta/recipes-support/gnupg/gnupg_2.4.9.bb
> > index a6e777abf89..4f60a4e7b28 100644
> > --- a/meta/recipes-support/gnupg/gnupg_2.4.8.bb
> > +++ b/meta/recipes-support/gnupg/gnupg_2.4.9.bb
> > @@ -23,7 +23,7 @@ SRC_URI:append:class-native =3D "
> file://0001-configure.ac-
> > use-a-custom-value-for-
> >                                  file://relocate.patch"
> >  SRC_URI:append:class-nativesdk =3D " file://relocate.patch"
> >
> > -SRC_URI[sha256sum] =3D
> > "b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689563bcdd060595318616"
> > +SRC_URI[sha256sum] =3D
> > "dd17ab2e9a04fd79d39d853f599cbc852062ddb9ab52a4ddeb4176fd8b302964"
> >
> >  EXTRA_OECONF =3D "--disable-ldap \
> >               --disable-ccid-driver \
>


--=20
Yoann Congal
Smile ECS

--000000000000cf7f670649fb1a76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 4 =
f=C3=A9vr. 2026 =C3=A0=C2=A008:20, Marko, Peter &lt;<a href=3D"mailto:Peter=
.Marko@siemens.com">Peter.Marko@siemens.com</a>&gt; a =C3=A9crit=C2=A0:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Gentle ping<br></bl=
ockquote><div><br></div><div><div>Thanks, I had missed it,</div><div>I&#39;=
ve now added it to the series under test/review.</div></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Peter Marko via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: Saturday, January 10, 2026 23:45<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Marko@s=
iemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br>
&gt; Subject: [OE-core][scarthgap][PATCH] gnupg: upgrade 2.4.8 -&gt; 2.4.9<=
br>
&gt; <br>
&gt; From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" targe=
t=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; <br>
&gt; Handles CVE-2025-68973.<br>
&gt; <br>
&gt; Refresh patches.<br>
&gt; <br>
&gt; Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.c=
om" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-support/gnupg/gnupg/relocate.patch=C2=A0 =C2=A0 | 1=
4 +++++++-------<br>
&gt;=C2=A0 .../gnupg/{<a href=3D"http://gnupg_2.4.8.bb" rel=3D"noreferrer" =
target=3D"_blank">gnupg_2.4.8.bb</a> =3D&gt; <a href=3D"http://gnupg_2.4.9.=
bb" rel=3D"noreferrer" target=3D"_blank">gnupg_2.4.9.bb</a>}=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 2 files changed, 8 insertions(+), 8 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-support/gnupg/{<a href=3D"http://gnupg_2.4.8=
.bb" rel=3D"noreferrer" target=3D"_blank">gnupg_2.4.8.bb</a> =3D&gt; <a hre=
f=3D"http://gnupg_2.4.9.bb" rel=3D"noreferrer" target=3D"_blank">gnupg_2.4.=
9.bb</a>} (97%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/re=
cipes-<br>
&gt; support/gnupg/gnupg/relocate.patch<br>
&gt; index ea0252026aa..655dd3d0ce1 100644<br>
&gt; --- a/meta/recipes-support/gnupg/gnupg/relocate.patch<br>
&gt; +++ b/meta/recipes-support/gnupg/gnupg/relocate.patch<br>
&gt; @@ -17,7 +17,7 @@ diff --git a/common/homedir.c b/common/homedir.c<br>
&gt;=C2=A0 index 6f99f3e..f22aa9e 100644<br>
&gt;=C2=A0 --- a/common/homedir.c<br>
&gt;=C2=A0 +++ b/common/homedir.c<br>
&gt; -@@ -1284,7 +1284,7 @@ gnupg_socketdir (void)<br>
&gt; +@@ -1294,7 +1294,7 @@ gnupg_socketdir (void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (!name)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int dummy;<br>
&gt; @@ -26,7 +26,7 @@ index 6f99f3e..f22aa9e 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpgrt_annotate_leaked_object (name);<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt; -@@ -1316,7 +1316,7 @@ gnupg_sysconfdir (void)<br>
&gt; +@@ -1326,7 +1326,7 @@ gnupg_sysconfdir (void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (dir)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return dir;<br>
&gt;=C2=A0 =C2=A0 =C2=A0else<br>
&gt; @@ -35,7 +35,7 @@ index 6f99f3e..f22aa9e 100644<br>
&gt;=C2=A0 =C2=A0#endif /*!HAVE_W32_SYSTEM*/<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; <br>
&gt; -@@ -1352,7 +1352,7 @@ gnupg_bindir (void)<br>
&gt; +@@ -1362,7 +1362,7 @@ gnupg_bindir (void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return name;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0else<br>
&gt; @@ -44,7 +44,7 @@ index 6f99f3e..f22aa9e 100644<br>
&gt;=C2=A0 =C2=A0#endif /*!HAVE_W32_SYSTEM*/<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; <br>
&gt; -@@ -1379,7 +1379,7 @@ gnupg_libexecdir (void)<br>
&gt; +@@ -1389,7 +1389,7 @@ gnupg_libexecdir (void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return name;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0else<br>
&gt; @@ -53,7 +53,7 @@ index 6f99f3e..f22aa9e 100644<br>
&gt;=C2=A0 =C2=A0#endif /*!HAVE_W32_SYSTEM*/<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; <br>
&gt; -@@ -1409,7 +1409,7 @@ gnupg_libdir (void)<br>
&gt; +@@ -1419,7 +1419,7 @@ gnupg_libdir (void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return name;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0else<br>
&gt; @@ -62,7 +62,7 @@ index 6f99f3e..f22aa9e 100644<br>
&gt;=C2=A0 =C2=A0#endif /*!HAVE_W32_SYSTEM*/<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; <br>
&gt; -@@ -1440,7 +1440,7 @@ gnupg_datadir (void)<br>
&gt; +@@ -1450,7 +1450,7 @@ gnupg_datadir (void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return name;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0else<br>
&gt; @@ -71,7 +71,7 @@ index 6f99f3e..f22aa9e 100644<br>
&gt;=C2=A0 =C2=A0#endif /*!HAVE_W32_SYSTEM*/<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; <br>
&gt; -@@ -1472,7 +1472,7 @@ gnupg_localedir (void)<br>
&gt; +@@ -1482,7 +1482,7 @@ gnupg_localedir (void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return name;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0else<br>
&gt; diff --git a/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.4.8.=
bb" rel=3D"noreferrer" target=3D"_blank">gnupg_2.4.8.bb</a> b/meta/recipes-=
<br>
&gt; support/gnupg/<a href=3D"http://gnupg_2.4.9.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gnupg_2.4.9.bb</a><br>
&gt; similarity index 97%<br>
&gt; rename from meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.4.8.b=
b" rel=3D"noreferrer" target=3D"_blank">gnupg_2.4.8.bb</a><br>
&gt; rename to meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.4.9.bb"=
 rel=3D"noreferrer" target=3D"_blank">gnupg_2.4.9.bb</a><br>
&gt; index a6e777abf89..4f60a4e7b28 100644<br>
&gt; --- a/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.4.8.bb" rel=
=3D"noreferrer" target=3D"_blank">gnupg_2.4.8.bb</a><br>
&gt; +++ b/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.4.9.bb" rel=
=3D"noreferrer" target=3D"_blank">gnupg_2.4.9.bb</a><br>
&gt; @@ -23,7 +23,7 @@ SRC_URI:append:class-native =3D &quot; file://0001-c=
onfigure.ac-<br>
&gt; use-a-custom-value-for-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://relocate.patch&quot=
;<br>
&gt;=C2=A0 SRC_URI:append:class-nativesdk =3D &quot; file://relocate.patch&=
quot;<br>
&gt; <br>
&gt; -SRC_URI[sha256sum] =3D<br>
&gt; &quot;b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689563bcdd060595318616=
&quot;<br>
&gt; +SRC_URI[sha256sum] =3D<br>
&gt; &quot;dd17ab2e9a04fd79d39d853f599cbc852062ddb9ab52a4ddeb4176fd8b302964=
&quot;<br>
&gt; <br>
&gt;=C2=A0 EXTRA_OECONF =3D &quot;--disable-ldap \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-ccid-d=
river \<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000cf7f670649fb1a76--

