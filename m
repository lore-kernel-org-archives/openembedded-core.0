Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FADDC001E0
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 17:53:16 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.1843.1689357191965694267
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 10:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=b50nx/Lc;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4fba1288bbdso3520186e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 10:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689357190; x=1691949190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MoIrpqhD6/K+FrE1B0+Ik368adv/RemnmQIjnF6AtgQ=;
        b=b50nx/LcfgnNN2T8788W/ouHbKkYbRbUKSTZABCChqRT5Co9iuuZ5uqIEZhqYOkMZu
         6r/Q90JM9jSvjIMwTT9OG64Oizy+2pjj5K4VvHk60oq+7bGdPefIishBU4jqyotjh066
         369HL7u7Nq7mJee3KoPGz+OUmBvb1dsv/azITIgIFFvlbxl/dOCDNtaYlLxEfutw0+DP
         1jAAecafPmyKFYNAqDHqhuerNWa3YbxKufRbknHyGRU44I9wCdUe1cNwj66am3Fpzuph
         R5V77h28eEwZRYl4cFQ5Mde077EKAJThqy08eDOYkrNe5OcOpQFtUUgrku2cjpHwylYB
         MH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689357190; x=1691949190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MoIrpqhD6/K+FrE1B0+Ik368adv/RemnmQIjnF6AtgQ=;
        b=jrEcnIxT809IA9WITvKXdHMnbN0cuvlq1ETpu4jnjlXeIGQ1SAUCTZHAn0T1C8eLIi
         FvlFOMgUm4mhdbEeSIGyxxW//s2O3/sn91CYSTBF7rI3HONc22etK0IUASuDln7E6DKj
         tj2lJDy5IUOsGjKrqClb/ym6x60AskgnrO7AbXiTCQNyYqthRSUNqAdG+HrL21hq/xju
         oCQoCV4y+PyuETarN4MaBAwbzYyASUArbQq6LQRYr6cqG3ytu2tR23Q7K2CQcthpXhFb
         O8qgodHtP+bE6nldibMFc7GbRKZ713qxs/+euC/fEJHBh+0XEWPmmUHflGM/Pl9/CSqI
         kqLw==
X-Gm-Message-State: ABy/qLawQRmyZhRVO29WGlyIqQrGOiaZFXHP1T7moOaxNfPhulDeTlw7
	t2UvaDv+ZLC00ewcZiwe+spzkTA4N7iGyrFNVl0=
X-Google-Smtp-Source: APBJJlEJhiztGJMCjT9BHcHplpnrrqqUNAfhr/GZ4IOHJA1M1xapyfIBrqaYvd5Kzm/4bB72tVf+7uBkVwVvoFT0OjQ=
X-Received: by 2002:ac2:4ec9:0:b0:4f8:6600:4074 with SMTP id
 p9-20020ac24ec9000000b004f866004074mr3993109lfr.17.1689357189870; Fri, 14 Jul
 2023 10:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230714161823.20685-1-festevam@gmail.com>
In-Reply-To: <20230714161823.20685-1-festevam@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Jul 2023 19:53:03 +0200
Message-ID: <CANNYZj-8RV6tz_7kEH6uz=yZeyd=bPts6AoBqTd5DL3rGGu+yg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] u-boot: Switch to nobranch=1
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-core@lists.openembedded.org, marex@denx.de, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 17:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184279

It's not in master branch, but it is in a branch, so please do not use
nobranch, and just adjust the branch parameter together with the
version update:
https://source.denx.de/u-boot/u-boot/-/commit/83cdab8b2c6ea0fc0860f8444d083353b47f1d5c

Alex


On Fri, 14 Jul 2023 at 18:18, Fabio Estevam <festevam@gmail.com> wrote:
>
> From: Marek Vasut <marex@denx.de>
>
> U-Boot 2023.07.y tags are not in the master branch, switch to nobranch=1
> to be able to pull arbitrary commit from arbitrary branch.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  meta/recipes-bsp/u-boot/u-boot-common.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
> index 56f9be010793..29beac4c1127 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> @@ -14,7 +14,7 @@ PE = "1"
>  # repo during parse
>  SRCREV = "05aa6516c6bb419d01d69fac457c0de563bfd694"
>
> -SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
> +SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;nobranch=1"
>
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184273): https://lists.openembedded.org/g/openembedded-core/message/184273
> Mute This Topic: https://lists.openembedded.org/mt/100144566/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

