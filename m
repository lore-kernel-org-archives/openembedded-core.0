Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D888C001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 08:25:10 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.43628.1690187103955059641
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 01:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=VjFg0yZ7;
 spf=pass (domain: baylibre.com, ip: 209.85.128.43, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fc0aecf107so29928925e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 01:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690187101; x=1690791901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O60fPOAssXaYU84SUVhc86x5wslybxkrfzPSk9g5enw=;
        b=VjFg0yZ74U7Nzt10DAVDRrn9LIHyrlYq0FKTG6l6AECwaOiPfmsLGLXzdlV1mqRkPi
         gU0rj/10CF13MWWei/GhkLhYmlK1cTRL0rhACTjL21F9eWhM8SC6rQq6MIPXvX1jPJ9J
         /01kOVpVbDvld1xRJtyNdmLSKgCCfE9rQKgEiPi2NWi/NHTeGjytSQzI0DgJoxtGd65V
         S6S4KAEyz6Ca/1GWW5VcZwagKje3sbLFXKokmvsNQomLzEiT1K5V3JL4PJHxghh68Qjd
         kfWtoUtSl5sUMkfwgzytTRt8/uzQoXHnwST7O0RQyUonOnK5Xl2/oIwRx/4sL24KjPkz
         3FEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690187101; x=1690791901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O60fPOAssXaYU84SUVhc86x5wslybxkrfzPSk9g5enw=;
        b=U8p9d/w7RxmV+94y9c55O3IprGDv3J6vgxwUblVwMtVFo/OMrYBtsOfsZsdjvGfUXe
         1CC4nS7QrEcKVMHJ6xjEIRm0omYoEWZlyTujlKWP7UK1lYW99uBLAkPfC5crPJU0F4lz
         +nS6om6cgZj5U+5b0Hq6/Efer11oD5z4iPCksjqDlAEQxs+URS95kkpl+p2A5mFKXrkV
         A8SzSNylKKvn1EjhrplCwYxENRU1w6gahLcBhjOiWTFgQQ6Irr689yUiL/zQCAKsgyM5
         rmPjdRnF+3SHBeilj6JZcEoPoRE4kQu5NcVewgIFCY4v54qd0fbi1g2qU0+QdeVFJ3jK
         oVyA==
X-Gm-Message-State: ABy/qLbDOSJULzhTSmYBRx814/p5cxmpbdI5Uswyv9nqMDdW0vDrdIVE
	g2wzxQMCBziTX4fcYy96y9qgzg==
X-Google-Smtp-Source: APBJJlHAX6Szm4huERS0pFUI9CseHv2FMCr2EN/AXYYgcvjGBp68zfM3x9eI6vjzTUC/eb/FH9DF+w==
X-Received: by 2002:a1c:f201:0:b0:3fb:ac9c:e6f with SMTP id s1-20020a1cf201000000b003fbac9c0e6fmr6105181wmc.38.1690187101520;
        Mon, 24 Jul 2023 01:25:01 -0700 (PDT)
Received: from localhost ([2a01:e0a:55f:21e0:fd3b:9fed:e621:cc8f])
        by smtp.gmail.com with ESMTPSA id m11-20020a05600c280b00b003fa968e9c27sm12148071wmb.9.2023.07.24.01.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 01:25:00 -0700 (PDT)
Date: Mon, 24 Jul 2023 10:25:01 +0200
From: Julien Stephan <jstephan@baylibre.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RFC v2 0/2] Add bblock helper script
Message-ID: <b7qoln53fio3pwdngj2god5iy7lemvh46pys43lfewimdyfgam@d2vfmfbti4q6>
References: <20230721142543.246415-1-jstephan@baylibre.com>
 <CANNYZj8tCEDM51XrCgfUfMu0ExJqJEwQ7=vU+4e7vrRqdpsKCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj8tCEDM51XrCgfUfMu0ExJqJEwQ7=vU+4e7vrRqdpsKCg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 08:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184779

On Sun, Jul 23, 2023 at 02:11:14PM +0200, Alexander Kanavin wrote:
> Thanks for working on this. Should we think about how this could be tested?
>
> Alex
>

Hi Alex,

Do you mean we should consider addind self test for bblock? or you want
to discuss about acceptance criteria for bblock?

Cheers
Julien

