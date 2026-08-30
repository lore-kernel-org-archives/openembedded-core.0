Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16017C61DD9
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 17:14:57 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12302.1788110088855261697
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 10:14:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aZ34IemZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48436668d20so372759f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 10:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788110087; x=1788714887; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7GQpu5U5+/0Ul1HQuNne7itEw0NmKUgwhQ9KIawiCk=;
        b=aZ34IemZ1+j0Zqo8W9rvNBOnc6R8dqAdD3ybUXhieygZCLp0WxNq2clpFG/CKRr8HF
         WRPZfjHGAh2h/B/vbfk6Bw0q7g1mr5rerCK/jE2totggdQudOo1LPpdeWDOyeQc9LoVs
         d3bbe6sJ8WcQ7rZ9N27l3GHkAnml4yJ8Foi4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788110087; x=1788714887;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h7GQpu5U5+/0Ul1HQuNne7itEw0NmKUgwhQ9KIawiCk=;
        b=NG6b43dSBUpeMf0MtaxrjFqWkvSrYs4lKp+UJ5ir5cOzzGk/r2NZFTHwLy6FYX51xG
         EskY+doPQsj5VxYVRubyysmWc0olTlpKw/LLNvBjbnGKgWxMRQHfqh3IZJEaUnHDwUrJ
         GBZEB+Nn0wH8XDTHjzizH9UF7QCN35pk2qT9DV16dM1gp+zeHtT9v4W5s5z7pebDGDpH
         CVJ+EHeb0FZwqxkQeg0ywWprii/nHee/oQURvAbZaloCdQMkwHaJVpzDA+OTX15W1aAJ
         Ga2ML5P4aYgJg80CM/qGaecmJliCHiVL7fUKP3ZzUJ6/o7LckT+c02yL5P6LE6PUl4vA
         vWQg==
X-Forwarded-Encrypted: i=1; AHgh+RrqPKwbHdwFDx5iz04sokP0PN2O7hHZZtlYap9JzIeuaUx/VmOidtEe2RhZ548T7FdR3ylZLkJPOh3TksIiIsTLwQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++kFu2G07cC2qomveiklyF3dPHRkpja74VeV+QGT/jNbG3DEyP/o
	tVIprK/wBTNpbM2W6K5knXcjFIyv2/+PgmCIY4Vt5+4gcdmwmDDp2TVIUDJgFTEvE9w=
X-Gm-Gg: AR+sD11rtgMAvc5tMOiKmX6JZqJtGZl3vkGwIknuC59NIgkYyOnirWOnljf0u5KAIjU
	SuWgY7sVennX4rjLwsvSWVmQe42fgpHAqN5AkB8//DJYeTltp71psT1KhjdU0jVpmsSmc+0ABCp
	wN9X7kZAKPyiq2Dz2UwRQjiY5/q9EWFxosDlSQYDLFdXgokZWWkbE2+SzENIwrN6mjkJlwl/Kka
	K7HOJBKFq+IEIii+tkthG4TMDkmL0rRNR8rhzBI7MuCGU35tBXVcE56KAxlumT3wn+aIlPWj6jY
	fDuh11R+vaAtaLuuMwsBVsgkGMM39uXOVR8Nw56yAgKPnKGoIKER28GG57FfMTcIl60YJCIk5tL
	4VPcJ5NtTHBeLj3YB+dgkPNDoCOQYvyZfxk1+CEbKxsfcb+amm1CqFKNSuPD4lrfEcLd+JXeLGe
	h+1rS1/3+DcWeKEMZ4wA4x+ShjMZPMH3D69BK6G8qzLbYMKtfmEbxofjtmZqihS2hnedmc4r6Fc
	/sGcYk33qik4XaMDqPCYBHzThMAoaRlllux7owdPSluQ249I+kAn1pxYQuPwrI=
