Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E2CC433F5
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 21:33:58 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web08.3365.1651527235511708894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 14:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=GtYFWU45;
 spf=pass (domain: google.com, ip: 209.85.208.170, mailfrom: wak@google.com)
Received: by mail-lj1-f170.google.com with SMTP id s27so19954837ljd.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 14:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MXNsdOnDI07xhYDJek1Tftka/eFhzyjhh3ajHsgx0N4=;
        b=GtYFWU45C/474cWOKjvnzAZtLhYSshAG/Rz7uPV6jgT1pap4Le65T/y5AvXxZV/AYi
         tDGbPYygPfka5Rk4xWL9xIY7YCQp/U6BOOlPRhzmG22HlyY969sO/UF0bj65iSunnEac
         fAfykjvPO5YTrNJ0dDebHyKCFQ35lt0o9vy+fMMHBgl7udk8Efd8OU28GYolB/kK9kej
         D3INbmN3w0yirjgYgA534EiA47pI3XXwe1TKnb+iAIeaxaVCecs09jdPNjLbEtMEF0ts
         1q/DnFXw93POXfVs6s2EOLVMnRFDX4C0/ztFafCT0N+L0FCcKigjFWU/DyvWeeqWr86K
         KdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MXNsdOnDI07xhYDJek1Tftka/eFhzyjhh3ajHsgx0N4=;
        b=NAx33vDtxDc1xo4/yhpo1CGuc8g/A3/+Rhp/CWZsT0L5qCd917OUnnbeYtgKHx8EHC
         XrzFRnNMyu5+z8h8HzZdPzEDt+efuayoreHnL14ntKfaw9urpTjEh0KYddUSL2+/RECg
         J+qTJ9Z9tnndYIc9lT4oYWzj5hQlwBSNtaZP3NldU4Rh8sE03sl3XPYN1/oYuT+vI5dc
         qCs2BLM27/74dBPmWdce7OqPlNoLr1RO3XNehV4QYptADo9t7YlKi4XNgPoY+619jZpo
         G6e0smCKtqIiyX3bVhLCSpit66kz8HUpnsL7Yk2Leqv6+ZWlGUKeZTCFEzFCfPcWHCou
         9kcA==
X-Gm-Message-State: AOAM532THCrwQ3IH0mlPHLZoX9W8BLj4s0aqIIcmQwS7VLWqQON0dnSR
	iDWc0Hxwqv2+owECiht9YSdxDgTX808S+SXtxryx9A==
X-Google-Smtp-Source: 
 ABdhPJxjnS27c85No/r83937CVsyjQ3vcAiuVvUQ+ZfDxfwr1jmc5kThWli3VJirw+/c+0ZhZjMJDfJjBY0l0dRTlD0=
X-Received: by 2002:a05:651c:893:b0:249:4023:3818 with SMTP id
 d19-20020a05651c089300b0024940233818mr8847863ljq.44.1651527233257; Mon, 02
 May 2022 14:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220502211001.4183095-1-wes@mitsi.com>
 <20220502211001.4183095-2-wes@mitsi.com>
In-Reply-To: <20220502211001.4183095-2-wes@mitsi.com>
From: William Kennington <wak@google.com>
Date: Mon, 2 May 2022 14:33:42 -0700
Message-ID: 
 <CAPnigKkL5LeyUj5NGwb0iYOeEBGSvm0FAO25zmVD2G9KATEijg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rng-tools: disable libjitterentropy due to cpu
 usage
To: Wes Malone <wes@mitsi.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 21:33:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165177

Isn't this desirable if you don't have an hwrng? We want to generate
entropy so we can perform cryptographic operations by default if we
bring in rng-tools.

On Mon, May 2, 2022 at 2:10 PM Wes Malone <wes@mitsi.com> wrote:
>
> After boot rngd maxes out the processor initializing JITTER entropy for
> some minutes. Here we disable libjitterentropy in favor of only using
> the hardware random source via config.
>
> Signed-off-by: Wes Malone <wes@mitsi.com>
> ---
>  meta/recipes-support/rng-tools/rng-tools_6.15.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> index 0696351903..4eed060960 100644
> --- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> +++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> @@ -21,7 +21,6 @@ inherit autotools update-rc.d systemd pkgconfig
>
>  EXTRA_OECONF = "--without-rtlsdr"
>
> -PACKAGECONFIG ??= "libjitterentropy"
>  PACKAGECONFIG:libc-musl = "libargp libjitterentropy"
>
>  PACKAGECONFIG[libargp] = "--with-libargp,--without-libargp,argp-standalone,"
> --
> 2.36.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165176): https://lists.openembedded.org/g/openembedded-core/message/165176
> Mute This Topic: https://lists.openembedded.org/mt/90845997/4454469
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [wak@google.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

