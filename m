Return-Path: <anna-lena.marx@inovex.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1523CAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 15:34:48 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.11968.1759419280700402043
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 08:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@inovex.de header.s=google header.b=k6px5qxI;
 spf=pass (domain: inovex.de, ip: 209.85.218.49, mailfrom: anna-lena.marx@inovex.de)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3ee18913c0so214454766b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 08:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inovex.de; s=google; t=1759419279; x=1760024079; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U9IXDlzN/ZG2GutbUnmZ2lqJv9QRQcmcZSSdHRn6Qdk=;
        b=k6px5qxIsl8MdX77aBxTOAKki2LXKLEzhjaAqHNrDlymmwLRopZPRuopuvD8MeMiDe
         e8VFD1KP6kzLS4fdWOwlwOIgms3Z7zRe3NCFTdnbUvL7tDz1TG/HHF/exoNGitQsV0Wy
         LY6O7ojMr+hflZLA17kD+XHybyVFf88+iqxCKkVY6/YvZO/tqDkU+ElNyXdAB3rdTykG
         OjYutsbOiizznBxR0zQ41jTpbLnV5EFFZ75TEZJLVNHlu/Xk/BKYASe4iMQKM/kePXWw
         IrL/6/707D1fjzI9XTbJV3mXVl+1OmldqVLTMwqp5jZbg2FOALcfwEhv8BEyjdhZ+Kej
         9/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759419279; x=1760024079;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9IXDlzN/ZG2GutbUnmZ2lqJv9QRQcmcZSSdHRn6Qdk=;
        b=M1f3inULaXUR3wzFsKhmXgCDimJ+Yx+Anh8LjiAAJjYDeah7FDOxRlE2F3P5OWC90K
         0zYM7mz1gTbSl8lxVWBs0wi6toYttI+IVf/0KNrfrJY2IzwlfIgkTfGaWG7tNB04kThx
         wv4oWWZDo37VN6qgYogw+nP32+wB+9q8qPDboh3377swqW32ZKll28foTO5txdqAGx3o
         k8GXdfPs0xBmBufZaPVAGtfL9REI2FBW6pCl77HxSKnppLnmDO2UksKArDZq3YZG9Fr5
         XSukSKlBKX5HvVbKX7KDpGulh7lPwQS3XC7XI2Un1o7CPdn0giXMZYdzuyKhb1DBMB9a
         PHmg==
X-Forwarded-Encrypted: i=1; AJvYcCVMYUnsr8jmBfYTivCq06xNhtnjSViTxJAKC6HXy44hToRRQ9VRMFOzA07OTYjkuKB5WWQkDP5zI3FFaNzcnGRPew==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzfNG5pkOdWlfsKsORy3tIBX7NbuL/hsqtV69jV31eVS1aNFPT0
	iNdpJwBCJWhqbwulhu2ll5HCk5Iu1g3UwYC9ybfKPehRlgudWPeQmYbT+QaSyszlS3Q1FzoEKAQ
	lfHD0+DNSwN2ytesWq/i8dbjZWIw9xfyx0XWrHb75HA==
X-Gm-Gg: ASbGncvgQ7v+NWql0ewDHlfauJpq8o+uQz9X0l7PhZU5FFWunTrkIVGA4LlZCE6sI/O
	31d/Iu7KK+IETBwam6mbvMeXln4tGk+t+PwzPh+8JM5XICXtcppC5MxFvATyUurwMgNnDEQInjs
	ZG9hBXkMn1T895K9qSkGg5ioj+x/4qMiqxcZPZdLmMei38cJ9dPhxS2ZqgZq4plO449R9kEAjj6
	PFuambxXO+O+M9dRzVI3PlhL0dG2rOpDupqy0FcbkNxgIG381SE++eibXVqWrv63g==
X-Google-Smtp-Source: AGHT+IGCxnN799tyaXoJh8E5+yoc1VH5isDyFFQbjDGRlIPejC9q821ta+vU77AMtMbkFAA9kzpob9sE/O5Of8fpFkQ=
X-Received: by 2002:a17:906:c156:b0:b28:f64f:2fdb with SMTP id
 a640c23a62f3a-b46e2626cccmr917060366b.4.1759419276151; Thu, 02 Oct 2025
 08:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <20251001152850.1342075-1-anna-lena.marx@inovex.de>
 <DD7SOFNX7NVH.2H7W150BPF4GW@bootlin.com> <20251002151509.GD3125@denix.org>
In-Reply-To: <20251002151509.GD3125@denix.org>
From: Anna-Lena Marx <anna-lena.marx@inovex.de>
Date: Thu, 2 Oct 2025 17:34:25 +0200
X-Gm-Features: AS18NWBdzAcXwfsa0bdPXTKFGtfoxj4OO4ZYbdjxwf0a2UE2T3pNMIMEyapkNjI
Message-ID: <CABFt5o=k=E=Wvktmv7qPp4QQj6k+XWrfhsTc0tGjQtCTL+K2Xg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sqlite3: upgrade 3.48.0 -> 3.50.4
To: Denys Dmytriyenko <denis@denix.org>, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: mathieu.dubois-briand@bootlin.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 15:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224370

Am Do., 2. Okt. 2025 um 17:15 Uhr schrieb Denys Dmytriyenko <denis@denix.org>:
>
> In general, adding a new INSANE_SKIP warrants a brief explanation.
>
>
> > I believe this check is not allowed to be skipped. The yocto-check-layer
> > script is not happy about this line:
>
> For additional context:
>
> https://git.openembedded.org/openembedded-core/commit/?id=ce2e42ace2d15fb6745437cf0a7f07d28398ca12
>
>
> > Parsing recipes...ERROR: /srv/pokybuild/yocto-worker/check-layer/build/meta/recipes-support/sqlite/sqlite3_3.50.4.bb: QA Issue: Package libsqlite3 is skipping required QA tests. [useless-rpaths]
> > ERROR: /srv/pokybuild/yocto-worker/check-layer/build/meta/recipes-support/sqlite/sqlite3_3.50.4.bb: Fatal QA errors were found, failing task.
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/27/builds/2496
> >
> > Can you fix this another way?


I just sent another patch version solving the issue differently, but
it's probably worth answering again here.

sqlite3 has no option to disable rpath in the current version. There
is some code preparing it, but it's commented and not yet ready to use
- thus the hacky patch with status "pending".
The sqlite user forum states that the `--disable-rpath` flag will be
reintroduced in 3.51 again:
https://sqlite.org/forum/forumpost/be3b253ddadaa9f16a9b42c41c85701ae56811159a36535ff5ee7c6c44c1ea63
Please feel free to suggest a better suitable upstream status.

Anna

