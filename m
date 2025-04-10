Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBC8C369A6
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 13:42:31 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.34833.1744292541184772104
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 06:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BUTbkD2X;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-af5085f7861so548258a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 06:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744292540; x=1744897340; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BezfWp+8X0h0O//depNbSK9TRswepyamvqIMUP5K4ww=;
        b=BUTbkD2XwaYMe/aQB0J7wTG7JMZez8Bb4/RYN/9sq1RGy2qzx6RTSbL/fJV3UqzZhM
         xaQl1abUQjEhIc0eCkt56QXZe7KpeQ5z0Hr3rvRStW8xZnpHWHo8rdfWyQtHYSyAMUBw
         pTR/DnWq/m4/9a2UJzb9OV6d0o4GGVjOxWu3z2kyYmWOFxwDFgapEy5b/+6Su7N88Giq
         +zY9Wjjyl8HKGC+1z/mViQMcEefMvJJJH25zSl+Gc+7OaDrUJDrXGnr0UxX89x8EaA9O
         60eYhTm812Gg+MjUSxRTmdAXMZrYPIipFfXbzwfKi96hUG1DbL+sMEnzIUEF9b62kIkT
         gz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292540; x=1744897340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BezfWp+8X0h0O//depNbSK9TRswepyamvqIMUP5K4ww=;
        b=THsKCDAkUlMdVEKsCophFXFt/WD1wOMvgi7YpT6naTm06TD882FGPqLg7ENengWLMx
         Ly/Q7FwvLtVk451nSzdQjtlWTvtBPmQ/2PE+FeN/LPyoOiS9rCpHuI9TPIDAMa2gTUWf
         xiIkJcuXhfHE6vDU1MV3Jv7rGu2dHa7PPP13Q1eKA91EqwEzHFxM3/dhd4Qjh8dkYhTh
         nzIuzlKSs33RoGlyQETBMly/gR3pkstuRZG/TNvaP6XJ3hcIWb8OjNtaR+LYjmyrUJ4I
         lCeiZfXa3v2H9KeRbEw2vbA/ElDwmMIM44H19TSsgRhJE/djqzpf9YjFEK1gFU+qkP9V
         teVQ==
X-Gm-Message-State: AOJu0YwbieLn7aPYG0D5XymUTrHpJdolxs1U0o/KuPbn2dKFTT90qusI
	Ih6ox6n8jNfrn4cxssrhOSONOSHEq5yoskt27Ztn49mbanoWUCc4h1Re+bTKo58U7sOf4/LXCTA
	s3H7dy9A23YwoHbzBZILX4tO4CV4jVPs7Nic=
X-Gm-Gg: ASbGncuy1TJ4A968sQnIrWWz9s51JOKiA3iFXo/1VI+AFQaqEdcXy5g/o2spL0zqrgS
	f44Ar2v7qj5psjB4hpF9JEg0zOlIOCcV7RiDRZ4wrHHR5yCFaG+VsCfzDq7SVSWZwVEvIpb8pa6
	ZZotrLbQKqzZ7ENXrsdGePRCQ=
X-Google-Smtp-Source: AGHT+IHlm8jlUpZpQmcELvchu3fp9zl+uQi8qgdq/AQUfbPgB+ax5zazk9soru7WUzQd+D88kKdsBli8OAjU99zQXf4=
X-Received: by 2002:a17:90b:574b:b0:2ee:a583:e616 with SMTP id
 98e67ed59e1d1-30718b70349mr4715898a91.9.1744292540389; Thu, 10 Apr 2025
 06:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250410090446.937536-1-michalwsieron@gmail.com>
In-Reply-To: <20250410090446.937536-1-michalwsieron@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 10 Apr 2025 09:42:07 -0400
X-Gm-Features: ATxdqUG-i3wlMw7KfNcbkuOXyUYrDSAOxKbuATo3TU-Yse1fb_1xGVTehpTWBgM
Message-ID: <CADkTA4O_t=cggrERmZV8L64X9n3iEatdtqj5_NcGYxzcxAPDCw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-module-split: Allow for external conf files
To: michalwsieron@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000411ff706326cc1a3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 13:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214674

--000000000000411ff706326cc1a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 5:04=E2=80=AFAM Michal Sieron via lists.openembedde=
d.org
<michalwsieron=3Dgmail.com@lists.openembedded.org> wrote:

> Some recipes might provide conf files produced during build phase or
> simply tracked in the VCS instead of generating them with Yocto.
> In such cases those conf files wouldn't be assigned to correct packages.
> With this change, if user wants to generate a conf file they still can,
> but not generating them won't prevent assigning the file to proper
> package given the file exists.
>

Whenever we add a different code path, we need to add a test to
the oe selftests, both for the existing case (if there isn't one already)
and the new one. Without those tests, we'll get a better understanding
of how this is supposed to work, that it doesn't break existing users
and we'll know when it breaks in the future (since this obviously won't
be a default path with our reference distros).


> Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
> ---
>  .../kernel-module-split.bbclass               | 25 +++++++++++--------
>  1 file changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-module-split.bbclass
> b/meta/classes-recipe/kernel-module-split.bbclass
> index 9487365eb7..6da3cb7fc7 100644
> --- a/meta/classes-recipe/kernel-module-split.bbclass
> +++ b/meta/classes-recipe/kernel-module-split.bbclass
> @@ -99,9 +99,9 @@ python split_kernel_module_packages () {
>              bb.warn("module_autoload_%s was replaced by
> KERNEL_MODULE_AUTOLOAD for cases where basename =3D=3D module name, pleas=
e drop
> it" % basename)
>          if autoload and basename not in autoloadlist:
>              bb.warn("module_autoload_%s is defined but '%s' isn't
> included in KERNEL_MODULE_AUTOLOAD, please add it there" % (basename,
> basename))
> +        conf =3D '%s/%s.conf' % (d.getVar('modulesloaddir'), basename)
> +        name =3D '%s%s' % (dvar, conf)
>          if basename in autoloadlist:
> -            conf =3D '%s/%s.conf' % (d.getVar('modulesloaddir'), basenam=
e)
> -            name =3D '%s%s' % (dvar, conf)
>

A comment about how your high level description in the long log relates
to needing to move these variables outside of the conditional would be
helpful.


>              os.makedirs(os.path.dirname(name), exist_ok=3DTrue)
>              with open(name, 'w') as f:
>                  if autoload:
> @@ -109,31 +109,34 @@ python split_kernel_module_packages () {
>                          f.write('%s\n' % m)
>                  else:
>                      f.write('%s\n' % basename)
> -            conf2append =3D ' %s' % conf
> -            d.appendVar('FILES:%s' % pkg, conf2append)
> -            d.appendVar('CONFFILES:%s' % pkg, conf2append)
>              postinst =3D d.getVar('pkg_postinst:%s' % pkg)
>              if not postinst:
>                  bb.fatal("pkg_postinst:%s not defined" % pkg)
>              postinst +=3D d.getVar('autoload_postinst_fragment') %
> (autoload or basename)
>              d.setVar('pkg_postinst:%s' % pkg, postinst)
>
> +        if os.path.exists(name):
> +            conf2append =3D ' %s' % conf
> +            d.appendVar('FILES:%s' % pkg, conf2append)
> +            d.appendVar('CONFFILES:%s' % pkg, conf2append)
>

A quick comment here would help as well. This is now outside the
conditional, so a comment indicating that the file at "name" can either
be generated above or placed there by a recipe will help with
maintenance.

I'm thinking that we should also log when a supplied configuration
file is used. Otherwise, it may not be obvious if a runtime issue
is caused.

Also, what happens if the file at "name" is updated ? I don't
think the module splitting would be re-run, so would we have a
"stale" file ? Should that file be something in the kernel-module
recipe that triggers a rebuild if it is changed ? I don't see that
mentioned (maybe I'm imagining the problem) or a requirement
on the recipe.

Bruce


> +
>          # Write out any modconf fragment
>          modconflist =3D (d.getVar("KERNEL_MODULE_PROBECONF") or "").spli=
t()
>          modconf =3D d.getVar('module_conf_%s' % basename)
> +        conf =3D '%s/%s.conf' % (d.getVar('modprobedir'), basename)
> +        name =3D '%s%s' % (dvar, conf)
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
>
> +        if os.path.exists(name):
> +            conf2append =3D ' %s' % conf
> +            d.appendVar('FILES:%s' % pkg, conf2append)
> +            d.appendVar('CONFFILES:%s' % pkg, conf2append)
> +
>          if "description" in vals:
>              old_desc =3D d.getVar('DESCRIPTION:' + pkg) or ""
>              d.setVar('DESCRIPTION:' + pkg, old_desc + "; " +
> vals["description"])
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214633):
> https://lists.openembedded.org/g/openembedded-core/message/214633
> Mute This Topic: https://lists.openembedded.org/mt/112187964/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000411ff706326cc1a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 10, 2025 at 5:04=
=E2=80=AFAM Michal Sieron via <a href=3D"http://lists.openembedded.org">lis=
ts.openembedded.org</a> &lt;michalwsieron=3D<a href=3D"mailto:gmail.com@lis=
ts.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Some recipes might pro=
vide conf files produced during build phase or<br>
simply tracked in the VCS instead of generating them with Yocto.<br>
In such cases those conf files wouldn&#39;t be assigned to correct packages=
.<br>
With this change, if user wants to generate a conf file they still can,<br>
but not generating them won&#39;t prevent assigning the file to proper<br>
package given the file exists.<br></blockquote><div><br></div><div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Whenever we add a different =
code path, we need to add a test to</div><div class=3D"gmail_default" style=
=3D"font-size:small">the oe selftests, both for the existing case (if there=
 isn&#39;t one already)</div><div class=3D"gmail_default" style=3D"font-siz=
e:small">and the new one. Without those tests, we&#39;ll get a better under=
standing</div><div class=3D"gmail_default" style=3D"font-size:small">of how=
 this is supposed to work, that it doesn&#39;t break existing users</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">and we&#39;ll know whe=
n it breaks in the future (since this obviously=C2=A0won&#39;t</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">be a default path with our =
reference distros).</div></div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
Signed-off-by: Michal Sieron &lt;<a href=3D"mailto:michalwsieron@gmail.com"=
 target=3D"_blank">michalwsieron@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../kernel-module-split.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 25 +++++++++++--------<br>
=C2=A01 file changed, 14 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes=
-recipe/kernel-module-split.bbclass<br>
index 9487365eb7..6da3cb7fc7 100644<br>
--- a/meta/classes-recipe/kernel-module-split.bbclass<br>
+++ b/meta/classes-recipe/kernel-module-split.bbclass<br>
@@ -99,9 +99,9 @@ python split_kernel_module_packages () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;module_autolo=
ad_%s was replaced by KERNEL_MODULE_AUTOLOAD for cases where basename =3D=
=3D module name, please drop it&quot; % basename)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if autoload and basename not in autoloadl=
ist:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;module_autolo=
ad_%s is defined but &#39;%s&#39; isn&#39;t included in KERNEL_MODULE_AUTOL=
OAD, please add it there&quot; % (basename, basename))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 conf =3D &#39;%s/%s.conf&#39; % (d.getVar(&#39=
;modulesloaddir&#39;), basename)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D &#39;%s%s&#39; % (dvar, conf)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if basename in autoloadlist:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conf =3D &#39;%s/%s.conf&#39; % =
(d.getVar(&#39;modulesloaddir&#39;), basename)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D &#39;%s%s&#39; % (dvar,=
 conf)<br></blockquote><div><br></div><div><div class=3D"gmail_default" sty=
le=3D"font-size:small">A comment about how your high level description in t=
he long log relates</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">to needing to move these variables outside of the conditional would be=
</div><div class=3D"gmail_default" style=3D"font-size:small">helpful.</div>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.makedirs(os.path.dirname=
(name), exist_ok=3DTrue)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(name, &#39;w&#39;=
) as f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if autoload:<=
br>
@@ -109,31 +109,34 @@ python split_kernel_module_packages () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0f.write(&#39;%s\n&#39; % m)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0f.write(&#39;%s\n&#39; % basename)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conf2append =3D &#39; %s&#39; % =
conf<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;FILES:%s&#39; %=
 pkg, conf2append)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;CONFFILES:%s&#3=
9; % pkg, conf2append)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0postinst =3D d.getVar(&#39;=
pkg_postinst:%s&#39; % pkg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not postinst:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.fatal(&quo=
t;pkg_postinst:%s not defined&quot; % pkg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0postinst +=3D d.getVar(&#39=
;autoload_postinst_fragment&#39;) % (autoload or basename)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;pkg_postinst:=
%s&#39; % pkg, postinst)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(name):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conf2append =3D &#39; %s&#39; % =
conf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;FILES:%s&#39; %=
 pkg, conf2append)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;CONFFILES:%s&#3=
9; % pkg, conf2append)<br></blockquote><div><br></div><div><div class=3D"gm=
ail_default" style=3D"font-size:small">A quick comment here would help as w=
ell. This is now outside the</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">conditional, so a comment indicating that the file at &quot;n=
ame&quot; can either</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">be generated above or placed there by a recipe will help with</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">maintenance.</div><br>=
</div><div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;m t=
hinking that we should also log when a supplied configuration</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">file is used. Otherwise, it =
may not be obvious if a runtime issue</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">is caused.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Also, what happens if the file at &quot;name&quot; is updated ? =
I don&#39;t=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">think the module splitting would be re-run, so would we have a</div></di=
v><div class=3D"gmail_default" style=3D"font-size:small">&quot;stale&quot; =
file ? Should that file be something in the kernel-module</div><div class=
=3D"gmail_default" style=3D"font-size:small">recipe that triggers a rebuild=
 if it is changed ? I don&#39;t see that</div><div class=3D"gmail_default" =
style=3D"font-size:small">mentioned (maybe I&#39;m imagining the problem) o=
r a requirement</div><div class=3D"gmail_default" style=3D"font-size:small"=
>on the recipe.</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Write out any modconf fragment<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0modconflist =3D (d.getVar(&quot;KERNEL_MO=
DULE_PROBECONF&quot;) or &quot;&quot;).split()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0modconf =3D d.getVar(&#39;module_conf_%s&=
#39; % basename)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 conf =3D &#39;%s/%s.conf&#39; % (d.getVar(&#39=
;modprobedir&#39;), basename)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D &#39;%s%s&#39; % (dvar, conf)<br>
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
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(name):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conf2append =3D &#39; %s&#39; % =
conf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;FILES:%s&#39; %=
 pkg, conf2append)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;CONFFILES:%s&#3=
9; % pkg, conf2append)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &quot;description&quot; in vals:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old_desc =3D d.getVar(&#39;=
DESCRIPTION:&#39; + pkg) or &quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;DESCRIPTION:&=
#39; + pkg, old_desc + &quot;; &quot; + vals[&quot;description&quot;])<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#214633): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/214633" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/214633</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112187964/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112187964/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000411ff706326cc1a3--

