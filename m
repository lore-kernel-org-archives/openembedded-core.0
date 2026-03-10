Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C649FD2D6C
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 12:42:08 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38978.1773146519281718693
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 05:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y04JULMX;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35990245493so5974184a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 05:41:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773146518; cv=none;
        d=google.com; s=arc-20240605;
        b=DzewbdNZchWBjVtUrTGe4yKrNXcMNSMIL5IdYWXcXTRi2f3YfdN6uh4WKmYFjz7eX1
         bKTTwL8g5A50nED0Xyhq05qksjZKd7JWcvjth4PA1HL5ZIVaY11KBkj7gxK8KR1+giuK
         u3htvSJ8pVbsM8UNO8zKifiVXVs4izfpiP2Ww0ukjjjt3PwZFrYJaHkSDtOK3+qm3hjh
         ZrXEDuslCsF0ds2FbrBFDprphJjDywoMUTEPHwXvrrk6yJR8LGAwKXJWY9ssj/SX5Oog
         m3+bCv64PMfrez63n1u76tWfLitrSPxjx2rtRglRGACIXv2flkqP03lltuBj6IXkttDy
         0RCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WMP8kLQ4SyXdo4ZAY1SbFPdXaHam4C+b288Fh+2yzRQ=;
        fh=kWKt4UINZ1F4UonjK/V/OyGHrn7Nboyn6VF2ZUoMrMc=;
        b=EFOScMG7T01CMX4anDOJWhvEkJ1FFWqs4IqB8F+RDhxwnXDwCTB6ddnx3rhUg/Rucj
         xh1tUGGrgegc15FY7hYbGA2biXfAG+fXae2UWn3uJ6BotOf3M+Y+3AA3+/nn6UYMr0r2
         7slAxY66ksFtri4hHlo44ekhPpDpeki/85x61hQKb2Wy8goi+8sewPLPj3Z/iGwDlYfL
         Iwuea5G8pdQtyQqjeRk5EyGn0+yRK3DPzdAbhLx1nWrU2tNboh0K+81ALEqmCkT1RLhb
         yjFJomwPr2jU68rpVxcD9XC0BBODZNUAwka2kzwbsgLoC4hFXpN5VfePMal4KXNo7po4
         CcJw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773146518; x=1773751318; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WMP8kLQ4SyXdo4ZAY1SbFPdXaHam4C+b288Fh+2yzRQ=;
        b=Y04JULMX0sXeLXQesOUhYCXoNAUiqYVGu1c34rrE7cxJjL/9Cx5HGC9LzqlSHRaIWY
         9XEzZGzKrBbZCyPu7nVPBriFY4/pUbh404P0TORZ6DMi9CoHo2atzb2BsGmLzJLgaKYF
         cLOy9RkW51JPeKEuSqL7HUYYUMkWCBugClWrMU4rY+GMu9H19I5tuN0K6fXJa/RS22NL
         XU3s8ONaMZQXRd1qEtZJXA81zo7anPjiOSNG6jSH1TnHvAfLPVWEggEijjrQtFN6ybWu
         hX2CXJ6Z8PcVrh3wySgL/zxRlMKkXVPGvQZM8AB5rCr0lG/RPkDlDt2r1+zG4TtNUx7A
         KTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773146518; x=1773751318;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMP8kLQ4SyXdo4ZAY1SbFPdXaHam4C+b288Fh+2yzRQ=;
        b=nnSeThTFz2c/Gc9K25h4dmHVOSVwyNE3W7bAaPyx8FtaOZi3aMGewse97q8srqX5dr
         7l7U584/LxyMrrJyWVvr/CDfiMpr5Vv3wFyr8BsnPCQVnypjKdro2NBLwjUQ1cPLB7Gy
         bK/DuqMI8pRhcApt0ziqa2pZv68GvOTNMfjGiydON0loi0F5BPjQLG9mAYrmNfZON2Up
         75zqwZATChDETc4ZUMjP9nB5sAJnke2sNDrA6jwwiJ9Ri0AukrjqFh9JAvapCF9bY/ma
         UacQ8MV9EB99wEmMbxNYIcUsBzI5hKrqSvki3AXs+uEupkny5mePP7Od2jSa6g4atspE
         80lg==
