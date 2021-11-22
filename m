Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADB2C433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 12:00:15 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.5456.1637582414093074581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 04:00:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=zUp+1VxD;
 spf=pass (domain: burtonini.com, ip: 209.85.221.44,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f44.google.com with SMTP id w29so32175476wra.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 04:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IiieU86HaU4xU58gNsLkLRWwuuByUlRbO3HgYcANeY8=;
        b=zUp+1VxDI2sL6ZMqSac0+BC8xxVt8cTWAtb2niGxJVs/KpeIFqx6r7+m2nMIgaKlwL
         AMrRn7cWOK5f2PYQedTT/ib4pR0xvvHxkIDlF8cb1cR90OL+aq18wDJ10lCFeuRAY0Bx
         m4lXaBROemz4J7pHIAFLlLkj3zuVIplZrnO/Iy5w8r7Ii3J0Ym/iVG4O+cW+MnvoRGYu
         P1yG7GOjCXQfq+FE+P186NABQRKMc3koHxjoPHY+Y7aAA0uArCrQDW8jf4UIeqA9RqiK
         473hmOZ6oZL9aG4qsggRjmmatEBEusvb6ZJqpZpDTAj7ioZv+2gdVX9hv3QKWKTeUhq5
         ai9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IiieU86HaU4xU58gNsLkLRWwuuByUlRbO3HgYcANeY8=;
        b=pAQWghZHsvDl/IMxu23d8DU8XKc2erKVwdqnTrkAkY8rUV7C63yD/J3bh7ZdNkYDFf
         5LRsvm1Kcj+ljxnxOv1J3rONeykq3hElEHFRGsARdZqXefJkAKWOvTsZoN3Ey/gEpa6s
         0+cCP0kb47b9WScRHWwCg5Sg/ay8hLDPsBSOqixPGteKipFbYp0F4TqumivjEmghCG6p
         5t0tnf4RuyFtJbIIzdkUT4ErCwGRpkbStBX8eBDoazwqn+woKFH+TXUuC/hS9f2PF7Kk
         VrU78f5QKNr5MORiQ3NktI0PL82CdKWOGNi2i3ydrWRwNmEsPr8IVIPU3NRZtPL45gcI
         on+g==
X-Gm-Message-State: AOAM533rJ+ypiNPhS7mSZV8+w+ALJ4KUabO++JBnKvFBSxVbiudlABoa
	6ZbdFNcus6oN2sDt4K1RDzKqHhEYhhqD1j8O08snaw==
X-Google-Smtp-Source: 
 ABdhPJxej9jUc6+F3mlCfAd+bTDWxSJTY4QvDD/ELxDDLYJ/Vkj/RfZ3CLJZ6g6bolyPQoLv7TpBke/mQET5F5ZHCXQ=
X-Received: by 2002:adf:e484:: with SMTP id i4mr36740242wrm.49.1637582412128;
 Mon, 22 Nov 2021 04:00:12 -0800 (PST)
MIME-Version: 1.0
References: <20211122115418.1352-1-pavel@zhukoff.net>
In-Reply-To: <20211122115418.1352-1-pavel@zhukoff.net>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 22 Nov 2021 12:00:01 +0000
Message-ID: 
 <CAAnfSTuLQ3PLQqnyBMWUT26uYOgwxeSc9n+KEqa7Y+fws_e3YA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v2] gmp: Add security fix for
 CVE-2021-43618
To: Pavel Zhukov <pavel@zhukoff.net>
Cc: openembedded-core@lists.openembedded.org,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 12:00:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158566

Hi Pavel,

Close but you also need Upstream-Status, Signed-off-by, and CVE tags
in the patch.  You can see my version of this fix on the list, a few
minutes before yours. :)

Ross

On Mon, 22 Nov 2021 at 11:54, Pavel Zhukov <pavel@zhukoff.net> wrote:
>
> From: Pavel Zhukov <pavel.zhukov@huawei.com>
>
> Fix mpz/inp_raw.c integer overflow and resultant buffer overflow via crafted input,
> leading to a segmentation fault on 32-bit platforms.
>
> References: https://gmplib.org/repo/gmp-6.2/rev/561a9c25298e
> References: https://gmplib.org/list-archives/gmp-bugs/2021-September/005077.html
> References: https://bugs.debian.org/994405
>
> Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
> ---
>  .../gmp/gmp/CVE-2021-43618.patch              | 25 +++++++++++++++++++
>  meta/recipes-support/gmp/gmp_6.2.1.bb         |  1 +
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta/recipes-support/gmp/gmp/CVE-2021-43618.patch
>
> diff --git a/meta/recipes-support/gmp/gmp/CVE-2021-43618.patch b/meta/recipes-support/gmp/gmp/CVE-2021-43618.patch
> new file mode 100644
> index 0000000000..f741972439
> --- /dev/null
> +++ b/meta/recipes-support/gmp/gmp/CVE-2021-43618.patch
> @@ -0,0 +1,25 @@
> +
> +# HG changeset patch
> +# User Marco Bodrato <bodrato@mail.dm.unipi.it>
> +# Date 1634836009 -7200
> +# Node ID 561a9c25298e17bb01896801ff353546c6923dbd
> +# Parent  e1fd9db13b475209a864577237ea4b9105b3e96e
> +mpz/inp_raw.c: Avoid bit size overflows
> +
> +diff -r e1fd9db13b47 -r 561a9c25298e mpz/inp_raw.c
> +--- a/mpz/inp_raw.c    Tue Dec 22 23:49:51 2020 +0100
> ++++ b/mpz/inp_raw.c    Thu Oct 21 19:06:49 2021 +0200
> +@@ -88,8 +88,11 @@
> +
> +   abs_csize = ABS (csize);
> +
> ++  if (UNLIKELY (abs_csize > ~(mp_bitcnt_t) 0 / 8))
> ++    return 0; /* Bit size overflows */
> ++
> +   /* round up to a multiple of limbs */
> +-  abs_xsize = BITS_TO_LIMBS (abs_csize*8);
> ++  abs_xsize = BITS_TO_LIMBS ((mp_bitcnt_t) abs_csize * 8);
> +
> +   if (abs_xsize != 0)
> +     {
> +
> diff --git a/meta/recipes-support/gmp/gmp_6.2.1.bb b/meta/recipes-support/gmp/gmp_6.2.1.bb
> index d5996abd00..7c12a97228 100644
> --- a/meta/recipes-support/gmp/gmp_6.2.1.bb
> +++ b/meta/recipes-support/gmp/gmp_6.2.1.bb
> @@ -12,6 +12,7 @@ SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2 \
>             file://use-includedir.patch \
>             file://0001-Append-the-user-provided-flags-to-the-auto-detected-.patch \
>             file://0001-confiure.ac-Believe-the-cflags-from-environment.patch \
> +           file://CVE-2021-43618.patch \
>             "
>  SRC_URI[md5sum] = "28971fc21cf028042d4897f02fd355ea"
>  SRC_URI[sha256sum] = "eae9326beb4158c386e39a356818031bd28f3124cf915f8c5b1dc4c7a36b4d7c"
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158563): https://lists.openembedded.org/g/openembedded-core/message/158563
> Mute This Topic: https://lists.openembedded.org/mt/87233112/1676615
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

