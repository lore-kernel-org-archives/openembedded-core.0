Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F6BC88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 12:46:58 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13994.1789562808085099944
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 05:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FM3p6iSK;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so4826485e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 05:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789562806; x=1790167606; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=25J527rwlyAVpbtc4ynpDhWqNzvq8qQQN0yXwnF7BB4=;
        b=FM3p6iSKlR1s+/v54wkFcUO/i0Qhdnis5giUb3BB60X1bRkQdLYlzYKuykxBqVXWJT
         OkRcLHz13XqwzF6ySBnL1rvKNMqjoRtxMPVZOoLZcnIaD8hhMu+sWgRu6LsMr1eKhz9d
         KBXWL0R96+POHQ2tbvLd92z8pvCsvOAHWUwo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789562806; x=1790167606;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=25J527rwlyAVpbtc4ynpDhWqNzvq8qQQN0yXwnF7BB4=;
        b=FyaREYzr1wyDZaleLS5Ln7WYNl0p/mbXQGVaYYm/ICOjeF9i23zdZEhgf2WtSS6xbU
         r7rG/yC3OihSlxU+bKhJxpJIJbxrX+u2oYrs72AkrKqesrTEecO8jZ8WQbY24pDHS8m3
         c5Tij/Xrfr5xDFUVf4ZXTv8VZ9TAyPQ0VaAI+gbsCEwtp4W7g5uhWfnQ9w2xQmndhYDj
         HLhkWcZwx4Cb7FPBy0YvZg+wdLpAGxnfMaKJ4Oz+eGIJCMK8hyXFcRxL9R6kqztS5yAn
         nu/62e3Lnqhax8D2RclexTrSq7fk15Ut+cWRhpcqM7qTZf8+LAWCSiRrZljPQo0lHEM+
         kMnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQqddsIuj5UHVa1P0zZ6LEWJe1eU0Sf8KJITExbLGe4mVALlbyIMyNDk4iYmRzKO4XTs1gOzt/U6xj9Ys/jqvLZg==@lists.openembedded.org
X-Gm-Message-State: AFuF++mDGTJNb6gqbNvc8VmgFgBvx0Bx5iOS/8dp6AEcP5yb1CDFoyGl
	LK/n+gzEX8xy2G+wGZGdumR8/3/12oT5cX12nT+5iojIK5rBIABRzN4M5CkRzMopN6LOTfyinvS
	zuWAt6/s=
X-Gm-Gg: AYBFou0t+yCOW0gjky2ktgrLu5q3vNGG4WrJW95FkvZvTLLxJQJy5/aUHNsteGeiIUp
	8rXOm0K6a0wB1r6a6NUKKfwilnJ9G4pSfvPQA4xzihZICwvnRITIi1ZA4h/p5NAt6k++y3EWi/c
	lCCWkaaNPG0T+1UtCXDVYakVtnzWpq06+2SlFK0Kwqb4cm3TQaNgQhGCDBQHOkLyNLlTeLZH+8y
	3SVTLBBlWumpxooqAxPZIL7AfrxsgrZUY0SJCQ6/Jh4a+aHKnViIJKxYRfnFMnLqxWmdLE1nElV
	e7y4xVv+CMOwB6xuXKzPxdvjAE2XOvdNJPkxs3gRg4MZ55Lfi1ufXMpzA8w6ABMhg49uvFldDOj
	7KopHN6X/bErlOsCIewwdenjpcUdoV7caDfAZuJxZJSMHBWsIxJ4sxzJMMPQnVC4jOyVYQ9svuP
	l3y7E5UmVcDo3en6VjyH2UM5Oq+uMUBHqdmXasvReQ1030/fl/jqHmKsJNYVRHNlC7Km9rwjJ6Y
	lLOpSdgCh1cAlTBYZ2EgALcT7dwtxosgPNnVzvDUiqjOjK/Dy2biBrYQcY=
X-Received: by 2002:a05:600c:8b30:b0:49e:7862:c09e with SMTP id 5b1f17b1804b1-49eb72fd676mr29110825e9.14.1789562806249;
        Wed, 16 Sep 2026 05:46:46 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847ecf52sm52274405e9.2.2026.09.16.05.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 05:46:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 14:46:45 +0200
Message-Id: <DLGR2JIHPMVI.2TQKCJ9Y7QLHZ@smile.fr>
Subject: Re: [wrynose][PATCH 1/3] expat: fix CVE-2026-50219
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Jakub Szczudlo (Nokia)" <jakub.szczudlo@nokia.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260824152023.19501-1-jakub.szczudlo@nokia.com>
In-Reply-To: <20260824152023.19501-1-jakub.szczudlo@nokia.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 12:46:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245969

