Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D68C43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 12:36:17 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web08.5324.1655123775871895383
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 05:36:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RbmDa3nl;
 spf=pass (domain: gmail.com, ip: 209.85.167.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id s6so8568457lfo.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 05:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i6xaeKlyk9RXP1xStUBwtz7QVgelvC0bM/jRlsQy8zs=;
        b=RbmDa3nlTDsyCpXImbuWofnJH3Ki8eQUH0e7YB1LQXrwB4Yy93IjGo7UH+2HlCET2e
         LcYzLhL52d7EQSkCx+a1QbNWL2gWp2hc3zPTM339lpo5Mp6tX+OxrkMIbPt2iL9kk/wM
         8Z5PERtNSpPl8/DQ1hL67zarpPXmT3Xsx/bxet3oznERzRmWAF3TyvCX64PwvgvZ6ERr
         LpxBJwXemOQGyRcioNvi5Sf22KlFqJpH/nxuFiYYywTMYrN9TNl3zqMKPAqSSw7kIgqP
         UXvWISX6q46g8UPectSOX/gPJrOqXS5ssLsx/ccv/7kZUSm1sdwv3s+i/MybemfZfStO
         MgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i6xaeKlyk9RXP1xStUBwtz7QVgelvC0bM/jRlsQy8zs=;
        b=ZysSXEAbpd2CTkQdXkJVG0HGyrqlgOUC80xRY1eOD8Xdsr2rafcnIDfe7I5Uc+144E
         dYDyaZz7wni2yy3/96UbM5E/Py1SRXg4Vz9heJRYeYN5t1TiA6NAHEUvFQaSh79iLYrB
         9G07b7olHMmtllCSZQ++YgZ7L4VMoYoh0+2OFeaM8wsRcwixC6/BgAu0+/q3qaL195zM
         An/5K9cJyQKE7Y1itwHkZ1tXirAOHMktiErrmMNbNIgJRDQZVX7q2tHnEXFBVae06wLQ
         zxB77tKT3RdQoN4b8nrCoo6N2jWPdGWJkcTWplIZ0RAY5GL8vdNHn+pSIr+CKjGs7jjB
         fGhw==
X-Gm-Message-State: AOAM531nHeK300Gxh7g7/5jkzqtIsT6FFlxVyLC4qXI9K91yCjFQmqMA
	iqTJpmhcSVQGqzca8vNa2Mt7UUTqV6wpGWILQMc=
X-Google-Smtp-Source: 
 ABdhPJyV7rv08c6K4Ovumolm9bKwS6mhBZGnLyyOimjquQDreZbVLW1A/XKPXhZ0DbW4tc+ph+YvMsr6SVHqTR+2NLk=
X-Received: by 2002:a05:6512:3448:b0:479:10f0:11c7 with SMTP id
 j8-20020a056512344800b0047910f011c7mr34043286lfr.521.1655123774051; Mon, 13
 Jun 2022 05:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220610214314.2754247-1-ptsneves@gmail.com>
 <CANNYZj_e=nGby_zVsUEzHmGS9o+nutMXcdeCTDuRExEy+36DYQ@mail.gmail.com>
 <a58cdf25-70a2-967b-2802-e35e6a62c6fb@gmail.com>
In-Reply-To: <a58cdf25-70a2-967b-2802-e35e6a62c6fb@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Jun 2022 14:36:02 +0200
Message-ID: 
 <CANNYZj_1agiASmtFXEY=NsZTWBFjwSkuFk6BkQd8DG-2DOxGqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/7] python: Avoid shebang overflow on
 python-config.py
To: Paulo Neves <ptsneves@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 12:36:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166838

Thanks, can you resend with updated Upstream-Status that includes the link?

Alex

On Mon, 13 Jun 2022 at 12:32, Paulo Neves <ptsneves@gmail.com> wrote:
>
> As requested
> https://github.com/python/cpython/pull/93760
>
> Paulo Neves
>
> On 6/13/22 09:30, Alexander Kanavin wrote:
> > As requested, please submit upstream.
> >
> > Alex
> >
> > On Fri, 10 Jun 2022 at 23:43, Paulo Neves <ptsneves@gmail.com> wrote:
> >> The native path may be too big, leading to shebang
> >> overflow. Just use the #!/usr/bin/env python3.
> >>
> >> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> >> ---
> >>   ...shebang-overflow-on-python-config.py.patch | 29 +++++++++++++++++++
> >>   .../recipes-devtools/python/python3_3.10.4.bb |  1 +
> >>   2 files changed, 30 insertions(+)
> >>   create mode 100644 meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
> >>
> >> diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
> >> new file mode 100644
> >> index 0000000000..9f23278a30
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
> >> @@ -0,0 +1,29 @@
> >> +From f0c9dec63d452a7cd1e15ea653f4aced281f021c Mon Sep 17 00:00:00 2001
> >> +From: Paulo Neves <ptsneves@gmail.com>
> >> +Date: Tue, 7 Jun 2022 16:16:41 +0200
> >> +Subject: [PATCH 1/1] Avoid shebang overflow on python-config.py
> >> +
> >> +The whole native path may be too big, leading to shebang
> >> +overflow. Let's just use the env shebang.
> >> +
> >> +Upstream-Status: Inappropriate [distribution]
> >> +---
> >> + Makefile.pre.in | 2 ++
> >> + 1 file changed, 2 insertions(+)
> >> +
> >> +diff --git a/Makefile.pre.in b/Makefile.pre.in
> >> +index f0aedb76cb58999427804255da56fa53284d7032..dd88e43114730f7681715777cc76dabb31113176 100644
> >> +--- a/Makefile.pre.in
> >> ++++ b/Makefile.pre.in
> >> +@@ -1638,6 +1638,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
> >> +       @ # Substitution happens here, as the completely-expanded BINDIR
> >> +       @ # is not available in configure
> >> +       sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," < $(srcdir)/Misc/python-config.in >python-config.py
> >> ++      @ # Otherwise we might get huge shebangs with native paths
> >> ++      sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' python-config.py
> >> +       @ # Replace makefile compat. variable references with shell script compat. ones; $(VAR) -> ${VAR}
> >> +       LC_ALL=C sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' < Misc/python-config.sh >python-config
> >> +       @  # In OpenEmbedded, always use the python version of the script, the shell
> >> +--
> >> +2.25.1
> >> +
> >> diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb b/meta/recipes-devtools/python/python3_3.10.4.bb
> >> index 6bd3a6aba8..357025f856 100644
> >> --- a/meta/recipes-devtools/python/python3_3.10.4.bb
> >> +++ b/meta/recipes-devtools/python/python3_3.10.4.bb
> >> @@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
> >>              file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch \
> >>              file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
> >>              file://deterministic_imports.patch \
> >> +           file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
> >>              "
> >>
> >>   SRC_URI:append:class-native = " \
> >> --
> >> 2.25.1
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#166813): https://lists.openembedded.org/g/openembedded-core/message/166813
> >> Mute This Topic: https://lists.openembedded.org/mt/91678611/1686489
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>
>

