Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4556ECE57B
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 08:47:22 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.48330.1725871633524756101
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Sep 2024 01:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P1NHRuyW;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso7498923e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Sep 2024 01:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725871632; x=1726476432; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AljDPeYCWi6U2c3iGmXqWDMrTD4GNKDZwoNODKXrcqA=;
        b=P1NHRuyWcQQ2dhRdKqaxZW3d080eqZP6TGp37f/+M0LkahPWDhTd4kI4uQ+Ykh2HlV
         DO8sws+xJ34wUk/tK41/R2c7yfUUQjiiornD+A/URVn1+vkl35tM/VY3hflxxDHbGuLw
         wNJ1Sjh7Vydmh6M/jZvXZ0mcJJcM2SZelXQZemZ42NDS4s/+md1sZ9Ci7ZRq1HOdNsuE
         l9fAFYonkOmdRA00zL3gZUqPlmMNSaBVMTT3YjHA4OUiqe9XFcVGRYMBdL3AkoMykGbu
         UiCJiW/W8+ZPYK75buPRbvXSs7MFHhljex1ETKjVfYpXRZPgBbDGJdHtqjn1mXJ497HQ
         H6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725871632; x=1726476432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AljDPeYCWi6U2c3iGmXqWDMrTD4GNKDZwoNODKXrcqA=;
        b=lZv6pUs2rU4nq3S4iathlOOolzXN/woL/3NLS34kMeFMxtRTtwB8r8XF436yYpqt3x
         ubZRGSFdnPYvZMfqkdAlnqfdNgptYsiIVR/U+xaVIkt2b0aVJjKj2pFACmnKST4EPy07
         AmgkVTz0APbylA8m8AfELXOwlXb5zNtx6zwrFlSWzVz14MM9IIhYP/cIscS8V5rVQocx
         +I0nbXaSB1fed5rSniSWGk6A695aRBAubPZdVDy2XFmvpu0cvgxFuBIYj7avTS01eo/J
         5nytzwRpvRn0kNeijasOoPDT6JnhFuVUxiFHbuWYke1AoNo994LEsag5sHwztjxY6Bw8
         0Rpg==
X-Gm-Message-State: AOJu0YzgasNSRttAFTQSLrRpQuSi+cHzycmI0NDey6UEs0AlaciMQiff
	q6sUXWSM1O7v4vhI/krNTIYwn8X6LhtmLH/L2gXeIikuMAEvDJU/l/RkLGM0ZxalcGhaw18kHHn
	h92I2vEAqqO9aui7wtG28yEkLZjo=
X-Google-Smtp-Source: AGHT+IHDPviZdBK3byInW83KUpy6iwDZ3sWiY1P44/+2e5+2IwRuZVyTws54BCdBRHHRDar25U4qDWum+GoNVZwRnBc=
X-Received: by 2002:a05:6512:ea6:b0:536:5551:b73f with SMTP id
 2adb3069b0e04-536587b547emr6291292e87.31.1725871630994; Mon, 09 Sep 2024
 01:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240908172311.3773048-1-f_l_k@t-online.de>
In-Reply-To: <20240908172311.3773048-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Sep 2024 10:46:59 +0200
Message-ID: <CANNYZj_aLfFFe14-YNYfGt5T05dRb_-N7NPSk3Tx5-j09xRtrg@mail.gmail.com>
Subject: Re: [RFC][oe-core][PATCH] mesa: add support for rusticl
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Sep 2024 08:47:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204319

On Sun, 8 Sept 2024 at 19:22, Markus Volk via lists.openembedded.org
<f_l_k=t-online.de@lists.openembedded.org> wrote:
> +Subject: [PATCH] rusticl/meson.build: workaround for rusticl build
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +---
> + src/gallium/frontends/rusticl/meson.build | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/gallium/frontends/rusticl/meson.build b/src/gallium/frontends/rusticl/meson.build
> +index eef09d8f01e..efac4cab964 100644
> +--- a/src/gallium/frontends/rusticl/meson.build
> ++++ b/src/gallium/frontends/rusticl/meson.build
> +@@ -211,6 +211,7 @@ rusticl_llvm_bindings_rs = rust.bindgen(
> +   c_args : [
> +     rusticl_bindgen_c_args,
> +     pre_args,
> ++   '-I@include@', '-I@include_cpp@', '-I@include_cpp_target_sys@'

This does need to be properly looked into, there's probably a better
patch possible, or a build setting we're missing, or at least an
upstream ticket to be filed. It's not a good patch when it says
'workaround' and doesn't explain the issue and the fix.

Alex

