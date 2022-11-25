Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 748CAC4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 16:56:39 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.51595.1669395388890819145
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Nov 2022 08:56:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=1b0bKDQ5;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.46, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f46.google.com with SMTP id f18so11588412ejz.5
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 08:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/PVaoZpO0n94rWEhWsrXWqCY6WrAutgjsFVeo40rvMA=;
        b=1b0bKDQ5RBROv01FlM/koYt5EvfklAZ8DXyk7CzOje8UfyXDyBLrhvyTVvoa8Hntdv
         pQiahum3otIGObi14MVHLxabtsQkIt7ObM4rpBUMF2PK2sBeqlo8SgPscubDpdkbOaAz
         6NYp1d1CmHGHGv9//fSFqOWNM3RPxsFyXT7qXjoUJxfne/yJ3mo2IdwpoSxIOAIlaxjl
         UsJTwVQN4uaOuawMoYMiUXT3xncNHOcuVLrZU20Qvi6IWd+w2ci7q+E615ZiHwEUK5u5
         9U78DBTWwk/kcegzyDivKsjrNvBQ1NPk1AMD6iOmn+Z7PAVXCarbJ+h4ZwhO2lmiU8ob
         cdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/PVaoZpO0n94rWEhWsrXWqCY6WrAutgjsFVeo40rvMA=;
        b=ox0IiPai/1V83kqorDI2GTpl7a86E5F3WOMS52pBEa3EAKgbns+gOhEl7jiW6pJaRp
         kefJFl0oSIPSeoPWtCfe4nz7wgHNK3XpLSg3l745l54Mz2ZZl0KEMx4SjNYsS2ojPd3p
         bHs5TPmZbnniOoO4ey1GHvikmE+WboUuBHffpK79+adX14GTDEA+2VettMIS7Q0lh9Uw
         ySgh9rlaMlnZ1+hHCzl6mz/Cck/uDiS8iR/pImt+YrT4X6ofzXLSpSk2M56ayMaIX6bz
         af7263iIJjzna3lZySNCXNB74ov6uVGLvaOPdAwVGjNbi0pm2Pc+BFDcagFzGWcjvBFC
         eUWQ==
X-Gm-Message-State: ANoB5plR3+pmra8AsgziXKQK7GLV2oqTk7tGlNMWqDlI0EBFsDJqb06o
	cEZnYKu0hdw0gwC81OlMLBXr1wBztTpjbwVbP/RIrA==
X-Google-Smtp-Source: AA0mqf6IqK84JMuBAhMLkYtpitV/roX4QnmlTZZnhO+HfGGK1LRJ/Do3lXC0mZ/8B+Dt57+1B4ZgopdfD4seKOm2kDQ=
X-Received: by 2002:a17:906:c24d:b0:7ac:2e16:a8d2 with SMTP id
 bl13-20020a170906c24d00b007ac2e16a8d2mr22764858ejb.584.1669395386862; Fri, 25
 Nov 2022 08:56:26 -0800 (PST)
MIME-Version: 1.0
References: <20221124122522.38829-1-vkumbhar@mvista.com>
In-Reply-To: <20221124122522.38829-1-vkumbhar@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 25 Nov 2022 06:56:16 -1000
Message-ID: <CAOSpxdY28yYkE6ZpRazr0khadNMyD02qFtWnzCK+3pU9h3ox=g@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH v2] python3: fix CVE-2022-42919 local
 privilege escalation via the multiprocessing forkserver start method
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 16:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173778

On Thu, Nov 24, 2022 at 2:25 AM vkumbhar <vkumbhar@mvista.com> wrote:
>
> From: Vivek Kumbhar <vkumbhar@mvista.com>
>
> Upstream-Status: Backport from https://github.com/python/cpython/commit/eae692eed18892309bcc25a2c0f8980038305ea2
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  .../python/python3/CVE-2022-42919.patch       | 70 +++++++++++++++++++
>  .../recipes-devtools/python/python3_3.10.7.bb |  1 +

Dunfell python version is 3.8.14, so this patch will not apply. This
seems to be the same as the patch you sent for kirkstone.  Was this
sent in error?

Steve

