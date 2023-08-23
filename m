Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706F8C27C40
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 18:44:50 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.1009.1692816286091158939
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 11:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=X+HGDCdt;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4ffae5bdc9aso7048802e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 11:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692816284; x=1693421084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H5LomSMjS+MEvLm+L9U7knEorG5ANE8HvDQPTAKdNr0=;
        b=X+HGDCdte2zPZrCeEdmZmNDq+MiLQjTQY57kEgmBSC6okLI1ccoM7TFj8M47uZrMG1
         5VGjF9BZ0Qp0sC0P1P7PlYYNnApMmf+usGCf7APDFxV/cIMc3XP8sTWoo1Omu5NG63jV
         czkhM2ZLK4qpWbpCvc+swFjl6yj9Ud19/JD2PgUPQHaKNZvNOe7anD4pkMxTVbvyuYAc
         eQyYmo2Q/K6eVi0hqtz+veti824iYWktwVAkY8oRiL26CumSBVAFk01duew2A15lmS/A
         x8C/KRxgABDDoB172hhG0EtYD9j3hRbd9Rl1UD92tVn06tTt+VFQBxPMrKrl0FE4tZKZ
         P8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692816284; x=1693421084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H5LomSMjS+MEvLm+L9U7knEorG5ANE8HvDQPTAKdNr0=;
        b=lwrGx7abBOrNjyutq3hLGOVIoqGrJWNqBmRID2GvbTMpfFfLrVIelluCBWu48LnkFW
         guhM3SftSUCVWeCoKUt3pp8196UIdPygfmXsxBHqHN/QToh8qy3oSPUYdccSu9SXVfW7
         JxLN8JSngrvre3Aez/dwFe+fh0N6HG1cMzFSQ2uJxEnbA5zUDuRg9kTkdVX3R9N1oy7R
         ArhOz3eOQQZb+tc8T+FvDo9yfRI5PwmvdhVe0IBZ8/ITI5BGoGxZR0RaMZlRVCQOVPhz
         z9mhjCchcF2Iv81kQQX/cSyQrkRt0spesZ5Azx09nZP/0XOLS+Hbo7MOOoQTvmzs4NlX
         6V3w==
X-Gm-Message-State: AOJu0YwFONSnd6wUAw5zGehsv+fPrJ0vHdEPLsb9YyA/CGzd4lRS8F5n
	k4sqcseyIaipARbLFVr7I6rSDlVMBJ9BqFofXSVFRfH9
X-Google-Smtp-Source: AGHT+IGP6PNr2ysGOguvNZshuVpKOIN5ozGReZ/L4+6jIKLl0OEnQMPtnrmfJkUFsFErmFiLwM5WOhb5J6uMXBiQOa4=
X-Received: by 2002:a05:6512:3f09:b0:4ff:7e04:7575 with SMTP id
 y9-20020a0565123f0900b004ff7e047575mr10813606lfa.14.1692816284089; Wed, 23
 Aug 2023 11:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
In-Reply-To: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Aug 2023 20:44:33 +0200
Message-ID: <CANNYZj8iTJCVqdwaiiv1MM-dxWcXyS3JjHHN3KwnA8o2xx3v=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/9] core-image-minimal: increase extra space
 to pass df.py oeqa runtime test
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 18:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186631

Either you need to use a different image in testing, or add the needed
pieces to this image in the same commit, explaining why.

Adding extra space because you have a local, custom configuration
where it is required is not correct.

Alex

On Wed, 23 Aug 2023 at 08:10, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
>
> testimage.bbclass requires that ssh communication with target works
> and then it runs oeqa runtime tests with that. Tests like df.py
> check that there is more than 5Mb free space on the rootfs on target. Sadly
> latest core-image-minimal only has 1.5 Mb free space if
> ssh-server-dropbear is added to it. Thus by default, core-image-minimal
> is now failing oeqa rutime df.py test.
>
> Fix this by increasing core-image-minimal rootfs size by 5Mb if
> testimage.bbclass is used which implies adding either
> ssh-server-dropbear or ssh-server-openssh to the target rootfs.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/recipes-core/images/core-image-minimal.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> v2: no changes
>
> v1: https://lists.openembedded.org/g/openembedded-core/message/186423
>
> diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
> index 84343adcd8..c04612bc15 100644
> --- a/meta/recipes-core/images/core-image-minimal.bb
> +++ b/meta/recipes-core/images/core-image-minimal.bb
> @@ -10,3 +10,6 @@ inherit core-image
>
>  IMAGE_ROOTFS_SIZE ?= "8192"
>  IMAGE_ROOTFS_EXTRA_SPACE:append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"
> +
> +# a bit more space needed for sshd to actually run the tests
> +IMAGE_ROOTFS_EXTRA_SPACE:append = "${@bb.utils.contains("IMAGE_CLASSES", "testimage", " + 5120", "", d)}"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186549): https://lists.openembedded.org/g/openembedded-core/message/186549
> Mute This Topic: https://lists.openembedded.org/mt/100910038/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

