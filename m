Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 891C2C02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 08:35:19 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.15208.1739867715307043564
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 00:35:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TEj3k1Y/;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7be6fdeee35so972784885a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 00:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867714; x=1740472514; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hV+nNA6hAT5Dac8DJI7kXu+o4MDPQHpHWMHVasDS3yU=;
        b=TEj3k1Y/N/Yg3ccmhMyn8+l8C2ZxruRNjjO3vzrI/xjlg5uugE/r+ecXCCVUwH5cpR
         iZRt6/tEygoBImmUWIEbCIY2AgwyDfJ5NjVzPIJ90qCmXjgBA1DyDHQgFhaWMJ4zL1J+
         1CIMyGldx3XwRbedfyhuIouB4HU8Oo13Wl2FooO+r2+Iz8mJ/sXaISPwvx6QdF0BkD9y
         62z6TnEMIeef+TjQAqO6Rk6j6UOK+NGL+doU0lDxDks2WKnO62gtzr/rU7LIMvV3sSAW
         lcEP25lxyAXLutWBYM4/6vfHOg6Mq2meF/OkZk7CBaoDME3tUGBzzcbUG2C0ZgTf/JUg
         nIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867714; x=1740472514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hV+nNA6hAT5Dac8DJI7kXu+o4MDPQHpHWMHVasDS3yU=;
        b=ohjrK35fjrdCMA3D6QSou1ZwVlULFna2y4LPFAmNVfLUsPjgknQzQVQ5FpEadikTKC
         mabHF0/WX3916DymcC7ZU7l9wf6+4MJqWO73629x5ofJ/N7IHK89vMmARiV2SVBsB2ze
         RqBBPmDCjs8LbnMm4H3S6iiMBTpw1P6BB7GQRWyhq3euAyA/aOHtAKg8lOoPxQchCcrA
         G/IVsNpf7vufM1cwTq0vKdrBCHQrTQK0bWNQt1Q4lkp6NYwdRsf34pH9sJBXpUe7zduV
         1w/byMaG0Im7kj7wDme6mS4fwyQ7scjXc8x1EMW85D/FopdpKDsb4vGUeS3s9EaqEsNE
         325w==
X-Gm-Message-State: AOJu0YxZO1UHom52yEeLIoh6Oyzk9/AMELg6Bn23i+qUsjrqILrABxt1
	HtApBkCDtanZEcP8eFdxqBwb22ohe79y4KlSViVm2wt3V8Fut5QUDd9gzTqmcBjCc6vLtyaW3/7
	GaPMxlK22sXWSGBWufhiZrMPk7mQ=
X-Gm-Gg: ASbGncsZWf5KlwlL1sDEJ2HEY5s4xZJ8jVliQ010MI410eYXTpiA+ZTjt++t6nsJMPp
	gU0F7i3RZszIb824vAdQVsTGwsHZ9n5bd834zqjHDmUUTy2huIyczARsgC0gDyMWVz9oe1h0tnu
	W8+8Rj4vUbBbGTAp9zTniBsWXNbuH6Gno=
X-Google-Smtp-Source: AGHT+IHi6JVvlKWbZbwFvOI1CcVEqGTDKQ0kLtF0yxstWO11ERCGLGWnM29MZX4GYn2VH6i49uzQoWwd/RzN8vg4NFA=
X-Received: by 2002:ad4:5ae1:0:b0:6d8:8874:2127 with SMTP id
 6a1803df08f44-6e66cc8b58amr221981146d6.5.1739867714247; Tue, 18 Feb 2025
 00:35:14 -0800 (PST)
MIME-Version: 1.0
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com> <1739864375-21394-5-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1739864375-21394-5-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Feb 2025 09:35:03 +0100
X-Gm-Features: AWEUYZkO7fley7WA0AxD-fWwtwukbzCJ8lgK4iPxv38s5mePm-FFGPki6vcBOPY
Message-ID: <CANNYZj_cma+KB3tEGBrsE9zcuoYx5O7Z=E-NHY4V7c8dP=jm5w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/32] gcr: upgrade 4.3.0 -> 4.3.91
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 08:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211598

4.3.91 is a beta pre-release. We need to set the upstream regex to
exclude x.y.9z versions.

Alex

On Tue, 18 Feb 2025 at 08:41, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> ===========
> - Several updates to the CI
> - gcr: Implement Certificate Policies extension
> - gcr: Implement Authority Information Access (AIA) extension
> - gcr: Implement Authority Key Identifier extension
> - gcr: Implement CRL Distribution Points extension
> - gcr: Add GcrGeneralNames helper object
> - gck: Add missing finish-func annotation to gck_slot_open_session_full_async
> - Migrate away from g_assert() in some unit tests
> - Updated translations
> - ci: Another tarball publish fix
> - meson: fix library version
> - ci: Tarball publish fix
> - gcr: Add new GcrCertificateExtension API
> - gcr: Vala override for CertificateField.get_value
> - Fix meson test failures in FIPS mode
> - doap: Remove invalid maintainer entry
> - tests: Replace echo -n by printf
> - build: Avoid redundant libegg linking into gck tests
> - build: Fix some GLib/GTK deprecation warnings
> - ssh-agent: Request rsa-sha2-256 signature in tests
> - Updated translations
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-gnome/gcr/{gcr_4.3.0.bb => gcr_4.3.91.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-gnome/gcr/{gcr_4.3.0.bb => gcr_4.3.91.bb} (95%)
>
> diff --git a/meta/recipes-gnome/gcr/gcr_4.3.0.bb b/meta/recipes-gnome/gcr/gcr_4.3.91.bb
> similarity index 95%
> rename from meta/recipes-gnome/gcr/gcr_4.3.0.bb
> rename to meta/recipes-gnome/gcr/gcr_4.3.91.bb
> index dcd8658d9c..a76e8d486a 100644
> --- a/meta/recipes-gnome/gcr/gcr_4.3.0.bb
> +++ b/meta/recipes-gnome/gcr/gcr_4.3.91.bb
> @@ -18,7 +18,7 @@ inherit gnomebase gtk-icon-cache gi-docgen features_check vala gobject-introspec
>
>  REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)}"
>
> -SRC_URI[archive.sha256sum] = "c3ee8728e4364b0397f435fa20f92f901ab139d2b264f4e059d67b3c0f43cd36"
> +SRC_URI[archive.sha256sum] = "9d326ed3d78ad0eafb0848395a068adbefdeb6cff04ec5615cb3ef767d933990"
>
>  PACKAGECONFIG ??= " \
>         ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211567): https://lists.openembedded.org/g/openembedded-core/message/211567
> Mute This Topic: https://lists.openembedded.org/mt/111247360/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

