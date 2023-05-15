Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CDFC77B7D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 08:36:31 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.83467.1684139783098519250
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 01:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YvBzd3SE;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f27977aed6so3718529e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 01:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684139781; x=1686731781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w2UAC6MHOIxDi7JvCXM3b47CDdvGwJaA22wafWutjfM=;
        b=YvBzd3SEVcSFCMLDj1qqrKFAgfAH+nn/P0TS09J0+F+YZgc5QRIoGniznx2nlmUVo+
         SU3cizWFixNDx+ohSuuPOWEj/i+1oIo7Qn0uctzvuqkCxAqrCMnxtsWaTUtgMe1VyBoa
         duDQp8p1jYl3q/j0cwCIn6z4E+Vc+6V27AZBDg6R/ZHu/tg9OxqDxx5x9S7RTqECOYsA
         tOz/pZbBy21ox4jJPaXoKM1k/cklQkma9PYgLOvZtOpuA4m7AaLMHPqyknS+bL09zT+O
         kp+1MEtbJC+W2njdhl/59N81w13HIrSD/8MYloxYSfARpApJzlk2AtYtU9NdRVHVy1G/
         rGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684139781; x=1686731781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2UAC6MHOIxDi7JvCXM3b47CDdvGwJaA22wafWutjfM=;
        b=ImXeTVl0QJK/QrzuND60XqAm015lAyq92UvIp++5Jv68ms6ql08AoIYURE8mhdMJkx
         kdMLONOHhgfYrFTIKl4Uxkuvc7S1P1+KXjAdMIsK0Ldllhce+8WJOung6tyjQy86K5b5
         AU17+SoPUYzFNIA96WBwdB0HmbOtTuoi9bUJYW+DxujIijxbDxOtrajVU0pHs9r8SC/M
         SrGtRzrLVtsTi6k6UinbaKJ1i0eYvBzrkRlvZKGNG4MxKmNrq5CCr7zzQrYziXezsslW
         9DwOO8NjOO3NZtaggqJf5xd/e9w/5vlZ+fZRTdcv5Q1OpAXTQNVaCH3iOhkofx3N6R9s
         48WA==
X-Gm-Message-State: AC+VfDwmKoEbIIOFb31EyziBkCNIwW+xddg+7oiZSTpZXcK0CnRzKeCl
	l/VrpC79t9fNnYtPmeyW/coBS/IidPRr5bC0+io=
X-Google-Smtp-Source: ACHHUZ7GyYdP1l7Jp6m5141ABmAF+ayqr0/6HjLA0rWVuls5Xe6WTdCfReQEWEsea3y63qBe6I9+D98lzTHhf/tHp0k=
X-Received: by 2002:ac2:4573:0:b0:4ec:8615:303e with SMTP id
 k19-20020ac24573000000b004ec8615303emr6178404lfm.33.1684139781067; Mon, 15
 May 2023 01:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230512141135.308692-1-eero.aaltonen@vaisala.com>
In-Reply-To: <20230512141135.308692-1-eero.aaltonen@vaisala.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 May 2023 10:36:09 +0200
Message-ID: <CANNYZj_Qy6ZBiu0v4uJ7=8XDKR-4FUjg0pVRkWCsDB5eR-f7qw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] avahi: fix D-Bus introspection
To: eero.aaltonen@vaisala.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 08:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181233

On Fri, 12 May 2023 at 16:11, Eero Aaltonen via lists.openembedded.org
<eero.aaltonen=vaisala.com@lists.openembedded.org> wrote:
> --- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
> +++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
> @@ -83,10 +83,13 @@ RRECOMMENDS:${PN}:append:libc-glibc = " libnss-mdns"
>  do_install() {
>         autotools_do_install
>         rm -rf ${D}/run
> -       rm -rf ${D}${datadir}/dbus-1/interfaces
> -       test -d ${D}${datadir}/dbus-1 && rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
>         rm -rf ${D}${libdir}/avahi
>
> +       if ${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'false', 'true', d)}; then
> +               rm -rf ${D}${datadir}/dbus-1/interfaces
> +               test -d ${D}${datadir}/dbus-1 && rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
> +       fi
> +
>         # Move example service files out of /etc/avahi/services so we don't
>         # advertise ssh & sftp-ssh by default
>         install -d ${D}${docdir}/avahi
> @@ -135,7 +138,7 @@ FILES:avahi-daemon = "${sbindir}/avahi-daemon \
>                        ${sysconfdir}/avahi/services \
>                        ${sysconfdir}/dbus-1 \
>                        ${sysconfdir}/init.d/avahi-daemon \
> -                      ${datadir}/avahi/introspection/*.introspect \
> +                      ${@bb.utils.contains('PACKAGECONFIG', 'dbus', '${datadir}/dbus-1/interfaces', '', d)} \
>                        ${datadir}/avahi/avahi-service.dtd \
>                        ${datadir}/avahi/service-types \
>                        ${datadir}/dbus-1/system-services"

Why are these conditional? That packageconfig is defined as
PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
so upstream should simply handle installing (or not) the needed files by itself?

Alex

