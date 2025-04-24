Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C64CAC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 14:52:34 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.17239.1745506349183870088
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 07:52:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=X/3FQlEV;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso706779f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 07:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1745506347; x=1746111147; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3QYFxIimsLhsmgQwoazXsy4+kdP4B7Q1MvTYo9aYtdg=;
        b=X/3FQlEVKb9B9/hhvipXjjiZh3yPorh40cwTQ4up9gsPMCy0RQhbbBUh+jDYDbkOnf
         56XJ3dL22hRqv875q99t+cUmA+Bb4jbhV6XuKSA9F5kYVDDGnnCjiRiUcY36p/E9QtS6
         MhZc6ma5LzxMxkVKtduKgGQIxf3pYT6Mri+7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745506347; x=1746111147;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3QYFxIimsLhsmgQwoazXsy4+kdP4B7Q1MvTYo9aYtdg=;
        b=YGm0ORxZsIWyWIjwi51ef9OFxW378AZ8/aARo5e5pUNxWJJ21mceq3DM0eHJwRkIRb
         kxwRyvP7FKO2XGH6DOGPv/cSBiNnA+3TVqGfjnQRAUziK0iBFRyoVrqfY98Uy5mspOq7
         LPTq2eYDWsFmA18fmn8rql6w41ZrpXWJWBQ1XxdYDm5Yuuz0B8/ZKoJvqNeb9mOFv0nl
         F316Qtlt9gPIVohFcsXrE3Q1XgiKfxe0ELbuSXKldmH2AxCiPUEcTKgx5ZOtVVbaEZ4R
         1jbi2hA/Y+TWcFLl8QUTMUskzNqOrFoetf0hdabssTLqD9J8tp949JmN987NyMTKVutV
         uUTQ==
X-Gm-Message-State: AOJu0YwTlIr7FiOKOso5tVqMQ7JQlv1WqVmFEUa1K4hfUtANdJULL6yM
	S2fkMZLJHhR3VcZh/lcYWmBWm/Lea2i+vj6mLNA0bNGfnsytK8igzEHWfe7AtktbD2hLhtTaNoC
	MF5CWqtsZNPn6HfSXjh7JAbwHBFQTaim72eFY8cd/5h39DBTqNdc=
X-Gm-Gg: ASbGncuX5EkvsxiMsoPxj8KUP+sC7Yp/zCEdig9K327Geo3RuTB93C1Xn4repZ6Wg7F
	0ArvwpJlLQhXBNCCx6O7Owr1ERdf2oyfs80dnCl+ytRvrmgFFvVFUiHdKvUqeZj7/ftD4xSqp8q
	EGkbCiPehzr/PbqDXyfgf8I/soOIek5nDQyYYP7Qb3tq6a9jjmeJyMfiOu
X-Google-Smtp-Source: AGHT+IGpTPwvwfO7JZPKO8b9bP/exAjpRQ0303KvY/bGEGVyS8Q56ymw1Xh/XNWKhCTkMhbrY5I0jFgvhOmyWz5/b7k=
X-Received: by 2002:a5d:64c7:0:b0:391:4389:f36a with SMTP id
 ffacd0b85a97d-3a06cfaf773mr2376150f8f.48.1745506347434; Thu, 24 Apr 2025
 07:52:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:66c6:0:b0:390:d73f:69ef with HTTP; Thu, 24 Apr 2025
 07:52:27 -0700 (PDT)
In-Reply-To: <20250424122815.884740-2-ines.kchelfi@smile.fr>
References: <20250424122815.884740-1-ines.kchelfi@smile.fr> <20250424122815.884740-2-ines.kchelfi@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 24 Apr 2025 16:52:27 +0200
X-Gm-Features: ATxdqUG3LK7K6hn17Lb4zScQQqR2bQBfe3fknDCYdSkzLGPvcEUSEd9DWzUKAv8
Message-ID: <CAMSfU+5N_Md0wUJ5y1CtD3_Gm1XdF9VwmnwUOLi5ajXO32RHAw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] Add meta-stage-rust layer
To: "ines.kchelfi@smile.fr" <ines.kchelfi@smile.fr>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cae1160633875da5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 14:52:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215384

