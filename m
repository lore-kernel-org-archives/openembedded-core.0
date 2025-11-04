Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A0CCCFA0D
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 14:48:23 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19558.1762267696096374425
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 06:48:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ejOTtAAn;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34088fbd65aso4742896a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 06:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762267695; x=1762872495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uoeBhy8kA46v9UqL7OUKdiGKZOKI3NboUAmiBX/OLI=;
        b=ejOTtAAnBlsBO0YuKI30JhPN0fcWd3i/m49oCfcciZDgYhbtYmdSebckn7IDP4rW1M
         6zqSZbMuP2MtHm6vACjUfSewu7PoKyUmdQ6Qu/8FEyK+p1fw6WIXHUd/4t7sQEL7R46F
         fZoi2K7NjvkMLhLqRyYuorzqLphUPZNcLkz2VEtL5mjgl9UsEJH4Nyr5K2oSz4HUgprG
         D7HCBKcV6H+qezIaHd4R2i8/h5GwezKpSq8Uu/6gX8cGXy70lcSnzlnlBS0P8lVrGNeT
         Br2UCpyGP8hR5jeh3OHl4gGjvMdCBhlQrbUqAoKK/NCfeq1oFnjy10wwrnDiIZhmHBXs
         HPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762267695; x=1762872495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uoeBhy8kA46v9UqL7OUKdiGKZOKI3NboUAmiBX/OLI=;
        b=sKPbQx1LbveqDFIOY748o+KpbM3E3JGHgbxxdIITunnEmQUoWSN5RALqMZcG505SL8
         eHb5rBbvbnGdUObFbTia9ie0a6Jwo/s9Ekg2ckVfaZpBfFNO6kBWJmPGfJDog4OvDwTm
         253QEA77/Pw6NDIwKfGVdgJDY7PR6tmUgh74oz3mmzczoY4DnyA7s/XBW4CulEpABcQ9
         myJD69zi0TkDT+Vngw6reGNqCRM08329j/PSxAFZH3S9BM8mMXrE8Z0LQznkU60FyR/e
         a0lN9rszGhItxUC6Utu/q3Uu3gL1vHbg1OCpaSNoEBPyqjpFwkgrvqg1aXI8faXBaca5
         M1Cg==
X-Gm-Message-State: AOJu0Yxfu/7ZpzOJfIMXOj2zxHffUMLSU5VRvLScymew9RXIMi+5u7zf
	zlsXhPUzghqYTqV+QhqzKMPsGplEvD2lcWNsH0jguRtO1e0XirRTNajqD6iQKVTbsWYx4RbSRQk
	/CjD3yN0=
X-Gm-Gg: ASbGncstm6Ex/6ZUoUC5VAYs1U49+MkQ1jtS6Wrxoa+PNp9sgIuQIy46998dXqIBneB
	+bBleVYYjwUfu5fswDe9Txs1nByHKb8qslGsqNNsohK8shOyrNw6UQ1uvZJoHTUqE0h1KfS0Ehj
	X0z+w1Jf7gRP7US3wUl+v7s2mhlP2Qv60O8omGnBwkjVY7RW73I/LeErEnm84eKD+Po+UE8+v/8
	bmXLEcnfxRSKe2mwUxJgFrVCyj698i4AgZeTfkgLZGoEIQwLKsjFCYA8rHsjRkmMeRMUdL2h9kA
	26qF3hvMb5mVt018B1OPkodPelzU8TMf2g2oSAJ2q7dkzqtdvFpn4cUgkfMGz4dwb0Z6l2jOS1A
	VdKqfIkLDFbOAPCksGMyyF39zw9SMPQrZ7VNdcy8Dqp49PHjXpTt/1SVk5aOGc+al+OE=
X-Google-Smtp-Source: AGHT+IEkBKXBV0LcGWuYB+LRDJiAAaaDJIDgC8TBiQs50TJ1Jh5ISVusB3q5tl1gvuMSF5R7rmDURA==
X-Received: by 2002:a17:90b:53c3:b0:339:d1f0:c740 with SMTP id 98e67ed59e1d1-34082fc64fdmr21347103a91.1.1762267695362;
        Tue, 04 Nov 2025 06:48:15 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1f4f:a6d3:d9bf:780d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3417d40da83sm1341481a91.14.2025.11.04.06.48.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:48:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 7/7] perf: add arm64 source files for unistd_64.h
Date: Tue,  4 Nov 2025 06:47:58 -0800
Message-ID: <06d4981313ce67a8d53b1c14be9845b4b5a9f4cf.1762267481.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762267481.git.steve@sakoman.com>
References: <cover.1762267481.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 14:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225733

From: Yannic Moog <y.moog@phytec.de>

kernel commit bfb713ea53c7 ("perf tools: Fix arm64 build by generating unistd_64.h")
introduces a new dependency on source files for arm64, specifically
include/uapi/asm-generic.

Build fails with:
[..]/perf/1.0/perf-1.0/scripts/Makefile.asm-headers:33: [...]/perf/1.0/perf-1.0/include/uapi/asm-generic/Kbuild: No such file or directory
make[4]: *** No rule to make target '[...]/perf/1.0/perf-1.0/include/uapi/asm-generic/Kbuild'.  Stop.

Add the directory to PERF_SRC.
Fix whitespace error while at it.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/perf/perf.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 11fa917649..2d432f3f40 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -145,6 +145,7 @@ PERF_SRC ?= "Makefile \
              arch/arm64/tools \
              ${PERF_BPF_EVENT_SRC} \
              arch/${ARCH}/Makefile \
+             include/uapi/asm-generic/Kbuild \
 "
 
 PERF_EXTRA_LDFLAGS = ""
@@ -202,7 +203,7 @@ python copy_perf_source_from_kernel() {
 do_configure:prepend () {
     # If building a multlib based perf, the incorrect library path will be
     # detected by perf, since it triggers via: ifeq ($(ARCH),x86_64). In a 32 bit
-    # build, with a 64 bit multilib, the arch won't match and the detection of a 
+    # build, with a 64 bit multilib, the arch won't match and the detection of a
     # 64 bit build (and library) are not exected. To ensure that libraries are
     # installed to the correct location, we can use the weak assignment in the
     # config/Makefile.
-- 
2.43.0


