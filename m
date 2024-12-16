Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E34D5E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 13:21:39 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.56348.1734355297611568609
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 05:21:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MmCt1QM3;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2164b1f05caso36894125ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 05:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734355297; x=1734960097; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ao+2df81IB59L72p3clINYMdf0C+uvGbDqDrdhB8gVU=;
        b=MmCt1QM3kNXQI+B6Q3jhf50AS2n7UztU2K9oROaY9jLKlC3WNfwhWEUAtcCsLVK1Al
         7D/cdRIAueaOprK2Rv44qMQ0gygfYjadyydeqjxHrcOchEsH5/gFeShLYj7sUPBWvPb6
         ptQoW9MIR6T6b0ZEf3OXxDMRZIUmYYMN70y6/5GdX6N+gfjGH/8zDuxvpwL854iZy3Cs
         G0sTpRkOXg24BBzaqIHXwogdxv0yqmGLgZeg6/GTj8E6vShvQLKycZE7Bw/wR6ULFOKk
         cEhGx1tezwR23NiCJ41A/FgzJPJGPiiEdCnOkUXDATvTeZTb/kelJVGogT7Wzkrti6BT
         ULtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734355297; x=1734960097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ao+2df81IB59L72p3clINYMdf0C+uvGbDqDrdhB8gVU=;
        b=Jvvf0t5GsC++0iwubNi3xetd87GuyIQzhRh07b1ZZsnN5I6aysurwfLIrS8cDHb3F0
         5rnGet6EY87faKtdEbJEcxydrCImSSVF7tKaUvl4U2Hwn1BFZnz/9LUJ1JKPHQ9HsnxH
         5PQriWYsukuKNLe7rX7RqBNG0dxwWeM4Ep5sn+3hLOICaa52mtbax7oBffKOCUMi1y/N
         to3Onooc0M7FwqoP5w8Wl9REsaw3aq1k16xUBAen9RArE/gM+PNMEzY5iP10edE5gwcg
         hnpGV4Pz/5PRPtlu5r7TkeDlpcRUl80cvaLHyUgIKCOyR7TXb8LdNsZDWDN/paSgoigX
         8nLQ==
X-Gm-Message-State: AOJu0Yz4jC6N97TLulIFqZhuh8RWmsEPe07lFouOlJ+T69ZvO2FSgtWs
	sWySoHeWRfGuiAc18jSyeB0GNxzSESQd/qdxi/GV9BZ4i2Ie51xjs4U2Pg7frQTrA3apohnjBwg
	hoB62Kp8vk8ptDrafq6/Smq0b1vk=
X-Gm-Gg: ASbGnctNMOsBMJYAXHtojgkrr9bs2j10MzbrgBIp200i4A+qZD5g/Z23F/nyRK0fgmP
	K0Qn2UlgSqvskba/Jm0jdgycVyNH3DDOQ0BonNoE=
X-Google-Smtp-Source: AGHT+IHg/YTQ7bWdVRm68tuS7WPBR5ZTBmpBA8/RhUEP2jUdo8l5HPqLuwI7XLNfzPepq/gsIoU2iaxHo1pYAuh2SYw=
X-Received: by 2002:a17:90b:3512:b0:2ee:45fd:34ee with SMTP id
 98e67ed59e1d1-2f2904ab741mr18286763a91.37.1734355296809; Mon, 16 Dec 2024
 05:21:36 -0800 (PST)
MIME-Version: 1.0
References: <20241216-kmeta-audit-vartrue-v1-1-51bbb0b2085a@bootlin.com>
In-Reply-To: <20241216-kmeta-audit-vartrue-v1-1-51bbb0b2085a@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Dec 2024 08:21:25 -0500
Message-ID: <CADkTA4N6oZ6JbzK6bYE6bgC3FwY5tu2a+WKhEipzhpArNhyvLA@mail.gmail.com>
Subject: Re: [PATCH] kernel-yocto: use oe.types.boolean on KMETA_AUDIT
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000617a750629630fc1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 13:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208762

--000000000000617a750629630fc1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 6:35=E2=80=AFAM Antonin Godard <antonin.godard@boot=
lin.com>
wrote:

> Following commit a39a1f7cf78ad1ca07438bce634a47e970f25047
> ("kernel-yocto: allow early exit to configuration audit"), we can
> disable auditing of the kernel configuration by setting KMETA_AUDIT
> empty.
>
> Since the default value of this variables is "yes", use
> oe.types.boolean() so that it will also be disabled when setting it to
> "no", and avoid potential confusion.
>

That isn't the intent of the variable. It is being used as a flag here,
but it can also be used to encode other information.

Quite literally, if it is set to anything, the audit should happen. Only
when it is unset should it not.

Bruce


>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass
> b/meta/classes-recipe/kernel-yocto.bbclass
> index
> a5d89dc2c8bc912539f7c9ffc25a2576920f580a..1493ba20a0c25df556df41fa4137ab1=
7f67c91e7
> 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -568,7 +568,9 @@ python do_config_analysis() {
>  python do_kernel_configcheck() {
>      import re, string, sys, subprocess
>
> -    audit_flag =3D d.getVar( "KMETA_AUDIT" )
> +    audit_flag =3D False
> +    if d.getVar("KMETA_AUDIT"):
> +        audit_flag =3D oe.types.boolean(d.getVar("KMETA_AUDIT"))
>      if not audit_flag:
>         bb.note( "kernel config audit disabled, skipping .." )
>         return
>
> ---
> base-commit: e345b34703d4fa5e0bc9a82ac33b7c1fd84f99fe
> change-id: 20241216-kmeta-audit-vartrue-6650cb20f762
>
> Best regards,
> --
> Antonin Godard <antonin.godard@bootlin.com>
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000617a750629630fc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 16, 2024 at 6:35=
=E2=80=AFAM Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.com=
">antonin.godard@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Following commit a39a1f7cf78ad1ca07438bce634a47=
e970f25047<br>
(&quot;kernel-yocto: allow early exit to configuration audit&quot;), we can=
<br>
disable auditing of the kernel configuration by setting KMETA_AUDIT<br>
empty.<br>
<br>
Since the default value of this variables is &quot;yes&quot;, use<br>
oe.types.boolean() so that it will also be disabled when setting it to<br>
&quot;no&quot;, and avoid potential confusion.<br></blockquote><div><br></d=
iv><div><div class=3D"gmail_default" style=3D"font-size:small">That isn&#39=
;t the intent of the variable. It is being used as a flag here,</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">but it can also be used to=
 encode other information.</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">Quite literally, if it is set to anything, the audit should happen. Only<=
/div><div class=3D"gmail_default" style=3D"font-size:small">when it is unse=
t should it not.</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0</div></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.=
com" target=3D"_blank">antonin.godard@bootlin.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel-yocto.bbclass | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe=
/kernel-yocto.bbclass<br>
index a5d89dc2c8bc912539f7c9ffc25a2576920f580a..1493ba20a0c25df556df41fa413=
7ab17f67c91e7 100644<br>
--- a/meta/classes-recipe/kernel-yocto.bbclass<br>
+++ b/meta/classes-recipe/kernel-yocto.bbclass<br>
@@ -568,7 +568,9 @@ python do_config_analysis() {<br>
=C2=A0python do_kernel_configcheck() {<br>
=C2=A0 =C2=A0 =C2=A0import re, string, sys, subprocess<br>
<br>
-=C2=A0 =C2=A0 audit_flag =3D d.getVar( &quot;KMETA_AUDIT&quot; )<br>
+=C2=A0 =C2=A0 audit_flag =3D False<br>
+=C2=A0 =C2=A0 if d.getVar(&quot;KMETA_AUDIT&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 audit_flag =3D oe.types.boolean(d.getVar(&quot=
;KMETA_AUDIT&quot;))<br>
=C2=A0 =C2=A0 =C2=A0if not audit_flag:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note( &quot;kernel config audit disabled, sk=
ipping ..&quot; )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
<br>
---<br>
base-commit: e345b34703d4fa5e0bc9a82ac33b7c1fd84f99fe<br>
change-id: 20241216-kmeta-audit-vartrue-6650cb20f762<br>
<br>
Best regards,<br>
-- <br>
Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.com" target=3D"=
_blank">antonin.godard@bootlin.com</a>&gt;<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000617a750629630fc1--

