Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC35C25B10
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 15:52:21 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.14341.1715269940257262920
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 08:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HZSkz5J2;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5dcc4076c13so772040a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 08:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715269939; x=1715874739; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBAUmV2TzLmB43qGXzzIK4X5uOsS4jxzlOR4yjrVADI=;
        b=HZSkz5J2h50nmoaQIDc1HDgYxmrG/B4vdQoo3fX92QNe6jIhLjN5ujDBjwLDsNzbxy
         OLwt2ueg6fuJ4CaPtbKad6k5yy98tRv2Z1vd5UPZkzBpXGKRL3qmlBWuJqZ3No0+zS8g
         OKERkc3Dg+JpzbLUiC0nbGNufTHvfFbi54MDqRyCqDt6ZtmH42g6LbAWpeNlfN99MDNt
         wdeZneBq+kAKAg5jfj15qiPVlLAzJCIboqcoPGyZRwz8od6VtTBKC51NzI/Befvwd/ZA
         50vt/TgFx5Da3KGlrUFS7UaaQcJ7lFgP8zTwOhJMG7q0GQJa/n4lktpwH+F5J1/nKtvA
         OMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715269939; x=1715874739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBAUmV2TzLmB43qGXzzIK4X5uOsS4jxzlOR4yjrVADI=;
        b=mC9aQhSrpnCQ7YAHDBuJGm1dWzCRl+nK/7W0l019jBRL87hceN2EcOTlzNRS6XtrOb
         VUM/6IcRXS5pTNaeUYmZAjW950BgCrXuvt/DieX2BgnlpE8MIQCdbdCo8Gfa1jywQaiv
         axncfT3x11PTwEu+kTNXtbAR2OThKrW0nrhZyuzIMko1VyZw5wH7mwmiczoWl0rs61/v
         ptb/6uYrW6QOGZCw8KYmZYZAJoDlmAo2f7zaVsKQLkYmkPAh2f3m77tWpNFnm7ANsw8b
         OaG7eD9Kr69nNrjWMeEqFoXjbnKd33XkcJpr/MJhx92PLM8DW77LJT6dwBS5zgUyq1nl
         ln3A==
X-Gm-Message-State: AOJu0YzzrF12b+UN6g38fayX9bmAM6Ce41sT5RLqGXxixcT3ud+tocOw
	c7AMl9odGV5Ju1LbX1scpDDkYqGpkLwE8DidSdqmizcbsZSKmZdWqlBdmly4O3Bulo3gk5gu1nu
	gIfIsqfzMcOpIDpuPl8bFxLF2/V8=
X-Google-Smtp-Source: AGHT+IGKM5LQgoVsAHRcGv2aJSQgRI5OP01oJM/u4BECwr/RNPeIYXwDN5JXwTJTlKMHTxFKAx32iQ/+mI/1u7rj/t8=
X-Received: by 2002:a17:90b:2351:b0:2b2:9783:d0ca with SMTP id
 98e67ed59e1d1-2b6c71100b2mr145687a91.12.1715269939491; Thu, 09 May 2024
 08:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240509153641.1571390-1-raj.khem@gmail.com>
In-Reply-To: <20240509153641.1571390-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 9 May 2024 11:52:07 -0400
Message-ID: <CADkTA4N-ExjVcUX7mNkh1q4=dJkqYh8H9C_H3XV-hJcoBPDtYQ@mail.gmail.com>
Subject: Re: [PATCH V2] linux-yocto: Enable team net driver
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 15:52:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199178

Looks good to me! Thanks for the v2

Bruce

On Thu, May 9, 2024 at 11:36=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Its needed to run libteam ptests
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
> v2: Add comments in recipe on reason to add it
>
>  meta/recipes-kernel/linux/linux-yocto_6.6.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-=
kernel/linux/linux-yocto_6.6.bb
> index 71bfbf9e032..ec6fd838772 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> @@ -66,6 +66,8 @@ KERNEL_FEATURES:append:qemux86-64=3D" cfg/sound.scc cfg=
/paravirt_kvm.scc"
>  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("TUNE_FEATURES", "mx32=
", " cfg/x32.scc", "", d)}"
>  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/scsi/scsi-debug.scc features/nf_tables/nft_test.scc", "", =
d)}"
>  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
> +# libteam ptests from meta-oe needs it
> +KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/net/team/team.scc", "", d)}"
>  KERNEL_FEATURES:append:powerpc =3D" arch/powerpc/powerpc-debug.scc"
>  KERNEL_FEATURES:append:powerpc64 =3D" arch/powerpc/powerpc-debug.scc"
>  KERNEL_FEATURES:append:powerpc64le =3D" arch/powerpc/powerpc-debug.scc"
> --
> 2.45.0
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

