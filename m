Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189F6C0218D
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 21:54:36 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.38967.1737928466516367513
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jan 2025 13:54:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JGjC2/gV;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ef87d24c2dso4986551a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 13:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737928466; x=1738533266; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYiU4go7/39EjuTMdCXN3CUr93CCLn2JtMz7jqrpRqU=;
        b=JGjC2/gVopMCClHLrp2pZc8bIXj5bM5F52J8k1bbdaPvbpYTojwpCRxsxtbByqQ/de
         x5tcCbM+MtPJd9XRF9OkoVFczhpY2KOOgVHdaWK16HO10gIn+mAMPD/Dgvil5eLhNw0a
         hq5voE2Y56Pbpocs3uTLLogA7IHtrXbUmoJET/4cWsGez5KgsQzxqMX0lGGjdoXrWn/w
         wuCg2sHi7Et1Eb3uf6mwmO9j6InqnpA7GLqEpG/FDrgLDxUbMH99wfk055ayntVYCaOP
         WfsuEoEi7744e+cUfXanu7K4voRzGvwlXOf+mVz8d8OTPMZxymWWoGnS9Vm8bnjyI8+y
         0w2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737928466; x=1738533266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYiU4go7/39EjuTMdCXN3CUr93CCLn2JtMz7jqrpRqU=;
        b=kYUP9njoCd06qo4B9a5s6fG3zsH5AVwj7TBT0T/js/Wo7u5EqpU2y9J/LXtEkaP7Gm
         62F1QdrJJCbWG5EdJhXCFuGd0MBsYOyi2RJWUxgH9YySzR8BDG5rSrXDBxZnqBBLVYxF
         UJZHfbNtQL1ipVZOMqXqXBP+yqp6ChU63iBp/pUyWR6APKSSvOZsJydJu88f7sjnrFas
         ADa90NtPEwggWjLXyJGIWg5sm4tD76nI1wTEeQad0ngOWLz03HT0gxK9MFvFATu3tY7n
         UtCLd8q22MTvCwJZAAgbtL/RpK6d1tQN0PIzJINlDum855LZFjiwlhMYMzkrwvx6Few2
         vNCQ==
X-Gm-Message-State: AOJu0YzKuSPPdTHcTBIi4dzodveRXTREowt44g6Uh2Xk8BBNCC8d/c4C
	1PtvnHDwOLO0hbM/bHV8UvnS7+gXcQNR27crrkMK2rZLCK4W0phaO7UnoeonVdTvXmaHkMMxaNq
	DSVvC0Q3OMPUWWRlojHMiRf5O0Kw=
X-Gm-Gg: ASbGnct+14XITsKdn9OgNTeOPL1OxHbuMBQBdqJotfIQGqdO2CwlsOA5mGYKjQ2LqzY
	GrEI+6wrgPl7f9HM/UmUzcuEJvRhUF50n4MsF40tMRDOBTcyX9Ps4tQ5aC0ot05s=
X-Google-Smtp-Source: AGHT+IH4aTbegf/RqfNcVDt1m5nxgHvJVUKLovpkFhjS/OkV0gYAUr1WwAI00C/1fxLxS+VTT7hmScmdI9JVEM8FUuk=
X-Received: by 2002:a17:90b:258b:b0:2ee:f80c:688d with SMTP id
 98e67ed59e1d1-2f782d4f168mr52681920a91.25.1737928465780; Sun, 26 Jan 2025
 13:54:25 -0800 (PST)
MIME-Version: 1.0
References: <20250126133419.1545381-1-sst@poczta.fm>
In-Reply-To: <20250126133419.1545381-1-sst@poczta.fm>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 26 Jan 2025 16:54:14 -0500
X-Gm-Features: AWEUYZkb1t6xsqhPIm7qWffTaapESP7MI9rmwwkqpzqo62qjDt-H77wan6x5lvQ
Message-ID: <CADkTA4MhRySm1ir_FPXPyM18Fo=MeBsj4w1RZBqxL-Dogdyw2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto: move the cp of
 ${KBUILD_DEFCONFIG} file outside if body
To: sst@poczta.fm
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d91970062ca3000b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 21:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210295

--000000000000d91970062ca3000b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 26, 2025 at 8:34=E2=80=AFAM Slawomir Stepien via lists.openembe=
dded.org
<sst=3Dpoczta.fm@lists.openembedded.org> wrote:

> In both true/false cases, we will cp the file, so move the invocation
> after the if body.
>
> In addition, misleading comment has been removed.
>
I'm not sure why I didn't remove the else when I was changing that logic to
do a compare before the copy, but I agree, we don't need the same line
twice!

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>

Bruce


