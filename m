Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD75C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 15:03:16 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.95137.1783090986766283634
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 08:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eO8o8rKg;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b1710405so3731475e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 08:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783090985; x=1783695785; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZuS5MRfq2cdh4i8A7IKodrBManhSlxuKZUqwPpjtxrg=;
        b=eO8o8rKgfPKYC8aNAuITMeLyroK2ilJKzud0wu5Dv0ACYLflKzPXfuMxRVM/7bMxaw
         oJXnncBbsl9PlTG+6LbKlmzfT0HHx86VWKnr5RWAFSmfBSS3ElSynsO52CGk2RL4IY/O
         NnQJvjBVeOkvDi2JmRSLbGm8PnT9/EP3A5peU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783090985; x=1783695785;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZuS5MRfq2cdh4i8A7IKodrBManhSlxuKZUqwPpjtxrg=;
        b=GuKYkNRTPDjLb8RNbzCapGaa410xg+D+TfxeKY/4nhipYTXUYSJsKJQ1QegW8Sc8E1
         nhsUKFPrwT6quDw082G/SHuuF1nErhA6gPeYX+b7X7QUkgC4vviLvIc0AZ3iq2iwcu/Z
         tlEFzPJ9S5wmSzWI1Tkq7YQZAry0jFSGoSaO6e5I2MvBhLBsre8b8ffJnIJapLWBvV0X
         6t0sYa2g2cXDpBnQhvt4AJcMeNjFJWWQ3tPvGJcwMzCOMdF5urIuYRcIf6BSYTsqJGqo
         wppFwaYM98Yy9k9vF/rw53pbWqoJaWVRLBnhJiEiaklEFuumGccPcjWHgQx1gNOt3h/k
         e5zA==
X-Forwarded-Encrypted: i=1; AFNElJ/Q3k+rmvg9m2ppWDs9n528ifD7KccMOUaABhvMDCH0QmZHiD71lp3q0bMcLo9cQa7VGHgphTqKDflDxNRZo/Tl4A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzSRzlw4Ac78/1Q8kuFr3+6GR+kFdHLSzFfbcl1ExzEZ/7RVd3c
	AQ8jLk9iu86Rvv/YS+EbsCGb8Kb46wsKDDcJpHX3dGyBWabgiOMpCf9Hut3rNu8Redg=
X-Gm-Gg: AfdE7cns6HugNi2lnN0XVryULahcEQsn+UOT5gyZyhEfmKoAQgq6E7kdL7JGAZpAwuW
	XNuLk68KI71J/UKC1EngY3ZienFYHK0cRRXgC72T7R0vbuGcyVd+ILvDb2ossP9SB/XnRuV5Ayx
	Ivez9ji2nnrgRCG+bmeI9mAOsGAquF62/ELEnHXiqMwEmI5nt3tbrEwmqzEHWrbwGrhN7/XBXr3
	p/RNcJg0s/IUxkPeR2F/UsZJr6jVkWa9/ZaZorbnx022/FSjmKR0qXpSDATD894LXxvNnoae8SZ
	VFZBUV5BwQdQS6+7DQDs9eTaam9dfxDQLzTGH7hZq77kV80Lo5q3fe71poU1+sy2lCZdNl24y6g
	U+QI1dyOevhufjxgO0Z/zGj5PVNyBAyve0ThsCWanBSxgRkbK9b72bLsoqTssCxw1Yq+oUM/mOx
	Q8CXOsJ9rc3KskdkLNZ/LsyIvJn29JR+DnlZk1uRlQVHPetNkz43MAn8XDMI1V7v/PwvNcJBCdb
	fM0iEUae3kSMHer
X-Received: by 2002:a05:600c:35c1:b0:493:cfc8:12e7 with SMTP id 5b1f17b1804b1-493d0f3976emr2076235e9.25.1783090984890;
        Fri, 03 Jul 2026 08:03:04 -0700 (PDT)
