Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F25C71159
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 07:12:12 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.8956.1750317131776539155
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 00:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZZIY7KNe;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6fb0a05b56cso9431436d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 00:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750317131; x=1750921931; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8XaQpeCwmrBffBwtfTvEnWfPuBV42f1pVHgsjra2RYU=;
        b=ZZIY7KNe1SKwz5qwooaH/NcsKUwB/hqxBBvGOCQpGCDH1TrMYg4dPNe3HNHksGVGog
         X/tOkAba3h+HZPFs+r8uM15wmeXpLrxLY52cApcghQI+o8JEk/bKbJ1Hf6RN5thOxH+s
         eO6D/f3y/vgDOs55Gqeo9uCK+JEvl9o8VJg2tPQb1AGr2SETwRe4PFmnkQ2yhm49m22G
         7DxMuOhLJMxRgV7wRkog+3slzODP0n4sVkYjbme6YJw0rcZQcEQkf3MaMgOcy/hbpEd2
         6JQGaR+xzDVMrf87NPPsUYXdMja01/WAE7MndYiD0YrXjZxMFTvMjoQtQQ1w4SDFwNny
         cqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750317131; x=1750921931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XaQpeCwmrBffBwtfTvEnWfPuBV42f1pVHgsjra2RYU=;
        b=ReqXPEunCorLFJQD41V6uVojhWjTqpp494ErGJ3MP74PILlnzj9BxnH25miOdPWeY3
         XfM8R8rjBV3PgHWpBwKV84cWl1wd3yf/O1Pp6PQyAQ5pgpmlVqYduvUIfrtcnyT7qR6A
         r0f5+jNzbuECCVnPCSDA6vAoPcwpeaau8BqFm2xDmXhOXUadzBGzVmo75YZOTu7RZa/q
         uHvFpoVm4qVDWyQ1/PXvlZ66/KYMPj/3KSUw+kYbFjgbbL7nmjYoII2ZNrNOfnqKf33I
         Q/0K+KVfQRB2nkSjPzIgz8PlGFlr22Iuf3FDOiXYam+qNZn28HeuAxtbLR2/9dB8uqrq
         ww8g==
X-Gm-Message-State: AOJu0Yx3tyvj+PnPdk6CBHcEMWAZU+HSh69mbxu880S2P+FjQ3R1qX7j
	p6lDrwiBBOVIsyyc4GbLTP46I1Qlpj7JDQXuNsfeFvVNkiJNo1bNzUlEPRrMG/CHx9IiigmFxyr
	3y+FZuiNoEMBan49puLBBUP4m3yDhl7s=
X-Gm-Gg: ASbGncvafS2eBp//KGIHuIeB7syICHmpmvpI1sSQGyp59kn3CXS8LyG3hDkOqsuZq0H
	1iTTHVi6gZp0jh1DwMBhZEhoiNz+Op0wXEJ0TYbuxtmjOSTrqZx6oTpbXgN2fmyW+5mSN1rOuxo
	M5NB0dCqTw8hQEL30e1CzEzp+989bFhNFDNcs0W8APoUd3i0u5QHTaTi7NTaewxyKtWKbrljm67
	YL0tQ==
X-Google-Smtp-Source: AGHT+IFUrZcBU3snjjZfVklj6/+wfpZYDEk2CQcpvlPAg+l4ZAva1kOTajTMuUE2OijXdJJ37kRnNmGy6pAVkS5baP8=
X-Received: by 2002:a05:6214:800b:b0:6fb:60d6:fef0 with SMTP id
 6a1803df08f44-6fb60d701d2mr95732646d6.19.1750317130754; Thu, 19 Jun 2025
 00:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250618141611.257918-1-michaelestner@web.de> <20250618141611.257918-2-michaelestner@web.de>
In-Reply-To: <20250618141611.257918-2-michaelestner@web.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Jun 2025 09:11:59 +0200
X-Gm-Features: Ac12FXyNNvUcU-g33eqezb46FLWIp4DzElaRf4zFXNKkgEHNT0iRKhuBAOc1w1s
Message-ID: <CANNYZj_W937cK=wNVtvqGUacVdV+kn3R79K-+Agp8MbgYNPaqA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] [Openembedded-devel][meta]: add nilfs-utils_v2.2.11
To: michaelestner@web.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 07:12:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219051

This should go to one of the meta-openembedded layers, perhaps
meta-filesystems is best.

Alex

On Wed, 18 Jun 2025 at 18:55, Michael Estner via
lists.openembedded.org <michaelestner=web.de@lists.openembedded.org>
wrote:
>
> * Add nilfs-utils to provide tools to work with the NILFS2 filesystem
>
> * Tested with branch master and kirkstone
>
> Signed-off-by: Michael Estner <michaelestner@web.de>
> ---
>  .../nilfs-utils/nilfs-utils_v2.2.11.bb             | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta/recipes-devtools/nilfs-utils/nilfs-utils_v2.2.11.bb
>
> diff --git a/meta/recipes-devtools/nilfs-utils/nilfs-utils_v2.2.11.bb b/meta/recipes-devtools/nilfs-utils/nilfs-utils_v2.2.11.bb
> new file mode 100644
> index 0000000000..6893edab29
> --- /dev/null
> +++ b/meta/recipes-devtools/nilfs-utils/nilfs-utils_v2.2.11.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "nilfs-utils is a set of utilities for managing the NILFS filesystem."
> +HOMEPAGE = "https://nilfs.sourceforge.io/"
> +
> +LICENSE = "GPL-2.0-only & LGPL-2.1-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=385034ac639a62b8415db9814582ee98"
> +SRC_URI = "git://github.com/nilfs-dev/nilfs-utils.git;protocol=https;branch=v2.2.y;tag=${PV}"
> +
> +SRCREV = "507064bb3604d0fd88f5e3f6422d9ade73a26120"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "util-linux util-linux-libuuid"
> +
> +inherit autotools
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219026): https://lists.openembedded.org/g/openembedded-core/message/219026
> Mute This Topic: https://lists.openembedded.org/mt/113711623/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

