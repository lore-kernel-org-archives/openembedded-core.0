Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CCFC2BA1B
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 05:19:17 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.30214.1741756754422385172
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 22:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Dcfo1nvq;
 spf=pass (domain: mvista.com, ip: 209.85.218.44, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso512603066b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 22:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1741756753; x=1742361553; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v1gsQg2bswm9UWRKPklZAVDJvDOd75lXXekJrnVfxIg=;
        b=Dcfo1nvqAG1YzsY/uzpZ6gTeo5pzB18ZNtJfcSTM91Hcuv9kLWeKm4cf3J/RY0bY+m
         dvGLcGDo+8bF6wK/n5IYWxlGz/FL+Nq7zz+UrLKysLwXUjb8r52QncPPSjsqBE0rKzcz
         hyb0FnWvyffj+CpdldNodu02zNK3UCbMMCLJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741756753; x=1742361553;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1gsQg2bswm9UWRKPklZAVDJvDOd75lXXekJrnVfxIg=;
        b=USpTtc7kizIgdsozdDLcbwSRFMKyO0BhtQgHWvBvoXg6Cnvo2Nsjc0f1WdQ7CblC9e
         jImBnqNXGN954BR5fCJuUJK+Y5NoFghuywvi+8InWw7Dc0DF7YQTthbpS/VfGJvb64fc
         pOJsIbSsl0I1IizGf3Sgvb2uH9fldIUPnPpMCiLZdLyg9YL2R0wbphYNYG44PPbktirV
         VdrhPtcFE05WpfKr5NGG7sB4+VT3XLUARQKBNg+l/k+xhoqu1QUIviNsi4Kyw2jJkJbG
         Nu1VzOmIikK3kOtDEvQL02BokWq/IuUN7NcXzpqYKSliODDRjye6AF95z8j+J+tRfBgZ
         +kQw==
X-Gm-Message-State: AOJu0YxdPFYJ8sZKkB8y12ZsZfRkCIx1LsbraBEWOGyOem3Ho3IiG2SS
	G2n9nCu9dZLi8byDxm+/rQCJIVnS5sBZyXjy+Kkws0GpGdyDrTWXc07TRmgKohC/hOo4y7HfMFP
	012duO/Ly7sd7hpflU97gCzwEyASIQivn8jJz+A==
X-Gm-Gg: ASbGnctJYTDlNI8Wa5b0P2MfJ3PcJA04SPgSTveWzr8YAEAqMhlOKxEUNZdzxIwVBxw
	kjsxMSfWohEcuCt+EVtpSt5DcrrSK7pi1XiEjjRFL/gjEaTbwL9M7ghnPGZQ5k5qJNJrrHhTlm9
	B5SMDZY7LbAwIV8J6NWlR53KLl4/o3+AMYvwBHaw==
X-Google-Smtp-Source: AGHT+IHHwzC1bpO1D+a5XgV5y6ZtbrtAsVQlMVjoNga9L7/K7TNLh/DWWjvsTgVPwMHnjlmCCNjKVpSzCGvEIU6pi4s=
X-Received: by 2002:a17:906:3a85:b0:ac2:7adb:ee3b with SMTP id
 a640c23a62f3a-ac27adbf21emr1589191366b.1.1741756752733; Tue, 11 Mar 2025
 22:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250311112242.1750761-1-ross.burton@arm.com> <20250311112242.1750761-3-ross.burton@arm.com>
In-Reply-To: <20250311112242.1750761-3-ross.burton@arm.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Wed, 12 Mar 2025 10:48:59 +0530
X-Gm-Features: AQ5f1JoQEb5fpaiEy3AjRdHvlFhbI5h0YcWXf2QNviB0HgW27l0O796HRzeSTDw
Message-ID: <CANQUz19SxyTRsA1je40oVM0qoFS2nGznrDV1cvYG55gMB6hxhQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] xserver-xorg: upgrade 21.1.15 -> 21.1.16
To: ross.burton@arm.com, Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000088476c06301e58ae"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 05:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212637

--00000000000088476c06301e58ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Ross.

Hi Steve,

Can you please merge this patch series to stable branch scarthgap along
with below commit

https://git.openembedded.org/openembedded-core/commit/?id=3Dba94110d70ebfb1=
b4798ecf05389f7ea602b1f55

Thanks & Regards,
Vijay

