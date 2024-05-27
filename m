Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6C8C25B78
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 20:26:17 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.6559.1716841569755894740
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 13:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TC/DzKJp;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52962423ed8so131091e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 13:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716841567; x=1717446367; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jnXQfhfYKvTpH5zh61dCG7vaYjSE5uXr49dXILdB66k=;
        b=TC/DzKJpOqFEBse+RvGlyNQqetqrL48VYg5YQ1sTmRrjItFEQECHiyQTYCIsTGLu9Y
         Loj5fm62kPMSdXBMOCGaRZ6LcfDJYsK723fMb4kEzmX6NY43klmY3mHU4T8vd9UpeveR
         IjDqFnOl0HUXfGypLeCGV+viF7SenQb4h7aP+G2rXZIpwiwMX43CcGzw0NjAGbpc9iRm
         51fFk1HxMCVoR/gNZA4tuES9l0Y7Bza+pshvxsruoKmNJOZ9vcd8nce3lbtZb7inrDnW
         1NiN7mJ0gUR1hno64uK2tVEblSVrEamshbg6gh+xI1oNpSk43mRyqCy3HJOxxw1CVHYW
         onMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716841567; x=1717446367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jnXQfhfYKvTpH5zh61dCG7vaYjSE5uXr49dXILdB66k=;
        b=DjjoTkefkaWZwm5F79UvIoz8PxH1xiISA5K4/5qMNf6HreOkgLMsLEL8/IhL1ezkxG
         scO8khbeov2iqzmfual74qmE+Qr5/j0FigsvfbrWjm61r0/Zff10eD8bltuQ7EP3ZhCM
         c0X66aAVgmd6AS49LL0rWvpowqzbKJ+Sg/LcMnV/hoAB1W0wOi9/godsIEPJx2bk/ipF
         cMZXG7QfmfPN9hGGV7Ewv0osdwhe0nR2rqBpcM7iFK6mlbq5edJqka4czNIV9SNmLmRD
         pnY8up+1RyE+zBcvnHsu7IJp0T8HLYdk7iaaCmoM0pSjAnnIYj3ls0ZLOHrKiDw9vVUg
         hpcw==
X-Forwarded-Encrypted: i=1; AJvYcCUmzSg2D2VL3jYQbaFR+OgBUJJ5GL3HahU+uVIag4t9WqhghVS3kTxtbuSJWdkHyXbEEGPWa+PFW3ll49CYFN7Q6Txl6KWyGia8LFpJi3dLkw8DRHTdr8gl
X-Gm-Message-State: AOJu0Yz/JXJhQLvAcOnBDGY8/CgHrODCHzPPgb6dbkKjNNsb+0l5Bpoa
	0Z63DXsBqE8I2l2Te0spSsmh5UJxpB6jecXbETCMAO00J7QPeJbDuOie4RWReVTxaKjUyi0h8EI
	up2nm2NChj7pjYejcTiwqcOXQLRI=
X-Google-Smtp-Source: AGHT+IEWCS3xbYYvHRLo5gJcNqHkGFRggYkWSteVFdUkT2BhHJ/GyB1xwHQfJA5PQ6uQYSUV0q6pl2fxcjP8nB60yLk=
X-Received: by 2002:a05:651c:c1:b0:2e7:1588:7255 with SMTP id
 38308e7fff4ca-2e95b2881d0mr70292691fa.32.1716841567254; Mon, 27 May 2024
 13:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240527181214.1778037-1-alex.kanavin@gmail.com>
 <20240527181214.1778037-7-alex.kanavin@gmail.com> <CAMKF1sr3rzt545xOEiukEpVPGPxyQ_VX+scB8gzySuP6tbuGMw@mail.gmail.com>
 <CANNYZj-282UQn2iELdYkQHBunkNDn1nZq6a=EKBx-BSUTvZZ8Q@mail.gmail.com> <CAMKF1so2JOiUdm=g5b8X-OSvXZCwG76t6N+hUAZUr6JAxK5BLA@mail.gmail.com>
In-Reply-To: <CAMKF1so2JOiUdm=g5b8X-OSvXZCwG76t6N+hUAZUr6JAxK5BLA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 May 2024 22:25:56 +0200
Message-ID: <CANNYZj843hMDSK3bcFwSVy5z4Xgvfj8YxVA8KeRsYrwSXp+izg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 07/13] icu: upgrade 74-2 -> 75-1
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 20:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199942

On Mon, 27 May 2024 at 22:22, Khem Raj <raj.khem@gmail.com> wrote:
>> harfbuzz resets that to c++11:
>> https://github.com/harfbuzz/harfbuzz/blob/main/meson.build#L7
>
>
> I see. Thanks, ideally harfbuzz should have done it as a fallback if default were not > c++11

They want to stay at c++11 even when default is higher, no idea why:
https://github.com/harfbuzz/harfbuzz/pull/4733

Alex

