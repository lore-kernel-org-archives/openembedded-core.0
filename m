Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD57CD3442
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 08:41:33 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7480.1778143277326698257
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 01:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fzenyyhD;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bba0dde4f43so71887866b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 01:41:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778143276; cv=none;
        d=google.com; s=arc-20240605;
        b=YkPvVNLsANalo0GMXpghcynTRXm59VI7ukRMfkn5xGQVPDdbvmJepqViO3taA6vgru
         DcQaLTPo8x3kxvzaYG2yeen3f56MIDm7RgOZSG8sjz5l2qXX5eJhyG1dUYni/ckezMro
         b4Rojmhqdevx0s7f3k1p4UmfGhIZZaY/g6UYSjhDaAy/NCtLpZ5ezEVdeqH7t8CgvobF
         CtRNRzuH3j/xW8RYfPaqdJqKUBIOvfyk7DGOvFVCp8FpKnNxoGxkJZuBprFhfIhPQ6WM
         0ZJlJlygpN1zRr5Mm49/UKYkQj3bXJa+KB2J/2XExyohi1MFpzCVwrsHJGt9zlNTq/5F
         q0AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N27KamzdnxVyVYC9xzW8uDkhENu5Usl9Re6z5s+EbnQ=;
        fh=Uv02zkATCgn7o53lsNXolUGKtQvc6B50vI9sz2t8LT8=;
        b=GPecwHGHTmqgEUXXyUCNTr+O4KHHMdc1Z7gyl18ykZUbzx898KMWG+vofXEsaifYTo
         CrvXtvzhdizLGpgT5pKSE6C0Wl/Jv79DGCCYmT4Nm6Pyte+vZgIFQWIBXOIvOs4fZxNA
         TAxD/5vRUbkRuIDbpn6vBWSqjeIr5TuhTjgI8hOJdHeMBz4zK15ScxY7fhZdLa2Cu7vl
         0Q+JQ/he/eS5dDbjET5/cskcPBZXkjiNv2CkFsfEqaqz0D5VQQOXGtl8vXhhq6HYtu5e
         DmzP7O1pBsMgcr6r+1hq0vcPxWKP3skFSbCU2ZGSQfQj3VAxxmr2OFcEzTc2b/0MHhkc
         A4Mw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778143276; x=1778748076; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N27KamzdnxVyVYC9xzW8uDkhENu5Usl9Re6z5s+EbnQ=;
        b=fzenyyhDAgiZQZBCv7IHmrS/Vi7AvmffjYE4Su0U0+I+KAnR0HseuRoQcSEwh5DSH1
         Cavpa8Mzqe3uPwa1gmanb3sXHO29i33ZCZSgQh2fr/ib4jvTkdbHNvMI6RP1Wro0ab7i
         J8LrduZanKkxBYKMJP1+3a8g4idBfov8sRZKVNAITvYfKBhY6u7d4C0OdN9O61DNdRiK
         eu1p/tPzZJiuI8dvmjFKtorVrIWGXhDaqHoLM9d3Jr22Kjy5Zq9uQo0siIwfrb5iC7uy
         plkzFnG+SuShfbG8ASVBUb4SH1p7eoer0657wZGDpaaUMq2C8kATlhsIRaUAiBfxHAgH
         9QkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143276; x=1778748076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N27KamzdnxVyVYC9xzW8uDkhENu5Usl9Re6z5s+EbnQ=;
        b=S0rh2NzDyHrRXliPwap/0D/9sdNQhYNQA1imVEnLm2gNtq5YSSAIKu/u3oAbTRKLbg
         GoPpEICGqx6HTVhreJDuTbECl0stJm2UlOtmkE3qUD9upPtcK2f1fZSY7R1lvm4gv1sG
         cxgn0jT6u7O93u7wrLCKT4sGYuZfHMdnuBKKf4aLQcZB0pDzmw4LGYCX6299K/Rlp41P
         M9AKIy3znusRLJI9jLR5QqYC9SrYxc6uC1F7P50MnTywMQ3AJJvs96uXtPNtPeLgJsK0
         WvwH1zW7Lvg8WCaDXu0wwrCDVcT2vKhcEf16HhwBxjtyDesYGIwSt9+b75+xeYSTqAIn
         yWnA==
