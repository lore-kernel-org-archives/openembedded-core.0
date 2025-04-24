Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E892FC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 14:55:24 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.17312.1745506517789299047
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 07:55:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=S3JMPZJj;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c14016868so1079014f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 07:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1745506516; x=1746111316; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WY6qLINdP9qtvD/DJWbCVSxNSA2R7UuLHOjHii9t/yc=;
        b=S3JMPZJjutUQFSJC8jA1Wz07scjHcVRFE9IBrvn8bYOoZ31v0+u2b0+FpDfrsuc3E8
         Cv51Y3vAHBrE6cpSm9kJDdikegPu1+bA8hYXquZON+dRfXaRHhsKYtprU5+1YNboBpje
         uJk6zyxVVpjUrLjfaAkTmY2alQQAZoILbrS/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745506516; x=1746111316;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WY6qLINdP9qtvD/DJWbCVSxNSA2R7UuLHOjHii9t/yc=;
        b=MTJ0877npBn4VqUdBgaqdngvCtEGnumOT6WBE1Xu2jAeZTSI9Af8VXCLU0jp8P/Vuh
         AkOKKr3aoJF4QFjjKmhmapAkTCBJLp0B3DcS01IfdDFEOBSAkFqG07SKibapA9tlJeco
         1IIL9zNYIALwPzTtFJdOisNIOm3PzUXuLoMFO1sX35XjO5FaRcY9BdE9yDYnIfLYs1Ce
         f0q7DXAqf5BRh7FZK7sQeIPeIY1kVK2V2H0Hy5kqJnN5vfe0EVRnzOP0geqtHJ7LT9HW
         1rH13PSlJqEaatE6ZLqnbX9Y77DzU1n04obBio6FQGrgKTPd6vQBZs/yAujqFvLOJtwX
         bzgg==
X-Gm-Message-State: AOJu0YzCcjZQJgp8OFXKPHRlGHmXkczNEVeqlKKZIQoLiPbOLLnUQVmC
	Pzmml5B00cTO91Xyeu/Qi+/9Xyky1WOuZPfoouOBJIp4f4x2ziGjlDvdFiQ0YvUZcJuwaYbHabY
	q9RlYmLzNgpFi0LhZgQSWD5NQb7QSJHLYeiCgSQ==
X-Gm-Gg: ASbGncuu0P4RY+I5FfwnWkCmZQJWAyE9qg/a3pFnonRtoPVnjazbGSnIc1PWQS72ktE
	y+VGflxP6j1cNPYTt2NA9nbciX8HO+EXYZOpyxuJTvNTcK64nlZiAgPaUJPSZmcLISviQWpbY4E
	z+ORm6L2fSuRybeurjzQ6X9AxurN0j/9DENccy0T5jp/DbuzI27MruqQ0h
X-Google-Smtp-Source: AGHT+IH6aKN9omq5ppZeFn7zUOtOZULUS9Z/c6MQ+CoDTWuTuxxsbuXUkrhR9CR73pMzjHmoD+I0BPbvXRy9XuhRWh8=
X-Received: by 2002:a05:6000:40e1:b0:391:41c9:7a87 with SMTP id
 ffacd0b85a97d-3a06cfb2564mr2505912f8f.51.1745506516016; Thu, 24 Apr 2025
 07:55:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:66c6:0:b0:390:d73f:69ef with HTTP; Thu, 24 Apr 2025
 07:55:15 -0700 (PDT)
In-Reply-To: <20250424123217.885006-1-ines.kchelfi@smile.fr>
References: <20250424123217.885006-1-ines.kchelfi@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 24 Apr 2025 16:55:15 +0200
X-Gm-Features: ATxdqUF3_MZFGskhQf96NEJPX-cU_iN1jVwp81QPCPvCobf-hiEGCvJOUexsX1c
Message-ID: <CAMSfU+5on4h-fKBjNrafGEEZXPS64ktCdE+u6eyPH2qkek+Zfw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] ptest-cargo: refactor run-ptest generation
 to remove redundancy
To: "ines.kchelfi@smile.fr" <ines.kchelfi@smile.fr>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d73d8c0633876762"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 14:55:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215385

--000000000000d73d8c0633876762
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 24 avril 2025, ines.kchelfi via lists.openembedded.org
<ines.kchelfi=3Dsmile.fr@lists.openembedded.org> a =C3=A9crit :
> From: Ines KCHELFI <ines.kchelfi@smile.fr>
>
> This refactoring simplifies the generation of the run-ptest script by
> removing redundant logic and improving readability.
> Signed-off-by: Ines KCHELFI <ines.kchelfi@smile.fr>

Reviewed-by: Yoann Congal <yoann.congal@smile.fr>

