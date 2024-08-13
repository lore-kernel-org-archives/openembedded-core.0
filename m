Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D238C52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 15:47:34 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.75558.1723564046646436100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 08:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BcMsrem+;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52efbb55d24so9991029e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 08:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723564045; x=1724168845; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f1Wlc1Zi7CjsYy/w71f7LWViWDcGtTBGIIRpo2hmKdI=;
        b=BcMsrem+ovlgskM+i2Mgp26c657oE2F9et4MEI0j6tAQBSPDuYHIo6wsFs+r3Wp25l
         kMpeqhkWldcgQ9np7UZatHjhG502gJgrDBWd0/1zob8a+bH5AprAI+dB/z4546RjAmVJ
         Kt73sX1YVQXgCVKNrWcuANGdw9FvQoYIR9sZpsNNGqXrG39zBRIYiR16fCSwzPoUQd0w
         WooFv+3vMG6I+SAe2tjr4EWLXmlA1zQ17RYZ2QRg0236in95pvH0m3puDccBrMQwzz0L
         q7QRPcyR1jBS9/OWAsLU7s5QchG9KSnDiWg87IjGItIlxtVDTc55RRlLT5pPIsJ4dh2U
         TwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723564045; x=1724168845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f1Wlc1Zi7CjsYy/w71f7LWViWDcGtTBGIIRpo2hmKdI=;
        b=dT3Xw1p+yRlOcdsHTWtFrcr1ziL62OOFOk5qFmY+LCwp6EaZF5WIDWCkXyzHKCIUM5
         Yw0P7aIZgQ5NJvlCA4t83uWVEi3CJLl7xj2z2a1E+raRMmmPqn5kuvfaaEHqYP2f5AVD
         ncsa9/46sDZ0HUjtyP2PTFvCz8DeMoqoMukCw2pmCd63GdwPo7srXAru3UkXdAvxdWI8
         mUmqATQ0xklIy7OLQqknsHFYuVFcn1TNWnsajkytUNWzRNyKqQbtGIAV0Pj6KK9Q2JsE
         v6xWhOmCNvntQHEzSyUEfNxEMxcxxSLZDqqZolOhW7yrE2R+29GAXMqmy+lc7ZZ0x+yu
         5sVA==
X-Gm-Message-State: AOJu0YxBzEqVWAZ5YVgjwzI4J+I6e0txEA2K2/08fxWnlnq+hQ4y1/G0
	Q3Q8UhJEDpMOYoGmqBxenmnyZNDk9CMMcTyt5dzYvCwODAejnhIhsPSgAqgSvjkE5Yqhk3SCyTQ
	S1oANOZbkVS7Fu7Hy9x0llIxB1MY=
X-Google-Smtp-Source: AGHT+IEO+aEMmeGGdAirjrq9IxiNJzuhem3ZLnrbkN5XaqoRkizDe4dzT2tqktdKMOYh3jndJW8bg9xrVynzpUWZL04=
X-Received: by 2002:a05:6512:39d6:b0:52e:933f:f1fa with SMTP id
 2adb3069b0e04-5321369efedmr3077315e87.61.1723564044552; Tue, 13 Aug 2024
 08:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240813153039.3395682-1-tgamblin@baylibre.com>
In-Reply-To: <20240813153039.3395682-1-tgamblin@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 13 Aug 2024 17:47:12 +0200
Message-ID: <CANNYZj9XU05XrGeKhg=yTmyWuvm5GoT8NYVQG6chv6dbsg62Kg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3: skip readline limited history tests
To: tgamblin@baylibre.com
Cc: openembedded-core@lists.openembedded.org, alexandre.belloni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 15:47:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203284

On Tue, 13 Aug 2024 at 17:30, Trevor Gamblin via
lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org>
wrote:
> Python 3.12.5 is failing a newer ptest for reading/writing limited
> history. Skip it for now until a proper fix (if any) is determined.
> +This test was added recently and is failing on the ptest image. Disable
> +it until the proper fix is determined.

We should not be disabling tests without any investigation at all into
why they fail, just so some other functionality (e.g. version updates)
can merge into master. I have to say no to this. Please look into it.

If it was added recently, what was the commit that added it? Can you
add a link to that commit?

If it fails, what happens exactly? Where is the failure coming from?
Does the test expect something on the target image that isn't being
provided?

etc.

Alex

