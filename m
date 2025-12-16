Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5D2D5E391
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 14:43:16 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24093.1765896193848647440
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 06:43:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=avdQsc+H;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4537c9405ecso1304107b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 06:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765896193; x=1766500993; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbejZYJXW4yus0dANCosM3WnyuIutallftwLUd+V/YA=;
        b=avdQsc+HzMWbvG/gLW90GufH+BtzB3mhvzt4Otr7nQ2NNH1qn7vAh6Cj74H5jY3Stn
         9klkkbwPtnv1gr97uOOTK3V+Yp1OBSGwFQTONk12jaW+zbwF2rfmMJJmNoHmFZcATPP3
         Hbd3bdNz7h8nsgdeSQ6NjwQfJE6i5EyW+NPfal2DRvDZG0TONRVJyHjSxS+jMOWUVsJd
         C76/BjgHIgFTJqohXGnGCF5SJGR9zKb/u5so6Mq6oChL6xXFSN8W4jAu381B3LOr8UX7
         H7C0FoD2xGfwSnehIKYSjeYQzZZaXwII1s5oyaQb6y3z3pkBDyhkLzjWAraBhkesjpho
         xsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765896193; x=1766500993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LbejZYJXW4yus0dANCosM3WnyuIutallftwLUd+V/YA=;
        b=J0JKA8PsTEKokRAdc9o5DpmwVdCC6lH2JcGpQwIWhsvh5w0f05oL221C8kWSXgsgq0
         jwVHxuez41IT4Fm1gqjV6HY6tosbjsKeaAg5dJsiY3xF4Lqr/c3CTHjMI4tC6F9w6uiJ
         51yDkU0vht4SRAJw8l4F+KRVQMDslLeqG1V91OfPvR8vVhvN55aS4EP1NO/HcXGDz8n9
         5yGQTnaryE5ROFeNGTk9GOYhUuas/DvvLjL5AUdN4l+Y6ZWldAGUBDInS0Xss48nRR7T
         Hxfq5cyEOoXgG80Jp3s+5MKS175vCUx2jC7UuUlS2twbQTvWGtlKPc2lffHuAwTnwZ18
         pvxQ==
X-Gm-Message-State: AOJu0YxMe0DToB0L+aRtJAOXYLLVxD12KTz6fhLfnkdsLxn7DBdcqmB9
	4pgu4HDEEQDmd+FjNlQAS5i6R5EU9pFTF6X9MN1eHZykWpFfhZz9ZZoxt5x4d2GjnMeEQUNV4Kd
	yCtRHgy5I3u0k9eZTFDUS9cVqgtfd0iwa5w==
X-Gm-Gg: AY/fxX4huU3gQfC5J4Inn66xp0Nkx17P9kveR7MTIEuMkowkXHqTD6dk/VfKq5lRh5g
	wmOFxlh+zVQOb5iEoOP5xEm5rGRIQ5ZHS9qsAlM0rk6SjKkHoi4pQUIQM/JmpPAd7kLcgCNvg8j
	DASAYRE3/U/gHBaZn3IvSN77/leEMGOsOs1gYUErTy21sWCyGp3YAesXSYGC3WmFgJVcAhdzBAV
	fuqnavLEa9vnq3weYMYdBqlICYHHeiDzAjyIkfXUbeemEgMgKxHa/2xdjVoFjC6Vi/m8t5/QA==
X-Google-Smtp-Source: AGHT+IHskMSiQVlObjXw4kk6AP5wG2HIk2BqLOF2mLjdBUMBnlNdBGZRq2xqBUUyBEMnVTI4pBitOvhmVkYah4goFqo=
X-Received: by 2002:a05:6808:1784:b0:450:907:b523 with SMTP id
 5614622812f47-455ac7dbb99mr6250348b6e.6.1765896192704; Tue, 16 Dec 2025
 06:43:12 -0800 (PST)
MIME-Version: 1.0
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 16 Dec 2025 20:13:01 +0530
X-Gm-Features: AQt7F2rgMs1sFOy3Okmxf4cU6e0deZ493ivzXwOrYVBYbiokHAiD4VAHTIkvYZY
Message-ID: <CADySD0Eb+dhq-Fax7UufcsbpFr6KnoBBexE1+AEqrURYnK1tsQ@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH 01/67] bluez5: upgrade 5.84 -> 5.85
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?Q?Gu=C3=B0ni_M=C3=A1r_Gilbert?= <gudni.m.g@gmail.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 14:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227962

This patch doesn't bring any critical bug fix can be dropped.