Received: from localhost (2a01cb001331aa0075403fb2c9c4e210.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:7540:3fb2:c9c4:e210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba97csm138205085e9.12.2026.07.03.08.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 08:03:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 17:03:03 +0200
Message-Id: <DJP101LJZEXY.1Q8JDYPDZJ94H@smile.fr>
Subject: Re: [wrynose] [PATCH] libssh2: fix CVE-2026-55199
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260629081915.222139-1-daniel.turull@ericsson.com>
In-Reply-To: <20260629081915.222139-1-daniel.turull@ericsson.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 15:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240121

On Mon Jun 29, 2026 at 10:19 AM CEST, daniel.turull wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Backport patch to fix CVE-2026-55199.
> https://nvd.nist.gov/vuln/detail/CVE-2026-55199
>
> Upstream fix:
>   https://github.com/libssh2/libssh2/commit/17626857d20b3c9a1addfa45979da=
dcee1cd84a4
>
> Tested with ptest:
> Before: PASSED: 3, FAILED: 0, SKIPPED: 0
> After: PASSED: 3, FAILED: 0, SKIPPED: 0
>
> Reviewed-by: Anders Heimer <anders.heimer@est.tech
Hello

The Reviewed-by: line is missing a '>' at the end.
I've fixed it.

Regards,

> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  .../libssh2/libssh2/CVE-2026-55199.patch      | 44 +++++++++++++++++++
>  .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-55199.p=
atch
>
> diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-55199.patch b/=
meta/recipes-support/libssh2/libssh2/CVE-2026-55199.patch
> new file mode 100644
> index 0000000000..81815486ad
> --- /dev/null
> +++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-55199.patch
> @@ -0,0 +1,44 @@
> +From b5cb1c1781ba5f275485f65855d61faaba6542b2 Mon Sep 17 00:00:00 2001
> +From: TristanInSec <tristan.mtn@gmail.com>
> +Date: Wed, 15 Apr 2026 14:51:08 -0400
> +Subject: [PATCH] packet: check `_libssh2_get_string()` return in `EXT_IN=
FO`
> + handler
> +
> +The `SSH_MSG_EXT_INFO` handler discards the return values from
> +`_libssh2_get_string()` when parsing extension name/value pairs. When
> +the buffer is exhausted before all claimed extensions are parsed,
> +the loop continues with no-op iterations until `nr_extensions` reaches
> +zero.
> +
> +The `nr_extensions >=3D 1024` cap limits the worst case, but the loop
> +should still break on parse failure for correctness and consistency
> +with other parsers in this file (e.g. `SSH_MSG_CHANNEL_OPEN`,
> +`SSH_MSG_KEXINIT`) that check `_libssh2_get_string()` return values.
> +
> +Closes #1864
> +
> +CVE: CVE-2026-55199
> +Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/176=
26857d20b3c9a1addfa45979dadcee1cd84a4]
> +
> +Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> +---
> + src/packet.c | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/packet.c b/src/packet.c
> +index 6da14e9f..ebaddae5 100644
> +--- a/src/packet.c
> ++++ b/src/packet.c
> +@@ -868,8 +868,10 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsi=
gned char *data,
> +=20
> +                     nr_extensions -=3D 1;
> +=20
> +-                    _libssh2_get_string(&buf, &name, &name_len);
> +-                    _libssh2_get_string(&buf, &value, &value_len);
> ++                    if(_libssh2_get_string(&buf, &name, &name_len))
> ++                        break;
> ++                    if(_libssh2_get_string(&buf, &value, &value_len))
> ++                        break;
> +=20
> +                     if(name && value) {
> +                         _libssh2_debug((session,
> diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipe=
s-support/libssh2/libssh2_1.11.1.bb
> index 5ffc40b8fc..2407ed34d9 100644
> --- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
> +++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
> @@ -12,6 +12,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.=
gz \
>             file://0001-Return-error-if-user-KEX-methods-are-invalid.patc=
h \
>             file://CVE-2026-7598.patch \
>             file://CVE-2026-55200.patch \
> +           file://CVE-2026-55199.patch \
>             "
> =20
>  SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a5=
6b0f109cabf658f7"


--=20
Yoann Congal
Smile ECS


