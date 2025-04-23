Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FE8C369D1
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 12:31:06 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.7494.1745411463047492659
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 05:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=io+EJfVT;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso7406511a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 05:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745411462; x=1746016262; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xPRk1yjIQgNVt5pezGoxOfMNqid3/S3+HyoTuTWjYlY=;
        b=io+EJfVTOqQRcfJ1hX1yRfCkDhy3Ihj4ps8CH22pCKK2rxguGU7cVd1Vyi6gy/N5cS
         noB1maUz39AXux/joAawOvOnUmVYxp2+Pa5TyrLloPNZO6yXxwd1bbPc0OoYy5Mv7KKe
         w6VC5swh6vZzvcjllxkiBUDTAdgXtvr35QBylPFneLuvpY7XvbZTv6z3IJX4QrDqxU4G
         Qf5ajnCLKLH0e5xG8iHW56dnrIqhZQA++KDGtp2geu0EJgQEaL3YHYG4OpZGCOvfKEMg
         uAtlqsqtWA9W0xbDwifolc8uJ816+f8O9si3AxcIGmBY14ke2S5ZUnG/V7eO9+asVeTW
         Xulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745411462; x=1746016262;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPRk1yjIQgNVt5pezGoxOfMNqid3/S3+HyoTuTWjYlY=;
        b=u5qtzeSLXFM8zmp+wLiHgr+6Ihf0sXz7jkyZYi0j41cS4sRr5WTxvON9kMHvqxUBUB
         F0+cBYVRBLNluxFwdxEhtNktzTxd01wHBu0OVNBqRYILE/RxFk5n3jUxyPtSsG+qI0JH
         0Rs7mhKimh1++mb+kUJy5q0z7af2sJshHxbyT6VerQR+Xw3KxdF1rDXB+kgfTnlf7nTV
         lXQcNC57wbWY6/SBtJXzfpT3AH4MR2pL+1xaOFr4nnUg3cZJtB2HNMc0U0Tijmvv+eRB
         auBE7uyHTaYx2uJEZqSX1AEJSAzIoqaXmgsNUIgA7HKofWKg4nPcFvZN/MjtvxZb0zLA
         BeEw==
X-Gm-Message-State: AOJu0Yyx3Vi/Si1u1ZU6SF4R2VEwXp0k7o3/csfT9enwcQXA26mTu1G3
	KShssNrYk4Z0381vfBGdnmD74u9lWBfb/HFWQZgl6v5n55zUbknuGyGNPmksx11DTO/OBIpNl+J
	jwdHkeSHNe5F3nauQWRIqhMfdRzc=
X-Gm-Gg: ASbGncunMtYvzdVvrv8D0rk7swxgbzVmSwdP/hCNdDbEQCIaIE3vuxYs75ErY/yt1g0
	yTPE2a4lskfBmtmUVqExUt02C39HqdXpjGkIV8SwYnmkmzc5Ksz0wNtkpbwqMDtIgCaO830tHJl
	y4x5rsYX64wnbwIfFS7j5ZHOo=
X-Google-Smtp-Source: AGHT+IGiSsu96U0bRR7IOLByHS+JErcJBFOnOR8lwudeP55IBHlA4eXgRK1zZNTywEYX821Rm1DnIuxfecrcJs9OkPs=
X-Received: by 2002:a17:90b:2dcb:b0:2ee:f687:6acb with SMTP id
 98e67ed59e1d1-3087bb53f4fmr29383743a91.13.1745411462078; Wed, 23 Apr 2025
 05:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250423080246.128723-1-mikko.rapeli@linaro.org> <20250423080246.128723-2-mikko.rapeli@linaro.org>
In-Reply-To: <20250423080246.128723-2-mikko.rapeli@linaro.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 23 Apr 2025 08:30:50 -0400
X-Gm-Features: ATxdqUE3uRtiaExsF6AtUffnbXuSkQxnc2fBjqL8YIdfyLKvbcPS9tAjvkDpBGg
Message-ID: <CADkTA4MUkWtgpj=FG2rGN+kHQqkGLWjLPMDiyBi3TUct+Th4EQ@mail.gmail.com>
Subject: Re: [poky] [PATCH 2/3] kernel-yocto.bbclass: support modular kernel configs
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org, poky@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000002f2bb20633714669"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 12:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215284

--0000000000002f2bb20633714669
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I already have patches for this, and they have not been sent on purpose.

Please do not apply this patch, consider this a nack.

Bruce

On Wed, Apr 23, 2025 at 4:03=E2=80=AFAM Mikko Rapeli via lists.yoctoproject=
.org
<mikko.rapeli=3Dlinaro.org@lists.yoctoproject.org> wrote:

