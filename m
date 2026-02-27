Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38E4FD5321
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 09:39:29 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91976.1772185162109146169
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 01:39:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m2CkvvVg;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65bf2f59d64so2501426a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 01:39:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772185160; cv=none;
        d=google.com; s=arc-20240605;
        b=fH9n1XsTkGz1xQgrEWl9+aMYvvlxDz801KJojRlomX8hDMXiKrTt6qH7fLfndONwzR
         zoGI92vG2hRhkXFw0iE10YJdrhL58YgvC89WQ5dYC+lfAW/hO3c5iXCSHMwoGAfsnYlA
         yRZFgozOCuvhj5gmU4Ws8v73t1jjNgEKdA8Y6Kx8m+JCY8TXW+gTt3nvhGf7nIMogvzQ
         71fPzQ4NmcVXJT8KPQyaYP0wEllY/sV5Xga5t1yzXB2X8dZOnmY44dXpa2I+cOAlwr5G
         W12/eQqCPW/hDWHgYrtxli+LIqDYfco7cZMOT9K+dDDf6+9oQZCf7r3lN1s4PIc4WigA
         sfSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=O7gmgroH8XCrohM3UPbPIKKMQk9MsrGkmwhghzVt7z0=;
        fh=3dFdSa06sIBSurIbwyKgVgvfprkdWimgIZOm9DdWiG8=;
        b=HUvaZS8j6doq/kla3aSAauQcZ+jL855eI/IC2BJTLQm55pcz9/MkUwrxnSJGVRkhkW
         nm5lO6vVM7ZYst1llh1Fp9damw/GWHoQxGjD3fy1puO+dAtbeHwKKV8dAkBBYyTIkQzB
         lgQ9JskFJcEN6MC6bvi6GXGdsa2Se5LbC565VjmIwrL8T9TW9LSsDCWBRIg4QSic5gNa
         joHoOvE4ttDoOTVguRGzTdwXmyfBqLfjLsT5WxeV3+7TeUS7Z/eVjF0sgB0NwQS3V1ta
         jSRJt/CRrVhlUIAGp+41RjmXsqh2IwqobXCRlcTvdiLOHUjDaezXZY1TAN2MA62fK1Nd
         dIVA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772185160; x=1772789960; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O7gmgroH8XCrohM3UPbPIKKMQk9MsrGkmwhghzVt7z0=;
        b=m2CkvvVgAvVU1igqw83h/o0gbYSQGKNx4kducsORx5wdHQUGCstPGdcxtG9wfB2nqj
         wesz67JX1/jQfwz7joWHGLZ+fXogIsFQGMMQ5R+Rq/DxX8cs2sbWG6uFHhn8xNoyQJxQ
         sV3LCeLYo/idex+qahyTX9c6+jUXYIPKpU20oIh2WVObCgtQlG5I/Nm2ckSt+e9Vn76t
         YbI/4VZlNuhc3cR+KdSDfMfMG3VFgYSaLqWz0ly7YDczX3l2MI/LHO9liAcwOzwOFwvq
         qacwerjlThbiSzSFcefjAtL/QDNSjmZMI9t4rm4ZqWosr6f65dz44/C2E+y2fZgHH0ki
         Iqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772185160; x=1772789960;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7gmgroH8XCrohM3UPbPIKKMQk9MsrGkmwhghzVt7z0=;
        b=ZqvVURx8dwTlZCkUDoApRWwkvf0nSlci9FOBLRMv7+lg5EgnXE3I7omOS5GTAmKohg
         Q6XEnR/2XzZqagJDN6m4yp3TmHu5sTBhVDdUsHmqmsMvYV8HQkbtT6hmd2buaUkC23gK
         cziZ/c9ww8itNyxKgJ0ILrXD+D2y9lQFWO87rCQTE8MhPzYznp5l7bjdZQ6vZXUwJwXE
         iBiT6nHZnhxeviREPlS6vULHjZSWh4g6oLsSWEFT7CtnELqb7Daqff5zCPtX3aLc2rdM
         yX4GHb6uYhpHNXDsRTWCVB8woSG1MLo8Ypz7DiAc8AWcg1QzL/w3D8aueG6rPbW+oZZj
         B3SA==
X-Gm-Message-State: AOJu0YzFrEV5+MrDR7FyoA47qFPJSjZ3dHsKeX7RQxmMvvEXbx13E/UL
	H04DfbUB1B1YIHCHmulGW/NAxPHTmaSoiJdVrWButRuY23MJ5W1z3FCPP4hioNnzw6w7HH3wlFJ
	guv21RXGVhaIxgdce5X9Xpksv92JlXCtC8AEL
X-Gm-Gg: ATEYQzy40AGPo7HbpC/RVfFytlN0CAWBj1i7dr8YC8c9iz2brlFKz2qgdfA/RNCVp4U
	IbomuY7w85GN7GFxSTYumPQLsE7t4h0p61Lj5e6kjcuMq2589oKOmOe+6hkCuOzjJOVINYqLNum
	APqaNnEZuAMIPDQ5UNkTtn5HkEVS7pQoDhvde7xBPfORBaWfv4pQm1qkXICJN0xAS5Jz6gKEhhv
	jzCbWP+0t3cACPE6hroo6SxXhiUTMHeKChNvxlnVb/AsCzrNESd1sMeROO8OtIFY+7eDqO3uA8O
	/M6xA3HLQA==
X-Received: by 2002:a17:907:847:b0:b88:463e:b55f with SMTP id
 a640c23a62f3a-b9376365cfdmr132988866b.6.1772185159773; Fri, 27 Feb 2026
 01:39:19 -0800 (PST)
