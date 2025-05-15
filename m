Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C429C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 17:53:46 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.19208.1747331624251849235
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 10:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BjgQyMnR;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ff4faf858cso8493397b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 10:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747331623; x=1747936423; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ENASqj2DCjdB7KK6CV+aK5uo3su/WJt+5RyBbt9QuhQ=;
        b=BjgQyMnRTTEWV+zgu6htG7o4TvLkPklv+lEPcQ1G59YytfklKZh+VdTU3z+CZe1hd5
         PIrJWXiT+M2J2wIkW29O1L8JrdirCoZ8dOmtYy1nvgK8QUUp6tSFADUxswqnTwnuE8dA
         ALD81+PNzHilixEBRiy7ACYurAr1aseWCZETsuXiYF03wAxxavzSbDcaQEs1KT/HTGYc
         hQzcPpQyBkGL1EoiEq0JjWjxH+OxFOLB5gz0WobgvQTlazIBP5eyBkuA7nPmshfIB5Mb
         nLd+HeOob8zWbEux1Dc3kP+wbKkYadbLSTqWCrwOed/UbEg8zfoA9POY13LvyzK7AK5C
         j6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747331623; x=1747936423;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENASqj2DCjdB7KK6CV+aK5uo3su/WJt+5RyBbt9QuhQ=;
        b=dW0HrN/9nlWKGMJbydaP5U73P/cFpuveDSocVD/czJkji5KojCEYUy35PkeKyPdYFz
         0lIgpQPOt8LDxnGxiQ3IXOZKmbrZDy9N1K9KBQwDdD5N/uYRIm2OrGbrS0R7t8jvWogK
         /ias8fx3dkWoCaBHwXCyotBHXbF5N19OJEP7IICBz8nuJyEFbQ/vHbeueQV4K8EQAijL
         AIy6JF5noLyBgqTMRwCuE7JsxqBDfe73tOxF8a58lzdnQQcOhLocgTKmmGrK/c6j8gxr
         UV0RCy/PMIDudo67bHMGtI8amMENYbQsBOggvhy5CVJ/zSUfP8QGIagu/QbyUvevhgDq
         Gy6Q==
X-Gm-Message-State: AOJu0Yxubz/gChJ6jgqqFxF1ei4pMl2WirQRg9PrqtX4VyBv0sMH0lRg
	1jSedFBRPcnz8pYc3MuAJ8xFgzJUkTPqzx1hn4kXuQMs0ZJEVtIabdYL2OeFhZIZ6V4GxqF67jD
	nQSRgoporI6zax8D7shlFpz83txbMWN8=
X-Gm-Gg: ASbGnctzdg8BqpsndsS2LddkezoXjBSRTbYmf8I/ojx/9L0c7LBwLAtyQs2nO5la+gb
	+IhfsqC1AAJ50sSOznW//Iig48h6UzovRYwXLMDIm3YNiaKMGwUx21BDrb7nqVy//AbOdlVXf1L
	SBQhmxq0mwb/1YbFwwkO9VJGXB/3Ikvp43tuEGtk/sEifR
X-Google-Smtp-Source: AGHT+IFgyruuINvNA6v1PPnutWD8LI7LMC1ymqJLm6z4qCn+61uoeJQWzO+rT9PirlGQJkfhfu7uo9ntQtlvomPBtX0=
X-Received: by 2002:a05:690c:670f:b0:6f9:8605:ec98 with SMTP id
 00721157ae682-70ca7b894b0mr9535417b3.28.1747331623283; Thu, 15 May 2025
 10:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <aAKpeGEgdlK3jOdy@gmail.com> <20250429132035.213425-2-michalwsieron@gmail.com>
In-Reply-To: <20250429132035.213425-2-michalwsieron@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 15 May 2025 13:53:30 -0400
X-Gm-Features: AX0GCFv0SPObUjsKwOQhVmrZggJc270jxnBbvbEMjILSF9VUwW1wtixv9XSK6gk
Message-ID: <CADkTA4MxTHydAxAuny2v2eAxM2WTJ1B1zAhishtSqh6PN157wQ@mail.gmail.com>
Subject: Re: [PATCH v2] kernel-module-split: Allow for external conf files
To: Michal Sieron <michalwsieron@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b5f4470635305809"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 17:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216700

--000000000000b5f4470635305809
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 9:21=E2=80=AFAM Michal Sieron <michalwsieron@gmail.=
com>
wrote:

> Some recipes might provide conf files produced during build phase or
> simply tracked in the VCS instead of generating them with Yocto.
> In such cases those conf files wouldn't be assigned to correct packages.
> With this change, if user wants to generate a conf file they still can,
> but not generating them won't prevent assigning the file to proper
> package given the file exists.
>
> Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
> ---
>
> I am quite busy lately so didn't have time to go back to this topic.
>
> This v2 differs from v1 by added comments and post install hook is now
> treated the same way as (CONF)FILES:* variable modification.
>

And sorry for my very slow reply.

This version of the patch was hidden below the original, so I missed it
when it arrived.



