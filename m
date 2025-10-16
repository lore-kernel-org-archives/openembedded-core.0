Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0D4CCD193
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 01:46:54 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.web11.3051.1760579211011512516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 18:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H0ydJEI/;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-636d5cefab2so247616d50.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 18:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760579210; x=1761184010; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3epPCptbWT89VXKepW1rfNzdWSRU/s6gVyDb1mqf24E=;
        b=H0ydJEI/9D3R3LGTlUsDDmkyuVvbchTTjjpv1KpWXFlBniqKoz1aBZCZUarzF+CjGs
         u6UgnOk6lWugQT7ye9r8HuUm9H5LyOChGQdsBLv2iqepDJ1FCHZz2zD33UcagjOe6R/5
         bgUdf6iMgSk1PEhLT+GibPCld9KWVIdq5r7DOSsK96JONwsmT17P0bqdHcZJiWSAQ0Bk
         n//AdB7oupUOu8o/cb1Nh19KxFNrl1GlQ67UK2+plsbzJLYugVhHIuElBmk8JcVACSyv
         ynCF0TfVRR9D1tNVK/iJr05PooeAo8+XQR0LqTreVy1P7JFBY9FcYzRXB3nkwhL9JXiP
         0Hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760579210; x=1761184010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3epPCptbWT89VXKepW1rfNzdWSRU/s6gVyDb1mqf24E=;
        b=hJhjmU1tMhnTvAy/kzUHkrl1zJFulsGC4cjCo64J5CT9gYjlIBktYIY8eAZXedmIYs
         jC4PMOvCCGTlR4O/ULisJQF3rMBccmfjwvPxpB9l29/cGqHt2rQottqu0jZyHIVFZVgS
         AaQFZe3AqsVt0chyUGJn7iJL9VZlaPScjqExUPdp9QQkZVb4VRpaU/wBDM54zluBgA9v
         2lg0BTf5K6ggTnoVGHksMiwAc4RU74/xKPcwmlOyzA/K9Jr1OLro1+ZooDYXi9vEcJTJ
         93ewJwwwcwA9buP9ZbMwisdv9gRKLH8UZ3vsZYFzyHXAr5tsnRaUnF8/sIpdfPKIQyTX
         y5YA==
X-Gm-Message-State: AOJu0YynB2n5N/zidLxnOa5KbZ9qPVJHxQr99ANShxatSI6fJhtRtjW/
	0pP2jYBvSLOkU1M9hxrMtT9nfzxMBW/MshQo9N0TQkgovaxoiTLD4/glJgRvPnefKyDg/vVAMTq
	gyl7oxj61eNt8KJR5syEME6Nu9NIlp1mgZrwd
X-Gm-Gg: ASbGncsFSLqVUbOK10Jq5oJyZ1m1Vlp1n6/9/7FMdLPBf4nabfa9xhCuE+4K/bm8XbK
	fecvaNqrJ1i0x4qQ2LfU26sR2eRMndnp+ttD5OCUcgKeenInO5zSoaPAu66S72JuhUPNYoMRKsX
	8jtsdYf/wvJRcIM834QlnIEzn72OQvsw4SXGhbXBuW6WdmWw26HV4BPZJtmd5FdQxBB6B606swT
	X+VsSO+CuOysusV4yaYZek4ytFhhiJjDFUVTQIRyBNlJ1EXxY61GqXBlCQJJjieLEWI9367AEI/
	uJTLw0jejXZ8E88ZD+XTzCYy53FFHjx1LGkJSvcGWhqJhqF1tXS1jh3sd8B0RzehyGwo9g+n6Ed
	wpRSGCg==
X-Google-Smtp-Source: AGHT+IGjXT8QAXyhERQ30J4HdlUoybvQIVY2JWJ563QZao4cxZeMhoToJhk7GVVd8XfdcGvMAEbcTJNcVQEqEjBgdKo=
X-Received: by 2002:a53:cb8b:0:b0:63c:f5a6:f314 with SMTP id
 956f58d0204a3-63cf5a7088dmr11000497d50.62.1760579209950; Wed, 15 Oct 2025
 18:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <20251016011104.145401-1-Qi.Chen@windriver.com>
