Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0E0C352A1
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.web09.2622.1649876712859682389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 12:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=y6mOVCC9;
 spf=pass (domain: linaro.org, ip: 209.85.221.170,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-vk1-f170.google.com with SMTP id o132so1284101vko.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 12:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RRPwG86oluDiPgotfMzBHwoxzdYUKbplKU45uM1I/uY=;
        b=y6mOVCC9aQ2zeyh2mbvecoPVmlV2zxT8tQWywK8EVRerPDQ7t8+sAvAHYM/5t5IUBx
         AthcTRkXYTfBdB3L4JoxYzb5Mw3iNw/f76vAH9P8l9l1cngTV/Mrd2frWjTXmUtEBE16
         /J9oQwRqAOV3qti24BiIEL0DfKkVeNiNfq3GXxg8EgQwxJFD0ziES6BM5yKw84kuf7jE
         FAFnsA4pinWfD178kKt0yzyT762VOCu654nDxs3KB8p7sFhiHKACQ6Rfpis/zPHnUYLf
         Lf7q5/13h2IgVMDQl2VoEGw8B8QejmeU3x6xpt3WB23HAdy5qheECvgN1ea+x18P1qCQ
         JthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RRPwG86oluDiPgotfMzBHwoxzdYUKbplKU45uM1I/uY=;
        b=OZZRdHXw+SD/itZun0ItvIrBOQdezpuoXlRbpW/zD1F1lTeRcznic9rACISNb/jfEV
         DfTNbw0wUrqX7s1UFZIPrAE43KeCVMYWfRGnBv2g62XaN4Eh8yzS7eEcMgMPT9KtvXAH
         fK6c82sUuGYeZJ8ViMlODx3akXSh5YpHSe0/fvm8yKoN7VuazgCMtjjeXyeqKlNrzQF1
         NmPoU4suvVV6F7x4WFN67dNHQ5B90/BU4jQ+Omw0Fc5gtKHzMBhilMGSxngqY8vVtXC/
         hH5H5sMGdHi1aiXLypDj51kgdvzlK+ZyZyPU4pQFSjjgxHmlGKwOYoe3+IuyouCiDnqE
         NhbA==
X-Gm-Message-State: AOAM533vZHWqc5RdN/syfoFuX3/+2vzbd+xXQP0S59H7L/UNxs1ao8rY
	8UFy7WrVJYyQtGakJpWEmd71O3vWTkcw9Hgr83Ed7Q==
X-Google-Smtp-Source: 
 ABdhPJxoxulmxJo8ewipvSGcIwvWVStSJ2H5M2DXe3TKzpLOcT02qke2ofJn6cis5V7y1S01begQ8jyJmJwsZo4eWVU=
X-Received: by 2002:a1f:50c4:0:b0:336:e84d:2873 with SMTP id
 e187-20020a1f50c4000000b00336e84d2873mr158883vkb.30.1649876711927; Wed, 13
 Apr 2022 12:05:11 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAOSpxdamJ5KMKxKMQqa1C-qAf4M_0-vq6hSifch0efzEScft8Q@mail.gmail.com>
 <CANp-EDa5OUxL_d301sXr5oV+q_UcmpU=bjd95v7ddyeCVS8w2g@mail.gmail.com>
 <CAOSpxdbuJOH8R9a9XWGcFNL6nvSaMB=au1sQ4AgiYr+b00Op6Q@mail.gmail.com>
 <CANp-EDZ-b6JYx8h1LRkg7YwCX9frZw=s_XiJ1_Ys-nBuyvhvxA@mail.gmail.com>
 <CAOSpxdZb2q7iZF+KCT2H3ajisK2pgQo_8cxbvxYQRgpnQqEKAg@mail.gmail.com>
 <CANp-EDZAM+4gQQ+2LJMRj00qwNGpMaPihtVOjZSk8HbbGzLUUA@mail.gmail.com>
 <CAOSpxdZ17NvKfsWxJkn0qwgNPCSz_WtRT9Ff=C6iiTxc1-bQRg@mail.gmail.com>
 <CANp-EDYtqNSKNMCmZ9tMvQDqv6r-29zSiz99sievky6GEm6q8Q@mail.gmail.com>
 <16E57E79FD292EFA.13992@lists.openembedded.org>
 <CAOSpxdYONLK8BhmNjx9uj9BDb0P=bAiJ-uAKG1edHjBnzvHc9g@mail.gmail.com>
 <Ylb9RoAyRpDHTaqe@mcrowe.com>
 <CANp-EDZbeheyJWo_xwqPa4A24PJJghfZOuqG7sJX2DC1UfAPEA@mail.gmail.com>
 <CAOSpxdYeNPZRo2LLZQ0-EZHoXmaSeXFHsONCTF+2MLwfZ_RO+g@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdYeNPZRo2LLZQ0-EZHoXmaSeXFHsONCTF+2MLwfZ_RO+g@mail.gmail.com>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Wed, 13 Apr 2022 15:05:00 -0400
Message-ID: 
 <CANp-EDbCsrFazNTjpYbvZx-eRKhQ8GJeZH0VkL8Hco8p2w9oug@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] zlib: backport the fix for
 CVE-2018-25032
To: Steve Sakoman <steve@sakoman.com>
Cc: Mike Crowe <mac@mcrowe.com>, Ross Burton <ross@burtonini.com>,
	"Mittal, Anuj" <anuj.mittal@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164359

On Wed, Apr 13, 2022 at 2:19 PM Steve Sakoman <steve@sakoman.com> wrote:

> Yes, and it appears they had a quite similar bug in the past!
>
> https://lists.debian.org/deity/2006/07/msg00074.html

Interesting find... though it seems that is in a different sha256
implementation than the one being used here ("Gifford").

The other factor is that it behaves on ubuntu, but not fedora. Do the
native packages get built with the host gcc (11.2 on fedora 35,
whereas 9.3 on ubuntu 20.x)? Or does yocto also build a native
toolchain to build host packages with?

Ralph

