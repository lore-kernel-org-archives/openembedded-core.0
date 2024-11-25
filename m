Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E16D58D64
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 16:13:55 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.22266.1732551231717255923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 08:13:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NKumKqgG;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5ee1c3dbeb9so2337254eaf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 08:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732551231; x=1733156031; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/hycAuqCNIQaV6EBZYHUiXZ0FoB+I8lpfQOcZp4Tek=;
        b=NKumKqgGQdSURLspgmGtAd1kMjRd+c4xZh1c/iyv/++KHnafseCuOW2/8dqvet0QTy
         cNPoNX9Vn7tBq4PgOW1zowZGp9lESARxwnXaIVKXf6jptm6OoZuH7PhyKmz9p2dwLG6z
         wHSwPt9nfZ0I8ULj9r2sMF7QzeDLNC2wlb5saEx34XAI6NAb2Sr0i6A4c7gvyLbtDxoD
         zAWCMr60T3hktdl6tpJsEupcLRpHkv+Hzy+2xMePnJNOOt0YUtR6HqX9Wmohe/uKpdVe
         eC6kpzi+EeDFQ/uj5vBl+VhallsBPUOC8DCKTLk/2DGrkJejV6t7qkSc7vc8CEC50Lzq
         UN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732551231; x=1733156031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/hycAuqCNIQaV6EBZYHUiXZ0FoB+I8lpfQOcZp4Tek=;
        b=Z4SGEgKVMwONrsJ4zRLD3Of8ITe6rgzTZC8iKCifV0kll+gqwsRFNj5kL7m7Niip9D
         omD7WJhePM3ghYDpeVUw0iMlVqzvn39TIHtG+hoPlFjwPNxwphoLvLqz/gB4KTiNnd8L
         l8US/B0da28mgITg3FWAEkuL8Ft6klvOtXg1BGIiUkKrQnuvqn/patkNhyWo5BugvOZH
         f99aesUpy+avV2Iw0PZqdMBdszu0EAK8PyH5p42urhTC4uzfFRniEpwVLAjS0ZkHzsFP
         fRm4sSpt/18JzY2OHauN1p9SiJuiz5eHGYWrsqtBCy6uc+i4+S5m055K4vvSCMqJUb1h
         p0MQ==
X-Gm-Message-State: AOJu0YyIAIy42tL3jLR7M05XPxSCkz+hOTc+YOdTx+TUwTpJzsrKUyLE
	i8dbkU0WUCLy29iS7Q9C1w9p7JxITVYQOodq1ahW2uOTbxcqyvCOYmykM+xKUDbsIa3hrfi/Wbh
	5PZ5rZ5Rh36i8hcM9AFxYP5hwNIVFsA==
X-Gm-Gg: ASbGnctJK8ANR+c2MfXvzjnA529QIMjNJ2aBN5TyCufSdWv3RmIxoCozPVdB/zFBrW/
	9CQW2ceShorimm+aTsUkaRjgnc4fbRXg=
X-Google-Smtp-Source: AGHT+IFqnF5IqWtbvnFyTMhlHrvkwpwtFFg5PqbJLWvJB2NaPKif8tfb4hNP8R0noDEJIXux5cTa0VPbwWqh36CPZ0I=
X-Received: by 2002:a05:6830:6405:b0:713:d159:ec with SMTP id
 46e09a7af769-71c03c50e6fmr10629261a34.10.1732551230658; Mon, 25 Nov 2024
 08:13:50 -0800 (PST)
MIME-Version: 1.0
References: <20241125080135.808368-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20241125080135.808368-1-Deepthi.Hemraj@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Nov 2024 08:13:24 -0800
Message-ID: <CAMKF1sqFkN=w8bnwWKmFUm21jGdTd_7dwjCygK77XMsudaHBHQ@mail.gmail.com>
Subject: Re: [scarthgap][PATCH] glibc: stable 2.39 branch updates
To: Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com, steve@sakoman.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 16:13:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207791

LGTM

On Mon, Nov 25, 2024 at 12:01=E2=80=AFAM <Deepthi.Hemraj@windriver.com> wro=
te:
>
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>
> Below commits on glibc-2.39 stable branch are updated.
> dcaf51b41e elf: Change ldconfig auxcache magic number (bug 32231)
> b3c51635ef Make tst-strtod-underflow type-generic
> b74be22f65 Add crt1-2.0.o for glibc 2.0 compatibility tests
> fcdf98f38c Add tests of more strtod special cases
> 3edc0f22a6 Add more tests of strtod end pointer
> 988de94538 Make tst-strtod2 and tst-strtod5 type-generic
> a2f7087237 powerpc64le: Build new strtod tests with long double ABI flags=
 (bug 32145)
> 6624318c89 Do not set errno for overflowing NaN payload in strtod/nan (bu=
g 32045)
> 63bcc01744 Improve NaN payload testing
> 86369c9ee4 Make __strtod_internal tests type-generic
> a7be595c67 Fix strtod subnormal rounding (bug 30220)
> 9cfeccf65a More thoroughly test underflow / errno in tst-strtod-round
> 293e4e3c90 Test errno setting on strtod overflow in tst-strtod-round
> d8b4fc3653 Add tests of fread
> 373aab3e52 stdio-common: Add new test for fdopen
>
> Testresults:
> After update    |Before update   |Difference
> PASS: 4889      |PASS: 4885      |PASS: +4
> FAIL: 229       |FAIL: 229       |FAIL: 0
> XPASS: 4        |XPASS: 4        |XPASS: 0
> XFAIL: 16       |XFAIL: 16       |XFAIL: 0
> UNSUPPORTED: 227|UNSUPPORTED: 227|UNSUPPORTED: 0
>
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index dc162b2946..b3b21bd07d 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "release/2.39/master"
>  PV =3D "2.39+git"
> -SRCREV_glibc ?=3D "84f6bfce2c37e32b9888321fc3131ffbbe6deeba"
> +SRCREV_glibc ?=3D "dcaf51b41e259387602774829c45222d0507f90a"
>  SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
>
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dhttps"
> --
> 2.43.0
>

