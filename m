Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF18C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 11:06:58 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.92244.1701083215845013491
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 03:06:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kmOSr5mQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c876f1e44dso50069201fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 03:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701083214; x=1701688014; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fhErRSfisNBEss2qD0b+7MOuMYZucuXoQSc1pAeKyo4=;
        b=kmOSr5mQZI0Sx0XSyqziiCtpcvSyRDHXz0cyZIEO8gek3bWKAM1qC75LkT8h2TFvkr
         avCMm+PQSO8wsyOhkCEdif0sTilS8DnPv8PiuXMy/P7SJK0ffktIk2uWrCoqozDYGx7b
         ZzTHy6pgMTF6NcvbFCj4S2Ji2iSQNGdFzJma72OjdIIYoDuX649lKxJr+wHRcYmaQzac
         i1/QTjy/FpmfTvCEFzY5zKMV3hHDNILF9GWA3EoBhXhu9quIP82lfNRB1tsykhbK5uIv
         /MnXECqOSkw9Ut8waMnve92AmzzoMf5zNq3aswZacyJcrFPrR/MiNsmP6LX68Uxmme0X
         yZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701083214; x=1701688014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fhErRSfisNBEss2qD0b+7MOuMYZucuXoQSc1pAeKyo4=;
        b=n7+sEe0MI0W8rz+sS9iY2mpY0hCPo2G3Zen2RrXAOHVlxyscf+VzX7Jm1ZvBz+zXoi
         UROMqwcyL4Z8HXN405ONg1Xzud+0Ph9J/MJX4XMz4Jaw99JHoYU3td72z78BuOmRfZCm
         2SztZB7J+1bwB23z3OTu6wMKtzddCw4+jSdfvhl0rV2598Ei9ihNDBC2AqBNYqPsNvlC
         rkYL8lKkthLOtBtgSlYxjzXZkwIbqTqfS+o+34gt8gI9koR7ZR5JJhZBMy7l3oO7ZgbF
         S4fnMKlxC3zCEJO0jru5YM2vdVPYJfkn9MSy0/szKNI+n4o8HPtVcJuJn5t38F4Kukog
         m1yA==
X-Gm-Message-State: AOJu0YxblYKCbD456+rNaf7BcE/lh64QHu4To927eCkUh/FtUHDsT6Ex
	i7Ky2UxAYtzHH2ipPQrrfbSETe0j2aKoUjMaPZw=
X-Google-Smtp-Source: AGHT+IGuoeeNVECAMIWaoG3hDZtwaRxfFFu2kmZl/2YM7b2wD+uljKvvFrXoFy10VieE+nJcgnFqykBA7Nng6w/MQEg=
X-Received: by 2002:a2e:a36c:0:b0:2c9:9ee2:2b4d with SMTP id
 i12-20020a2ea36c000000b002c99ee22b4dmr2730773ljn.3.1701083213869; Mon, 27 Nov
 2023 03:06:53 -0800 (PST)
MIME-Version: 1.0
References: <20231127101751.3187950-1-alex@linutronix.de> <20231127101751.3187950-2-alex@linutronix.de>
 <9b0ccf15dab54023fba15e4c4568191130c932cc.camel@linuxfoundation.org>
In-Reply-To: <9b0ccf15dab54023fba15e4c4568191130c932cc.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Nov 2023 12:06:42 +0100
Message-ID: <CANNYZj_FdcvE77tJ1EHap0du8vcKLamj9zp9bqCuYHgeB_2xvQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/19] useradd.bbclass: list all needed items
 for package_setscene task
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 11:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191293

On Mon, 27 Nov 2023 at 11:59, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> FWIW I'm still leaning towards static linking for this. The setscence
> dependencies are playing with fire and we *really* don't want to do
> this :(

Was there some half-done branch with that approach? I could pick that
up once I get somewhere with the failing printdiff selftest.

Alex

