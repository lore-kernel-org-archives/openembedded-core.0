Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E930C43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 07:30:15 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web12.3141.1655105410846807064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 00:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VF1ypd0Q;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id y32so7448264lfa.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 00:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+3FH2Kli/alDVPHixGjxNyk/pMYp+4fO/bLX4kFqZ4Q=;
        b=VF1ypd0QXf9vpQOjz6jvqQuQ1ta3kHjTgUu/pgb5cSH5TQUaJI2uyaxlfXGZjwQl+D
         wpS1dIpjypfEVfeVbU73T9kNO6yyE0F9xA7P2HR176SyloR0PsV0cTJlTgZYQL7ZmKor
         zUw1/3GpVKnDHPzLnKexqKrN2vjIzQPQTr3JIDF8K0lJGvyaA3v8kgqAQFFx0NOA1qsd
         K977EVt9N9+Ma/3T/Gd4HCvSBCmXjceVpr/EnRQegF5lSaRrJoYADmQap246gsXBm1HD
         gM84OFlIBcCHtNcrQdkQN1wmV8Hmn69I8gbCQ+G34qk/rN0uMW9pLGIDahN5Xtdnpfh0
         OQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+3FH2Kli/alDVPHixGjxNyk/pMYp+4fO/bLX4kFqZ4Q=;
        b=mmlOyn0PBkhy3t9cHB1iO38emQDBz+zKxCMYU3SRkTip9qYFjl1OgiZYN0+LROW/KQ
         L/ZBBAYp0sKUXRAeN7uqNh1oE/hMUEOr7cjrjcb7PeDag0AaK26+yXiuDn/xqxxzZyQ7
         TmSuS6jzw8HO7dqQL3ovZmbi9OzUTRd6QGVx2wACcbFMxT05bWm5wGAeHdc2KIZY9ZY6
         w8UwpnGLhhBlMXwVWzWRJOTa/FmpBWD0Kr6g/a9n9G1P8Up/SLisYjw8XxkRqIHobjfM
         pOPju5pZQiYDbxPCfEbIYspJDEzjSRWKeTCZJg4efdMdVKKdL2z/gDH/8KfHeFjon7kc
         zVLg==
X-Gm-Message-State: AOAM532LvvbB59m9fnVVup219cXBDQnZ2YXL4m1Uh3cS53RD+TU1eEGM
	+MI5ppnqsh6Dj8yCVabmXu78X2JR1159J3k0uH5w2oDJuVw=
X-Google-Smtp-Source: 
 ABdhPJydGR9o92qbO6n1JGGF+CzqoHXOeWyIjTipttONIdDV/fzViRLnhoJcdF9c+1YiRNJQxAtgq7Aamlv20EvuIaM=
X-Received: by 2002:ac2:5d31:0:b0:47d:c71c:50d5 with SMTP id
 i17-20020ac25d31000000b0047dc71c50d5mr4914334lfb.665.1655105409114; Mon, 13
 Jun 2022 00:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220610214314.2754247-1-ptsneves@gmail.com>
In-Reply-To: <20220610214314.2754247-1-ptsneves@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Jun 2022 09:30:04 +0200
Message-ID: 
 <CANNYZj_e=nGby_zVsUEzHmGS9o+nutMXcdeCTDuRExEy+36DYQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/7] python: Avoid shebang overflow on
 python-config.py
To: Paulo Neves <ptsneves@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 07:30:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166831

As requested, please submit upstream.

Alex

On Fri, 10 Jun 2022 at 23:43, Paulo Neves <ptsneves@gmail.com> wrote:
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
> View/Reply Online (#166813): https://lists.openembedded.org/g/openembedded-core/message/166813
> Mute This Topic: https://lists.openembedded.org/mt/91678611/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