On Sat, Dec 13, 2025 at 3:29=E2=80=AFPM <ankur.tyagi85@gmail.com> wrote:
>
> From: Gu=C3=B0ni M=C3=A1r Gilbert <gudni.m.g@gmail.com>
>
> Changelog:
> - Fix issue with handling display of battery charge level.
> - Fix issue with BASS permissions not requiring encryption.
> - Fix issue with handling abort for OBEX SRM operation.
> - Fix issue with handling device privacy.
> - Add support for HFP call answer support.
> - Add support for HFP simple 3-way call support.
>
> Full changelog:
> https://github.com/bluez/bluez/compare/5.84...5.85
>
> ----
> Other notes:
> - A new testing tool is added called 6lowpan-tester
> - A patch is removed since it is included in the 5.85 release
>
> Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudni.m.g@gmail.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> (cherry picked from commit 83812b010cf9c8bd022ad9702be2285de21ac67e)
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc   |  1 -
>  ...-fix-pac_config_cb-error-code-return.patch | 29 -------------------
>  .../bluez5/{bluez5_5.84.bb =3D> bluez5_5.85.bb} |  3 +-
>  3 files changed, 2 insertions(+), 31 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-media-fi=
x-pac_config_cb-error-code-return.patch
>  rename meta/recipes-connectivity/bluez5/{bluez5_5.84.bb =3D> bluez5_5.85=
.bb} (93%)
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
> index aac38a54a9..24a41f92df 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -64,7 +64,6 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/bluez-=
${PV}.tar.xz \
>             file://init \
>             file://run-ptest \
>             file://0001-tests-add-a-target-for-building-tests-without-run=
nin.patch \
> -           file://0001-media-fix-pac_config_cb-error-code-return.patch \
>             "
>  S =3D "${UNPACKDIR}/bluez-${PV}"
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-media-fix-pac_c=
onfig_cb-error-code-return.patch b/meta/recipes-connectivity/bluez5/bluez5/=
0001-media-fix-pac_config_cb-error-code-return.patch
> deleted file mode 100644
> index a67fd07137..0000000000
> --- a/meta/recipes-connectivity/bluez5/bluez5/0001-media-fix-pac_config_c=
b-error-code-return.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From d7966dbb7bcf39f9615c906c47ef7ad895796756 Mon Sep 17 00:00:00 2001
> -From: Pauli Virtanen <pav@iki.fi>
> -Date: Thu, 18 Sep 2025 20:19:35 +0300
> -Subject: [PATCH] media: fix pac_config_cb() error code return
> -
> -Fixes: a887b1a1b91f ("audio: Add support for specific error codes for A2=
DP configuration")
> -
> -Upstream-Status: Backport [https://github.com/bluez/bluez/commit/6b0a087=
76ae44a9102d7c6875a77e83dc6a11a37]
> -Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudni.m.g@gmail.com>
> ----
> - profiles/audio/media.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/profiles/audio/media.c b/profiles/audio/media.c
> -index 332f643bb..deb321e6c 100644
> ---- a/profiles/audio/media.c
> -+++ b/profiles/audio/media.c
> -@@ -1110,7 +1110,7 @@ static void pac_config_cb(struct media_endpoint *e=
ndpoint, void *ret, int size,
> -       if (!transport)
> -               return;
> -
> --      data->cb(data->stream, error_code =3D=3D 0 ? 0 : -EINVAL);
> -+      data->cb(data->stream, (error_code && *error_code =3D=3D 0) ? 0 :=
 -EINVAL);
> - }
> -
> - static struct media_transport *pac_ucast_config(struct bt_bap_stream *s=
tream,
> ---
> -2.43.0
> -
> diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.84.bb b/meta/recip=
es-connectivity/bluez5/bluez5_5.85.bb
> similarity index 93%
> rename from meta/recipes-connectivity/bluez5/bluez5_5.84.bb
> rename to meta/recipes-connectivity/bluez5/bluez5_5.85.bb
> index 874db9df64..d8965fef4b 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5_5.84.bb
> +++ b/meta/recipes-connectivity/bluez5/bluez5_5.85.bb
> @@ -1,6 +1,6 @@
>  require bluez5.inc
>
> -SRC_URI[sha256sum] =3D "5ba73d030f7b00087d67800b0e321601aec0f892827c72e5=
a2c8390d8c886b11"
> +SRC_URI[sha256sum] =3D "ad028e49254bc4551a13f08fe7904c63d02ba650d77be8ae=
15bb3b0a0ad94a6f"
>
>  CVE_STATUS[CVE-2020-24490] =3D "cpe-incorrect: This issue has kernel fix=
es rather than bluez fixes"
>
> @@ -35,6 +35,7 @@ NOINST_TOOLS_TESTING ?=3D " \
>      tools/iso-tester \
>      tools/mesh-tester \
>      tools/ioctl-tester \
> +    tools/6lowpan-tester \
>  "
>
>  # noinst programs in Makefile.tools that are conditional on TOOLS

