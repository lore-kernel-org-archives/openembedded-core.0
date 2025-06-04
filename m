Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B847C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 07:53:38 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.10773.1749023615078410801
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 00:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=unMFLo8k;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so453950f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 00:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1749023613; x=1749628413; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K453nWsygFwdXfWKbb1FP9X1abyxrCrIIu504xWRdEc=;
        b=unMFLo8kENpb7ZkkKSdrNKKpoPcd61KkHps/QXRxN3XHYtGvZZ7MiIVNUKkRiHwG99
         nS9YWBWKrLhLhmuXklQTjTaG16E/C4ipaVWcu/c0nzcEswX6RU41UwN7HiIsxihEn996
         POlQsZfzIfYy4QeqKhb0r9ANur+UA4XwN2EgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023613; x=1749628413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K453nWsygFwdXfWKbb1FP9X1abyxrCrIIu504xWRdEc=;
        b=WvRrbsqvSEfQ3xi4nYmI1qzdszZsTlaxq02W5L9EG+HFXpppCt39iAxWAZ0ikuHXAt
         SWNT8fDw8oPox7Y1LCQH4Vq9FON9FjW/OsFiS+J1wpCKSZqwbOSVHGVih1zPXmNewdLZ
         gOtx9cy79mumfwIXGkU31Z3GYhLmcAPZZOXcimySrah9Z8Kg8y32fFTBYsfzRF01Qt2a
         r+I96FercPf8GbammgXm9Y0MXc9K0CK5TB3wxWwUaMPoSwTHfHt46wVSGCl2Z8pfqdh2
         2FEqOGngdxEBPrbaWjrfRw80PMaX4EZe43dRMT9TS5+XGkRm0rF3XnCL+XBxr4CyXmY6
         R3Ww==
X-Gm-Message-State: AOJu0Yx3JJVM6mTG1nvnjzAoRUo/74lA08Jkcx8ST6pm3HwkQ0RqMz9y
	InRmRe7iZ0fHgh9AeYlphEZuu0Wvy79/zsDcmSUqq8BFwYptqlPPG437xvrkOxYfyqHeIDcf4D+
	M2GUQKzJ173E6m0SN4hrypjiFeMyYwMm75pv6bQNksuWSW0Sww3cOqWNyWQ==
X-Gm-Gg: ASbGncvww/sjE9Gw2qYSk1doXPFvlKXCrp4PWj5oMFU3FXMWBuup/VcGw+ipMjeG0kk
	IlTkMPCdik0NaFEWi/R9sr6VwXKAQkjYXz7ua9uLgqL5SsPIWhCuW6olY9ZcXEBpUudiF24Mmhu
	lxAtMgXjLA1pr10w+4D2yNIyQWw66xb37sPlRzG5pWQm/L0eIAz6ZOYXvgPZ8hf0Pk1qc=
X-Google-Smtp-Source: AGHT+IG6iFrfaIAu6DeX1T/tatF7e0rhsfhiIcnQ/ArU2nvAq3puVecHl5H56VOxvzbHYlwk7ggQOsJIwrR2wz3QSTw=
X-Received: by 2002:a05:6000:188f:b0:3a3:598f:5a97 with SMTP id
 ffacd0b85a97d-3a51417b05bmr3976840f8f.9.1749023612760; Wed, 04 Jun 2025
 00:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250603215916.2429422-1-yoann.congal@smile.fr>
In-Reply-To: <20250603215916.2429422-1-yoann.congal@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 4 Jun 2025 09:53:06 +0200
X-Gm-Features: AX0GCFvk5-yrSYHQI8Z8iGHOeq4eOB-zX49O2pk-ZzkfE8e8-2P5IMWP4FTneT8
Message-ID: <CAMSfU+7s_ayA0Mxfj_BAbJMmEH=9SyQHzR=xk7ywXvLcoy8ygg@mail.gmail.com>
Subject: Re: [PATCH] reproducible: allow each layer to define its known
 non-repro packages
To: openembedded-core@lists.openembedded.org
Cc: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Content-Type: multipart/alternative; boundary="000000000000248e0d0636ba4b50"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 07:53:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217844

--000000000000248e0d0636ba4b50
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 4 juin 2025 =C3=A0 00:02, Yoann Congal <yoann.congal@smile.fr> a =
=C3=A9crit :

> From: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
>
> With this change, layers can use a conf/include/known_non_repro.inc file
> to extend the KNOWN_NON_REPRO_PACKAGES_LIST variable with its own known
> non-reproducible packages to make them automatically excluded from the
> reproducible test.
>
> Example of usage, in conf/include/known_non_repro.inc:
>   KNOWN_NON_REPRO_PACKAGES_LIST +=3D " \
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

I sent the meta-oe application/example as RFC in
[RFC PATCH] reproducibility: move known non-repro list to the new common
file
https://lists.openembedded.org/g/openembedded-devel/message/117731


