Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A06CA9ED2
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 08:43:43 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2588.1791881015169455257
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 01:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ku4qiIoV;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so22414945e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 01:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791881013; x=1792485813; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y6ACBhABCRy3gam7UVc9xp+Bh84mSnnhmrBlcaWywzU=;
        b=ku4qiIoVMzeFAZZ5tmnqfYo0DjUdZDlclJMDWBSph5SSKoHTNKz2AmWvHmqPrcYmX2
         1dca3GHpXqslre7qciys9MxRtHUFZQrr1pVe2eTLNUhVPHMSArEPQBuj8SKpuCln6wam
         QM2EYmf5ohQBIcEPmLPk4PsI3NaDHrVHQI324=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881013; x=1792485813;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y6ACBhABCRy3gam7UVc9xp+Bh84mSnnhmrBlcaWywzU=;
        b=gSx+uEvl39YDYoE873HnY10GvSzyCrosTGKheNn2AesN0XNIk0LM12eG2yrDpoR5XP
         L2lcKGmXRIvPtyIM8mbwhsvu0Y4w8I93pkktmWoyInhdjlTtI2XHvYFetkQYI186zIod
         3cCd3/5dyjfsDheTtls49FWRGgt5Q7WTSIuHDFWOfS/N15c19vgEgxAAhFKqjvLQEv2e
         fw+NHk+PDItyoyBu2WyApGiKF94n6oTR/UiaihHl4k/dAq/iKx1T7Pwa6zhCvaO25W9n
         z1MqjF9gLnJ0dzM9XgwsdjAYdDIQ8AKQCjsqD4vmo0EoU0rO4sjCspXgAQ3pE2h+M/b0
         W0+g==
X-Forwarded-Encrypted: i=1; AKwUvBy3v49RX44Kdjuw0Jx420QJV/jSRhyJjVN+Tmtpg+NgO7P/QjkC70CcwaX/G6EPtRrt6AwOuzK0+TsqzJV7yO74/A==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLrKw8VduN7FL9DSI8gbnh72JKr61EBtS4OLhI6HLV2N+E6HCY0
	XYtiUjY52GttqYOjg90+7Hi08zGpV7J99p+Ek7LQgSiMcmZ50qV+yav55ycdQIujYto=
X-Gm-Gg: AYBFou17bYP6q9PVV8O6hd9x62HDz0Sf3Z9RPLAviVOCypJF80Q8Mh+hcletRT45kWP
	gj4x6XcfhtxKrj88a2kuyYjQ3HnOl4YPsVIqtu1WE62PWJkXs6n6GC+RIW3XeHjwuulXxDtDsOr
	XFhJT2APyJCxfagtZrtzDpChkKngvktjxyOs4wK22h0yu/Ev0j2MlWt8b4wbJ6G5pn5B7zzPqZw
	zCw7+5pWD2Rb+Inyq1RZL7V7LyOkZ9sHvEbavIXxvXXeH0IQsNNcyOq/3oltcMa/5K2LXX0JZKK
	iH+KJ3wWi19FlqAWVYHruTXBCpCq3K2/Huq2lr3LbFgpIUWOwwQstDeRQAvFdMoIs1QFVin9wEj
	XVL5dFEZ+A+g8TEA/hRMXiRMm34KTdMJdKRLQ7nJ2xs5+dYhZIz8BdTnNxeZJOCdKQUmudRYSA+
	iXK8BafubfvLdIl47HwwZMs/fuU6B7ihgC41GLuSrcRd7+OpdjpPiymwE8xMpon2KlARYcbtr0Z
	KWIO8DNzo16Rzv2ll8OxWCKRvtag1OVb/3Rvgn38Wzi2lVwgat/tazij9Q=
X-Received: by 2002:a05:600c:c16f:b0:49f:ed8c:6cad with SMTP id 5b1f17b1804b1-4a18e4ca869mr207905925e9.19.1791881012996;
        Tue, 13 Oct 2026 01:43:32 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm485735025e9.0.2026.10.13.01.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:43:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 10:43:32 +0200
Message-Id: <DM3KT0WJ9OHK.32ZO1E9U41LL8@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 2/7] util-linux: patch
 CVE-2026-53613
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261005170513.632348-1-peter.marko@siemens.com>
 <20261005170513.632348-2-peter.marko@siemens.com>
In-Reply-To: <20261005170513.632348-2-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 08:43:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247710

