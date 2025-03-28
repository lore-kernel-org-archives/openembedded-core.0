Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9009FC36010
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 10:08:45 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.7801.1743156525097475418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 03:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nGayV+mT;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ed0cc5eca4so32594146d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 03:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743156524; x=1743761324; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C52GQ1JtR5dw1NCrjFF1YeksN0W5W65qe0jdu/9Jw3Y=;
        b=nGayV+mT4mVZmMG6J7i7OpGejwNYgeN+w/NM/+BgeRe8uqkRjoIsjCPuaBo/3pOdiy
         i0gK3AAZh5BcHfoqacY/Mx/4QbErJk64qYlIdjHgv4uVm0Kdn4Hrw5nm63Mn79t4/oSa
         twBCnF1YzCiwIQ5NORenrP26RcB6Oa+Dtfs+MQeWuVYzkTfNw34fl7VQBQWWO0kK9kNK
         qZEiFfwkN/1BnqQo6cxj7wWmmSld8TTdgAqMd8MuLRKLd0QhVHvKoLzHRrQ5N7ywANP/
         hLBdgt2+6r5MpxvOdLiuR91P/83ECOGcLXG8jYqB6QfXwYc7ZtUx0FyIJbAH3wB9CCjz
         9X5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743156524; x=1743761324;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C52GQ1JtR5dw1NCrjFF1YeksN0W5W65qe0jdu/9Jw3Y=;
        b=Jwm2BGJzvYmRvfIrquY3uCNupJ3kyPvHErtyRlr3L/AbSn/7UKZNuejzXQ1duQY78p
         Pe/pzL35N2XHuEbbeS8wYad9000FRlrX5jPaoRf6L/qzQq8nBbWyFpySfD6jEsKwjHqR
         5PPQALWNPB09FmiF69U5UwV8wPXXEqm7u3Ji6rk8v5jHM2P0PQiuTBn9S4WLz+sQmQj6
         eaKRlwccvyWCHtmwiNWVLQDCa1AVDuZmNYj6uvK4pHZ9dWXE5qI56tAVzD4imwmkWxfZ
         2ygsibaXxXlYCzDjCGsmB8aUO902P5sS0l/EWBIVIwmtSib196ahqzMFS/7teyQF+2Tj
         HlIQ==
X-Gm-Message-State: AOJu0YwK7U4C1DjGGI96sf+drY9FgArX6ACNsvic4LKudOP5tVUhSkE8
	h0b7NbdO7RXEYY2lqBtg6/le3C5wna0KDW3RdnvyUyFOTcjsV6JsrcCBQiDvxraTCJPQdgQSM5H
	KhQe0nB5ul6wWMS3Q5KAqf9FlLW0=
X-Gm-Gg: ASbGncsx3izGxg19Ida+cHVHBDzi7CcMYSDdTmPLx5qoYrpuPWcdaDaSfpxuce9vdLT
	hmfBM7XqRnYAPLKUqLlEJergPJs8eyJHn0rlXHIvoWykEZUsMihQMHBKP7hxCvGZslDerbiyvbY
	xkP0xJRW43S66nQE9FliBgnCMLpQ3MRmcWO6Un4d6J4401Qceztyc3Qvql6tCy
X-Google-Smtp-Source: AGHT+IE7puC2pJAqzNZiqg3MVrO4sg/iPZ2iDblx1LS/RiuF2zjzGflQ/P64IZLm1AtX0ER7aIlx/q5k0lw97YWCSYI=
X-Received: by 2002:a05:6214:19ed:b0:6e8:9053:825e with SMTP id
 6a1803df08f44-6eecc3974c6mr28829346d6.17.1743156523849; Fri, 28 Mar 2025
 03:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250327225959.3611495-1-tom.hochstein@oss.nxp.com> <20250327225959.3611495-2-tom.hochstein@oss.nxp.com>
In-Reply-To: <20250327225959.3611495-2-tom.hochstein@oss.nxp.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Mar 2025 11:08:31 +0100
X-Gm-Features: AQ5f1Jq9kR5mksdfqAMyPGO-Pnz-FWQ9WJc2Jm7gJ9CyqsiV6dYAZCH8rtvSxL8
Message-ID: <CANNYZj_KZjgk3DnoKwYHgDa95q4fVwP-c-5ZL8oHw+WZckGaTA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] meson: Fix host_machine setting for native cross-file
To: tom.hochstein@oss.nxp.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 10:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213824

On Fri, 28 Mar 2025 at 00:00, Tom Hochstein via lists.openembedded.org
<tom.hochstein=oss.nxp.com@lists.openembedded.org> wrote:

> For native and nativesdk, the meson cross-file settings for
> `host_machine` are incorrectly set for the build machine, not the
> "machine on which the compiled binary will run". See
> https://mesonbuild.com/Cross-compilation.html.
...
>  [host_machine]
> -system = '$host_system'
> -cpu_family = '$host_cpu_family'
> -cpu = '$host_cpu'
> -endian = '$host_endian'
> +system = @OECORE_TARGET_OS
> +cpu_family = @OECORE_TARGET_ARCH
> +cpu = @OECORE_TARGET_ARCH
> +endian = @OECORE_TARGET_ENDIAN
>  EOF
>  }
>
>  do_install:append:class-nativesdk() {
> -    host_system=${SDK_OS}
> -    host_cpu_family=${@meson_cpu_family("SDK_ARCH", d)}
> -    host_cpu=${SDK_ARCH}
> -    host_endian=${@meson_endian("SDK", d)}
>      install_templates
>
>      install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
> @@ -143,10 +139,6 @@ do_install:append:class-nativesdk() {
>  FILES:${PN}:append:class-nativesdk = "${datadir}/meson ${SDKPATHNATIVE}"
>
>  do_install:append:class-native() {
> -    host_system=${HOST_OS}
> -    host_cpu_family=${@meson_cpu_family("HOST_ARCH", d)}
> -    host_cpu=${HOST_ARCH}
> -    host_endian=${@meson_endian("HOST", d)}
>      install_templates

I'm struggling to see how the existing code ends up with incorrect
values in both native and nativesdk cases. Can you provide specific
example values and a way to see them?

Alex

