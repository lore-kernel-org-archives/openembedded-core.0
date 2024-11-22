Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF00E69186
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 17:46:47 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.30535.1732297602685698553
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 09:46:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MWvQSk06;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3e600ae1664so1314525b6e.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 09:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732297602; x=1732902402; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SXaCNDuEruHL+kvKX0IKSe7y1Uk1v1hIj0QzgONML0=;
        b=MWvQSk06zGDKgNrLmTM2cxpPNSkHCWZGtFYAfeQFWxqA5cRtb3g/p/sU3STqSVZC/i
         jTfNHKt3UamtbygHvxCEhah8f+vwVyQa3UEXmN86ajwmQjynNG4qwtUtIYHMuHwx99iH
         4i2NcyD+1jKxlD+RI/WKjksZ9JyL7XhHVJ7s7Ga9Z2TQNLFLAEMDV+1ZBjQAPCStUcGT
         f8b+h8pQhVieySSOA/XqT8FEQLPFHfvX3TZpTNO6amUfYXsMTg1RZIa3+eAM1ZVDJM1i
         GLwm80JF8QaWda5NONqhsIZJbEBt4bx0Acg7slOvOasJBXYfB9TrR5J1rWW/786dw7iD
         +51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732297602; x=1732902402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7SXaCNDuEruHL+kvKX0IKSe7y1Uk1v1hIj0QzgONML0=;
        b=P9DAkdubl4ve/R2YFEqf7TC8SMaMjVRXsDsFfwG8kcMMjde+kguQvRm84RrdlLFJib
         VY01sULtOjzfWVm2RxzxRMmDPTBrqFIjaYjrVvP7z+VPP1OmYQl0HSXAx76EK+mLTvfw
         5Fupc/N+cTyw3V2HwD6fpMt56bwKf2APUneitQAw4teUEqyOLXvTb1any1HJ8vQFWoUK
         rFQtt9tT/ElGB+s5CByFLxAtqTfDPLAWK0eeR7wF46KSIAX9gWxjS87M1gA99UosAPEq
         Gs+BqBb+1kQM9csQhjq4FC9RZ27JVsuaqLiSm4co4q0xj5QP2uWEyJcpEtBpI3ux2N37
         An6g==
X-Gm-Message-State: AOJu0YyUrWVmUsI7ti1lSetTSUAeZ22ZwWdYB5lDNjYaeN71ksDIVF54
	Gvzgh5sy4dtmVUOHIQICGhhKfv1tvh8gUFW2Dsg02Mt4SkRS6lxQ6zz+esiyEGBGe8/sGj/dYqg
	mWbuzqrOQ7+JNZJkMfWIxgY2+fqs=
X-Gm-Gg: ASbGnctldVvXQg23QFbKcPDVaJ9pRbA1FOe82fdbAaZ/afJ/VbYw0tjapyGIUNtu1eJ
	cktj6vfnzgdOJXzD3JWU30sxRd28oJgg=
X-Google-Smtp-Source: AGHT+IEiHFS6LOFKYiIfo4x4sRcvainnW97pM4aauGbE1juSFedtH/UZMqq9eCAlybspll09hlXm7vxe06L0ffqRW3o=
X-Received: by 2002:a05:6808:ec6:b0:3e5:f656:dd19 with SMTP id
 5614622812f47-3e91582c839mr4720691b6e.19.1732297601827; Fri, 22 Nov 2024
 09:46:41 -0800 (PST)
MIME-Version: 1.0
References: <20241122110713.637176-1-ross.burton@arm.com>
In-Reply-To: <20241122110713.637176-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Nov 2024 09:46:16 -0800
Message-ID: <CAMKF1sp701tWGwDcQK3R2H2Wrs3m0GT8Afq_1YDMqMYhyo+Cig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: handle llvm-objcopy behaviour when
 reading .note.dlopen section
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 17:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207643

This fixes the problem with clang+llvm-objcopy, please install this patch

On Fri, Nov 22, 2024 at 3:07=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> There are two behavioural differences between the objcopy in binutils
> and llvm which resulted in build failures when building systemd with
> clang:
>
> 1) If the section specified in --dump-section doesn't exist, binutils
> set an exit code of 0 whereas llvm sets 1.  This means we need to handle
> the exit code so that we raise exceptions on unexpected failures, but
> return an empty byte string if the segment isn't found.
>
> 2) binutils writes the section to the file name directly, whereas llvm
> writes to a temporary file and renames.  This means we can't read the
> open fd directly, and instead need to re-open the file to read it.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/systemd/dlopen-deps.inc | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/dlopen-deps.inc b/meta/recipes-cor=
e/systemd/dlopen-deps.inc
> index eaf6ca1f79a..e0b333398c2 100644
> --- a/meta/recipes-core/systemd/dlopen-deps.inc
> +++ b/meta/recipes-core/systemd/dlopen-deps.inc
> @@ -12,9 +12,17 @@ python package_generate_dlopen_deps() {
>          import tempfile, subprocess
>
>          with tempfile.NamedTemporaryFile() as f:
> -            cmd =3D [d.getVar("OBJCOPY"), "--dump-section", f"{segment}=
=3D{f.name}", filename]
> -            subprocess.run(cmd, check=3DTrue)
> -            return f.read()
> +            try:
> +                cmd =3D [d.getVar("OBJCOPY"), "--dump-section", f"{segme=
nt}=3D{f.name}", filename]
> +                subprocess.run(cmd, check=3DTrue)
> +                with open(f.name, "rb") as f2:
> +                    return f2.read()
> +            except subprocess.CalledProcessError as e:
> +                # binutils-objcopy has 0 exit code if the segment can't =
be found, but llvm-objcopy
> +                # does not. Assume the failure isn't critical and ignore=
 errors.
> +                if e.returncode =3D=3D 1:
> +                    return b""
> +                raise e
>
>      def parse(buffer, is_little):
>          deps =3D []
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207600): https://lists.openembedded.org/g/openembedde=
d-core/message/207600
> Mute This Topic: https://lists.openembedded.org/mt/109720382/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

