Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1B9C6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 15:59:53 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.988.1693411184127857935
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 08:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QLOTXZs8;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.44, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-99bf3f59905so752217566b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 08:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693411182; x=1694015982; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7GG1dH/MB3QWx8hQ6ZkvtlKfbtj63rwggh7sctO6K0=;
        b=QLOTXZs8IEaGJ2N7+AztIXb4fu9mNpRbTZWT6hWAAhGy9Pw+97I+tE2yux6IzEHcip
         TK8/zejqhrzO0cBuj/HuGiHi+lUFn+JX3OZ9s99aCCXTFG+sfoEofxGCGYrCXk06pAU9
         hs09ZBXvhsttsMjm9lMt/x3nRDRx9i/Dazhi1ECbKetemy/GrIG1NsBLErO3eoTxaMbv
         1kSCt5W+POVk6gdG8b6PurknLsR7x5u/AiWftM12Lr7/qbVvbhEAg7Yy5GA9nGb0dxjK
         20Tu/WkzNeI+CklchTuQvtuNfvjfbtvDARJxD0xViAWK7H/a4XoRODIrtjUnz86I4k5H
         +wfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693411182; x=1694015982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7GG1dH/MB3QWx8hQ6ZkvtlKfbtj63rwggh7sctO6K0=;
        b=YqLfG+J+mQ+zeOEF+12XJf1L9xeBJZBRZN1XaHdw+8BvFy9mFpPc62CEoaprHRfe9I
         ZkrPPfRUR7Fwp+8ZseBEGTVkNTueXa02+MiWQOJGv9eqae/E4QKEBWqaHvY0q+64YaqP
         XmMO06UO4qNU+OpTeOTxFHRmHKAjU1GkEnSPqNgWNSVHnQ1XMxR/hd3K1IbVRIBunzOu
         JHjIT1w1o85jJ05YhdSG5Fwtm7jKk3P/DPmHZachSUhhUTcTwCIJ+xNbwiTL5vr1Tgt5
         WKk76wU1Re1JYTYc50KZhIs2JuPjv6UsoT+Xf1zc7hAnXNk6iSdeN47rtI7Ld2GpZk+R
         7qdw==
X-Gm-Message-State: AOJu0Yz7udKnLW73N/5YLG5uyuR8LABWtF6uzrNZLakKTeyENtQz/gab
	JajYS3hYF4qJBfm/o8ITQtZ5zrI2h6CrqQCuurnkpA==
X-Google-Smtp-Source: AGHT+IG1xoN0G+HdG8+3ybxY8n+uZX/tKN4gb6HBRXbxnVYoWLMs9uzbYiAnQGaykDXOTbexI8E6LChPvBl85ynIxos=
X-Received: by 2002:a17:907:7799:b0:9a1:bf88:b67a with SMTP id
 ky25-20020a170907779900b009a1bf88b67amr1989302ejc.52.1693411182245; Wed, 30
 Aug 2023 08:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230830083430.871652-1-Martin.Jansa@gmail.com>
In-Reply-To: <20230830083430.871652-1-Martin.Jansa@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 30 Aug 2023 05:59:31 -1000
Message-ID: <CAOSpxdZgrH78pZ4dvY1D=mv6r2+5toT-M5=cDTz9E=iG-1DOoQ@mail.gmail.com>
Subject: Re: [kirkstone][PATCH] libdnf: backport a fix to build with gcc-13
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 15:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186898

I took a patch submitted yesterday for this same issue:

https://lists.openembedded.org/g/openembedded-core/message/186814

It contains three patches from upstream, rather than the two in your submis=
sion.

Could you please take a look and see if there is an issue with keeping
yesterday's submission?

Thanks!

Steve

