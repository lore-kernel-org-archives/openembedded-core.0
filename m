Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420DACA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 18:06:11 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.4254.1756404369419866818
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 11:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=geZhCOdc;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-70d9d415a2dso29403956d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 11:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756404368; x=1757009168; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IJacaaxbykxALZehzeirZs06aomx1PxPg89Ik2B5GJs=;
        b=geZhCOdcYEsRsPkI74hwiSZefo8CPyKJfY4PC4M+GefzL6JremChZnpIIxQDLDzeNn
         ASIZGQhV8MQGafHkJ9GuEzzHyEeRkArGe7cDSHkGZ9cRwVFsQnOm9Fv7uwydGMcWfye0
         iQk3IrpQuaJgWlTgUfSEYJ7v1V2Iexg2/XYUgTvEcJoOj5ednA42GVE8rey2s8wFy2l8
         CCQzhiWxFsMdzlXvr5arTre2HeZ2T8CMxNVJb8XVBf3Fv07yo9GuLYk7Ihv/TAVtpTSL
         6dGKGtIPIA4KVD0WvIsalHl8EwvK4G1GwH5NIkCDEIY5z8yZH4CeHLa/UuFpiT9/1Z6q
         xL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756404368; x=1757009168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJacaaxbykxALZehzeirZs06aomx1PxPg89Ik2B5GJs=;
        b=eqSdJ/BIGo1bnCllLHgaWQjw3sulGCvEG5EuLTf/ziZ0rpwj7yC6INrsB6I5gdqe1i
         2uiQKmY0lfY9A9khYz0GgVat6ux5hFVGZDPd0vo56zUIdfNXQjKS/OEyt10Wbc4EotiC
         P5mSQfIzd7Sa7XoAMzW7VbOZyTHsfbRmds4Iq9jxxK4oJY9QMvRFZMfCIpbEoZBRhHpG
         iypnkSXfzkQeqSZrKEcIgTrC4RvbZxHHHo2AHC4IsO7vQlt0tpnSAuaCJELtBF7TZCeg
         slrhSJIJt/7b9V5NrEisXPfrQhVfZpzQMIbB3aicHyZZaM7Ll9IslXwekftz60s7EaUa
         PdWw==
X-Gm-Message-State: AOJu0YwD6PimJU2E2Mqt6Fk0JZr83ehlUWAMhpmOB9BG5trNebjUzFZm
	RGCdImaNlHzcgIrS2ldcoVCSCGGk5FH7+ZJjzITtB7OaXlY5hSumU4tpjScUi91V0CIAtbq4gZs
	snmjmMexUOcduVZTfbC3/XJIFjNjcNzRlzTOi
X-Gm-Gg: ASbGncsIu/xiDJUCflV6cys21fmUmz53ejROwprONK7vMQ8TIHO59WIrZRGCn8WefX+
	9cuujJtDQUlejhImAptju/ZMxzrBbiBmFJa7HaXIRit8ldsx8zfF2Z8i2R4RH+NfyYi5o4iQ7tL
	Gy3ThOFk+nrnKmZsENnb9Kt5lfO34AWKHlAwqWMqZmBV9RQwciJ1jfTPpHfUf1zyCz8w86D32PJ
	MlcJ9Ev
X-Google-Smtp-Source: AGHT+IFhlprqQf4ksS2a9SHg/us0eZxzietXYG/AztOko+FvjfX+pwLhIRAH3wj214S4iCJl1LghZLDhNfEhrGjlQeA=
X-Received: by 2002:a05:6214:e42:b0:70d:ff0d:2841 with SMTP id
 6a1803df08f44-70dff0d337emr12857446d6.31.1756404368392; Thu, 28 Aug 2025
 11:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <185FF3BFFAE4AAAC.31147@lists.openembedded.org> <b0663efe-d450-45d1-a6d6-43d29f0a1878@gmail.com>
In-Reply-To: <b0663efe-d450-45d1-a6d6-43d29f0a1878@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Aug 2025 20:05:56 +0200
X-Gm-Features: Ac12FXwLP6fDLlmXBNgUKvvfBi1hn1E3bg3YKBWzkS_NaXUDUAYggZOcrP__URE
Message-ID: <CANNYZj_4tU7xHEi_EhuYBm8pdNZAVnqcGYPrHs2S8FKHwgD1_w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] apt: upgrade 2.6.1 -> 3.0.3
To: skandigraun@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 18:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222586

On Thu, 28 Aug 2025 at 16:14, Gyorgy Sarvari via
lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
wrote:

> > +Upstream-Status: Pending [account registration in progress]
> > +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> >
>
> I plan to change the status of the Pending patch in the near future
> (once my Debian account is approved). Until then it's RFC in the worst
> case, I guess?

Ongoing account registration is actually a valid reason for Pending
status, and so the patch is fine. It's Pending without explanation
which is very disliked.

Alex

