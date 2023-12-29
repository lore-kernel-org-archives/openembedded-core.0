Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7950C46CD4
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 08:04:04 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.141399.1703837038581404917
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 00:03:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IS5j9leR;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50e7d6565b5so3602162e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 00:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703837037; x=1704441837; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JZWb88f5hJuPUn62xcq4r15vnKkfiWrzE0T9msNFh4I=;
        b=IS5j9leRJRX7rVolhapeMwIERjDW0KiQ87v6E4wvvPUaewvasOk/ur33+B9Kf5o0Vo
         DryLIksg28F9Zit/wskAbaDaTbCy31b8w2S1zJ1XGBOifgFPDzGOXEFL8/cpiDXjq2vw
         BDq6ZRrjIZKAhZJdPve+97ukDIliLYpBbivUElZJLq7BzGam3Uy9VYV/6H93Q9btlv9U
         eEWuDexrbTrlfeAyY+a96UJasyoJyU2ivnflOUhkrLrMO0X08xHBluehl6lK7J10pJv4
         W8NO5V8emcXBTzVQzfyKKrlNU4qQpG4gOZSZVX+38dm8ecPlQ3CYREKneneg+pNyAmjr
         ZyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703837037; x=1704441837;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZWb88f5hJuPUn62xcq4r15vnKkfiWrzE0T9msNFh4I=;
        b=d7nY9fA+RLm/N09MSV7gLiRoNEw/CT4BirEkI2Q/qTCxt34cMH/qxJkloMQfh8HO42
         Y/r1ah02aMX8mcWti2ICqO8nLJIx3/Fr5B75CsiQmlE79CTYowxKzyoQ8EKa3hkoZMnJ
         iqyMxi/PJ89+a6rvj8uTmKx1n+jtn/Y0EjXiP3uXyIdXg/uDVXNcZnLLgW8AyN9VziD2
         ZninCHvsimYCuElVooTFcP4fM8iUtPCdJP2s1Wzj8qiPIqPSDhjUwY/5zg6pCi8+RTb5
         P56nlSrrJercR5wqteu0MsP9PEUDdntz3xQHP0eyEnzqtNG9KsnGjiEzI1efaAKrtdpi
         ENzQ==
X-Gm-Message-State: AOJu0YxY5BytgaZIsPT4RdB/nWgu8UMnM9tRdlSag8aBGVZ/7liGsxSp
	tjvTlE/eaC/bapla10LvxTbvpzHc/h6Q/JdM6lA=
X-Google-Smtp-Source: AGHT+IHCdFOJ/QNcl8F/mivIyjgJJJoU20iTocvYIQzNLcESNY/2bfevC3ypKPfYVdO470OWYN3dcxuqd1R3NAR0MhQ=
X-Received: by 2002:a05:6512:3b9:b0:50e:7410:e236 with SMTP id
 v25-20020a05651203b900b0050e7410e236mr3069855lfp.64.1703837036497; Fri, 29
 Dec 2023 00:03:56 -0800 (PST)
MIME-Version: 1.0
References: <20231227042036.2376255-1-Qi.Chen@windriver.com>
 <2023122711592084d34620@mail.local> <CO6PR11MB560279EC2354AEBC89D8E15FED9EA@CO6PR11MB5602.namprd11.prod.outlook.com>
 <202312282114180d86a09f@mail.local> <339c8673-650a-37ee-dad5-e7cd3ebfedf5@windriver.com>
In-Reply-To: <339c8673-650a-37ee-dad5-e7cd3ebfedf5@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 29 Dec 2023 09:03:46 +0100
Message-ID: <CANNYZj9jjnjCXEYfsXC8uG3_UWM+2cijPV8+iioMG-uREcnsbQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/3] systemd: upgrade to 255.1
To: Qi.Chen@windriver.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 08:04:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192999

On Fri, 29 Dec 2023 at 03:38, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
> > TEST_SUITES:append = ' systemd'
> > DISTRO_FEATURES:append = ' pam systemd usrmerge'
> > VIRTUAL-RUNTIME_init_manager = 'systemd'
> > DISTRO_FEATURES_BACKFILL_CONSIDERED = 'sysvinit'
>
> OK, I see.
>
> I'd suggest replacing the above 4 lines with a single line:
>
> INIT_MANAGER = "systemd"
>
> The INIT_MANAGER mechanism was added to make switching init managers easier.

I agree. The 4 lines are defined in two places here:
https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json

Can you send a patch to replace them with INIT_MANAGER?

Alex

