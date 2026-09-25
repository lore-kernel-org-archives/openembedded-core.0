Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7BC8C9830E
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 13:10:27 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7821.1790341822567822246
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 06:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lnG6W1Fj;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398a147688bso602046a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 06:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790341822; cv=none;
        d=google.com; s=arc-20260327;
        b=Mtktp4mrBojp3SqUWQxKTXxBdp5WbRuNHupLfvGZcfMWq6ZSEeNikB5xlkJll5JuBA
         H+uEPVRMz6Dxu6IMWEIEmYQmzqPr5kmeEbee1JaRdF1Wo26sx9emMKFd9nnhCyc1x5DV
         /cPJ4SdHsFukGnWISLJDntyOnkNKUVzvzklnf5z98DLO7RLnO0sDcJ8x8LEssCp8RWiT
         XrKovu+jLjmREctipjtUQ1JYrfPnRhi2ofCe8OCt2lUlykqerz3Nxf9YHgn2EEjv9H5m
         vSOaRTrKfwjGl7Wynng66Cd7P1q8lpk/EdhouInFn061axtAmG7HvczOGWvewusb4tIQ
         xhiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8v77CmoxlahIlyuuyYjJrEMyvMP/TV4XFDkhpkdXW1U=;
        fh=rnzEQbaIJUlpcGjgXuISAjqNb8Bycl4vXAeY2eu9pKI=;
        b=hTz4qlBP8VfcsV/8VljJPd2+RugkQ5B5z7k5JHfRaZK2WImqziQK3m1B8cvlnKntqP
         fQm3ipMla4GfSc0Bl6i4Ot8jVuKqeA0t38FoQRvszPlgOSNNe67QVSXWAFTnHKwHM8Xz
         0EUjkE0RCbnVl1zATb0s+qWZMbupLOMI0nvxS2c1FDmJL5wICJMqcyx90O7NlXxxm9mg
         KugIthYwJiVClhTDDbX2w5gbm72QnCO0QjwrBWY9I3iXOo8KktIkJGhZg4AD89QcOCQK
         8fYAN78PAgV9D2UTX4TbjSbmqRZwaqi5t3pFcQVe7Ft2UmeGth/PBAqK3NKlOxJzGCXq
         Jsqg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790341822; x=1790946622; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8v77CmoxlahIlyuuyYjJrEMyvMP/TV4XFDkhpkdXW1U=;
        b=lnG6W1FjhNR2e57WDy2XR3mAGD3cNhp2juHVZ2/msBoPgcNl3Il/rjIIL/P6ch8XV2
         koxeI98QgLCEi1hkCTzes80scS9IDr4DVugcGpPUyUHodzt3xWOuN97heAygWXWhRHvG
         ND0xXdNjTOzaoPrWnVNOZF6kzEm/cikvQKm1zJD7rnME6x8qYgW/WBLjTb2bK3aObD/B
         ffvnuG3oXQfqzymVEiZZmrQtFI+cEnhIDeImsXQoxyN3rxyQvBhCa8T7xb4QeDs+igaN
         0vNAExp+uaFvfoeykNtSVMHIIYBaZP3LScV4u7gvySSOfGZwc1PCMO6sP33ptj2dC8JH
         jRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790341822; x=1790946622;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8v77CmoxlahIlyuuyYjJrEMyvMP/TV4XFDkhpkdXW1U=;
        b=ZRWOW1/xp5pDERpG864k4HiMQvD+lCGQg/HVqQKcX5u/6jqfjdOkXTCGkLVpQCGeRq
         VF5zFfr6g5sCwnjTzWAuq5UFL+us2QQ13whhMU7RIi/6HO9zbm+pFU00fHSUBfbT+d2y
         +/Zh2Y0e8PNTUrO1Z3GG0+GGEqaDBSgZk2QQBq0QuMRbnjRJ945c5xEReQicDldBLCym
         AJs5W7FTjSAg/CzOvsvDsFrzwqWLiYtXEAGGoDAGTZfIgjnlQlZHAeTsyHp6qeSiqji5
         lDJt3f8gxC3bmzCMY0jpBKIOh3/bKJyTt3nC2zzRMPy3bGIYTHKmvRjOiHp/Ss/9xEYR
         TqCw==
X-Gm-Message-State: AFuF++moBsJNCj7+n2irRPB7WBZxYQjIN3pYHJjCk+ZfB3Q/Bd1BBRF+
	USWNgGYRol6nFPjQSm9LaK81mBYwqZwsw41BghxsS4x4DaZG4vYON1KvNPW83+lk+9BfATvrTYJ
	zjY1h3o2F9cTdskG9VF4levG0pD8j4fo=
X-Gm-Gg: AYBFou38A4w5nM70kaJP0LXloO34trFsOrkMfrmBZvXJjGAmwnEgVkiTfD0dGqygPu8
	EjbhEazSiMe2hC9C5anhnBzkRJziwSPezk6eO4C81CZ60o2gHyH6H+JPVW8Jl6/Ycb7lL3oySuN
	ObjileH5w9UsQP8cipCQA3nZgixbieemwh08W7xDFOTZNUy5Andv8ndODZ3BPUbb9sjPltA2QHt
	YDoxjEg9Nn3aHK/YFfv24xxR4J1LlWtqCIV5d+LqpdeSvm3/drANDzfNoj5/3XRKaGC+JH4fy+8
	lPvNjTnpgtVwH+kR2Hy7NEGyX0oRwkg5cUCLgTWqhF+9PnwtuhxCGfg5pEGiZ+/trUnbL2lCtLY
	zqXt2ZAKaVUa7SB5jRtY1gFNXHyTHD3xhzbxe6z74wtLk6kBzYbSZpKvAQY8apPfXMQDSY98Ti+
	0hofgM2//l