> Compile many kernel drivers as modules when recipe sets
>
> MODULAR_KERNEL =3D "true"
>
> This likely requires support for initramfs which includes
> kernel modules needed to mount the rootfs.
>
> SCC_OPTS can be used to add arguments to scc kernel config
> generation call.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass
> b/meta/classes-recipe/kernel-yocto.bbclass
> index cef6b9ec3f..f98720bcec 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -26,6 +26,12 @@ KCONF_BSP_AUDIT_LEVEL ?=3D "0"
>  KMETA_AUDIT ?=3D "yes"
>  KMETA_AUDIT_WERROR ?=3D ""
>
> +# most drivers as built in (default), or as modules
> +MODULAR_KERNEL =3D "false"
> +
> +# options to scc
> +SCC_OPTS ?=3D "${@bb.utils.contains('MODULAR_KERNEL', 'true',
> '-DMODULE_OR_Y=3Dm', '', d)}"
> +
>  # returns local (absolute) path names for all valid patches in the
>  # src_uri
>  def find_patches(d,subdir):
> @@ -298,7 +304,7 @@ do_kernel_metadata() {
>                 elements=3D"`echo -n ${bsp_definition} $sccs_defconfig
> ${sccs} ${patches} $KERNEL_FEATURES_FINAL`"
>                 if [ -n "${elements}" ]; then
>                         echo "${bsp_definition}" >
> ${S}/${meta_dir}/bsp_definition
> -                       scc --force -o ${S}/${meta_dir}:cfg,merge,meta
> ${includes} $sccs_defconfig $bsp_definition $sccs $patches
> $KERNEL_FEATURES_FINAL
> +                       scc ${SCC_OPTS} --force -o
> ${S}/${meta_dir}:cfg,merge,meta ${includes} $sccs_defconfig $bsp_definiti=
on
> $sccs $patches $KERNEL_FEATURES_FINAL
>                         if [ $? -ne 0 ]; then
>                                 bbfatal_log "Could not generate
> configuration queue for ${KMACHINE}."
>                         fi
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#13599):
> https://lists.yoctoproject.org/g/poky/message/13599
> Mute This Topic: https://lists.yoctoproject.org/mt/112410521/1050810
> Group Owner: poky+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/poky/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000002f2bb20633714669
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">I already have patches for this, and they have not been sent =
on purpose.</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">Please do not=
 apply this patch, consider this a nack.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Bruce</div></div><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 23, 2025 at 4:=
03=E2=80=AFAM Mikko Rapeli via <a href=3D"http://lists.yoctoproject.org">li=
sts.yoctoproject.org</a> &lt;mikko.rapeli=3D<a href=3D"mailto:linaro.org@li=
sts.yoctoproject.org">linaro.org@lists.yoctoproject.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Compile many kernel =
drivers as modules when recipe sets<br>
<br>
MODULAR_KERNEL =3D &quot;true&quot;<br>
<br>
This likely requires support for initramfs which includes<br>
kernel modules needed to mount the rootfs.<br>
<br>
SCC_OPTS can be used to add arguments to scc kernel config<br>
generation call.<br>
<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org" =
target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel-yocto.bbclass | 8 +++++++-<br>
=C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe=
/kernel-yocto.bbclass<br>
index cef6b9ec3f..f98720bcec 100644<br>
--- a/meta/classes-recipe/kernel-yocto.bbclass<br>
+++ b/meta/classes-recipe/kernel-yocto.bbclass<br>
@@ -26,6 +26,12 @@ KCONF_BSP_AUDIT_LEVEL ?=3D &quot;0&quot;<br>
=C2=A0KMETA_AUDIT ?=3D &quot;yes&quot;<br>
=C2=A0KMETA_AUDIT_WERROR ?=3D &quot;&quot;<br>
<br>
+# most drivers as built in (default), or as modules<br>
+MODULAR_KERNEL =3D &quot;false&quot;<br>
+<br>
+# options to scc<br>
+SCC_OPTS ?=3D &quot;${@bb.utils.contains(&#39;MODULAR_KERNEL&#39;, &#39;tr=
ue&#39;, &#39;-DMODULE_OR_Y=3Dm&#39;, &#39;&#39;, d)}&quot;<br>
+<br>
=C2=A0# returns local (absolute) path names for all valid patches in the<br=
>
=C2=A0# src_uri<br>
=C2=A0def find_patches(d,subdir):<br>
@@ -298,7 +304,7 @@ do_kernel_metadata() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elements=3D&quot;`e=
cho -n ${bsp_definition} $sccs_defconfig ${sccs} ${patches} $KERNEL_FEATURE=
S_FINAL`&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${ele=
ments}&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 echo &quot;${bsp_definition}&quot; &gt; ${S}/${meta_dir}/bsp_def=
inition<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} $sccs_=
defconfig $bsp_definition $sccs $patches $KERNEL_FEATURES_FINAL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0scc ${SCC_OPTS} --force -o ${S}/${meta_dir}:cfg,merge,meta ${incl=
udes} $sccs_defconfig $bsp_definition $sccs $patches $KERNEL_FEATURES_FINAL=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if [ $? -ne 0 ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal_log &quot;Could not generate=
 configuration queue for ${KMACHINE}.&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fi<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#13599): <a href=3D"https://lists.yoctoproject.org/g/pok=
y/message/13599" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctopr=
oject.org/g/poky/message/13599</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/112410521/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/112410521/1050810</a><br>
Group Owner: <a href=3D"mailto:poky%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">poky+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/poky/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/poky/unsub<=
/a> [<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.as=
hfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000002f2bb20633714669--