>  .../kernel-module-split.bbclass               | 27 +++++++++++++------
>  1 file changed, 19 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-module-split.bbclass
> b/meta/classes-recipe/kernel-module-split.bbclass
> index 9487365eb7..a2d81f18e2 100644
> --- a/meta/classes-recipe/kernel-module-split.bbclass
> +++ b/meta/classes-recipe/kernel-module-split.bbclass
> @@ -99,9 +99,12 @@ python split_kernel_module_packages () {
>              bb.warn("module_autoload_%s was replaced by
> KERNEL_MODULE_AUTOLOAD for cases where basename =3D=3D module name, pleas=
e drop
> it" % basename)
>          if autoload and basename not in autoloadlist:
>              bb.warn("module_autoload_%s is defined but '%s' isn't
> included in KERNEL_MODULE_AUTOLOAD, please add it there" % (basename,
> basename))
> +
> +        # The .conf file can either be installed by a recipe or generate=
d
> from module_autoload_*
> +        conf =3D '%s/%s.conf' % (d.getVar('modulesloaddir'), basename)
> +        name =3D '%s%s' % (dvar, conf)
> +        # If module name is in KERNEL_MODULE_AUTOLOAD, then generate the
> .conf file and write to `name`.
>          if basename in autoloadlist:
> -            conf =3D '%s/%s.conf' % (d.getVar('modulesloaddir'), basenam=
e)
> -            name =3D '%s%s' % (dvar, conf)
>              os.makedirs(os.path.dirname(name), exist_ok=3DTrue)
>              with open(name, 'w') as f:
>                  if autoload:
> @@ -109,6 +112,9 @@ python split_kernel_module_packages () {
>                          f.write('%s\n' % m)
>                  else:
>                      f.write('%s\n' % basename)
> +        # If the .conf file exits, then add it to FILES:* and CONFFILES:=
*
> and add postinstall hook.
>

Minor typo s/exits/exists/



> +        # It doesn't matter if it was generated from module_autoload_* o=
r
> installed by the recipe.
> +        if os.path.exists(name):
>              conf2append =3D ' %s' % conf
>              d.appendVar('FILES:%s' % pkg, conf2append)
>              d.appendVar('CONFFILES:%s' % pkg, conf2append)
> @@ -121,18 +127,23 @@ python split_kernel_module_packages () {
>          # Write out any modconf fragment
>          modconflist =3D (d.getVar("KERNEL_MODULE_PROBECONF") or "").spli=
t()
>          modconf =3D d.getVar('module_conf_%s' % basename)
> +
> +        # The .conf file can either be installed by a recipe or generate=
d
> from module_conf_*
> +        conf =3D '%s/%s.conf' % (d.getVar('modprobedir'), basename)
> +        name =3D '%s%s' % (dvar, conf)
> +        # If module name is in KERNEL_MODULE_PROBECONF, then generate th=
e
> .conf file and write to `name`.
>          if modconf and basename in modconflist:
> -            conf =3D '%s/%s.conf' % (d.getVar('modprobedir'), basename)
> -            name =3D '%s%s' % (dvar, conf)
>              os.makedirs(os.path.dirname(name), exist_ok=3DTrue)
>              with open(name, 'w') as f:
>                  f.write("%s\n" % modconf)
> -            conf2append =3D ' %s' % conf
> -            d.appendVar('FILES:%s' % pkg, conf2append)
> -            d.appendVar('CONFFILES:%s' % pkg, conf2append)
> -
>          elif modconf:
>              bb.error("Please ensure module %s is listed in
> KERNEL_MODULE_PROBECONF since module_conf_%s is set" % (basename, basenam=
e))
> +        # If the .conf file exits, then add it to FILES:* and CONFFILES:=
*.
> +        # It doesn't matter if it was generated from module_conf_* or
> installed by the recipe.
> +        if os.path.exists(name):
> +            conf2append =3D ' %s' % conf
> +            d.appendVar('FILES:%s' % pkg, conf2append)
> +            d.appendVar('CONFFILES:%s' % pkg, conf2append)
>
>
This version looks good to me.

I would still be nice to have a test for this, but the code paths are
sufficiently
similar now that I don't see anything that could break.

Bruce



>          if "description" in vals:
>              old_desc =3D d.getVar('DESCRIPTION:' + pkg) or ""
> --
> 2.49.0
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000b5f4470635305809
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 29, 2025 at 9:21=
=E2=80=AFAM Michal Sieron &lt;<a href=3D"mailto:michalwsieron@gmail.com">mi=
chalwsieron@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Some recipes might provide conf files produced during =
build phase or<br>
simply tracked in the VCS instead of generating them with Yocto.<br>
In such cases those conf files wouldn&#39;t be assigned to correct packages=
.<br>
With this change, if user wants to generate a conf file they still can,<br>
but not generating them won&#39;t prevent assigning the file to proper<br>
package given the file exists.<br>
<br>
Signed-off-by: Michal Sieron &lt;<a href=3D"mailto:michalwsieron@gmail.com"=
 target=3D"_blank">michalwsieron@gmail.com</a>&gt;<br>
---<br>
<br>
I am quite busy lately so didn&#39;t have time to go back to this topic.<br=
>
<br>
This v2 differs from v1 by added comments and post install hook is now<br>
treated the same way as (CONF)FILES:* variable modification.<br></blockquot=
e><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small=
">And sorry for my very slow reply.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">This version of the patch was hidden below the original, so I mi=
ssed it when it arrived.</div><br></div><div><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
=C2=A0.../kernel-module-split.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 27 +++++++++++++------<br>
=C2=A01 file changed, 19 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes=
-recipe/kernel-module-split.bbclass<br>
index 9487365eb7..a2d81f18e2 100644<br>
--- a/meta/classes-recipe/kernel-module-split.bbclass<br>
+++ b/meta/classes-recipe/kernel-module-split.bbclass<br>
@@ -99,9 +99,12 @@ python split_kernel_module_packages () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;module_autolo=
ad_%s was replaced by KERNEL_MODULE_AUTOLOAD for cases where basename =3D=
=3D module name, please drop it&quot; % basename)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if autoload and basename not in autoloadl=
ist:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;module_autolo=
ad_%s is defined but &#39;%s&#39; isn&#39;t included in KERNEL_MODULE_AUTOL=
OAD, please add it there&quot; % (basename, basename))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The .conf file can either be installed by a =
recipe or generated from module_autoload_*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 conf =3D &#39;%s/%s.conf&#39; % (d.getVar(&#39=
;modulesloaddir&#39;), basename)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D &#39;%s%s&#39; % (dvar, conf)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If module name is in KERNEL_MODULE_AUTOLOAD,=
 then generate the .conf file and write to `name`.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if basename in autoloadlist:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conf =3D &#39;%s/%s.conf&#39; % =
