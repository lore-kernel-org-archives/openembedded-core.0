Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 985CBC02196
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 21:49:30 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.25313.1738792159489956657
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 13:49:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Pn+9rZ1i;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so95421f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 13:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1738792158; x=1739396958; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KNCEB57m3O9C2QHj1r0EPDsnRkyS9S014LuFPOIveXE=;
        b=Pn+9rZ1ijSe14h6QJuvU7ll5DxS25EUfrawcOolFGMCINJZisuj7+tjL2I/NuA7quu
         f20En9G/jTNyIqu3kKpgn2hLHOhZK0L6VubpBfUVLTZpcGVEuVlqIPpZ5gcbWFgyEjkQ
         z/3OGpfu+JPWEYY6133qln530CZN4qEaWk+Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738792158; x=1739396958;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNCEB57m3O9C2QHj1r0EPDsnRkyS9S014LuFPOIveXE=;
        b=XgmrrbXq+92LluI8XxI9IxBlifswbkgTi5jqn8YBZUcZB82bdSTCE9SExXrmLkIklJ
         /Xy9sSFfFi4NCXTfs7u8v6ceBtOrRr1Cp9gmQniI/KCf2Kt4w6FGh93nNll9/NV8MhU8
         qLDhYv7U6Xfish+WlL3H/inJ8tbi4LL/RxlJk4QDLm6zIhj78BXtUtsTAl/UKuLmcnpM
         pRWMt2lzwqiGOxDZf+OM/cdbVudjiJ+o6twCRdF3c34zrlm9pt+qRJnhnXo+uHnhbMo8
         rafEb7m2S2tnyxf5VccFGB6t5wv/bRz2y9wZ2RjStnkWzeUh50GogyQyQUgLCTgPiz4W
         DsbA==
X-Gm-Message-State: AOJu0Yyv3IqOET6PHYq8z3muDF80c9APkMLznte/wQcBXluB0uKLwqLv
	LHV1TXDnelXOH+NAfJG9E1sTQmn5uWdlJ63ZF/00DZn9JWjIgVxY/P9IrpfyeEE5iAh0XgPnc/M
	HhWrs7mH4AWIeu4q+QOxMF5Z/7AIrdnVlkJJx8w==
X-Gm-Gg: ASbGncvqdO4FSjS+/v1XRD8QZiByEcO6vCjrZ34eB7Xv8T3RsFE1TY7+9HjZjxeIxv1
	fsFyxQ4ZdgJtg81NcIC6c5/9FyCY1nOqmH21t3r3EOzv7e09UjbnRAFGA+i82apc6PlYCCzu7zQ
	sHcrlWd6skm58LPwRqPXTGopPuioALaA==
X-Google-Smtp-Source: AGHT+IGuCNITf5vcVWdPCP73b49V1Wi6Zz0exjKr+n42Zdk6sPyRtNuAn0Nj8b48DpbS5f3fbJBsAm1tgyv2IIz1pvo=
X-Received: by 2002:a05:6000:186f:b0:38d:b8d0:a1af with SMTP id
 ffacd0b85a97d-38db8d0a227mr2505613f8f.40.1738792157836; Wed, 05 Feb 2025
 13:49:17 -0800 (PST)
MIME-Version: 1.0
References: <20250205181015.3064866-1-tom.hochstein@oss.nxp.com>
In-Reply-To: <20250205181015.3064866-1-tom.hochstein@oss.nxp.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 5 Feb 2025 22:48:51 +0100
X-Gm-Features: AWEUYZnXoHwDpo5thU1rHws4yLwAHHLpMkeDuDlbpl0EfRwPdUZPRFzxxuV-ye8
Message-ID: <CAMSfU+4gY0BbXqfdV1Z62JGeesbu2MS5cb+Ect48emZAWcQjfw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] uboot-config: Fix devtool modify
To: tom.hochstein@oss.nxp.com
Cc: openembedded-core@lists.openembedded.org, 
	Marcus Flyckt <marcus.flyckt@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e8124f062d6c185c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 21:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210878

--000000000000e8124f062d6c185c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 5 f=C3=A9vr. 2025 =C3=A0 19:10, Tom Hochstein via lists.openembedde=
d.org
<tom.hochstein=3Doss.nxp.com@lists.openembedded.org> a =C3=A9crit :

