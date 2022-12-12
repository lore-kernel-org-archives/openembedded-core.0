Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF1AC4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 16:36:01 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.48247.1670862956167919437
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Dec 2022 08:35:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=cUWyRpzP;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.46, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f46.google.com with SMTP id kw15so29466898ejc.10
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 08:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0osOG5xlIItrfQPmUiPPW0fkFeoEz5B5G3dlk1ssCI4=;
        b=cUWyRpzPV63E5DBZExEPhyH8txKbMUMTV0uK+GoXpz5yst2rrj5qLSKoFYl0G6xGZI
         2se8qZWJXw5rmLgwBO9aNP12Cib5JTafFjvWu7v1IFpidFRKISUJ45kUjc6uAbOLo8aT
         G24xOCpcNfiStqhAYzWXa6zJoa85MdKqlQkWmhyKyBHYXYBjhJcLlZhrTmLhTSIfPKrP
         JE6srYkpZo6kSlOaEQS1IPMTAUIYqkTwAEJSGIvW3zZX7gNk5rH67CPqso2+3wC4hGkE
         AC9Mdkm5fo5bZVLF5+FCuk8EUBGw/KuyBglyWgTdQ4AJNUYHuXIVrj79VRCxV0h61fyS
         fu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0osOG5xlIItrfQPmUiPPW0fkFeoEz5B5G3dlk1ssCI4=;
        b=Wam/F3tt2LethdmUJhv00NSPefL+T04SVuhghXSXrbexVcUPYhFReKVTnxTRcdb4Sd
         oe3S/5DRa8uAzGw+tbOWa7IROzfMA5vD9UQ6c55+QbwyVRZ3B1Nn26cOratJaCSmUFpi
         6mTh8YDhzZzUN4hsudvuhhY3UOEj6UgE8oX2gz7NoQs7Wfsjmp4bjomJ/OHtxD/A/Iie
         b6F4DHeJ3qkJGONiXiQCLhcYepz+COxxnfZcdyuCMH9XDBmDO73Re2K1AKD2WqAywxp3
         H0UOQuDgsesO/BpXkQKVED3zGuMQiqbmyDM+0rrSxWMFdZZBz8ZgMDjayK6Y01IWlOky
         SHCg==
X-Gm-Message-State: ANoB5pnIAlLPmg5brLyab65vMslKTm04krmE7TdLRmE1jcaqBQFAvgJ2
	YxplkTp7zkWmEVz4DqIKfi4SK/GuTuSsDviADcMj8eXnRnJrWDL6tRi+pQ==
X-Google-Smtp-Source: AA0mqf4UaVekUHxrFnPcVhKDnj7C+2aX52frYuWswAytg8BK/a8JwkM7JtyBhasNOC80+pbjzFytNGzAIA7gabW+j34=
X-Received: by 2002:a17:906:99d1:b0:7c1:7808:c469 with SMTP id
 s17-20020a17090699d100b007c17808c469mr306748ejn.584.1670862954524; Mon, 12
 Dec 2022 08:35:54 -0800 (PST)
MIME-Version: 1.0
References: <20221212160827.894775-1-soumya.sambu@windriver.com>
In-Reply-To: <20221212160827.894775-1-soumya.sambu@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 12 Dec 2022 06:35:43 -1000
Message-ID: <CAOSpxdajMzQ4x5ip4+v5gaQ_o3Yh-MHAUQWN99sVxKQK+0yxww@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] pixman: fix CVE-2022-44638
To: Soumya <soumya.sambu@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Hari.GPillai@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 16:36:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174499

I think you may not be using the current kirkstone head, there was a
patch accepted for this CVE last month:

https://git.openembedded.org/openembedded-core/commit/?h=kirkstone&id=1d2e131d9ba55626354264d454b2808e84751600

Thanks!

Steve

On Mon, Dec 12, 2022 at 6:08 AM Soumya <soumya.sambu@windriver.com> wrote:
>
> pixman: In libpixman in Pixman before 0.42.2, there is an out-of-bounds write
> (aka heap-based buffer overflow) in rasterize_edges_8 due to an integer
> overflow in pixman_sample_floor_y.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2022-44638
>
> Upstream-Status: Backport [https://gitlab.freedesktop.org/pixman/pixman/-/commit/a1f88e842e0216a5b4df1ab023caebe33c101395]
>
> CVE: CVE-2022-44638
>
> Signed-off-by: Soumya <soumya.sambu@windriver.com>
> ---
>  .../xorg-lib/pixman/CVE-2022-44638.patch      | 36 +++++++++++++++++++
>  .../xorg-lib/pixman_0.40.0.bb                 |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
>
> diff --git a/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch b/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
> new file mode 100644
> index 0000000000..5705d8e4e5
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
> @@ -0,0 +1,36 @@
> +From a1f88e842e0216a5b4df1ab023caebe33c101395 Mon Sep 17 00:00:00 2001
> +From: Matt Turner <mattst88@gmail.com>
> +Date: Wed, 2 Nov 2022 12:07:32 -0400
> +Subject: [PATCH] Avoid integer overflow leading to out-of-bounds write
> +
> +Thanks to Maddie Stone and Google's Project Zero for discovering this
> +issue, providing a proof-of-concept, and a great analysis.
> +
> +Closes: https://gitlab.freedesktop.org/pixman/pixman/-/issues/63
> +
> +Upstream-Status: Backport
> +CVE: CVE-2022-44638
> +
> +Reference to upstream patch:
> +[https://gitlab.freedesktop.org/pixman/pixman/-/commit/a1f88e842e0216a5b4df1ab023caebe33c101395]
> +
> +Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
> +---
> + pixman/pixman-trap.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/pixman/pixman-trap.c b/pixman/pixman-trap.c
> +index 91766fd..7560405 100644
> +--- a/pixman/pixman-trap.c
> ++++ b/pixman/pixman-trap.c
> +@@ -74,7 +74,7 @@ pixman_sample_floor_y (pixman_fixed_t y,
> +
> +     if (f < Y_FRAC_FIRST (n))
> +     {
> +-      if (pixman_fixed_to_int (i) == 0x8000)
> ++      if (pixman_fixed_to_int (i) == 0xffff8000)
> +       {
> +           f = 0; /* saturate */
> +       }
> +--
> +2.38.1
> diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
> index ccfe277746..c56733eefd 100644
> --- a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
> +++ b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
> @@ -9,6 +9,7 @@ DEPENDS = "zlib"
>
>  SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.gz \
>             file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
> +           file://CVE-2022-44638.patch \
>             "
>  SRC_URI[md5sum] = "73858c0862dd9896fb5f62ae267084a4"
>  SRC_URI[sha256sum] = "6d200dec3740d9ec4ec8d1180e25779c00bc749f94278c8b9021f5534db223fc"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174498): https://lists.openembedded.org/g/openembedded-core/message/174498
> Mute This Topic: https://lists.openembedded.org/mt/95624429/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

