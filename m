Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCFA0D2FEE1
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 20:41:42 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22146.1769546494407539355
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 12:41:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eGx3s9ki;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso1781575e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 12:41:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769546493; cv=none;
        d=google.com; s=arc-20240605;
        b=VOoawQX69lGycU2dmz9X+LfsPBzpavb6gBnvBPUiW2MiDsRa/SRplxbuf7rjoSH8y9
         N5qNLKLFUUxJOwfZ2sxJl1+al/1hscb9MYaJUTNJydQMRUCqRQCHrOtVlp/aXq2bUUHk
         HQF4bDOJsQ9XS+gBalRIrkC5KvEiVyKw5JJzDJb3mPbu0AQD13KHxICdf3ci6kcVkyZy
         7RwbfoWSviYQrmy6Ids/F1d/ybhC4Xl0bpEZkYEjgJMG5Ms1T5Le6ZGeX8JQWvJsQHxw
         9pRJ+vo8Ys2/mp8tYrq1gvxRidiDbarJqL8gTo74JH2doXb1x6Lfqxo7yrh4zan8rbxz
         Y4BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3nfyPlCglbUue9iQkP5q4fIPWqMcWnDDffstrItk9DQ=;
        fh=2xcRdSrxlcJCAhyqdTeDZp4r2MPP2xGLphvyZhgylH0=;
        b=QpuFZYJpRgt3+EwE/lqhF2UqF8ssRsrME2RotHW0Hn8+BAVeq5dHWl8LY1ME0GRYy5
         vRuJrk4A3ZnXeX8hLLICbvbQWVaW+dMAi/bX59sxkhgqAy4yyaD8yuyD7ACLAIB56EUA
         fkk0+gGhKc0ClXastg+BSejyvclYphpifHHQ0pu5ey7pJTPlx2eHceIb24Ow3YPUPMUw
         G+K1j+JyhvgfgOvjdTR3tij27I9DrIidEIZu1BXsOXk0X0wlH86FHzB4CvG8ofe2hrRE
         5I5ULvdF+Ga6GZpsegbIN11Vnyy6NMC+CbXbOaN6gkjXnxe6rwbXxTJNHTtFaaS0NGko
         vWfA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769546493; x=1770151293; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3nfyPlCglbUue9iQkP5q4fIPWqMcWnDDffstrItk9DQ=;
        b=eGx3s9ki7trmMpjkRgCqHFvgjfgztOSo5e5zKV3gxYWgekIrgE2BNBvvfU6Ef9UaCK
         V9zDoTFA12C/jgxfuiH8GOTLWx7l77EQjIbcuAx5Zkkf4dgDqbd1xcRFGfcgPyIP2S1Q
         CP9Yprv2vNGq3zFdDJUTlFSWf2wuN4hiZV6SQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769546493; x=1770151293;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nfyPlCglbUue9iQkP5q4fIPWqMcWnDDffstrItk9DQ=;
        b=CXGrObiPfhk52ngmNHpuZ9VQ9f0peU4LvoSDwekjuOYJ7f9R/2ZutOaMEllv+hI9BQ
         Ofx6EatxUL8WUNHhHqcJHTbTKnxCP2FkzixhvBDwFkQDSs98nodIMM82XU8G56szQFQB
         fjWaphWsyP7KD7alBuV7hiffqXrl2lurjz1ALYlmpgbHNpaNnNamFv9wKe3W0dUzWb2f
         6iHtyVOxW6aiW5Dw5+IQ4SigoVoV76KQWn3b9i5riJU6LH778hEJKA8f5Wbt0FIo59jo
         BnN0Krcj9q20fMtB/ZNqKIRLd4EnnZ/pj/PVsGR5pA2p4Zkll2qG4Yrp1UkshzUOtknj
         lCsA==