> Fix a problem with `devtool modify` as suggested by Marcus Flyckt on
> the mailing list:
> ```
>     I encountered an issue with `do_config` when using `devtool modify`
>     on `u-boot-imx`.
>
>     ```
>     [...]
>     | cp: cannot stat
> '[...]/u-boot-imx/2024.04/build/imx8mp_wl400s_defconfig/.config': No such
> file or directory
>     | WARNING: exit code 1 from a shell command.
>     ERROR: Task
> ([...]/sources/poky/../meta-freescale/recipes-bsp/u-boot/u-boot-imx_2024.=
04.bb:do_configure)
> failed with exit code '1'
>     NOTE: Tasks Summary: Attempted 963 tasks of which 962 didn't need to
> be rerun and 1 failed.
>     Summary: 1 task failed:
>
> [...]/sources/poky/../meta-freescale/recipes-bsp/u-boot/u-boot-imx_2024.0=
4.bb:
> do_configure
>     Summary: There was 1 ERROR message, returning a non-zero exit code
>     ```
>
>     The issue seems to originate from the following lines in
>     `workspace/appends/u-boot-imx_2024.04.bbappend`:
>
>     ```
>     do_configure:append() {
>         if [
> ${@oe.types.boolean(d.getVar("KCONFIG_CONFIG_ENABLE_MENUCONFIG"))} =3D Tr=
ue
> ]; then
>             cp ${KCONFIG_CONFIG_ROOTDIR}/.config ${S}/.config.baseline
>             ln -sfT ${KCONFIG_CONFIG_ROOTDIR}/.config ${S}/.config.new
>         fi
>     }
>     ```
>
>     For some reason `KCONFIG_CONFIG_ROOTDIR` does not point to the
>     correct directory. It gets its value in `uboot-config.bbclass`:
>
>     ```
>     if len(ubootconfig) =3D=3D 1:
>                     d.setVar('KCONFIG_CONFIG_ROOTDIR',
> os.path.join(d.getVar("B"), d.getVar("UBOOT_MACHINE").strip()))
>     ```
>
>     So the main issue is that B gets expanded in this expression, and
>     then later B gets changed by `externalsrc.bbclass`.
>     `d.getVar("B", False)` does not solve the issue, however the
>     proposed change does.
> ```
> - https://lists.yoctoproject.org/g/yocto/topic/109254298#msg64152]
>
> Suggested-by: Marcus Flyckt <marcus.flyckt@gmail.com>
> Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
>

It looks like this patch fixes this bug :
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15603
Can you confirm please?
If that is the case, can you add [YOCTO #15603] to your commit message?

Thanks!


> ---
>  meta/classes-recipe/uboot-config.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/uboot-config.bbclass
> b/meta/classes-recipe/uboot-config.bbclass
> index bf21961977..74992182c3 100644
> --- a/meta/classes-recipe/uboot-config.bbclass
> +++ b/meta/classes-recipe/uboot-config.bbclass
> @@ -144,7 +144,7 @@ python () {
>              # Ensure the uboot specific menuconfig settings do not leak
> into other recipes
>              if 'u-boot' in recipename:
>                  if len(ubootconfig) =3D=3D 1:
> -                    d.setVar('KCONFIG_CONFIG_ROOTDIR',
> os.path.join(d.getVar("B"), d.getVar("UBOOT_MACHINE").strip()))
> +                    d.setVar('KCONFIG_CONFIG_ROOTDIR',
> os.path.join("${B}", d.getVar("UBOOT_MACHINE").strip()))
>                  else:
>                      # Disable menuconfig for multiple configs
>                      d.setVar('KCONFIG_CONFIG_ENABLE_MENUCONFIG', "false"=
)
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210872):
> https://lists.openembedded.org/g/openembedded-core/message/210872
> Mute This Topic: https://lists.openembedded.org/mt/111017553/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000e8124f062d6c185c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 5 =
f=C3=A9vr. 2025 =C3=A0=C2=A019:10, Tom Hochstein via <a href=3D"http://list=
s.openembedded.org">lists.openembedded.org</a> &lt;tom.hochstein=3D<a href=
=3D"mailto:oss.nxp.com@lists.openembedded.org">oss.nxp.com@lists.openembedd=
ed.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Fix a problem with `devtool modify` as suggested by Marc=
us Flyckt on<br>
the mailing list:<br>
```<br>
=C2=A0 =C2=A0 I encountered an issue with `do_config` when using `devtool m=
odify`<br>
=C2=A0 =C2=A0 on `u-boot-imx`.<br>
<br>
=C2=A0 =C2=A0 ```<br>
=C2=A0 =C2=A0 [...]<br>
=C2=A0 =C2=A0 | cp: cannot stat &#39;[...]/u-boot-imx/2024.04/build/imx8mp_=
wl400s_defconfig/.config&#39;: No such file or directory<br>
=C2=A0 =C2=A0 | WARNING: exit code 1 from a shell command.<br>
=C2=A0 =C2=A0 ERROR: Task ([...]/sources/poky/../meta-freescale/recipes-bsp=
/u-boot/u-boot-imx_2024.04.bb:do_configure) failed with exit code &#39;1&#3=
9;<br>
=C2=A0 =C2=A0 NOTE: Tasks Summary: Attempted 963 tasks of which 962 didn&#3=
9;t need to be rerun and 1 failed.<br>
=C2=A0 =C2=A0 Summary: 1 task failed:<br>
=C2=A0 =C2=A0 =C2=A0 [...]/sources/poky/../meta-freescale/recipes-bsp/u-boo=
t/u-boot-imx_2024.04.bb:do_configure<br>
=C2=A0 =C2=A0 Summary: There was 1 ERROR message, returning a non-zero exit=
 code<br>
=C2=A0 =C2=A0 ```<br>
<br>
=C2=A0 =C2=A0 The issue seems to originate from the following lines in<br>
=C2=A0 =C2=A0 `workspace/appends/u-boot-imx_2024.04.bbappend`:<br>
<br>
=C2=A0 =C2=A0 ```<br>
=C2=A0 =C2=A0 do_configure:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ${@oe.types.boolean(d.getVar(&quot;KCONFIG=
_CONFIG_ENABLE_MENUCONFIG&quot;))} =3D True ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${KCONFIG_CONFIG_ROOTDIR}/.con=
fig ${S}/.config.baseline<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sfT ${KCONFIG_CONFIG_ROOTDIR}=
/.config ${S}/.config.new<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 ```<br>
<br>
=C2=A0 =C2=A0 For some reason `KCONFIG_CONFIG_ROOTDIR` does not point to th=
e<br>
=C2=A0 =C2=A0 correct directory. It gets its value in `uboot-config.bbclass=
`:<br>
<br>
=C2=A0 =C2=A0 ```<br>
=C2=A0 =C2=A0 if len(ubootconfig) =3D=3D 1:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.set=
Var(&#39;KCONFIG_CONFIG_ROOTDIR&#39;, os.path.join(d.getVar(&quot;B&quot;),=
 d.getVar(&quot;UBOOT_MACHINE&quot;).strip()))<br>
