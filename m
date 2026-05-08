Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0C3CD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 14:40:30 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15290.1778251220023715954
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 07:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J7zj8NRb;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9358dd7f79so346186166b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:40:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778251218; cv=none;
        d=google.com; s=arc-20240605;
        b=VZMJgrWGMB54gE0QD4BGbUGUxpF6Zu5m4WyS2tMspXyR8PshRseym4NpEfwwU7bdWy
         qh5x0XaX1jyMbrVz01MhdnCp++U/0d18GxVjQVrxRJ7BqhTwyfzt1kupTXEJ+K2Gmd1V
         TwhZA7acK+02BaccVk7W2sOtgWaoHABbDTL+PbWmcFmoSkcvc3iUHE7YuO3vFKtbHrPK
         cYgGGCgnQuzGuzOz8vEf9UDu4S4AVtD/IMUsUaY9pZSIYTPc49zuVwl0IiuWKWw9Tpjk
         S0NJHkTFqJ9+mFpdLPmOilBxH0RZFUP9G59Hq/Lh/mgb8tu+g3ocC1/vC81kv+jlk4Nr
         GGdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+i5EFxUWaEyrA9xUOupvoLoB04UGYroNnyGmDqrHkVk=;
        fh=yRup0gQd4Qk9N6eUNj8kXkuKvdCTwWcKSeXZ5+LSHis=;
        b=GUhLXErfEcclEPhKeevexAVK+6ictZJ5Rblbfp295q9/xJr3Hc2n3hciZsvWVdvqkS
         9Dx269+wjZcYqXPBL2k1re9BhoYcmxrzHoKIrz+BEpSS3SNfyiMNiH78pajBRC2KXozL
         9I//G7daHYtG2eDKEyus99xEwPzylNrZtVGle7Dh4P2LAbkrBGtTHEZXUojkUo0JqUMt
         QnBnN1crhExB+34JYDYJbInfm7Xpvy6mOMBE10F9Y6eC6/ONpgrf5FCnTTMnmqkz2yTm
         HeCOuHPhFau8lJp17HRtzDcYWpgNgdLtKel6xDxyeOT3IUqzEgLZyrIacShiotyHBmzy
         BqLg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778251218; x=1778856018; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+i5EFxUWaEyrA9xUOupvoLoB04UGYroNnyGmDqrHkVk=;
        b=J7zj8NRbAIngRjpccBanKFlMsXHo/j5c8DRbw4SmEyVoE7OFjnYuXmLffbtX7tiKo+
         hJYAT5TdvlOVI518g9E607sZzYp2L9oZ8O4y8D1QHjJnmlNd4CnHuJ1bUGLWPOyS3m8J
         pNRkxdtCrzMoDyi2suZzUSF2NKhJg1wFWo5GDk3jZwXGUMxOsVcm00l9NTikGf3z14BU
         GauK+mNb2/rct6f7D8ItOgRhN7PA6NPduogZbgvOWd6tjZ100ymb4PrIfNn0ZK2/PVgx
         jZQ3oNOOOmd3K4NAPk3yohVGBkR6WEHZQNiwDqIHvYP83ujE7PT57FguVGTT075ElWwq
         n/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251218; x=1778856018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+i5EFxUWaEyrA9xUOupvoLoB04UGYroNnyGmDqrHkVk=;
        b=Vu/NJwzm51HsV360YBo2Mv9Z5J4dzrVROm7ht3D5Aj5Ytgc0xHPdEocpOjZLdeOFco
         CeF03ELCrqt42wbG8sSz3UGIV2HPZIN3CCmXpnRHcx47l+BWFPBRMTOF9UW4+SUKvd1g
         pi14S2F1Six7ciMh1nm9XkjW43CUUfePnkWZfq3PhscIUMF641i9mPWEjYEpl5tDfUyQ
         JMbxOMFn/TuMoiG3cvZLQnQ8Elk79AV+myGy5FKa2qCBS62EYwY1wQHZf52tzGayDG1K
         Z9n64RBaNNsyI+7Wz8s1pgH+C7QzlJh7LQzECSKZ7H2Kpzp0RkC7b17/VTTbicB4Ka0w
         qsWw==