MIME-Version: 1.0
References: <20260227072110.2807435-1-hongxu.jia@windriver.com>
In-Reply-To: <20260227072110.2807435-1-hongxu.jia@windriver.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 27 Feb 2026 09:39:08 +0000
X-Gm-Features: AaiRm536z6LBZt49eLpUaZThVOfkc85oejGYLsyoclrpnJeW_z42zLHM6mO5YUQ
Message-ID: <CANPvuRkDSpvyioZvO7iVLhPBtUQQytYRG-Z4KJ7cPn6jeMyC5w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes/yocto-check-layer: allow to explicitly
 skip check_network_flag in recipe
To: hongxu.jia@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ecb64b064bcb02b9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 09:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232092

--000000000000ecb64b064bcb02b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi hongxu,

hongxu via lists.openembedded.org <hongxu.jia=3D
windriver.com@lists.openembedded.org> escreveu (sexta, 27/02/2026 =C3=A0(s)
07:21):

> The yocto-check-layer add a new test that checks that no tasks
> between do_fetch (exclusive) and do_build (inclusive) are allowed
> to use the network, with rare exceptions.
>
> The only exception currently is build-appliance-image's do_image task,
> which is hardcoded in yocto-check-layer bbclass.
>
> This commit adds variable SKIP_CHECK_NETWORK_FLAG to allow user to
> explicitly skip check_network_flag in recipe
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes-global/yocto-check-layer.bbclass | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-global/yocto-check-layer.bbclass
> b/meta/classes-global/yocto-check-layer.bbclass
> index ba93085325..9fb36f5646 100644
> --- a/meta/classes-global/yocto-check-layer.bbclass
> +++ b/meta/classes-global/yocto-check-layer.bbclass
> @@ -27,13 +27,16 @@ def check_insane_skip(d):
>              d.setVar("QA_ERRORS_FOUND", "True")
>
>
> +# Format: "BPN1:task1 BPN2:task2", separate by space
> +# build-appliance-image uses pip at image time
> +SKIP_CHECK_NETWORK_FLAG =3D "build-appliance-image:do_image"
> +
>  # Check that no tasks (with rare exceptions) between do_fetch and do_bui=
ld
>  # use the network.
>  def check_network_flag(d):
>      # BPN:task names that are allowed to reach the network, using fnmatc=
h
> to compare.
>      allowed =3D []
> -    # build-appliance-image uses pip at image time
> -    allowed +=3D ["build-appliance-image:do_image"]
> +    allowed +=3D (d.getVar('SKIP_CHECK_NETWORK_FLAG') or '').split()
>

This could introduce severe reproducibility problems for someone who claims
to have a Yocto compatible layer.

Can you tell what other recipes require this?

Jose


>
>      def is_allowed(bpn, task):
>          from fnmatch import fnmatch
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232081):
> https://lists.openembedded.org/g/openembedded-core/message/232081
> Mute This Topic: https://lists.openembedded.org/mt/118026872/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000ecb64b064bcb02b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi hongxu,</div><br><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">hongxu via <a href=3D=
"http://lists.openembedded.org">lists.openembedded.org</a> &lt;hongxu.jia=
=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">windriver.com@li=
sts.openembedded.org</a>&gt; escreveu (sexta, 27/02/2026 =C3=A0(s) 07:21):<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">The yocto-check-=
layer add a new test that checks that no tasks<br>
between do_fetch (exclusive) and do_build (inclusive) are allowed<br>
to use the network, with rare exceptions.<br>
<br>
The only exception currently is build-appliance-image&#39;s do_image task,<=
br>
which is hardcoded in yocto-check-layer bbclass.<br>
<br>
This commit adds variable SKIP_CHECK_NETWORK_FLAG to allow user to<br>
explicitly skip check_network_flag in recipe<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-global/yocto-check-layer.bbclass | 7 +++++--<br>
=C2=A01 file changed, 5 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-global/yocto-check-layer.bbclass b/meta/classes-g=
lobal/yocto-check-layer.bbclass<br>
index ba93085325..9fb36f5646 100644<br>
--- a/meta/classes-global/yocto-check-layer.bbclass<br>
+++ b/meta/classes-global/yocto-check-layer.bbclass<br>
@@ -27,13 +27,16 @@ def check_insane_skip(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quot;QA_ERRORS_FO=
UND&quot;, &quot;True&quot;)<br>
<br>
<br>
+# Format: &quot;BPN1:task1 BPN2:task2&quot;, separate by space<br>
+# build-appliance-image uses pip at image time<br>
+SKIP_CHECK_NETWORK_FLAG =3D &quot;build-appliance-image:do_image&quot;<br>
+<br>
=C2=A0# Check that no tasks (with rare exceptions) between do_fetch and do_=
build<br>
=C2=A0# use the network.<br>
=C2=A0def check_network_flag(d):<br>
=C2=A0 =C2=A0 =C2=A0# BPN:task names that are allowed to reach the network,=
 using fnmatch to compare.<br>
=C2=A0 =C2=A0 =C2=A0allowed =3D []<br>
-=C2=A0 =C2=A0 # build-appliance-image uses pip at image time<br>
-=C2=A0 =C2=A0 allowed +=3D [&quot;build-appliance-image:do_image&quot;]<br=
>
+=C2=A0 =C2=A0 allowed +=3D (d.getVar(&#39;SKIP_CHECK_NETWORK_FLAG&#39;) or=
 &#39;&#39;).split()<br></blockquote><div><br></div><div>This could introdu=
ce severe reproducibility problems for someone who claims to have a Yocto c=
ompatible layer.</div><div><br></div><div>Can you tell what other recipes r=
equire this?</div><div><br></div><div>Jose</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0def is_allowed(bpn, task):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from fnmatch import fnmatch<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#232081): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/232081" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/232081</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118026872/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118026872/5052612</a><br>
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

--000000000000ecb64b064bcb02b9--