--000000000000cae1160633875da5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 24 avril 2025, ines.kchelfi via lists.openembedded.org
<ines.kchelfi=3Dsmile.fr@lists.openembedded.org> a =C3=A9crit :
> From: Ines KCHELFI <ines.kchelfi@smile.fr>
>
> ---
>  qemux86-64-master-menu.json | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

This is for an internal repo and should not have been sent.
Please ignore.
>
> diff --git a/qemux86-64-master-menu.json b/qemux86-64-master-menu.json
> index 4656462..0128c85 100644
> --- a/qemux86-64-master-menu.json
> +++ b/qemux86-64-master-menu.json
> @@ -5,7 +5,8 @@
>                 { "url": "ssh://
git@git.smile.fr/contribution-yocto/yocto-docs", "branch":
"upstream/master", "dir":"poky/documentation"},
>                 { "url": "ssh://
git@git.smile.fr/contribution-yocto/meta-yocto", "branch":
"upstream/master", "dir":"meta-yocto"},
>                 { "url": "ssh://
git@git.smile.fr/contribution-yocto/meta-smile", "branch": "main",
"dir":"meta-smile"},
> -               { "url": "ssh://
git@git.smile.fr/contribution-yocto/meta-openembedded", "branch":
"upstream/master", "dir":"meta-openembedded"}
> +               { "url": "ssh://
git@git.smile.fr/contribution-yocto/meta-openembedded", "branch":
"upstream/master", "dir":"meta-openembedded"},
> +               { "url": "ssh://
git@git.smile.fr/stage-ecs-2025-yocto-rust/meta-stage-rust", "branch":
"main", "dir":"meta-stage-rust"}
>         ],
>
>         "layers" : [
> @@ -13,7 +14,8 @@
>                 "meta-yocto/meta-poky",
>                 "meta-yocto/meta-yocto-bsp",
>                 "meta-smile/meta-test",
> -               "meta-openembedded/meta-oe"
> +               "meta-openembedded/meta-oe",
> +               "meta-stage-rust/meta-stage-rust"
>         ],
>
>         "override_distro": {
> @@ -37,7 +39,8 @@
>                         "local.conf": [
>                                 "MACHINE               =3D 'qemux86-64'",
>                                 "IMAGE_FSTYPES        +=3D 'wic.bz2
wic.bmap'",
> -                               "EXTRA_IMAGE_FEATURES +=3D
'allow-empty-password empty-root-password allow-root-login'"
> +                               "EXTRA_IMAGE_FEATURES +=3D
'allow-empty-password empty-root-password allow-root-login'",
> +                               "CORE_IMAGE_EXTRA_INSTALL =3D'hellocargo'=
"
>                         ]
>                 }
>         }
> --
> 2.43.0
>
>

--=20
Yoann Congal
Smile ECS

