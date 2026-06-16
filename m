Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131A0CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 12:35:28 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.153027.1781613322749608946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 05:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SgYiajdG;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ce65629acaso53075756d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 05:35:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781613322; cv=none;
        d=google.com; s=arc-20240605;
        b=b240qFltc/84Q1Egw6gO5UTbNd3vYKdFIepgEj/otim0tA8CCYTCpNJkJMhEE7ZALX
         C9LohP6qEddPOxgmXwAuSm060EU1MTL9udgYisDN1D8Z9Xa6C6N5eJdhpbKM+nyy81nv
         56WztxPMTtcS+rsPGRO7yMQGqsraRDE9azjezb2KqGJcIBRnz5PLncDjeuKxnLDotuEi
         Pv+9Nzz5PmQWyCi1VHA0UYzVlMWrvLdS8d80iZCyEEd9IvPD5LcLGBzYEbh9cehX00Zc
         meIhy5uRqS0QEbkrt4nje3y9VC4x8HOYO6q4M/BtiIXI6274eTDumlR7j9UI4QhlODqv
         ogUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yaqsbBW55m84p/FQ/vgU9JBlT6TbAQkPCDNkR5Uevmk=;
        fh=cbgl5IOPsNxVRhYTH4PVIGJOnA+jpdWoNWXXxuAa4Z0=;
        b=WJT/N43ltm5hOJIa517l0HpkDQAP1bKflrEz4UYc/3NQ1d2QCd+LtGYkrbD864Frbp
         0N/kAhHZ9WDXbUYE4AgCKpTDanKlk3kRqUFYssZjn9Q4tlOOzaYJ5ZfUadxDT7B/UHh0
         BRDxhsrFk0yWWwzC1BU+ZOBvN5FDBycDE29R2JVU3nUyWlLitJS+Hs8lstnmhlZmMCpK
         5RiQ33pn88OF9Pnf+3JnOdu4ZD2gPzcGPk+GaSuZ158oCWVBauVr1NNbmrxT5LB+l3xg
         vK9YrsYjxowqV/0Av2enWkKWP4YMTOC/XuHJGPzyRISmtSN96drPv9frs/0jujpk2iKN
         0q2w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781613322; x=1782218122; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yaqsbBW55m84p/FQ/vgU9JBlT6TbAQkPCDNkR5Uevmk=;
        b=SgYiajdGnqxK4l3KmDOkdzfTx/uBRSX35PU6m1tJBJIj/1XuM130IXxIzw74CYJwcQ
         QAVv/VACwBCo01UDmIQlf7S2vXVJJM1ZXH/a79RxmnxyOeBEbH/GAfCiyWrqG3PkKCka
         5ze0TVVSkZwxqqDfOV468LGNyMMR6WPU+g+/72erW/rNjbodmwgvUFI0l9Aifnge10vb
         4GPKFA+Fn+midVI/EehhBMDyjN64NplhTSQrz4SRrgu1Sea+OqSL7CqlMI0sOlnVXaJS
         TIwbe76DKN59HfCmmNSDFsGP97ecJeTuAUPu0U+1M7d8SyFjmb867usXLXhzWE00HdFw
         5qcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781613322; x=1782218122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaqsbBW55m84p/FQ/vgU9JBlT6TbAQkPCDNkR5Uevmk=;
        b=JMTfd1mIeICeOZNlS1DGm1a+GPOoRiHljty/e3IUsjzdzwvPFjxcufjv/JW+PgbvCh
         lDF9eQVUjrwXIg0FneZ1+GlTE0oeeHC2KW9kJ94h6hJwnJ5FMfPSZbqe5G5sg18BQLOu
         QX8/Nh5aOq5HrCmn9NnBb0+vboMHATsc/R5oJV8YpS5AJvz56CXV8I9iLGmdriCPY+Qd
         IwJ8VvTv4AnMtonaqshvXpshAEErQmSos4v+uZycp9uTm4CGX5xyLeh4i9JGPTd3bCov
         4S8w6yoOjcghNyWGBSurfxkbMGeMy9tpnkFs5AYaCQ/fN4TyQg+GJnowVMF2I08fyZVn
         bkLw==
X-Gm-Message-State: AOJu0Yz1PYMb1c5jWRws/BwWxe5lAnEXRoFz8eSP2stS5YVWwggCcRgH
	QKKadREyGUT++5itSHUIb7Cx63jzEQeGZZFNjCrZrqvlJGxSiRmjSR5VTcQH8HntIOE0IJuNkOZ
	71K+qP1vQWOwnbpxPP90nK6uJnA91cvaJntjk
X-Gm-Gg: Acq92OFXdJuiXxRNkRUIUyP7DCNgKVcIybddmG6gaYFSh32q5DldTD8IHEiZzMJ0v2/
	3o3du93gk9LhJvPlbvTie1sFPLQJVt1Nal5j0r0nvlDHNr3frf08PgazuToK6H6l+whtAK5Mbae
	fF/dV30RbW+ppRtWvZvMoxxepB20Dz016HwtnMwj191sOWGep+dPROPEp7+KzbuJ6dXHqZ9wown
	0u8Gm18zG/2Gw4orZD0g8IBQBtrJ8Hu+CPaziIKwq8j/IHYafx1a1LKxbq5RQBZCaPIxgQubtxu
	uYkabRL/McKIB8hYivUqrO4Hp1PfIqgggGpzeVFM2A==
