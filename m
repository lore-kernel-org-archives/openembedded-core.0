Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CB0C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 21:21:49 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.71193.1749504108180302603
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 14:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pdnRLTIs;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a361b8a664so3970231f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 14:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1749504106; x=1750108906; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A4ApzxA4nwR5Xz869Hi/LbcYKqyRzK2RGdoQDx+xQdc=;
        b=pdnRLTIseCvpnc5gRvLrDTf3QcKORdp83sMchEE4jhty0KvHt0yuDQ5D44mVq5wyzN
         ocH5kshWyAjaIAkhn/XxSsO9fzD13OUXrFr0sLNkW4A21Pr8Zvyg/gopNuLoiE+6zKDe
         Cb/oetWfBZc+azc6eITWIQztrnn+ag6FjXLp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749504106; x=1750108906;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A4ApzxA4nwR5Xz869Hi/LbcYKqyRzK2RGdoQDx+xQdc=;
        b=vDjaeJH8T4zvSCuq80Uuy8plyYFziCin4f7TAgWG5tMeHzSCAfmL/YJ3KiMefMLppM
         28C3C7muTW1oAQEhJmQsnaiKdPGS27b7JSYXEtI8c9byvhE6U3qjZ0MIAMEYI2FGaoP8
         KU1ANMIwf2zNqh5T+KucLrpB5jr+68tI4MBYMSBKgEc0i+cEvsYfEymEvlLD5Seu3Vai
         quEzYu49/oxnkQW2yLWAYAX/JXs1AIXeR91+4Oc6ds56Qxc805Qbsws9VhpHdakznD+T
         9OdqFXCzvQuRuclJYDhFqa2ETYj96e2MyrrV3VZ+0ri8g23koSLn6YTMd9RRvskkB7uS
         WxGQ==
X-Gm-Message-State: AOJu0YwFQO5u+eN29q5Q3q77pNT3J/rjN5FoG+bRajYJK/lULV/whj2P
	aVrs7jIMb6Absn/bxHp9FNBNnrcvoNPYRRl1bNprPbJDmtz2DjwUtcPESR5Lve3u9ImEVPCV8fy
	KHJblT9NaBNfpGuT0Wt6I5GLOYf7myin4FyWdp+RMcE7ZA1bhN8DVou9QkQ==
X-Gm-Gg: ASbGnctb6MeHYZcu6aP9VRdteXli2BjQXZtj8Yl3WdPBE1VGZ+AbhOS0L4+aWiY7DSk
	VT90FTuvz0YWokbFEuA2QL5NeMAvGAdfItfiNsl4udh8/Sk6DTDtce7HhiBPKND+pTK894HcSWq
	rciyzz0OCZA2o+wvoz9HOC815SVFTNpeaEpfMZ5iLU3pqpQxO+E+s+tndS5KKQZZqLXDQVMYadk
	qknww==
X-Google-Smtp-Source: AGHT+IEXOCXzwDo1NMBUHsHICGB8OubZMTV4/ktYwVmKp9MdJQx86gdfPeUV9uV3+TePO0uombcdfdpYxPz2Te+dsZU=
X-Received: by 2002:a05:6000:22ca:b0:3a3:65b5:51d7 with SMTP id
 ffacd0b85a97d-3a55227b6a6mr149114f8f.26.1749504105868; Mon, 09 Jun 2025
 14:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250609152757.1153027-1-yoann.congal@smile.fr>
In-Reply-To: <20250609152757.1153027-1-yoann.congal@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 9 Jun 2025 23:21:19 +0200
X-Gm-Features: AX0GCFuKlBFbaunV9DMruBKlavpvqEFoo4ciI72wq05zV47YxxhrDqGtoZ5zH9s
Message-ID: <CAMSfU+771Oi98uMhJgY5VGgFTkygbF+nW=ymKn7-_Zn7aapJqA@mail.gmail.com>
Subject: Re: [PATCH v2] reproducible: allow each layer to define its known
 non-repro packages
To: openembedded-core@lists.openembedded.org
Cc: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Content-Type: multipart/alternative; boundary="000000000000c382d706372a2a41"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 21:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218306

--000000000000c382d706372a2a41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 9 juin 2025 =C3=A0 17:28, Yoann Congal <yoann.congal@smile.fr> a =
=C3=A9crit :

