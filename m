Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77831C47DDB
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 11:54:21 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.13672.1706788460254928374
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 03:54:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jwc4iSHL;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a30e445602cso426283166b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 03:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706788458; x=1707393258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KajE42gZYeh6dyE86cLAzOmukiQKQ6faFUTSuPXkYog=;
        b=jwc4iSHLWBl/4VqBE6ijCsPG0IcAzlm7HNF1wdw5YWtq2I/7AitGz6D2BfsFeO0TXC
         vm4pkhK4vBxIllu6E8ixXkeKOhK5fflbDKVUw+m+X6hGNhQBqfbXsmsl4to2ZmIDc5oO
         DwunBScZE8VETJOAuDVt2UDmY+O809P2NIYTd/i8PWyHwf64wrksNJWJUW2LUVaIALAb
         JxQiKMsm1Qf4Dewp/WhqbZl04K2AQqzF9tStOFsdjrmrbKtQ7A/mePMPi5cFMkrz8PLB
         M/sADJQSLNtCKTI88Gr2IrTe+9NGoRhO9A9UCvJKt4LPfiajznEXJDEKh09+xmCzGqLf
         y1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706788458; x=1707393258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KajE42gZYeh6dyE86cLAzOmukiQKQ6faFUTSuPXkYog=;
        b=ikK2T1jP1dZaLB/YITtLoKYBqvfj+KwUVATUy+R89MyUn5cv/+8PTGkUStEHhubOq9
         m0BrN7QIt1S0lGYY2E/YD33W8C6Ym1Gr0GcD8Q5iNGe+ftb2g+lHhCY2kPYVMjAv/L09
         u4CsihHjA1ZRLCcbOdbJ7nOdn0jb+7ArzX5Sd3Y54WPdtofbtlgsfXNkwOj9JVZeKcHP
         ZfPKo1X+rSz1TOSr6In3sFLW2j1e9XZiZy0mv2z/LFuLnyTCP5RuDJIMMmaZdxK3yCAy
         pt0pHqNqlKq1o9NeMXzW3uRTJAoXw/Q5kTyrKZsidNrxR3HksjPQytsonYo+tgMQCnr/
         ZiaA==
X-Gm-Message-State: AOJu0YxLF0O5bDiM1+nRIJ4OWycqhcYE5GE1sECuMhif43NxSWHAPuYh
	5XWGiR/LyDXecB+SQqRMha+dNvN8e5C1N6PmEKic2ZdWz/6CvvyP9WK/Y7/i
X-Google-Smtp-Source: AGHT+IHQ0N/Tan61uVM0VmWpGmjqdljlZ9gkifobdiiwiifJ6gAz5kLkckg33CNhvzqVyE9ITDlbKg==
X-Received: by 2002:a17:906:1d42:b0:a35:15ea:3cc0 with SMTP id o2-20020a1709061d4200b00a3515ea3cc0mr6218665ejh.26.1706788457799;
        Thu, 01 Feb 2024 03:54:17 -0800 (PST)
Received: from localhost.localdomain ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id li14-20020a170907198e00b00a3623e84889sm2664969ejc.40.2024.02.01.03.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 03:54:17 -0800 (PST)
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Claus Stovgaard <claus.stovgaard@gmail.com>
Subject: [master][PATCH] kernel-devsrc: fix missing RDEPENDS gawk and make
Date: Thu,  1 Feb 2024 12:53:26 +0100
Message-ID: <20240201115326.506503-1-claus.stovgaard@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 11:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194584

gawk is also needed for x86-64. See scripts/check-sysctl-docs
Since version 6.6 the package rules has been split up into a rules file
resulting in the need for make. See scripts/package/debian/rules

For reproducing the issue on a normal qemux86-64 machine, change to the
linux-yocto-dev kernel, add the kernel-devsrc to the toolchain target
task and disable ptest in distro features. (Notice ptest pulls gawk and
make in as RDEPENDS for other packages hiding the issue)

when populating sdk you will see dnf failing.

 Problem: conflicting requests
  - nothing provides /usr/bin/gawk needed by kernel-devsrc-1.0-r0.qemux86_64 from oe-repo
  - nothing provides /usr/bin/make needed by kernel-devsrc-1.0-r0.qemux86_64 from oe-repo

Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index ce5777fbe9..222f6cf8e1 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -395,7 +395,9 @@ RDEPENDS:${PN} += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-dev', '', d)}"
 RDEPENDS:${PN} += "${@bb.utils.contains('ARCH', 'powerpc', 'elfutils-dev', '', d)}"
 # 5.8+ needs gcc-plugins libmpc-dev
 RDEPENDS:${PN} += "gcc-plugins libmpc-dev"
-# 5.13+ needs awk for arm64
-RDEPENDS:${PN}:append:aarch64 = " gawk"
+# 5.13+ needs awk
+RDEPENDS:${PN} += "gawk"
 # 5.13+ needs grep for powerpc
 RDEPENDS:${PN}:append:powerpc = " grep"
+# 6.6+ needs make for debian package rules
+RDEPENDS:${PN} += "make"
-- 
2.43.0


