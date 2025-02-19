Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D67C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 14:50:24 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.24063.1739976617058597632
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 06:50:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=z3UmREXX;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4398738217aso30899635e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 06:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739976615; x=1740581415; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kQjHfqciqU2t515t0jes+a6U6f2XgaK2pDCA9ENsXKY=;
        b=z3UmREXXegfC/uE0SEftNPjLVL93b4ObAap9wD59aiKYt4yW5k/y4i8CGqXYnUd6rn
         6cDsdy4RRrMzm79i1KmBuPkuTCeFB8QxPijvGF3XkaUTny6jNDmObsM2Mp/0DfHpcYn2
         us+mtleHYpObs0o7uyGJEcQ+pBA3yoZvKE1cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739976615; x=1740581415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQjHfqciqU2t515t0jes+a6U6f2XgaK2pDCA9ENsXKY=;
        b=pu1CB9rMOJ6RLcrv6GoZ+s/5weKNPtihe/ux0vOeF3eG+LV7ADrc+vB9BT2DpFyqTJ
         Cx5xtkelaGnTRlItDP2d44OgkWjFGj+aIGediL6s7adYYFESpzfAurfNpYLZ0vlQ1DrR
         c11IxnAawSv9Ta4plJWXkSLqoWCXTtlvLuB2e2e7M1zt6YgDHyLKdEYxUSwO/Blpp+hw
         /1VBvMoZ+6MFeimpEWmaRkUDhnfvqqpmttdKF1tmU6lWJA0zZzwj+gF2fFP73M+jvJWi
         TI/6mTONFd8MqP8vOmXHnf/xXVhGvWin1oIh6EdFMRFNatz8DynhZ9zpHjG3Ve+v3BbP
         NErg==
X-Gm-Message-State: AOJu0YwwV9NafFmQzuQEP0gDnphYaeqgKfyY1KYrcNQJYyEN5KRlhe9U
	khSGXs8e6sHgOHz/VtmwcRUwB4VJHRvpETWF5K6b7dCibumbouN5IIg2bwZJlU5m4JJqtLn2u4T
	T1y9dpV1cRFLgGUHBTFAp/uFGbufvjfLH6+sdiij0ZSm9Dw5H
X-Gm-Gg: ASbGncvVfB4BTDyUVB4NDOiyDbmCKNXB1eFyO/S5cdY/4mjmjV8a5j77sQe0JGP5Epb
	Hyc6sWtumgmiSllhDyMS/f/Jy39IhV86lvcX1V9jHMHZPwwODp06r0r11vRUrBi284uVhP9d0/X
	w=
X-Google-Smtp-Source: AGHT+IEZ389kX+qh7hzNYFD9LvIWxjH/bSpYXFytwpKkw1gaUf4JQXjWo4CHohdbwYMGGtvL1qGQC6/dI2GCr6cZhII=
X-Received: by 2002:a05:600c:4f83:b0:439:6dba:adf2 with SMTP id
 5b1f17b1804b1-43999da232amr38142825e9.15.1739976615214; Wed, 19 Feb 2025
 06:50:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1739913090.git.steve@sakoman.com> <a1b322d5dde27461a6b972b051a120ef3c96d204.1739913090.git.steve@sakoman.com>
 <CAMSfU+7yPYaFN_uoJd0wkeehnbnnF1RZVxbviW6p7wwj+ukEdg@mail.gmail.com> <CAOSpxdbQgwQ6qOyc8hDd16wtH3g=WS5e6wHzQTw-JpUEsE54NA@mail.gmail.com>
In-Reply-To: <CAOSpxdbQgwQ6qOyc8hDd16wtH3g=WS5e6wHzQTw-JpUEsE54NA@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 19 Feb 2025 15:49:48 +0100
X-Gm-Features: AWEUYZmhO-x43hV0fxa_UjYxZfPH-3vrTWcyZOBQwIwLMLEyAjA3KgzzR97J7bk
Message-ID: <CAMSfU+6Mj_CRTTRDUW-_sAAjr-0Gxj9EH3cBn2rWB5XbJ82_JQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 1/7] subversion: ignore CVE-2024-45720
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, 
	Sofiane HAMAM <sofiane.hamam@smile.fr>
Content-Type: multipart/alternative; boundary="000000000000116433062e7fe017"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 14:50:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211711

--000000000000116433062e7fe017
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 19 f=C3=A9vr. 2025 =C3=A0 15:42, Steve Sakoman <steve@sakoman.com> =
a =C3=A9crit :

> On Wed, Feb 19, 2025 at 12:33=E2=80=AFAM Yoann Congal <yoann.congal@smile=
.fr>
> wrote:
> >
> >
> >
> > Le mar. 18 f=C3=A9vr. 2025 =C3=A0 22:15, Steve Sakoman via lists.openem=
bedded.org
> <steve=3Dsakoman.com@lists.openembedded.org> a =C3=A9crit :
> >>
> >> From: Peter Marko <peter.marko@siemens.com>
> >>
> >> Reference: https://nvd.nist.gov/vuln/detail/CVE-2024-45720
> >>
> >> This CVE is relevant only for subversion running on Windows.
> >>
> >> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> >> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> >
> >
> > Hi Steve,
> >
> > Sorry to bother you with this but Sofiane Hamam gave its Reviewed-by
> here:
> >
> https://lists.openembedded.org/g/openembedded-core/topic/111147177#msg211=
378
> >
> > He worked on fixing the CVE but Peter was faster so he gave its
> reviewed-by. It would be nice if that ended up in the repository.
>
> OK, I'll make it so!
>

