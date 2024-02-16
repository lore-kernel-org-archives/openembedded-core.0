Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0665C4829E
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 01:12:06 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.8820.1708045920596129573
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 17:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gDNqamPk;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6e2f12059f4so710945a34.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708045920; x=1708650720; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SS/ya8qZASjdVXBWUsTUyRObc7+7Aju3zc7GN2Do8s=;
        b=gDNqamPkY4P2nUoddE5Q0vuxhf1jzGoC1/aVM2L9qsapUBRCs85fhZ8bnTiKtVEohA
         TYE8i1OG383eOfPL3b12gU4uz9ttoSuuPJQlzwZGBInDM2vl7Tavr5xM4pk/sByrijYe
         /xGbJqdu/VqTvmzKoFG0wnazFQrxFOw2etm6R0SbeX88BPA0XTYbYTQfyIxFrUFXUnGa
         L7mQbDgx4fDpy6oARXC4wF44Y1gPE/9uk8jQYjxV/7cxmD2S68AZAY5LpVyP+5jVMwr/
         k7POtRrx/BQdTQnYjqfXC8bvDn/3453pQcI52eymmFEB1telgD4C8GvHn1rOQgT5aUG1
         A9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708045920; x=1708650720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8SS/ya8qZASjdVXBWUsTUyRObc7+7Aju3zc7GN2Do8s=;
        b=qKtOiChFg0fG9s9A4FuFdZqoDK0b2mgA3h3KG9JTh84KNypk8/KrL3mGiv+H8239aO
         bOxP3hoWazyX3AoaaSoLPzYr+Q1+YjsI8IGzmGi772ldgGXw7tAyv8j7n1niFVz859Hr
         emQFNTbJyGa06I38oY19phaTOqTtC3yN0CmdQCJyQw2ROUc2RLi7M+NuySt6JJ20PJuA
         SN5MZw5jjbAj9k/3PQJyh7tX3uou/NOxSh2J2V9m46Y6iNJesc8PJ6qzUw7Gg/yzmZDb
         EChSPMDQK922mDywVePrbFqo555r6EYB243ELo6N8s3iC2Q3+R/ATuPVKpS0TdXHlw92
         l4vQ==
X-Gm-Message-State: AOJu0Yz1JZqT4jd91cbKPX/9dogkmxmmDdW6ph70kldzgnhbZLp+bjxW
	/GbCppde6POL4CX9vDCetryLZUphtBs/0+vwXGPJW2lMYwBnfexVUJV+gurEzwGGBMjRD+sgfxu
	6koSEkiu5ezg1osbYeWUzkJvkqRw=
X-Google-Smtp-Source: AGHT+IH7tpiTYU/OsYJp70+8gWlRtVrAqskG30d7/MhB8oBGwDSXWUifWDr7pxWr2uMhvXrBLQYihP+5fLGRaYw0pTI=
X-Received: by 2002:a05:6870:4728:b0:214:fcc4:e384 with SMTP id
 b40-20020a056870472800b00214fcc4e384mr3598617oaq.15.1708045919587; Thu, 15
 Feb 2024 17:11:59 -0800 (PST)
MIME-Version: 1.0
References: <20240215212856.47492-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240215212856.47492-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Feb 2024 17:11:33 -0800
Message-ID: <CAMKF1spSaVrb5c2Cnm_2t=-rB0EbV57BkK22v=pfMsnOm1gsKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] openssh: Add a work around for ICE on mips/mips64
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 01:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195733

On Thu, Feb 15, 2024 at 1:29=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Unfortunately the new openssh version has an ICE on mips. This looks simi=
lar to:
>
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D104817
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D104820
>
> Given how long these have been open, workaround the issue by disabling th=
e compiler
> hardening options on mips.
>
> It is likely better to do this than have the open CVEs for everyone
> as we can't upgrade.
>
> An example:
>
> | during RTL pass: zero_call_used_regs
> | clientloop.c: In function 'client_loop':
> | clientloop.c:1699:1: internal compiler error: in int_mode_for_mode, at =
stor-layout.cc:407
> |  1699 | }
> |       | ^
> | 0x14d0acc internal_error(char const*, ...)
> |       ???:0
> | 0x5cf765 fancy_abort(char const*, int, char const*)
> |       ???:0
> | 0x826f1f emit_move_insn_1(rtx_def*, rtx_def*)
> |       ???:0
> | 0x8270c5 emit_move_insn(rtx_def*, rtx_def*)
> |       ???:0
> | 0xb7b994 default_zero_call_used_regs(HARD_REG_SET)
> |       ???:0
> | Please submit a full bug report, with preprocessed source (by using -fr=
eport-bug).
> | Please include the complete backtrace with any bug report.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_9.6p1.bb
> index 6366cefdf96..1fd36a266fd 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> @@ -81,6 +81,10 @@ EXTRA_OECONF =3D "'LOGIN_PROGRAM=3D${base_bindir}/logi=
n' \
>  # musl doesn't implement wtmp/utmp and logwtmp
>  EXTRA_OECONF:append:libc-musl =3D " --disable-wtmp --disable-lastlog"
>
> +# Work around ICE on mips/mips64 starting in 9.6p1
> +EXTRA_OECONF:append:mips =3D " --without-hardening"
> +EXTRA_OECONF:append:mips64 =3D " --without-hardening"

Perhaps just use mipsarch override since I imagine it will impact all
kinds of mips.

> +
>  # Since we do not depend on libbsd, we do not want configure to use it
>  # just because it finds libutil.h.  But, specifying --disable-libutil
>  # causes compile errors, so...
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195704): https://lists.openembedded.org/g/openembedde=
d-core/message/195704
> Mute This Topic: https://lists.openembedded.org/mt/104381904/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

