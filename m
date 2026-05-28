Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25357CD4F54
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 20:19:05 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19735.1779999536104707526
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 13:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qYjRMAeX;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8b6ea7716bfso150812976d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 13:18:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779999535; cv=none;
        d=google.com; s=arc-20240605;
        b=AasZZ2xRv677L+De1zs5zBXGNnjnKGuKYEMbR4q3qwvncvvVo0AYK9Kis+4U0vyD4V
         3A9H9e8wh9GSagoMrxTY5C3GnnmOCtSdUSrvxhTNKCm/zRQwcn/WfD+QZftQIbvyGf1f
         MonHrk0TvOKkJCnDD4/3OpQmcec9iti+3S3ctglo1Q34MEqLCSfpJfMcpCo8vSCKtML9
         nYhy93FkaqidX8eD5bH/VYW/zks7/sl25Bsx7ww/7N8Kk5Pq+iEM9T6jYiIjACzhKExk
         pebhXrharTOouxRjxKcRX74GBBv//W1WvFT+XXti/zQJWeJi5OLcAjwQ/FVZC9RPzvNw
         26Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sowgmBCOCkw+yxKHw5pAIv+kJTBsGU7JMCR0Q2JXa2I=;
        fh=fuclRZ7erKyYcPzyE7kdGsopsyEboK7zQ6YNxHgjmD8=;
        b=WkIfWnEwkP7U/EQPGQMvAiNGCRYhut/+Rw73FiuabJx3TYldTVtwxoD+5e2f3YAi1s
         NfTNsVXgemYKFO5AHN90xRu2ZQDrfMnly7hcOIWQjT3CvQPMwFbaJ3f8netnRAec558k
         Fojk8bZ6w5ptsf3NZQ9pU6IJiKv+wa95Ro2TgBxl/6bcx2DdBZXJEh+0GBfzwU6kV4+o
         HXA0pHjc/1QfK8CDOT96rroobEb3bd+5AF62yocDuzkIiPnPuxoUNn9JP+tSvgNhnTYw
         wq2lPiw7ymzn8QnM5lbaAfCqiER1rCt3DQJ11yf34JTRkOqASgoKl9WHIC2X3zhM0J7O
         3CQQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779999535; x=1780604335; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sowgmBCOCkw+yxKHw5pAIv+kJTBsGU7JMCR0Q2JXa2I=;
        b=qYjRMAeX3uG5HbhUUCrW26JpwZLhCTyXnufmxYT2yE4KGOYIZDxsZanica5YlX/UXD
         n/mekjB5+l89GazAH4M/s5XV1G4hpfbazkS2XySfNeuZ9GNWa2RvWbeRjEcOUxLDOHaC
         g2H+2q4BTr8MdPKWpPuHO7G7i3mhFFd8TDzzo3r6oKUKMTOdy+YD7YxVKsRfA+JFfAEr
         ya7fl79xtczVzikbi1zXmYwb0r0KDghtej4vBwXz5hcf0kpQxdrbqZ6IlGmSQI2DpjKl
         eAXUH3W+rdSxD7+FvfErFrbMkXXu9p6XjHA2jGJnNDXGrJo8Go9L17scTa6+/aRS0Lhd
         ak1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779999535; x=1780604335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sowgmBCOCkw+yxKHw5pAIv+kJTBsGU7JMCR0Q2JXa2I=;
        b=eipXWm2kMmmS1hNlKZgAftcAYuST0hBOd4bDv9wKkrp+k5cmkx3vG9VsAuORu8CjHQ
         92XM57vKzlxrTSGrMgtg5HElMDF6/p5TSs1dgcdThyqg6uVQ3oKv8Cz2Y7LgxH3c1FyF
         m/OQYJx+KhgRJyW+K6aChAL9a4eKXgFNwYHSKzNTFsQfjYLridoFWgRIdILND92/yldA
         jMK4eOERdSi4t5ke//38DfLYe/latYIc7vrfuZVX63kyDa0dnkS6aBDybt3LkNVmMRyY
         DH4qL51av7kxnrnHoupie5F4hMVFfDChO2ViJV5tI3r6LC6CsD+A5yVxjTP/LLEZnSjM
         Nfjg==
X-Gm-Message-State: AOJu0YxcqYj7yqsbkskchwmZa8YO50qTj7rQnYqSCNvXf2StHh+a6PiU
	YZUyhrqlC4PbAsJAye5Ufq+8P2pnGkc4pfobL6nTgVdOQUyoHRwNmpTFlpCglLYkcqLWyxPqf9B
	rER1i2oAC8qT6uKG5J+HUG9PEeS4BH7A=
X-Gm-Gg: Acq92OH9i2eX5H7WpoGOKE6eUsAUovfhO/KaxlGZeuZczmIA7LgThif9oCI2Xw5cJe2
	LPcaZ8jNZw2IaM8EVpgRDfcawQY876OFXRLpxQZDkhKYp8ej9jv4T7lcrPDdFnvoKJqv7mMucZE
	fLYpHgrCxWzFZskfYuvHRgtRPXt4KgNWMDwo35e9jvkoPsyWJ7pexWdBbzd7j8J0MMaIn96PcHt
	RpnmIEdUZuMsiRtUL5BEMR14JpuTedzL8mouBCYuNo8lklFC7NAERPCIdqIYOEfr+tAz3RA46nL
	1kaVFjzd2H5vxOdSS5fF84NewTfL2AsDSZh/ZDtkXNDcN5A6r/BrCm1/oUS/a7s=
X-Received: by 2002:a05:6214:252d:b0:8cc:1010:bbcb with SMTP id
 6a1803df08f44-8cce216ca21mr11734466d6.27.1779999534969; Thu, 28 May 2026
 13:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260528185722.671-1-adityags2004@gmail.com> <CANNYZj82A0TNrxnZ6jWwV_os2yXGvHhbnqD9zhpvZ56SCO3ojw@mail.gmail.com>
 <CAHaUZZA7sd4ODqqAHSWCJ45braUfuSgU9rps3yHkENhsSiVHQg@mail.gmail.com>
In-Reply-To: <CAHaUZZA7sd4ODqqAHSWCJ45braUfuSgU9rps3yHkENhsSiVHQg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 May 2026 22:18:43 +0200
X-Gm-Features: AVHnY4KNY3Qk4PiIzT3QpCnZ51DHZ8DBw45SIY0O3B1MCCIRMdlPIU_3n4DoboE
Message-ID: <CANNYZj9EWB=-mS1Gj_S0o0KFXTXx8GteVZjmYtZu4VWSRY8bhw@mail.gmail.com>
Subject: Re: [PATCH] gawk: backport randtest stability fix
To: "Aditya G.S" <adityags2004@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, joaomarcos.costa@bootlin.com, 
	ross.burton@arm.com, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 20:19:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237724

On Thu, 28 May 2026 at 21:13, Aditya G.S <adityags2004@gmail.com> wrote:
> I just wanted to check if you would prefer that I resend the patch using the -v2 option so it's clearly marked as an updated version, or if it's fine to proceed as is for now.

It's fine as it is. Just something to keep in mind for the future.

Thanks,
Alex

