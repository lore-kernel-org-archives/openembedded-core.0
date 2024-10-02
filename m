Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D871CF6D2B
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 13:13:24 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.6953.1727874798464100053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Oct 2024 06:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ib0a89Ag;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-718f4fd89e5so6027706b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 06:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727874798; x=1728479598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eP63YRd8LTDfC1Ger+epcriRlLcSbs6A1l4fJQMrDmQ=;
        b=ib0a89AgGVwhTGMcUTfyQiruzJhOcHJdjZcDdHqcllOcvsllPYtte43P1EDtfADLMW
         g7yxxOqUS3beBaFw56r/tS/5QNs/JT+339Cz6QdhbWeBv+Bck4D6MjW/lB/1rFvirfue
         AkdbVRQIh+CIILwl+KM2rnKfuOZ5soZNTs7fqyh8Hcd3B2k1nNEl7rf8WmT5Bb3J4d41
         m3vvLjDwCi1hNyv9yVPsFicdLW2mx8ayVrw7mz+bGDG4JUs7P8sT/UmyOUFi3eYFKZbr
         jpyG+GYxy4het7zXYZ9LSAeGPOC5T9vPzDabFR9HmKqPZp6uNsoLAPBUo2bCQxZq14hb
         lmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874798; x=1728479598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eP63YRd8LTDfC1Ger+epcriRlLcSbs6A1l4fJQMrDmQ=;
        b=YBP8VaPY0S9wRf/SOU9LyPkKAxQxHTsGf0z3cCkD+2vh01X8y6tvjccwDXADB/BXRS
         1F0BttbRvWOb+wgDwZupxyi+/NJBkLybyyOfJCkJciqJAX/1NfarvCkEffuAaoltNXgq
         3uJy0RByvQHoTZC4r8BVNX2zw+JcYO/0x3WeXPl30owGYkl3CmoHiKTaFYz3xTJ8x+4C
         9CYtDDZ5uM3hEy9KP4EYAIw9DGDcBOAjf+nNMQJ7ecsdCxpp08ur30xsxgtPfaMAnCUP
         JBMR+yrqYU8HBLiD5GXYF8LnJjY1toIBbWXtu70SZbJhjjYPDQxoDLKZM4KUUPsngMZI
         z5zg==
X-Gm-Message-State: AOJu0YyMJZJ4besbn4t1owbHR8Xp7SlTs9zWEvEoiojtkh5269+7V2ju
	27DlbqBVp3oxS0HCwBKpn9mq9aeZVg1V0wlAldGvLYLb7519xtYzr8+ybOAtUR1FV+M9nhpK9Ei
	IDJM=
X-Google-Smtp-Source: AGHT+IGrgHBXkwt8FBpljKFd4lHWWWk/r+80WsFQCYGbUpXxR2alJYOHJ6dOhSiSX8/89rAd71/U+w==
X-Received: by 2002:a05:6a21:3417:b0:1cf:53fc:cfec with SMTP id adf61e73a8af0-1d5db129071mr5244131637.12.1727874797718;
        Wed, 02 Oct 2024 06:13:17 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2649c775sm9773436b3a.29.2024.10.02.06.13.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:13:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/16] glibc: stable 2.35 branch updates
Date: Wed,  2 Oct 2024 06:12:48 -0700
Message-Id: <db4cee587fe43f93a9bc9a1356c65a50f92085d9.1727874367.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727874367.git.steve@sakoman.com>
References: <cover.1727874367.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 13:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205191

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commits on glibc-2.35 stable branch are updated.
37214df5f1 libio: Attempt wide backup free only for non-legacy code
09fb06d3d6 nptl: Use <support/check.h> facilities in tst-setuid3
507983797e posix: Use <support/check.h> facilities in tst-truncate and tst-truncate64
bcd0e854ea ungetc: Fix backup buffer leak on program exit [BZ #27821]
e930b89df7 ungetc: Fix uninitialized read when putting into unused streams [BZ #27821]
a3db6ce751 Make tst-ungetc use libsupport
ed9762fdbf stdio-common: Add test for vfscanf with matches longer than INT_MAX [BZ #27650]
cf71d2189c support: Add FAIL test failure helper
5b4e90230b stdio-common: Reformat Makefile.
3c64e961ff Fix name space violation in fortify wrappers (bug 32052)
ba003ee5de resolv: Fix tst-resolv-short-response for older GCC (bug 32042)
5a1d0633be Add mremap tests
0ff91d3961 mremap: Update manual entry
7459b6fe47 linux: Update the mremap C implementation [BZ #31968]
461d0cac38 tests: replace system by xsystem
041ac9dffe resolv: Track single-request fallback via _res._flags (bug 31476)
820a750bed resolv: Do not wait for non-existing second DNS response after error (bug 30081)
4f5aa1d2fb resolv: Allow short error responses to match any query (bug 31890)
a180e82837 Linux: Make __rseq_size useful for feature detection (bug 31965)
f8a52d39c0 elf: Make dl-rseq-symbols Linux only
d36daa4c01 nptl: fix potential merge of __rseq_* relro symbols
602fff4efa Add AT_RSEQ_* from Linux 6.3 to elf.h
c7cd626538 s390x: Fix segfault in wcsncmp [BZ #31934]

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index a5903bc5f4..dc18d20dd8 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "72abffe225485d10ea76adde963c13157bf3b310"
+SRCREV_glibc ?= "37214df5f103f4075cf0a79a227e70f3e064701c"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.34.1


