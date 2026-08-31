Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6FDC61DE2
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 07:13:13 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24308.1788160389452916583
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 00:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NiHX4pfY;
 spf=pass (domain: smile.fr, ip: 209.85.218.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2020421077so465733266b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 00:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788160387; x=1788765187; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uw94zncm6i9SN2yrIoWjWJHFfLPrzskKcQ0UIR6pHbg=;
        b=NiHX4pfYmIxjp8GFmcQf9G62Xiif36UmPzusfP20eyosi2CjegFPNAb/lNizQzpVps
         eRIVzcY9pfjjEiKui6DHlsNwNtmoT56Oj5W6DXl2yT6nHgb/uquT6WG22ngb9KUv/Gol
         NCqwMt4P6OIOFQRQnQL+d5YN5ryFupRbNfNag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788160387; x=1788765187;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uw94zncm6i9SN2yrIoWjWJHFfLPrzskKcQ0UIR6pHbg=;
        b=MvaRANer4KFZDgora3G4DpYm6BH5WBPE+YdYFbK7+lok7w7f+isdQ4do8ayoUJewii
         MloBgVW1OYTpgbwLUajraCEmkvR/jhnoOU9Ti4OaV0EPY9ietIUHak3idoMOs9IKTyql
         AimGpBS9p1dhGU9e7wxnVu6cdZKf2NHiijX6nqNMW+kzVj8jg0+EqEuAfr1OXlw+7GFw
         Mf0UVOivHxPkQ80t+Hp8VXvg5n5nKyNalM8MJ2Q6Y2lzF80dovEmraynTGHMTD1Ysuub
         Zklv07y0tHcXzOJVQivfAO/i4L8vnGVSytKxIWS0qQZaXnRDpKbUa7BA3U3tpVi1z3MZ
         kMhA==
X-Forwarded-Encrypted: i=1; AHgh+RqOjhSHnWNeLNN5aI/KtpzMVYNd3uURo4PGBBPrETVJ1TUrsM2o7NefCG5Umrz9dx9gIqqvcHcgSKwMD+nXIke6Ug==@lists.openembedded.org
X-Gm-Message-State: AFuF++kg1/+CfvA4tv0748zbvqb1KQysmLqpALW0tfXMyTzCYKVk7ZSM
	btExD6UQTUrEdWlhTFngGsHYqFPTNW3n3bh7UydXmSIuTOvatC0jysy7kltqXhU/6+4=
X-Gm-Gg: AR+sD1384V1unHWFk2X/IbfM8WGlHgSgFhz2HeOFWbiQ84tBgXmqpb63UqzrrpArarT
	STFcivqY8LyjDwRc2Bh6qaVMwgs6HeRJagnaFNsaM8M+9AeZYBm2MRILFPxZKSx1Y+sFhg/GdOO
	/LE1ncspAdUPba8VLGW0txx/ArNpgLYd6F1iqdUsUaIwc1YwMVM/RQVggD0VfnEKmr6yeqW99Z+
	2/nZAMA4z80ZiVxIOmtDG7p4U5fyT9beOIGTacPShwYjYzh0ZAXPgY42finbms/uOwgi/71sk62
	PpY1nr90/MeIqu+pr2bLb0vuleMLaVpn42QbYTDlQaho+emIX8/iR5npAPgNS/n21RdZFUq3PG5
	6It/mRlnwGX4Q+Y2+P14thVS7r+JEvjkS80LfvZ2yzwE9i4TgJwUWhJUGr0x2E1xSdfxI5oH+az
	mFDkxOjwstAInP5gQj/wDBEuJ6SPZm1CzrHWLcJSab35TAbMmw8fLf2IB4uI6eMNfA+tDHlgF2y
	HhDqMzXn3OUWckva1P1Ktr8MtvDBneJcRJLQAlj4afFaqcew68=
X-Received: by 2002:a17:907:3ccc:b0:c25:2cbe:edeb with SMTP id a640c23a62f3a-c255741a624mr1699293466b.21.1788160387343;
        Mon, 31 Aug 2026 00:13:07 -0700 (PDT)
Received: from localhost (2a02-8440-250a-7d32-ab9b-49c2-2416-efa2.rev.sfr.net. [2a02:8440:250a:7d32:ab9b:49c2:2416:efa2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2564e31462sm358843066b.60.2026.08.31.00.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:13:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 09:12:56 +0200
Message-Id: <DL2XY8C5ZSTE.3K2H4I5KEF75F@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Richard Purdie" <richard.purdie@linuxfoundation.org>, "Daniel R .
 Slater" <daniel.slater@thermofisher.com>, "Randy MacLeod"
 <randy.macleod@windriver.com>
To: "Babanpreet Singh" <bbnpreetsingh@gmail.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [scarthgap][PATCH] qemu: restore 64-bit file lock handling for
 32-bit guests
X-Mailer: aerc 0.20.0
References: <20260802031022.7-1-bbnpreetsingh@gmail.com>
In-Reply-To: <20260802031022.7-1-bbnpreetsingh@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 07:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244733

On Sun Aug 2, 2026 at 5:10 AM CEST, Babanpreet Singh wrote:
> 0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch removes t=
he
> TARGET_F_GETLK64, TARGET_F_SETLK64 and TARGET_F_SETLKW64 cases from
> target_to_host_fcntl_cmd(), along with the struct target_flock64
> conversions. Those are guest ABI, not host libc spellings, so every 32-bi=
t
> guest calling fcntl64() to lock a file now gets -TARGET_EINVAL; under
> qemu-arm SQLite reports "disk I/O error".
>
> Backport ac1bbe8ca46c ("linux-user/syscall.c: drop 64 suffix from flock64
> &Co", 9.2.0), which makes the same musl-driven change without dropping th=
e
> guest side, and remove the hunks it supersedes from the local patch.
>
> [YOCTO #16326]
>
> AI-Generated: Uses Claude (claude-opus-5)
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
> ---
> Only scarthgap is affected. master and wrynose carry qemu 11.0.3 and 10.2=
.0
> respectively, both of which contain ac1bbe8ca46c, and neither still carri=
es
> 0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch, so there=
 is
> no master commit to backport from and nothing to send there first.
>
> Verified by building qemu 8.2.7 with the current and proposed patch stack=
s
> and running a 32-bit ARM test program under each resulting qemu-arm:
> F_SETLK64, F_GETLK64, F_SETLKW64 and a lock at a 5 GiB offset all return
> EINVAL before the change and succeed after it, with plain 32-bit F_SETLK
> unaffected either way. bitbake qemu-native also builds clean on scarthgap
> with the new stack.
>
>  meta/recipes-devtools/qemu/qemu.inc           |   1 +
>  ...all.c-drop-64-suffix-from-flock64-Co.patch | 225 +++++++++++++++
>  ...ce-use-of-lfs64-related-functions-an.patch | 265 +-----------------
>  3 files changed, 228 insertions(+), 263 deletions(-)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-sysca=
ll.c-drop-64-suffix-from-flock64-Co.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index 46cc7cb5cb0..91fd6df3e12 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -30,6 +30,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
>             file://0008-tests-meson.build-use-relative-path-to-refer-to-f=
ile.patch \
>             file://0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed=
-li.patch \
>             file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-gues=
t-d.patch \
> +           file://0001-linux-user-syscall.c-drop-64-suffix-from-flock64-=
Co.patch \
>             file://0002-linux-user-Replace-use-of-lfs64-related-functions=
-an.patch \
>             file://fixedmeson.patch \
>             file://no-pip.patch \
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-linux-user-syscall.c-dr=
op-64-suffix-from-flock64-Co.patch b/meta/recipes-devtools/qemu/qemu/0001-l=
inux-user-syscall.c-drop-64-suffix-from-flock64-Co.patch
> new file mode 100644
> index 00000000000..6ebe2b895db
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/0001-linux-user-syscall.c-drop-64-s=
uffix-from-flock64-Co.patch
> @@ -0,0 +1,225 @@
> +From ac1bbe8ca46c550b3ad99c85744119a3ace7b4f4 Mon Sep 17 00:00:00 2001
> +From: Michael Tokarev <mjt@tls.msk.ru>
> +Date: Thu, 29 Aug 2024 09:39:50 +0300
> +Subject: [PATCH] linux-user/syscall.c: drop 64 suffix from flock64 &Co
> +
> +Since we are always building with LFS enabled, in particular
> +with -D_FILE_OFFSET_BITS=3D64, we should always have struct flock
> +mapped to the 64bit variant (with off64_t), and F_GETLK mapped
> +to F_GETLK64 etc, automatically.
> +
> +So there should be no need to explicitly use the "64" suffix
> +for these things anymore.
> +
> +Also fix a misleading comment near safe_fcntl telling us to
> +always use flock64 (since v2.6.0-1311-g435da5e7092a "linux-user:
> +Use safe_syscall wrapper for fcntl").
> +
> +Reference: https://gitlab.com/qemu-project/qemu/-/issues/2215
> +Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> +Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> +
> +Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/ac1bbe8ca46c550b3ad99c85744119a3ace7b4f4]
> +---
> + linux-user/syscall.c | 92 ++++++++++++++++++++-------------------------=
-------
> + 1 file changed, 40 insertions(+), 52 deletions(-)
> +
> [...]
> +=20
> diff --git a/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-=
of-lfs64-related-functions-an.patch b/meta/recipes-devtools/qemu/qemu/0002-=
linux-user-Replace-use-of-lfs64-related-functions-an.patch
> index ceae67be644..b10a76090b8 100644
> --- a/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs6=
4-related-functions-an.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs6=
4-related-functions-an.patch
> @@ -13,234 +13,13 @@ Upstream-Status: Submitted [https://lists.gnu.org/ar=
chive/html/qemu-devel/2022-1
> [...]

Hello,

I'm sorry but something look not right to me here.

I don't understand how you can modify a 0002 by backporting 0001... Was
Khem patch reverted? In that case, I think we better remove it and re-do
the backport with non-reverted patches.

Also, Khem's patch is merged now, can you fix the Upstream-status if we
end up keeping it?

Thanks!
--=20
Yoann Congal
Smile ECS