X-Gm-Message-State: AOJu0YzlxLjm2KqK8ObETNuOFxUh1VVFwDr56aPwAjUubgN5YVaLH8HH
	6AIm1tLYyNyma0YsQ9e+J/584jPwS18hb0uMA5gqM3MzYdmolb12W7B6vlH3z3hxXHLVy+hc43s
	IbqkPGGSDIRe7yRZUmoEil85bBFOZeQU=
X-Gm-Gg: AeBDies0/nuovcq5uMCYgZ2KNnSYcFTTnWZEau4OXHSU9XRE0lhnW9tBb4NBjTQJbcY
	E7OFDgKXAvmLVO5+RliCX//OsoOqN7zL0L2rAHpmzP+JjS+gTunFcikWpNr7Cd1SvH5UiP3b56B
	158PnrMezEh5sr+VHoIo2fJ7m/zTSoYGz5UNiUWTGKrOAoaaDkvWD4s+oSY/bYjd0PV4z9yVMCe
	xYLahOLzC5gYSo5n9iQ1NCJrDruKFtpdChJuxCYSyu7Uir+GWNKr/lCGzhRDGOFnnaCOPvf/yo6
	OX3Pz/wpwKBwagKx/GGta9a5/iRYKjWTKmoiU1ibwnpPR7NGGNNh1prxizeFaWfPrHIz5mF9L0L
	b+GC/LEmmRmnmKMI=
X-Received: by 2002:a17:906:6a26:b0:b9d:e301:20db with SMTP id
 a640c23a62f3a-bc56e316a92mr399556366b.25.1778143275168; Thu, 07 May 2026
 01:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260507051048.3943372-1-changqing.li@windriver.com>
In-Reply-To: <20260507051048.3943372-1-changqing.li@windriver.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 7 May 2026 09:40:56 +0100
X-Gm-Features: AVHnY4JjIJTARd1sDDidFO0bEWgVKvvupKk2N39c6QrLuBNfMaPe1UaEQOcqi_U
Message-ID: <CANPvuRk2881_Eb=On2az8XnXiJbtC8azT1LQ7GBSCMuZHvfPOQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-bad: disable vulkan when
 x11/wayland not enabled
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
Content-Type: multipart/alternative; boundary="00000000000046ba520651363e63"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 08:41:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236566

--00000000000046ba520651363e63
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Changqing Li via lists.openembedded.org <changqing.li=3D
windriver.com@lists.openembedded.org> escreveu (quinta, 7/05/2026 =C3=A0(s)
06:11):

> When vulkan is enabled in DISTRO_FEATURES without x11 or wayland,
> do_configure will failed with error:
> gst-libs/gst/vulkan/meson.build:311:4: ERROR: Problem encountered: No
> Windowing system found. vulkansink will not work
>
> disable vulkan from PACKAGECONFIG when x11 and wayland is not enabled
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb                | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.28.2.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.28.2.bb
> index cdf3a20dff..51f51761f9 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.b=
b
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.b=
b
> @@ -32,6 +32,8 @@ PACKAGECONFIG ??=3D " \
>      ${@bb.utils.contains('TUNE_FEATURES', 'mx32', '', 'rsvg', d)} \
>  "
>
> +PACKAGECONFIG:remove =3D "${@'vulkan' if
> (bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d) =3D=3D '') else ''}=
"
> +
>

Using the 'remove' override on the core should be avoided because it's
impossible to revert the changes on other layers.
In my opinion, it would be better to use an auxiliary variable to define
when vulkan is enabled, and this could be modified
if necessary in other layers.

