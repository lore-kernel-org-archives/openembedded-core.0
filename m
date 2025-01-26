Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11869C0218D
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 21:42:36 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.38767.1737927753182223296
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jan 2025 13:42:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XFo/uu0O;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2eeb4d643a5so6823606a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 13:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737927752; x=1738532552; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ipf1ZKmWuJcn8DjUAOnXnkY2J1qOwpe1UNF/iMDFuPE=;
        b=XFo/uu0OqL74/s1zRc1C96KxbC4IUBPnIqwo1WsIl2QULgm0CJEfZAS06K1f+xi2R2
         pDvURJpB8g52sPO29IKcUmu8UNITgAUq0VoQjfX8I9ijFraOZQ7q0qERQgtwOBotq0LX
         E4mHfO36yl6sHRgRjCyiE/tqIdm1pUFi/Vht2dDyumDKAZ8uF7nZeC66HnIJSg9EYYcW
         eotWaUsQY3Z6BqDmaMMgPU8M3l8APcD034I5NxC0FFt+uqnlUdniBe+DpaJfd4wUcSQq
         z1ghbBdcP6OMXdy0wgohaOjEci3jOq84K1ms/WioEzlZ9f49ixAv5EcLCh3njWhDIL8G
         Y7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737927752; x=1738532552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipf1ZKmWuJcn8DjUAOnXnkY2J1qOwpe1UNF/iMDFuPE=;
        b=GbrSVPgiwuuEhxFCGFUg7ZVE5Z7RN3vCN9XeGRJ/V3oqmQ98OWo6Iz28MaLO//HzwX
         JxylOkR4zw7vc2KY5eePrIuEg7ia0C9/yQVSx/Y/qEqkjRG+FgF4zz4rFOLCuf12YjAx
         v4zaJPfikZ7946Yn1Sptq3rw1hdxG/SAnp3BY8ktK4WFYiE/fcdcWAuGjobN+e9YBOev
         Hv5yE3jAyUEzACSSiQsnRIwkyIUgwEJhehuvhrM5jPjD6AY3c4f7Tqf8GD658pfVeyu+
         7VgCSwMBdbxTmi3wg3M4Ld8MwHsVr5lEzcO3fy1gi13DsNXqg1KjYDPJaOuvUCaOSmoC
         oKXA==
X-Gm-Message-State: AOJu0Yyuxel8SBIolLJNx+n0HSV74a0vwfS2IQ92wgeO3cTYonNeTwNE
	YbHo67WmjDbJ4t36UUlOCFD0sDqbd4L7Xg8lctDn+MrRpyT+yyNR83sRzRBHhhLF7CjgEwOdxzw
	elFl4e/22FMBIC9jjFifRFE9UMzU=
X-Gm-Gg: ASbGncvQNGJ+4R03+vFNbtPWYJh2ThvR4SBV2yH6PNzCGTfRyDXWuFU4q3uF2iypcny
	P9c4qxHvlLrgqGHZFtTQyPL85iwy/Qq/nrSdLLMDTzZTuc2TgH2YwkCXbsLH/Ssk=
X-Google-Smtp-Source: AGHT+IFBw6HbNSEBAAPetGPz83qay7Ayd9CW109iUeXZ9ZdQEzLtTqje10MSMXf9c1Ahcdt6+jwCT5bFHOK8oNR+RBQ=
X-Received: by 2002:a17:90b:5241:b0:2f2:f6e0:3f6a with SMTP id
 98e67ed59e1d1-2f782c94b72mr63394812a91.14.1737927752264; Sun, 26 Jan 2025
 13:42:32 -0800 (PST)
MIME-Version: 1.0
References: <20250126132005.1540374-1-sst@poczta.fm>
In-Reply-To: <20250126132005.1540374-1-sst@poczta.fm>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 26 Jan 2025 16:42:20 -0500
X-Gm-Features: AWEUYZkbv-tfNAjZNoe_Z8ZOhkVFN_xzn4k_Xnd7EdSHw5ye11OFhhN6Fu_dVjo
Message-ID: <CADkTA4MCYDwjFT5o863B5e-7uU_eWKK-ATm1O8Kz6x7K51da6A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH RESEND] kernel-yocto: fix merge_config.sh flag
 set when KBUILD_DEFCONFIG is used
To: sst@poczta.fm
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000051babf062ca2d60f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 21:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210294