=C2=A0 =C2=A0 ```<br>
<br>
=C2=A0 =C2=A0 So the main issue is that B gets expanded in this expression,=
 and<br>
=C2=A0 =C2=A0 then later B gets changed by `externalsrc.bbclass`.<br>
=C2=A0 =C2=A0 `d.getVar(&quot;B&quot;, False)` does not solve the issue, ho=
wever the<br>
=C2=A0 =C2=A0 proposed change does.<br>
```<br>
- <a href=3D"https://lists.yoctoproject.org/g/yocto/topic/109254298#msg6415=
2" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/yo=
cto/topic/109254298#msg64152</a>]<br>
<br>
Suggested-by: Marcus Flyckt &lt;<a href=3D"mailto:marcus.flyckt@gmail.com" =
target=3D"_blank">marcus.flyckt@gmail.com</a>&gt;<br>
Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@oss.nxp.co=
m" target=3D"_blank">tom.hochstein@oss.nxp.com</a>&gt;<br></blockquote><div=
><br></div><div>It looks like this patch fixes this bug : <a href=3D"https:=
//bugzilla.yoctoproject.org/show_bug.cgi?id=3D15603">https://bugzilla.yocto=
project.org/show_bug.cgi?id=3D15603</a></div><div>Can you confirm please?</=
div><div>If that is the case, can you add [YOCTO #15603] to your commit mes=
sage?</div><div><br></div><div>Thanks!<br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0meta/classes-recipe/uboot-config.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe=
/uboot-config.bbclass<br>
index bf21961977..74992182c3 100644<br>
--- a/meta/classes-recipe/uboot-config.bbclass<br>
+++ b/meta/classes-recipe/uboot-config.bbclass<br>
@@ -144,7 +144,7 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Ensure the uboot specific=
 menuconfig settings do not leak into other recipes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;u-boot&#39; in reci=
pename:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(ubootc=
onfig) =3D=3D 1:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.se=
tVar(&#39;KCONFIG_CONFIG_ROOTDIR&#39;, os.path.join(d.getVar(&quot;B&quot;)=
, d.getVar(&quot;UBOOT_MACHINE&quot;).strip()))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.se=
tVar(&#39;KCONFIG_CONFIG_ROOTDIR&#39;, os.path.join(&quot;${B}&quot;, d.get=
Var(&quot;UBOOT_MACHINE&quot;).strip()))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# Disable menuconfig for multiple configs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0d.setVar(&#39;KCONFIG_CONFIG_ENABLE_MENUCONFIG&#39;, &quot;false&quot;)<=
br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#210872): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/210872" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/210872</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111017553/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111017553/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div><=
/div></div>

--000000000000e8124f062d6c185c--

