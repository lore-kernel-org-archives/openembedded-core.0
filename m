Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE0CCCFA13
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 22:57:14 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14903.1777762625951992252
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 15:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RxG9j5cg;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-40423dbe98bso1266282fac.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 15:57:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777762625; cv=none;
        d=google.com; s=arc-20240605;
        b=LmCUcWrUAZ0gD9HmauY2yivlsvU5AKd2nq2iOJx9yGzqaJRmoOr8DsRCD+54+KAnM4
         T3Mf/n3T8KI5zoB4YzStUY7TcezFKR0LOv77y6hpQZ6I2arjX8msnHpOicApy9x2VRP7
         tFe49CaB5lKz+iI1vwet/H+kn65KT9q9xQs+vtcxb/4p6yXFtQbmAAi2Kf9ogUnPmXBh
         rUararlhcZ2xLr6VzoxnYaChoHwZet30a0gnrGNMTCSIuMthOAssWvu/XXlaT0lM9ICj
         fXiqnyHbUj+BMzqbRaflF+j8YrrEWOakbrE8Z7IMIYdN1qFrZ9FVRsPcIgDO7ueCC5Ey
         KtiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T4Mb/ThuNl/uKsNEUklQVV3PNHEEET+4MBwiqO4RY8A=;
        fh=cbgl5IOPsNxVRhYTH4PVIGJOnA+jpdWoNWXXxuAa4Z0=;
        b=UJ36xDDIdN1Z8L+NthMG8lXh8XECSG5STtfgEgG292OGhnoBi9P24QP2fJsFpOrR48
         rJflGbAYMPx1lir3odLGT48Ef+9+QJbeRa5iqaI7d841pPpAZlvjRXIJOyI0TdIs1ZQd
         HYOdw3+tWwmkXWv2uR7LMeQZ87S3xIlz7N0hb6mFRkJRdcSLuAjsuJxDtothjSHFjtiG
         Wgn9mReL0POQwdLqIf7H1JwoIGUtc4Rbw/MgBzCf8pkkwpiOO44eToWadt2VSgtMffa0
         QdvcJCudQ+4TvZY9jkx1X8cSCjfwSDLqly7IUjTXiQz1q7KvOHUHcVjmKq/zwlQsPhYH
         sEsg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777762625; x=1778367425; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4Mb/ThuNl/uKsNEUklQVV3PNHEEET+4MBwiqO4RY8A=;
        b=RxG9j5cgDeY+8eVWYBQvnnmqut47iGg2jlq700hNcNVVh7SjRj7Dzoyp8XgJbA+OcP
         nN5CTJ1CDPOCjjr5gNIACwxNWrXYffUl8zXvhRh6HdSJQk+qwq3rJG8UwA6Sg+NQ+My7
         ebdtHehcl6LmJHND5ItCiwccUhnP7upt+eDkatiW6vLqY279ZCUSEwxpjUTMibkMd1r3
         V1WC8Yd67IkNtqEdFDooSG+moo8jARTa6OZKHR5ZZe56WvvE14Im68uX1nt5/B38HiX1
         4iCiWgXVjdJTN6mk7buS2XVji0254JCYcv0FptHFl+u89AXid1rPRlTadSGJ78L8Tyte
         oG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777762625; x=1778367425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T4Mb/ThuNl/uKsNEUklQVV3PNHEEET+4MBwiqO4RY8A=;
        b=crC0IXAnXDO9B1biU3K/vXAEHOe7aJOvs07+keHAcpqg9LZascZm7/LPCiS5YXHmAV
         9NZ2+6cwjO2AImEioP5v4/fs34RahbfNbTDXPMCHcd8EGd6WXDinj+nu7rZEQu1ZJ4vF
         y1uof+dBRg8k6sCYJHIun/iVSl98rtLU4UCapCJrg5ahk/vQLGWgU2IIlMzn0jLapJ3C
         A2gn9I+WQ5ESkB5fZj0tNtfJFZBvmtgkrjA6TttvZTz68FkTyvE0hSC3K0bCIl1QDDy4
         69mK8EwFSUygzwpzgeG7ISb8n3c4LZMbsip1HbdJg4tiaJeAlN8R5E/gl794ZZK3O2Z8
         wxuQ==
X-Gm-Message-State: AOJu0Yxh8AC7pDjKUOO6ECHezB3kkY2a223M+xrCi5HoE6AtNqZSkINX
	D//bKAAjrGMrbK3MbL1IcplFeeRlrP0QeNOe/JNIPQQD2tle70tmnXK2jrlQIsojmtPukDDiPzM
	3rtJ5z/OYSvuPKK8Mx21q0loouTIeT3k=
X-Gm-Gg: AeBDiet/pLfCiM7yW0y/a+4JwYHIk4NMxy1+W1BkPxvZk7FwrxOMQTDVGOuP510+/fi
	rO0dx3+mATV7Ddpq3mYrNnlxUPC4Kl3bboSGCTLueQGF/wsvcAJ8f89DkaahW6nhZq11UCW4zBf
	XOTt0XlWkMzkhhGQcWtnHNMzciS0nNhBP0KgTlojjOkN6iLOmeCzON8QLCijWMUR6BGx1udbPIm
	UbTSqZJvuoH63TvcW15toOM2oL9jkpanVYpZUL4fwBnDsyP/+8I2yIUI0GE35bTjCMd+gqKMi4Q
	W/axdLYSh+gBgYku+DgMtCHF8MO4hgo=
X-Received: by 2002:a05:6808:190b:b0:479:e9d2:26d3 with SMTP id
 5614622812f47-47c8923177dmr1952325b6e.26.1777762625112; Sat, 02 May 2026
 15:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org> <20260502162929.1377831-61-richard.purdie@linuxfoundation.org>
In-Reply-To: <20260502162929.1377831-61-richard.purdie@linuxfoundation.org>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 3 May 2026 10:56:53 +1200
X-Gm-Features: AVHnY4LK7bGy6uE2XQCQj5Nmi0eBumE-pLAjNQEUN0382Qh4r9AcLizx746njZ4
Message-ID: <CADySD0FagR_SEZBMvJSHTNJR9DxB08XkhVkJ0+RMAvYmODwShg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 61/62] wireless-regdb: upgrade 2026.02.04 -> 2026.03.18
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 22:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236428

On Sun, May 3, 2026 at 4:31=E2=80=AFAM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  ...ireless-regdb_2026.02.04.bb =3D> wireless-regdb_2026.03.18.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.02.04.bb =
=3D> wireless-regdb_2026.03.18.bb} (94%)
>
> diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04=
.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
> similarity index 94%
> rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.=
bb
> rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
> index 2f7c8160434..a70e9dd0dae 100644
> --- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
> +++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
> @@ -5,7 +5,7 @@ LICENSE =3D "ISC"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D07c4f6dea3845b02a18dc00c8c876=
99c"
>
>  SRC_URI =3D "https://www.kernel.org/pub/software/network/${BPN}/${BP}.ta=
r.xz"
> -SRC_URI[sha256sum] =3D "0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f03924=
3ad121cf5aabf6c6"
> +SRC_URI[sha256sum] =3D "5fc0000475d8c5368ccc5222827c16aef98b1eb6a69c9b5a=
3e7b7e98528945ac"

We already have this submitted via
https://lists.openembedded.org/g/openembedded-core/message/236182

>
>  inherit bin_package allarch
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236370): https://lists.openembedded.org/g/openembedde=
d-core/message/236370
> Mute This Topic: https://lists.openembedded.org/mt/119117280/3619737
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
kur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

