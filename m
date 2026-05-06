Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7EDBCD342C
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 08:59:47 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14283.1778057979054114065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 01:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pbzVRlR8;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-899d6b7b073so64485796d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 01:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778057978; cv=none;
        d=google.com; s=arc-20240605;
        b=KHbp9/JkS98Lx9OcVcjbJeYbggSHAJE37ytoHRvCVNAmRsG49lLvtjBBWNHkPdA9/V
         zjRwpaLZgUuJEouGrAc3+NALKNQHjpe38D2adc1NpFRLNovU3dLA8fm5RJLRNdDQipPj
         Pd++8cqY6Oq+qW9nXf6AdM75LGWEMESYzr9hSl0sftgRTAlOveD/kfTOYgPa10q9Z15Q
         iOfrYH2L+VjLJsr2kfjNBZUpK7ZvzFTegGMVJSfLxf8Tnu7IL7xy/h13Sk2ERuZ7cCjt
         BT0hZJvXz4YJRLvXozRLPRzTC6h0DwjpmxW2vjvb7Z+waI2SaMg+GcBX3/A/LlVQuPWG
         WPpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hZCYKKqWZqqma/HBqlNZCR3+qNfsBtolCyKyLWw7ELY=;
        fh=5iLKfLR8Nt28WGSxS7R9hQ6MWIpzU3y1GjDeSsgtxl8=;
        b=gf5BqzJ0pixMQWeQaldFSUg6rQKi8FP5XPcuoU5GO0rCc90sgBcMaJyhE7a2v5GWa7
         cTgYsdbInf3HYUERSbhuIH3K0uTiVg+leldu4JM/WrTSZKJ3ebs7FvpcrAOUQVJj3Hjv
         KFcvdlWH2yJ/LfnWsSeGk45Wpl6fjQeIOyZgDRjiSVp2aqqXeFZQgPapm8c3g3OHxCxF
         iyTz5bHw3CvhHm8qpLanpaagB1xNkcJP4SpmjBFl8XOe9TXoZnfhx5J+Pvb2Dmn7+Gtc
         LPVSIqBxuUe7fgQhCWSEbe8uqAw8VFxwZJJlWaLDgj2VKsc7emPabyuZXEBIP2tEbHx2
         kcTQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778057978; x=1778662778; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hZCYKKqWZqqma/HBqlNZCR3+qNfsBtolCyKyLWw7ELY=;
        b=pbzVRlR8BWs1ZykAoYKq56eU8SU916A6wAKrh/Wd9SWxIoOKuqA4Oow+gZ24UUkzLj
         +l9dMosb9iN17wWhZoZFtnNZ4zjI3wcdtt9l69L1C2l7h0YKR5y45Xp4Zbo5NmtXhMgp
         eC7lReXmMy56ZEpYx9346Ihqdt8TDgVPwZ9TEY03CHmulZzNWfsnc8Tug5kVHxvECYFZ
         UTqpPDsqMLNN5Qr2rr/ZHaik92xZpD/U4+zRmhDTE7uGS2RYUlNjt0Ui3TozPXh0jVuj
         8JOtYPtn7LuB5pmMpoa8Hc0AsjwRsdHGF5tEYFfedOYslacWtZlwaMNZ91Nje6n51CEm
         rqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778057978; x=1778662778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZCYKKqWZqqma/HBqlNZCR3+qNfsBtolCyKyLWw7ELY=;
        b=d5ACBIMQIV/iXL75pyQS5YZ8fXobRnghhXa8KbuIUHLZ1pmfTCwO8/bo+ejbr0Yh8z
         2k3O6PUzZJEUWxQnIbgW6Fblbc+e8/v/FGjW4WPFOztwIZ1E1HrpKMemeEnKjllFHyQK
         o5WpnydbJpyuAIbcLxAUfgqldVT7s2NOt1wYkx0b5TRnaLhkPUlrPYK0o+V7GF9G6FdA
         nn73EZmBRJ3MzXcElIRkw+bLNbV/SyTRzShxuNCqhNuqfda45MHQZ9PoXlPLIRemGhLf
         9iL+Hpzohg/ZX0i64KM3Qdjg8xH2BVwj7mRAg2jQKxB3n3kZp7Boodff52FNhpr853hb
         CLqw==
X-Forwarded-Encrypted: i=1; AFNElJ+eJ4GqbOjPCB/sYo12QON+CAXWWbyeRlKmk5rXtxm0oewV3cbgW1l0BmYt+sQmmMlMQr3DVqvoZEGvCnB56NzEEQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxjX8ZnLsQhvo06U5bFYOeyAENG0rVHsVJpTjWigHHtgMgRwk1J
	RX/iQtq0l8gUDW8yhThB8UGw7Z5zSK06OO7GSJl5qSDqek3nfBmEHTGntwr21r13wvqP1QGvviw
	YXMy0xxCIX/7UcUrOI/QRh/WKFzVJ24M=
X-Gm-Gg: AeBDiesQDuD3bPVsG/WaN6TKwRZgu/vdwgCNm4p7+uUB76dGo4tzWqLsjPs3JtsDBYk
	ZL9GJBGXIuTj3/v/J9YbeHw2ZTzkNJtusY8nCS08lzKDU7OaiejfbPXUPDVCQyaa4m9fy+hLHO0
	rUhM1ya2wx4eMCz2Xzn0o09Qmg/wQmaBmQWiAqMH0XuD8iUWJS8sWi5kE+hpnRfUSIgVbEOY5Lj
	YYhJ2ArT+4yEl+GD/GZihf8q9+mDBuzs/ahn/Vtq3gqVX85MGm4EbLtvjTdsytIZZBYYpJejCAK
	94NxckO5/WA9+25ikM96wH9evUlqqfxk/kJ5kiCGwNFAQaYyt5U+sxF6fNZbyHk=
X-Received: by 2002:a05:6214:300f:b0:89c:4be3:5d6 with SMTP id
 6a1803df08f44-8bc443d6395mr32835796d6.29.1778057977939; Wed, 06 May 2026
 01:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
 <20260502162929.1377831-46-richard.purdie@linuxfoundation.org> <5e34a6274b6062a0e1b2b05524e48589501f0c6f.camel@pbarker.dev>
In-Reply-To: <5e34a6274b6062a0e1b2b05524e48589501f0c6f.camel@pbarker.dev>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 May 2026 10:59:27 +0200
X-Gm-Features: AVHnY4KN3MBlAOtf17NvqQx8pLkdtgzMnDG5_jwdHB9alMmsziHmsCPJwsVOb3U
Message-ID: <CANNYZj_uuzRz8sK9i15a4Gjx_=R0LrvXL1KEZM_tF7SRoiS89g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 46/62] python3-requests: upgrade 2.32.5 -> 2.33.1
To: paul@pbarker.dev
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 08:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236536

On Wed, 6 May 2026 at 10:33, Paul Barker via lists.openembedded.org
<paul=pbarker.dev@lists.openembedded.org> wrote:
> > -SRC_URI += "file://CVE-2026-25645.patch"
> > -SRC_URI:append:class-nativesdk = " file://environment.d-python3-requests.sh"
> > +SRC_URI += "file://environment.d-python3-requests.sh"
>
> I assume this change is intended, environment.d-python3-requests.sh is
> only installed for nativesdk anyway. It's worth a quick mention in the
> commit message.

This change might've come from devtool/auh, but in any case
eliminating conditional appends to SRC_URI is a good idea. Especially
conditional patches.

Alex

