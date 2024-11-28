Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AEED690ED
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 08:43:36 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.90483.1732783413353356055
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Nov 2024 00:43:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kJNmkAAk;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-71d4994dfbaso886236a34.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 00:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732783412; x=1733388212; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6nsjLCQO4auPIeUqOBg4rJjNBqfGF9MqCwDFgOVkAw=;
        b=kJNmkAAkqI1CQZbWujFCyvnz3aM3g/ULnx26qVEUNoSRzs2NIRGhHwl6x14MhhE0pk
         9eCHplfVIqdkCKlXugT477Z20ZZwzoFBMC2HavmIJAufTtbsYjR6hbpSXGN3n/qyX3Ox
         BVe7vhYmhgXeQyljPVexbw983jow0FacrlOLRGK/HNj4+44csrMJ9VDpTBc6OjQA4xTB
         eqniKoZtjgWue5ZFPiLz7KuOc8XKMeaHdRwdiaOnJB3bvi0O4srB8HFhFfFzq2+ugawV
         JMRDdAsSGKmjuHruOQr3qPp/oWv32IWwMiNZvJvgZt3kmCGEKz0Ym4H+hS6vVnUEi9Al
         1RvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732783412; x=1733388212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6nsjLCQO4auPIeUqOBg4rJjNBqfGF9MqCwDFgOVkAw=;
        b=G1gQ3oqrJ1NFQeOtDk5lePjG3Hbikckd8D8f6sGtTp2Hdk6muBsM22m9+Ai5oU7ApJ
         eWF5c6IBEnZ5Tt03v9dPh3yC6sO2dnxO8YlROdfebMOfXDlUsgd+lf1TP3iNubpQd+9I
         aJC6z8ChrL7n05V0Io+Suy/05dM8Az0rhfyelwp1CFQuagP41R/m7ZTo29ZaCFI6Mz/n
         UM702PyW6IElu7+3dA8FiwmgtKCunTQVJ+3UYNSdu9o/QcJs1sWt8EBPc3+R+4WiOCNY
         OGiS70o4e77PZMGVeVdsfFQCUWAidOhnfpIIZDTwHjBM/X69cGlO4vzes+2ZchbS2FEp
         taNw==
X-Gm-Message-State: AOJu0YxS/H14eXoMhCrygcWJg5K3E5Rvzl7EwyofbanFlT3WT/EMn2Wv
	irE61i1m2TYapV5cLyxG9K6kLpTyIXcx0MzOwgDg1o38lFMdVrbotkD9iq2pgT1OZZZM8U6QuLY
	3YapQHD/D8m0cOKooLZFQP9r+egm3fw==
X-Gm-Gg: ASbGncu/4j0iXx89SlzcjPk72/RbN7qz0V3/fNwhKVYR2rseEBxUDpvF42wNSE3mLv3
	nMUkiMEbtg/+dsM2hADpnng7NFLFqv4yJxijyB8lL49fYbA==
X-Google-Smtp-Source: AGHT+IFUEuzEgTepxuGdoYkVnaiixauF7Gfm2eobL+BY+mQMUfMhK1z0g6TD+Z7O0wGvva+2c/o4TwOwguHHqjai/0w=
X-Received: by 2002:a05:6830:4883:b0:71d:4e44:f903 with SMTP id
 46e09a7af769-71d70c481cdmr1291857a34.12.1732783412475; Thu, 28 Nov 2024
 00:43:32 -0800 (PST)
MIME-Version: 1.0
References: <20241128083154.2298509-1-ravi@prevas.dk>
In-Reply-To: <20241128083154.2298509-1-ravi@prevas.dk>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Nov 2024 00:43:06 -0800
Message-ID: <CAMKF1sr6Xd5X7EwWPpKcdd6BCxLA+qWHX8zDHYjT=PmxZ82X7A@mail.gmail.com>
Subject: Re: [PATCH] gcc: remove unused JAVA variable
To: Rasmus Villemoes <ravi@prevas.dk>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Adrian Bunk <bunk@stusta.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 08:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207983

lgtm

On Thu, Nov 28, 2024 at 12:32=E2=80=AFAM Rasmus Villemoes <ravi@prevas.dk> =
wrote:
>
> From: Rasmus Villemoes <ravi@prevas.dk>
>
> As commit 81551871b183 (gcc: Remove Java support variables) correctly
> stated
>
>   Java support was removed in upstream gcc 7.
>
> but this line snuck back in with commit bbf32e24608c (gcc-9: Add
> recipes for gcc 9.1 release).
>
> Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
> ---
>  meta/recipes-devtools/gcc/gcc-14.2.inc | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-14.2.inc
> index f05484cfc0..f77493effd 100644
> --- a/meta/recipes-devtools/gcc/gcc-14.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-14.2.inc
> @@ -75,7 +75,6 @@ B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_=
SYS}"
>
>  # Language Overrides
>  FORTRAN =3D ""
> -JAVA =3D ""
>
>  SSP ?=3D "--disable-libssp"
>  SSP:mingw32 =3D "--enable-libssp"
> --
> 2.47.0
>