>  meta/lib/oeqa/selftest/cases/reproducible.py | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py
> b/meta/lib/oeqa/selftest/cases/reproducible.py
> index f06027cb03..e2c3a10f06 100644
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
> @@ -158,6 +159,12 @@ class ReproducibleTests(OESelftestTestCase):
>      # reproducible, disable this in your derived test class
>      build_from_sstate =3D True
>
> +    @classmethod
> +    def setUpClass(cls):
> +        super().setUpClass()
> +        ftools.append_file(os.path.join(cls.builddir, "conf/local.conf")=
,
> \
> +             "\ninclude_all conf/include/known_non_repro.inc\n")
> +
>      def setUpLocal(self):
>          super().setUpLocal()
>          needed_vars =3D [
> @@ -170,6 +177,7 @@ class ReproducibleTests(OESelftestTestCase):
>              'OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS',
>              'OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES',
>              'OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS',
> +            'KNOWN_NON_REPRO_PACKAGES_LIST',
>          ]
>          bb_vars =3D get_bb_vars(needed_vars)
>          for v in needed_vars:
> @@ -189,6 +197,10 @@ class ReproducibleTests(OESelftestTestCase):
>              for leaf_recipe in
> bb_vars['OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS'].split():
>                  self.sstate_targets.extend(get_bb_var('DEPENDS',
> leaf_recipe).split())
>
> +        # Apply exclusion from layers (conf/include/known_non_repro.inc
> files)
> +        if bb_vars['KNOWN_NON_REPRO_PACKAGES_LIST']:
> +            self.oeqa_reproducible_excluded_packages =3D
> (self.oeqa_reproducible_excluded_packages or "") +
> bb_vars['KNOWN_NON_REPRO_PACKAGES_LIST']
> +
>          self.extraresults =3D {}
>          self.extraresults.setdefault('reproducible',
> {}).setdefault('files', {})
>
>

--=20
Yoann Congal
Smile ECS

--000000000000248e0d0636ba4b50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 4 =
juin 2025 =C3=A0=C2=A000:02, Yoann Congal &lt;<a href=3D"mailto:yoann.conga=
l@smile.fr">yoann.congal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">From: Guillaume Swaenepoel &l=
t;<a href=3D"mailto:guillaume.swaenepoel@smile.fr" target=3D"_blank">guilla=
ume.swaenepoel@smile.fr</a>&gt;<br>
<br>
With this change, layers can use a conf/include/known_non_repro.inc file<br=
>
to extend the KNOWN_NON_REPRO_PACKAGES_LIST variable with its own known<br>
non-reproducible packages to make them automatically excluded from the<br>
reproducible test.<br>
<br>
Example of usage, in conf/include/known_non_repro.inc:<br>
=C2=A0 KNOWN_NON_REPRO_PACKAGES_LIST +=3D &quot; \<br>
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
---<br></blockquote><div><br></div><div>I sent the meta-oe application/exam=
ple as RFC in</div><div>[RFC PATCH] reproducibility: move known non-repro l=
ist to the new common file<br><a href=3D"https://lists.openembedded.org/g/o=
penembedded-devel/message/117731">https://lists.openembedded.org/g/openembe=
dded-devel/message/117731</a></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
=C2=A0meta/lib/oeqa/selftest/cases/reproducible.py | 12 ++++++++++++<br>
=C2=A01 file changed, 12 insertions(+)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/s=
elftest/cases/reproducible.py<br>
index f06027cb03..e2c3a10f06 100644<br>
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
@@ -158,6 +159,12 @@ class ReproducibleTests(OESelftestTestCase):<br>
=C2=A0 =C2=A0 =C2=A0# reproducible, disable this in your derived test class=
<br>
=C2=A0 =C2=A0 =C2=A0build_from_sstate =3D True<br>
<br>
+=C2=A0 =C2=A0 @classmethod<br>
+=C2=A0 =C2=A0 def setUpClass(cls):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super().setUpClass()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ftools.append_file(os.path.join(cls.builddir, =
&quot;conf/local.conf&quot;), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\ninclude_all conf/i=
nclude/known_non_repro.inc\n&quot;)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0def setUpLocal(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super().setUpLocal()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0needed_vars =3D [<br>
@@ -170,6 +177,7 @@ class ReproducibleTests(OESelftestTestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;OEQA_REPRODUCIBLE_TEST=
_SSTATE_TARGETS&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;OEQA_REPRODUCIBLE_EXCL=
UDED_PACKAGES&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;OEQA_REPRODUCIBLE_TEST=
_LEAF_TARGETS&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;KNOWN_NON_REPRO_PACKAGES_LI=
ST&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb_vars =3D get_bb_vars(needed_vars)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for v in needed_vars:<br>
@@ -189,6 +197,10 @@ class ReproducibleTests(OESelftestTestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for leaf_recipe in bb_vars[=
&#39;OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS&#39;].split():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.sstate_t=
argets.extend(get_bb_var(&#39;DEPENDS&#39;, leaf_recipe).split())<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Apply exclusion from layers (conf/include/kn=
own_non_repro.inc files)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb_vars[&#39;KNOWN_NON_REPRO_PACKAGES_LIST&=
#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.oeqa_reproducible_excluded_=
packages =3D (self.oeqa_reproducible_excluded_packages or &quot;&quot;) + b=
b_vars[&#39;KNOWN_NON_REPRO_PACKAGES_LIST&#39;]<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.extraresults =3D {}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.extraresults.setdefault(&#39;reprodu=
cible&#39;, {}).setdefault(&#39;files&#39;, {})<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000248e0d0636ba4b50--

