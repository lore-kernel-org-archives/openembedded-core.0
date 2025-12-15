Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B1DD41D74
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 12:02:24 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47000.1765800140789567750
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 04:02:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F5zWa31q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477563e28a3so25677165e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 04:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1765800139; x=1766404939; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NxG4t+AbBFWr+cL71c+DZS88Tw6P4YVkevRezAMapU=;
        b=F5zWa31qFxM0cBj3mpKm8KayKLlfVACQBgcsQutYLvToYt7T1kQoJ9M1fMXqk82AZc
         UHgKaqz2qJ0TimFkPbr+ixpyfM3B2q6fSks6LFansFch2q5vhxRBHJxFhHgp4l+C6x14
         0T/DkmxtjmPRkKopW12ilZjwFxFBy7etGMOOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765800139; x=1766404939;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9NxG4t+AbBFWr+cL71c+DZS88Tw6P4YVkevRezAMapU=;
        b=GCmxNUdvbVDMQMm6kTn8IW2liUg77dpodYHU2aF7+gFp5+2PslXBK0c8P9IhYA6s1X
         /1Pps8aTHM3oFHT/YfaumjSDvRi+pdvpYJEvJ0vEAMNXCHBLqdfIVz20I1Z33nbIY4hY
         i73fsCzaBda++OB7XWQWALeBEiIi5pJrWugQurqVhzd+XLc7p2YivLB9QjrPnvT4cN4x
         Dr52tUfWmYFa7cpQwqhnOGLndsC5V6ElsRMzV0IIrGLl+FhNspIJ9ccVtNKcgBwCllRw
         cMez/CVWlGodCSiv2NEalz4mIBf2CNqB4asBDwV3mE8+AFpj3AlDT63g8z+leMWNmvOv
         PKpw==
X-Forwarded-Encrypted: i=1; AJvYcCW8brsb7ZmWIQ1xvMFQVcNyEBFDMr8sA7V0YAI1bcr7AVMhtEyjNFPvJqgVeN3C6aRnkZwyrAE+WYLPj8L7h2W7BQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzlq1gN0G787N9oWVoQTpLIYnOEKDa5ZdFWpe5Ir0d+0DgfhV43
	NBtDSsHryTeM6fv2LmMBZQQ3tfPIia9UjM6SVLAd9DLGoBQ9GqdgM+ACuWBYr1WY8BI=
X-Gm-Gg: AY/fxX4Mn5qIPwmYBpCBQYq3YsHLkoOlXBvJgw6xJXpEj0RjrKntzGgbe/+RitxC85V
	Rq/Acar5LkP1sdGb4SwOU9QRvlbQRzX3H7n0rJt9y54p35z3WZddQP9Sa28fB0k+9WB2exztg6D
	M4xaFcJxuTyrFoJbLFt4peJz0g5LK5ku1jCptgXTeFHD5mkUFYzNCD/evRLJqqKEUdDGDntfBkl
	GnOFX6cXWcOqJRM2oBQxIxz0xqjDtlmDHEwbBi95G0tuCb3OFONBuaAL+B1IkHhSUR9iU0Btupu
	mBOix7yiYN/SlarNojfcsobc0s13PXPiW/UInNwpd3PNF45sE7wS6N4veiIqcT27pA2rGuZueJh
	noup3gf97GV5Zyfnwvm0B/yHR2rD57LXrpUsCicSEHCsYKRWJtofjAJbbJfufL0lcq1++Gmkk52
	9iUxEmODwJa6teOk1hQ/b0kpWXfBhT2PZ94ns//pLnIQVTbdWcvDDC5Ef0HdwRrcDJ8Ix/nMZlW
	WE=
X-Google-Smtp-Source: AGHT+IGJ3haWG565NIHoV+ksiGIAEVF5FiNh6UaRuT+lPdL48reeI3e/yvRHGYwE7HuAoB59UkUDow==
X-Received: by 2002:a05:600c:8887:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-47a8fa11bb2mr82899975e9.2.1765800138967;
        Mon, 15 Dec 2025 04:02:18 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fad4:125a:6e75:b598? ([2001:8b0:aba:5f3c:fad4:125a:6e75:b598])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f8f3894sm188022955e9.15.2025.12.15.04.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 04:02:18 -0800 (PST)
