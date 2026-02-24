Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A6FF4BB66
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 17:31:35 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25875.1771954292577276812
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 09:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tw05rtIM;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-896f632d206so479376d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 09:31:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771954291; cv=none;
        d=google.com; s=arc-20240605;
        b=f8WcklyLHd8IOlZirAFXnvhgaGUDoYrvHXA0/ciKnOHfoLE5IRwl6Ps7Y9wXl+xGx2
         1RR7Yd7cmS08nGoYH5WEEPD7D7op7YNDpDAE1dj7zK3lNN7HKFU/A8bEMMW3t9CjPh8L
         /QXJPioZ8EMUF+aspUdmgsW7f1O5yHZ/xqQ85G8KXGziCt/Ts6tp0tITYB4H3UW2Kku0
         ygZod8ovalnqNG/Ow0SR32SjbsORCWSwAakcmN5OMZd3lu9JWbPQkCRqGg1hII1RB7dG
         UoVeXBoR7X6gTJgY0AsK88IRjn4JmQ6Jv6NAn2Yw+kfuU6efgXiXHqR5Nda8ZDVGKQTh
         75GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3oFOGbYEZZL4M+en2JYNxePpMhgWB40BiR97MJTU1Mg=;
        fh=QG0/1kl/iNDCWfShgAIKRpbEE7JIBRGbrVXnRZODZk4=;
        b=QIqC1FuU5m6qEB37hvpx1J6L7cnWFB4ritSlfK/3waW/pcxRvhd1h7EzOhBTVStqIb
         unk4UfUq+GYRqFmvVKtGhbzYPDCc28bvaCpXQ84yjW6udhCd0YtAtAw1By9pT8Ojmsi4
         e9qdozGkeFawzBfX1DSP4UVBDyvpmo5HigkfxVWTbtHarlzGc45HIdFtRD5aICon8b+4
         Y7XvCigJ7+PQ/Mvd6G7qpj7ikVkxr4GRXMDt2DFtSHiMwTbfRDcs8MIGswII2QHxdmvO
         moY2PKn0TAlM24cumn0VNG8uFYkOvK/FVxx3/A5gundg0S/PBTjpGskGjLBk6X0gINrB
         WOYw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771954291; x=1772559091; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3oFOGbYEZZL4M+en2JYNxePpMhgWB40BiR97MJTU1Mg=;
        b=Tw05rtIMo8YBsxd1LT5J+yVhAhdGoNAOLod6+1AYJ5Hf5/Fs4KUACRmql7BsWG7gTe
         rN+bolNik/lcHRFlckkNlAVNm5L4D8t18EsaQ0lMkM8ureKLKilfu9dQnk+O0Ymd91QC
         L4oidSUWerD8V4QTQT519qMTz9jqAY2Do1fTIjqC2jPpSOw26dHcybwGGR3QuHvT8owS
         7Gj+svntsKwomt/xq5R5ww90rOEazpx7Jd5HpzzpQ7expV4Ql1rBwoSvWuqlkLkKkKHk
         pSoRIlcOEkYtkfTKmSx+7gXYc9E/uiAz9UoimX/LW1pHdPL8LyvQN8zt/rtAmQiR2pAD
         2Rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771954291; x=1772559091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oFOGbYEZZL4M+en2JYNxePpMhgWB40BiR97MJTU1Mg=;
        b=CCl8kjHrMyvOqiyn4mik4iExpR8JEOb3MzI00kYkUkdyN6hsL3ovJboS4yggIBlUzN
         LzwZNSOnpjul0W+8x1/ZuRrm6Pra6TBe91V9KMFWNMSwVjuVRI5ttgX6IzRxREgplUxJ
         O30gyFTRvo4WcSutfBz5SUIxU7xXhU+THRo9QFR9hV2NoscQ1p/JIsrx2fFd+Qu4RHm4
         Qe68KeCtjnq1ZSI3epjkZpf5/HC/NjRx2i3JJoYpyOiDbQALzQ/4Wb4/qvgRLtDv6rD7
         5UifXVWZg/nGn3IOxD/KQmygMQPf2U6b7ikKrl/zojI36lAK1xI7wcGjSyYPxFeQiLMu
         Cyxg==
X-Gm-Message-State: AOJu0YxNbvIsXCwLhdmq2neNJynjVyFc0f477LtOiIDbFMj7LO4i0iPR
	2nfb3DW3JgOVoPMY9xo8O3cNh7mWLo7PqtWlQMvwXJDI5dpRlNSjIseE3qeGYfEHHhlJM7Ccgo5
	3XVbDU2eAyedHlVoc9SIHXC2ihPYa5Sc=
X-Gm-Gg: ATEYQzwb9n4P5INfV4JOxbKDuofogRm7RhiDGFnJYFpeeioR/NcYqoDV461bzBOL3cz
	tyBEqCfGVrs+pWQ//3UvnaH/Ou5STv1wM7l3Epx9oXldM6ZTy2h/NVpx52tMmPd5gpkZL0C29Mc
	crxfUVs/jyEi24Fw7FtnWUkSk9dCCHkhFX3oOhsY3qhoaBU1k/2YUtUA/ZPVfba892+ti/QxPTv
	qf3kK9oprSH7bA/EeLcPdeMKlKf4Dae2Z9zS2Z2HMaUvOAnfl5AgO1OnFYmNYkWB5DMG+Wdjw0O
	FoLpQH4hxocs0BprSx0u3gXXV3JVb9E3P6ODoDZJKw==
X-Received: by 2002:a05:6214:2261:b0:895:4c99:b1da with SMTP id
 6a1803df08f44-899b371f274mr11745736d6.24.1771954291343; Tue, 24 Feb 2026
 09:31:31 -0800 (PST)
MIME-Version: 1.0
References: <20260224035119.1597-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20260224035119.1597-1-liuyd.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 24 Feb 2026 18:31:19 +0100
X-Gm-Features: AaiRm50eW2vhDOYRuFhxVYc5Dv2dsFVOw8jIo5evJAb3zLvSgURcKedv3s5luMA
Message-ID: <CANNYZj-+vYTQW9bmOTgdNmZVTxFFSSrqoh7GQJ7EpEy+WxiSrw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] orc: Enable hotdoc to produce doc
To: liuyd.fnst@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 17:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231896

On Tue, 24 Feb 2026 at 04:51, Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=fujitsu.com@lists.openembedded.org>
wrote:
> +DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'hotdoc-native', '', d)}"

Unfortunately this is not going to work. Yocto's autobuilder does run
builds with api-documentation enabled, and they're expected to succeed
without any additional layers.

The correct thing is to define a PACKAGECONFIG, and leave it disabled.

Alex