X-Gm-Message-State: AOJu0YwqmlZI7hr0kCrF70BTfM9TsrrJaPkFCvi7jiE4B0aWmeVUfqYD
	0V0HWTZtgNaP6tmKuDnOngYiLsKVNEUJ9ihORJ7ghfVhX0ymqwuI82T4CkHBVlWNgmgQ89XKr+P
	AQ53RJjc/Ozea1idDAcR3ynqu6sz86KQ=
X-Gm-Gg: ATEYQzyDvDy+2JIdtVnDVZaip/FeiY8A3t2D1tDISHZUKcgPfyBmmY3DqMnR+J3kgzw
	kJ/KKKSsyq0Ewgg8hvD6wg7m2EzVIlnBCQXUFMJcf5s3XUvqnjR7u6b8IDww9CuRiLps9OQzEVi
	Bqc6x+BBfNsILV75EKX2pQjGIRU7JCAT9dAK4xHPERJbXiuv1iE5/TKPkoXqUcXhP8SeW4GzITx
	MDCQXzdGeomkpaQK6LFvZLtYVohnUKe9dbu06KSG2dUMB6b3hhIFBPNByjuOwWS7+5fzyjHYMK2
	PaNbFej+rnZQ2GD9lYihASTRO8kNTVqeyLlTE8uDPPDEdhP9k0E=
X-Received: by 2002:a17:90b:3e8c:b0:359:8c21:ef47 with SMTP id
 98e67ed59e1d1-359be29199dmr13126322a91.13.1773146518384; Tue, 10 Mar 2026
 05:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260310113351.194882-1-mikko.rapeli@linaro.org>
In-Reply-To: <20260310113351.194882-1-mikko.rapeli@linaro.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Mar 2026 08:41:46 -0400
X-Gm-Features: AaiRm515kMh3WtPbuQmFYxk_5GSoho8YAhncrtYoozJXB5ViPWOdIdX4mcTKyxI
Message-ID: <CADkTA4Ofx5RBm-Zxa9+8HOT7edDMCSV2RdAf7xcE7MFfN2cHiQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto.bbclass: capture merge_config.sh
 output to task log
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005cf561064caad830"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 12:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232775

--0000000000005cf561064caad830
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 7:34=E2=80=AFAM Mikko Rapeli via lists.openembedded=
.org
<mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:

> With https://lists.yoctoproject.org/g/linux-yocto/message/16359
> updates to merge_config.sh in kern-tools-native the output
> is useful and not too verbose. Thus capture it to normal
> do_kernel_configme task logs.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass
> b/meta/classes-recipe/kernel-yocto.bbclass
> index e53bf1519418..d981ca0e30e6 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -492,14 +492,9 @@ do_kernel_configme() {
>                 bbfatal_log "Could not find configuration queue
> (${meta_dir}/config.queue)"
>         fi
>
> -       CFLAGS=3D"${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC=3D"${BUILD_CC}
> ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}" CC=3D"${KERNEL=
_CC}"
> LD=3D"${KERNEL_LD}" OBJCOPY=3D"${KERNEL_OBJCOPY}" STRIP=3D"${KERNEL_STRIP=
}"
> ARCH=3D${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} >
> ${meta_dir}/cfg/merge_config_build.log 2>&1
> +       CFLAGS=3D"${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC=3D"${BUILD_CC}
> ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}" CC=3D"${KERNEL=
_CC}"
> LD=3D"${KERNEL_LD}" OBJCOPY=3D"${KERNEL_OBJCOPY}" STRIP=3D"${KERNEL_STRIP=
}"
> ARCH=3D${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs}
>         if [ $? -ne 0 -o ! -f ${B}/.config ]; then
>                 bberror "Could not generate a .config for
> ${KMACHINE}-${LINUX_KERNEL_TYPE}"
> -               if [ ${KCONF_AUDIT_LEVEL} -gt 1 ]; then
> -                       bbfatal_log "`cat
> ${meta_dir}/cfg/merge_config_build.log`"
> -               else
> -                       bbfatal_log "Details can be found at:
> ${S}/${meta_dir}/cfg/merge_config_build.log"
> -               fi
>

There are tools built on having the log around in a file. So we can't merge
this as-is.

Why not just change the default to 1 (and not make it fatal) instead of
undoing all the infrastructure ?

Bruce

        fi
>
>         if [ ! -z "${LINUX_VERSION_EXTENSION}" ]; then
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232770):
> https://lists.openembedded.org/g/openembedded-core/message/232770
> Mute This Topic: https://lists.openembedded.org/mt/118239002/1050810
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

--0000000000005cf561064caad830
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 10, 2026 at 7:34=
=E2=80=AFAM Mikko Rapeli via <a href=3D"http://lists.openembedded.org">list=
s.openembedded.org</a> &lt;mikko.rapeli=3D<a href=3D"mailto:linaro.org@list=
s.openembedded.org">linaro.org@lists.openembedded.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">With <a href=3D"https:=
//lists.yoctoproject.org/g/linux-yocto/message/16359" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.yoctoproject.org/g/linux-yocto/message/16359<=
/a><br>
updates to merge_config.sh in kern-tools-native the output<br>
is useful and not too verbose. Thus capture it to normal<br>
do_kernel_configme task logs.<br>
<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org" =
target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel-yocto.bbclass | 7 +------<br>
=C2=A01 file changed, 1 insertion(+), 6 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe=
/kernel-yocto.bbclass<br>
index e53bf1519418..d981ca0e30e6 100644<br>
--- a/meta/classes-recipe/kernel-yocto.bbclass<br>
+++ b/meta/classes-recipe/kernel-yocto.bbclass<br>
@@ -492,14 +492,9 @@ do_kernel_configme() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal_log &quot;C=
ould not find configuration queue (${meta_dir}/config.queue)&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;${CFLAGS} ${TOOLCHAIN_OPTIONS}&q=
uot; HOSTCC=3D&quot;${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}&quot; HOST=
CPP=3D&quot;${BUILD_CPP}&quot; CC=3D&quot;${KERNEL_CC}&quot; LD=3D&quot;${K=
ERNEL_LD}&quot; OBJCOPY=3D&quot;${KERNEL_OBJCOPY}&quot; STRIP=3D&quot;${KER=
NEL_STRIP}&quot; ARCH=3D${ARCH} merge_config.sh -O ${B} ${config_flags} ${c=
onfigs} &gt; ${meta_dir}/cfg/merge_config_build.log 2&gt;&amp;1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;${CFLAGS} ${TOOLCHAIN_OPTIONS}&q=
uot; HOSTCC=3D&quot;${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}&quot; HOST=
CPP=3D&quot;${BUILD_CPP}&quot; CC=3D&quot;${KERNEL_CC}&quot; LD=3D&quot;${K=
ERNEL_LD}&quot; OBJCOPY=3D&quot;${KERNEL_OBJCOPY}&quot; STRIP=3D&quot;${KER=
NEL_STRIP}&quot; ARCH=3D${ARCH} merge_config.sh -O ${B} ${config_flags} ${c=
onfigs}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 -o ! -f ${B}/.config ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bberror &quot;Could=
 not generate a .config for ${KMACHINE}-${LINUX_KERNEL_TYPE}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ${KCONF_AUDIT_=
LEVEL} -gt 1 ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bbfatal_log &quot;`cat ${meta_dir}/cfg/merge_config_build.log`&qu=
ot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bbfatal_log &quot;Details can be found at: ${S}/${meta_dir}/cfg/m=
erge_config_build.log&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br></blockquote>=
<div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">=
There are tools built on having the log around in a file. So we can&#39;t m=
erge this as-is.</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Why not =
just change the default to 1 (and not make it fatal) instead of undoing all=
 the infrastructure ?</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bru=
ce</div><br></div><div class=3D"gmail_default" style=3D"font-size:small"></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! -z &quot;${LINUX_VERSION_EXTENSION}&quot=
; ]; then<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#232770): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/232770" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/232770</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118239002/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118239002/1050810</a><br>
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

--0000000000005cf561064caad830--

