Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9891D609A9
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 15:20:16 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25059.1765898411030390661
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 07:20:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aP4fXL43;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-45066bee74aso1196340b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 07:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765898410; x=1766503210; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdH8fPvLGQ0pHaeWXrz4TyRPgCJoRdFYh3QuibhVZd4=;
        b=aP4fXL437LnlSK1ZqFCKyNluuEYsLh/cusBYBt+w6tbWh1m0QQr4UMZP0xTx15saB7
         R48c4MEaFTOJUBjiCX+kndzSXrcjVO4L/DSJVcvHsuCFPdMnJ+Menyfyc2tc4CQfgdmq
         h7T+FvposoCbYaWp/b/wICeeLVzoCpGlfq9Pebt1vIZYLwh5qVBL6muNQKnh7psVzgrH
         kRO9w1UJQ7Kwoo7ed/LQboS2qA64IGocpV2IjAQ5bx2FD+VSVu8kaHgxMV3/yiAqJaAF
         bBFExWPlrWN10wtmDOpLfazTu885hUz0FiKEQAgBgK1FkzaXtJMXcj9qMTwgsaSRVjAT
         87Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765898410; x=1766503210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cdH8fPvLGQ0pHaeWXrz4TyRPgCJoRdFYh3QuibhVZd4=;
        b=Xt05G4MzHii50zUXBhjdMubxOA7C6QYZObar9tRMS1FZWJ2gZuL7Geoi0RroWpPSTb
         S5qgD8SQlZItwUOP7runKEgya6dHTVHJ4zHdq9BP7maZ3BcfN728wtp1eBT2Nh5dkwVC
         nK2HUdosCZv6roE4uZLjkHS/tkEzW54ClCZzKRRZ4gTcQImAwVdcCcWg+MnfR1iB1quS
         tcb01hs3EdzMnN58b/BIRd2UTZel2GwYyF7COq1VVfrbyvJ4ouy+INScaMihKeQYR7ue
         /++WyQjFaTs43yXAsf2/fAppN1BKslAD5i5/rPw2eROHYFy8IVWRUMFxfyFWUMMbW12j
         eYRQ==
X-Gm-Message-State: AOJu0Ywq2Tqkx/9Fq5nqShMV+O9VBwT1V8+qtg+fYyBOUd6CDvqW1APh
	sSKLyaO8vWfItaEm3bIVReZBISkArD9o4UjwRknKA+t+q7m4N3EnWQCwtm1aQyXNPiI6mLSaUYm
	wKkQR4xFJGv04VoCv8CEGUDV4KfpEQm2mFA==
X-Gm-Gg: AY/fxX64iPltKEDZ5b1pyjQJPzgb8MQ9dQHpvuw+Pas/xlxg8WfDASN5JEyev14pqsc
	G8qnPRmzk9Nm+hV1TXVpfbymmYVGSUfcNIBvuy6rpQ4RnW9Zl5n1oJ0oTvI5l0AsXGSzbcKhGHi
	EGK7hmp4nWgk91GY64jwDQ1OTYg/VfqEU3wOkQxv6rmJ50m13OjoK0+SKTRCgdEiOFwKqN8ol4O
	9MrJt1h92LTpGF4Fr0GLPF4Zq88y+PJ01tuxp6M9VO7lWje7SocaGnmHz0T9WYlMKmszLmgGA==
X-Google-Smtp-Source: AGHT+IErJ9vPDSTIpulMgYY/d2TUo8vjlyDxXkkFeH+OoE99m5vzuMh8IHlKEkIUL/PFML0dEBiKtTZH8F8P0kUA6so=
X-Received: by 2002:a05:6808:801c:b0:455:dee5:8b56 with SMTP id
 5614622812f47-455dee58dd4mr1369281b6e.39.1765898409927; Tue, 16 Dec 2025
 07:20:09 -0800 (PST)
MIME-Version: 1.0
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com> <20251213095931.2571498-5-ankur.tyagi85@gmail.com>
In-Reply-To: <20251213095931.2571498-5-ankur.tyagi85@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 16 Dec 2025 20:49:59 +0530
X-Gm-Features: AQt7F2r3dMZHN6n2-cwCX80HuIHr4kcTz-GdXXOkxiGKMFOg-bAdkDpwYJfsltM
Message-ID: <CADySD0FNGbFtrCXw1FRLMXeTxX2xBMHcZ2RKRgEdScTj7Ohe_Q@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH 05/67] weston: Add PipeWire as
 runtime dependency
To: openembedded-core@lists.openembedded.org
Cc: Veeresh Kadasani <veereshkadasani88@gmail.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 15:20:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227966

My recommendation is to include this patch to maintain functional correctne=
ss.

On Sat, Dec 13, 2025 at 3:29=E2=80=AFPM <ankur.tyagi85@gmail.com> wrote:
>
> From: Veeresh Kadasani <veereshkadasani88@gmail.com>
>
> - Add pipewire as a runtime dependency in PACKAGECONFIG[pipewire].
>   This ensures the PipeWire backend is properly enabled and the
>   runtime dependency is present when selected.
>
> Signed-off-by: Veeresh Kadasani <veereshkadasani88@gmail.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> (cherry picked from commit 9f5286725ad4c3ab241ce7992f992d4e81acc81e)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta/recipes-graphics/wayland/weston_14.0.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/wayland/weston_14.0.2.bb b/meta/recipe=
s-graphics/wayland/weston_14.0.2.bb
> index 451fb961a1..73c9ce38bf 100644
> --- a/meta/recipes-graphics/wayland/weston_14.0.2.bb
> +++ b/meta/recipes-graphics/wayland/weston_14.0.2.bb
> @@ -90,7 +90,7 @@ PACKAGECONFIG[shell-kiosk] =3D "-Dshell-kiosk=3Dtrue,-D=
shell-kiosk=3Dfalse"
>  # JPEG image loading support
>  PACKAGECONFIG[image-jpeg] =3D "-Dimage-jpeg=3Dtrue,-Dimage-jpeg=3Dfalse,=
 jpeg"
>  # screencasting via PipeWire
> -PACKAGECONFIG[pipewire] =3D "-Dbackend-pipewire=3Dtrue,-Dbackend-pipewir=
e=3Dfalse,pipewire"
> +PACKAGECONFIG[pipewire] =3D "-Dbackend-pipewire=3Dtrue,-Dbackend-pipewir=
e=3Dfalse,pipewire,pipewire"
>  # VNC remote screensharing
>  PACKAGECONFIG[vnc] =3D "-Dbackend-vnc=3Dtrue,-Dbackend-vnc=3Dfalse,neatv=
nc libpam"
>

