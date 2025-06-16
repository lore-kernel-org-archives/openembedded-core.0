Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D5AC71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 23:42:57 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.6122.1750117371973539307
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 16:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z/G5XKwO;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-313cde344d4so4740703a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750117371; x=1750722171; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0GppFPgLDQKb8ojOKHFda2BPd7q7KsFDglj5PQDa0Rk=;
        b=Z/G5XKwOyu6BkbJAUtMiz/fQBGA3kvImZjPbuN9C/r1Ui7z9YZNJ8bUEXWk2cvvU5A
         DMxctzuGisD2t2wMiJMwMYLbswYroFCK9iOWjUNN490UmgrlomJqL3ZzMg6A6B4eRFJS
         LhvtS/cwBQbUgCrrW6BgqsfHwOQWqcausKs60vOr8//ILkWmR2XNra3PIrWAXzwzJ/xF
         N1oGvc1EMqo/bS6KYE1uDlGfcF1mO89hALxn62zHcGjk7rY7Tu4Xbevz4Y2KRRojRH2Z
         QG4k5WWdbxBW4gkrD8hWLflw50FPZ2iBi10dMpGkEP/xfhRg/KWByOny+o8a6G3WHxDI
         4i3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750117371; x=1750722171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0GppFPgLDQKb8ojOKHFda2BPd7q7KsFDglj5PQDa0Rk=;
        b=mKxw8GoZ6lz7pXjvPZFnLPxvh8gWml6nUvbOFVhrgMcaVykqiPHbgLTBJDMLxHTysG
         woPzPEGuKCGuBH4LnBIJ1SUk6luhmft1f4Q47+xxjd0aEyf1UT1p9pQs7/lkX9ia51iQ
         QNPy7fQVAUUX3hzp+nAksxrUgqhjKNff3jThthA4TnQtAEfRv3VRb25VFLiL0YJ5pGCe
         0ZthWxszlSzGZ2Qm1nuxWuKAoeDDiDbs3ezypUgBuTmpCjR8tBU3pbGgpwUJJ8LhF1Mk
         2pnHExdsHyhQF8Goa27Lhl/oYZE5Z61KaUeNcFkUl4L7/9JIy9OepOUBiC3KSncAjamX
         JvDg==
X-Gm-Message-State: AOJu0YwHgAqW71ekZhJJmp/BibiItw7XIU94Bwfq1f9fa92vKUvK0sIk
	v0QH3ZwsJQF8i7FLC7C9XMaWhMXwpWr9JNUtK1GKHVpUCcQmi+PGvgTCqCaxWGWFuWn82MHP9D4
	2EB0gejwsX/r8XP9sSaOKwa9VNP2EVxI=
X-Gm-Gg: ASbGncvj4rJJ8IBeEqJnnfvSMrSqpy9mbLtiyQDPiFDd0+27vgVl5hOj+Ey6nqjLnDB
	fdVta+9DQi/tiU6cgoEi57w1W/VQfWvECuezQ38plBjv/rWIGrZgtIRsTuHj6xteJF7S/YHvtOl
	Ob0EUpPgGUTwaWq+v89lhKDRpQtZbcchW6yGjMQdO2b/xZngrNFdtYNwA=
X-Google-Smtp-Source: AGHT+IEMAc6hDE/Qud0UpRlqGd+T+B7T9du++ldbA1+AhMXq8ST0JenfKRW/B0czuDDwILBpqh68R/A/ULUZJfIzabc=
X-Received: by 2002:a17:90b:4cd1:b0:311:f2f6:44ff with SMTP id
 98e67ed59e1d1-313f1db806fmr22221633a91.17.1750117371195; Mon, 16 Jun 2025
 16:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250616183028.87531-1-alexander.sowarka@linaro.org>
In-Reply-To: <20250616183028.87531-1-alexander.sowarka@linaro.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Jun 2025 19:42:39 -0400
X-Gm-Features: AX0GCFs-5BjjYRcL1WvPBAEVVH7qMeRWhNUNRbYF8o9kElc65EHM_FjugvUwIm0
Message-ID: <CADkTA4MkCEt+3zxsM=2UAX+9MnS-nHyFmkQtTANb2=MJ=JCryQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto: Do not use allnoconfig for
 in-tree configs
To: alexander.sowarka@linaro.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000039b4400637b8f441"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 23:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218847

--00000000000039b4400637b8f441
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 2:30=E2=80=AFPM Alexander Sowarka via lists.openemb=
edded.org
<alexander.sowarka=3Dlinaro.org@lists.openembedded.org> wrote:

> The documentation clearly states that in-tree configs, configured with
> KBUILD_DEFCONFIG will set all missing config flags to their default
> value and specifying KCONFIG_MODE is not required.
> Fix the check for in-tree configs.
>

The documentation is wrong then. It was written to match the code, not
vice versa.

This behaviour should stay at the default, since there's a way to override
it,
and it has been that way for quite some time.

Cheers,

Bruce



>
> Signed-off-by: Alexander Sowarka <alexander.sowarka@linaro.org>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass
> b/meta/classes-recipe/kernel-yocto.bbclass
> index 9a86616dad..44d09a9b42 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -460,7 +460,7 @@ do_kernel_configme() {
>                         config_flags=3D""
>                         ;;
>                 *)
> -                       if [ -f ${WORKDIR}/defconfig ]; then
> +                       if [ -z ${KBUILD_DEFCONFIG} ] && [ -f
> ${WORKDIR}/defconfig ]; then
>                                 config_flags=3D"-n"
>                         fi
>                         ;;
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218845):
> https://lists.openembedded.org/g/openembedded-core/message/218845
> Mute This Topic: https://lists.openembedded.org/mt/113676136/1050810
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

--00000000000039b4400637b8f441
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 16, 2025 at 2:30=E2=80=
=AFPM Alexander Sowarka via <a href=3D"http://lists.openembedded.org" targe=
t=3D"_blank">lists.openembedded.org</a> &lt;alexander.sowarka=3D<a href=3D"=
mailto:linaro.org@lists.openembedded.org" target=3D"_blank">linaro.org@list=
s.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">The documentation clearly states that in-tree configs, co=
nfigured with<br>
KBUILD_DEFCONFIG will set all missing config flags to their default<br>
value and specifying KCONFIG_MODE is not required.<br>
Fix the check for in-tree configs.<br></blockquote><div><br></div><div><div=
 class=3D"gmail_default" style=3D"font-size:small">The documentation is wro=
ng then. It was written to match the code, not</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">vice versa.</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">This behaviour should stay at the default, since there=
&#39;s a way to override it,</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">and it has been that way for quite some time.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Cheers,</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Alexander Sowarka &lt;<a href=3D"mailto:alexander.sowarka@li=
naro.org" target=3D"_blank">alexander.sowarka@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel-yocto.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe=
/kernel-yocto.bbclass<br>
index 9a86616dad..44d09a9b42 100644<br>
--- a/meta/classes-recipe/kernel-yocto.bbclass<br>
+++ b/meta/classes-recipe/kernel-yocto.bbclass<br>
@@ -460,7 +460,7 @@ do_kernel_configme() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 config_flags=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ -f ${WORKDIR}/defconfig ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ -z ${KBUILD_DEFCONFIG} ] &amp;&amp; [ -f ${WORKDIR}/defconfi=
g ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config_flags=3D&quot;-n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ;;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#218845): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/218845" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/218845</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113676136/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113676136/1050810</a><br>
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

--00000000000039b4400637b8f441--

