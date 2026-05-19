Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B31BFCD4F54
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 22:36:48 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48.1779230203843545122
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 15:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fi/N1p5Z;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so2431635f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 15:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779230202; x=1779835002; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4dxIj2+HF8gMj3rYHk8NQFn+25mJzqo33CQ3oh5ZAQ=;
        b=fi/N1p5Zy4odxmIqlOsb8MXaMeUAioIt/9bmMghCg4/kROycutihuFY0yo2HhusFvX
         /pxEoSDqcK5Iv8E0IzKGyfZYHbZkgW0FBYmfMnbaNHxyzuGBJk3YjlYSiQqihw4UOlSl
         lJFkw4E/14cerkGdm4APnh3ZdtK9DTLpihdb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779230202; x=1779835002;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n4dxIj2+HF8gMj3rYHk8NQFn+25mJzqo33CQ3oh5ZAQ=;
        b=RfRzeoi9j7CeChbIdDcd57EZ1BO7DkmTBHmE3bt0veqAGTVlOgH6QhHbJx9Tg5/Nv9
         o0+pxGuOIN/kxLk63JywWRwvuZ0CD/VCSk3DTudLCZ2s3VZwPZKvJSS6qynYA/6+HNZ9
         HfOSi8pMTiOpbpiJdNwCrgILBclNmzZrJ3Vzcs/1wTeWFRPqvu6Pfb3ZlpMqlLrB2kqT
         UvR7o2RZvXfoLfqqSfDoX0mZBV1ckRWH079dPN2rpQVgslbIFONIGqi6uEPmPgiatTHg
         zjXD54GccowT2F4jXQmQhAcD7bTQoQhySIkgcdwMp5ekF5Dw60Lkg31us7PVGScb5kP7
         fhAg==
X-Forwarded-Encrypted: i=1; AFNElJ+gr4rkE9ovUG9b3n0dC7862JtIqU9mzt6mCULvEWwuiHvRbKkE7mcOxEhwrD73lp+sB9dcEql6pRgIImOI74gDGA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxsiZVyMTBKLZwQsBEfEguYBemV8MAcEz0IJ3VuDuGsQy+uzQav
	1ZutdgbVaITYNjB5VQ2VPU7oO9c060c+GIOg+Vq2ousms3iXVkoKh34lmzuYhEAGRjvsQ1m5ZnR
	5KPUX
X-Gm-Gg: Acq92OGHlAj7gb6Xj+ZdHe2PykbSEM4Kc0EWc/m5kKF+DkVsbgOOBUF85XGfvCO6rlH
	TXgocAcLD2Au/E9U90+6pI63wYuOaShQ/frBVXbshkjB6BroKgdeQE5b2/PQ5VjauZK55x2l89D
	n0KihENHIkNRWQ6B9N1YDJiGhloGEZudTIWBxad6ji9A76TCISKNdMTojDOqQzdDFb8rAvWzTFs
	U8rg959RW7Q/eFAeSASzJ9AIFJXa3OKHjnEa1AIUs4dgH/p03GXVrET5wHRDUursk7937lJ4Pfq
	fQAaMPdHw+vzVyITyBvLgIUiYc+qb3Q9iOxoqyabpmo/gwPFHFzaDGO7etVR+SGC5ZjG1zXQXIk
	UbY9cEBIszE5PJ5XLkgNsscyPprhv4fqYhEaVYmGK5A8xhnvx489sKgj2otF8/vP6C0yMbUOSfV
	kJCFNbFML+yiU/26V4tNopssCyU9rB+rUZyiaX7tYs5oUTonizgj9ladcFLNJi9PCRrJpBVVsyy
	iI8tu4SqTLho/0=
X-Received: by 2002:a5d:5d10:0:b0:45a:dd7a:e33c with SMTP id ffacd0b85a97d-45e5c596c14mr31927887f8f.33.1779230201978;
        Tue, 19 May 2026 15:36:41 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1a22csm48126674f8f.19.2026.05.19.15.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 15:36:41 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 00:36:40 +0200
Message-Id: <DIN0GUE7HWMJ.770K6WDGCV6K@smile.fr>
To: <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 2/2] busybox: fix CVE-2026-29004
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260519052711.3732145-1-Qi.Chen@windriver.com>
 <20260519052711.3732145-2-Qi.Chen@windriver.com>
In-Reply-To: <20260519052711.3732145-2-Qi.Chen@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 22:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237345

On Tue May 19, 2026 at 7:27 AM CEST, Chen Qi via lists.openembedded.org wro=
te:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Backport two patches to fix CVE-2026-29004.
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2026-29004
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---

Hello,

As far as I can tell, this CVE-2026-29004 also applies to master (in
particular, it does not looked fixed in the recent 1.38.0 upgrade).

I can't merge this on wrynose until a fix is merged on master.
Can you send the equivalent fix to master?

Thanks!

