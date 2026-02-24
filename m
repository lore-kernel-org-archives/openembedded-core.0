Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2DBF3C992
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:41:13 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21846.1771944067721704091
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=m/hc1a43;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4376acce52eso3565676f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771944066; x=1772548866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=c8mmTfhyT5fzOBuXedPBxnS0YbahuZ7o1jRwfZvkiZE=;
        b=m/hc1a43jhFwC7uvKDVbF3uU1thKVbNPIllnLdMaomUdUkcxm0R/FOho0ozURTq3mw
         OgYidxuouZWzp0ph3zndL6e+ol+wOja3F4j+kyFdP7j8MgHB1waMSfubEYRT26PwlrmO
         iEPfEio7PyUBj33+X9UrWs5xbV5n4LN5irDCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771944066; x=1772548866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8mmTfhyT5fzOBuXedPBxnS0YbahuZ7o1jRwfZvkiZE=;
        b=SAJtvsTUmsjSs+9ViU64YF970q3F1FsVtDS55HTSbOo/eaG73QCjR9HwX01jvdLk1+
         lnhv8GmoWAL2W2dAGNMlTuytSDmvaw0ZemWm6MH/qmWPa3o6SVS29TtoAhbREJDrRete
         DxFhlxhaHPFnm2SAhL12uR0vjhGyEeU/s6XpVI6zuoI+yBEx/OJS8lJiloSFOTeolPEe
         oPdW5SwG3a7fpGxKlm+igoyQhTrHakmE2Dx61kWZJM0sf42h1Xk/AmGZi4RxOP5qzVwr
         CI5W7alQ/lSHqHds5FzNzWs8yE2Z99Qtq2d5KtmK6VjArl0rkECcODV9PDzORPtsHHYq
         kZug==
X-Gm-Message-State: AOJu0YzEPFCXzgThjRN0h97G/N2IcFCd+Q5G9gprIzVw+6toZxNRz4WA
	Si7WKthVgRKAeYTJZjwCcook5d4wtyMSaNsUYE3ALS3EKiJhfhAWLIlJEuitqYbVpQiVFVWmswc
	w/Xix
X-Gm-Gg: ATEYQzzAzy1++tdtq0j0J+Gw2p4TSaGmDRrU0jlEezfTnrB3VxIZmwZCkhR5tNSIgMX
	r3U1nv76UIOY0J39pU5cQCcb+QkQr/xFuKBhsPE4N0G+mawZyZeMwtSUtJCgHNK9+3S1QCcAMep
	lCQMezenelHT+d55Ep9y8vJghKIBndd+/R3O/uB6WCl/RXdHJX0ULaon7cphuZpkRZVBhJmIWuN
	uoFPCay+usUWsc4fUddIVWR0j8hWFr915K+BpMNMP7m+l/TKFmcxSUrOMRDYeYJtyJLykbjL38s
	2bOESLAQsXQN2v/ByrtLn3P9sGSzp/weuaPqFK2dPsC+J/a1axJPeMFVWV+pRTrp4nU71UlnqrN
	M/R7mQIWfpVeKLh9xrGulBi+ZruQUPEQICl/dQ/1SWhoceKAZRZIdn6wH+SZLt88uQt6fTgPPPM
	3INwni9Jl2KUB83DW+RgNjnK9jcq3y7oykRR2B9TfeN6q7qJDN6N64atyNwaorfkCADYbjhQxAS
	bI0ymLGzt50FiB8qqcxFojIePnQHtv72jdNJpJt9Nr0
X-Received: by 2002:a05:6000:4009:b0:437:75c1:578e with SMTP id ffacd0b85a97d-4396f15acdamr24941729f8f.21.1771944065661;
        Tue, 24 Feb 2026 06:41:05 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff6dsm28711195f8f.25.2026.02.24.06.41.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:41:05 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 0/9] Patch review
Date: Tue, 24 Feb 2026 15:40:53 +0100
Message-ID: <cover.1771943829.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231852

Please review this set of changes for whinlatter and have comments back by
end of day Thursday, February 26.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3277
with a warning on qemuarm64-ptest:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/3109
That is a known intermittent bug: #15885 – AB-INT PTEST: python3 test_default_timeout ptest failure

The following changes since commit 21314665e198c1abe458d0bad5c4d14d4c3ad856:

  build-appliance-image: Update to whinlatter head revisions (2026-02-23 09:22:40 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-nut

for you to fetch changes up to c0f0667e742a59dce06cbe97baa6b4531fd13617:

  alsa-lib: patch CVE-2026-25068 (2026-02-24 09:39:34 +0100)

----------------------------------------------------------------

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


