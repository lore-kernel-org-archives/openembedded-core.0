Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 956EBCCF9F0
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 09:24:05 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web01.19208.1761816238357625165
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 02:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HabBhCsT;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-89e93741814so84228685a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 02:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761816237; x=1762421037; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLXrCikMU68biU+Ds60ZawXt20b7jMOCwT0YhnbuJj8=;
        b=HabBhCsTRcT9MITtoItKtyKG33HBPchiCORACTKXoULJ5z4Wc6zC7tLbQkbBafigsV
         zU+5re3WgwE+FU7dFCW3hZEZqVQesoJ0jx80CddnMcGnuAMK71wpGBm7W7ebaSIRDiFS
         Ryo+QIfPfwmJ6dvNrgyM2/VTWedOpE1B3J+QPRZxlH74WDbfvqhdLVxsOeK4/TK4hNiC
         P97c/ReRAuzjzFrKzadk6oDMLNAnPOK+VaduFBOPVavEMzjqOye12yhd4DZeB0bi//Pm
         BKB/cXdT+ptFky0mMtzw2HOBZ5eiqtRsFbvuVJDHMZ/9G4zBR05Gqrd7xCAHeT9qEpka
         cugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761816237; x=1762421037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLXrCikMU68biU+Ds60ZawXt20b7jMOCwT0YhnbuJj8=;
        b=k2Rw3dL2IAaBomGYWd3UFz9YGHDvusAJU0z//8eWmAbg6mBaryzS7BJwju4IQR90oh
         KJIp/O8QiFzdedUjNoCnQRzDG6ifaRP+U61ep7iTQA8lFxk3GkUM6shJ1efWNs9SY2Fn
         OPRkDKgtpE0Y/8CUIkwCZUXQaO58+oZ+DrW7aZ3e8uIqs2ZXm4k2Jd4u/DI4myuTPMCi
         mn33shI7BxzlKGWT6+Gut7cSJTDVCDUhfwL/qYwH4I/5F2+xb0IQ7RIwyt7gsYGzTzfR
         NY5SdeUm++5rjmvdRwZrsUkPYNKKDGVm+Ov0wCMn8obeU30RGtTrXFDEsvI82p3rLCqp
         hFEQ==
X-Gm-Message-State: AOJu0YxgGf/q+5EajvWuNQRWg4QBTTlOdCBsSq0eBCJI6slD4tWXW1+3
	aVIlFycGCWu2JGD9Rg/U9Z9lViKMydLFY4UymVuQaS16vgy3PJc7V0zURIJXDkSW/EFRI7VSase
	+tMTRdGhIdMvo1Y0NEQiZe6NETslxhOQ=
X-Gm-Gg: ASbGnctPas5UoYaWWMNJW8Z6+osze8vqNxFPb9lWP3WTVINjtXNDgdVdBj5oU/tWgyv
	jLJcm1lKD/OzB+SfwXzPhU18SBZCF5zKPB55XKn4Qx/wMOmzn1OZTy4STc09+b0Y+8Zfo8IiTXa
	Dq5SseRKPVJ/igJZpTqZRutdFi6Y25da72REXfmEGexG6COTna0YNPXqikyGvmh25IMsKv5C7qn
	kknb28+MvSQwa9qv/+VmMcQdChcQxc+DlBAvEolLTq9ZoqxPXjVskpNE0t9NxQU0s+RL6L6t3oa
	xJMmqMz03fe5Ts6wWYYd8rJ0srDEH+RNqYYCNbEAXH+4/rAVz3a3Kep2b70XJGuGKFE5+r4hKLM
	I4nVDI3WkzA2pRdRQEmDsce+VpLk30oWkuhX2gm8=
X-Google-Smtp-Source: AGHT+IFF47yMAJmui3buMHg3u9wFj1drre8f2jh3OVOFnvGn1Xl3a4iavXiUXVV2QsWl6781GDFDZ7f/bPKyfCsOqB8=
X-Received: by 2002:a05:6214:21c6:b0:804:9bb6:fe77 with SMTP id
 6a1803df08f44-88009c2fa1dmr68325756d6.49.1761816237183; Thu, 30 Oct 2025
 02:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj8dBkvgCxmMrR9weaSPsWBFEpgGqs6PPBQ6gmDE_m-9DQ@mail.gmail.com>
 <10003c51-e097-44b4-95d4-8a8cf056a3c6@kernel.crashing.org>
 <CANNYZj-3kBN=EVAr_Jxq1T_-Z-KezG3xmj7xZj7Ci+Dp9YHn3w@mail.gmail.com> <8B201242-48A7-44D9-A699-6D4A69D45CAA@dominion.thruhere.net>
In-Reply-To: <8B201242-48A7-44D9-A699-6D4A69D45CAA@dominion.thruhere.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Oct 2025 10:23:46 +0100
X-Gm-Features: AWmQ_bk3uKgXj7ebgzrITugM8QdE-blgvirasuPd3JMDhLtPiq83EzI8uiC3-OU
Message-ID: <CANNYZj-D1fQ4aSELvdrhZf481Yo+Sc7k3qjKV95G=5xWQU2R4A@mail.gmail.com>
Subject: Re: [Openembedded-architecture] ask the audience: what should replace
 'allow-empty-password empty-root-password allow-root-login' ?
To: koen@dominion.thruhere.net
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 09:24:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225485

On Thu, 30 Oct 2025 at 08:10, Koen Kooi via lists.openembedded.org
<koen=3Ddominion.thruhere.net@lists.openembedded.org> wrote:

> > Meanwhile I posted a patchset that restores the root-without-password
> > function, as a strict opt-in:
> > https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D39748
>
> That name is confusing, suppose you configured the default to disable pas=
sword logins for root and only allow key-based root logins. That's also "ro=
ot without password", but not the bad variant we are talking about. I think=
 'empty password' gives a much better indication of what it does.

I sent a v2 that corrects this.

Alex

