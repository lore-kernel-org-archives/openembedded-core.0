Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68784C369D5
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 22:53:30 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.1730.1745535202245825656
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 15:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NkafMKGM;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-60219a77334so854712eaf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 15:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745535201; x=1746140001; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wg3Luk6QSTMWaHFYpVKwZQXjo+91M7dLgi66dhwdJXI=;
        b=NkafMKGMz1Pam9XAhD9hWgByLWlXI7H70Ot0QtcM40Os13BbR+Jnb/DTF1kYmXIPCu
         ZHL/hpfINmVJYOq4FEX4JCSQJY0gGoa5FG1h4KbhgBFJmxR/knJbld+PFQRQNVZG4IZB
         TJ2ogKrD/5GSa67vi0Ew6GAxuoZoPMvyLdyzEjVcJYPZHhMoXihC+OOB3+/bjkHSsVPM
         KX8K/0DBXbLo+05IQBgITaapitzHDwfx1vJHGPrzlX7jW/rJDax3R8xmJ4i2C7jGh67J
         8nsKy6pKpl1l5vzGpS+GAzfBBGcTjph2V8OOMOU3sOFZ91njAajUmgLkt9yvJFmGEqWc
         djfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745535201; x=1746140001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wg3Luk6QSTMWaHFYpVKwZQXjo+91M7dLgi66dhwdJXI=;
        b=pDvl8v3dO5z+VOf1avrfCa3xni4MHCzxcmG0gkMGNN+B1jByyswBo3xyJY9paNCGPV
         iEDl8kMDJDVHilMlI31RofhqlbQsbzjz3MfQRQECRiQQ12qIcOQAlTcVgpYM2+gMlYuS
         PoWMRPnPhxIKWDc54BUvJUy6o+YEFgM0qroEzpmvcCyTis6m3tTPzK3c3I6AvZGJMBXu
         y+yxKx/zEvVVfnuTwX/m+kBP6pzMA34c6Btf4BkTdCevqiDdKwt15+Q9LQJuMGAR+QCF
         CnU5+t2EkVF3JM4gcaeVtW7fM81GgIrJPZJczZ91VgmK0hFOokjZ5rXk1+6hcz+OZCiI
         D/iw==
X-Gm-Message-State: AOJu0YwbNBrlWLKTglQHnVY/pFpIeSb/1o4n8Vd7R+aYdbvam+JaZciA
	5tMpLK5L60eiVf/gOAeK74T9YolFa8+hiz0pJndf+DbwOwMGX2gDwEVbNPBwUlyxgQEfqZ59Zs7
	vmmDsoJ3GVenmvHq50vAaqL4prYc=
X-Gm-Gg: ASbGncseX158FcffBR57vDgzgdxJrHA8pgi3f/OjRhMmJ1HrvAZ66MoSKKxzWaEloWC
	RnNgKXFrucBhoHLfb99sQm6zsxAjrDLi2BuOFjXpRDSPw0HnECb+uK703rd6K94yZm+xzDeDCcd
	J40O5lgL34ki4B7AL0a2hmJA0P2pMaQxIT9+cFDbRtOU72iMvmVlBM2Fac
X-Google-Smtp-Source: AGHT+IFQzi29yuqXZIMoPNJ2/l2Mg8d6t322qYNozVjv9aj3jPlItcwqJ6D0SUctQGEtwuyS0ZAbKLMnrCpSmOC5+ug=
X-Received: by 2002:a05:6820:883:b0:603:ffc3:60f6 with SMTP id
 006d021491bc7-60652a47625mr19836eaf.1.1745535201262; Thu, 24 Apr 2025
 15:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <18395F03D66275F9.31387@lists.openembedded.org> <W7S8VS.FQ12W4BJV1TZ1@t-online.de>
In-Reply-To: <W7S8VS.FQ12W4BJV1TZ1@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Apr 2025 15:53:09 -0700
X-Gm-Features: ATxdqUGBOg33XSXbj8yWHE9dZXIZeZnxy7mPzGy0X55sZrthhK7W-uawjEBBiKo
Message-ID: <CAMKF1so=LdPAFO3cuYV_xsOHtqfNAXXmxGzBCgEKScuHS9sSgA@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] default-providers.inc: add entries for virtual/libsdl2
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009d40a206338e1506"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 22:53:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215408

--0000000000009d40a206338e1506
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 2:40=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> v2: add missing -native
>

How about nativesdk

