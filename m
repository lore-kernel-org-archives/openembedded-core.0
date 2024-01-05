Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2FFC3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 11:18:15 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.21408.1704453492827267800
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 03:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kg5hEu+h;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50e7d6565b5so1622194e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 03:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704453491; x=1705058291; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x9HpyWzbJa2SY315PhwWyqXlk806sRreUMm5QCHK82I=;
        b=Kg5hEu+hMBfMallAKFfS8y6rTJt6qrKFw8AaM2QJN57VIx58g3LKtOeOiCSdE5C2De
         R7g9ZLw6YjIcTIeQSpC/GM4LGcZvQw1+4v9Mcz07InDoT/ghEAVxbd3fKya1MwZkcdhb
         yYNmA+2n9WOoIjgj6Mjyjc6Wn0XD0E5077OrfnTyC4TA1TSPX5p70yfgsxpI9NbmFPR7
         jF6niUhDFz/2ZOWwZF15NQ4FKFWEXsrLyKMYK6pHzW39mIcT2y6Z3jUbsUShPe5nZVFB
         EFFN6XZ5lAXjhNKidl9rHZccpEUsLc1iY0xci6TwJFA9R9tdcwW7ngPKZDNs1lEZy7p7
         U7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704453491; x=1705058291;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9HpyWzbJa2SY315PhwWyqXlk806sRreUMm5QCHK82I=;
        b=ck/Fm2kgP7WH4sup8KufJ8dML2A5D3b/jz1H0rkK58S909PNyEIhJJWsBu5aT+rX6V
         Oxl8TbnpF1HA5ytVxtwdkJAhdrGtAI4sktRW4piDiWlD8ASQF904avDsGMKlfXvSFWmk
         4HXH5IWc68v2DMEzjh71qNi97m4bCJNDoswc5U86dzfeOVnb2gDFTUPOoSZDSMdl1g2A
         bPiBWcXONTkTxJ0gVrL340u3vrgeMBY/HEEgn7LE3dGRlpYjG2R0jCBC94fMoWF3gXJ+
         ofck9zZFQgpFD0aVIBt0UsAAIKRucw8poNoOYfFWs/nzHXa7mkKtBt52WkWVGWxs4MwZ
         UkAw==
X-Gm-Message-State: AOJu0YyvuZzYQJJfP3F7SXwEzYl7m9tLLOZmm8hVt8X+GTgL/h2VaDxy
	32Gcy79zSaBrpLJRkc7A6YwKLvgvJAkCZ1e/rpA=
X-Google-Smtp-Source: AGHT+IG64hDKavuSkyWdt5zDR3PUGRKwmcMUXUt4lVRL4f06R5ei/ZmelyhEigeMR8zSZ3dvdolhf0rUexA317XKw+M=
X-Received: by 2002:a05:6512:2027:b0:50e:b206:50f6 with SMTP id
 s7-20020a056512202700b0050eb20650f6mr346704lfs.62.1704453490517; Fri, 05 Jan
 2024 03:18:10 -0800 (PST)
MIME-Version: 1.0
References: <20240104123420.932-2-jermain.horsman@nedap.com>
 <20240104123420.932-3-jermain.horsman@nedap.com> <17A7372B437A2AE2.16812@lists.openembedded.org>
 <CANNYZj_t4AR01a=BHc6fTQYpe08rN2Vd7h7Okr+GOmBD6dd0ww@mail.gmail.com> <VI1PR10MB318284AEBA21614AB71C2EB9F7662@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <VI1PR10MB318284AEBA21614AB71C2EB9F7662@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 Jan 2024 12:17:59 +0100
Message-ID: <CANNYZj-Y4ek0-MOM1A2NkXJ0av48mhx_6puBV4YLG3r0_xr0cw@mail.gmail.com>
Subject: Re: [OE-core] [RFC v2 1/2] bitbake-layers: Add ability to update the
 reference of repositories
To: Jermain Horsman <jermain.horsman@nedap.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 11:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193350

On Fri, 5 Jan 2024 at 12:14, Jermain Horsman <jermain.horsman@nedap.com> wrote:
> This leave the question of what to do if only the '--reference' option is used?
> Do nothing or update/use a custom revision for all repos?

Updating all repos to the same reference is unlikely to work well with
real world combinations of layer repositories. I would do nothing and
print a message indicating so.

Alex

