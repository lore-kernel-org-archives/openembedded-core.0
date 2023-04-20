Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC73C6FD18
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 01:39:03 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.56316.1681954742815885869
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Apr 2023 18:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=XYsATQGz;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-546ee6030e5so191171eaf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 18:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681954742; x=1684546742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5oRrUKTqFEcfe9/yjISwBD2pMU8aHn36WbaZtfbpeg=;
        b=XYsATQGz04k0QeC2KUNEkEsOE78CCqPoLxCdGBBW4bjZeLqqK2wQ/t4DW9n7v3mzqs
         VXpXwNVk1mMO80oj4SP9G1oaHai6LEYFSsecHVuOpykW7RDox0ogjLsiEc7Vx0mywmxQ
         pzRac7C8BFFfzPAUprzHrLVhA/uf/QC1NxGue9GRs2mBVTu/DfIko0i/11kV3S5gqiB/
         k0pXaaEOdKCIdRXTBG3NPNIZrMwIOPP9pI3B4dutVen6K0zfBKg6ALO0FnAcoYO1EAJo
         Z7Cs/POhHfM4ppAdZ5o0PEvtUhjnyfisTdDD3bWQEHdfivJGzpkZl3S5/os4aH5qAuxD
         XLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681954742; x=1684546742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5oRrUKTqFEcfe9/yjISwBD2pMU8aHn36WbaZtfbpeg=;
        b=jBurBmgGg9ap5jeNlNBHS3NzWVzyaavcYtb5qKI2WEpU7jE7jXnM8Z79HCEI28RQe1
         OKumKGxqhjWAd5zDMi6xNZtGEpecanDDCC60sxprynHynNMAxGFYQA5HEkTTSSz8KuPE
         2gZGqQvrEnHlIqiVsDllio9hff4cPd0txkc7tnMxYdlxnjOMZ0FaD9STurWb3luA9f+4
         VDQg1Sl73orjcjDcbfGuwpcfsYAh4oyeED/ldHXDlZ0TzL2NtjK+HI2awD6slfENjUX+
         TWFD/SnIfm1HmX6m2xGF75kKa9sC1RCRoYcFRxoMLEFokkSKWIYCxqO/jB0+FMwtZOAx
         M5uw==
X-Gm-Message-State: AAQBX9eT4usSiI/tz/Lme1nZ9sWEnw4erPMDkMMyAaD2AwmQDg3qsI45
	GxV9movCfGjfPxce04kr9CC7wsGnlI+/KZFNsnwzwnnL44E=
X-Google-Smtp-Source: AKy350YKpHeRuosdPQsRm5U54ohsJulWvEXuB74lvyWsNidkJhfBtWootcncOyJ+iYlDTkKAY6mvkO5e13R6hxWlbvQ=
X-Received: by 2002:a05:6870:42d2:b0:184:6af3:2184 with SMTP id
 z18-20020a05687042d200b001846af32184mr8388oah.8.1681954741801; Wed, 19 Apr
 2023 18:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230419134143.1530528-1-ross.burton@arm.com> <20230419134143.1530528-2-ross.burton@arm.com>
In-Reply-To: <20230419134143.1530528-2-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Apr 2023 18:38:35 -0700
Message-ID: <CAMKF1sp0o0UtmUGS_m5DHBN7vUTCNH6s_Lo0O8BVyjAwK6AX1Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] xserver-xorg: backport fix for CVE-2023-1393
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 01:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180232

Fails to patch - https://errors.yoctoproject.org/Errors/Details/700408/

On Wed, Apr 19, 2023 at 6:41=E2=80=AFAM Ross Burton <ross.burton@arm.com> w=
rote:
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...posite-Fix-use-after-free-of-the-COW.patch | 46 +++++++++++++++++++
>  .../xorg-xserver/xserver-xorg_21.1.7.bb       |  3 +-
>  2 files changed, 48 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-=
composite-Fix-use-after-free-of-the-COW.patch
>
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-composi=
te-Fix-use-after-free-of-the-COW.patch b/meta/recipes-graphics/xorg-xserver=
/xserver-xorg/0001-composite-Fix-use-after-free-of-the-COW.patch
> new file mode 100644
> index 00000000000..fc426daba51
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-composite-Fix-=
use-after-free-of-the-COW.patch
> @@ -0,0 +1,46 @@
> +From 26ef545b3502f61ca722a7a3373507e88ef64110 Mon Sep 17 00:00:00 2001
> +From: Olivier Fourdan <ofourdan@redhat.com>
> +Date: Mon, 13 Mar 2023 11:08:47 +0100
> +Subject: [PATCH] composite: Fix use-after-free of the COW
> +
> +ZDI-CAN-19866/CVE-2023-1393
> +
> +If a client explicitly destroys the compositor overlay window (aka COW),
> +we would leave a dangling pointer to that window in the CompScreen
> +structure, which will trigger a use-after-free later.
> +
> +Make sure to clear the CompScreen pointer to the COW when the latter get=
s
> +destroyed explicitly by the client.
> +
> +This vulnerability was discovered by:
> +Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
> +
> +Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
> +Reviewed-by: Adam Jackson <ajax@redhat.com>
> +
> +CVE: CVE-2023-1393
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +---
> + composite/compwindow.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/composite/compwindow.c b/composite/compwindow.c
> +index 4e2494b86..b30da589e 100644
> +--- a/composite/compwindow.c
> ++++ b/composite/compwindow.c
> +@@ -620,6 +620,11 @@ compDestroyWindow(WindowPtr pWin)
> +     ret =3D (*pScreen->DestroyWindow) (pWin);
> +     cs->DestroyWindow =3D pScreen->DestroyWindow;
> +     pScreen->DestroyWindow =3D compDestroyWindow;
> ++
> ++    /* Did we just destroy the overlay window? */
> ++    if (pWin =3D=3D cs->pOverlayWin)
> ++        cs->pOverlayWin =3D NULL;
> ++
> + /*    compCheckTree (pWin->drawable.pScreen); can't check -- tree isn't=
 good*/
> +     return ret;
> + }
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb b/=
meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
> index 212c7d39c23..f0771cc86ec 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.7.bb
> @@ -1,7 +1,8 @@
>  require xserver-xorg.inc
>
>  SRC_URI +=3D "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-h=
ardwar.patch \
> -           file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
> +            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch =
\
> +            file://0001-composite-Fix-use-after-free-of-the-COW.patch \
>             "
>  SRC_URI[sha256sum] =3D "d9c60b2dd0ec52326ca6ab20db0e490b1ff4f566f59ca742=
d6532e92795877bb"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180221): https://lists.openembedded.org/g/openembedde=
d-core/message/180221
> Mute This Topic: https://lists.openembedded.org/mt/98366626/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

