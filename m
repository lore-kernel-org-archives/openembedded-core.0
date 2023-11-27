Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37CCC07CB1
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 12:37:48 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.93823.1701088667122883568
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 04:37:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b60t12OG;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-548d60a4d60so5566565a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 04:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701088665; x=1701693465; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/xEe69nA7CUvaHFLGvue5BtHoEju20P6H3jaun+qrHM=;
        b=b60t12OGxPZyAh/7TbDA+AdhvEd6jaLxJjCeWFWczNNb6uJ043+Mzy7+Yifp3WIekV
         3v7fNbK1AQZ4LDJkZd4ZWf7bVdQxDrEOjosUnsM/xsJiIrp2l37MslUXql+u0XlDxrPs
         iGm0O+A60ItU5XQ1P90uiRa1QAJrR+Ji/66oJEmwmZFTNFpctbp9PVATtvqgRqek0zfY
         fyYAVB0IZ4XmW63W4GjJ1VJEZkEeiV6TNVRdxOCvMLs78zD9egwx5tAReARxbZXCNMrS
         t1ZGw7q4xYSKqr4BMMDpdCWr7EaMwfVgcEo+h3cIfCEjQPcuDvYdyDu7QT9TQKVj4B9B
         EV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701088665; x=1701693465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xEe69nA7CUvaHFLGvue5BtHoEju20P6H3jaun+qrHM=;
        b=qgA1r+iH8o2CxGe18N9rg9OwUjgY43iralHO8eTsqF7SGmDoZTJJMt61C9I/2YAHCD
         4dv+eJv2EWvkJEgbp7D9y9ptzzMrBNP8wOCKAx8QGjagFGpUDdUK9E4fFUD1YNqjzHMK
         YQrIhWcsoDJzWSw6g4LcHL+HeEbtyZq8n6va8IskGgf6saARKLycgCKKZO6XRC9oEuuc
         sEg/qG3ljk2ZpwJ1yt+AlChhQHiEHyPq3DhEBrtz2HqwDboedSwvxkFX/0x6rA177mZN
         TlqUAmAxqEkiVuqRFznsFXl/tkPYezup8EdBlBWdFLi5OsPRMNrapQMIZOwHH6VJwyzd
         dEjQ==
X-Gm-Message-State: AOJu0Yyuf8rSXF+rX6HWoii6j8VbLUOcqINlo9l/+pOT5aVagd/7ZejI
	Q++vZQltN+p3v+zeyZ/ICT5CKVNY3fHmaGR+vHI=
X-Google-Smtp-Source: AGHT+IEG2gNEei6Zpe60syjnQdu90ZMW+6tiDJTchDRw6UmjLHb/8bIizwpJAlZTwXV4kt6PiNNjE0dKt+paNN5mm3U=
X-Received: by 2002:a50:a693:0:b0:54a:ce07:b059 with SMTP id
 e19-20020a50a693000000b0054ace07b059mr9449836edc.5.1701088665161; Mon, 27 Nov
 2023 04:37:45 -0800 (PST)
MIME-Version: 1.0
References: <20231123165927.1868468-1-quic_vkraleti@quicinc.com> <20231123165927.1868468-2-quic_vkraleti@quicinc.com>
In-Reply-To: <20231123165927.1868468-2-quic_vkraleti@quicinc.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Mon, 27 Nov 2023 14:37:33 +0200
Message-ID: <CALT56yPxv58LS3vfAGpbWJZiDt7Zfg31GdKS8pX19isUKE5=Ng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] systemd-boot: fix build issues on armv7a-linux
To: Viswanath Kraleti <quic_vkraleti@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 12:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191296

On Sat, 25 Nov 2023 at 13:50, Viswanath Kraleti
<quic_vkraleti@quicinc.com> wrote:
>
> From: Viswanath Kraleti <vkraleti@qti.qualcomm.com>
>
> backport a fix to address build failures on armv7a [bug id #29381]

Start with the capital letter, please.

Also I don't see this bug in the Yocto bugzilla. If you want to point
to the Systemd issue, please use the full URL. For example, you can
use Link trailer.

> introduced in systemd v254-rc1.
>
> Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
> ---
>  meta/recipes-core/systemd/systemd.inc         |  4 ++-
>  ...n-Pass-all-static-pie-args-to-linker.patch | 35 +++++++++++++++++++
>  2 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-Pass-all-static-pie-args-to-linker.patch
>
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
> index ccc3236457..f9caba2066 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -17,6 +17,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
>
>  SRCREV = "2e7504449a51fb38db9cd2da391c6434f82def51"
>  SRCBRANCH = "v254-stable"
> -SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
> +SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
> +           file://0001-meson-Pass-all-static-pie-args-to-linker.patch \
> +           "
>
>  S = "${WORKDIR}/git"
> diff --git a/meta/recipes-core/systemd/systemd/0001-meson-Pass-all-static-pie-args-to-linker.patch b/meta/recipes-core/systemd/systemd/0001-meson-Pass-all-static-pie-args-to-linker.patch
> new file mode 100644
> index 0000000000..efea95b6ac
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-meson-Pass-all-static-pie-args-to-linker.patch
> @@ -0,0 +1,35 @@
> +From f85a387a67900b02c69abccb88c2ef7191c67277 Mon Sep 17 00:00:00 2001
> +From: Jan Janssen <medhefgo@web.de>
> +Date: Sun, 1 Oct 2023 09:55:48 +0200
> +Subject: [PATCH] meson: Pass all -static-pie args to linker
> +
> +Fixes: #29381
> +
> +Upstream-Status: Backport [https://github.com/systemd/systemd/commit/cecbb162a3134b43d2ca160e13198c73ff34c3ef]
> +
> +---
> + src/boot/efi/meson.build | 11 ++++++++---
> + 1 file changed, 8 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
> +index 2773eaf286..9a60a57329 100644
> +--- a/src/boot/efi/meson.build
> ++++ b/src/boot/efi/meson.build
> +@@ -161,9 +161,14 @@ efi_c_ld_args = [
> +         '-Wl,--entry=efi_main',
> +         '-Wl,--fatal-warnings',
> +
> +-        # These flags should be passed by -static-pie, but seem to be missing sometimes.
> +-        '-Wl,--no-dynamic-linker',
> +-        '-z', 'text',
> ++        # These flags should be passed by -static-pie, but for whatever reason the flag translation
> ++        # is not enabled on all architectures. Not passing `-static` would just allow the linker to
> ++        # use dynamic libraries, (which we can't/don't use anyway). But if `-pie` is missing and the
> ++        # gcc build does not default to `-pie` we get a regular (no-pie) binary that will be
> ++        # rightfully rejected by elf2efi. Note that meson also passes `-pie` to the linker driver,
> ++        # but it is overridden by our `-static-pie`. We also need to pass these directly to the
> ++        # linker as `-static`+`-pie` seem to get translated differently.
> ++        '-Wl,-static,-pie,--no-dynamic-linker,-z,text',
> +
> +         # EFI has 4KiB pages.
> +         '-z', 'common-page-size=4096',
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191227): https://lists.openembedded.org/g/openembedded-core/message/191227
> Mute This Topic: https://lists.openembedded.org/mt/102794924/3618183
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [dbaryshkov@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
With best wishes
Dmitry

