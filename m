Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3B8C25B48
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 05:29:44 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.770.1698384582011964455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 22:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EIZBQmJW;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c594196344so25197751fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 22:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698384580; x=1698989380; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=swSeBhfpuifmK0lMprzi7mSgPHdExXnLlWzCVDTmnOQ=;
        b=EIZBQmJW8lrGz7vyRlOR/IZZUUaiW0pRM2jp+LKNmhn1HObTo7fv/xpv2ZT8oxjQzM
         u5+zvUuoBdGAveviWEXhnfYZm+YOSwawjkaG4dIKLiViP/omiwaLEu+KGAHXf28V28Bu
         enjhY1/0Gd6RCkE9ZnCrFbleMdbqA2mHmWaW21l8VtqPboQrONzwiPn3ZJYjw+zw3Jsl
         B2uPd2fm3hPm4vSZGyiPE52ATF80pP1d9eZCAGhUJbqdK64KAQ6CYa2LUlvikAHwRoVK
         vT9P0i4wp/3pKERK9Ivwblo6p8cpV7WncOjdoEAip+3zI/rCvH2c3Slw8WZ7K6jTyIHf
         VP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698384580; x=1698989380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swSeBhfpuifmK0lMprzi7mSgPHdExXnLlWzCVDTmnOQ=;
        b=mR2LRj3gT6qXQAgP3Np9TeLy0cwDdjAXPiavo2CSSRqje05VlKVZw7kOaqGXS59jW8
         J4Hzr6JkbsMWdpipe/cY8ewE9a8kHcswSe23jnJLTFGWk04q2L0GUbafm0JiEPXDV/2C
         XjQcYN3oltlsbZKLl08b+BZ3wsZwxyuNgydKEcdKkGrFDCDMD+ECNmepS6CsyUDCbLqZ
         bWrDxm5If2K0ZyF2mHYJRFu7ZAxgHWSpqdX8+DQFUPN/95Tobxm+WRgRdDvt8HQC1w/L
         3VWR8Bt2t5VktpkYC07NbsD8JwRzjUbbQYznvNkEg+TU4KSyvsNALoJirp076XBGQKtL
         bBoQ==
X-Gm-Message-State: AOJu0YzavcAvWDCbU/zIPsKC4eI/MUaaXwYRUna6OapUUSKTAfDTZpR4
	CtMFp87HHI9dTwTNuIkuVAZNRRyiwZ7woyg5dUo=
X-Google-Smtp-Source: AGHT+IFasftvKkc0gf8ucwWkWVx5sE6MzFog7thru/HvZ4qGIQgwgoasJpySvRSS+asaw0g8v5kjyYw09PJENY0eMq4=
X-Received: by 2002:a2e:3c12:0:b0:2c5:1542:57e9 with SMTP id
 j18-20020a2e3c12000000b002c5154257e9mr1214265lja.41.1698384579814; Thu, 26
 Oct 2023 22:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231026103320.2751277-1-alex@linutronix.de> <20231026220221.23f75433@booty>
In-Reply-To: <20231026220221.23f75433@booty>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 27 Oct 2023 07:29:28 +0200
Message-ID: <CANNYZj_6kh4bXP_bunqy1s178ZtArCgy=ms7+eTTYVY0G1H8jA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] selftest/sstatetests: add tests for
 'bitbake -S printdiff'
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 05:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189738

On Thu, 26 Oct 2023 at 22:02, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> Is this different from the series you sent on the 23rd? There is no
> vN tag and no ChangeLog, so it's not obvious.

Only the third patch should be different, and it has core-image-weston
removed (as it was causing missing objects, as reported by you). I'll
try to include changes under --- in each commit going forward.

Alex