Message-ID: <101da462a2254d31ad69f142189641958872a892.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 3/5] debug_build.inc: override
 INHIBIT_SYSROOT_STRIP for cross and native
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: hongxu.jia@eng.windriver.com, peter.kjellerstedt@axis.com, 
	randy.macleod@windriver.com, raj.khem@gmail.com, 
	openembedded-core@lists.openembedded.org, mathieu.dubois-briand@bootlin.com
Date: Mon, 15 Dec 2025 12:02:17 +0000
In-Reply-To: <20251010075258.2161972-3-hongxu.jia@windriver.com>
References: <20251010075258.2161972-1-hongxu.jia@windriver.com>
	 <20251010075258.2161972-3-hongxu.jia@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 12:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227732

On Fri, 2025-10-10 at 15:52 +0800, hongxu via lists.openembedded.org wrote:
> The debug_build.inc is used to collect debug build configuration,
> override INHIBIT_SYSROOT_STRIP for cross and native bbclass when DEBUG_BU=
ILD
> is enabled
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
> =C2=A0meta/classes-recipe/cross.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 3 +--
> =C2=A0meta/classes-recipe/native.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 3 +--
> =C2=A0meta/conf/distro/include/debug_build.inc | 4 ++++
> =C2=A03 files changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/classes-recipe/cross.bbclass b/meta/classes-recipe/cros=
s.bbclass
> index 9abf166e50..ede04950b5 100644
> --- a/meta/classes-recipe/cross.bbclass
> +++ b/meta/classes-recipe/cross.bbclass
> @@ -23,8 +23,7 @@ HOST_CC_ARCH =3D "${BUILD_CC_ARCH}"
> =C2=A0HOST_LD_ARCH =3D "${BUILD_LD_ARCH}"
> =C2=A0HOST_AS_ARCH =3D "${BUILD_AS_ARCH}"
> =C2=A0
> -# No strip sysroot when DEBUG_BUILD is enabled
> -INHIBIT_SYSROOT_STRIP ?=3D "${@oe.utils.vartrue('DEBUG_BUILD', '1', '', =
d)}"
> +INHIBIT_SYSROOT_STRIP ??=3D ""
> =C2=A0
> =C2=A0export lt_cv_sys_lib_dlsearch_path_spec =3D "${libdir} ${base_libdi=
r} /lib /lib64 /usr/lib /usr/lib64"
> =C2=A0
> diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/nat=
ive.bbclass
> index 7d1fe343fa..b3411d20ca 100644
> --- a/meta/classes-recipe/native.bbclass
> +++ b/meta/classes-recipe/native.bbclass
> @@ -118,8 +118,7 @@ PATH:prepend =3D "${COREBASE}/scripts/native-intercep=
t:"
> =C2=A0# reused if we manipulate the paths.
> =C2=A0SSTATE_SCAN_CMD ?=3D "${SSTATE_SCAN_CMD_NATIVE}"
> =C2=A0
> -# No strip sysroot when DEBUG_BUILD is enabled
> -INHIBIT_SYSROOT_STRIP ?=3D "${@oe.utils.vartrue('DEBUG_BUILD', '1', '', =
d)}"
> +INHIBIT_SYSROOT_STRIP ??=3D ""
> =C2=A0
> =C2=A0python native_virtclass_handler () {
> =C2=A0=C2=A0=C2=A0=C2=A0 import re
> diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/=
include/debug_build.inc
> index c006093345..1062326417 100644
> --- a/meta/conf/distro/include/debug_build.inc
> +++ b/meta/conf/distro/include/debug_build.inc
> @@ -40,3 +40,7 @@ EXTRA_OECONF:append:pn-nativesdk-debugedit =3D " --disa=
ble-inlined-xxhash"
> =C2=A0lcl_maybe_fortify:pn-vim =3D ""
> =C2=A0
> =C2=A0CXXFLAGS:append:pn-vulkan-validation-layers =3D " -DXXH_NO_INLINE_H=
INTS=3D1"
> +
> +# No strip sysroot for cross and native
> +INHIBIT_SYSROOT_STRIP:class-cross ?=3D "1"
> +INHIBIT_SYSROOT_STRIP:class-native ?=3D "1"

One key question is whether this still makes sense?

In most cases you want to debug target binaries, or native, or cross
but it would be unusual to want to do all at the same time other than
for test builds. In test builds, you can just add the extra config.

Perhaps we should therefore just remove these?

Cheers,

Richard