>  .../busybox/busybox/CVE-2026-29004-01.patch   | 42 +++++++++++++++++
>  .../busybox/busybox/CVE-2026-29004-02.patch   | 47 +++++++++++++++++++
>  meta/recipes-core/busybox/busybox_1.37.0.bb   |  2 +
>  3 files changed, 91 insertions(+)
>  create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-29004-01.p=
atch
>  create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-29004-02.p=
atch
>
> diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch b/=
meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch
> new file mode 100644
> index 0000000000..8ce4858adc
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch
> @@ -0,0 +1,42 @@
> +From d9a718cc17535c31d38f31fccb904a30e823166d Mon Sep 17 00:00:00 2001
> +From: Denys Vlasenko <vda.linux@googlemail.com>
> +Date: Thu, 12 Mar 2026 07:25:38 +0100
> +Subject: [PATCH 1/2] udhcpc6: fix buffer overflow
> +
> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> +
> +CVE: CVE-2026-29004
> +
> +Upstream-Status: Backport [https://github.com/vda-linux/busybox_mirror/c=
ommit/42202bfb1e6ac51fa995beda8be4d7b654aeee2a]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + networking/udhcp/d6_dhcpc.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/networking/udhcp/d6_dhcpc.c b/networking/udhcp/d6_dhcpc.c
> +index 79cef1999..d13b05829 100644
> +--- a/networking/udhcp/d6_dhcpc.c
> ++++ b/networking/udhcp/d6_dhcpc.c
> +@@ -351,15 +351,15 @@ static void option_to_env(const uint8_t *option, c=
onst uint8_t *option_end)
> + 			addrs =3D option[3] >> 4;
> +=20
> + 			/* Setup environment variable */
> +-			*new_env() =3D dlist =3D xmalloc(4 + addrs * 40 - 1);
> ++			*new_env() =3D dlist =3D xmalloc(4 + addrs * 40 + 1);
> + 			dlist =3D stpcpy(dlist, "dns=3D");
> + 			option_offset =3D 0;
> +=20
> +-			while (addrs--) {
> ++			while (addrs-- !=3D 0) {
> + 				sprint_nip6(dlist, option + 4 + option_offset);
> + 				dlist +=3D 39;
> + 				option_offset +=3D 16;
> +-				if (addrs)
> ++				if (addrs !=3D 0)
> + 					*dlist++ =3D ' ';
> + 			}
> +=20
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch b/=
meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch
> new file mode 100644
> index 0000000000..734f0bbbdb
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch
> @@ -0,0 +1,47 @@
> +From 1e14c5c577a7bd46f42315e9bc445419770041a7 Mon Sep 17 00:00:00 2001
> +From: Denys Vlasenko <vda.linux@googlemail.com>
> +Date: Thu, 12 Mar 2026 13:23:48 +0100
> +Subject: [PATCH 2/2] udhcpc6: check the size of D6_OPT_IAPREFIX option
> +
> +function                                             old     new   delta
> +option_to_env                                        694     711     +17
> +
> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> +
> +CVE: CVE-2026-29004
> +
> +Upstream-Status: Backport [https://github.com/vda-linux/busybox_mirror/c=
ommit/d368f3f7836d1c2484c8f839316e5c93e76d4409]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + networking/udhcp/d6_dhcpc.c | 7 +++++--
> + 1 file changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/networking/udhcp/d6_dhcpc.c b/networking/udhcp/d6_dhcpc.c
> +index d13b05829..1851cee2a 100644
> +--- a/networking/udhcp/d6_dhcpc.c
> ++++ b/networking/udhcp/d6_dhcpc.c
> +@@ -287,8 +287,8 @@ static void option_to_env(const uint8_t *option, con=
st uint8_t *option_end)
> +  * |                        valid-lifetime                         |
> +  * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
> +  */
> +-			/* Make sure payload contains an address */
> +-			if (option[3] < 24)
> ++			/* Make sure payload exists */
> ++			if (option[3] < (16 + 4 + 4))
> + 				break;
> +=20
> + 			sprint_nip6(ipv6str, option + 4);
> +@@ -332,6 +332,9 @@ static void option_to_env(const uint8_t *option, con=
st uint8_t *option_end)
> +  * |               |
> +  * +-+-+-+-+-+-+-+-+
> +  */
> ++			/* Make sure payload exists */
> ++			if (option[3] < (4 + 4 + 1 + 16))
> ++				break;
> + 			move_from_unaligned32(v32, option + 4 + 4);
> + 			v32 =3D ntohl(v32);
> + 			*new_env() =3D xasprintf("ipv6prefix_lease=3D%u", (unsigned)v32);
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-c=
ore/busybox/busybox_1.37.0.bb
> index 4790899684..a6abfa2598 100644
> --- a/meta/recipes-core/busybox/busybox_1.37.0.bb
> +++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
> @@ -64,6 +64,8 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV=
}.tar.bz2;name=3Dtarball \
>             file://0001-tar-strip-unsafe-hardlink-components-GNU-tar-does=
-th.patch \
>             file://0002-tar-only-strip-unsafe-components-from-hardlinks-n=
ot-.patch \
>             file://CVE-2024-58251.patch \
> +           file://CVE-2026-29004-01.patch \
> +           file://CVE-2026-29004-02.patch \
>             "
>  SRC_URI:append:libc-musl =3D " file://musl.cfg"
>  SRC_URI:append:x86-64 =3D " file://sha_accel.cfg"


--=20
Yoann Congal
Smile ECS


