Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156ABC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 17:44:17 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2956.1782755054560360380
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 10:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WXs7PL8o;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4629051c9d1so1996568f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 10:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782755053; x=1783359853; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZLIq0GcfhQxLsWqOmo7N2xOtQNYoCfBAqXCCdgDF9I=;
        b=WXs7PL8oB5WEuYgxpgUpiO5rNP5gj5oby7+qWJ+Xt7csT98GCB1ZRlFr4+d+q6PHR1
         iz+kyDsAeMyHa4nHds71irCh8LhyZUV5WFjIDkxFkat4eXDGyDh3AQmIPfJYEMXqbxv/
         kmGAGR+zjdGeW80gLZLMmDmaCMBr8hqnNSOSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782755053; x=1783359853;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bZLIq0GcfhQxLsWqOmo7N2xOtQNYoCfBAqXCCdgDF9I=;
        b=Yweqt/agehI1XALonSSQkAWAp69TnoWMqgw6W9bnVynJDbwPd0pjvRWoIJ2xZKuPIa
         unW4hsGJfHLgisX48Qrkxjw9vfx3+BaeClHfiOtNr+WV3SZM67reFi6XRBffHMJ16gzv
         aeYPfMGDm0y2R3kJz2OJL/6K2w6C7Iyv84ClLAVtt+lJYcbDMX7DnaAsVVEvWrDBU7nn
         haPoSrXoo18aGnewcchNi1E0Z+XB1G2EkIj4RqoQaRNpCHIWsmk3rE6p184arp2Qy2kl
         l+JB7bkWC9/jI3rvRXeCCqBaEuyjIjN3uzeHrwDoo2APTX55J/APnVoHfR6tsZW4WMAY
         MBVQ==
X-Forwarded-Encrypted: i=1; AFNElJ9vGT6VFU5Ubamd6jw6COTFfgadd3x4GAtJSlkQZpXySUBk3V4y9CW9MUquFYBsI5UJabkVXA/WHft/8UXrunN1ig==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwfdhK+59cjZqTmm0xLCN6ctEqwgFR/iy6oX/H3pz14TKVg82FE
	EtPr+g8fi8PsiX/ntfG9dupXYJ+4d9hG63vCYiKIXaBqFm2f75Lt7c5yuO80pD43B5g=
X-Gm-Gg: AfdE7cmEfFDlumQn/h0eLq8VT1kRQMIk1ZLb0T2Nhky1EP1ZxTwgOqwNtxq/RsGQsjR
	C53iob4d4Is2hb3i3DRFkLjf8Wrd5KFGF2KJzFZLiTrJe6e56bFG2ZRcGUYwG8xoXhBNj5/QiDB
	BhNda2AJgxJX/o6QmFdO9v+FygkmCq8x0WK3w1j0t3PYcH65A8BgF8gMqd++Z/dQzzGDPNP307/
	Xo2floF9NFagxtNtW6TnypSbM97DP1XY1BsAuQCfygPXNg9JZZQ1ARehxmItHWL+Kxuqwa/NeeW
	woESKUKqu88qgyPr1YIOWke6LMpnCEGuFMZ2F0CIA7+bDF5LJJBq5aP8BO1GFXJCPTdw+Zm0LwQ
	v89XkmhHCm0E8Q6SZdmdWQtWLYDi5g18H/G47NM64OyitNaNli7DipOnK0H9dOtPjNQn5BnF6lR
	0OGbNcrIpH990ZUXWc4FwubyNIV6hYiAKgmXQ8rsG4TGzc7yan1cWC4L8qFoRy6Op8XivO0VaC/
	Uo=
X-Received: by 2002:a05:600c:4ecb:b0:492:3754:15f2 with SMTP id 5b1f17b1804b1-493b82bcf9emr9531905e9.32.1782755052383;
        Mon, 29 Jun 2026 10:44:12 -0700 (PDT)
Received: from localhost (2a02-8440-b509-543a-ecf7-ac86-ae4c-24ec.rev.sfr.net. [2a02:8440:b509:543a:ecf7:ac86:ae4c:24ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46fccca2781sm26446485f8f.6.2026.06.29.10.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 10:44:11 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 19:44:10 +0200
Message-Id: <DJLPX85YAIYO.3H1CN7IRKC1F4@smile.fr>
Subject: Re: [scarthgap][PATCH] binutils: Fix for CVE-2025-69648 and
 CVE-2025-69646
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Sundeep.Kokkonda@windriver.com>
To: <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260619095907.3687727-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20260619095907.3687727-1-Harish.Sadineni@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 17:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239817

On Fri Jun 19, 2026 at 11:59 AM CEST, Harish.Sadineni wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> CVE-2025-69648 was marked as a duplicate of CVE-2025-69646. The
> existing patch already fixes the issue associated with both CVEs.
>
> Rename the patch and update the CVE tag to reference both identifiers.

Hello,

Since these 2 CVEs are duplicates, please juste add the "CVE:" tag to
the existing patch without renaming. Also, if possible, could you reach
NVD to make them mark the second CVE as duplicate of the first?

Thanks!

>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.42.inc                | 2 +-
>  ...CVE-2025-69648.patch =3D> CVE-2025-69646_CVE-2025-69648.patch} | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/binutils/binutils/{CVE-2025-69648.patch =3D=
> CVE-2025-69646_CVE-2025-69648.patch} (99%)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/reci=
pes-devtools/binutils/binutils-2.42.inc
> index 1a865c45f4..96e9e6cc21 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
> @@ -73,6 +73,6 @@ SRC_URI =3D "\
>       file://0029-CVE-2025-11839.patch \
>       file://0030-CVE-2025-11840.patch \
>       file://CVE-2025-69647.patch \
> -     file://CVE-2025-69648.patch \
> +     file://CVE-2025-69646_CVE-2025-69648.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch=
 b/meta/recipes-devtools/binutils/binutils/CVE-2025-69646_CVE-2025-69648.pa=
tch
> similarity index 99%
> rename from meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
> rename to meta/recipes-devtools/binutils/binutils/CVE-2025-69646_CVE-2025=
-69648.patch
> index e04d7ed6c2..b02b5e0531 100644
> --- a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69646_CVE-2025-696=
48.patch
> @@ -19,7 +19,7 @@ length field.
>  	(display_debug_ranges): Check display_debug_rnglists_unit_header
>  	return status.  Stop output on error.
> =20
> -CVE: CVE-2025-69648
> +CVE: CVE-2025-69646 CVE-2025-69648
>  Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbin=
utils-gdb.git;h=3D598704a00cbac5e85c2bedd363357b5bf6fcee33]
> =20
>  (cherry picked from commit 598704a00cbac5e85c2bedd363357b5bf6fcee33)


--=20
Yoann Congal
Smile ECS