On Tue, Mar 11, 2025 at 4:52=E2=80=AFPM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Includes security fix
>
>   * CVE-2025-26594
>   * CVE-2025-26595
>   * CVE-2025-26596
>   * CVE-2025-26597
>   * CVE-2025-26598
>   * CVE-2025-26599
>   * CVE-2025-26600
>   * CVE-2025-26601
>
> Ref: https://lists.x.org/archives/xorg-announce/2025-February/003584.html
>      https://lists.x.org/archives/xorg-announce/2025-February/003585.html
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../{xserver-xorg_21.1.15.bb =3D> xserver-xorg_21.1.16.bb}        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.15.bb =3D>
> xserver-xorg_21.1.16.bb} (92%)
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
> b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
> similarity index 92%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
> index 080e6d220ed..38c81f2372d 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
> @@ -3,7 +3,7 @@ require xserver-xorg.inc
>  SRC_URI +=3D
> "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
>             file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "841c82901282902725762df03adbbcd68153d4cdfb0d61df0cfd73ad677ae089"
> +SRC_URI[sha256sum] =3D
> "b14a116d2d805debc5b5b2aac505a279e69b217dae2fae2dfcb62400471a9970"
>
>  # These extensions are now integrated into the server, so declare the
> migration
>  # path for in-place upgrades.
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212562):
> https://lists.openembedded.org/g/openembedded-core/message/212562
> Mute This Topic: https://lists.openembedded.org/mt/111637850/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000088476c06301e58ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Thanks Ross.<br><br></div>Hi Steve,<br><br>=
</div>Can you please merge this patch series to stable branch scarthgap alo=
ng with below commit<br><br><a href=3D"https://git.openembedded.org/openemb=
edded-core/commit/?id=3Dba94110d70ebfb1b4798ecf05389f7ea602b1f55">https://g=
it.openembedded.org/openembedded-core/commit/?id=3Dba94110d70ebfb1b4798ecf0=
5389f7ea602b1f55</a><br><br></div><div>Thanks &amp; Regards,</div><div>Vija=
y</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Mar 11, 2025 at 4:52=E2=80=AFPM Ross =
Burton via <a href=3D"http://lists.openembedded.org">lists.openembedded.org=
</a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.org">ar=
m.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">From: Vijay Anusuri &lt;<a href=3D"mailto:vanus=
uri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
Includes security fix<br>
<br>
=C2=A0 * CVE-2025-26594<br>
=C2=A0 * CVE-2025-26595<br>
=C2=A0 * CVE-2025-26596<br>
=C2=A0 * CVE-2025-26597<br>
=C2=A0 * CVE-2025-26598<br>
=C2=A0 * CVE-2025-26599<br>
=C2=A0 * CVE-2025-26600<br>
=C2=A0 * CVE-2025-26601<br>
<br>
Ref: <a href=3D"https://lists.x.org/archives/xorg-announce/2025-February/00=
3584.html" rel=3D"noreferrer" target=3D"_blank">https://lists.x.org/archive=
s/xorg-announce/2025-February/003584.html</a><br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.x.org/archives/xorg-announce/2=
025-February/003585.html" rel=3D"noreferrer" target=3D"_blank">https://list=
s.x.org/archives/xorg-announce/2025-February/003585.html</a><br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://xserver-xorg_21.1.15.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">xserver-xorg_21.1.15.bb</a> =3D&gt; <a href=3D"http://xserv=
er-xorg_21.1.16.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.=
16.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-graphics/xorg-xserver/{<a href=3D"http://xserver-=
xorg_21.1.15.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.15.=
bb</a> =3D&gt; <a href=3D"http://xserver-xorg_21.1.16.bb" rel=3D"noreferrer=
" target=3D"_blank">xserver-xorg_21.1.16.bb</a>} (92%)<br>
<br>
diff --git a/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-x=
org_21.1.15.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.15.b=
b</a> b/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xorg_2=
1.1.16.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.16.bb</a>=
<br>
similarity index 92%<br>
rename from meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xo=
rg_21.1.15.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.15.bb=
</a><br>
rename to meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xorg=
_21.1.16.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.16.bb</=
a><br>
index 080e6d220ed..38c81f2372d 100644<br>
--- a/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xorg_21.=
1.15.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.15.bb</a><b=
r>
+++ b/meta/recipes-graphics/xorg-xserver/<a href=3D"http://xserver-xorg_21.=
1.16.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.16.bb</a><b=
r>
@@ -3,7 +3,7 @@ require xserver-xorg.inc<br>
=C2=A0SRC_URI +=3D &quot;file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pr=
e-gen4-hardwar.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Avoid-duplicate-defin=
itions-of-IOPortBase.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;841c82901282902725762df03adbbcd68153d4cdfb0d6=
1df0cfd73ad677ae089&quot;<br>
+SRC_URI[sha256sum] =3D &quot;b14a116d2d805debc5b5b2aac505a279e69b217dae2fa=
e2dfcb62400471a9970&quot;<br>
<br>
=C2=A0# These extensions are now integrated into the server, so declare the=
 migration<br>
=C2=A0# path for in-place upgrades.<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#212562): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/212562" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/212562</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111637850/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111637850/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" targe=
t=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000088476c06301e58ae--

