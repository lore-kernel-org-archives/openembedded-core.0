Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E797D65526
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 16:48:24 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.51172.1732639701542500184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 08:48:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YNSfYPAA;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d41ec318eeso41017316d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 08:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732639700; x=1733244500; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z18CBtZs1+4liWh8Cz3ZmvO/MPcvqXaq/aF+rYUjFxo=;
        b=YNSfYPAAJezG97GWF8HoBv0X3e8tlfQUT2OOZARnHbxx1wFpjJHdeqy8wKrVTnl/oy
         ths1tA8sCKy6cOoY6Wqnpq3C730Td981ygz9/cwMBTz0qhfUghTqxVaqhacZYq6WwF4w
         dlpdOcNmVWeDwU1r3oQe0MBRFQl2A1jEYg3TMHpEYW66yHHJZkjcK9UvWZKdntoJgYsr
         9M2+33n3D8neLFy6tpW0BBVTHyzGw6DMc9PYmy/9ObuY3Q3gGEjSvPHXgOH9o/BGHXu+
         KPreXXTo5J8ZUQvDvP78+htjLtqzYM6CUSM4bBusPMd31oKNvykZvFXV5FttNHnkvhGw
         a39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732639700; x=1733244500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z18CBtZs1+4liWh8Cz3ZmvO/MPcvqXaq/aF+rYUjFxo=;
        b=aXsuFUsUM80vs/gnYzRFImVRvJW2g9qrzGbERHGpOWPZdmr0vy9gkKmxUkq5sedUEB
         xFXpwqhl94iiIC/dJiPmcSLaLbuL4YA8q+YcDVPUx3QL3r0GokH8odlQ98rcwWw8Vmkp
         SMZaEb2JXa7wZdzfesU57qky3pP07l79EK7FRXb2qujf0uxc5GTfXXX5HfuX09KLFVt2
         85upHMW94ShYvu3mQzpiDW2YasXeCrUAyV1rSGDcGjnP2u2gTbtJFwKmo2dnd/HGty4H
         gPQrWFeTVYuhI4wvQOWBUVlfN4BGMAwX2bvRslRdUYUeHef6/ue65wlq6ZVW1lmnfAPx
         BOIA==
X-Gm-Message-State: AOJu0YwFuK2FCtEZ5ciNFsxBzz3RWf23J56EPl8WH8K2TddUXAjKfP7b
	SkUPZEYuQDacKhRCAk/GnbASYVDAXwxuYukhUJSNeXEh/5cfiCsabldAN/0+6YUsAc6N9is2wQa
	FvwypmXNbuLeXIoOwF/0RaNYWYk0=
X-Gm-Gg: ASbGncuzZuac97pbaOOzZC+pui/Wu+OyfDmTgIjfYx61NSgtqk+FiCsunyiQLXvMd86
	bv3Czxv9U6zviLnkAUm3OOdd9QHrDaMVnl1wNmajmfJ2uW6yKK27lPNt3TEJ6BCbdiA==
X-Google-Smtp-Source: AGHT+IGP8+FG85CZBZsA8ZQpskB4CkFmMK9nRE4Jp+ujVZBeYniptm9HmyTCOMeKDRne2MhKxzUtP+YGK8rm660fJ0M=
X-Received: by 2002:a05:6214:2423:b0:6d4:1f44:1688 with SMTP id
 6a1803df08f44-6d450eb6ac1mr264946076d6.15.1732639700591; Tue, 26 Nov 2024
 08:48:20 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj8ir0JV+0feFkn=+oRR9evOqOEWhgDaS28i3VcdHUAw=g@mail.gmail.com>
 <180B91BA7D0ACFD7.7301@lists.openembedded.org> <CACS+7ZQmmD8G2jomCq0313=83EuYy9Ekhz=bNXrzdLDX+ktk2Q@mail.gmail.com>
In-Reply-To: <CACS+7ZQmmD8G2jomCq0313=83EuYy9Ekhz=bNXrzdLDX+ktk2Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Nov 2024 17:48:09 +0100
Message-ID: <CANNYZj8FMNf3ZscHhqGPdKn38ULtdZkSXWr_hmUc8m=URgWX8A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3: package tkinter's shared objects
To: danismostlikely@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 16:48:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207868

You need to find out why is that. FILES setting in a recipe should not
be replaced by what's in the manifest but only added to it.

Alex
On Tue, 26 Nov 2024 at 17:45, Dan McGregor via lists.openembedded.org
<danismostlikely=gmail.com@lists.openembedded.org> wrote:
>
> Nevermind, this didn't work, my initial optimistic test was wrong, I
> had disabled the tk packageconfig again before I ran this :(
> The original patch so far is the only one that I have that's working.