X-Received: by 2002:a05:6214:590d:b0:8cc:ed49:bdd4 with SMTP id
 6a1803df08f44-8da1b439235mr54275976d6.7.1781613321403; Tue, 16 Jun 2026
 05:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org> <20260614080307.4017177-5-richard.purdie@linuxfoundation.org>
In-Reply-To: <20260614080307.4017177-5-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Jun 2026 14:35:09 +0200
X-Gm-Features: AVVi8Cei_JCm3NA0WFjSP8v4o9lb0jsWM8Ar63rUAp92wN-kPYIGDSJermVRPVw
Message-ID: <CANNYZj9DNDyHb=wrVAZcEtQQ30XA7--peGbkiOH+URLMjgw+rQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/56] gstreamer1.0: upgrade 1.28.2 -> 1.28.4
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:35:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238895

Note that this introduced a flaky ptest. I reported this upstream:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/5163
and will send a fix that disables the offending test, if upstream
won't get to the fix soon.

Alex

On Sun, 14 Jun 2026 at 10:03, Richard Purdie via
lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../0001-tests-respect-the-idententaion-used-in-meson.patch | 2 +-
>  .../0002-tests-add-support-for-install-the-tests.patch      | 6 +++---
>  .../0003-tests-use-a-dictionaries-for-environment.patch     | 2 +-
>  ...tests-add-helper-script-to-run-the-installed_tests.patch | 2 +-
>  .../{gstreamer1.0_1.28.2.bb => gstreamer1.0_1.28.4.bb}      | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.28.2.bb => gstreamer1.0_1.28.4.bb} (97%)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
> index e1d870b0405..de255bf7918 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
> @@ -1,4 +1,4 @@
> -From ad4c577ff8d29f6dbaf5ca2d013e9d21c44f9122 Mon Sep 17 00:00:00 2001
> +From 4e6aae8cbddb4567388f8f19919c2c17e36e0356 Mon Sep 17 00:00:00 2001
>  From: Jose Quaresma <quaresma.jose@gmail.com>
>  Date: Sun, 11 Apr 2021 19:48:13 +0100
>  Subject: [PATCH] tests: respect the idententaion used in meson
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
> index 720a6f0c97e..957356c2ba6 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
> @@ -1,4 +1,4 @@
> -From 92e7d4090fa458bf02d3418cd01c960982821e92 Mon Sep 17 00:00:00 2001
> +From 34d24b8d66088d92ca306a488028dee82a6f6982 Mon Sep 17 00:00:00 2001
>  From: Jose Quaresma <quaresma.jose@gmail.com>
>  Date: Sun, 11 Apr 2021 19:48:13 +0100
>  Subject: [PATCH] tests: add support for install the tests
> @@ -19,10 +19,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>   create mode 100644 tests/check/template.test.in
>
>  diff --git a/meson.build b/meson.build
> -index 8adc055..b5c9e5b 100644
> +index abd0ad6..93cd692 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -667,6 +667,10 @@ if bashcomp_dep.found()
> +@@ -661,6 +661,10 @@ if bashcomp_dep.found()
>     endif
>   endif
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
> index 1236290e2b6..bc6dfe353a3 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
> @@ -1,4 +1,4 @@
> -From 374c6ace83e9697aae0b21ba26f316b79279c39c Mon Sep 17 00:00:00 2001
> +From f34bc3040b1564a3d39de4a4426326866c437dae Mon Sep 17 00:00:00 2001
>  From: Jose Quaresma <quaresma.jose@gmail.com>
>  Date: Sat, 24 Apr 2021 10:34:47 +0100
>  Subject: [PATCH] tests: use a dictionaries for environment
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
> index df382a4445d..8eb4bc2a816 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
> @@ -1,4 +1,4 @@
> -From e31ab477eed061cc72ed6795b483795d53af6dfc Mon Sep 17 00:00:00 2001
> +From ee4f5bd19394e055109486d88ff8e876c5c2572f Mon Sep 17 00:00:00 2001
>  From: Jose Quaresma <quaresma.jose@gmail.com>
>  Date: Sun, 2 May 2021 01:58:01 +0100
>  Subject: [PATCH] tests: add helper script to run the installed_tests
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb
> similarity index 97%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb
> index b727783746d..59f4e99c705 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.4.bb
> @@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
>             file://0003-tests-use-a-dictionaries-for-environment.patch \
>             file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
>             "
> -SRC_URI[sha256sum] = "ce5cd44d4ffeafdcc3dddaa072b2179c0b7cb1abf4e6c5d18d4375f8a39fe491"
> +SRC_URI[sha256sum] = "f5adc7e8f448c10260b3b25aa101c9d540674c8d9a54c2b77a86d04f2b3b50dd"
>
>  PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
>                     check \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#238689): https://lists.openembedded.org/g/openembedded-core/message/238689
> Mute This Topic: https://lists.openembedded.org/mt/119797965/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