X-Received: by 2002:a17:90b:48d1:b0:39e:1bff:b383 with SMTP id
 98e67ed59e1d1-3a098d96320mr5106095a91.24.1790341821638; Fri, 25 Sep 2026
 06:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260925124825.1868909-1-ross.burton@arm.com>
In-Reply-To: <20260925124825.1868909-1-ross.burton@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 25 Sep 2026 09:10:09 -0400
X-Gm-Features: AclHuK9iVS8gHokZjHI794pwTSuvxTNdAr9ms-qaTAcUjZkuZL1AN_S_raovZOk
Message-ID: <CADkTA4P-V7PFFZf790XD98bM48FwTbfns-wLpVOsS57G-SNHfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] linux-yocto-dev: drop DeviceTree validation dependencies
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004e2cf5065c4e70db"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 13:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246620

--0000000000004e2cf5065c4e70db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ackd

Bruce

On Fri, Sep 25, 2026 at 8:48=E2=80=AFAM Ross Burton <ross.burton@arm.com> w=
rote:

> The mandatory DeviceTree schema checking was added in 5.16-rc4[1] but it
> was reverted in 5.16-rc5[2], so drop it from from linux-yocto-dev.bb.
>
> Note that linux-yocto.bb went from 5.15 to 5.19, so this change never
> impacted that recipe.
>
> [1] linux 53182e81f47d4 ("kbuild: Enable DT schema checks for %.dtb
> targets")
> [2] linux 75e895343d5a2 ("Revert "kbuild: Enable DT schema checks for
> %.dtb targets"")
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-dev.bb | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index 03999c5318a..be5a33bdd61 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -35,16 +35,6 @@ PV =3D "${LINUX_VERSION}+git"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
>
> -# yaml and dtschema are required for 5.16+ device tree validation,
> libyaml is checked
> -# via pkgconfig, so must always be present, but we can wrap the others t=
o
> make them
> -# conditional
> -DEPENDS +=3D "libyaml-native"
> -
> -PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG[dt-validation] =3D ",,python3-dtschema-native"
> -# we need the wrappers if validation isn't in the packageconfig
> -DEPENDS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'dt-validation', '',
> 'python3-dtschema-wrapper-native', d)}"
> -
>  COMPATIBLE_MACHINE =3D
> "^(qemuarmv5|qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux8=
6-64|qemuriscv32|qemuriscv64|qemuloongarch64)$"
>
>  KERNEL_DEVICETREE:qemuarmv5 =3D "arm/versatile-pb.dtb"
> --
> 2.43.0
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000004e2cf5065c4e70db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Ack=
d</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br><d=
iv class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Fri, Sep 25, 2026 at 8:48=E2=80=AFAM Ross Burton &lt;<a href=
=3D"mailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">The mandatory DeviceTree=
 schema checking was added in 5.16-rc4[1] but it<br>
was reverted in 5.16-rc5[2], so drop it from from <a href=3D"http://linux-y=
octo-dev.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a>.<b=
r>
<br>
Note that <a href=3D"http://linux-yocto.bb" rel=3D"noreferrer" target=3D"_b=
lank">linux-yocto.bb</a> went from 5.15 to 5.19, so this change never<br>
impacted that recipe.<br>
<br>
[1] linux 53182e81f47d4 (&quot;kbuild: Enable DT schema checks for %.dtb ta=
rgets&quot;)<br>
[2] linux 75e895343d5a2 (&quot;Revert &quot;kbuild: Enable DT schema checks=
 for %.dtb targets&quot;&quot;)<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a> | 10 ----------<br=
>
=C2=A01 file changed, 10 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb=
" rel=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a> b/meta/recipe=
s-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=3D"noreferrer" tar=
get=3D"_blank">linux-yocto-dev.bb</a><br>
index 03999c5318a..be5a33bdd61 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a><br>
@@ -35,16 +35,6 @@ PV =3D &quot;${LINUX_VERSION}+git&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc93980=
86aedcd7e46&quot;<br>
<br>
-# yaml and dtschema are required for 5.16+ device tree validation, libyaml=
 is checked<br>
-# via pkgconfig, so must always be present, but we can wrap the others to =
make them<br>
-# conditional<br>
-DEPENDS +=3D &quot;libyaml-native&quot;<br>
-<br>
-PACKAGECONFIG ??=3D &quot;&quot;<br>
-PACKAGECONFIG[dt-validation] =3D &quot;,,python3-dtschema-native&quot;<br>
-# we need the wrappers if validation isn&#39;t in the packageconfig<br>
-DEPENDS +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;dt-v=
alidation&#39;, &#39;&#39;, &#39;python3-dtschema-wrapper-native&#39;, d)}&=
quot;<br>
-<br>
=C2=A0COMPATIBLE_MACHINE =3D &quot;^(qemuarmv5|qemuarm|qemuarm64|qemux86|qe=
muppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64|qemuloongarch6=
4)$&quot;<br>
<br>
=C2=A0KERNEL_DEVICETREE:qemuarmv5 =3D &quot;arm/versatile-pb.dtb&quot;<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--0000000000004e2cf5065c4e70db--