On Tue, Aug 29, 2023 at 10:34=E2=80=AFPM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
>
> * needed to build libdnf-native on hosts with gcc-13
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...ite3-Sqlite3.hpp-add-missing-cstdint.patch | 33 +++++++++++++++++++
>  ...onNumber.hpp-add-missing-cstdint-inc.patch | 30 +++++++++++++++++
>  meta/recipes-devtools/libdnf/libdnf_0.66.0.bb |  2 ++
>  3 files changed, 65 insertions(+)
>  create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-libdnf-utils=
-sqlite3-Sqlite3.hpp-add-missing-cstdint.patch
>  create mode 100644 meta/recipes-devtools/libdnf/libdnf/0002-libdnf-conf-=
OptionNumber.hpp-add-missing-cstdint-inc.patch
>
> diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-utils-sqlite=
3-Sqlite3.hpp-add-missing-cstdint.patch b/meta/recipes-devtools/libdnf/libd=
nf/0001-libdnf-utils-sqlite3-Sqlite3.hpp-add-missing-cstdint.patch
> new file mode 100644
> index 0000000000..8bd63ebaae
> --- /dev/null
> +++ b/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-utils-sqlite3-Sqlit=
e3.hpp-add-missing-cstdint.patch
> @@ -0,0 +1,33 @@
> +From 4413d3f62f0abba02ba73de92025da50e37efad0 Mon Sep 17 00:00:00 2001
> +From: Sergei Trofimovich <slyich@gmail.com>
> +Date: Fri, 27 May 2022 22:12:07 +0100
> +Subject: [PATCH] libdnf/utils/sqlite3/Sqlite3.hpp: add missing <cstdint>
> + include
> +
> +Without the change libdnf build fails on this week's gcc-13 snapshot as:
> +
> +    In file included from /build/libdnf/libdnf/sack/../transaction/Swdb.=
hpp:38,
> +                     from /build/libdnf/libdnf/sack/query.hpp:32,
> +                     from /build/libdnf/libdnf/dnf-sack-private.hpp:31,
> +                     from /build/libdnf/libdnf/hy-iutil.cpp:60:
> +    /build/libdnf/libdnf/sack/../transaction/../utils/sqlite3/Sqlite3.hp=
p:100:33: error: 'std::int64_t' has not been declared
> +      100 |         void bind(int pos, std::int64_t val)
> +          |                                 ^~~~~~~
> +
> +Upstream-Status: Backport [v0.68.0 https://github.com/rpm-software-manag=
ement/libdnf/commit/24b5d7f154cac9e322dd3459f6d0a5016abbbb57]
> +---
> + libdnf/utils/sqlite3/Sqlite3.hpp | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/libdnf/utils/sqlite3/Sqlite3.hpp b/libdnf/utils/sqlite3/Sql=
ite3.hpp
> +index 3a7da23c..0403bb33 100644
> +--- a/libdnf/utils/sqlite3/Sqlite3.hpp
> ++++ b/libdnf/utils/sqlite3/Sqlite3.hpp
> +@@ -27,6 +27,7 @@
> +
> + #include <sqlite3.h>
> +
> ++#include <cstdint>
> + #include <map>
> + #include <memory>
> + #include <stdexcept>
> diff --git a/meta/recipes-devtools/libdnf/libdnf/0002-libdnf-conf-OptionN=
umber.hpp-add-missing-cstdint-inc.patch b/meta/recipes-devtools/libdnf/libd=
nf/0002-libdnf-conf-OptionNumber.hpp-add-missing-cstdint-inc.patch
> new file mode 100644
> index 0000000000..b2bd6877b5
> --- /dev/null
> +++ b/meta/recipes-devtools/libdnf/libdnf/0002-libdnf-conf-OptionNumber.h=
pp-add-missing-cstdint-inc.patch
> @@ -0,0 +1,30 @@
> +From 12582624bb5e25b84124dcd3b35b358ad56ba2ec Mon Sep 17 00:00:00 2001
> +From: Sergei Trofimovich <slyich@gmail.com>
> +Date: Fri, 27 May 2022 22:13:48 +0100
> +Subject: [PATCH] libdnf/conf/OptionNumber.hpp: add missing <cstdint> inc=
lude
> +
> +Without the change libdnf build fails on this week's gcc-13 snapshot as:
> +
> +    In file included from /build/libdnf/libdnf/conf/ConfigMain.hpp:29,
> +                     from /build/libdnf/libdnf/conf/ConfigMain.cpp:21:
> +    /build/libdnf/libdnf/conf/OptionNumber.hpp:94:41: error: 'int32_t' i=
s not a member of 'std'; did you mean 'int32_t'?
> +       94 | extern template class OptionNumber<std::int32_t>;
> +          |                                         ^~~~~~~
> +
> +Upstream-Status: Backport [v0.68.0 https://github.com/rpm-software-manag=
ement/libdnf/commit/f8af6399c4f6a65a35d33ecc191bb14094dc9e18]
> +---
> + libdnf/conf/OptionNumber.hpp | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/libdnf/conf/OptionNumber.hpp b/libdnf/conf/OptionNumber.hpp
> +index f7a7b3d6e..a3a4dea67 100644
> +--- a/libdnf/conf/OptionNumber.hpp
> ++++ b/libdnf/conf/OptionNumber.hpp
> +@@ -25,6 +25,7 @@
> +
> + #include "Option.hpp"
> +
> ++#include <cstdint>
> + #include <functional>
> +
> + namespace libdnf {
> diff --git a/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb b/meta/recipes=
-devtools/libdnf/libdnf_0.66.0.bb
> index 2558f96851..9154414212 100644
> --- a/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
> +++ b/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
> @@ -11,6 +11,8 @@ SRC_URI =3D "git://github.com/rpm-software-management/l=
ibdnf;branch=3Ddnf-4-master;p
>             file://enable_test_data_dir_set.patch \
>             file://0001-drop-FindPythonInstDir.cmake.patch \
>             file://0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-d=
ata.patch \
> +           file://0001-libdnf-utils-sqlite3-Sqlite3.hpp-add-missing-cstd=
int.patch \
> +           file://0002-libdnf-conf-OptionNumber.hpp-add-missing-cstdint-=
inc.patch \
>             "
>
>  SRCREV =3D "add5d5418b140a86d08667dd2b14793093984875"
> --
> 2.42.0
>

