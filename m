Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03640C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 12:19:07 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.12150.1751026738087328204
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 05:18:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nWfXXKQc;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6fad4e6d949so14678386d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 05:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751026737; x=1751631537; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jq8xY02ZkwzGe5lWL9QLJYHqlFcF4Oypv5ApZYBT41s=;
        b=nWfXXKQcD2YyrXMNWm3cfPjOtIwL6H76obRT9G1cGg2Bn/qm/xEbwdXxY3hEBSq9BT
         ClLZSDztyt3cYMy781CqDlcRFf4xVzLk9FpHeaABHqOeIGpW+kFlWl/5GoG2Co7j5/It
         xCmBwPnADsNHHBb7/LQPVvCfwpoLOeROlACW341NrCBkW2OCFhC/vSe376tFY8QGNyou
         E2VQpmjHblzmP8BmvKantOKw87Bc1DHFCbHuexpO7ltJg31M+fkIPRRiAhuue6A9+Ygv
         c7J7ul27CLGBbIrtNXxm8wqHKoorQpYbt3NjHtPCFuaXXoQUSSfD59VJLXrTiMbb7b0D
         S/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751026737; x=1751631537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jq8xY02ZkwzGe5lWL9QLJYHqlFcF4Oypv5ApZYBT41s=;
        b=ttfVwW7Dk02liEjCGBwUcPeh8yicX9DofBkqWNjwLZ9fF/TUmLz//hqcXH/Q2kgr3L
         zf2s6ubdnavyKNexWq6J/4SEjyfgLMmNjWiOLbDAx6JmArR6je6q1pebR+g0tZlCT1wT
         cKt2yRKhzK4qfYsfilQz2Mn7/940zPs/os/1Bv+5xUEDHdlmGTx8wXZerYmPIiTK68zK
         apSpAzMYz4KqDnoRzY2ETZiQuCxN0d0p0UXegGvu/4veFMZ1unTPv6t9xfNcNHjXPk95
         ozHZJppxE+oLP4S+JDxzDJq8mKoczjWWvJjNPL/9GULitbFjUTz5m0WdPwNjCRglKiDy
         vyKQ==
X-Gm-Message-State: AOJu0YyfpL/O161YYaylXx8BoQdVTo0y8LnA+N0GOLxCFojH2YouT7qf
	ELL4fu+slCGrF14RH6juQVAAiMC22HkEuZQk0pGVQ+bRiQTUyhq7WfVHOUXkxYnAGZxi4Y3101f
	GbTG5/MitvcVJRouxVXA9mwy8O1N2xTs0P2QK
X-Gm-Gg: ASbGncuRpi2FctIS33zBnevrXMQB0IX7zi7D5ZwJdswJC63xxbSM0ziLs9f6dGJoRgo
	AOvQzTeUAxE9lLc6MJFRxy5lIrC287+h6taCip+TO09g0Y3//+vgFsJX66XqhJ4pkA5BqljVfwv
	KnqPcHvCCJ+ZsZ+h6gBLVxJwcW7mkVzLcKH/BbmVUZZKFr6iHnIuO1LDWiuyd1nV2DFSW56hohL
	WztPA==
X-Google-Smtp-Source: AGHT+IGWXLcOc7GsCbfPTfjPYMJLhY9JMoedKXqE1pbzBc8/zVCd1dFrgh1QvP3BtQi55qqvhHAFqrpzujMvWFx8At8=
X-Received: by 2002:a05:6214:4521:b0:6fb:5bb5:ccfb with SMTP id
 6a1803df08f44-7000262861fmr64190606d6.34.1751026736730; Fri, 27 Jun 2025
 05:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250627120633.4084140-1-Moritz.Haase@bmw.de> <20250627120633.4084140-3-Moritz.Haase@bmw.de>
In-Reply-To: <20250627120633.4084140-3-Moritz.Haase@bmw.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 27 Jun 2025 14:18:45 +0200
X-Gm-Features: Ac12FXxYkZAWC3tuhOwr3gtyrejbXiMiGYMDT-xFnQqXYZcKD_KMdBOUzWb0p1Q
Message-ID: <CANNYZj-1MCzMUymZ209zOqZYWRNMcPXjX1X87=rxXTnUptgg6w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] cmake: Update license checksums
To: Moritz.Haase@bmw.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 12:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219403

This should be squashed into the update commit, to preserve bisectability.

You also need to include a License-Update tag, something like:

License-Update: please see the explanation above.

Alex

On Fri, 27 Jun 2025 at 14:07, Moritz Haase via lists.openembedded.org
<Moritz.Haase=bmw.de@lists.openembedded.org> wrote:
>
> The main license file has been renamed from Copyright.txt to LICENSE.rst in [0].
> References to the file have been updated, causing changes to the licensing
> header in 'cmake.h' (see [1]).
>
> Additionally, the '1996 - 2024' copyright statement in (cm)curl's COPYING was
> updated to '1996 - 2025' in [2].
>
> [0]: https://gitlab.kitware.com/cmake/cmake/-/commit/2d42a5444f859891b6598c76ea5d51510013565e
> [1]: https://gitlab.kitware.com/cmake/cmake/-/commit/de273b2e115974a012a6204ffee046dc9ce77586
> [2]: https://gitlab.kitware.com/cmake/cmake/-/commit/48b13baebc7f99442c3b872f202efd2fb92d6d7f
>
> Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
> ---
>  meta/recipes-devtools/cmake/cmake-native_4.0.3.bb | 2 +-
>  meta/recipes-devtools/cmake/cmake.inc             | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/cmake/cmake-native_4.0.3.bb b/meta/recipes-devtools/cmake/cmake-native_4.0.3.bb
> index 6b392f1370..7b90bff52f 100644
> --- a/meta/recipes-devtools/cmake/cmake-native_4.0.3.bb
> +++ b/meta/recipes-devtools/cmake/cmake-native_4.0.3.bb
> @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM:append = " \
>      file://Utilities/cmexpat/COPYING;md5=7b3b078238d0901d3b339289117cb7fb \
>      file://Utilities/cmlibrhash/COPYING;md5=a8c2a557a5c53b1c12cddbee98c099af \
>      file://Utilities/cmlibuv/LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d \
> -    file://Utilities/cmcurl/COPYING;md5=eed2e5088e1ac619c9a1c747da291d75 \
> +    file://Utilities/cmcurl/COPYING;md5=72f4e9890e99e68d77b7e40703d789b8 \
>  "
>
>  B = "${WORKDIR}/build"
> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
> index 312c2b04f7..a15dfd3bb4 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -10,8 +10,8 @@ HOMEPAGE = "http://www.cmake.org/"
>  BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
>  SECTION = "console/utils"
>  LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://Copyright.txt;md5=718f05155941b33862726348d3cd46ce \
> -                    file://Source/cmake.h;beginline=1;endline=2;md5=a5f70e1fef8614734eae0d62b4f5891b \
> +LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=0cafc0f3b6b28f3d5ecb5d1a68c36471 \
> +                    file://Source/cmake.h;beginline=1;endline=2;md5=4ba59ac0e953e1a713eea8c55b1d531b \
>                      "
>
>  CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219396): https://lists.openembedded.org/g/openembedded-core/message/219396
> Mute This Topic: https://lists.openembedded.org/mt/113859914/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

