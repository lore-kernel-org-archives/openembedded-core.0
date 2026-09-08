Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1DAC79F82
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 13:05:27 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6886.1788872721577534908
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 06:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=X5h+SZm7;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4858303de5dso5640685f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 06:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788872719; x=1789477519; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SMStVdRRqFZ/9y6Xv6FmIE+ieQb0ST6YPQuBeZN7r5E=;
        b=X5h+SZm7C4CbnLkkY8xsLXjHieu2sYEoBMcTkcJrlhVUqbjNr/zxYK9/7SyWdKIzEl
         YC/V3zRkev5XgbKGFR6Ilj65VY7YhLr8vgX/QxLJnyJQaFCcEJvDeqgto9V3Az8La+rc
         1kfVQFpmatWB+xqjs1AMpyueo+Mu5qS4zOHIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872719; x=1789477519;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SMStVdRRqFZ/9y6Xv6FmIE+ieQb0ST6YPQuBeZN7r5E=;
        b=HCrgGh1OQeQYSr19so7s8EXpCyyT3fclDA8N4K0/yS5IxDz8RKlif9q88JfSCd4C7K
         CwLY7EnfEHyt9RNoQ8MUfVE9y6BT+DhKd+AUDBo6OfWRFhmlhIwwT5fbAHk1q/5npTPg
         JsDUZdW3G1HFhGjMALb80fUgBthPTCy5bua4odfNgGLiJplHzCRMgzipD/FGzn7rWhFj
         ZwtCEB8yRXa0H1STD6sjPTHTrzJvuI3D5IvVAs+v6K/scRLJlp5KUQNSvPWgDVljQMsw
         ETo2Ov5CdamrLcWKe/ZHpz9i4Dn00dJ44eFoLWoFgyeiPpRJTZEWl+OvDGOAQO0N3JmP
         Xp7w==
X-Forwarded-Encrypted: i=1; AKwUvBz+lnzy7mrCg7EOeBxD6P5zu44T6BffMUH2dV63GZiQ33A9hzrbPzqgqs1lg0NKn5b/JfcsD9YgUPfruxkQMR0f2Q==@lists.openembedded.org
X-Gm-Message-State: AFuF++mdN2hH+C5dH13VRMt1eN3eMNIymoX5Q3sS+RS+Djj9P0/LXRaK
	p4+feWRPfQzLbLtOXUbz/ozCZEnJXJxPXq9+7h3YCIOcTQlzamJ2U6jIxOWpD6Evwx5uxKyv4z+
	C252ABQc=
X-Gm-Gg: AYBFou0oici1t5i0gLBTlAoQxd2dNO1v3VyIshqvbhspyb69CZ4PvQNdqoFzuDo07dw
	RyCT88MW5N7Wc+np5ht5bF4AdUG7xSFVFrjcxq8OQg7YNJyv+lYQs1mryo3xFgS7oxlVGClhmW2
	ZlgbToAtmA6TXOCiiRC1D+k2+EA73FVZMHG+jCMuC2/DeSKdH1qyOrKn9uWdiBagXPTX7LhvGXN
	H6cKHy5MDRBdn3S2BGuvDL1pakhA1LkVxvPT4BQ6gfMHEVSsFgN9PDIJlXTnIMpZZ0YcWFryh5I
	kuHOHH4IQEaBV+IN7Nh/w8PsnQtc4IcX5PlD8bYB6zhagjL5hNeKe69wLhID4T/2nxnhWiXH6o0
	+aww3u3qa3RjMbznunJINaVzWaRqKKtClZSjvyd0cAhTLyfjOE2OYsDEtg4tHyqWnqnrkpDcxWu
	rDZBvAQdB8SfOEX7/4SnJQrshY4hx6Q1I2HCs7cU0aY0a6cH4CYD2gmr5kZFP90aqawEcMshRtc
	4GSjS6W/OppD1f+5pMhzndEXJeuPqrk7mk4t6QUbirYUckz
X-Received: by 2002:a05:6000:26cd:b0:485:8c16:a334 with SMTP id ffacd0b85a97d-4858c16a6b6mr26620464f8f.41.1788872719293;
        Tue, 08 Sep 2026 06:05:19 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588390e30sm35092074f8f.7.2026.09.08.06.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:05:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 15:05:18 +0200
Message-Id: <DL9YGDUXQCK0.3Q4ODQ2JNRJYD@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH] glibc: stable 2.43 branch updates
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Sundeep.Kokkonda@windriver.com>
To: <Hemanth.KumarMD@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260904065001.674758-1-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260904065001.674758-1-Hemanth.KumarMD@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 13:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245362

