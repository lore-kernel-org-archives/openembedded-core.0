Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551ADC02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 12:36:03 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.20042.1736944558810011081
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 04:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h6UkP16x;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6dd1962a75bso53747206d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 04:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736944558; x=1737549358; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JXId4QiQFivevXlTbEEYUKND62fGFnlaj2X+vniS+3w=;
        b=h6UkP16xVO8VR1vJCZ6Kf294HNzPB4AP/tSC8V6FxCOeZGbWmAVtdaHz28pvUZVY+f
         zG+i3ucyTuZeBibW73QYGDHpFNfJEAZHgQAnROu75Etcg+VWUyN1X5ax/YB396lQIqxf
         Ec57RC4RfApm8kBw/z+J2knI1vmH2FWI+18TesMnBcjACUaFmCtBTvyYUukNaWPsbVS/
         nxjn8meSlO26gJia22DIqFg7ijQ/8vSRo3xDSNIppGRhr0WlGw7eb0ygMRTIbyX9q6RT
         afHaTlqkgazPZ/PzL4DVSqWP4h/BJuxgVu4W0k11QWYUv3Jf9+jJ1oSGGMmvXNX42H/u
         hFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736944558; x=1737549358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXId4QiQFivevXlTbEEYUKND62fGFnlaj2X+vniS+3w=;
        b=Z/fx86nnTTALJHT2wJ5sa6iaC0OP6P9npJ3/CbeoCFMftIwwi9D7pIwWe47XN8tNnk
         bdlrtxMzydiRKjPo1Z7cmcrQptdyTMJhjE3FJG/oTVdwQySyGVMFi/3cBlixdKXOs6Yv
         t1h0upGrG2dIzeEYGMGMcrClmZMyZ9+V5URXuP6rzWxxlRk2Nv8GgfW8wyeMgYZI+q+8
         CK26nYnN41gEXUpEJQPLNoj3mQR31SEXL0DZflWmwRVSCtvi0zYXjwIoId+cgjjHPslA
         N1PJ0xDKMjHJSaDkQDMtWMrw/nj3azUoaDwuKifXykYd7qAAP3A1K39QXxsRCQSSqY6Y
         2gMQ==
X-Gm-Message-State: AOJu0YzCRclygYfPUhnaV5LmhqqC/QNyq6OiAoNaaB0xGrJkGaPQzEmM
	rxkdVv7KeoVoMJjv7HCqYuk+k6b04EwN7bHDklN6WoWeenNDlv8dGmmslyE9SLHFk/j3UWYTU1o
	/+sE/7egFefkPacHR6UtibIBxo8o=
X-Gm-Gg: ASbGncsJCLSwu6JaGUV6NW0ddI8zrpLZemiM0aIvk972xAsU70xNxPw5gi9bTrqqI9M
	lEOcsgidf68IPW8B7sH/HjHp+VbsHLhl7/7nYGNOLvH47qQrx8/WYKypAlqmdKscrZsg9wYpU
X-Google-Smtp-Source: AGHT+IFY/MXb446vdo/afbvh8IL/wLL2lxh3G6FzQNLXtVhvMHq9CTKCXrNnNXLf3ETOskXDSKNgP0KN/IZhWJfbuMw=
X-Received: by 2002:a05:6214:4015:b0:6d8:8f14:2f5c with SMTP id
 6a1803df08f44-6df9b227e98mr499594456d6.23.1736944557881; Wed, 15 Jan 2025
 04:35:57 -0800 (PST)
MIME-Version: 1.0
References: <20250114122613.3046925-4-arturkow2000@gmail.com>
In-Reply-To: <20250114122613.3046925-4-arturkow2000@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Jan 2025 13:35:46 +0100
X-Gm-Features: AbW1kvYHXGHiPrcgHz04S4aZUqTMoeWW25LoI072BXNYvrvsrKdhEawoDRA0Ec8
Message-ID: <CANNYZj9sW97=YD1wx5TH18b5sBfjY2fCFuOT3odn414AzAdsyQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Systemd user presets support
To: Artur Kowalski <arturkow2000@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 12:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209899

On Tue, 14 Jan 2025 at 13:34, Artur Kowalski <arturkow2000@gmail.com> wrote:
>
> This is v2 of systemd user preset support. I split systemd.bbclass
> changes into multiple commits as requested and done some minor cosmetic
> improvements in the code itself.
>
> v2 isn't fully ready as I haven't made adjustments to first commit yet.
> I will do that when we agree on variable name for --global option, but
> I'm sending this anyway now so you can review remaining commits.

Thanks for the effort, the new patchset is a lot better for reviewers.
If it is not ready for testing and merging, it helps to add [RFC] to
the subjects, which you can do with --rfc command line option to git.

Alex

