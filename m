Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4908DC43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 15:51:58 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38072.1782489109834456127
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 08:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MKtN1nw/;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8df7a3a6fc3so13599956d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 08:51:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782489109; cv=none;
        d=google.com; s=arc-20260327;
        b=JysrCTq0YPwNRfel2H2GfDorpji18rniqn9hoiY1uSXMiFqPwmSQ4zBuBJhg+1YJg9
         EL0uWFmOwW64Vq9P1g1AlahIalDYOhWM2mxwj5x6cyYc/zzWPae8K+Frmp5l5l0KdNuZ
         /Zwd6NK6Ur7DVf8OtMAAWkkYQ6/BOFKOjtD7LTytfpG55Go9RSgpz0LnaWtPSwUV8rCv
         qM/KQLk3uQ44W3MeJ4Z751Qjx3CSToJbqzuqX71BS5FYsgiwEsMZ/fOsc3Ql7xJnM5Qu
         d5889CS//676x6cBVe+QDu5DHHJUzVj325WQ9zkVMA3FMVSDcS6VRwQeJAx86BwQVpoh
         rbVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vCV6F/GvDPVK59Ke774A0NKXdyjA+rF8JlBKCwKx8PU=;
        fh=P/4EJgj+eGhwBBBjkan11mjw0IkzEEooDaNMS5xS4SA=;
        b=J5a7Cmae0YN4J4Xki7bIiBJfSv9PSabfIILbgO4m14DdtByWAoi2duW77R5B155Y/S
         S/a6xLvtfzwwKuN+HKfYKMxvtiL47PPsyRfcd1f9+yRka2al1Vah76ckxgpe9lJakWtz
         kHkDzba2d8jsNdpwLqVcWXhMfeFerYTe0gYsqUPM2XZIpbhN4H+vwtKacLjRePpAq4u4
         taEWq7XbKYMzpf44fQ9T13Yts89+vqXUOZnyEcmgPD434uKK/MUj+xRPVgzAqz7VzsTc
         /N0bMwW/ICE3mUwX3rQuMfC00qY7tNGA1H//I1ce8xQl1hTllTwTHVO8LKXxHlgLyhiU
         SXQA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782489109; x=1783093909; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vCV6F/GvDPVK59Ke774A0NKXdyjA+rF8JlBKCwKx8PU=;
        b=MKtN1nw/oSfUYqskPPaEKZRnTJEIROCEfuIhGEGr0UOYhhZC8uCqO1bymyF9BMuZVv
         abH9P5YHZn8xWjtiTxzDD7/LO+bVWzMyIv0mfZeMsTiDsvnuIAMQJoxdNsYW6YY02T/k
         JtToMY1Gqgv0DCusYv/3y+wWArxPKc7xIExCXXz4YY2hzLthO2MRrw8aNV36F0J2oMsc
         V+coflIt90Otjl+llIy9gaG0G93geD3XKOcoPP361nLUVRn2Hkk508QPup10QAwYJNN7
         loF8INw/r58ln0Cnt20xmS2doOLDy2Kq3WR8qbiBpKp+9dTexdjq6Wo56NXcTvrGXezK
         rbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782489109; x=1783093909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCV6F/GvDPVK59Ke774A0NKXdyjA+rF8JlBKCwKx8PU=;
        b=Z329G/rzBQXpF4jBeCzbvr2mNb2BR5BShY2N8Jl7tS1AOnHPiKv3qIzYb2yO6UusWq
         KZBuMXjuamMrBn5douvGcI9ag2r1hcaXn95L7PboT7ClL8QwHiEnamN4Grzbzec27NhP
         iEQZD3RmL2VYB/5uw5bQeh9wgbwCmvXCyd8PbORg8x6Wp1K71FTvqXLMFvArNImy6FuC
         ViBG0SXXA8yXER0jAENaBqZztCAmeqZ/IFYWu7pfOKnnsGFSxkVtLrEGiKbNjXBaqiSn
         rhckG+19diPfdImcJWyYur8yncwPO1uBoGiRQ2uYJ43gI9bky1VKG2zWf2kLA9ymraJD
         7nxw==
X-Gm-Message-State: AOJu0Yybru/hNt1LQW9HX71Dv8qA/XyFoJcOgZco1ysDwH7KZbigrGy1
	imtnTUecdrsCXARPDGkNEru1IBWQWMHfY87lb7biuIaJVFKExT8xS7Pt/BCxj8KkImZbcnflkqv
	ZlLgcR8f8BBqzWr3DnS4BhPo42gYakX4=
X-Gm-Gg: AfdE7ck2DmQikv7K5rkW0PFg91I/bXDf2A5mpEXlvaXr4nfGxS3QzodUqTpuXg1kpIg
	IylYmuSBBedKr/Tq8nSBMugHeYLzsUC2QSU022zXt1cjUQfowzA8u6eaC12zOrhSulQASESwg+4
	CvOb1c+SY85ytyqpeCvLE523TdnhoO89BOx+quMbBhaZ1OlREGvHzl1e/iI8DS/XM9MzHnsuH5p
	1gZQBRLs5hRpVr/5xq0kS4i4t5/CCRtBiUFYhA21weIjEX2ZKfqKdCIO1hP0wV7taq1qlKWGA==
X-Received: by 2002:a05:6214:f64:b0:8ca:1e0f:f20c with SMTP id
 6a1803df08f44-8e97f184695mr21831006d6.4.1782489108604; Fri, 26 Jun 2026
 08:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260625133120.2111653-1-luca.fancellu@arm.com>
 <CANNYZj8L9c48wTyEp38RkCMzi=XQQS9_rr++KJwZvk2fSuTHeQ@mail.gmail.com>
 <60267670-C3C0-4448-B2D8-B7B60E7297D3@arm.com> <CANNYZj8jarNnjjVLhW-F7guAz359G6MV5bfod-5VqXqZmi_F-w@mail.gmail.com>
 <6D639B9F-A286-4011-88EF-0A485F66B56E@arm.com>
In-Reply-To: <6D639B9F-A286-4011-88EF-0A485F66B56E@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Jun 2026 17:51:36 +0200
X-Gm-Features: AVVi8CdU2swUFDyMqQkiNxRtlLxJbfueiP8mgnah2Ifz8KcPmUXefL2_sUAapZE
Message-ID: <CANNYZj_BLf8RC6-xn9iU3EomsOE=9meeR-bku-+vcX5qAMDy-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] llvm: Enable MLIR support
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 15:51:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239652

On Fri, 26 Jun 2026 at 16:55, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
> On the production usage: I cannot point to a public OpenEmbedded/Yocto layer
> today. The concrete use case that triggered this work is not public yet, and I
> am not aware of another public layer consuming LLVM MLIR at the moment, so I do
> not want to overstate that part.
>
> I still think oe-core is the right place for this because it is an optional,
> standalone recipe for a component from the same llvm-project source tree that
> oe-core already provides. If the lack of a public production consumer makes it
> premature, I can hold the patch back until such a consumer is available.
> Otherwise I will send a v2 with the expanded commit message and selftest
> coverage.

You should send a v2, so it gets a full review. Whether oe-core should
carry something that technically belongs in oe-core, but has no open
source consumers is a question for the openembedded technical steering
committee. My personal take (and I'm not in the TSC) is that the
situation is fundamentally unfair: this pushes the maintenance burden
onto the openembedded community (for example, when this recipe fails
to build or fails to pass its test on clang version bump or other
changes), while the benefits are kept to this proprietary, secretive
project that you're involved in. If/when there's a public consumer,
this would tilt the balance clearly in favour.

Alex

