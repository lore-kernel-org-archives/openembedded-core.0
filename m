Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DF3109C047
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:02:43 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50516.1774537362275060312
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Z4Azifig;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43b40003d13so760170f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 08:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774537360; x=1775142160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TyLq7gnNsa3x3YZrvknJc0zsJU/fdZ6BKX06KyI3sSQ=;
        b=Z4AzifigXVl92RoMtXtdV+tzBsK08cuubnR71Q46AMS9hJ1hhHk6JxWpAud3uQkXUg
         E7m5sg6H4QLwSb47+IjSNWlCbhD4RqZOt3vmh9LANSpkqg1cN6PQ72DsVwzMRGRMZjli
         bjcpYrFMwxz29knOfC8hHaoE0H+zU78mI1F9QGof3SfdylQvoixWn0PhTYO1A57hkNdV
         gLAYRZeRUR+d61SvQP/SYjY92PGGKDwDi6vpwLhY1FWs8u0nBC2NWF6oa+J7554DU9Z2
         3nB3HRj9dvoHjrDREwmgjgjApqJPRIHmZfRCmlwdu545hNi7Vi26wW3zifMc6fZnCLW2
         yaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774537360; x=1775142160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyLq7gnNsa3x3YZrvknJc0zsJU/fdZ6BKX06KyI3sSQ=;
        b=Kzgd//XENn5k6FgHHUbcZhe7VXh/LrIMzbgB2j89q8G+c6sJDSxqCyrH3J5A0S8JEH
         U6iaCrJQQUW2mM2KazVlzcSeAgH34U0oS34ALvyAWBTAmKQdNARbpIry97CzxBT+vwSe
         uZ6Rrx/mzo6jDzA2us0sOk0QJAt78T2o//wxKhigu8AXNRacWev3r/g+Lm2mlgxqJ/RG
         DsI7OID0BMpl3EC1ve8pcM6CE6RYLXF91k+U5M2xAxhnrD1Wd5c3H6OkCkDBYIyH+tPf
         oFuroBCaI+5Z3CdJOZiUqZyVroqxYtyxGJVFP2CdZrjsuYFeiY8xShVPtGP2GnG57nAL
         bpbA==
X-Gm-Message-State: AOJu0Yz9jXjhD1v6/xLUsTaMzvq5z0xvxV65Fa9JAPDJ25/B5gUVvMhC
	sGGjKdkhl4Lu8e6KhZoh+qaQl+8sTH5/8SZR2ZyeudFBMrLvv7U/SPueN8uuSg==
X-Gm-Gg: ATEYQzy4cPwafCT/LRaBlXXVJBUypYCgV0cvKwcIPG+lWF0a9IMdjrIXRMDqBkrbpFC
	OJorVQ3pJCeVWpiQtVBcUJuDuT5xail/v5oh6i4wyRIqPScOQTV7GM9+5rr0Yd8I3+DJ4w2i+AD
	coB9g0oIwstlLCq33mU6Pdk9/LDjYO7cEQItNy8+Y6NwmRkL1vz4ZtmYt2F81CaO+MjafJzrkCH
	sc7DbZLyr5qfJhkYrVnyelMRDV/PsyOd/XtF/iQ2LTKPs5jGey/hXN/lDbbqXvUAxUiXrHfffvj
	DDje/aVHPujvvPURSbMG8xc1OyuMi9jtyYx8q1EAfrs3P1WZnacy/dpNmFgUv2lm4yewwA1Cghw
	hYakPx0VGn0YfAa0QaOkIS6IU1/yLcXfjdlc3Lk+KdEXemcAlBa3FKh+syMuDerhLLk/Dye8ma0
	yVjT5oYtTkvGPRkA==
X-Received: by 2002:a05:6000:4010:b0:43b:50e2:1c9f with SMTP id ffacd0b85a97d-43b88a0d306mr12856557f8f.31.1774537360092;
        Thu, 26 Mar 2026 08:02:40 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e352sm9022321f8f.3.2026.03.26.08.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:02:34 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC][PATCH 0/4] Enable Python free-threading
Date: Thu, 26 Mar 2026 15:35:50 +0100
Message-ID: <20260326150225.2083962-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 15:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234016

Enable Python free-threading and fix some obvious fallouts.
See https://docs.python.org/3/howto/free-threading-python.html

Quote:
==================================================================
Python support for free threading

Starting with the 3.13 release, CPython has support for a build of
Python called free threading where the global interpreter lock
(GIL) is disabled. Free-threaded execution allows for full
utilization of the available processing power by running threads
in parallel on available CPU cores. While not all software will
benefit from this automatically, programs designed with threading
in mind will run faster on multi-core hardware.

Some third-party packages, in particular ones with an extension
module, may not be ready for use in a free-threaded build, and
will re-enable the GIL.
==================================================================

See also for the the post-release announcement on Phoronix and
a benchmark:
https://www.phoronix.com/news/Python-3.14
https://www.phoronix.com/review/python-314-benchmarks

The reasons behind this series are:

* Python free-threading makes threaded Python scripts faster by
  not stalling each other while one of them is parsed.

* Even with the latest 3.13.12, highly threaded scripts may cause
  crashes in the Python interpreter with a backtrace ending similarly
  as below and Google search results pointing to a so called
  "import storm" that makes Python unstable.

  Thread 0x00007f90ebfff6c0 (most recent call first):
  File "<frozen importlib._bootstrap>", line 446 in cb
  File "<frozen importlib._bootstrap>", line 1357 in _find_and_load
  File "<frozen importlib._bootstrap>", line 488 in _call_with_frames_removed
  File "<frozen importlib._bootstrap>", line 1415 in _handle_fromlist
  ...

  I was interested to see whether Python 3.14 with free-threading enabled
  can fix it.

This series builds on the previous v2 series with the cover letter
entitled "Use PYTHON_DIR consistently".

Unfortunately, this series by itself is not enough and a lot of recipes
won't build:

* lldb in clang uses embedded Python code in C/C++ and uses the
  internals of the PyObject implementation, which changes when
  free-threading is enabled. As a result, lldb won't build.
  It may be possible to conditionally disable lldb.

* Many Python modules with binary extensions similary do not build
  against the free-threaded Python.

* Many Python modules, although build, do not work correctly.
  Usually they include thio, or something similarly not quite production
  level indicator line in their PKG-INFO or pyproject.toml

  "Programming Language :: Python :: Free Threading :: 1 - Unstable"

In other words: DO NOT TRY THIS AT HOME.