--00000000000051babf062ca2d60f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 26, 2025 at 8:20=E2=80=AFAM Slawomir Stepien via lists.openembe=
dded.org
<sst=3Dpoczta.fm@lists.openembedded.org> wrote:

> Based on the documentation of KCONFIG_MODE[1], when we use "in-tree"
> defconfig (the KBUILD_DEFCONFIG is set), then the alldefconfig mode
> should be used with merge_config.sh.
>
>
Please make sure to copy me directly on any kernel-yocto changes.



> This commit fixes the logic behind setting the flag by checking if the
> provided defconfig file exists in the linux source tree.


There's no sense referencing the documentation here, since it was
written long after the code and matches the logic in the class, not
the other way around. Meaning it would be the documentation that
is wrong, not the code if there's a mismatch.



> [1]
> https://docs.yoctoproject.org/ref-manual/variables.html#term-KCONFIG_MODE
>
> Signed-off-by: Slawomir Stepien <sst@poczta.fm>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass
> b/meta/classes-recipe/kernel-yocto.bbclass
> index c45abf6ddc..ffda41ffc9 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -113,6 +113,14 @@ def get_dirs_with_fragments(d):
>
>      return " ".join(extrafiles)
>
> +kbuild_defconfig_exists() {
> +       if [ -f "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}" ]; then
> +               return 0
> +       fi
> +
> +       return 1
> +}
> +
>  do_kernel_metadata() {
>         set +e
>
> @@ -155,7 +163,7 @@ do_kernel_metadata() {
>         # precendence.
>         #
>         if [ -n "${KBUILD_DEFCONFIG}" ]; then
> -               if [ -f "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}" ]=
;
> then
> +               if $(kbuild_defconfig_exists); then
>

replacing this with a function call doesn't make much sense. See below for
why.



>                         if [ -f "${UNPACKDIR}/defconfig" ]; then
>                                 # If the two defconfig's are different,
> warn that we overwrote the
>                                 # one already placed in UNPACKDIR
> @@ -478,8 +486,12 @@ do_kernel_configme() {
>                         config_flags=3D""
>                         ;;
>                 *)
> -                       if [ -f ${UNPACKDIR}/defconfig ]; then
> -                               config_flags=3D"-n"
> +                       if $(kbuild_defconfig_exists); then
> +                               config_flags=3D""
> +                       else
> +                               if [ -f ${UNPACKDIR}/defconfig ]; then
> +                                       config_flags=3D"-n"
> +                               fi
>

This is only a sanity fall back, and was something I added only when pushed
for it.  There should be
no mod setting / changing based on logic at this point in the build. Since
we really can't be sure
what type of defconfig is what or if it has somehow been patched or
modified in an intervening task / step.
There's 10+ years of logic that sits on top of the current behaviour.

Anything that relies on a specific type of processing should explicitly set
the KCONFIG_MODE variable
in their kernel recipe / where the defconfig variable is set.

It might make sense to just set the KCONFIG_MODE in the do_kernel_metadata
routine when the
in-tree defconfig is copied and then just use it here.  Then just delete
the entirety of the *) case, since
we don't need a fallback (the default of alldefconfig will just occur since
the config_flags aren't set to
-n).

But we should not be looking into the tree and making a secondary decision
here based on
the source of the defconfig.

Bruce



>                         fi
>                         ;;
>         esac
> --
> 2.48.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210289):
> https://lists.openembedded.org/g/openembedded-core/message/210289
> Mute This Topic: https://lists.openembedded.org/mt/110821216/1050810
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

