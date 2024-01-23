Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80D5C47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:13:34 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.769.1705972412962667261
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:13:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ml8Jvbmz;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: dbaryshkov@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40e76626170so42819815e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 17:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705972411; x=1706577211; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jOZO72b7dMvfoq6vzZz0zZm2p3rv5hbuneQojEans3E=;
        b=Ml8JvbmzeCV5CrHvC2EQjIwvS97i/RE72n7ChlJI+VArMCylpa8IsIgpAM4w/9j8T2
         wz+fAWG0PjDDGUC9x6hvFN+KynoGqv0sAXlqMeJGmmrrAANoRzvLoqniVFS9nhcII6/R
         Lt4CV1+RY2Kn5hJlg+9e8Xsw1LU/SxYz7if7P5whlyp6k2Cus2X0E7BL2JjuicpjOIB4
         BYgrcReg2jM6aaUOhT8hT8kzjia3KC93tRG+zvFAyy+WSwOZGWjqJsV/M5KopF/u+gIq
         H2R+kIE8eucQBC40Hcxk+4Xqax8TgjQRmAossHG+pqRQVZBKJ1tpFf9nLWbbJpSHt1ol
         Sa5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705972411; x=1706577211;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jOZO72b7dMvfoq6vzZz0zZm2p3rv5hbuneQojEans3E=;
        b=TW5FKP1N9cuGeB86ZXTlm8RvOvMBrozbswVm/Sl8YgpEcArpq1IbYaIwoKNVOwDWmI
         GAIITqDYDaMoyrQipg7t47nADN+BgJ7cxrZBd8hc3pEMmCuy0XE1Pdug7xdmYsuTxMWb
         wL6kwA4Orx/xiZilb61Y3Oq6buvjQmzff0F8CiCRQPpZdqcmPwljZgSM0+A04n+6W/s9
         G9P7hBjXmw1gM40HjHrTJq0OvbKKgYHhLuM1MkfR1QLFmZ+usxEch6jIkALYotuF0KdU
         +oWFRTFmC+1FTOTC93sfstnoWO6xN/EqhPYwwR/3R0+Yj76hRLJIO/CfWbC56C1OYeiz
         dOiQ==
X-Gm-Message-State: AOJu0YyxbyyMtKor+C/wSWcf488myMcQC/xdOOrzXgkuPzzNJIR7kBge
	5R7j9WLZM2waPb3aQMJut0buymdjQTVCfRLxWBs6my1hI6qBCNSTC2nEw74Akr2aFlR8Dx2zCV8
	WU2CiJyoz7Yr1GErPwem7tWq1iR0=
X-Google-Smtp-Source: AGHT+IFMSUhV+DJOeNWOr3aiEIUUYREHAQ9eU2mQ6dpWJrQrXLeIoA1IPsdM/7dNBGyXWJKh9RfOCu3AX5fv22vPDuY=
X-Received: by 2002:a05:600c:14b:b0:40d:85a3:2dc8 with SMTP id
 w11-20020a05600c014b00b0040d85a32dc8mr50813wmm.75.1705972411081; Mon, 22 Jan
 2024 17:13:31 -0800 (PST)
MIME-Version: 1.0
References: <20240119124323.3823059-1-alex@linutronix.de>
In-Reply-To: <20240119124323.3823059-1-alex@linutronix.de>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Tue, 23 Jan 2024 03:13:19 +0200
Message-ID: <CALT56yOPW6akXrH_xyJbgoH_s5nYoMDYLX55H1betVZ+8T_uEg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] shadow: replace static linking with dynamic
 libraries in a custom location and bundled with shadow
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 01:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194197

On Fri, 19 Jan 2024 at 14:43, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Despite our efforts to make static linking work, there have
> been new reports of bizarre build failures:
> https://lists.openembedded.org/g/openembedded-core/message/194006
> https://lists.openembedded.org/g/openembedded-core/message/193907
>
> This commit changes back to dynamic linking, but places
> the libraries in a custom location, per RP's suggestion.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>

