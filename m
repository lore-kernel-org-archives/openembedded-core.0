Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F545D116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 13:37:20 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21668.1764596238091528553
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 05:37:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L6yR9ysM;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8823dfa84c5so43614236d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764596237; x=1765201037; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WRnIJLXFOgL6+K3iHPFIHyHpERWpUYI/AEu8sF5Lbnw=;
        b=L6yR9ysMBvkSh1xA+CoS0HtQg99t3+LYy/OPcWvPrfY5WB0tUoEb5XHKdgkFtONTFH
         ECrHjnCWhCeo3Rny8W25METmFJVPK2MWNS+jneRt2h7BAW/MDLHPQlB92sqw4nNN0y9A
         JdQWHDK7oe97uNASt8se/x4QZDpVu4agM57m/rOUXM+KLCgaIkO2VFvQn9F9z5KE6CYQ
         1ddkSYgDyfbkmArSLval6dCk7+D2E5kJJIKKZl4PfYS0pTsKin1/vaqNPrMsDifj6tL+
         Grz4NL9lG9Ql87yXWeLj7AmCWW5Bwc9lNDS7HoveTZTabqgqdmNNUspUVisnfn/cKWgb
         +p7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764596237; x=1765201037;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRnIJLXFOgL6+K3iHPFIHyHpERWpUYI/AEu8sF5Lbnw=;
        b=jLd40ztKZiQa3ls8E6E2xXcZVAFjjA6SOIjNsMKrEN3cMq/5FywoTDt6r1Qrs1TAIY
         9AL0zy6k5py7DlExlhhEWbh12a6Ych/nDSafJOWt54A2RFyDLgYa6OWrFLccbKzwldgg
         NByKDuhDl+pEpR/aE+oarWKJtssUv7ZBfdIoTK9bsgJfgacJJRHpvMqU7+96gP1X4AMf
         Gph75SNDVWv2AFzOtOg36PFwUVxt/gy2ehvjOcGsDn9dj6MoIRV9nN+2oAGjH3Wb+62V
         RQqUpgGvmspNve89lgIoMTZ8pxwlsDoPKS+xt14CdKPWaZQk3m5GenRa1rXfewYSmdPX
         f0Cw==
X-Gm-Message-State: AOJu0YxRAFHZ6YIP5J3YYljdzCYICWNozGAr865Huj4pHzdFflWlTqx+
	xsqPsUL9dm6o+jLgf1MuWC/or+JcjkE+oBSdfVYwMfh87cQd/EmG3zWlrAIWwVLE8wvAe24s10I
	fbfT1Y/ZxwH+3TLWR+62K/aRMLmbpJIEItA==
X-Gm-Gg: ASbGncug9w2X1V1P5VJypPRokUtQ7Wg3BUJ+0QDqUg3gAUvNRZ1oANqElTHZ0ye8pE2
	9w4F0koHjAM11co/yVkSqNCsItZVfsJn4KVQ4m4CA2r8ApTRdDKPF8WvNTSg8DXLJY+NUcLNAkD
	v1hAvLFIQxbnTu1zschFIY9oyaVLkqCnZisV26bAbOHA4akLK012hr3e5zyrVjRvjHZduxDqMwG
	IRlfTNnaAXSPlXGMedzR44Oy20URyIc0sQmfGtSkzoAUQHREWjxc8rFu/QDfL5w5FwKHac/C0Cv
	9JzhZmR28JjgFie1dELvHOgy1WlKqQ==
X-Google-Smtp-Source: AGHT+IGUW79dyzT/83Gwx4K1AAl+2BaIJL8tsDl/w2h05znWXJh0RHmRm5SOHjjPTKIWZrV9GToMr9wSsCRsM8OtfGA=
X-Received: by 2002:a05:6214:f21:b0:880:4aec:c4ed with SMTP id
 6a1803df08f44-8847c48987cmr579015606d6.6.1764596236943; Mon, 01 Dec 2025
 05:37:16 -0800 (PST)
MIME-Version: 1.0
References: <0101019ad85903d5-5660cc22-2638-4301-a3da-6ddd6d101c3d-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019ad85903d5-5660cc22-2638-4301-a3da-6ddd6d101c3d-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Dec 2025 14:37:05 +0100
X-Gm-Features: AWmQ_bm3MS7mz4H4qNQJRCtyJGBt8kdqrhi5wVSh0IhqipFQMNmVAFPJwquBhGc
Message-ID: <CANNYZj-O8pd6ZymoNtM9KGYAeY05Qf23LY3o-HWDNLzTgqZNgw@mail.gmail.com>
Subject: Re: [OE-core] [AUH] Upgrade status: 2025-12-01
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 13:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227125

On Mon, 1 Dec 2025 at 06:20, Auto Upgrade Helper via
lists.openembedded.org <auh=yoctoproject.org@lists.openembedded.org>
wrote:
>     TOTAL: attempted=177 succeeded=0(0.00%) failed=177(100.00%)

The mass fail is due to the autobuilder using fragments to set a
machine, and AUH using MACHINE=xxx prefixes in bitbake invocations. I
have a fix, and it will be tested when the AB is again available.

Alex

