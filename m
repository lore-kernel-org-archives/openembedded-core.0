Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250F3C282EC
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 16:02:42 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.18711.1741881757281147159
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 09:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JKHgqLp4;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-72a4793d4e2so658177a34.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 09:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741881756; x=1742486556; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W91rb7PGrVufGlhdsXrUsLkx1CeWNXzCWzOkPlJFjVc=;
        b=JKHgqLp4EDZLlnH1/waLSH3Q1LwlOx0wI+1691ok5F+dWgn/Hd2GKXSybt+Zfpu7PN
         pdl03n0RRcThPVaHLEWg5+T7fmXyRW0fgr3XQMgODEg3KoKpKfeBuJvFJrc2Y7IJ0t7v
         BcE8yDJTQV8XcZJF+/WsXPSssfIkJoVjjt7Jij7iWvU3pJlDhzIJXgvVutOWM9GtVwGt
         e4bJa+uf4EJzSyFHSuSzxjIvONNFGKt28FPNkiGruHH1qkhUUUgMJTL0ZbHjTLgEwh7o
         A8UeM/L8bV6z2f0tYqBtH5d9fWXpPTeyp1lyLB+u01MYh4+yTm4s/SPQZgA9VcGc0KNN
         4Rag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741881756; x=1742486556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W91rb7PGrVufGlhdsXrUsLkx1CeWNXzCWzOkPlJFjVc=;
        b=JvXltK6MovH4jAfH6xNqKdXwrd2aOioflEWpnM90YhyeTpK+15RSs2Br6d8pjDzbU1
         wXlX0JydkAAKZIH0FI4S8evHfkkR+yNyRs0a5g1TZoK1MLHuuUpUtfJg7eQfsf9IoZk9
         pGO8xx1ChFG8unOE+p7Tm1CdYjlnudggHRLpwM7qlVhcI1SlcGMgFuTbDolt6ewNUwmk
         zf5wYE9mTRIS+SL2wivL8xCe7jNZ2lb4vu6TJWL75rrvG/FWowObmLyFvHbmcJd+J2p9
         oVkhAzDzQ5ybsCpODC3Kt6kHQ7E8rXom2AdX8ViMyQ9AwWVrps6o0md7E+q3RQpQ03wA
         eALA==
X-Gm-Message-State: AOJu0YzefprPmC22onSh0yXcF6YbbUMQKwXqDjPnGFxJ4UYLiAUsywJ7
	Z2LziXhymrhbDaS+4d1UvIOC3gTQx53LDe03Y69SEHCfWqWdmBZ907m1kAi6VmttTBaNvWgatxb
	RuBpqmFPHkwBl8J9jTp65rcysLRM=
X-Gm-Gg: ASbGncv9NLQlxowV9vO3VMCnlsdN+VY/k0d6WcEISmpTrJxah6WidTJj52X6FbsFGPG
	8wRgYC7m1eo4gym12vN4lL4O3XaxIbgbJ34to4JPgOmYa5VNDFiqdMy3yAEzoBK/Oj0urdmi9RB
	k+7uyMxduSwpuG3tSfMrOubrmwBZd5fCJ0Aud3QiHm
X-Google-Smtp-Source: AGHT+IGs4SKG6WmbdAaHZc6kv8r4MgsN76v6acBzXeehpw9vN6NJbn+MRRNWi5oyOSN8bzdky3vjkXuayt78YSE8jGQ=
X-Received: by 2002:a05:6808:199d:b0:3f7:8f77:2a9e with SMTP id
 5614622812f47-3fa2b11c797mr7196281b6e.20.1741881756518; Thu, 13 Mar 2025
 09:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250313154008.1877427-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20250313154008.1877427-1-Randy.MacLeod@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Mar 2025 09:02:09 -0700
X-Gm-Features: AQ5f1Jr2fZXUkTqtzJVdQwV70TGSU2ERsnfrVhoW92lG427sfdHoMJ4Cw4YkDC0
Message-ID: <CAMKF1sq=Qxu6w4YwA+xEX0AxrsyPjAjR1YtBUva90b65RcxKxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] tcmode-default: eliminate needless binutils
 version defaults
To: randy.macleod@windriver.com
Cc: openembedded-core@lists.openembedded.org, martin.jansa@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 16:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212789

this looks ok to me.

On Thu, Mar 13, 2025 at 8:40=E2=80=AFAM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> Manually setting preferred version is not required so remove that for bin=
utils.
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
> index 702fa4d75f..b43d5ffe8b 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -11,7 +11,6 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
>
>  GCCVERSION ?=3D "14.%"
>  SDKGCCVERSION ?=3D "${GCCVERSION}"
> -BINUVERSION ?=3D "2.44%"
>  GLIBCVERSION ?=3D "2.41%"
>  LINUXLIBCVERSION ?=3D "6.12%"
>  RUSTVERSION ?=3D "1.83%"
> @@ -30,11 +29,6 @@ PREFERRED_VERSION_libgfortran ?=3D "${GCCVERSION}"
>  PREFERRED_VERSION_nativesdk-gcc ?=3D "${SDKGCCVERSION}"
>  PREFERRED_VERSION_nativesdk-libgcc ?=3D "${SDKGCCVERSION}"
>  PREFERRED_VERSION_nativesdk-libgcc-initial ?=3D "${SDKGCCVERSION}"
> -PREFERRED_VERSION_binutils ?=3D "${BINUVERSION}"
> -PREFERRED_VERSION_binutils-native ?=3D "${BINUVERSION}"
> -PREFERRED_VERSION_binutils-cross-${TARGET_ARCH} ?=3D "${BINUVERSION}"
> -PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?=3D "${BINUVERSION}"
> -PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D=
 "${BINUVERSION}"
>
>  PREFERRED_VERSION_linux-libc-headers ?=3D "${LINUXLIBCVERSION}"
>  PREFERRED_VERSION_nativesdk-linux-libc-headers ?=3D "${LINUXLIBCVERSION}=
"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212787): https://lists.openembedded.org/g/openembedde=
d-core/message/212787
> Mute This Topic: https://lists.openembedded.org/mt/111682053/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

