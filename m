Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D9AC46467
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 07:52:29 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.59094.1672732345544008112
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jan 2023 23:52:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BeN/oj+l;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id f20so31038467lja.4
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 23:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qgY8xIS/IZltQlqajUdHnxIXShXSlt9BWLdLkwX6Ny4=;
        b=BeN/oj+lM36MCA2KQeCuR0d4P44Gmz84iEoeai3RhHCwFmVGF28oBC1J9ZBmkF6ap/
         9TZ0FiKaRESftQ5sYorIkgYhc0Ip2poJyDn9uWaLgoUGnw5PQt2jCpLKCdJHSdFZffW6
         aYAoglC6NCiFKz74O4hrO7lTbhGo5sXPDB7FtWc8YrK1TehOQ4oBJyfuEo1gCfAZElUV
         y6It1OIfi7DmK43cdB9Exs+UnDzoH+aRnHXYEmZkvgcVgr9IjPTyG5UfXs8iNE/E/uPD
         rdebWiKICaXYqIacYOK8H1PXN3ZEoOpBonYEpRA3S9R4W5h4RyBXuIY4pVVaVKfXAolQ
         mhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qgY8xIS/IZltQlqajUdHnxIXShXSlt9BWLdLkwX6Ny4=;
        b=DIDtBvyDnzudZY5+jLM8T8sNDodbR4gXBZu1RhU5//Fd+ldOuB1zefk6QMJyHCENw0
         Etzqw9TaPO+l6Hk0xn2FDwdsp+IAjk5msBdSDXuHA3mn4zM6m3trvvE9ie0q1Jb/ja24
         oncRdVIkhGm5sHhk6cUnPpdNrjOH2EbupNvEH0ssDivQM0Wt/Frpo/jKiIzl41cWpUmC
         SPIG3FeaT4nhDebQatta6QJTnra0H1MjwdDx9TZIAkKMc2lNwVIa4eY1N75A27DgtgIT
         YbCLks0N+RWenpRTpBvjp0a0nbnv2/nHBOKPyEw/HeMJ5FDX5rUlKbKggf/IZamV8w8z
         DR9A==
X-Gm-Message-State: AFqh2kpFllMROcLBTImh3TDGwZJ8/prIb6qmgthLO6tG22ngyVg0On38
	4YfGqQShtf3f2HwMx4X74BfOFBsGR5AC/WD+mHg/31B9
X-Google-Smtp-Source: AMrXdXtdeMDAb1D0AKPPgPQbGQShjr/dxZrFna5fqkKG+9jLBa84ysQ68pXo0+BqdiULSlw65GSc+abibvWizPnk2Zg=
X-Received: by 2002:a2e:2246:0:b0:279:bf32:34dd with SMTP id
 i67-20020a2e2246000000b00279bf3234ddmr3592769lji.31.1672732343585; Mon, 02
 Jan 2023 23:52:23 -0800 (PST)
MIME-Version: 1.0
References: <20230103073111.1586416-1-raj.khem@gmail.com>
In-Reply-To: <20230103073111.1586416-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 3 Jan 2023 08:52:12 +0100
Message-ID: <CANNYZj8N3E5J0_R+V24s2Y=_pJZjF=QUJXEbPeDD4Jh0x4mF0A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] stress-ng: Do not enforce gold linker
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 07:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175336

Can this be made a patch and submitted upstream? Patching like that
with sed is prone to silent regressions.

Alex

On Tue, 3 Jan 2023 at 08:31, Khem Raj <raj.khem@gmail.com> wrote:
>
> This can then be controlled by yocto environment through LDFLAGS if
> needed since we support multiple linkers and distro policy may want a
> different linker, moreover gold fails on ppc32 to link since its missing
>
> Fixes errors like below on ppc/gold + clang
>
> /usr/lib/clang/15.0.6/lib/linux/libclang_rt.builtins-powerpc.a(mulsc3.c.o): unsupported -mbss-plt code
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-extended/stress-ng/stress-ng_0.15.01.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.15.01.bb b/meta/recipes-extended/stress-ng/stress-ng_0.15.01.bb
> index 38fd6698b3..72893e7893 100644
> --- a/meta/recipes-extended/stress-ng/stress-ng_0.15.01.bb
> +++ b/meta/recipes-extended/stress-ng/stress-ng_0.15.01.bb
> @@ -23,6 +23,8 @@ EXTRA_OEMAKE = "VERBOSE=1"
>  do_configure() {
>      mkdir -p configs
>      touch configs/HAVE_APPARMOR
> +    # Disable forcing gold linker
> +    sed -i -e '/LD_GOLD/{N;d;}' ${S}/Makefile.config
>      oe_runmake makeconfig
>  }
>
> --
> 2.39.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175334): https://lists.openembedded.org/g/openembedded-core/message/175334
> Mute This Topic: https://lists.openembedded.org/mt/96024589/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

