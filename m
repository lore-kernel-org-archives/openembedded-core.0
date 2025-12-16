Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A465D5E39D
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 14:51:16 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24492.1765896669186505280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 06:51:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gIQhdFPu;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-3ec314aaae5so2621689fac.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 06:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765896668; x=1766501468; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HljhzhHFmTxuqEyaW70jUYIhIuvnkr3m89yFu1ATkFE=;
        b=gIQhdFPuRQrmvjJyq6TXml46SF5hqm7hhgph53MoIMiUWtz4qQ5MhRClhZQa6ZoPDK
         jPM/AZIKAmtvzbM7296cpiuPvbsLzUzT6bc635uExyD/pb8LApS25HE6mdFcOYDOO1Ve
         CjZkhqfdmLV4R4dDMr/BKpfRDWsrxJpRfYtg7Hlu5VQo0jh9dDxtjc1/RBTSZ6xcLG6+
         hT3dh2pCnHmyCtIL2UaAd+KNFIsXj4knLE3lA27XDjgqLrQF1r+tjdGZo6S6Na2Zw70R
         /KG9vEucT9vIzrUsAqLBE99monzUE0sCXu3HCa1SrDmGeYBonZRsHmKdxRgkT/xQrmiC
         mg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765896668; x=1766501468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HljhzhHFmTxuqEyaW70jUYIhIuvnkr3m89yFu1ATkFE=;
        b=GzkS2w/6JL8mifJm0U4/eCLAf6TbQzltEctDxZPV27XU5oxYki/4xDONFjkVNjMM6k
         p4abUmKUXcf021+Tvpyjh2H7SK8/PL5C51Zs8jRh0NMQwvqJXyFY75jzltrXi4ugGcii
         B3nbfZIz+xZ9HuuUXgqQkeoWV6I0DJsYe1mbEL8rTK+1o/CEYfsWSjiRGQIW5spdjYQ9
         ksRp5HsclD5qfv+5QTRf1FvJS/Wa1vUmL6JAzo864lDRRQr/QCMi1fTf4TEn0GfKF9Oi
         txwHxvBZN93wOvE4A7870yxiszqfg6fXpOf5uqNtOih4XaLH/OE2efpJSnyErs1yYPU5
         C8sQ==
X-Gm-Message-State: AOJu0YzvUSF5uZ4QZJEEV0aRElHIYe4vYrZ1P812Jb3W2KXoujk9PCUM
	7PeYpuJYYWqkVNtCWHWkAVodzHzvhKN5UmftyqDk3c7r+Z0PJWImZblgjyweJEe6cl13XO+VYe7
	EG5vJkWPvkoVtsNxaYJjWiG+Iq3e9f/Au1EoR
X-Gm-Gg: AY/fxX6qZik0gLEI6dOchlIy+7WbQCAgDs6j5zLOj3cnNHE4jnAJL9Npe/YJHZaRGGg
	znRxUgk+BbUHTdK1TaC2UiEYcrw8aBJSM5+RREFuXhSFgq1bQIdQ9r4GeyboBIodeLgIVjybw35
	uwZDg26Xqy8veLePSzwIX9aZn6ZaOzRPOfpKt03OejERKcVuGkdEV0UYrbv0MszP8quim+U51y5
	ELWquvTVAJtPsO1itmODnIi2L+GA5FzDV9PN3iECIPQE6VIyqjtzAH6AvByWgPG0deaRNJ36WfT
	k4k3Ck5K
X-Google-Smtp-Source: AGHT+IGWjOdvnvsFm1Nnf8LrheKZ4mC5eCOWAe2YBAsfn4rYc5FBuT9SwySd9q3XmhX5E13LGRY11zTSeiXPuqt1Z0U=
X-Received: by 2002:a05:6870:1c7:b0:3f4:fa99:29fa with SMTP id
 586e51a60fabf-3f5fc3e6857mr6569129fac.24.1765896668097; Tue, 16 Dec 2025
 06:51:08 -0800 (PST)
MIME-Version: 1.0
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com> <20251213095931.2571498-3-ankur.tyagi85@gmail.com>
In-Reply-To: <20251213095931.2571498-3-ankur.tyagi85@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 16 Dec 2025 20:20:56 +0530
X-Gm-Features: AQt7F2pc1hm5KlftkRuSCM0OpjYnDt0QVdGJQQe8DkQExsRNioXxZSahFRr7f0o
Message-ID: <CADySD0ETTsbQCsMMK+zAmTUtL0-PQHEKkO_=R6yAnGTdBGBBfw@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH 03/67] squashfs-tools: 4.7.2 -> 4.7.4
To: openembedded-core@lists.openembedded.org
Cc: Robert Yang <liezhi.yang@windriver.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 14:51:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227965

This patch doesn't bring any critical bug fix, hence can be dropped.

On Sat, Dec 13, 2025 at 3:29=E2=80=AFPM <ankur.tyagi85@gmail.com> wrote:
>
> From: Robert Yang <liezhi.yang@windriver.com>
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> (cherry picked from commit 61964e2265fa27dfa6791053b0ba5019ccd373bf)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../{squashfs-tools_4.7.2.bb =3D> squashfs-tools_4.7.4.bb}        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/squashfs-tools/{squashfs-tools_4.7.2.bb =3D=
> squashfs-tools_4.7.4.bb} (96%)
>
> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.2.bb=
 b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.4.bb
> similarity index 96%
> rename from meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.2.bb
> rename to meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.4.bb
> index 8bca98f419..eb3974bcb5 100644
> --- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.2.bb
> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.4.bb
> @@ -6,7 +6,7 @@ LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>
>  SRC_URI =3D "git://github.com/plougher/squashfs-tools.git;protocol=3Dhtt=
ps;branch=3Dmaster;tag=3D${PV}"
> -SRCREV =3D "99d23a31b471433c51e9c145aeba2ab1536e34df"
> +SRCREV =3D "bad1d213ab6df587d6fa0ef7286180fbf7b86167"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))"
>