In-Reply-To: <20251016011104.145401-1-Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Oct 2025 18:46:23 -0700
X-Gm-Features: AS18NWA1f94-skTzE1vqVuiD_-cGdoUX2tAPKEX0P6w-MK5RXIxYKiL3dKkW7E4
Message-ID: <CAMKF1sqeK6s0=7KHx12pr5+WRNtoB2hs9KO-P3WMhzEukLgXxg@mail.gmail.com>
Subject: Re: [OE-core][PATCH V2 1/3] musl: avoid redefinition error on ethhdr
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 01:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224912

On Wed, Oct 15, 2025 at 6:11=E2=80=AFPM Chen Qi via lists.openembedded.org
<Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> This __UAPI_DEF_ETHHDR macro should be defined right after
> the definition of 'struct ethhdr', otherwise, we'll get
> re-definition error in some case. This is because the
> lines under 'struct ethhdr' definition are header file inclusion
> lines and those header files might also check __UAPI_DEF_ETHHDR
> and define ethhdr, resulting in redefinition error.
>

I think this patch is not on sound footing. I do not like us patching
libc APIs unless its something
upstream accepts. We can cause unintended behavioural changes on yocto
based musl systems
in future and we have to support this forever.

Perhaps it's better to fix systemd even if the patch to systemd will
be a bit bigger.

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...if_ether.h-define-__UAPI_DEF_ETHHDR-.patch | 39 +++++++++++++++++++
>  meta/recipes-core/musl/musl_git.bb            |  3 +-
>  2 files changed, 41 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/musl/musl/0001-include-netinet-if_e=
ther.h-define-__UAPI_DEF_ETHHDR-.patch
>
> diff --git a/meta/recipes-core/musl/musl/0001-include-netinet-if_ether.h-=
define-__UAPI_DEF_ETHHDR-.patch b/meta/recipes-core/musl/musl/0001-include-=
netinet-if_ether.h-define-__UAPI_DEF_ETHHDR-.patch
> new file mode 100644
> index 0000000000..800273612d
> --- /dev/null
> +++ b/meta/recipes-core/musl/musl/0001-include-netinet-if_ether.h-define-=
__UAPI_DEF_ETHHDR-.patch
> @@ -0,0 +1,39 @@
> +From 5ab64f7e08ea0325d83d446dd4015f82b4c179dd Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Mon, 29 Sep 2025 21:39:01 +0800
> +Subject: [PATCH] include/netinet/if_ether.h: define __UAPI_DEF_ETHHDR ea=
rly
> +
> +After 'struct ethhdr' is defined, we should immediately define
> +__UAPI_DEF_ETHHDR. Because the following lines are header inclusion
> +lines which might introduce header files checking __UAPI_DEF_ETHHDR.
> +If we don't define this macro early, we will get redefinition error.
> +
> +Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2025/09/=
30/1]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + include/netinet/if_ether.h | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/include/netinet/if_ether.h b/include/netinet/if_ether.h
> +index 3479f511..b1646f6f 100644
> +--- a/include/netinet/if_ether.h
> ++++ b/include/netinet/if_ether.h
> +@@ -117,6 +117,7 @@ struct ethhdr {
> +       uint8_t h_source[ETH_ALEN];
> +       uint16_t h_proto;
> + };
> ++#define __UAPI_DEF_ETHHDR       0
> +
> + #include <net/ethernet.h>
> + #include <net/if_arp.h>
> +@@ -144,6 +145,4 @@ do { \
> +       (enaddr)[5] =3D ((uint8_t *)ipaddr)[3]; \
> + } while(0)
> +
> +-#define __UAPI_DEF_ETHHDR       0
> +-
> + #endif
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/=
musl_git.bb
> index 3f5fa37fba..254774f57e 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -14,7 +14,8 @@ SRC_URI =3D "git://git.musl-libc.org/musl;branch=3Dmast=
er \
>             file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.pa=
tch \
>             file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-t=
o-l.patch \
>             file://0001-Update-syscalls-for-r32-rv64-from-kernel-6.4-thro=
ugh.patch \
> -          "
> +           file://0001-include-netinet-if_ether.h-define-__UAPI_DEF_ETHH=
DR-.patch \
> +           "
>
>  PROVIDES +=3D "virtual/libc virtual/libiconv virtual/libintl virtual/cry=
pt"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224909): https://lists.openembedded.org/g/openembedde=
d-core/message/224909
> Mute This Topic: https://lists.openembedded.org/mt/115782554/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

