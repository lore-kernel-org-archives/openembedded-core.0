Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3CCC54E41
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 03:31:46 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.15165.1709782304286721389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 19:31:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ow96rABa;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-21f0c82e97fso197591fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 19:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709782303; x=1710387103; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2TraSDV8Dah/BXiNcDTL1EzzWpkQXr4ZS+Fc59/sAU=;
        b=Ow96rABaiTXDulQTtQOOFCJaUEiBmqztaen+1bmPj7HNsVDjbvxt+zYuNkcvBe6AVV
         tsDC+8dJtT6NDHm3YCh7IxJ0eU8gBEhb3LYM0f2rPzyI8QBciyupYkFE2OQiO3ERxTot
         NI6T8WTGL2793GIsTlh5BVFCaan28cFXu69ZLe7Cp5U28FVaMswH/k1CMw6mTUb9ooT1
         e+biajdNmpp/Q9zGRw9NnbJlAbS9ETm2ScYzNOKLiOdiAbOwiNHaDYUm9+MLUSi/N6sc
         woE5SckjgYf/fBlHsm65QoCx6/YItJbXXVEj93QVAUnyzE09rBzcwxzeSuyaUTC/f1ER
         OdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709782303; x=1710387103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2TraSDV8Dah/BXiNcDTL1EzzWpkQXr4ZS+Fc59/sAU=;
        b=pSl4MpDBfAbePeNs2fq0raLZq3JVB8hlFXr4g/tHdpX1HEZQtM5UANNlTaqPHocYRm
         zNBL4lqYQ+VTvpTsUs12huTak9I2gWFflugW5XFawtUL9WBzJysWs8Pk1u0NT+yPUVys
         vluPS8IqwSQJZWE+/v0oP52iOx+pmcg3MsPl1lHD8Udqh2AbUVT1yOfsd5Divm4P1Qd5
         x1KrcKXU88mETyE1AV1hWPw14dNPQ2sC1WO+S+OhYUvcBRSRwI9mLjQcvkepkS1lm0Yq
         g8fI5ed3EFkiwEtb5Ihjz9UuT/jtr3PMpZL9u5TxynZXamdePfSQm0IiRhj9qZVCAfd7
         RixQ==
X-Gm-Message-State: AOJu0Yz9WC97dgKy4af/v+EvWTV01WwQSGizYtLyWTVM9NHSMRtnTjpD
	idLSURZ9ojYk40daTlZfY/QlMnHR71P7SA7Cmuf2c36glo2pa2gU/CpbnbOrLjxvJb2OmRhBlK9
	fQXaZ7lfxE/o+UlGHZ7bjtGbKtwIEE8JN
X-Google-Smtp-Source: AGHT+IGgDpzAoNkxSOE/phikJBGac7jTMA11yJC4YeOjgKgIWVCNOuWbYwzROxdt/WfOJ3UtkO64aprusOhzK7HddGU=
X-Received: by 2002:a05:6870:a115:b0:21e:b50c:3e8e with SMTP id
 m21-20020a056870a11500b0021eb50c3e8emr7123983oae.56.1709782303368; Wed, 06
 Mar 2024 19:31:43 -0800 (PST)
MIME-Version: 1.0
References: <20240307015239.2600073-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20240307015239.2600073-1-Randy.MacLeod@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Mar 2024 19:31:17 -0800
Message-ID: <CAMKF1sqkhATCR5S_bciVOMZvGVd5H251x+t0z1p9Cve4pJf4dg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] valgrind: skip intermittently failing ptests
To: randy.macleod@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 03:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196765

do we know the reason for these failures or some details ?

On Wed, Mar 6, 2024 at 5:52=E2=80=AFPM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> Skip a few additional ptests that fail occasionally on the Yocto
> autobuilder and remove those added to the remove-for-all list
> if they were already in the remove-for-aarch64 list.
>
> =3D=3D=3D Test Summary =3D=3D=3D
> TOTAL: 774
> PASSED: 755
> FAILED: 0
> SKIPPED: 19
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 | 2 --
>  meta/recipes-devtools/valgrind/valgrind/remove-for-all     | 4 ++++
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b=
/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
> index 04f159d701..5bfba1c8d3 100644
> --- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
> +++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
> @@ -1,5 +1,4 @@
>  drd/tests/annotate_sem
> -drd/tests/boost_thread
>  gdbserver_tests/hgtls
>  helgrind/tests/hg05_race2
>  helgrind/tests/tc20_verifywrap
> @@ -15,7 +14,6 @@ memcheck/tests/atomic_incs
>  memcheck/tests/bug464969_d_demangle
>  memcheck/tests/cxx17_aligned_new
>  memcheck/tests/demangle
> -memcheck/tests/linux/timerfd-syscall
>  memcheck/tests/long_namespace_xml
>  memcheck/tests/mismatches
>  memcheck/tests/mismatches_xml
> diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/met=
a/recipes-devtools/valgrind/valgrind/remove-for-all
> index 004589a7ea..8435a6d41d 100644
> --- a/meta/recipes-devtools/valgrind/valgrind/remove-for-all
> +++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
> @@ -1,8 +1,12 @@
>  cachegrind/tests/wrap5
> +drd/tests/boost_thread
>  none/tests/amd64/fb_test_amd64
> +none/tests/tls
>  gdbserver_tests/hginfo
> +gdbserver_tests/mcinvokeRU
>  memcheck/tests/linux/dlclose_leak-no-keep
>  memcheck/tests/linux/dlclose_leak
> +memcheck/tests/linux/timerfd-syscall
>  memcheck/tests/supp_unknown
>  memcheck/tests/wrap1
>  memcheck/tests/wrap2
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196760): https://lists.openembedded.org/g/openembedde=
d-core/message/196760
> Mute This Topic: https://lists.openembedded.org/mt/104780048/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