--00000000000051babf062ca2d60f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 26, 2025 at 8:20=E2=80=
=AFAM Slawomir Stepien via <a href=3D"http://lists.openembedded.org" target=
=3D"_blank">lists.openembedded.org</a> &lt;sst=3D<a href=3D"mailto:poczta.f=
m@lists.openembedded.org" target=3D"_blank">poczta.fm@lists.openembedded.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Based on the documentation of KCONFIG_MODE[1], when we use &quot;in-tree&q=
uot;<br>
defconfig (the KBUILD_DEFCONFIG is set), then the alldefconfig mode<br>
should be used with merge_config.sh.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Please make sure to copy me directly on any kernel-yocto c=
hanges.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
This commit fixes the logic behind setting the flag by checking if the<br>
provided defconfig file exists in the linux source tree.=C2=A0</blockquote>=
<div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">=
There&#39;s no sense referencing=C2=A0the documentation here, since it was<=
/div><div class=3D"gmail_default" style=3D"font-size:small">written long af=
ter the code and matches the logic in the class, not</div><div class=3D"gma=
il_default" style=3D"font-size:small">the other way around. Meaning it woul=
d be the documentation that</div><div class=3D"gmail_default" style=3D"font=
-size:small">is wrong, not the code if there&#39;s a mismatch.</div><br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
[1] <a href=3D"https://docs.yoctoproject.org/ref-manual/variables.html#term=
-KCONFIG_MODE" rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproje=
ct.org/ref-manual/variables.html#term-KCONFIG_MODE</a><br>
<br>
Signed-off-by: Slawomir Stepien &lt;<a href=3D"mailto:sst@poczta.fm" target=
=3D"_blank">sst@poczta.fm</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel-yocto.bbclass | 18 +++++++++++++++---<br>
=C2=A01 file changed, 15 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe=
/kernel-yocto.bbclass<br>
index c45abf6ddc..ffda41ffc9 100644<br>
--- a/meta/classes-recipe/kernel-yocto.bbclass<br>
+++ b/meta/classes-recipe/kernel-yocto.bbclass<br>
@@ -113,6 +113,14 @@ def get_dirs_with_fragments(d):<br>
<br>
=C2=A0 =C2=A0 =C2=A0return &quot; &quot;.join(extrafiles)<br>
<br>
+kbuild_defconfig_exists() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f &quot;${S}/arch/${ARCH}/configs/${KBUIL=
D_DEFCONFIG}&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1<br>
+}<br>
+<br>
=C2=A0do_kernel_metadata() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 set +e<br>
<br>
@@ -155,7 +163,7 @@ do_kernel_metadata() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # precendence.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${KBUILD_DEFCONFIG}&quot; ]; then=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f &quot;${S}/=
arch/${ARCH}/configs/${KBUILD_DEFCONFIG}&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if $(kbuild_defconf=
ig_exists); then<br></blockquote><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">replacing this with a function call doesn&=
#39;t make much sense. See below for why.</div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if [ -f &quot;${UNPACKDIR}/defconfig&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # If the two defconfig&#39;s are dif=
ferent, warn that we overwrote the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # one already placed in UNPACKDIR<br=
>
@@ -478,8 +486,12 @@ do_kernel_configme() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 config_flags=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ -f ${UNPACKDIR}/defconfig ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config_flags=3D&quot;-n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if $(kbuild_defconfig_exists); then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config_flags=3D&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f ${UNPACKDIR}/defconfig ]; the=
n<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config_fl=
ags=3D&quot;-n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br></blockquote><div><br></div><di=
v><div class=3D"gmail_default" style=3D"font-size:small">This is only a san=
ity fall back, and was something I added only when pushed for it.=C2=A0 The=
re should be</div><div class=3D"gmail_default" style=3D"font-size:small">no=
 mod setting / changing based on logic at this point in the build. Since we=
 really can&#39;t be sure</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">what type of defconfig is what=C2=A0or if it has somehow been pa=
tched or modified in an intervening=C2=A0task / step.</div><div class=3D"gm=
ail_default" style=3D"font-size:small">There&#39;s 10+ years of logic that =
sits on top of the current behaviour.</div><div class=3D"gmail_default" sty=
le=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font=
-size:small">Anything that relies on a specific type of processing should e=
xplicitly set the KCONFIG_MODE variable</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">in their kernel recipe / where the defconfig varia=
ble is set.</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">It might make=
 sense to just set the KCONFIG_MODE in the do_kernel_metadata routine when =
the</div><div class=3D"gmail_default" style=3D"font-size:small">in-tree def=
config is copied and then just use it here.=C2=A0 Then just delete the enti=
rety of the *) case, since</div><div class=3D"gmail_default" style=3D"font-=
size:small">we don&#39;t need a fallback (the default of alldefconfig will =
just occur since the config_flags aren&#39;t set to</div><div class=3D"gmai=
l_default" style=3D"font-size:small">-n).</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">But we should not be looking into the tree and making a se=
condary decision here based on</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">the source of the defconfig.=C2=A0</div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div></div><div><div class=3D"gmai=
l_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
-- <br>
2.48.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#210289): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/210289" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/210289</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110821216/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110821216/1050810</a><br>
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
</div>

--00000000000051babf062ca2d60f--

