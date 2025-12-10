Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D6DD3C91A
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 14:41:13 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17011.1765377665362456583
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 06:41:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KMm+Z5Jj;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-88677f91e9dso8951856d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 06:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765377664; x=1765982464; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5zEvn/rzJrUe1OOBh44fZaewKxIuQEjuJPLC7BTrwnM=;
        b=KMm+Z5Jj4tRVeD3GnElaOr4aRvLMAl65LcbTbej6P2AjjdYAeeQbVdlZg3SlSljD/w
         rrcRJaab59IKU9gI5wVFZU4uVR7LlEmJSskgy9GwO0JSVik/eiQ650bIuUvHDV+vdnYn
         JcFnsmD8eKvDdRUbeRoJyf1wKSzBvsc3ZpZ4Dz7f1t8KZlcibyjmEw86rAWBMbnU033S
         bZ+gyRRdPg9dParfHxQn53VKuFCDcfTGwTfsYUr8B02Jiw5Gr3hVjjnx8rzekjITe7BT
         riYgkXpOlWGsT594MIq/daLBfDsG1elTFlgItwT5+5qVQSzGHhysM3cficC48N++7ZKp
         3gZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765377664; x=1765982464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zEvn/rzJrUe1OOBh44fZaewKxIuQEjuJPLC7BTrwnM=;
        b=R+bNHAZ5EPgFe7IPRW1Dw+tnwvxmSf/svT+AtZCY0neuZufLKnvXClsaLA72u29bWr
         Lb/y0WEVK6VuNRWBJE+AaTKcfIPBJMrwGTGWv2wINzQ7qwBGdrRQkaCQASjdFqYx00jA
         Irv9U9n0XfOUskaixe4B4DyVSm0aul029TKQk/xTTKN6EFKrlw865YGwoRU8YHwmaRAg
         wG0tqLf72b+vHAbEr3V9cTtKOeCdH/1gvf5vLrtB1QbUwlQIWKVaeLedObcqTqK1JfZ6
         Vuqolt4rBkQEV6njCoWgBmvbkkcHNWKKiO9L8q7yFOzxy+KjFYahZeWWRpGHQY3mk9kc
         4b4w==
X-Forwarded-Encrypted: i=1; AJvYcCX1sFvRglwiTnx9FIwDZFv+kp8ZmIM8LMtP4xdeie/fJJZEDF3wDXFSM0FwdEy14583q/4en4U4g29nBZUemP+IXw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzZAd3yyN6hO9N42cXUYHBzxjO1jRylLyM2ftcjY+hEyknFi+cg
	4kAx8XbulbRMZh4lhv2QXqDR4cCcM8QQ2J5N3W++HCE/tq1SfrO7UDK7kMThwT8z0xkvimMzLEV
	I82Mq76+SyjcYTQ/tPErrJ8qDt36+Jhc=
X-Gm-Gg: AY/fxX6RIhezIYqRB//yGGqN9oqZIJxUdaV+cFQqkfOjxsKENcfXgnR0Pg/j4wdPKzm
	QoZWzmXABCRyT8Uqw3Exi9L8/EwkT/Y6OryVTCKSOKgT8IafSSxlvaZlaQlyfNcis3VqmHH4x9d
	JuPjJvwsIkgBLf8p16GWuniYYUj+d+XSR+j1AvFIVjhy7iF9yhp5vsQYpE/H+qe17vAZcB8nnEq
	B0b02fF8bo7ZqBTZbVRhJob+3fg2qtKfRlEm3en+f3G/8S4HVKhMcEMq0qpWaU4UtipkaA9Euwa
	iE/R6W0qtkC57LKiapyMrp2GpZB7/8Kt38EvcdA8
X-Google-Smtp-Source: AGHT+IEVAe/0F1rwfB3C1VUxd9/+ZzOgO7tIQqBCGLBO6l9FlWifQRuwlkiLWnqQ3LzlaTpusOSq3w5NTg6OeKZXa1k=
X-Received: by 2002:a05:6214:5789:b0:888:5a84:b5e3 with SMTP id
 6a1803df08f44-888639874f9mr30119226d6.8.1765377664311; Wed, 10 Dec 2025
 06:41:04 -0800 (PST)
MIME-Version: 1.0
References: <20251210110340.3631065-1-adam.duskett@amarulasolutions.com>
 <20251210110340.3631065-5-adam.duskett@amarulasolutions.com> <b1e90355-721c-4942-aaca-209e43e29096@gmail.com>
In-Reply-To: <b1e90355-721c-4942-aaca-209e43e29096@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 10 Dec 2025 15:40:53 +0100
X-Gm-Features: AQt7F2pnELJcyqh7rIValiHqXmABUlFTRvyrGDViv9_oe_m9yJl4f2JvlEM3wWA
Message-ID: <CANNYZj8CrX4M+0ye2Pe9ov1D0PCNXCrC2Ni0jKqYe8PBa7vMKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] dnf5: bump to 5.3.0.0
To: skandigraun@gmail.com
Cc: adam.duskett@amarulasolutions.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 14:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227479

On Wed, 10 Dec 2025 at 15:27, Gyorgy Sarvari via
lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
wrote:
> > +PACKAGECONFIG[plugin-manifest] = "-DWITH_PLUGIN_MANIFEST=ON,-DWITH_PLUGIN_MANIFEST=OFF,sdbus-c++ libpkgmanifest"
>
> In which layer is libpkgmanifest? I couldn't find it the layer index.

It is okay to have packageconfigs for features that are off by default
and require components for which no one has yet written a recipe. If
someone wants the feature, they'll make the needed recipe and find a
layer for it.

Alex