--000000000000cae1160633875da5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>Le jeudi 24 avril 2025, ines.kchelfi via <a href=3D"http://lists.op=
enembedded.org">lists.openembedded.org</a> &lt;ines.kchelfi=3D<a href=3D"ma=
ilto:smile.fr@lists.openembedded.org">smile.fr@lists.openembedded.org</a>&g=
t; a =C3=A9crit=C2=A0:<br>&gt; From: Ines KCHELFI &lt;<a href=3D"mailto:ine=
s.kchelfi@smile.fr">ines.kchelfi@smile.fr</a>&gt;<br>&gt;<br>&gt; ---<br>&g=
t; =C2=A0qemux86-64-master-menu.json | 9 ++++++---<br>&gt; =C2=A01 file cha=
nged, 6 insertions(+), 3 deletions(-)<br><br>This is for an internal repo a=
nd should not have been sent.<br>Please ignore.<br>&gt;<br>&gt; diff --git =
a/qemux86-64-master-menu.json b/qemux86-64-master-menu.json<br>&gt; index 4=
656462..0128c85 100644<br>&gt; --- a/qemux86-64-master-menu.json<br>&gt; ++=
+ b/qemux86-64-master-menu.json<br>&gt; @@ -5,7 +5,8 @@<br>&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;url&quot;: &quot;ssh:=
//<a href=3D"http://git@git.smile.fr/contribution-yocto/yocto-docs">git@git=
.smile.fr/contribution-yocto/yocto-docs</a>&quot;, &quot;branch&quot;: &quo=
t;upstream/master&quot;, &quot;dir&quot;:&quot;poky/documentation&quot;},<b=
r>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &quot;url&=
quot;: &quot;ssh://<a href=3D"http://git@git.smile.fr/contribution-yocto/me=
ta-yocto">git@git.smile.fr/contribution-yocto/meta-yocto</a>&quot;, &quot;b=
ranch&quot;: &quot;upstream/master&quot;, &quot;dir&quot;:&quot;meta-yocto&=
quot;},<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &=
quot;url&quot;: &quot;ssh://<a href=3D"http://git@git.smile.fr/contribution=
-yocto/meta-smile">git@git.smile.fr/contribution-yocto/meta-smile</a>&quot;=
, &quot;branch&quot;: &quot;main&quot;, &quot;dir&quot;:&quot;meta-smile&qu=
ot;},<br>&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &qu=
ot;url&quot;: &quot;ssh://<a href=3D"http://git@git.smile.fr/contribution-y=
octo/meta-openembedded">git@git.smile.fr/contribution-yocto/meta-openembedd=
ed</a>&quot;, &quot;branch&quot;: &quot;upstream/master&quot;, &quot;dir&qu=
ot;:&quot;meta-openembedded&quot;}<br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;url&quot;: &quot;ssh://<a href=3D"http://gi=
t@git.smile.fr/contribution-yocto/meta-openembedded">git@git.smile.fr/contr=
ibution-yocto/meta-openembedded</a>&quot;, &quot;branch&quot;: &quot;upstre=
am/master&quot;, &quot;dir&quot;:&quot;meta-openembedded&quot;},<br>&gt; +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;url&quot;: &=
quot;ssh://<a href=3D"http://git@git.smile.fr/stage-ecs-2025-yocto-rust/met=
a-stage-rust">git@git.smile.fr/stage-ecs-2025-yocto-rust/meta-stage-rust</a=
>&quot;, &quot;branch&quot;: &quot;main&quot;, &quot;dir&quot;:&quot;meta-s=
tage-rust&quot;}<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>&gt;<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;layers&quot; : [<br>&gt; @@ -13,7 +14,8 @@<b=
r>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;meta-y=
octo/meta-poky&quot;,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;meta-yocto/meta-yocto-bsp&quot;,<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;meta-smile/meta-test&quot;,<br=
>&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;meta-op=
enembedded/meta-oe&quot;<br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;meta-openembedded/meta-oe&quot;,<br>&gt; +=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;meta-stage-rust/meta-stage-=
rust&quot;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>&gt;<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;override_distro&quot;: {<br>&gt; @@ -37,7 +39,8 =
@@<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;local.conf&quot;: [<br>&gt; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &#39;qemux86-64&#39;&quot;,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;IMAGE_FSTYPES=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D &#39;=
wic.bz2 wic.bmap&#39;&quot;,<br>&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;EXTRA_IMAGE_FEATURES +=3D &#39;allow-empty-password empty-root-pas=
sword allow-root-login&#39;&quot;<br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;EXTRA_IMAGE_FEATURES +=3D &#39;allow-empty-password empty-root-=
password allow-root-login&#39;&quot;,<br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;CORE_IMAGE_EXTRA_INSTALL =3D&#39;hellocargo&#39;&quot;<br>&=
gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ]<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; --<br>&gt; 2.43.0<br=
>&gt;<br>&gt;<br><br>-- <br><div dir=3D"ltr"><font face=3D"Raleway, regular=
">Yoann Congal</font><div><font face=3D"Raleway, regular">Smile ECS</font><=
/div></div><br>

--000000000000cae1160633875da5--