> From: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
>
> With this change, layers can use a conf/include/known_non_repro.inc file
> to extend the OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES variable with their own
> known
> non-reproducible packages to make them automatically excluded from the
> reproducible test.
>
> Example of usage, in conf/include/known_non_repro.inc:
>   OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES +=3D " \
>         this-package-is-not-reproducible \
>   "
>
> This uses the new "include_all" in the reproducible test and will move
> the maintenance burden from AB config[0] to the layers themselves.
>
> Fixes [YOCTO #15699]
>
> [0]:
> https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n3=
43
>
> Co-Developed-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
> ---
>

Oops, forgot the patch changelog:
v1->v2: Changed to OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES variable and removed
the now useless code.


>  meta/lib/oeqa/selftest/cases/reproducible.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py
> b/meta/lib/oeqa/selftest/cases/reproducible.py
> index f06027cb03..94d3db3677 100644
> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> @@ -14,6 +14,7 @@ import shutil
>  import stat
>  import os
>  import datetime
> +import oeqa.utils.ftools as ftools
>
>  exclude_packages =3D [
>         ]
> @@ -158,6 +159,13 @@ class ReproducibleTests(OESelftestTestCase):
>      # reproducible, disable this in your derived test class
>      build_from_sstate =3D True
>
> +    @classmethod
> +    def setUpClass(cls):
> +        super().setUpClass()
> +        # include layer exclusion files (populate
> OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES)
> +        ftools.append_file(os.path.join(cls.builddir, "conf/local.conf")=
,
> \
> +             "\ninclude_all conf/include/known_non_repro.inc\n")
> +
>      def setUpLocal(self):
>          super().setUpLocal()
>          needed_vars =3D [
>


--=20
Yoann Congal
Smile ECS

--000000000000c382d706372a2a41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 9 =
juin 2025 =C3=A0=C2=A017:28, Yoann Congal &lt;<a href=3D"mailto:yoann.conga=
l@smile.fr">yoann.congal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">From: Guillaume Swaenepoel &l=
t;<a href=3D"mailto:guillaume.swaenepoel@smile.fr" target=3D"_blank">guilla=
ume.swaenepoel@smile.fr</a>&gt;<br>
<br>
With this change, layers can use a conf/include/known_non_repro.inc file<br=
>
to extend the OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES variable with their own k=
nown<br>
non-reproducible packages to make them automatically excluded from the<br>
reproducible test.<br>
<br>
Example of usage, in conf/include/known_non_repro.inc:<br>
=C2=A0 OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 this-package-is-not-reproducible \<br>
=C2=A0 &quot;<br>
<br>
This uses the new &quot;include_all&quot; in the reproducible test and will=
 move<br>
the maintenance burden from AB config[0] to the layers themselves.<br>
<br>
Fixes [YOCTO #15699]<br>
<br>
[0]: <a href=3D"https://git.yoctoproject.org/yocto-autobuilder-helper/tree/=
config.json#n343" rel=3D"noreferrer" target=3D"_blank">https://git.yoctopro=
ject.org/yocto-autobuilder-helper/tree/config.json#n343</a><br>
<br>
Co-Developed-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" =
target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" ta=
rget=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
Signed-off-by: Guillaume Swaenepoel &lt;<a href=3D"mailto:guillaume.swaenep=
oel@smile.fr" target=3D"_blank">guillaume.swaenepoel@smile.fr</a>&gt;<br>
---<br></blockquote><div><br></div><div>Oops, forgot the patch changelog:</=
div><div>v1-&gt;v2: Changed to=C2=A0OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES var=
iable and removed the now useless code.</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
=C2=A0meta/lib/oeqa/selftest/cases/reproducible.py | 8 ++++++++<br>
=C2=A01 file changed, 8 insertions(+)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/s=
elftest/cases/reproducible.py<br>
index f06027cb03..94d3db3677 100644<br>
--- a/meta/lib/oeqa/selftest/cases/reproducible.py<br>
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py<br>
@@ -14,6 +14,7 @@ import shutil<br>
=C2=A0import stat<br>
=C2=A0import os<br>
=C2=A0import datetime<br>
+import oeqa.utils.ftools as ftools<br>
<br>
=C2=A0exclude_packages =3D [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
@@ -158,6 +159,13 @@ class ReproducibleTests(OESelftestTestCase):<br>
=C2=A0 =C2=A0 =C2=A0# reproducible, disable this in your derived test class=
<br>
=C2=A0 =C2=A0 =C2=A0build_from_sstate =3D True<br>
<br>
+=C2=A0 =C2=A0 @classmethod<br>
+=C2=A0 =C2=A0 def setUpClass(cls):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().setUpClass()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # include layer exclusion files (populate OEQA=
_REPRODUCIBLE_EXCLUDED_PACKAGES)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ftools.append_file(os.path.join(cls.builddir, =
&quot;conf/local.conf&quot;), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\ninclude_all conf/i=
nclude/known_non_repro.inc\n&quot;)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0def setUpLocal(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super().setUpLocal()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0needed_vars =3D [<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000c382d706372a2a41--

