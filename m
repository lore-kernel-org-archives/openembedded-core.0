Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33D6C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 21:09:38 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.6027.1672780173086870779
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 13:09:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lR0bT+51;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id m15so18697697ilq.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 13:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gM/jKFSxIsIIi0OlHAdsDUHwI+0938DTlwOne7j/h7Y=;
        b=lR0bT+516IRBqZIIdUPwNr0z5oSM9+myJ/aVGcnkGcLv7Kl1tKyHtgQlKnKOK0aNGI
         hdy4S1vUSGq7JdDwp6g0KrtNN7B4DtHabcX7Jijwe900UXuwrbQeWpQ7OYZU/TJCZEQD
         TzJF7JbzLoGD49uJh8hPuY1k7fCilTqrCfj6NTjr1gPWqytyB7+g3tWRm5ByPU9oXBqD
         oPcsD6W3I1CSSqGV+YGpLTRop6rt6rgtHxzZ1FjcaNjJF9awUYbFrtU8KsgsL+kZ4wYA
         VdcV1ghYigV0Z/DiL4MQMswcOvuD9R5YWdCXt036FrLGzpsiJR1YZkPxQwBMD0Cbnxnw
         /Q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gM/jKFSxIsIIi0OlHAdsDUHwI+0938DTlwOne7j/h7Y=;
        b=h0bL9tmHxjHSujna5a5CZk9BNWE+rqRIA36zUA1FawljGqYPtig/FHNXj+Kcrks9mo
         5yU19XIVHgBnFU75Z2Z2556jc34siMs8pJBIy56GH7KLBRisUe/A1wXOQA9cwgQgCsJv
         kEMABx06+hpQ663du/85Q9+MpZD80Y2XeTxDgFaKLUfzs2+T4FE3Tz2QIe/Lp/iPHgxE
         /JeqUNBRnepwiDy+JL1Mn1RI2So7oDsrw1SSwFsnGWssQ8kN5Qyt9sLGVPOZf+O8Ca6+
         xfSvSHRUWM9e28KaI1keis7RtcxEnlS/gAhZqTQ4Kb0i3sDvJGg8WBc/CRhhgMZZ3nFN
         g97w==
X-Gm-Message-State: AFqh2krasiOXLyIFlibjt7xqT38SPeRIFrXFReQTzCtEMkWkB0OwLaXf
	Xd/oogoZZizfafET/0a0XKDoWiVciCrWwBy9f8A=
X-Google-Smtp-Source: AMrXdXvPv1IQNXhxFEtBR3PPeA6NVjUVpTYvHdJhFjrZ3c+sPwaX4WSaylrFMz7fp/Auy9Mi4KSOsMlihP0onuqnmtU=
X-Received: by 2002:a05:6e02:1566:b0:30b:d301:1ceb with SMTP id
 k6-20020a056e02156600b0030bd3011cebmr4787350ilu.23.1672780172415; Tue, 03 Jan
 2023 13:09:32 -0800 (PST)
MIME-Version: 1.0
References: <20230103200553.52973-1-raj.khem@gmail.com>
In-Reply-To: <20230103200553.52973-1-raj.khem@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 3 Jan 2023 21:09:21 +0000
Message-ID: <CAO5Uq5TnesNYF5bUmiEFg+Hi4FG_VM3b31v_4Ggzs5un5YrHXw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/5] rust: Fix build with 64bit time_t
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 21:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175371

On Tue, Jan 3, 2023 at 8:06 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> The vendored copy of zlib undefines _FILE_OFFSET_BITS when
> _LARGEFILE64_SOURCE is defined and enabling 64bit time_t requires 64bit
> off_t ( _FILE_OFFSET_BITS=64 ), therefore remove this from the
> zlib module
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/rust/rust-source.inc    |  1 +
>  .../rust/rust/zlib-off64_t.patch              | 31 +++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta/recipes-devtools/rust/rust/zlib-off64_t.patch
>
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
> index 643494b37e..bfb625fb36 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -9,6 +9,7 @@ SRC_URI:append:class-target:pn-libstd-rs = "\
>  SRC_URI:append:class-target:pn-rust = " \
>      file://getrandom-open64.patch \
>      file://0001-Do-not-use-LFS64-on-linux-with-musl.patch \
> +    file://zlib-off64_t.patch \
>      file://hardcodepaths.patch \
>      file://crossbeam_atomic.patch"

I really think we've got this wrong... rustc-source is a vendored
tarball where anyone building out of it expects the same set of
sources, by carving it up, we're asking for trouble - in this case
libz-sys is consumed by libgit2-sys, which is consumed by cargo, which
wouldn't get this.

I'm going to play with collapsing all the patches across the consumers
of rust-source.inc into that include, as that feels like it should be
more correct.

--
Alex Kiernan

