Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBB5EB8FB0
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 11:23:59 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web11.10518.1694085833546129746
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 04:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YHGj/z6X;
 spf=pass (domain: gmail.com, ip: 209.85.222.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7a50a1d1246so297960241.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 04:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694085832; x=1694690632; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vFW9SQ/R3WDguFyCRgGRZ/tmSMZUuugLRxRijnoCRsk=;
        b=YHGj/z6XKI33FJqb2ww+hND4CwDVB4P2Me2Ty7yrYmtAFeddG2CWZidu1JEOx6HKVC
         1QbN4BxErnQEtxRwU2iQkEzm0UE2iPr/Sjs8+o1W054xpkg1JYo0gE94X8W2Kp9P8xzQ
         IrhH19eLFuUWG3M52luAVMymULirpUGssYIoPEdUoKp/7H7j6cMUhfIfL8p122Ru3RAQ
         tzMB2m9SGOkScAGKZZJ0u3LyHMlWrBE/6Yqbf3YiihnyviEh2VFgjtUBTOtuE9ue5HbC
         fvqv3qxfKCEi92Qd6EpWsrDqccwj3JCt7EeqYiCW2VL12n++xkinRKCeEsTXM+gnoHPw
         hJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694085832; x=1694690632;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vFW9SQ/R3WDguFyCRgGRZ/tmSMZUuugLRxRijnoCRsk=;
        b=OHpPC5yRdgVKg/jRSfLTQjyyalNzi3umssQ4qG1wDtsJ9g3PoSj5XPJz4aad9p3kXi
         z07V0QHdX0SGXutg5Hkd48AG1+tvKvfLu8+t8tWdqsQtIifsdZ7uSGa194oATgwFzQ1C
         0H/ioaKuil0KxkAysuWvumfaljaxhgBOnxm3vJz8EbA72dJ1Pe+SSEpePZEgGwRyoeD3
         FCqjCELCyATcSiDkIENgNxv7E4TI8zqAT5h1EGZRFCoYOVzcAVvDbz4VCkQAO5dz9Jct
         4k3/gJsNo3ah366ospwJRKH1kDBzd2CGdxgi8RqygjgTWGBTPqrzpfeGF274+BKsCjyO
         P5Tw==
X-Gm-Message-State: AOJu0YwHFVqTYLyG/TIjH+UgiQAqOUdXVl+O5ufv1TSjgLbAIyf/uCPJ
	yVqdxoeLqMd71dcYvbUiCzI/yf+PlEtEY4hwx7kowUDL2bQ5uyKr
X-Google-Smtp-Source: AGHT+IFAe5k1a+hGIWjtVRj5HqYb8ukg9bM9Qz7EB8s3FuaEs1B5IMxCLaCvBrDeTzA25cyghKwVwLNtnEJHNU0o+a0=
X-Received: by 2002:a05:6102:4b0:b0:44d:4d7f:bcc2 with SMTP id
 r16-20020a05610204b000b0044d4d7fbcc2mr6206755vsa.12.1694085832147; Thu, 07
 Sep 2023 04:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230906151648.313352-1-ross.burton@arm.com> <20230906151648.313352-2-ross.burton@arm.com>
 <CANPvuRkC-BQPD2TOZXtj_Xq96FHLeX60bqd3VwpxuC=KjyUYBA@mail.gmail.com>
In-Reply-To: <CANPvuRkC-BQPD2TOZXtj_Xq96FHLeX60bqd3VwpxuC=KjyUYBA@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 7 Sep 2023 12:23:41 +0100
Message-ID: <CANPvuRmebk+SvF6MXD=J1RujDoOW8oj80pB9nq8Fi+9PNagbuQ@mail.gmail.com>
Subject: Fwd: [OE-core] [PATCH 2/2] scripts/oe-find-native-sysroot: use bitbake-getvar
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003e88430604c318d2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 11:23:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187378

--0000000000003e88430604c318d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I have replayed directly to Ross so forward to the list.

I also have tested it locally and if there are some warnings generated they
will be captured as well
breaking the OECORE_NATIVE_SYSROOT content, so the -q is required.

Jose

---------- Forwarded message ---------
De: Jose Quaresma <quaresma.jose@gmail.com>
Date: quarta, 6/09/2023 =C3=A0(s) 17:37
Subject: Re: [OE-core] [PATCH 2/2] scripts/oe-find-native-sysroot: use
bitbake-getvar
To: Ross Burton <ross.burton@arm.com>




Ross Burton <ross.burton@arm.com> escreveu no dia quarta, 6/09/2023 =C3=A0(=
s)
16:16:

> From: Ross Burton <ross.burton@arm.com>
>
> Instead of bitbake and grep, just use bitbake-getvar.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  scripts/oe-find-native-sysroot | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
>
> diff --git a/scripts/oe-find-native-sysroot
> b/scripts/oe-find-native-sysroot
> index 5146bbf9999..6228efcbeec 100755
> --- a/scripts/oe-find-native-sysroot
> +++ b/scripts/oe-find-native-sysroot
> @@ -36,20 +36,9 @@ if [ "$1" =3D '--help' -o "$1" =3D '-h' -o $# -ne 1 ] =
; then
>  fi
>
>  # Global vars
> -BITBAKE_E=3D""
>  set_oe_native_sysroot(){
> -    echo "Running bitbake -e $1"
> -    BITBAKE_E=3D"`bitbake -e $1`"
> -    OECORE_NATIVE_SYSROOT=3D`echo "$BITBAKE_E" | grep ^STAGING_DIR_NATIV=
E=3D
> | cut -d '"' -f2`
> -
> -    if [ "x$OECORE_NATIVE_SYSROOT" =3D "x" ]; then
> -        # This indicates that there was an error running bitbake -e that
> -        # the user needs to be informed of
> -        echo "There was an error running bitbake to determine
> STAGING_DIR_NATIVE"
> -        echo "Here is the output from bitbake -e $1"
> -        echo $BITBAKE_E
> -        exit 1
> -    fi
> +    echo "Getting sysroot..."
> +    OECORE_NATIVE_SYSROOT=3D$(bitbake-getvar -r $1 --value
> STAGING_DIR_NATIVE)
>

Maybe you should use --quite to silent the logs.

Jose


>  }
>
>  if [ "x$OECORE_NATIVE_SYSROOT" =3D "x" ]; then
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187321):
> https://lists.openembedded.org/g/openembedded-core/message/187321
> Mute This Topic: https://lists.openembedded.org/mt/101194938/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000003e88430604c318d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, I have replayed directly to Ross so forward to the =
list.<br><br>I also have tested it locally and if there are some warnings g=
enerated they will be captured=C2=A0as well<div>breaking the OECORE_NATIVE_=
SYSROOT content, so the -q is required.=C2=A0</div><div><br></div><div>Jose=
<br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">--=
-------- Forwarded message ---------<br>De: <strong class=3D"gmail_senderna=
me" dir=3D"auto">Jose Quaresma</strong> <span dir=3D"auto">&lt;<a href=3D"m=
ailto:quaresma.jose@gmail.com">quaresma.jose@gmail.com</a>&gt;</span><br>Da=
te: quarta, 6/09/2023 =C3=A0(s) 17:37<br>Subject: Re: [OE-core] [PATCH 2/2]=
 scripts/oe-find-native-sysroot: use bitbake-getvar<br>To: Ross Burton &lt;=
<a href=3D"mailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt;<br></div=
><br><br><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">Ross Burton &lt;<a href=3D"m=
ailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt; es=
creveu no dia quarta, 6/09/2023 =C3=A0(s) 16:16:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Ross Burton &lt;<a href=3D"mailto:ro=
ss.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
<br>
Instead of bitbake and grep, just use bitbake-getvar.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0scripts/oe-find-native-sysroot | 15 ++-------------<br>
=C2=A01 file changed, 2 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/scripts/oe-find-native-sysroot b/scripts/oe-find-native-sysroo=
t<br>
index 5146bbf9999..6228efcbeec 100755<br>
--- a/scripts/oe-find-native-sysroot<br>
+++ b/scripts/oe-find-native-sysroot<br>
@@ -36,20 +36,9 @@ if [ &quot;$1&quot; =3D &#39;--help&#39; -o &quot;$1&quo=
t; =3D &#39;-h&#39; -o $# -ne 1 ] ; then<br>
=C2=A0fi<br>
<br>
=C2=A0# Global vars<br>
-BITBAKE_E=3D&quot;&quot;<br>
=C2=A0set_oe_native_sysroot(){<br>
-=C2=A0 =C2=A0 echo &quot;Running bitbake -e $1&quot;<br>
-=C2=A0 =C2=A0 BITBAKE_E=3D&quot;`bitbake -e $1`&quot;<br>
-=C2=A0 =C2=A0 OECORE_NATIVE_SYSROOT=3D`echo &quot;$BITBAKE_E&quot; | grep =
^STAGING_DIR_NATIVE=3D | cut -d &#39;&quot;&#39; -f2`<br>
-<br>
-=C2=A0 =C2=A0 if [ &quot;x$OECORE_NATIVE_SYSROOT&quot; =3D &quot;x&quot; ]=
; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # This indicates that there was an error runni=
ng bitbake -e that<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # the user needs to be informed of<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;There was an error running bitbake =
to determine STAGING_DIR_NATIVE&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Here is the output from bitbake -e =
$1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo $BITBAKE_E<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
-=C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 echo &quot;Getting sysroot...&quot;<br>
+=C2=A0 =C2=A0 OECORE_NATIVE_SYSROOT=3D$(bitbake-getvar -r $1 --value STAGI=
NG_DIR_NATIVE)<br></blockquote><div><br></div><div>Maybe you should=C2=A0us=
e --quite to silent the logs.<br><br>Jose<br>=C2=A0<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
=C2=A0}<br>
<br>
=C2=A0if [ &quot;x$OECORE_NATIVE_SYSROOT&quot; =3D &quot;x&quot; ]; then<br=
>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#187321): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/187321" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/187321</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101194938/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101194938/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>
</div><br clear=3D"all"><div><br></div><span class=3D"gmail_signature_prefi=
x">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quare=
sma</div></div></div></div></div>

--0000000000003e88430604c318d2--

