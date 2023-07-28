Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26DCAC001DF
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 12:52:07 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.31565.1690548722165986437
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 05:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=twBdR7XX;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.208.176, mailfrom: jdmason@kudzu.us)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b72161c6e9so42468711fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 05:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1690548720; x=1691153520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFlVDXxGLu+EdhEAGfcHMScCcNMyxnXrcgtPYbtc7Ug=;
        b=twBdR7XXMmSt617KrbpOBr9WUwcGAy4NDz13t6pI0faDF0wqKWC4UNfY2F1lBOBAR4
         bmzFH7IoohRT1IcqQNezvYgFW6C3ESt28A2sa+u2h9evzCZWeLlToS2u1tPWU/cZFcEz
         Bab7Iq6E/W/P/A36zXhIXz3Q8NLIOt4SLggGecv3Se+vyA7NzmlYEh5WJfFcaJYBAfSH
         akGzIzhkHsdyuyPb5iOt4PS5MMWP+4lZYCaIuHXlpKGHSllzg/Hi1iF84nFvaFXqZlJx
         vLPuIcYflnrhRkIzqL7hihyTbonc8YqYHiNn34ueLzycYHXbfS1n+EcPhuyQE31dR/5E
         AtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690548720; x=1691153520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFlVDXxGLu+EdhEAGfcHMScCcNMyxnXrcgtPYbtc7Ug=;
        b=kPO9G61+oORbp0xMbEvSV/wbQUMJaoadEbsjzxlQfxEni/1xTrkOnDkCXhA5JrilFu
         bGVTMfloj62J1XNecinzRXzwLFLFx1oIMAtBDc15JrP7ydwK5M+e6QeM+CTvu5R36X/9
         0YxCvJHUWT7BeG7rvQ37uhDRHU33kL5p13MriEMiSno8HyY1uuEPt0Or+CvF0rkqGgEC
         79tbJ4QvFOhbYUTykCPXqD93/yLK7qoyyi/64Mbd9xK6zgSneKf8p1kiMCc3BLT/bcdg
         ygsYAABsc39fSI5DVAs1NMBh1oGUqyfrmYyutJ2lqHD3grMVzv8TqraViOAKLE00KoUW
         e3bQ==
X-Gm-Message-State: ABy/qLbPyp1atwMBP/4Xv2PsWo2f1RITq5M+CDy94OoBpDju4xjFpSpL
	EU7ZoEkBQrEPQ+P0gnUkk7EB2z+gM2wSiFR4FER0nQ==
X-Google-Smtp-Source: APBJJlF6zxMIQkTgSHVQtrxvH8sVcJGbdPMaCjsx0jptO+1Q9xy8a2Dsto+P1+0Ub3K4xo5zdbnNWdHGapFwSZHeuak=
X-Received: by 2002:a2e:b80c:0:b0:2b6:fbec:ba84 with SMTP id
 u12-20020a2eb80c000000b002b6fbecba84mr2163801ljo.24.1690548719965; Fri, 28
 Jul 2023 05:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230728093950.12046-1-alex.kiernan@gmail.com>
In-Reply-To: <20230728093950.12046-1-alex.kiernan@gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 28 Jul 2023 08:51:48 -0400
Message-ID: <CAPoiz9xVrUn-B7U61CjrU7Qkq2tMVJ-znYbSMnv0zPFBUDSLhA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 1/2] base-passwd: Add the sgx group
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 12:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185027

On Fri, Jul 28, 2023 at 5:40=E2=80=AFAM Alex Kiernan <alex.kiernan@gmail.co=
m> wrote:
>
> To avoid errors from eudev/udev we need an sgx group, but if we add it
> via groupadd that causes shadow login to be brought into an image, which
> causes images which have CONFIG_MULTIUSER unset to fail with `setgid:
> Function not implemented` as shadow's login doesn't implement the
> heuristics which busybox has to handle this kernel configuration.

Firstly, thank you very much for fixing this.  I was having lots of
trouble with it.

I just wanted to point out that the underlying sgx issue is unique to
Intel/x86.  So, it might make sense to only apply this patch in this
case.

Thanks,
Jon

> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
>  .../0001-base-passwd-Add-the-sgx-group.patch  | 30 +++++++++++++++++++
>  .../base-passwd/base-passwd_3.6.1.bb          |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta/recipes-core/base-passwd/base-passwd/0001-base-p=
asswd-Add-the-sgx-group.patch
>
> diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-A=
dd-the-sgx-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-bas=
e-passwd-Add-the-sgx-group.patch
> new file mode 100644
> index 000000000000..e1340e1b70cf
> --- /dev/null
> +++ b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-the-=
sgx-group.patch
> @@ -0,0 +1,30 @@
> +From 9e57771d138ac423d5139b984b8c869122ce4976 Mon Sep 17 00:00:00 2001
> +From: Alex Kiernan <alexk@zuma.ai>
> +Date: Fri, 28 Jul 2023 10:28:57 +0100
> +Subject: [PATCH] base-passwd: Add the sgx group
> +
> +To avoid errors from eudev/udev we need an sgx group, but if we add it
> +via groupadd that causes shadow login to be brought into an image, which
> +causes images which have CONFIG_MULTIUSER unset to fail with `setgid:
> +Function not implemented` as shadow's login doesn't implement the
> +heuristics which busybox has to handle this kernel configuration.
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> +---
> + group.master | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/group.master b/group.master
> +index d34d2b832d43..e54fd1d2c6dc 100644
> +--- a/group.master
> ++++ b/group.master
> +@@ -34,6 +34,7 @@ video:*:44:
> + sasl:*:45:
> + plugdev:*:46:
> + kvm:*:47:
> ++sgx:*:48:
> + staff:*:50:
> + games:*:60:
> + shutdown:*:70:
> diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb b/meta/re=
cipes-core/base-passwd/base-passwd_3.6.1.bb
> index 204016b3e72e..44bcfb019930 100644
> --- a/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
> +++ b/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
> @@ -13,6 +13,7 @@ SRC_URI =3D "https://launchpad.net/debian/+archive/prim=
ary/+files/${BPN}_${PV}.tar
>             file://0005-Add-kvm-group.patch \
>             file://0006-Make-it-possible-to-configure-whether-to-use-SELi=
nux.patch \
>             file://0007-Add-wheel-group.patch \
> +           file://0001-base-passwd-Add-the-sgx-group.patch \
>             "
>
>  SRC_URI[sha256sum] =3D "6ff369be59d586ba63c0c5fcb00f75f9953fe49db88bc6c6=
428f2c92866f79af"
> --
> 2.39.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185015): https://lists.openembedded.org/g/openembedde=
d-core/message/185015
> Mute This Topic: https://lists.openembedded.org/mt/100407464/3616920
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jd=
mason@kudzu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