X-Gm-Message-State: AOJu0Yzzt3PuTS93WYh+mmZrHPbPqgjuWFqLBac7Gn7brm1Ugy3ZSyXP
	HHE/1J7Mc2LoCm35tK/qLqs/pxdpCZzo/ZFdeQ8SdYzjzqG/ucUt3Vtpf4V2eXy0GSGPhOOGUaX
	Qdk3hIk5QzYavuspPk7AxHK1wEIazar46N2Mo
X-Gm-Gg: AeBDieviNZsGKhSSjEYJ6cPDCgrYn0zr/Ro79AFlTSMapV+TBAiFW3xGFMQmRcBkqKm
	1sJ7jdyqZ+Ti9ANNMu8VZLzN0i3WELpXpDOTg7Uy3OcyQMYNnE8GDa9N5coFYXrgIJP5+gGGMiO
	VK0J0ttSjfqJi/2lrrNF2vF17voijtJfeKfqlrzWTAJnss3jSBwQyNn65+uWaZki/LZyYy5FnIO
	m26Opb7H/Fzftaw5Dql73g+3VMQF6Y8aoaNuzXQN5TdaUVlBuof06bzZrbgGgp7CXXXl3b0E74K
	4YnwsLBl9q7gRwYGsVXI63NMRnagpDuyPGpynPHGAebVYkUjrLZOqoQJgWimFsIPXmZWPQ==
X-Received: by 2002:a17:907:9721:b0:bb9:1a36:f811 with SMTP id
 a640c23a62f3a-bc56ae29c6cmr781408566b.9.1778251217777; Fri, 08 May 2026
 07:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260508022311.3112415-1-changqing.li@windriver.com>
In-Reply-To: <20260508022311.3112415-1-changqing.li@windriver.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 8 May 2026 15:40:05 +0100
X-Gm-Features: AVHnY4J8plyCnfE7eKLik5Nuj0NcearM2R21wyU35QxwmGm1tuerCBTyoV5pUz8
Message-ID: <CANPvuRkujxfc8M9v1Ye+tB4wzQgoC-FSpRsTpQLuXOiLNidtQA@mail.gmail.com>
Subject: Re: [OE-core] [V2][PATCH] gstreamer1.0-plugins-bad: disble vulkan
 when x11/wayland not enabled
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000028384206514f6062"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 14:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236717

--00000000000028384206514f6062
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Changqing,

Changqing Li via lists.openembedded.org <changqing.li=3D
windriver.com@lists.openembedded.org> escreveu (sexta, 8/05/2026 =C3=A0(s)
03:23):

> When vulkan is enabled in DISTRO_FEATURES without x11 or wayland,
> do_configure will failed with error:
> gst-libs/gst/vulkan/meson.build:311:4: ERROR: Problem encountered: No
> Windowing system found. vulkansink will not work
>
> disable vulkan from PACKAGECONFIG when x11 and wayland is not enabled
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb             | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.28.2.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-bad_1.28.2.bb
> index cdf3a20dff..c7f081e25b 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.b=
b
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.b=
b
> @@ -21,10 +21,13 @@ DEPENDS +=3D "gstreamer1.0-plugins-base"
>
>  inherit gobject-introspection
>
> +PACKAGECONFIG_VULKAN ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'vulkan=
',
> d)}"
> +
>  PACKAGECONFIG ??=3D " \
>      ${GSTREAMER_ORC} \
> +    ${@'${PACKAGECONFIG_VULKAN}' if (bb.utils.filter('DISTRO_FEATURES',
> 'x11 wayland', d) !=3D '') else ''} \
>

that is a little more difficult to understand than usual, why don't we just
use the bb.utils.contains?

