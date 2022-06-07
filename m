Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE982C43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 16:53:48 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web08.400.1654620822975138531
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 09:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mHds8VQp;
 spf=pass (domain: gmail.com, ip: 209.85.208.170,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id b7so7360406ljr.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 09:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=71zn8MM1BmsQei0oJfebfFAgJ3VmLOOjcIbA+TPRvbg=;
        b=mHds8VQp3JtGCc4W0lUobwVjleRxRGN8wmfAFNEvAtJhmxkmFj83gnUyRIy0fAjAsL
         HiM4SP+BjdK0Jc5ExwWQcjTmeoLeCpUXm3h865bnVVGOL+pfFMRqkJHkJJSWZ9PQHGq9
         QSByQk95scQozRui3uZsohjbk/AgjHKUr4itl+jCgYzdBwGJuF/Ft8nTvc1h+QeYmUvn
         BrGzYo+kD5Gco7z0X6jERtE37VxnukMnJvZblS6rwi0oRxzYo3G2sedj4MOuBbZlUF/i
         VynKBGhAl7dMra7QYQF5dBMLOhw5vrM2CTo++e/11fPS6acaYb+yxDOtuRFNhm0Qfd7D
         1AUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=71zn8MM1BmsQei0oJfebfFAgJ3VmLOOjcIbA+TPRvbg=;
        b=R52it0R1YPK5Fz76WrTg7bwDukRTGIX7DDgEeQFXJlQvOKp0Ym/JXlFFz1uoiMjYtR
         MSEUTMWGtvmXRatnFZ3+3HEammn0B6iFgevlXCpQ5hJSDud4vSQmZX6535n2DM+Gbikx
         KwKUqVD2NWsOvXeV4NaT20Hp2EAZDoHyYANyPDW64mITNgmNh26UOsCPo/esqmcLH9Bb
         GpoVTc2lFplFpSfOlk1gg4uosQRMlf9uJFy/runl8997evuZJLD/1i1P78bfgEzsiMyN
         GlPsz06LksxY5OvrMdqnnag8CsDgIvSLR5i8rcj7uKdJGMytiuuUBtx4MHy4wVTzP7j5
         PvDg==
X-Gm-Message-State: AOAM530mZqURGJdP8yu7jSnTPzuRupF5ziStYdAEOfhJodwQFG0/ePdc
	5cr0GKRZmj5ZCG/cEwGgV2WXk8nUqo8Q0WUucgo=
X-Google-Smtp-Source: 
 ABdhPJw/PdR9ewOV+7XrPN9aknlVf8EffRsLt1rBVHhuFRC8EODk0c70hWzKvlGTdKn3DehEchAuPYwDUnCwiB05EfE=
X-Received: by 2002:a2e:8898:0:b0:255:877b:5315 with SMTP id
 k24-20020a2e8898000000b00255877b5315mr10233107lji.191.1654620821060; Tue, 07
 Jun 2022 09:53:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220607151123.3588947-1-ptsneves@gmail.com>
In-Reply-To: <20220607151123.3588947-1-ptsneves@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Jun 2022 18:53:29 +0200
Message-ID: 
 <CANNYZj-YRAU+RJQ8JwqAxgSJto+LAbMQxQ-yOB8c3PBCcsr7OQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/5] python: Avoid shebang overflow on
 python-config.py
To: Paulo Neves <ptsneves@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 16:53:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166679

I'm not sure this is Inappropriate. Can you send this to upstream nevertheless?

Alex

On Tue, 7 Jun 2022 at 17:11, Paulo Neves <ptsneves@gmail.com> wrote:
>
> The native path may be too big, leading to shebang
> overflow. Just use the #!/usr/bin/env python3.
>
> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> ---
>  ...shebang-overflow-on-python-config.py.patch | 29 +++++++++++++++++++
>  .../recipes-devtools/python/python3_3.10.4.bb |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
>
> diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
> new file mode 100644
> index 0000000000..9f23278a30
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
> @@ -0,0 +1,29 @@
> +From f0c9dec63d452a7cd1e15ea653f4aced281f021c Mon Sep 17 00:00:00 2001
> +From: Paulo Neves <ptsneves@gmail.com>
> +Date: Tue, 7 Jun 2022 16:16:41 +0200
> +Subject: [PATCH 1/1] Avoid shebang overflow on python-config.py
> +
> +The whole native path may be too big, leading to shebang
> +overflow. Let's just use the env shebang.
> +
> +Upstream-Status: Inappropriate [distribution]
> +---
> + Makefile.pre.in | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> +index f0aedb76cb58999427804255da56fa53284d7032..dd88e43114730f7681715777cc76dabb31113176 100644
> +--- a/Makefile.pre.in
> ++++ b/Makefile.pre.in
> +@@ -1638,6 +1638,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
> +       @ # Substitution happens here, as the completely-expanded BINDIR
> +       @ # is not available in configure
> +       sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," < $(srcdir)/Misc/python-config.in >python-config.py
> ++      @ # Otherwise we might get huge shebangs with native paths
> ++      sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' python-config.py
> +       @ # Replace makefile compat. variable references with shell script compat. ones; $(VAR) -> ${VAR}
> +       LC_ALL=C sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' < Misc/python-config.sh >python-config
> +       @  # In OpenEmbedded, always use the python version of the script, the shell
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb b/meta/recipes-devtools/python/python3_3.10.4.bb
> index 6bd3a6aba8..357025f856 100644
> --- a/meta/recipes-devtools/python/python3_3.10.4.bb
> +++ b/meta/recipes-devtools/python/python3_3.10.4.bb
> @@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>             file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch \
>             file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
>             file://deterministic_imports.patch \
> +           file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
>             "
>
>  SRC_URI:append:class-native = " \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166670): https://lists.openembedded.org/g/openembedded-core/message/166670
> Mute This Topic: https://lists.openembedded.org/mt/91602889/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

