Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F12BD5CCAD
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 13:01:43 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.14290.1730293296732672451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Oct 2024 06:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FiGfHTkm;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso6802981e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 06:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730293295; x=1730898095; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YEPflvgI/Wvz0dqCWOQm3iS5mmQeczvxC+k580ztnjI=;
        b=FiGfHTkmW4CoC52fM7S3Q7n3yRlp1UEr6D6WjcH5JNKgn+fa6wQYeUm+3OUc7GuuRb
         z0QZY5ZWKSNl1AGlVwgzxL5OJGrghkpj8EUYS9N2PC9H4W4UjIvgGNUb7foX88mAS0jH
         ROh4ZPvy/ERR+2LRCR0XduKNm0HKPTIqlfZv0tyo5z0S1MyTJMU4X/DNUKL5Qr0d2gmm
         JaiEiDtXf0uzwFGgafpUc6MEazg3poQulZs3EmBqr1p4Fz5HXXbyfGF+U6djRvqL2iQR
         pdSfvdEQTXHed+HBcUbnXdsJaY+/ezLuUxAK9XhYWdNCi34o9U9sOPbb7dIm7yTgQW0K
         xv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730293295; x=1730898095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEPflvgI/Wvz0dqCWOQm3iS5mmQeczvxC+k580ztnjI=;
        b=N4B0R0F4sTOcJqstUB16eON4j9KMoVkY417CYAfF5+NzuFxbneFFAju1rBzGBT3na4
         sjPubgi3zPpzEDYMPo48MNnoDpwOmTbUky0294IFKX9q5YnRPBFIDAwgyJcmh6+CJnbN
         NDB4uHq15Rqv+7mg1Kro5iqYZj8yOu3zUg/G8XFSw+qJ5DOQlRofKdOGQ9k4CUVrV61d
         A/TWFu+OKwuB1/PhnHouvHnJmmscd6/14EMldI2fnmURw+FvPybdnvQCodXRiB7SASeu
         bAPFXDv48Tg4IwH4lq8drOXzVG+ig8uzINbY8xGJodbNCl4Dxl/aTpJoT5rFJMiSPl6j
         MY9g==
X-Gm-Message-State: AOJu0YwHZmt+gc/+DeRI4bPBT0v/4hgHtgrCfaJ1xebz3bmyfWXoVrt8
	SBojPilx55oAR9tK5brbSGkHOfTNOOpNspglQtlTZHluQ1zmsIlqOxOuXFqvSBjRETTz4WESdz9
	wjEaHHQPcc02Foxu85A96sbl/NOFYxBTP
X-Google-Smtp-Source: AGHT+IHcqmbjASNcIevJNSqILUaIJPtdAILO36pQF//H1zke88cs32Iy83Fk4T0eTIf/YVFtVveyWnXaBYHFNBjgIYE=
X-Received: by 2002:a05:6512:b02:b0:539:8fcd:510 with SMTP id
 2adb3069b0e04-53b348cf11bmr7024797e87.20.1730293293770; Wed, 30 Oct 2024
 06:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20241028034618.1504830-1-vince_chang@aspeedtech.com>
In-Reply-To: <20241028034618.1504830-1-vince_chang@aspeedtech.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 30 Oct 2024 14:01:21 +0100
Message-ID: <CANNYZj_KF41W10duL5u0mDDbv1aFUxdcGAmUtO2fEc0EtZ4ymg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/2] wic support different sector size
To: vince_chang@aspeedtech.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, jamin_lin@aspeedtech.com, 
	troy_lee@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 13:01:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206549

These two patches have merged, and unfortunately there are now
failures on the autobuilder:
https://valkyrie.yoctoproject.org/#/builders/35/builds/346/steps/14/logs/stdio
https://valkyrie.yoctoproject.org/#/builders/54/builds/325/steps/14/logs/stdio

Alex

On Mon, 28 Oct 2024 at 04:46, Vince Chang via lists.openembedded.org
<vince_chang=aspeedtech.com@lists.openembedded.org> wrote:
>
> v1:
> - wic support different sector size
> - util-linux: sfdisk sector size improvements (merged)
>
> v2:
> - For "wic ls" modify get_partitions() to support WIC_SECTOR_SIZE.
> - Add oe-selftest for WIC_SECTOR_SIZE.
>
> Vince Chang (2):
>   wic: add WIC_SECTOR_SIZE variable
>   selftest: wic: add test for WIC_SECTOR_SIZE
>
>  meta/lib/oeqa/selftest/cases/wic.py      | 50 +++++++++++++++++++++
>  scripts/lib/wic/engine.py                | 18 +++++++-
>  scripts/lib/wic/plugins/imager/direct.py | 56 ++++++++++++++----------
>  3 files changed, 100 insertions(+), 24 deletions(-)
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206417): https://lists.openembedded.org/g/openembedded-core/message/206417
> Mute This Topic: https://lists.openembedded.org/mt/109251303/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