>
> On Thu, Apr 24 2025 at 23:39:51 +02:00:00, Markus Volk <f_l_k@t-online.de=
>
> wrote:
>
> virtual/libsdl2 can be provided by 'libsdl2' and 'libsdl2-compat' where
> the latter is a replacement for libsdl2 that uses libsdl3 behind the scen=
es
> and should be favored if applicable. Signed-off-by: Markus Volk <
> f_l_k@t-online.de> --- meta/conf/distro/include/default-providers.inc | 4
> ++++ 1 file changed, 4 insertions(+) diff --git
> a/meta/conf/distro/include/default-providers.inc
> b/meta/conf/distro/include/default-providers.inc index
> cebd0400f4..ee91af8796 100644 ---
> a/meta/conf/distro/include/default-providers.inc +++
> b/meta/conf/distro/include/default-providers.inc @@ -4,6 +4,8 @@
> BB_RECIPE_VIRTUAL_PROVIDERS =3D "virtual/cross-cc virtual/cross-c++
> virtual/cross-binutils virtual/nativesdk-cross-cc
> virtual/nativesdk-cross-c++ virtual/nativesdk-cross-binutils"
> PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
> PREFERRED_PROVIDER_virtual/xserver-xf86 ?=3D "xserver-xorg"
> +PREFERRED_PROVIDER_virtual/libsdl2 ?=3D "libsdl2"
> +PREFERRED_PROVIDER_virtual/libsdl2-native ?=3D "libsdl2-native"
> PREFERRED_PROVIDER_virtual/egl ?=3D "mesa" PREFERRED_PROVIDER_virtual/lib=
gl
> ?=3D "mesa" PREFERRED_PROVIDER_virtual/libglx ?=3D "mesa" @@ -32,6 +34,7 =
@@
> VIRTUAL-RUNTIME_base-utils-hwclock ?=3D "busybox-hwclock"
> VIRTUAL-RUNTIME_base-utils-syslog ?=3D "busybox-syslog"
> VIRTUAL-RUNTIME_keymaps ?=3D "keymaps" VIRTUAL-RUNTIME_dbus ?=3D "dbus"
> +VIRTUAL-RUNTIME_libsdl2 ?=3D "libsdl2" # # Default recipe providers @@ -=
62,5
> +65,6 @@ PREFERRED_PROVIDER_pkgconfig-native ?=3D "pkgconfig-native"
> PREFERRED_RPROVIDER_initd-functions ?=3D "initscripts"
> PREFERRED_PROVIDER_nativesdk-mesa ?=3D "nativesdk-mesa"
> +PREFERRED_PROVIDER_virtual/nativesdk-libsdl2 ?=3D "nativesdk-libsdl2"
> PREFERRED_RPROVIDER_virtual-x-terminal-emulator ?=3D "rxvt-unicode"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215407):
> https://lists.openembedded.org/g/openembedded-core/message/215407
> Mute This Topic: https://lists.openembedded.org/mt/112441574/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009d40a206338e1506
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 24, 2025 at 2:40=E2=80=AFPM=
 Markus Volk via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.openembedded.org=
">t-online.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div id=3D"m_6904681702273415015geary-body" dir=3D"auto"><=
div>v2: add missing -native</div></div></blockquote><div dir=3D"auto"><br><=
/div><div dir=3D"auto">How about nativesdk=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div id=3D"m_6904681702273415015geary-body" dir=3D"auto"><div dir=
=3D"auto"></div></div><div id=3D"m_6904681702273415015geary-quote" dir=3D"a=
uto"><br>On Thu, Apr 24 2025 at 23:39:51 +02:00:00, Markus Volk &lt;<a href=
=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&gt; w=
rote:<br><blockquote type=3D"cite"><div style=3D"white-space:break-spaces">=
virtual/libsdl2 can be provided by &#39;libsdl2&#39; and &#39;libsdl2-compa=
t&#39; where the latter
is a replacement for libsdl2 that uses libsdl3 behind the scenes and should
be favored if applicable.

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;
---
 meta/conf/distro/include/default-providers.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/dis=
tro/include/default-providers.inc
index cebd0400f4..ee91af8796 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -4,6 +4,8 @@
 BB_RECIPE_VIRTUAL_PROVIDERS =3D &quot;virtual/cross-cc virtual/cross-c++ v=
irtual/cross-binutils virtual/nativesdk-cross-cc virtual/nativesdk-cross-c+=
+ virtual/nativesdk-cross-binutils&quot;
 PREFERRED_PROVIDER_virtual/xserver ?=3D &quot;xserver-xorg&quot;
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?=3D &quot;xserver-xorg&quot;
+PREFERRED_PROVIDER_virtual/libsdl2 ?=3D &quot;libsdl2&quot;
+PREFERRED_PROVIDER_virtual/libsdl2-native ?=3D &quot;libsdl2-native&quot;
 PREFERRED_PROVIDER_virtual/egl ?=3D &quot;mesa&quot;
 PREFERRED_PROVIDER_virtual/libgl ?=3D &quot;mesa&quot;
 PREFERRED_PROVIDER_virtual/libglx ?=3D &quot;mesa&quot;
@@ -32,6 +34,7 @@ VIRTUAL-RUNTIME_base-utils-hwclock ?=3D &quot;busybox-hwc=
lock&quot;
 VIRTUAL-RUNTIME_base-utils-syslog ?=3D &quot;busybox-syslog&quot;
 VIRTUAL-RUNTIME_keymaps ?=3D &quot;keymaps&quot;
 VIRTUAL-RUNTIME_dbus ?=3D &quot;dbus&quot;
+VIRTUAL-RUNTIME_libsdl2 ?=3D &quot;libsdl2&quot;
=20
 #
 # Default recipe providers
@@ -62,5 +65,6 @@ PREFERRED_PROVIDER_pkgconfig-native ?=3D &quot;pkgconfig-=
native&quot;
 PREFERRED_RPROVIDER_initd-functions ?=3D &quot;initscripts&quot;
=20
 PREFERRED_PROVIDER_nativesdk-mesa ?=3D &quot;nativesdk-mesa&quot;
+PREFERRED_PROVIDER_virtual/nativesdk-libsdl2 ?=3D &quot;nativesdk-libsdl2&=
quot;
=20
 PREFERRED_RPROVIDER_virtual-x-terminal-emulator ?=3D &quot;rxvt-unicode&qu=
ot;
<div>--=20
</div>2.49.0

</div><div style=3D"white-space:break-spaces">


</div></blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#215407): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/215407" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/215407</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112441574/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112441574/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000009d40a206338e1506--

