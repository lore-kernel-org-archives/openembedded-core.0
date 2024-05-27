Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8000C25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 19:50:36 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.5823.1716839429284426164
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 12:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TrT69NW0;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e73359b900so504581fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 12:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716839427; x=1717444227; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wRR5VlzvAH2FfX8uszMfC4Zfm0GSSYCy890dOBLSRTw=;
        b=TrT69NW0qiAXC85Rbfgm9GjAuJfihGHNrEgtJqg9Ty7MXJAw8GkpKC8bq1OrkOm8Tb
         m8EP/UMedAx7kKxJdjwcn+sKKl6t1JVGVI/5yuIrSCDsVbv/gvF+F88RpxwXVmOdkwJj
         RNB4RxpI8daAQsJu2EtybzSmDdNGvTXklvc0at8daNAVdJFxjV+iI96jHxnaVKEEIlBp
         ty2xvDuufBwOQCUXS76e734sOM9L7djrEdNzZYbOkPZAAC1yK27oLo+p2z/hWyByWTbB
         RpD+epU58oEge2BZDdj/vKrNO5MOuCP5mvzN2++vIQ5rQnrUWBBvObHT3QfFL30rh+mL
         Y/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716839427; x=1717444227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRR5VlzvAH2FfX8uszMfC4Zfm0GSSYCy890dOBLSRTw=;
        b=n7G+I0K5qnHN+QKDbo9qQieRiHe7Fy32QT7tF+237CinqYVkrJhSzN1G6YAPb6FMfB
         Di7gRxAwTOFggqFdfEg3uiCchmHh5krqR/hL0ka8qKJS9ptT5eavd9mZPByiQTW7YlzZ
         y5fCdiwU1GLcU3IEHz36Jn1e0UKlOcMYOPWiP072stxndWgXeMpbIksQmnF9A35K3uzL
         qf/paVyUyD4toeN4mr7luyrTQFwUzMdK3WRkGJTzRFWupRDd5nTYqnOPz4Een3Lq0Qwn
         8FOKg7En0GjvzoNJMDer9ByF/WGsVg9K0Vwp986YymhnJQuIuf+lsUvSZ+2MqsvE+/4A
         QoLQ==
X-Gm-Message-State: AOJu0YwaFINBGS/i3yqV4OVIcFdYXTGdna9bzSSEdIswAamJUFBRz+jv
	hjOgjbW+NT9mgV8R9oX1T+wMjwcZYzyDE5LsuZmpPFgAXsAZfOuRl755+6aqNQTw6Ae2/PlX9iu
	iDwUdkrkJu1ZK2kI2xCRvVByK2EI=
X-Google-Smtp-Source: AGHT+IHcIWUFERMxaEvz9TXnnkJ/t4qaEI+1YFtKkRgtgf27fF18BKdX+TB1sYymNi5Q+ubV14uj0ohnb7pCDjZjMyw=
X-Received: by 2002:a2e:868f:0:b0:2e8:4c3d:c9e6 with SMTP id
 38308e7fff4ca-2e95b2d3123mr66759761fa.48.1716839427232; Mon, 27 May 2024
 12:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240527181214.1778037-1-alex.kanavin@gmail.com>
 <20240527181214.1778037-7-alex.kanavin@gmail.com> <CAMKF1sr3rzt545xOEiukEpVPGPxyQ_VX+scB8gzySuP6tbuGMw@mail.gmail.com>
In-Reply-To: <CAMKF1sr3rzt545xOEiukEpVPGPxyQ_VX+scB8gzySuP6tbuGMw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 May 2024 21:50:16 +0200
Message-ID: <CANNYZj-282UQn2iELdYkQHBunkNDn1nZq6a=EKBx-BSUTvZZ8Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 07/13] icu: upgrade 74-2 -> 75-1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 19:50:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199936

On Mon, 27 May 2024 at 21:10, Khem Raj <raj.khem@gmail.com> wrote:
> > +# Remove when https://github.com/harfbuzz/harfbuzz/issues/4671 is resolved
> > +EXTRA_OEMESON += "-Dcpp_std=c++17"
>
> GCC 13+ and clang16+ defaults to c++17, so I wonder why it does not work here.

harfbuzz resets that to c++11:
https://github.com/harfbuzz/harfbuzz/blob/main/meson.build#L7

Alex