X-Gm-Message-State: AOJu0Yx0XUkFnu03hNTZFNKWeBqd/KHczwz9ibj6a7nnr415L/Iif15P
	RCjcUxI4JoKUnNO+U3yhGxnVUxsUJ5VPoKrRJm6WBWi5obdKbxm1TYLtK3TITk4f1KzFO1AQDac
	qykFGL27sd5olUznuJXkCuz2hFMxSmbtakpvQFDSsug==
X-Gm-Gg: AZuq6aLyZBvl8tEmsmznrkEpadDSnyBxb5rgL/zyOst242lur+yfY9T/aTmukFOm64a
	H1oNrzpW2p3IRW4pzLZu5TGU2BMC+P3apnHDftvO1rISxq69QY/hHM/RokYO5E80xYvmyU2//dJ
	uXTsY0mPIzqMUdyBzvzNeuk1mhsfUhBX1S4CTXqRGz08QeItiia3YeKLfX+oKoCnxFIJtCDhcW4
	LruDfRz3CjUaaJSC0gxlg3QmHBx9GlABHNXjFzVuV4CWwnSwj68IoCD6mWe7svbbcACUxnEAQ+f
	Vahh8ZpZd8WVLPQsEEN/SRGAwPNv
X-Received: by 2002:a05:600c:620b:b0:47e:e981:78b4 with SMTP id
 5b1f17b1804b1-48069e79968mr36878005e9.12.1769546492669; Tue, 27 Jan 2026
 12:41:32 -0800 (PST)
MIME-Version: 1.0
References: <20260127203051.14706-1-reatmon@ti.com>
In-Reply-To: <20260127203051.14706-1-reatmon@ti.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 27 Jan 2026 21:41:06 +0100
X-Gm-Features: AZwV_Qjl6adH22XwNzu4thtpoLczm1kN1HSIeLGD6JtrlyA3pGtz_ptN69KCiPM
Message-ID: <CAMSfU+7L5S2zjkC2DhA_jOYYrLCFN6W7nTkCc6aGg1DRYvGUKA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] uboot: Deprecate legacy UBOOT_CONFIG flow
To: reatmon@ti.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001c01a8064964a663"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 20:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230066

--0000000000001c01a8064964a663
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 27 janv. 2026 =C3=A0 21:31, Ryan Eatmon via lists.openembedded.org
<reatmon=3Dti.com@lists.openembedded.org> a =C3=A9crit :

> Mark the legacy flow for settings the UBOOT_CONFIG options in a comma
> separated list.  This code will still work through wrynose, but will be
> removed once wrynose is released.
>
> Add warnings to point people in the right direction for fixing their
> configs:
>
> WARNING: Legacy use of UBOOT_CONFIG[foo] =3D
> "foo_config,foo_image,foo_binary" is deprecated.  Please move to using
> UBOOT_CONFIG_* variables:
> WARNING:     UBOOT_CONFIG[foo] =3D "foo_config"
> WARNING:     UBOOT_CONFIG_IMAGE_FSTYPES[foo] =3D "foo_image"
> WARNING:     UBOOT_CONFIG_BINARY[foo] =3D "foo_binary"
> WARNING: Legacy use of UBOOT_CONFIG[bar] =3D "bar_config,bar_image" is
> deprecated.  Please move to using UBOOT_CONFIG_* variables:
> WARNING:     UBOOT_CONFIG[bar] =3D "bar_config"
> WARNING:     UBOOT_CONFIG_IMAGE_FSTYPES[bar] =3D "bar_image"
> WARNING: Legacy use of UBOOT_CONFIG[bing] =3D "bing_config,,bing_binary" =
is
> deprecated.  Please move to using UBOOT_CONFIG_* variables:
> WARNING:     UBOOT_CONFIG[bing] =3D "bing_config"
> WARNING:     UBOOT_CONFIG_BINARY[bing] =3D "bing_binary"
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta/classes-recipe/uboot-config.bbclass | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/classes-recipe/uboot-config.bbclass
> b/meta/classes-recipe/uboot-config.bbclass
> index 823a66157a..87ec908000 100644
> --- a/meta/classes-recipe/uboot-config.bbclass
> +++ b/meta/classes-recipe/uboot-config.bbclass
> @@ -27,6 +27,9 @@
>  # deemed to be limiting in terms of expanding support to more and more
> knobs
>  # that might need to be turned to customize a config build.
>  #
> +# NOTE: Suport for this legacy flow is now depcrated and will be removed
> from
>