(d.getVar(&#39;modulesloaddir&#39;), basename)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D &#39;%s%s&#39; % (dvar,=
 conf)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.makedirs(os.path.dirname=
(name), exist_ok=3DTrue)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(name, &#39;w&#39;=
) as f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if autoload:<=
br>
@@ -109,6 +112,9 @@ python split_kernel_module_packages () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0f.write(&#39;%s\n&#39; % m)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0f.write(&#39;%s\n&#39; % basename)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If the .conf file exits, then add it to FILE=
S:* and CONFFILES:* and add postinstall hook.<br></blockquote><div><br></di=
v><div><div class=3D"gmail_default" style=3D"font-size:small">Minor typo s/=
exits/exists/</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # It doesn&#39;t matter if it was generated fr=
om module_autoload_* or installed by the recipe.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(name):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0conf2append =3D &#39; %s&#3=
9; % conf<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVar(&#39;FILES:%s&#=
39; % pkg, conf2append)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVar(&#39;CONFFILES:=
%s&#39; % pkg, conf2append)<br>
@@ -121,18 +127,23 @@ python split_kernel_module_packages () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Write out any modconf fragment<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0modconflist =3D (d.getVar(&quot;KERNEL_MO=
DULE_PROBECONF&quot;) or &quot;&quot;).split()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0modconf =3D d.getVar(&#39;module_conf_%s&=
#39; % basename)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The .conf file can either be installed by a =
recipe or generated from module_conf_*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 conf =3D &#39;%s/%s.conf&#39; % (d.getVar(&#39=
;modprobedir&#39;), basename)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D &#39;%s%s&#39; % (dvar, conf)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If module name is in KERNEL_MODULE_PROBECONF=
, then generate the .conf file and write to `name`.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if modconf and basename in modconflist:<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conf =3D &#39;%s/%s.conf&#39; % =
(d.getVar(&#39;modprobedir&#39;), basename)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D &#39;%s%s&#39; % (dvar,=
 conf)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.makedirs(os.path.dirname=
(name), exist_ok=3DTrue)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(name, &#39;w&#39;=
) as f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&quot=
;%s\n&quot; % modconf)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conf2append =3D &#39; %s&#39; % =
conf<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;FILES:%s&#39; %=
 pkg, conf2append)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;CONFFILES:%s&#3=
9; % pkg, conf2append)<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif modconf:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.error(&quot;Please ensur=
e module %s is listed in KERNEL_MODULE_PROBECONF since module_conf_%s is se=
t&quot; % (basename, basename))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If the .conf file exits, then add it to FILE=
S:* and CONFFILES:*.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # It doesn&#39;t matter if it was generated fr=
om module_conf_* or installed by the recipe.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(name):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conf2append =3D &#39; %s&#39; % =
conf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;FILES:%s&#39; %=
 pkg, conf2append)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;CONFFILES:%s&#3=
9; % pkg, conf2append)<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">This version looks good to me.</div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">I would still be nice to have a test for this, but t=
he code paths are sufficiently</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">similar now that I don&#39;t see anything that could break.=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &quot;description&quot; in vals:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old_desc =3D d.getVar(&#39;=
DESCRIPTION:&#39; + pkg) or &quot;&quot;<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000b5f4470635305809--

