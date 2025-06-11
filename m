Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBF2C678DC
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 13:14:38 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.7527.1749647671086656402
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 06:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W4K0ngDq;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6fafb6899c2so9073776d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 06:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749647670; x=1750252470; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PMWQ4fADAhptIEIn7pzYil6gAF32d1ORgRlj98Yz9Ms=;
        b=W4K0ngDq9cXhVTM5SyYKptVS/he5h+GHeK9mZQJqIjkl2ngCwd7aA8ctYVVICvCRjd
         ajSz81UYiC1GxhETSJMWZQC93eeGbOYef09zY1Ia6uaqM7FTdM9uSCdX3lQDTDAR+w0w
         t6bNAeYxnz6aFAnY2wgVxkdQ7gB6LtBuHhnwv2L4Vq+ybFNTnoOQXboWt4dngFw1pqAi
         B3ej6cSu7iWKG2fKzDAF8zLoLeg0hsHOzwX25Shi9MxHObMhLVbbWSGSepTbcrh58rsO
         wcyxSxZUo8EW59/BDJVcoF1IHqm0VQOQBbtJjNqwOU5T3YRTTiMHpN6yvvBEP6eurbiT
         PJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749647670; x=1750252470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMWQ4fADAhptIEIn7pzYil6gAF32d1ORgRlj98Yz9Ms=;
        b=JCLFlstgUyk5TZ3a7scUonuEABMMrk5SJJXrkkdT1392/+jOG0DZoow4urm1NbtItW
         N+T5/widycPWXezHY4CcLRLb3kkPBhC9QTbwHN94V6ZMEfXTahqSZ8/PmAguWOsQKhHN
         3XlEQBoTvvbpXs+YUcyFVCVHbEYQFWh7vF8GTcbMB4dxutyaud9JZAGi4qfSaNixEIYX
         dQHlpCWetby8g1Cwygv7cEYChrvddZKOrKQ71IJcc5P9Wy1OfELGhl3S8rgI72mnjlOs
         SFc813HviGlGKtDvsdBoK+yNdcwbooAsdsj//uc/m0yk3UHqrnjFRAlDfDQaHbMkh2k+
         fw2Q==
X-Gm-Message-State: AOJu0Yxv1p29iehNAbv2z3+BtakjotDOzzZOqy/oSirbZjAye0XD2DHs
	6pmSJsBYLzkMjsYOxBSzwZCrRywJd80tfd3bmDoj5YbT+3VIZ4kqCfVLoTRuFHYQ4pvKEoM342O
	pkqs1VonLkA6uGrZT/KvYWxB2l/sYplPekkOm
X-Gm-Gg: ASbGnctlTzVJlL6dm1tu6YE4AANtR1AYcS0cRt5skt+okSfxxf732sSExqK27XXL07F
	i/VwIaBFz/hyYeEe5cha1XDjqs/SL+r54Ydv1VqPmRGN3UoWnDRNWufsoq3n8q/hWmwku/bGARj
	nG0eBlpx25Mms9cpsR6MXSmI/1CGaAjLHs8Bkz8o92pJVJgkOhi6Hk1zQcjWwM3vw3o0I1wx3Qc
	REH1g==
X-Google-Smtp-Source: AGHT+IHJVdYnPm0OOSxa+jrgcG35NUYebu9Yro8PfMVzDCR3GQQFbEQXnJWdKC8thjq/fyqseb1LMnXeG6jlTwMWX0Q=
X-Received: by 2002:a05:6214:c63:b0:6fa:abd2:f2bb with SMTP id
 6a1803df08f44-6fb2c38b764mr56290436d6.8.1749647669885; Wed, 11 Jun 2025
 06:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250611122339.2893630-1-hongxu.jia@windriver.com>
In-Reply-To: <20250611122339.2893630-1-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Jun 2025 15:14:19 +0200
X-Gm-Features: AX0GCFt69FKGrgoLDkpdoii_96z9BtFdDZ2zUaaiF3e7mjeplJJProgp4J1aJbA
Message-ID: <CANNYZj_t5L-tXaWW0uq8q5J=Eq=jegqs6Enyu7KTd0_DSiDHbw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] scripts/oe-find-native-sysroot: fix get sysroot failed
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 13:14:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218453

On Wed, 11 Jun 2025 at 14:23, hongxu via lists.openembedded.org
<hongxu.jia=eng.windriver.com@lists.openembedded.org> wrote:
> BTW: bitbake-getvar --quiet (Silence bitbake server logging) could not
> skip above "NOTE: Reconnecting to bitbake server..." message from bitbake

But it should, and it's better to fix that. Otherwise we have to
plaster similar workarounds everywhere where bitbake-getvar is used in
scripts.

I see e.g. 'bitbake-getvar --value BBLAYERS | tail -1' is used
elsewhere, presumably for similar reasons.

Alex