On Mon Oct 5, 2026 at 7:05 PM CEST, Peter Marko via lists.openembedded.org =
wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Pick patch referencing this CVE from 2.41.5 release.
> Also pick patches implementing used helper functions and fixing
> consequent build errors.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc   |   5 +
>  ...ib-fileutils-add-ul_open_no_symlinks.patch |  98 +++++++++
>  ...dd-ul_openat_resolve-openat2-wrapper.patch |  85 ++++++++
>  ...x-RESOLVE_NO_SYMLINKS-fallback-value.patch |  71 +++++++
>  ...x-unused-parameter-warnings-without-.patch |  64 ++++++
>  .../util-linux/CVE-2026-53613.patch           | 192 ++++++++++++++++++
>  6 files changed, 515 insertions(+)
>  create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-file=
utils-add-ul_open_no_symlinks.patch
>  create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-file=
utils-add-ul_openat_resolve-openat2-wrapper.patch
>  create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-file=
utils-fix-RESOLVE_NO_SYMLINKS-fallback-value.patch
>  create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-file=
utils-fix-unused-parameter-warnings-without-.patch
>  create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-5361=
3.patch
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
> index 70acf6dfec3..db698ef9367 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -50,6 +50,11 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linu=
x/v${MAJOR_VERSION}/util-lin
>             file://CVE-2026-13595.patch \
>             file://CVE-2026-3184.patch \
>             file://CVE-2026-53614.patch \
> +           file://0001-lib-fileutils-add-ul_open_no_symlinks.patch \
> +           file://0001-lib-fileutils-add-ul_openat_resolve-openat2-wrapp=
er.patch \
> +           file://0001-lib-fileutils-fix-unused-parameter-warnings-witho=
ut-.patch \
> +           file://0001-lib-fileutils-fix-RESOLVE_NO_SYMLINKS-fallback-va=
lue.patch \
> +           file://CVE-2026-53613.patch \
>             "
> =20
>  SRC_URI[sha256sum] =3D "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b9681=
0bd572e167dfed0f"
> diff --git a/meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-a=
dd-ul_openat_resolve-openat2-wrapper.patch b/meta/recipes-core/util-linux/u=
til-linux/0001-lib-fileutils-add-ul_openat_resolve-openat2-wrapper.patch
> new file mode 100644
> index 00000000000..f8320ae82d5
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-add-ul_o=
penat_resolve-openat2-wrapper.patch
> @@ -0,0 +1,85 @@
> +From 4cccf4edc256507734e3484cfaedf5980945c2fa Mon Sep 17 00:00:00 2001
> +From: Karel Zak <kzak@redhat.com>
> +Date: Mon, 20 Jul 2026 14:36:16 +0200
> +Subject: [PATCH] lib/fileutils: add ul_openat_resolve() openat2 wrapper
> +
> +Add ul_openat_resolve() as a generic openat2(2) wrapper with
> +caller-specified resolve flags. No fallback to weaker alternatives --
> +returns -1/ENOSYS if openat2 is unavailable.
> +
> +Rewrite ul_open_no_symlinks() to use ul_openat_resolve() with
> +RESOLVE_NO_SYMLINKS, dropping the unsafe O_NOFOLLOW fallback that
> +only protected the final path component.
> +
> +Add fallback defines for RESOLVE_NO_SYMLINKS and RESOLVE_BENEATH
> +in fileutils.h.
> +
> +Signed-off-by: Karel Zak <kzak@redhat.com>
> +(cherry picked from commit b9e07ce6f5ad54c38cf3ebc7100101e487be91bd)
> +(cherry picked from commit 1426aa06ff2f6a21cba9102c35e3577641b356ff)
> +
> +Upstream-Status: Backport [https://github.com/util-linux/util-linux/comm=
it/4cccf4edc256507734e3484cfaedf5980945c2fa]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + include/fileutils.h |  9 +++++++++
> + lib/fileutils.c     | 22 ++++++++++++++--------
> + 2 files changed, 23 insertions(+), 8 deletions(-)
> +
Hello

Isn't this patch similar to what caused
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16316 with tar?
(implementing a "new" openat2 syscall not supported by pseudo)
Is that safe to do here?

We updated pseudo to fix that, but, I'd like to take some care to not
re-introduce the bug...

Thanks!
--=20
Yoann Congal
Smile ECS


