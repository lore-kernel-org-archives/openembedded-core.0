Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4894ECA0EFC
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 09:45:20 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.13872.1756028710758992252
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 02:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NoKS47DU;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-70bb007a821so46060456d6.0
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 02:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756028710; x=1756633510; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T45UY28xiFmCcBsucgHSV5jO4DJew7AXH4VE2KgCxTc=;
        b=NoKS47DUvhUsH/DuDT+4UETVhlo/aD2gtgTfo1yoRfgUPZEJ9q7dwEDemNpRF38Fzh
         +nn4I2aBTvOOvVlbVDelSx95Mi4DsK8EasCHXn3ZybJDwt0eQR61v5Gf1r4xDLRfkR9N
         WK9bOWEjRB0sawGXlDoppCEwwGMv9b0ZuTHkMURpEGv9tRzTKzVBt5gIZEN9auhdI7PB
         5BdHJhenKkSzN4+ptpaAiqRPqW9qZLaa4jpRVkENJGdpoKH4wwLy0OHF4KSFzmei7mAH
         hDVl7x4aHCS132SY/JFTyOPABCMPMJx97hzV9DjpC38p0U3ToVolvWvMHPwLPS7ltC8P
         05hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756028710; x=1756633510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T45UY28xiFmCcBsucgHSV5jO4DJew7AXH4VE2KgCxTc=;
        b=eGi5aE6XH/Eg8dF2ULYEYMDQfRHHHQ1XIYGTSBOLnI7DZq7CXZItmjKFs1vwCt046T
         eHGgn06mNuYMiza9c8k+vCLw0CIg9EST/uYFvu76ct6rdHJIH73nNqG2YQZGQ/Hdfxww
         +yTujB9+WDy+CtJ0vbMPGoCtSccVPIuOomTMts/53XaMkvsmoKpkjO4gy8ZHx9qI830Z
         YwVGQJ1lP2fbO/rWk9BsXrL2/SgqVJJWKFX1wIFH2NDeyon9Ilqcx2rm1paTQkEmzLMI
         gSsqe8swxKA0udm1PZK0yB6VAEU/haXYm4atylrRk0SItxCvAa2NCBt1/heutORaik67
         gHsA==
X-Gm-Message-State: AOJu0YwRLaMioL7/kYz2BJkPSj/NKY/9A+/5Oj1eoM/0x9FFV7S5jx5S
	cHsBz9cg4o2+Qirwj3on5Y9sLJ6X9s1lwCYg5hhHdclLSRX8sAGkTUYybDsAQFuOqUkbZwEL3gB
	Ro61APHxpRo32HxwSjFm2PK8gCa5tIz0=
X-Gm-Gg: ASbGncvdSIgw9jmauUKKC0zYOnpmF9m4DNWFg4+o0DPfmhNeh+libjDvrNiNBHpqev9
	cM0EddxU1jk+z7cc4VttCEQ4Z5wGUsrnArtXWcbimFWSr33vnI+so+zFm8Riyn3c2vxhQz6BZ6g
	BXcUUtDcuSBvfrH1GjdsFPwC7fF4Hg35FWd1S0V5w92ipKM3Xb5iMM4nYF3fmACQHfZVABlzS1K
	aNizD2iPhBehgnbeA==
X-Google-Smtp-Source: AGHT+IGVAHn/TvE8EoyDDXkn3qUwc/oGG/3XSzezH7T/Qd/UZxfqMT0EPJtQ872rQ8WvuMPe90FG38I9kcMMr59gM6s=
X-Received: by 2002:a05:6214:2602:b0:70d:a3fa:2fb4 with SMTP id
 6a1803df08f44-70da3fa331cmr74377286d6.62.1756028709712; Sun, 24 Aug 2025
 02:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250822051726.2429206-1-raj.khem@gmail.com> <20250822051726.2429206-3-raj.khem@gmail.com>
In-Reply-To: <20250822051726.2429206-3-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 24 Aug 2025 11:44:58 +0200
X-Gm-Features: Ac12FXy5YipdkWD0WySqXpxaY_U2STZSC5jiMf8ONtKWrFwGLaciaeKH8CIUsAs
Message-ID: <CANNYZj8vA2j2XgQ=ZDc9djNOTSBc3XVYTd=Miqmfsd0sz7gMpw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] gettext: Force UTF-8 runtime and skip
 requiring ISO-8859-1
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 09:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222365

On Fri, 22 Aug 2025 at 07:17, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
> +do_install_ptest:append:libc-musl() {
> +        # Force UTF-8 runtime and skip legacy fr_FR subcases
> +        sed -i '3i export LANG=fr_FR.UTF-8; export LC_ALL=fr_FR.UTF-8' \
> +            ${D}${PTEST_PATH}/run-ptest
> +        sed -i '3i export LOCALE_FR="none"; export LOCALE_FR_UTF8=fr_FR.UTF-8' \
> +            ${D}${PTEST_PATH}/run-ptest
> +        sed -i -e 's|^LOCALE_FR="fr_FR.ISO-8859-1"|LOCALE_FR="none"|g' \
> +            ${D}${PTEST_PATH}/tests/init-env

This hurts my eyes. Can we install a musl-specific run-ptest or raise
the issue with upstream, or find some way to avoid all this sed?

Alex

