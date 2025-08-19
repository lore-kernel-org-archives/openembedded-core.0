Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD2ECA0EF5
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 08:57:12 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.9325.1755593825190693691
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 01:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nZ9a5lms;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-70a88db0bd8so44505026d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 01:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755593824; x=1756198624; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=li+7+WsK5PDCxRtzGuwTSNHHDGyI7HpeYWbpiDvKS3Y=;
        b=nZ9a5lmsX6OVlFiR8ojsgPXP6u/T4N48jjDV2UZORgv22cvd7F6x4G8TeTvSmi/oGm
         CyxQJBIuOcPCKssgwUa510oTMMmmaTyLSne0MS8IeZcVyVtoi5WLmRxe8BFriAJ+P/ag
         LGR2iCMdBbpPLYMcWcD+Dgn3Biyd4amVCVqafO6MB0U3Lwc0I6Yi+j26an2yGv+Xg4KT
         pEFbJUG9rGx2C9zDtsqS80W8NCtL5aheOoAzVqR2hasmM7PPUbHxeoDCNE0UysNbyGGH
         HiKYA3RYcMltVXj9WotikhWYeM5b4XubU773PjS9gZeAd4Rw89abzm+5V7YODdafvGY8
         TrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755593824; x=1756198624;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=li+7+WsK5PDCxRtzGuwTSNHHDGyI7HpeYWbpiDvKS3Y=;
        b=KYSxwj45jBC9gHmjtozjzCwEGPlab3bBKtM3qeAiun/JlmuihRskN8BHivV6cFYLav
         3TAiwQxZCAyxEfYEk6Ym2Yk7xHfmGnzto1FYrwfXmvEMZxdx4KlaXPXzFAwEpCw2AvH0
         O3OtMP+Wt6RBJI4oYyQWT0RhfwxfTOsgka/MngIgz7pEtYzbGfJyCbcSsc+TWMMPE3yN
         7FQVPR8QdIFHF3qIj4qAoseTZHzAwlQTezAoGCGak3pgY2sgh4qLTcAkkPg0QFSvS8AB
         VAWwhzWHkMUYxLJQf7VHzE4zIEKQvQ31b3VqG6gCTueiIkSDzC9QfN8cRSOXXrV3Zw4D
         J7tQ==
X-Forwarded-Encrypted: i=1; AJvYcCX65SQKnqJ2KwaBliypJ4Fd6bnaJsHTsAy9F93GmfmWwgCQjNzs9+ffEDlwB2yM5PB+icGCB4HDtK2qCBoqbv9BBg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx3lGeejpAr5rpXYsu6fSddVHh3PI8sQm7TtIZaz/QSa5NZyNNL
	r4llwaC5IWCG3uNed/eQphOU+GiRlSBHm5zCna1JaxmjW2QY434eBxRKeVFe1Cxsw7iq3awqwwk
	7bh8X53yhaVvoFnpAY5A4vaxuX79ipb8=
X-Gm-Gg: ASbGnctHecFm3bKabu8ZwIxMsVK5rmuFozgdBHZ5UHE+BBe0cYdylLJkT+RK5YLeanD
	srd6OvfglugjStdjlkTtMQlOa5M9634fWciEDz0Hr8yS2mS38elXQam1TP2JyVrMrCB10KU3kmY
	uqThAzCqBhv5S5Bik4KkBBiTGVK2z1VTRMPbylZv2TmIhtZUAWdfZ+/YRdVoGpF95SbViYQjqzV
	e5aKF7RaqjvnEGwxwGg5bH0I9TE5CbxK2p6YWLA5g==
X-Google-Smtp-Source: AGHT+IGVrBRNUoU3qt6AqLAe+s1MdJbYdyGtvvflBennom9q4zmWTvYWCtCygSH9eTj1ajEs58IAtIK61znZrVC3FYk=
X-Received: by 2002:a05:6214:1d2c:b0:707:16cd:8324 with SMTP id
 6a1803df08f44-70c35d973famr18748106d6.49.1755593824150; Tue, 19 Aug 2025
 01:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250816102229.55627-1-skandigraun@gmail.com> <DC5BU6ME8H5L.1TRS1N5LYWRWN@bootlin.com>
 <154c9823-5637-4b77-8488-a4f218e68f2c@gmail.com>
In-Reply-To: <154c9823-5637-4b77-8488-a4f218e68f2c@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Aug 2025 10:56:52 +0200
X-Gm-Features: Ac12FXylFfd53zzVt48U83Py7DLTT-yEizIuuTkqJiwKJ5sk5OlnGq5ZCjDcSrc
Message-ID: <CANNYZj8L+EmPr_-6mWQnK_RBQpZcKkbuV105t6oyTtNJd8FijQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] boost-build-native: upgrade 1.87 -> 1.89
To: skandigraun@gmail.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 08:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222089

On Mon, 18 Aug 2025 at 19:38, Gyorgy Sarvari via
lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
wrote:

> kea 3.0 still tries to link with this module. I wanted to submit a bug
> upstream, however unfortunately they don't accept gmail addresses for
> registration.

Updating to most recent kea first would be still appreciated, as then
we'd be able to apply any possible upstream fix (or fix the issue
ourselves) on a codebase that's closer to upstream.

Alex

