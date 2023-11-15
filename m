Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963C0C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 12:35:39 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.11835.1700051730972257275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 04:35:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MQ0RsEyI;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c59a4dd14cso81290351fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 04:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700051729; x=1700656529; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PkQqSUinw8XKd9BbOaR4GFd1MYMBLo7ce0E5Wld32Tw=;
        b=MQ0RsEyIblTnjeIMvtaFqRwGhKVc6FNQ66J9CDlaOxvP0dcCx2TwiMA4SzZ1na47GQ
         ba2UNQ2u0dRhMsetm3CJahGmTfIqNbtg7+04LzUeqcpv+Vn92XSJSI1DlmVyE9vjWxA3
         oPtDwNRUt/LSZMQTu10wGS1c836VNR9qIpmvO8bUnDIGEtuVLHzFpKKzL8No+bWygnXb
         1k3B8pkVKGhM4Ekn17/jSR7RpFfjVTODVPQg3O4cffet7ffsD7JxdFd70NpsrShXoZ8G
         5j0mqnQc+tx6pdg9w0F/AORStAxCqFBusO9BQxA3GvXKJhkoGi7CwR0EKDI5Xj/83xuW
         Yfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700051729; x=1700656529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PkQqSUinw8XKd9BbOaR4GFd1MYMBLo7ce0E5Wld32Tw=;
        b=cp/ajqc5k/rkEalq/MBveghr0XUeustergsW2RZkM8j7UBdWfKVEpKaEOkSwFI90Th
         SMAakK2ax61EycSNdH40CUTyN2agmEOJIjveZqf5vm+enCMPC/iGTXjQoViw2/KNgXKd
         6ckwGnGIKUaMcQqfrMdUzX6iJX30+9ZpRHKsefQzrkfxx5HF6fEYHW+se3KulWXydO64
         rFf/7bXrYoqmVwjdcjXNuKKMdbo6dA6h5foUVZsJDLRAG/mnr0ZrJj/BBlixz9yqnndK
         J6v1P5NZ+qLYWJq2zuO1Lt6d7wOcrol/e/G2Dj0fFRuQJ3i0pBj2y6z2RlWcxkUD5/yu
         p3fA==
X-Gm-Message-State: AOJu0YwIkdfdVq52gcdB2kZamaqDsY3SKuESc1lg+dRoe9LTEcR/iQ6W
	gyI8yqSF/U/HsVGmpeZamHHLAXwgTfTQrZEWQW0=
X-Google-Smtp-Source: AGHT+IHRePzuF5hV7xRRfilU1yCyN1bbkrYCH1PVt3Faupb4m8U7p3oKxEH0QlulgNl280103zQ4lNtLjTIISPG540E=
X-Received: by 2002:a2e:b751:0:b0:2c7:fcc4:d2e5 with SMTP id
 k17-20020a2eb751000000b002c7fcc4d2e5mr4308583ljo.9.1700051728920; Wed, 15 Nov
 2023 04:35:28 -0800 (PST)
MIME-Version: 1.0
References: <20231114203608.1490318-1-joakim.tjernlund@infinera.com> <20231114203608.1490318-3-joakim.tjernlund@infinera.com>
In-Reply-To: <20231114203608.1490318-3-joakim.tjernlund@infinera.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Nov 2023 13:35:17 +0100
Message-ID: <CANNYZj_c1dCdhhuPhnNdQ+9PKQ_FPdbB-b2miypMM9jQuofBcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] shadow: Add PW_SUBDIR
To: Joakim.Tjernlund@infinera.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 12:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190591

On Tue, 14 Nov 2023 at 21:36, Joakim Tjernlund via
lists.openembedded.org
<Joakim.Tjernlund=infinera.com@lists.openembedded.org> wrote:
> Add support for creating passwd files in a /etc subdir
> +Subject: [PATCH] Define SUBUID_FILE/SUBGID_FILE
> +
> +Upstream-Status: Pending

Pending... what exactly?

In other words, upstream first, please. This is clearly not something
that oe-core should not be carrying and maintaining and rebasing.

Alex