${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', '${
PACKAGECONFIG_VULKAN}', '', d)

It seems to me that this would work.

Or even the following, dropping the PACKAGECONFIG_VULKAN but then it loses
some readability again.

${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland',
'${@bb.utils.filter('DISTRO_FEATURES', 'vulkan', d)}', '', d)

Jose


>      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)=
}
> \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb vulkan x11', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'directfb x11', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)=
}
> \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
>      bz2 closedcaption curl dash dtls hls openssl sbc smoothstreaming \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236630):
> https://lists.openembedded.org/g/openembedded-core/message/236630
> Mute This Topic: https://lists.openembedded.org/mt/119208574/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000028384206514f6062
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi=C2=A0<span style=3D"color:rgb(0,0=
,0)">Changqing,</span></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">Changqing Li via <a href=3D"http://lists.openembedded=
.org" target=3D"_blank">lists.openembedded.org</a> &lt;<a href=3D"http://ch=
angqing.li" target=3D"_blank">changqing.li</a>=3D<a href=3D"mailto:windrive=
r.com@lists.openembedded.org" target=3D"_blank">windriver.com@lists.openemb=
edded.org</a>&gt; escreveu (sexta, 8/05/2026 =C3=A0(s) 03:23):<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">When vulkan is enabled in DI=
STRO_FEATURES without x11 or wayland,<br>
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
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-plugins-bad_1.28.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0=
-plugins-bad_1.28.2.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D"h=
ttp://gstreamer1.0-plugins-bad_1.28.2.bb" rel=3D"noreferrer" target=3D"_bla=
nk">gstreamer1.0-plugins-bad_1.28.2.bb</a><br>
index cdf3a20dff..c7f081e25b 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-bad_1.28.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugin=
s-bad_1.28.2.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-plug=
ins-bad_1.28.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugin=
s-bad_1.28.2.bb</a><br>
@@ -21,10 +21,13 @@ DEPENDS +=3D &quot;gstreamer1.0-plugins-base&quot;<br>
<br>
=C2=A0inherit gobject-introspection<br>
<br>
+PACKAGECONFIG_VULKAN ?=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#3=
9;, &#39;vulkan&#39;, d)}&quot;<br>
+<br>
=C2=A0PACKAGECONFIG ??=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${GSTREAMER_ORC} \<br>
+=C2=A0 =C2=A0 ${@&#39;${PACKAGECONFIG_VULKAN}&#39; if (bb.utils.filter(&#3=
9;DISTRO_FEATURES&#39;, &#39;x11 wayland&#39;, d) !=3D &#39;&#39;) else &#3=
9;&#39;} \<br></blockquote><div><br></div><div>that is a little more diffic=
ult to understand than usual, why don&#39;t we just use the bb.utils.contai=
ns?</div><div><br></div><div>${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;=
, &#39;x11 wayland&#39;, &#39;${<span style=3D"color:rgb(34,34,34)">PACKAGE=
CONFIG_VULKAN}</span>&#39;, &#39;&#39;, d)=C2=A0</div><div><br></div><div>I=
t seems to me that this would work.</div><div><br></div><div>Or even the fo=
llowing, dropping=C2=A0the PACKAGECONFIG_VULKAN=C2=A0but then it loses some=
 readability again.</div><div><br></div><div><div>${@bb.utils.contains(&#39=
;DISTRO_FEATURES&#39;, &#39;x11 wayland&#39;, &#39;${@bb.utils.filter(&#39;=
DISTRO_FEATURES&#39;, &#39;vulkan&#39;, d)}&#39;, &#39;&#39;, d)=C2=A0</div=
><div><br></div></div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bl=
uetooth&#39;, &#39;bluez&#39;, &#39;&#39;, d)} \<br>
-=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;directfb =
vulkan x11&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;directfb =
x11&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;wa=
yland&#39;, &#39;wayland&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;op=
engl&#39;, &#39;gl&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0bz2 closedcaption curl dash dtls hls openssl sbc smooth=
streaming \<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#236630): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/236630" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/236630</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119208574/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119208574/5052612</a><br>
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
</div>

--00000000000028384206514f6062--