Thanks Steve! :)



>
> Steve
>
> >>  meta/recipes-devtools/subversion/subversion_1.14.3.bb | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta/recipes-devtools/subversion/subversion_1.14.3.bb
> b/meta/recipes-devtools/subversion/subversion_1.14.3.bb
> >> index 1ef3d498a5..679228cbb8 100644
> >> --- a/meta/recipes-devtools/subversion/subversion_1.14.3.bb
> >> +++ b/meta/recipes-devtools/subversion/subversion_1.14.3.bb
> >> @@ -19,6 +19,8 @@ inherit autotools pkgconfig gettext python3native
> >>
> >>  CVE_PRODUCT =3D "apache:subversion"
> >>
> >> +CVE_STATUS[CVE-2024-45720] =3D "not-applicable-platform: Issue only
> applies on Windows"
> >> +
> >>  PACKAGECONFIG ?=3D ""
> >>
> >>  PACKAGECONFIG[boost] =3D
> "--with-boost=3D${RECIPE_SYSROOT}${exec_prefix},--without-boost,boost"
> >> --
> >> 2.43.0
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#211653):
> https://lists.openembedded.org/g/openembedded-core/message/211653
> >> Mute This Topic: https://lists.openembedded.org/mt/111258880/4316185
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
> yoann.congal@smile.fr]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >
> >
> > --
> > Yoann Congal
> > Smile ECS - Tech expert
>


--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000116433062e7fe017
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 19=
 f=C3=A9vr. 2025 =C3=A0=C2=A015:42, Steve Sakoman &lt;<a href=3D"mailto:ste=
ve@sakoman.com">steve@sakoman.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Feb 19, 2025 at 12:33=
=E2=80=AFAM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" targe=
t=3D"_blank">yoann.congal@smile.fr</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Le mar. 18 f=C3=A9vr. 2025 =C3=A0 22:15, Steve Sakoman via <a href=3D"=
http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.o=
penembedded.org</a> &lt;steve=3D<a href=3D"mailto:sakoman.com@lists.openemb=
edded.org" target=3D"_blank">sakoman.com@lists.openembedded.org</a>&gt; a =
=C3=A9crit :<br>
&gt;&gt;<br>
&gt;&gt; From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Reference: <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2024-45=
720" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/=
CVE-2024-45720</a><br>
&gt;&gt;<br>
&gt;&gt; This CVE is relevant only for subversion running on Windows.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@sieme=
ns.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.c=
om" target=3D"_blank">steve@sakoman.com</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt; Hi Steve,<br>
&gt;<br>
&gt; Sorry to bother you with this but Sofiane Hamam gave its Reviewed-by h=
ere:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/11=
1147177#msg211378" rel=3D"noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-core/topic/111147177#msg211378</a><br>
&gt;<br>
&gt; He worked on fixing the CVE but Peter was faster so he gave its review=
ed-by. It would be nice if that ended up in the repository.<br>
<br>
OK, I&#39;ll make it so!<br></blockquote><div><br></div><div>Thanks Steve! =
:)</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
Steve<br>
<br>
&gt;&gt;=C2=A0 meta/recipes-devtools/subversion/<a href=3D"http://subversio=
n_1.14.3.bb" rel=3D"noreferrer" target=3D"_blank">subversion_1.14.3.bb</a> =
| 2 ++<br>
&gt;&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/subversion/<a href=3D"http://su=
bversion_1.14.3.bb" rel=3D"noreferrer" target=3D"_blank">subversion_1.14.3.=
bb</a> b/meta/recipes-devtools/subversion/<a href=3D"http://subversion_1.14=
.3.bb" rel=3D"noreferrer" target=3D"_blank">subversion_1.14.3.bb</a><br>
&gt;&gt; index 1ef3d498a5..679228cbb8 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/subversion/<a href=3D"http://subversio=
n_1.14.3.bb" rel=3D"noreferrer" target=3D"_blank">subversion_1.14.3.bb</a><=
br>
&gt;&gt; +++ b/meta/recipes-devtools/subversion/<a href=3D"http://subversio=
n_1.14.3.bb" rel=3D"noreferrer" target=3D"_blank">subversion_1.14.3.bb</a><=
br>
&gt;&gt; @@ -19,6 +19,8 @@ inherit autotools pkgconfig gettext python3nativ=
e<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 CVE_PRODUCT =3D &quot;apache:subversion&quot;<br>
&gt;&gt;<br>
&gt;&gt; +CVE_STATUS[CVE-2024-45720] =3D &quot;not-applicable-platform: Iss=
ue only applies on Windows&quot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 PACKAGECONFIG ?=3D &quot;&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[boost] =3D &quot;--with-boost=3D${RECIPE_SYSRO=
OT}${exec_prefix},--without-boost,boost&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.43.0<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#211653): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/211653" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/message/211653</a><br=
>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1112=
58880/4316185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/111258880/4316185</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smil=
e.fr" target=3D"_blank">yoann.congal@smile.fr</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Yoann Congal<br>
&gt; Smile ECS - Tech expert<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div><=
/div></div>

--000000000000116433062e7fe017--