X-Received: by 2002:a05:600c:5291:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49ccee216c1mr150375425e9.16.1788110086815;
        Sun, 30 Aug 2026 10:14:46 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb2794dsm17932842f8f.25.2026.08.30.10.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 10:14:46 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 30 Aug 2026 19:14:46 +0200
Message-Id: <DL2G4HBXZK8O.2BJXQFIJGNX9C@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] time64: enable 64-bit
 time/file-offset flags for 32-bit nativesdk
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.tatrai.ext@siemens.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260826073701.367061-1-peter.tatrai.ext@siemens.com>
In-Reply-To: <20260826073701.367061-1-peter.tatrai.ext@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 17:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244688

On Wed Aug 26, 2026 at 9:37 AM CEST, Peter via lists.openembedded.org Tatra=
i wrote:
> From: Peter Tatrai <peter.tatrai.ext@siemens.com>
>
> When SDKMACHINE is set to i686 or i586, nativesdk binaries are compiled
> as 32-bit. Without -D_TIME_BITS=3D64 and -D_FILE_OFFSET_BITS=3D64, stat()
> and time-related syscalls use 32-bit types, causing EOVERFLOW on
> filesystems with large inode numbers (e.g. container overlay filesystems)
> and Y2038 issues.
>
> Add SDK_CC_ARCH appends for class-nativesdk:i686 and class-nativesdk:i586
> using GLIBC_64BIT_TIME_FLAGS, mirroring how target architectures are
> handled.
>
> Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>"
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit d9f62a45555673842021d5746437e66c40d3f3cc)
> Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
> ---
>  meta/conf/distro/include/time64.inc | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/inclu=
de/time64.inc
> index dd29105db4..7f02774839 100644
> --- a/meta/conf/distro/include/time64.inc
> +++ b/meta/conf/distro/include/time64.inc
> @@ -32,6 +32,16 @@ GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio =3D ""
>  # libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
>  GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers =3D ""
> =20
> +# Apply the same flags to nativesdk packages when building for a 32-bit =
SDK
> +# host (i686, i586).
> +SDK_CC_ARCH:append:class-nativesdk:i686 =3D "${GLIBC_64BIT_TIME_FLAGS}"
> +SDK_CC_ARCH:append:class-nativesdk:i586 =3D "${GLIBC_64BIT_TIME_FLAGS}"
> +
> +# nativesdk-pseudo wraps both 32-bit and 64-bit libc calls; enabling LFS=
 flags
> +# causes duplicate symbol errors (e.g. creat64, fopen64) on i686 because=
 glibc
> +# aliases the non-LFS names to their 64-bit counterparts via macros.
> +GLIBC_64BIT_TIME_FLAGS:pn-nativesdk-pseudo =3D ""
> +
>  # Caused by the flags exceptions above
>  INSANE_SKIP:append:pn-gcc-sanitizers =3D " 32bit-time"
>  INSANE_SKIP:append:pn-glibc =3D " 32bit-time"

Hello,

This patch does break some builds:
qemux86 debian11-vk-1 scarthgap completed at 2026-08-30 14:36:35+00:00
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/30/builds/4505
qemuarm-oecore rocky8-vk-1 scarthgap completed at 2026-08-30 14:06:41+00:00
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/40/builds/4502
buildtools ubuntu2404-vk-1 scarthgap completed at 2026-08-30 14:00:30+00:00
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/43/builds/4546
qemux86-64 debian12-vk-4 scarthgap completed at 2026-08-30 14:14:14+00:00
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/68/builds/4636

(And, also, I suspect meta-mingw ubuntu2404-vk-3 scarthgap completed at 202=
6-08-30 13:35:59+00:00
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/7/builds/3475)

I've reproduced this locally:
With SDKMACHINE=3D"i686"
"bitbake nativesdk-glibc" fails with this patch and succeed without.

The error message boils down to:
| Error: symbol '__sigtimedwait64' is already defined.

Can you look into this?

Thanks!
--=20
Yoann Congal
Smile ECS


