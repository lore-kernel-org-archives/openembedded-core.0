Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45113C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 21:23:48 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.5270.1739309018293869990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 13:23:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CEcghGIE;
 spf=pass (domain: linaro.org, ip: 209.85.128.169, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6f9cc6fefa8so26270717b3.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 13:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739309017; x=1739913817; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8w3vCreIOl+iCVdzBsE7PTkgsC0UKwgelZHaho3mQ/o=;
        b=CEcghGIE9x9OWPuLfbJjQmC//T2u2hzDapByttDqNIZc1NWt3dyo8ZOcs6kcFuaZLN
         2tdRjccOloxZllf4kzrICxufugZO+kF67aVDgisiJY/p6tQ4qDnIUhFx7HV46UV6OWhM
         F5iVvkRYL8m6LMsYGRhsKOvAoxY/brGR03+oU3PnbbjT95xDuX7IMjYECEY1ZGOzuEPx
         hOdayw0pXjghkKb/ElWp4PUmhXMe7Ho86QanK+lr4upV6ix5mFBdp5Npr4coJkoALJZT
         MZSWjb7gOr33BAwW6FatFqRlPIqnfHYez6GGAwOhXLgWXXSvspeG0et9dc8XVt5esbeN
         zu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739309017; x=1739913817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8w3vCreIOl+iCVdzBsE7PTkgsC0UKwgelZHaho3mQ/o=;
        b=RuUtnRYUnvfEitDMzaz/7yrh/A5wJv3K03hg9dtYpUADIed7IHWgujzYJln0b6ZjBG
         npjoavhmp/ZRinz0O0poAvpA4v/tTIBsjgxNNTYrOUvRUf+86kSsEafqeD4tMy/0aVKH
         1IuLPOwvpDgqTMWetPwJMhgNfhCR8s9rLrpRzR+cbnpVwypeDCdESorjPlMnPsPzcnMx
         Cgeoay+bXcVZBxJSqDFz8q0AHp7ZvrL+cmgF9wazhYL6FFOqgQLJcoC8VowcUT18AMdc
         XRLHTCrPyL1KZCxRVQ6bJFiXN3G2Z7TKEhs5GeXMkf2PcRszidUWWUF09QXe6LeieXj2
         HG+A==
X-Gm-Message-State: AOJu0YxE9HOJWBPJ4tX89whLX6+v0hqsMgFmc2QN4Z8aNoi66nVtnIeo
	bIu2lPKcDhPci6STBZXKkQmDrpA7gPZbe5/tZXZgKvS3xydUVwfEBrMsu02++38+EAETM3+ZWMs
	3BTlIWJk794Y4no7PngwjrPOz+gEYYh0FEAngGQ==
X-Gm-Gg: ASbGncveSvtRbbpW1viMn1jaqGrswHNAM/6IdHx4t12+1QlfZWr5+7PKzjDyyRkg8EZ
	CTPLA8VJCgLNirtKFzccCueGCnZzROxM8eYauUnw8QM8yZ4hvI1usQcx9gJEYLYjdG+m3YBXq/p
	8/HJF1Dn3mDHcj2jcFG/GFmZCqaQhA
X-Google-Smtp-Source: AGHT+IEUW68o6MtaKawpeL1pv6GL4ENAAvfcnFqzy2N6Dc+aEax/HT2rqREq2Wt0TEdE9jxcKIr67mDdSgQKWKbAOoo=
X-Received: by 2002:a05:690c:7246:b0:6f9:447d:d1a2 with SMTP id
 00721157ae682-6fb1f24f99dmr15832267b3.29.1739309017436; Tue, 11 Feb 2025
 13:23:37 -0800 (PST)
MIME-Version: 1.0
References: <20250211185151.995828-1-quic_vpuar@quicinc.com>
In-Reply-To: <20250211185151.995828-1-quic_vpuar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 11 Feb 2025 23:23:26 +0200
X-Gm-Features: AWEUYZkgIMvWXjoQAs6RyMgRzXUX2uyY354cncI979pozsu9X2MaCnlpTfDqtrs
Message-ID: <CAA8EJpr+ffQvF0DaA5YHS43=_goPtheRE8y9mLCDUfgFH9MiZg@mail.gmail.com>
Subject: Re: [PATCH] linux-firmware: upgrade 20250109 -> 20250211
To: Vivek Puar <quic_vpuar@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 21:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211186

On Tue, 11 Feb 2025 at 20:52, Vivek Puar <quic_vpuar@quicinc.com> wrote:

> License-Update: additional files

Not only "additional files", there is a new Qualcomm licence, which is
not caught by this patch, NAK

While taking care of the new Qualcomm licence, please also note new
ath*, qca and qcom/ firmware. Please extend corresponding split
packages.

>
> Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  ...{linux-firmware_20250109.bb => linux-firmware_20250211.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250109.bb => linux-firmware_20250211.bb} (99%)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
> similarity index 99%
> rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
> rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
> index b932300742..6cadf99d47 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
> @@ -158,7 +158,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
>                      "
>  # WHENCE checksum is defined separately to ease overriding it if
>  # class-devupstream is selected.
> -WHENCE_CHKSUM  = "c90a25ccbd027eb8d61b2943ab68447c"
> +WHENCE_CHKSUM  = "65c2919e6511a0d348a009ac419375b7"
>
>  # These are not common licenses, set NO_GENERIC_LICENSE for them
>  # so that the license files will be copied from fetched source
> @@ -247,7 +247,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
>  # Pin this to the 20220509 release, override this in local.conf
>  SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
>
> -SRC_URI[sha256sum] = "a12cb38f4793394bf56c6702be29b6e4f09deca0714943bba98a492030651570"
> +SRC_URI[sha256sum] = "2de1345897bf839d532c5de0fdb348770ca2a5f4edfb21971582597abb45297d"
>
>  inherit allarch

-- 
With best wishes
Dmitry