PACKAGECONFIG_VULKAN ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11
wayland', 'vulkan', '', d)"
PACKAGECONFIG ??=3D " \
    ${PACKAGECONFIG_VULKAN}
"

Jose

 PACKAGECONFIG[analytics]       =3D
> "-Danalyticsoverlay=3Denabled,-Danalyticsoverlay=3Ddisabled
>  PACKAGECONFIG[aom]             =3D "-Daom=3Denabled,-Daom=3Ddisabled,aom=
"
>  PACKAGECONFIG[assrender]       =3D
> "-Dassrender=3Denabled,-Dassrender=3Ddisabled,libass"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236555):
> https://lists.openembedded.org/g/openembedded-core/message/236555
> Mute This Topic: https://lists.openembedded.org/mt/119192696/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000046ba520651363e63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Changqing Li vi=
a <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;=
<a href=3D"http://changqing.li">changqing.li</a>=3D<a href=3D"mailto:windri=
ver.com@lists.openembedded.org">windriver.com@lists.openembedded.org</a>&gt=
; escreveu (quinta, 7/05/2026 =C3=A0(s) 06:11):<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">When vulkan is enabled in DISTRO_FEATURES =
without x11 or wayland,<br>
do_configure will failed with error:<br>
gst-libs/gst/vulkan/meson.build:311:4: ERROR: Problem encountered: No Windo=
wing system found. vulkansink will not work<br>
<br>
disable vulkan from PACKAGECONFIG when x11 and wayland is not enabled<br>
<br>
Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../gstreamer/<a href=3D"http://gstreamer1.0-plugins-bad_1.28.2.bb" r=
el=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-bad_1.28.2.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-plugins-bad_1.28.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0=
-plugins-bad_1.28.2.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D"h=
ttp://gstreamer1.0-plugins-bad_1.28.2.bb" rel=3D"noreferrer" target=3D"_bla=
nk">gstreamer1.0-plugins-bad_1.28.2.bb</a><br>
index cdf3a20dff..51f51761f9 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-bad_1.28.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugin=
s-bad_1.28.2.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-bad_1.28.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugin=
s-bad_1.28.2.bb</a><br>
@@ -32,6 +32,8 @@ PACKAGECONFIG ??=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;mx32=
&#39;, &#39;&#39;, &#39;rsvg&#39;, d)} \<br>
=C2=A0&quot;<br>
<br>
+PACKAGECONFIG:remove =3D &quot;${@&#39;vulkan&#39; if (bb.utils.filter(&#3=
9;DISTRO_FEATURES&#39;, &#39;x11 wayland&#39;, d) =3D=3D &#39;&#39;) else &=
#39;&#39;}&quot;<br>
+<br></blockquote><div><br></div><div>Using the &#39;remove&#39; override o=
n the core should be avoided because it&#39;s impossible to revert the chan=
ges on other layers.</div><div>In my opinion, it would be better to use an =
auxiliary variable to define when vulkan=C2=A0is enabled, and this could be=
 modified</div><div>if necessary in other layers.<br><br></div><div>PACKAGE=
CONFIG_VULKAN ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#=
39;x11 wayland&#39;, &#39;vulkan&#39;, &#39;&#39;, d)&quot;</div><div>PACKA=
GECONFIG ??=3D &quot; \<br>=C2=A0 =C2=A0 ${PACKAGECONFIG_VULKAN}</div><div>=
&quot;</div><div><br></div><div>Jose<br><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
=C2=A0PACKAGECONFIG[analytics]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;-Danalyt=
icsoverlay=3Denabled,-Danalyticsoverlay=3Ddisabled<br>
=C2=A0PACKAGECONFIG[aom]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 &quot;-Daom=3Denabled,-Daom=3Ddisabled,aom&quot;<br>
=C2=A0PACKAGECONFIG[assrender]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;-Dassren=
der=3Denabled,-Dassrender=3Ddisabled,libass&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#236555): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/236555" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/236555</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119192696/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119192696/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--00000000000046ba520651363e63--