On Mon Aug 24, 2026 at 5:20 PM CEST, Jakub Szczudlo (Nokia) wrote:
> Expat does not track whether its public parser APIs are called from insid=
e
> a user handler. Re-entering the parser through XML_GetBuffer(),
> XML_Parse(), XML_ParseBuffer(), XML_ParserFree() or XML_ParserReset() can
> therefore result in use-after-free and memory corruption.
> The 32 upstream commits are divided as follows:
> * 01 introduces the handler call depth counter and the helper functions
>   used to enter, leave and detect handler execution.
> * 02-04 are preparation patches. They extract handler calls from compound
>   expressions so that depth tracking can be placed before and after each
>   invocation without changing handler return-value semantics.
> * 05-26 instrument the individual handler types. Each patch covers a
>   distinct callback path; omitting one would leave a route around the
>   API guards.
> * 27-31 add the actual policy enforcement to XML_GetBuffer(), XML_Parse()=
,
>   XML_ParseBuffer(), XML_ParserFree() and XML_ParserReset().
> * 32 adds regression coverage for all five rejected calls.
> Documentation and Changes-file commits from the upstream
> series are dropped because they do not affect the fix or its test
> coverage.
> An explicit XML_Parser cast is added to the regression-test handler
> because handlers.c is also included by handlers_cxx.cpp and compiled as
> C++ in the OE build.
> Upstream pull request:
> https://github.com/libexpat/libexpat/pull/1246
>
> Signed-off-by: Jakub Szczudlo <jakub.szczudlo@nokia.com>
> ---
>  .../expat/expat/CVE-2026-50219-01.patch       |  61 +++++++
>  .../expat/expat/CVE-2026-50219-02.patch       |  84 ++++++++++
>  .../expat/expat/CVE-2026-50219-03.patch       |  92 +++++++++++
>  .../expat/expat/CVE-2026-50219-04.patch       |  34 ++++
>  .../expat/expat/CVE-2026-50219-05.patch       |  48 ++++++
>  .../expat/expat/CVE-2026-50219-06.patch       | 154 ++++++++++++++++++
>  .../expat/expat/CVE-2026-50219-07.patch       |  32 ++++
>  .../expat/expat/CVE-2026-50219-08.patch       |  44 +++++
>  .../expat/expat/CVE-2026-50219-09.patch       |  44 +++++
>  .../expat/expat/CVE-2026-50219-10.patch       |  35 ++++
>  .../expat/expat/CVE-2026-50219-11.patch       |  32 ++++
>  .../expat/expat/CVE-2026-50219-12.patch       |  42 +++++
>  .../expat/expat/CVE-2026-50219-13.patch       |  49 ++++++
>  .../expat/expat/CVE-2026-50219-14.patch       |  74 +++++++++
>  .../expat/expat/CVE-2026-50219-15.patch       |  82 ++++++++++
>  .../expat/expat/CVE-2026-50219-16.patch       |  46 ++++++
>  .../expat/expat/CVE-2026-50219-17.patch       |  64 ++++++++
>  .../expat/expat/CVE-2026-50219-18.patch       |  32 ++++
>  .../expat/expat/CVE-2026-50219-19.patch       |  87 ++++++++++
>  .../expat/expat/CVE-2026-50219-20.patch       |  62 +++++++
>  .../expat/expat/CVE-2026-50219-21.patch       |  46 ++++++
>  .../expat/expat/CVE-2026-50219-22.patch       |  48 ++++++
>  .../expat/expat/CVE-2026-50219-23.patch       |  36 ++++
>  .../expat/expat/CVE-2026-50219-24.patch       |  33 ++++
>  .../expat/expat/CVE-2026-50219-25.patch       |  35 ++++
>  .../expat/expat/CVE-2026-50219-26.patch       |  33 ++++
>  .../expat/expat/CVE-2026-50219-27.patch       |  30 ++++
>  .../expat/expat/CVE-2026-50219-28.patch       |  30 ++++
>  .../expat/expat/CVE-2026-50219-29.patch       |  31 ++++
>  .../expat/expat/CVE-2026-50219-30.patch       |  31 ++++
>  .../expat/expat/CVE-2026-50219-31.patch       |  31 ++++
>  .../expat/expat/CVE-2026-50219-32.patch       | 100 ++++++++++++
>  meta/recipes-core/expat/expat_2.7.5.bb        |  32 ++++
>  33 files changed, 1714 insertions(+)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-01.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-02.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-03.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-04.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-05.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-06.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-07.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-08.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-09.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-10.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-11.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-12.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-13.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-14.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-15.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-16.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-17.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-18.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-19.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-20.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-21.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-22.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-23.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-24.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-25.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-26.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-27.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-28.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-29.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-30.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-31.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-50219-32.patch

Hello,

This whole series has been superseded by the upgrade that has been
discussed since:
https://patchwork.yoctoproject.org/project/oe-core/patch/20260828110314.762=
756-1-adarsh.jagadish.kamini@est.tech/
In this case, the upgrade looks like the sane thing to do.

Thanks!
--=20
Yoann Congal
Smile ECS