>  2 files changed, 71 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2022-42919.patch
>
> diff --git a/meta/recipes-devtools/python/python3/CVE-2022-42919.patch b/meta/recipes-devtools/python/python3/CVE-2022-42919.patch
> new file mode 100644
> index 0000000000..6040724dae
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2022-42919.patch
> @@ -0,0 +1,70 @@
> +From 87ef80926ea0ec960a220af89d8ff4db99417b03 Mon Sep 17 00:00:00 2001
> +From: Vivek Kumbhar <vkumbhar@mvista.com>
> +Date: Thu, 24 Nov 2022 17:44:18 +0530
> +Subject: [PATCH] CVE-2022-42919
> +
> +Upstream-Status: Backport [https://github.com/python/cpython/commit/eae692eed18892309bcc25a2c0f8980038305ea2]
> +CVE: CVE-2022-42919
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +
> +[3.10] gh-97514: Don't use Linux abstract sockets for multiprocessing (GH-98501) (GH-98503)
> +
> +Linux abstract sockets are insecure as they lack any form of filesystem
> +permissions so their use allows anyone on the system to inject code into
> +the process.
> +
> +This removes the default preference for abstract sockets in
> +multiprocessing introduced in Python 3.9+ via
> +https://github.com/python/cpython/pull/18866 while fixing
> +https://github.com/python/cpython/issues/84031.
> +
> +Explicit use of an abstract socket by a user now generates a
> +RuntimeWarning.  If we choose to keep this warning, it should be
> +backported to the 3.7 and 3.8 branches.
> +(cherry picked from commit 49f61068f49747164988ffc5a442d2a63874fc17)
> +---
> + Lib/multiprocessing/connection.py                 |  5 -----
> + .../2022-09-07-10-42-00.gh-issue-97514.Yggdsl.rst | 15 +++++++++++++++
> + 2 files changed, 15 insertions(+), 5 deletions(-)
> + create mode 100644 Misc/NEWS.d/next/Security/2022-09-07-10-42-00.gh-issue-97514.Yggdsl.rst
> +
> +diff --git a/Lib/multiprocessing/connection.py b/Lib/multiprocessing/connection.py
> +index 510e4b5..8e2facf 100644
> +--- a/Lib/multiprocessing/connection.py
> ++++ b/Lib/multiprocessing/connection.py
> +@@ -73,11 +73,6 @@ def arbitrary_address(family):
> +     if family == 'AF_INET':
> +         return ('localhost', 0)
> +     elif family == 'AF_UNIX':
> +-        # Prefer abstract sockets if possible to avoid problems with the address
> +-        # size.  When coding portable applications, some implementations have
> +-        # sun_path as short as 92 bytes in the sockaddr_un struct.
> +-        if util.abstract_sockets_supported:
> +-            return f"\0listener-{os.getpid()}-{next(_mmap_counter)}"
> +         return tempfile.mktemp(prefix='listener-', dir=util.get_temp_dir())
> +     elif family == 'AF_PIPE':
> +         return tempfile.mktemp(prefix=r'\\.\pipe\pyc-%d-%d-' %
> +diff --git a/Misc/NEWS.d/next/Security/2022-09-07-10-42-00.gh-issue-97514.Yggdsl.rst b/Misc/NEWS.d/next/Security/2022-09-07-10-42-00.gh-issue-97514.Yggdsl.rst
> +new file mode 100644
> +index 0000000..02d95b5
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2022-09-07-10-42-00.gh-issue-97514.Yggdsl.rst
> +@@ -0,0 +1,15 @@
> ++On Linux the :mod:`multiprocessing` module returns to using filesystem backed
> ++unix domain sockets for communication with the *forkserver* process instead of
> ++the Linux abstract socket namespace.  Only code that chooses to use the
> ++:ref:`"forkserver" start method <multiprocessing-start-methods>` is affected.
> ++
> ++Abstract sockets have no permissions and could allow any user on the system in
> ++the same `network namespace
> ++<https://man7.org/linux/man-pages/man7/network_namespaces.7.html>`_ (often the
> ++whole system) to inject code into the multiprocessing *forkserver* process.
> ++This was a potential privilege escalation. Filesystem based socket permissions
> ++restrict this to the *forkserver* process user as was the default in Python 3.8
> ++and earlier.
> ++
> ++This prevents Linux `CVE-2022-42919
> ++<https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-42919>`_.
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/python/python3_3.10.7.bb b/meta/recipes-devtools/python/python3_3.10.7.bb
> index 404a582135..2d230793ef 100644
> --- a/meta/recipes-devtools/python/python3_3.10.7.bb
> +++ b/meta/recipes-devtools/python/python3_3.10.7.bb
> @@ -35,6 +35,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>             file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
>             file://deterministic_imports.patch \
>             file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
> +           file://CVE-2022-42919.patch \
>             "
>
>  SRC_URI:append:class-native = " \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173744): https://lists.openembedded.org/g/openembedded-core/message/173744
> Mute This Topic: https://lists.openembedded.org/mt/95236618/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