> ---
>  meta/classes-recipe/ptest-cargo.bbclass | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes-recipe/ptest-cargo.bbclass
b/meta/classes-recipe/ptest-cargo.bbclass
> index fd1df9d7c9..6799a454ac 100644
> --- a/meta/classes-recipe/ptest-cargo.bbclass
> +++ b/meta/classes-recipe/ptest-cargo.bbclass
> @@ -97,17 +97,19 @@ python do_install_ptest_cargo() {
>          test_paths.append(os.path.join(ptest_path,
os.path.basename(test_bin)))
>
>      ptest_script =3D os.path.join(ptest_dir, "run-ptest")
> -    if os.path.exists(ptest_script):
> -        with open(ptest_script, "a") as f:
> +    script_exists =3D os.path.exists(ptest_script)
> +    with open(ptest_script, "a") as f:
> +        if not script_exists:
> +            f.write("#!/bin/sh\n")
> +
> +        else:
>              f.write(f"\necho \"\"\n")
>              f.write(f"echo \"## starting to run rust tests ##\"\n")
> -            for test_path in test_paths:
> -                f.write(f"{test_path} {rust_test_args}\n")
> -    else:
> -        with open(ptest_script, "a") as f:
> -            f.write("#!/bin/sh\n")
> -            for test_path in test_paths:
> -                f.write(f"{test_path} {rust_test_args}\n")
> +
> +        for test_path in test_paths:
> +            f.write(f"{test_path} {rust_test_args}\n")
> +
> +    if not script_exists:
>          os.chmod(ptest_script, 0o755)
>
>      # this is chown -R root:root ${D}${PTEST_PATH}
> --
> 2.43.0
>
>

--=20
Yoann Congal
Smile ECS

--000000000000d73d8c0633876762
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>Le jeudi 24 avril 2025, ines.kchelfi via <a href=3D"http://lists.op=
enembedded.org">lists.openembedded.org</a> &lt;ines.kchelfi=3D<a href=3D"ma=
ilto:smile.fr@lists.openembedded.org">smile.fr@lists.openembedded.org</a>&g=
t; a =C3=A9crit=C2=A0:<br>&gt; From: Ines KCHELFI &lt;<a href=3D"mailto:ine=
s.kchelfi@smile.fr">ines.kchelfi@smile.fr</a>&gt;<br>&gt;<br>&gt; This refa=
ctoring simplifies the generation of the run-ptest script by<br>&gt; removi=
ng redundant logic and improving readability.<br>&gt; Signed-off-by: Ines K=
CHELFI &lt;<a href=3D"mailto:ines.kchelfi@smile.fr">ines.kchelfi@smile.fr</=
a>&gt;<br><br>Reviewed-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@=
smile.fr">yoann.congal@smile.fr</a>&gt;<br><br>&gt; ---<br>&gt; =C2=A0meta/=
classes-recipe/ptest-cargo.bbclass | 20 +++++++++++---------<br>&gt; =C2=A0=
1 file changed, 11 insertions(+), 9 deletions(-)<br>&gt;<br>&gt; diff --git=
 a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-carg=
o.bbclass<br>&gt; index fd1df9d7c9..6799a454ac 100644<br>&gt; --- a/meta/cl=
asses-recipe/ptest-cargo.bbclass<br>&gt; +++ b/meta/classes-recipe/ptest-ca=
rgo.bbclass<br>&gt; @@ -97,17 +97,19 @@ python do_install_ptest_cargo() {<b=
r>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_paths.append(os.path.join(pte=
st_path, os.path.basename(test_bin)))<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0p=
test_script =3D os.path.join(ptest_dir, &quot;run-ptest&quot;)<br>&gt; -=C2=
=A0 =C2=A0 if os.path.exists(ptest_script):<br>&gt; -=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 with open(ptest_script, &quot;a&quot;) as f:<br>&gt; +=C2=A0 =C2=A0 =
script_exists =3D os.path.exists(ptest_script)<br>&gt; +=C2=A0 =C2=A0 with =
open(ptest_script, &quot;a&quot;) as f:<br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if not script_exists:<br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 f.write(&quot;#!/bin/sh\n&quot;)<br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>&=
gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(f&quot;\necho \=
&quot;\&quot;\n&quot;)<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0f.write(f&quot;echo \&quot;## starting to run rust tests ##\&quot;\n&=
quot;)<br>&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for test_path in =
test_paths:<br>&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 f.write(f&quot;{test_path} {rust_test_args}\n&quot;)<br>&gt; -=C2=A0 =
=C2=A0 else:<br>&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(ptest_script, &=
quot;a&quot;) as f:<br>&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.wr=
ite(&quot;#!/bin/sh\n&quot;)<br>&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 for test_path in test_paths:<br>&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(f&quot;{test_path} {rust_test_args}\n&q=
uot;)<br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&=
gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for test_path in test_paths:<br>&gt; +=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(f&quot;{test_path} {rust_tes=
t_args}\n&quot;)<br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>&gt; +=C2=A0 =C2=
=A0 if not script_exists:<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.chmo=
d(ptest_script, 0o755)<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0# this is chown =
-R root:root ${D}${PTEST_PATH}<br>&gt; --<br>&gt; 2.43.0<br>&gt;<br>&gt;<br=
><br>-- <br><div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</=
font><div><font face=3D"Raleway, regular">Smile ECS</font></div></div><br>

--000000000000d73d8c0633876762--

