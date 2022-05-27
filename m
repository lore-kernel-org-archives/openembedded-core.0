Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062B4C433EF
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 19:13:01 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web08.7645.1653678770589686693
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 12:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ogICQAod;
 spf=pass (domain: gmail.com, ip: 209.85.208.180,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id e4so5857107ljb.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 12:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cIr2YXjZIFay4Tf2GbLqckPiMXipyn3iMwIo2xGw7XE=;
        b=ogICQAodkX3QO/2MC0NqQoFnFKKY6+APDb2uR4IBdYfrrk3FwHBBXCBHJEu1Gycjz8
         q59ZPkq3JgFbvW5wRVB/AUVTkIJPZL8ituWGQ+TkT9q4eX+E/+y7gqYn+uaGYfm+KLUt
         2Hj9MXaPv02ywckeKoTAGkV2CwiUQxHeNBIFqvErirWWkYjgOti/wyqlU8MiMZd/nvF0
         L0JBmzYujTAFl8RtsDI5bmuF2GWhBvBMRjgH3CNK2MGoOH5ShkpNLw0omn9ZlNdh16Ru
         Nc4KGSuH1SM6nlKpkGYPJgMW1fIKXol5v3iR5SgGqpBbUkVWyrbnBe5tHVJN7ht90Ayw
         u6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cIr2YXjZIFay4Tf2GbLqckPiMXipyn3iMwIo2xGw7XE=;
        b=V3Uf6+0p9JEt6a9iyeg0fbs0dvPt6tuoguLgJmcKgucVkYdK4m8wR5+EVP3PUe8eYM
         PqO+r27CuVF4hHKMuh1o7Qlfcq6QeHoU8V7S+hYJjsrct7mFLoMPlO9BBrQ9iKfKSliC
         PwVSQ85cgp5TWVDgSFpeMzvVaDDuI8vw2MB4kwEUcZmkqEoPZ8xb4SHxCo8xZ3o4u4GM
         shqfOlcYw/bvdJa/38q4vaRF6cuuReg6m8HzGJfDR5GBGjLKLZQXIxOC/oj85/OrN21B
         537dEzNcvJ1lXIUJYKwtp5DPJjmM/FjI5x8woonhtyw7E1nhnM5HdZBwRhsCTa3Mti5M
         ObyA==
X-Gm-Message-State: AOAM530vuNg/vEmnoDNBpfIx3HLzvXShh1p2aMYqw8jriRl51febWmAK
	Z8zRt3EMo6P4ywZ47qzMpog0aBK1E51O+3va3cW4V2rUK0gmdw==
X-Google-Smtp-Source: 
 ABdhPJyCKaA7+6aMwLgl4i6E1Eii2onvtnB/uP8TDBTQJ5TJf5eHoeCq9o4hk6iiFqMhhXj5AeSStVWcWUj2qQ68Z6o=
X-Received: by 2002:a2e:9410:0:b0:253:c996:59fd with SMTP id
 i16-20020a2e9410000000b00253c99659fdmr25659851ljh.41.1653678768850; Fri, 27
 May 2022 12:12:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1653635182.git.liezhi.yang@windriver.com>
 <c05b2737acb3c1b1d91085eb38c183214f478c62.1653635182.git.liezhi.yang@windriver.com>
In-Reply-To: 
 <c05b2737acb3c1b1d91085eb38c183214f478c62.1653635182.git.liezhi.yang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 27 May 2022 21:12:37 +0200
Message-ID: 
 <CANNYZj80M4gomd8Hh2nad1QGT8tX3pGb9sBVPP2Ds8GNPZzokg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] systemd: Set RebootWatchdogSec to 60s as
 watchdog
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 May 2022 19:13:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166218

Where is the default of 10 minutes set? Should it be fixed there?
Patching things with sed after the fact is not necessarily a good
idea.

Alex

On Fri, 27 May 2022 at 09:07, Robert Yang <liezhi.yang@windriver.com> wrote:
>
> The systemd-shutdown sets watchdog timeout to 10m (600 seconds) which is too
> large, and caused errors when reboot on boars such as rpi4:
>
> systemd-shutdown[1]: Failed to set timeout to 10min: Invalid argument
>
> The watchog's default value is 60s, so set RebootWatchdogSec to 60s to fix the
> errors. And <machin.conf> can set WATCHDOG_TIMEOUT when needed, for example,
> the max timeout of rpi4 is 15 seconds.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd_250.5.bb        | 8 ++++++++
>  meta/recipes-extended/watchdog/watchdog-config.bb | 7 +++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
> index 006b2f86eab..6fac27ee56d 100644
> --- a/meta/recipes-core/systemd/systemd_250.5.bb
> +++ b/meta/recipes-core/systemd/systemd_250.5.bb
> @@ -238,6 +238,9 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
>                    -Dnologin-path=${base_sbindir}/nologin \
>                    -Dumount-path=${base_bindir}/umount"
>
> +# The 60 seconds is watchdog's default vaule.
> +WATCHDOG_TIMEOUT ??= "60"
> +
>  do_install() {
>         meson_do_install
>         install -d ${D}/${base_sbindir}
> @@ -337,6 +340,11 @@ do_install() {
>
>         # add a profile fragment to disable systemd pager with busybox less
>         install -Dm 0644 ${WORKDIR}/systemd-pager.sh ${D}${sysconfdir}/profile.d/systemd-pager.sh
> +
> +    if [ -n "${WATCHDOG_TIMEOUT}" ]; then
> +        sed -i -e 's/#RebootWatchdogSec=10min/RebootWatchdogSec=${WATCHDOG_TIMEOUT}/' \
> +            ${D}/${sysconfdir}/systemd/system.conf
> +    fi
>  }
>
>  python populate_packages:prepend (){
> diff --git a/meta/recipes-extended/watchdog/watchdog-config.bb b/meta/recipes-extended/watchdog/watchdog-config.bb
> index a28d28033bc..f1389521284 100644
> --- a/meta/recipes-extended/watchdog/watchdog-config.bb
> +++ b/meta/recipes-extended/watchdog/watchdog-config.bb
> @@ -13,8 +13,15 @@ SRC_URI = " \
>      file://watchdog.conf \
>  "
>
> +# The default value is 60 seconds when null.
> +WATCHDOG_TIMEOUT ??= ""
> +
>  do_install() {
>      install -Dm 0644 ${WORKDIR}/watchdog.default ${D}${sysconfdir}/default/watchdog
>      install -Dm 0644 ${WORKDIR}/watchdog.conf ${D}${sysconfdir}/watchdog.conf
> +
> +    if [ -n "${WATCHDOG_TIMEOUT}" ]; then
> +        echo "watchdog-timeout = ${WATCHDOG_TIMEOUT}" >> ${D}/etc/watchdog.conf
> +    fi
>  }
>
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166202): https://lists.openembedded.org/g/openembedded-core/message/166202
> Mute This Topic: https://lists.openembedded.org/mt/91371988/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