s/depcrated/deprecated/

This might be useful, I grep through code for this word sometimes.


> +#       master after the wrynose LTS release.
> +#
>  # UBOOT_MACHINE =3D ""
>  # UBOOT_CONFIG ??=3D <default>
>  # UBOOT_CONFIG[foo] =3D "foo_config,images,binary"
> @@ -181,14 +184,19 @@ python () {
>                  if config =3D=3D f:
>                      found =3D True
>                      items =3D v.split(',')
> +                    if items[0] and len(items) > 1:
> +                        bb.warn('Legacy use of UBOOT_CONFIG[%s] =3D "%s"=
 is
> deprecated.  Please move to using UBOOT_CONFIG_* variables:' % (f, v))
> +                        bb.warn('    UBOOT_CONFIG[%s] =3D "%s"' % (f,
> items[0]))
>                      if items[0] and len(items) > 3:
>                          raise bb.parse.SkipRecipe('Only
> config,images,binary can be specified!')
>                      d.appendVar('UBOOT_MACHINE', ' ' + items[0])
>                      # IMAGE_FSTYPES appending
>                      if len(items) > 1 and items[1]:
> +                        bb.warn('    UBOOT_CONFIG_IMAGE_FSTYPES[%s] =3D
> "%s"' % (f, items[1]))
>                          bb.debug(1, "Staging '%s' for IMAGE_FSTYPES." %
> items[1])
>                          imagefstype =3D items[1]
>                      if len(items) > 2 and items[2]:
> +                        bb.warn('    UBOOT_CONFIG_BINARY[%s] =3D "%s"' %
> (f, items[2]))
>                          bb.debug(1, "Staging '%s' for
> UBOOT_CONFIG_BINARY." % items[2])
>                          binary =3D items[2]
>                      break
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230065):
> https://lists.openembedded.org/g/openembedded-core/message/230065
> Mute This Topic: https://lists.openembedded.org/mt/117496159/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000001c01a8064964a663
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 27=
 janv. 2026 =C3=A0=C2=A021:31, Ryan Eatmon via <a href=3D"http://lists.open=
embedded.org">lists.openembedded.org</a> &lt;reatmon=3D<a href=3D"mailto:ti=
.com@lists.openembedded.org">ti.com@lists.openembedded.org</a>&gt; a =C3=A9=
crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Mark=
 the legacy flow for settings the UBOOT_CONFIG options in a comma<br>
separated list.=C2=A0 This code will still work through wrynose, but will b=
e<br>
removed once wrynose is released.<br>
<br>
Add warnings to point people in the right direction for fixing their<br>
configs:<br>
<br>
WARNING: Legacy use of UBOOT_CONFIG[foo] =3D &quot;foo_config,foo_image,foo=
_binary&quot; is deprecated.=C2=A0 Please move to using UBOOT_CONFIG_* vari=
ables:<br>
WARNING:=C2=A0 =C2=A0 =C2=A0UBOOT_CONFIG[foo] =3D &quot;foo_config&quot;<br=
>
WARNING:=C2=A0 =C2=A0 =C2=A0UBOOT_CONFIG_IMAGE_FSTYPES[foo] =3D &quot;foo_i=
mage&quot;<br>
WARNING:=C2=A0 =C2=A0 =C2=A0UBOOT_CONFIG_BINARY[foo] =3D &quot;foo_binary&q=
uot;<br>
WARNING: Legacy use of UBOOT_CONFIG[bar] =3D &quot;bar_config,bar_image&quo=
t; is deprecated.=C2=A0 Please move to using UBOOT_CONFIG_* variables:<br>
WARNING:=C2=A0 =C2=A0 =C2=A0UBOOT_CONFIG[bar] =3D &quot;bar_config&quot;<br=
>
WARNING:=C2=A0 =C2=A0 =C2=A0UBOOT_CONFIG_IMAGE_FSTYPES[bar] =3D &quot;bar_i=
mage&quot;<br>
WARNING: Legacy use of UBOOT_CONFIG[bing] =3D &quot;bing_config,,bing_binar=
y&quot; is deprecated.=C2=A0 Please move to using UBOOT_CONFIG_* variables:=
<br>
WARNING:=C2=A0 =C2=A0 =C2=A0UBOOT_CONFIG[bing] =3D &quot;bing_config&quot;<=
br>
WARNING:=C2=A0 =C2=A0 =C2=A0UBOOT_CONFIG_BINARY[bing] =3D &quot;bing_binary=
&quot;<br>
<br>
Signed-off-by: Ryan Eatmon &lt;<a href=3D"mailto:reatmon@ti.com" target=3D"=
_blank">reatmon@ti.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/uboot-config.bbclass | 8 ++++++++<br>
=C2=A01 file changed, 8 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe=
/uboot-config.bbclass<br>
index 823a66157a..87ec908000 100644<br>
--- a/meta/classes-recipe/uboot-config.bbclass<br>
+++ b/meta/classes-recipe/uboot-config.bbclass<br>
@@ -27,6 +27,9 @@<br>
=C2=A0# deemed to be limiting in terms of expanding support to more and mor=
e knobs<br>
=C2=A0# that might need to be turned to customize a config build.<br>
=C2=A0#<br>
+# NOTE: Suport for this legacy flow is now depcrated and will be removed f=
rom<br></blockquote><div><br></div><div>s/depcrated/deprecated/</div><div><=
br></div><div>This might be useful, I grep through code for this word somet=
imes.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0master after the wrynose LTS release.<br>
+#<br>
=C2=A0# UBOOT_MACHINE =3D &quot;&quot;<br>
=C2=A0# UBOOT_CONFIG ??=3D &lt;default&gt;<br>
=C2=A0# UBOOT_CONFIG[foo] =3D &quot;foo_config,images,binary&quot;<br>
@@ -181,14 +184,19 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if config =3D=
=3D f: <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0found =3D True<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0items =3D v.split(&#39;,&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if i=
tems[0] and len(items) &gt; 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bb.warn(&#39;Legacy use of UBOOT_CONFIG[%s] =3D &quot;%s&quot; i=
s deprecated.=C2=A0 Please move to using UBOOT_CONFIG_* variables:&#39; % (=
f, v))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bb.warn(&#39;=C2=A0 =C2=A0 UBOOT_CONFIG[%s] =3D &quot;%s&quot;&#=
39; % (f, items[0]))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if items[0] and len(items) &gt; 3:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0raise bb.parse.SkipRecipe(&#39;Only config,images,binary c=
an be specified!&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0d.appendVar(&#39;UBOOT_MACHINE&#39;, &#39; &#39; + items[0])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# IMAGE_FSTYPES appending<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if len(items) &gt; 1 and items[1]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bb.warn(&#39;=C2=A0 =C2=A0 UBOOT_CONFIG_IMAGE_FSTYPES[%s] =3D &q=
uot;%s&quot;&#39; % (f, items[1]))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0bb.debug(1, &quot;Staging &#39;%s&#39; for IMAGE_FSTYPES.&=
quot; % items[1])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0imagefstype =3D items[1]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if len(items) &gt; 2 and items[2]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bb.warn(&#39;=C2=A0 =C2=A0 UBOOT_CONFIG_BINARY[%s] =3D &quot;%s&=
quot;&#39; % (f, items[2]))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0bb.debug(1, &quot;Staging &#39;%s&#39; for UBOOT_CONFIG_BI=
NARY.&quot; % items[2])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0binary =3D items[2]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#230065): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/230065" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/230065</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117496159/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117496159/4316185</a><br>
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
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000001c01a8064964a663--

