Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8B0FD5317
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 09:12:09 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91628.1772183520606680464
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 01:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HwAO5lyy;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48371bb515eso24401975e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 01:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772183519; x=1772788319; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ov7EI7hLPnG1QFXum4keBrzyY1wG14y3kAQ433w2tVA=;
        b=HwAO5lyy9wKvxbqx6nyAu/Hy0ZEcq6p9yaN/YyRWJ4n9zW/SS2p7jJrFPF3hTRlgiy
         VH0D+0JUQGuM78EaZIGTPDyYXenSo4xqRhM9rGth59bblx0P751ET1GYQlfakZWtn64g
         xfcp4Up6aAjJcvu/+9g2BE8lFTXtodZyIzEZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772183519; x=1772788319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ov7EI7hLPnG1QFXum4keBrzyY1wG14y3kAQ433w2tVA=;
        b=Z7c7Xnpn6TmUNIcspBuZ18WNtPzpmtGGqyqDjEV6kmjsVOJNBKn2bDN0CjhPqFplYD
         XR67BEGKEzTO9j4ZZK8rYZMpZQAECkHy8Cgx3O7SDQGVjIwGQ9Avv+ADGfdI/vz4vVxJ
         TV4W/+kjCuQWgpzm0/jmSQVQn8UawlhNOyj6cP446hYGQ+BWW2wiGUeK3LBz8MxTbPkk
         5IsI8rO27d6xbGSBAgDmiog9ytXQpgWJ5zjbHqMzV2yAj4dHoC8Uc5VMu7LNGPr8vUfO
         ybU8d9VIM82ewkNpEaktvd0tIs9xRr26nm+Cxk6UXoFWNSDwMKtX3RRCi8i7zXkv0CRi
         lNvQ==
X-Gm-Message-State: AOJu0YyAAJH8BhIsE9xHf8m3BkbQ7evXGlwoJIGkAXkbOFKSjrQqrDxW
	Rpo9fRvp0Xm0MuUVWWxaxfaXgGGZNVH9WcrsM1TA6F3MTHOSJo+TspP3Gsci3U6zgYoDP2UbuFr
	C77YC
X-Gm-Gg: ATEYQzxS8bLyWfO1Jz/aEzETC2EIsu6RCxsUtyTB0Yf/OevBSEFI9hjBiP+iQ/X1azo
	vAqmFwqNHGUqEgTChGN2HGvZXMH1KwhLS1/4NjoamKNq5SsaSRvL7LkGd7MPMkq/ME3fyx7qwKV
	tbEaclArse3gz2FdCyUGYztUYqdDLBM+5UJ3IQO0wpGJSe1nPdxDhfwF6nF7W5r3xl3/8iuBoSg
	NlQYp750vj7ih/wYnzLNl/eF1VbhJJDBSiMq/fWOc/7vyFzW1aRDX21N1qYLpCE3Ye2gTvD3sZZ
	Gf8scLWStnau7arb9BdQJcCgpHPB+mj0/X9z3F3+66mk4EokpaRbpOUbTzI/pwScwMwq0pUhfc+
	glFr5aHuhRkqHuRF7/sneDD3mwPrAuy8anzMyR80gfNx5xCmWUlAAcyVV8sjJAPwiwXgrMctxe1
	pQFCPwvtSrCekegGeTTPr6l2wyg8QiHJ+lQlJ/IeQlx7Fm21cvvLUzS1Oiyn/xlmtscFuZdQjAf
	XA8zR8+fFDn3q4v/VtnpbyYAbW2
X-Received: by 2002:a05:600c:4f8b:b0:477:af8d:203a with SMTP id 5b1f17b1804b1-483c9c205a6mr27187195e9.27.1772183518665;
        Fri, 27 Feb 2026 01:11:58 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa0054865075f82f42ae.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:5486:5075:f82f:42ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e6c9sm169318505e9.8.2026.02.27.01.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 01:11:58 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][whinlatter 0/9] Pull request (cover letter only)
Date: Fri, 27 Feb 2026 10:11:40 +0100
Message-ID: <cover.1772183210.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 09:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232088

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1771943829.git.yoann.congal@smile.fr/T/#t

Passed a-full on autobuilder (same as the patch review request):
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3277
with a warning on qemuarm64-ptest:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/3109
That was reported as a new intermittent bug: 16182 – AB-INT PTEST: python3 failure (test_tracemalloc_track_race segfault)

The following changes since commit 21314665e198c1abe458d0bad5c4d14d4c3ad856:

  build-appliance-image: Update to whinlatter head revisions (2026-02-23 09:22:40 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-next

Daniel Dragomir (1):
  wic/engine: error on old host debugfs for standalone directory copy

Fabio Berton (1):
  classes/buildhistory: Do not sign buildhistory commits

Liu Yiding (1):
  gnutls: fix postinst script for ${PN}-fips for multilibs

Peter Marko (3):
  libpng: upgrade 1.6.54 -> 1.6.55
  glib-2.0: upgrade 2.86.3 -> 2.86.4
  alsa-lib: patch CVE-2026-25068

Pratik Farkase (1):
  libevent: merge inherit statements

Ross Burton (1):
  gnutls: use libtool to install test binaries

Yoann Congal (1):
  pseudo: Update to include a fix for systems with kernel <5.6

 meta/classes/buildhistory.bbclass             |  2 +-
 ...l_2.86.3.bb => glib-2.0-initial_2.86.4.bb} |  0
 ...{glib-2.0_2.86.3.bb => glib-2.0_2.86.4.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  2 +-
 .../alsa/alsa-lib/CVE-2026-25068.patch        | 34 +++++++++++++++++++
 .../alsa/alsa-lib_1.2.14.bb                   |  1 +
 .../{libpng_1.6.54.bb => libpng_1.6.55.bb}    |  2 +-
 meta/recipes-support/gnutls/gnutls_3.8.10.bb  |  4 +--
 .../libevent/libevent_2.1.12.bb               |  4 +--
 scripts/lib/wic/engine.py                     | 29 ++++++++++++++++
 11 files changed, 71 insertions(+), 9 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.86.3.bb => glib-2.0-initial_2.86.4.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.86.3.bb => glib-2.0_2.86.4.bb} (100%)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.6.54.bb => libpng_1.6.55.bb} (97%)