Alexander, please excuse my ignorance. What was the original issue
that you observed on your build system? I tried simply reverting the
offending commit and performing the build. I see libbsd, libattr and
libmd populated in recipe-sysroot-native for both target and native
builds that depend on shadow-native (added manual dependency of test
-native recipe on shadow-native).

> ---
>  meta/conf/distro/include/no-static-libs.inc |  5 -----
>  meta/recipes-extended/shadow/shadow.inc     | 24 ++++++++++++---------
>  2 files changed, 14 insertions(+), 15 deletions(-)
>
> diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
> index 8898d53d756..75359928a14 100644
> --- a/meta/conf/distro/include/no-static-libs.inc
> +++ b/meta/conf/distro/include/no-static-libs.inc
> @@ -21,11 +21,6 @@ DISABLE_STATIC:pn-libusb1-native = ""
>  # needed by rust
>  DISABLE_STATIC:pn-musl = ""
>
> -# needed by shadow-native to build static executables, particularly useradd
> -DISABLE_STATIC:pn-attr-native = ""
> -DISABLE_STATIC:pn-libbsd-native = ""
> -DISABLE_STATIC:pn-libmd-native = ""
> -
>  EXTRA_OECONF:append = "${DISABLE_STATIC}"
>
>  EXTRA_OECMAKE:append:pn-libical = " -DSHARED_ONLY=True"
> diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
> index 43f456251a5..b8e5e285c45 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -47,16 +47,6 @@ EXTRA_OECONF += "--without-libcrack \
>
>  CFLAGS:append:libc-musl = " -DLIBBSD_OVERLAY"
>
> -# Force static linking of utilities so we can use from the sysroot/sstate for useradd
> -# without worrying about the dependency libraries being available
> -LDFLAGS:append:class-native = " -no-pie"
> -do_compile:prepend:class-native () {
> -       sed -i -e 's#\(LIBS.*\)-lbsd#\1 ${STAGING_LIBDIR}/libbsd.a ${STAGING_LIBDIR}/libmd.a#g' \
> -              -e 's#\(LIBBSD.*\)-lbsd#\1 ${STAGING_LIBDIR}/libbsd.a ${STAGING_LIBDIR}/libmd.a#g' \
> -              -e 's#\(LIBATTR.*\)-lattr#\1 ${STAGING_LIBDIR}/libattr.a#g' \
> -               ${B}/lib/Makefile ${B}/src/Makefile
> -}
> -
>  NSCDOPT = ""
>  NSCDOPT:class-native = "--without-nscd"
>  NSCDOPT:class-nativesdk = "--without-nscd"
> @@ -161,6 +151,20 @@ do_install:append() {
>         touch ${D}${sysconfdir}/subgid
>  }
>
> +# Make executables look for dynamically linked libraries in a custom location, and install
> +# the needed libraries there. That way we can use them from sstate
> +# in setscene tasks without worrying about the dependency libraries being available.
> +do_install:append:class-native() {
> +        binaries=$(find ${D}${base_bindir}/ ${D}${base_sbindir}/ ${D}${bindir}/ ${D}${sbindir}/ -executable -type f)
> +        chrpath -k -r ${STAGING_DIR_NATIVE}/lib-shadow-deps $binaries
> +        mkdir -p ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
> +        install ${STAGING_LIBDIR_NATIVE}/libattr.so.* ${STAGING_LIBDIR_NATIVE}/libbsd.so.* ${STAGING_LIBDIR_NATIVE}/libmd.so.* ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
> +        install ${D}${libdir}/*.so.* ${D}${STAGING_DIR_NATIVE}/lib-shadow-deps/
> +}
> +
> +SYSROOT_DIRS:append:class-native = " ${STAGING_DIR_NATIVE}/lib-shadow-deps/"
> +INSANE_SKIP:${PN}:class-native = "already-stripped"
> +
>  PACKAGES =+ "${PN}-base"
>  FILES:${PN}-base = "\
>      ${base_bindir}/login.shadow \
> --
> 2.39.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194041): https://lists.openembedded.org/g/openembedded-core/message/194041
> Mute This Topic: https://lists.openembedded.org/mt/103828721/3618183
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [dbaryshkov@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
With best wishes
Dmitry