On Fri Sep 4, 2026 at 8:50 AM CEST, Hemanth Kumar M D via lists.openembedde=
d.org wrote:
> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>
> $ git log --oneline 1c9988e52540c844928c6d93ff45305adc2c24a0..8dad0ee453a=
9bd9d24e55daba85e70915b29e19d
> 8dad0ee453 alpha: expect test-float32x-float64-div to fail
> f024355965 alpha: add the denormal trap enable bit to FE_NOMASK_ENV
> c4dac931ab alpha: Fix stack alignment in makecontext
> 76115597fe alpha: fix setrlimit compat symbol for negative rlim values be=
sides -1
> c29ca5d216 iconvdata: Test case for bug 34556, bug 34568
> 3ad1bbd8f9 iconvdata: EUC_JISX0213 decoding lacks pending character reset=
 (CVE-2026-80489)
> 138c43f018 iconvdata: SHIFT_JISX0213 decoding lacks pending character res=
et (CVE-2026-77117)
> 713998bf00 stdlib: Fix right-justification in strfmon (bug 34510, CVE-202=
6-19499)
> 2a35bab35b posix: Remove unnecessary overflow check in wordexp (BZ 34090)
> 4964178b4d m68k: remove sysdeps/m68k/m680x0/fpu/w_fmod_compat.c (bug 3455=
9)
> 0afa34adb0 misc: Fix out-of-bounds array write in tdelete (bug 34506)
> 7d26579873 malloc: Show hugetlb tunable default in --list-tunables
> 8017bcfc4d m68k: Fix fmod/fmodf infinite recursion (BZ 34508)
> a388c4002d posix: Fix wordexp WRDE_APPEND to preserve state on non-NOSPAC=
E errors (BZ 34090, CVE-2026-6368)
> bc95068f5f ppc64le: Restore optimized memchr for power10 [BZ #34300]
>
> Testing Results:
> +--------------+--------+--------+------+
> | Result       | Before | After  | Diff |
> +--------------+--------+--------+------+
> | PASS         | 5818   | 5821   | +3   |
> | XPASS        | 4      | 4      | 0    |
> | FAIL         | 1071   | 1071   | 0    |
> | XFAIL        | 16     | 16     | 0    |
> | UNSUPPORTED  | 402    | 402    | 0    |
> | UNRESOLVED   | 7      | 7      | 0    |
> +--------------+--------+--------+------+
>
> Changes in testcases:
> +------------------------------------+--------+--------+
> | Testcase                           | Before | After  |
> +------------------------------------+--------+--------+
> | iconvdata/tst-jisx0213-progress    | N/A    | PASS   |
> | posix/tst-wordexp-append           | N/A    | PASS   |
> | stdlib/tst-strfmon-bug34510        | N/A    | PASS   |
> +------------------------------------+--------+--------+
>
> Justification:
>
> commit - c29ca5d216 iconvdata: Test case for bug 34556, bug 34568
> Adds the regression test for the EUC_JISX0213 / SHIFT_JISX0213 pending
> character reset fixes (CVE-2026-80489, CVE-2026-77117).
> +PASS: iconvdata/tst-jisx0213-progress
>
> commit - a388c4002d posix: Fix wordexp WRDE_APPEND to preserve state
> on non-NOSPACE errors (BZ 34090, CVE-2026-6368)
> Fixes WRDE_APPEND state preservation and adds a regression test.
> +PASS: posix/tst-wordexp-append
>
> commit - 713998bf00 stdlib: Fix right-justification in strfmon
> Fixes right-justification in strfmon and adds a regression test.
> +PASS: stdlib/tst-strfmon-bug34510
>
> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index cf5a444095..6d667ac95c 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "release/2.43/master"
>  PV =3D "2.43+git"
> -SRCREV_glibc ?=3D "1c9988e52540c844928c6d93ff45305adc2c24a0"
> +SRCREV_glibc ?=3D "8dad0ee453a9bd9d24e55daba85e70915b29e19d"
>  SRCREV_localedef ?=3D "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
> =20
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"

Hello,

I've not tested/reviewed this patch yet but, for the next glibc upgrade,
can you please put a partial sha1 in the patch title? That would help me
and my various tools to differenciate between the different glibc
upgrades.

In this case, something like
"glibc: stable 2.43 branch updates to 8dad0ee4"

What do you think?

Regards,
--=20
Yoann Congal
Smile ECS


