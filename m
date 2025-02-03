Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F7FC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 11:32:28 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.85775.1738582342929843640
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 03:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NiHL5fRz;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6d88cb85987so34215416d6.1
        for <Openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 03:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738582342; x=1739187142; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zYYPySjKefcDBHh4JPPUrM0wDpN4qc+Y+/dgXIQAKxc=;
        b=NiHL5fRzY/NZfWeDYPMNKfREzg55+F0aeV+9A9VCswlvubjN6G5VhdDGZzccIMLGSZ
         spWMib6pJ9S5Op12NEq9EwBB4ImqvnjqT0cewk09qY7r42LwdOyjve4oeU35ka0NPn3+
         ixXPe+L5UPgo0qC8SW/R3syv6uJUX+v4xo3eUvyAoQH1ZrBubuAXBJ3RBMEzL1cABoHg
         O6xie0daacPPtqvLNNf2q0hImf2T3HW0R71UL0tGdk1WZCSBMDE+7oQH+1K+NeqhXmaL
         4xrjyW2izDX/2dViecm3jxsMjGeh16Tm5+sttNMEf9a1w0VYbejvVgXrrs3CsnRTAeub
         CmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738582342; x=1739187142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYYPySjKefcDBHh4JPPUrM0wDpN4qc+Y+/dgXIQAKxc=;
        b=jyHx7nq3/Z3wNZ1igFYIYy424KWe8kFNI2KOn6KI2k7cmCpWqg8kUlmvCO6ZanIe4X
         I44kneslDILhhirUhZaaEeYw3/2Z5T0y4szDChXAzKTrMNSzfHCr41nthjzmu5rPBgjV
         C/qWVEp2N28enzeTEcaF10WBYZMtbkuTvdpFMClA9aNWAFq0h8U//Z4G15Ws5qdWhh2U
         r8KqmEHjI5sZe5G/IFZ3r65pk2arSk5Lfu/TLCE2dTe3h9DkfzUHUfNL7crPfWj08ijc
         sIWNkSA/Vj/w8vq1z5RjfFM3a4XmN5lkmbm652+ElhLm1Dm984SJKol1yKOz/lzvChbK
         mbjA==
X-Forwarded-Encrypted: i=1; AJvYcCVOw7qAgCTD7+EHnLoAUwpUSsi8cXFnpSgRo7YMqI3Hk2a+xudkC3dqNDDbMwf1M/adt6odSvXcxpl3+2cBEsc9ng==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy4qnw5sxonKSIhh5mev6S9J/1/bZ4HKUhgD5A5loBFhuYVHj1m
	CQgdfLs5Y46YMwaITATOMM3dEII0Ke8zR/BauP22OyJj6iyRRzyFVTBEX/2limiYSeB/1mB8rmW
	iP/YEdJStgnuGWKnr5LlaMp0iojc=
X-Gm-Gg: ASbGncsk7PWL3bQY0IP0H9TmvgiCsFDbDB6reZ9Bcjuyp0aotIIiHn/pzpUG35nZ4+N
	o35qC+3rNz1JbUUgC9VhA9/MI9/fgZ3U1aFUngvl0+sz3JfaAFnAQT31ejCsP2UkGAQHiTm3Ho0
	9KIg5ndOLEuFvcD5kMyh32rMhnQ4UygeU=
X-Google-Smtp-Source: AGHT+IE/6Xi5c2FfOODZj6mXy9tBdh1s9c9CBYsDRf/1sUquShMRQY2cEz2hOTiVaHEHzfJGgbfuRgRZQwrIh7+Ly1w=
X-Received: by 2002:a05:6214:da1:b0:6e2:4d87:f5cb with SMTP id
 6a1803df08f44-6e25b0475c3mr203329586d6.9.1738582341834; Mon, 03 Feb 2025
 03:32:21 -0800 (PST)
MIME-Version: 1.0
References: <20250202200319.82231-1-uvv.mail@gmail.com> <20250202200319.82231-3-uvv.mail@gmail.com>
 <Z6B2HKSlI6k9wNXO@nuoska> <CANNYZj9xjYqke8RvU3atSfwk2V=OC4Np8ZdXSO5hapCOnO75Dg@mail.gmail.com>
 <Z6CoNsKRvAibY0D9@nuoska>
In-Reply-To: <Z6CoNsKRvAibY0D9@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Feb 2025 12:32:10 +0100
X-Gm-Features: AWEUYZlg4BKv9R5pPJlNY6gbSmAOKmL3Ea0LhcuWHMffGCmEnKcRBaeqx0LYcMk
Message-ID: <CANNYZj_sU8f011m_mxXO8s0FdsUrcjdQHcB-fBDE+6wXAo9aQA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] systemd: Build the systemctl executable
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: uvv.mail@gmail.com, Openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 11:32:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210646

On Mon, 3 Feb 2025 at 12:27, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> So changes without justification are fine then? I'm not against this change,
> I would just like to understand why it's needed or proposed right now. A reason
> could be just to reduce custom patches in oe-core. That would tell me that no
> actual usecase is currently broken, apart from ukify.py and secureboot for which
> I've sent a patch separately and which was seen in meta-arm side testing.

Yes, reducing the amount of custom code is sufficient justification in
itself. If you need it explicitly spelled out, there you go.

My favourite patches are those that remove code. We need more of
these, and I always welcome them.

Alex

