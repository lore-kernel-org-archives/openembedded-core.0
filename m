Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D25C47E49
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 09:44:47 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.18950.1706089484693902688
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 01:44:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K3KBMXUX;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50e7af5f618so6016512e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 01:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706089483; x=1706694283; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fXO2UPVlYy97R64Oz0hMIofRJPTCM6pl3NZcFhLvWLo=;
        b=K3KBMXUXrpRdbPyhcMpQeBvM6oOtI7ZnNnhY+abJ8/7vSjFXGQ/q7x+PLJ0+ptetCw
         4+JBr2EGSW2uHrsNlZ/hjlNFOVqhDA1uS0OrbdBn75sCT/Aa7Ga26qMFqa4oMc4VodB7
         qMPM7DmO0qvUk9TB5lgKzcQ/JojX4zwPmhdI7g8SfEQCZY2UBnUZaZ3+qwmjD2hjxfHe
         ZKTHt5PdFaN8vtNV7KoxU7jm9WPYrD617JjjOobKXpxSjox+7mV5WTq7REWKrJ5425cd
         xz/LWCaKcB7ZO6wexMK0RoBqwc4ud6ftWAY4OEquEAOugabsxu9BmJrYFdRJCp7I23uh
         0dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706089483; x=1706694283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fXO2UPVlYy97R64Oz0hMIofRJPTCM6pl3NZcFhLvWLo=;
        b=JQzO9O+nDGor2ZcBvyXCV2RWN8BJ8zW26CKrD6MK67o/659aaTk5Q4Q0L0zwDZj02x
         99/57WAuAGLcV4t906Xh2N5dvzBr8ca9IfHVuQgE0A5svyNdcEJ7/1xkEm30deuEfdaX
         Ibf8FpJZe4zeZqmXF6yeebl2VOtjhKotnYeXir6npQtgb7nClAe3VKoUePyLRwlbxa5h
         BN84mTFs3WI49OVYdBFgLQGJFMlCDZlBQQRCORkDHYBbP+ax0eoSFKr7084xKNhqc7Zc
         Pn/NlgD5nMh/harjoqcHrA8HEyr76B1AcblESsUzKjb1Wcj9LVNY8y7qH0XYJJTfBzdr
         F7Hg==
X-Gm-Message-State: AOJu0YxA4x+G84bjId617SVJI61ruwxvlxu9pEma/dlkmMRGjiKf98Ax
	bHPBoy1aSPvSrttgY102AfFd8SgsgB0EwSz/VZrMyR/fEMic6B07MzVJQHc3myWmyAzU6XaRghq
	yTxVGYBUTlG8C4wFK8bKGT0M34CWTZs+3
X-Google-Smtp-Source: AGHT+IHT/2y6LmWAssbzcETHAcFwkDMBdyA2j3MLZjd2rHD7CLMJDIhsccVL27zeug2la4CQcOlLlQR9E5yeuiFL5Mk=
X-Received: by 2002:a05:6512:77:b0:50e:6c1d:5dee with SMTP id
 i23-20020a056512007700b0050e6c1d5deemr2890252lfo.33.1706089482500; Wed, 24
 Jan 2024 01:44:42 -0800 (PST)
MIME-Version: 1.0
References: <20240124032220.1906541-1-William.Lyu@windriver.com>
In-Reply-To: <20240124032220.1906541-1-William.Lyu@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Jan 2024 10:44:30 +0100
Message-ID: <CANNYZj9=zyL9xL2DofAKTeNd7JPo1tv-SoRvZPf-+AFgNG-Qyg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perl: Fix perl-module-* being ignored via COMPLEMENTARY_GLOB
To: william.lyu@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 09:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194265

On Wed, 24 Jan 2024 at 04:22, Lyu, William via lists.openembedded.org
<william.lyu=windriver.com@lists.openembedded.org> wrote:
> +    # modules are manually split (eg. perl-module-unicore). Also, the split
> +    # packages should not include packages defined in RPROVIDES:${PN}. In
> +    # addition, "perl-module-config-git" is not a valid package as
> +    # Config_git.pl is listed under FILES:${PN}.
> +    empty_module_pkgs = d.getVar(d.expand("RPROVIDES:${PN}")).split() + ['perl-module-config-git']

Nearly there - I think it's better to add perl-module-config-git to
RPROVIDES:perl, and avoid special casing here.

Alex