>
> Signed-off-by: Slawomir Stepien <sst@poczta.fm>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass
> b/meta/classes-recipe/kernel-yocto.bbclass
> index c45abf6ddc..cef6b9ec3f 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -150,10 +150,6 @@ do_kernel_metadata() {
>         # from the source tree, into a common location and normalized
> "defconfig" name,
>         # where the rest of the process will include and incoroporate it
> into the build
>         #
> -       # If the fetcher has already placed a defconfig in UNPACKDIR (fro=
m
> the SRC_URI),
> -       # we don't overwrite it, but instead warn the user that SRC_URI
> defconfigs take
> -       # precendence.
> -       #
>         if [ -n "${KBUILD_DEFCONFIG}" ]; then
>                 if [ -f "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}" ]=
;
> then
>                         if [ -f "${UNPACKDIR}/defconfig" ]; then
> @@ -163,10 +159,8 @@ do_kernel_metadata() {
>                                 if [ $? -ne 0 ]; then
>                                         bbdebug 1 "detected SRC_URI or
> patched defconfig in UNPACKDIR. ${KBUILD_DEFCONFIG} copied over it"
>                                 fi
> -                               cp -f
> ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${UNPACKDIR}/defconfig
> -                       else
> -                               cp -f
> ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${UNPACKDIR}/defconfig
>                         fi
> +                       cp -f
> ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${UNPACKDIR}/defconfig
>                         in_tree_defconfig=3D"${UNPACKDIR}/defconfig"
>                 else
>                         bbfatal "A KBUILD_DEFCONFIG '${KBUILD_DEFCONFIG}'
> was specified, but not present in the source tree
> (${S}/arch/${ARCH}/configs/)"
> --
> 2.48.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210290):
> https://lists.openembedded.org/g/openembedded-core/message/210290
> Mute This Topic: https://lists.openembedded.org/mt/110821351/1050810
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

--000000000000d91970062ca3000b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 26, 2025 at 8:34=
=E2=80=AFAM Slawomir Stepien via <a href=3D"http://lists.openembedded.org">=
lists.openembedded.org</a> &lt;sst=3D<a href=3D"mailto:poczta.fm@lists.open=
embedded.org">poczta.fm@lists.openembedded.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">In both true/false cases, we =
will cp the file, so move the invocation<br>
after the if body.<br>
<br>
In addition, misleading comment has been removed.<br></blockquote><div><spa=
n class=3D"gmail_default" style=3D"font-size:small"></span></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">I&#39;m not sure why I di=
dn&#39;t remove the else when I was changing that logic to do a compare bef=
ore the copy, but I agree, we don&#39;t need the same line twice!</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">Acked-by: Bruce Ashfield &lt;<a hr=
ef=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt;</di=
v><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Slawomir Stepien &lt;<a href=3D"mailto:sst@poczta.fm" target=
=3D"_blank">sst@poczta.fm</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel-yocto.bbclass | 8 +-------<br>
=C2=A01 file changed, 1 insertion(+), 7 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe=
/kernel-yocto.bbclass<br>
index c45abf6ddc..cef6b9ec3f 100644<br>
--- a/meta/classes-recipe/kernel-yocto.bbclass<br>
+++ b/meta/classes-recipe/kernel-yocto.bbclass<br>
@@ -150,10 +150,6 @@ do_kernel_metadata() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # from the source tree, into a common location =
and normalized &quot;defconfig&quot; name,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # where the rest of the process will include an=
d incoroporate it into the build<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# If the fetcher has already placed a defconfig=
 in UNPACKDIR (from the SRC_URI),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# we don&#39;t overwrite it, but instead warn t=
he user that SRC_URI defconfigs take<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# precendence.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${KBUILD_DEFCONFIG}&quot; ]; then=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -f &quot;${S}/=
arch/${ARCH}/configs/${KBUILD_DEFCONFIG}&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if [ -f &quot;${UNPACKDIR}/defconfig&quot; ]; then<br>
@@ -163,10 +159,8 @@ do_kernel_metadata() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbdebug =
1 &quot;detected SRC_URI or patched defconfig in UNPACKDIR. ${KBUILD_DEFCON=
FIG} copied over it&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -f ${S}/arch/${ARCH}/configs/${KBU=
ILD_DEFCONFIG} ${UNPACKDIR}/defconfig<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -f ${S}/arch/${ARCH}/configs/${KBU=
ILD_DEFCONFIG} ${UNPACKDIR}/defconfig<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${UNPACKDIR}/=
defconfig<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 in_tree_defconfig=3D&quot;${UNPACKDIR}/defconfig&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bbfatal &quot;A KBUILD_DEFCONFIG &#39;${KBUILD_DEFCONFIG}&#39; w=
as specified, but not present in the source tree (${S}/arch/${ARCH}/configs=
/)&quot;<br>
-- <br>
2.48.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#210290): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/210290" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/210290</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110821351/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110821351/1050810</a><br>
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

--000000000000d91970062ca3000b--

