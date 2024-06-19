Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55A4C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 09:00:11 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.16250.1718787603359729146
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 02:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AXiUnRgb;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4217d808034so55934015e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 02:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718787602; x=1719392402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8HSbUSb8fz8wop6uc+UR1gNDPUUtIDml1v5Z13KRClo=;
        b=AXiUnRgbhJVfNIplhw3hXyskxixB4p29FyOWvg8c8pt41pSbIIdudOZIyy7PHGp+LK
         NYjI5e4soxF/bJ90pVD/6VXcyDmMmlL1XKP5h/9oGGE2x5mBY2EemyRHCmYE9rQKeN8p
         uEnYAWx33HJDfmABs3sOP70Tpm++6nTAnpsk5FszevONuum/fwO/aIGdx8C/acK7Cm0b
         YYSaMNbrCgIekm7sVzShFpen9WD47rO1nWFv/l77Q7RDt567sxOwmHRlT1BIU/Ir0p4N
         JW/KafYBoY+wd7mmq0xqPS8j7avnamfwJ2kia0/bOzZM4/Mf4i1E2YOYw2D/g1rXd/y8
         YbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718787602; x=1719392402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8HSbUSb8fz8wop6uc+UR1gNDPUUtIDml1v5Z13KRClo=;
        b=f2lU8M6q9PH8GTt57RtGOtzuVYigK2qZN37Yuke358ozcxp/QWjhQOY3sOhaNiZjAk
         Vz/vhnQ1H5PA9SSfSpk7mzf6blPfhi/b4ENOO5izpgIS8+MskFN5zTQNDaP56BwwHjtb
         MRYdpKbJ7+/fsym5vElzOFMHclqRFlV854h9X6foVJvzo8E+AWcTNqtBsERrJlukkTCI
         s2xO/W23YjlwrMLAQRO4oBv2ywxD0Vq1OLLDePQlSu1049dk7q0YGWbYg41pAf+QmGbB
         /NrLAGyBVggPaPszaWic8SlwTUu+h9DXYZN5Twl9kGhx7wEe+0hne+g3NLgmSzl+IkaE
         ZF/A==
X-Gm-Message-State: AOJu0Ywjb0crRlrkL6mrwSMMwcZcMJ3iWucnfgRK8iMvuwlnsSY5u3qT
	A+2VU7apv8f4x10VVwq+EgS4UCreFRCcsYtbSnvvNt2pffJXzX8mvvdeuA==
X-Google-Smtp-Source: AGHT+IFD7F0xUaQKNHY4dnqWl1QGW4TqCxpEbN/4TfxW+jS6TEohs+usvMXy+CvxOqB1OIc/rWGqfA==
X-Received: by 2002:adf:f24a:0:b0:35f:10a0:9b7 with SMTP id ffacd0b85a97d-363195b2213mr1327273f8f.46.1718787601366;
        Wed, 19 Jun 2024 02:00:01 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm16401876f8f.76.2024.06.19.02.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 02:00:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/15] perf: drop newt from tui build requirements
Date: Wed, 19 Jun 2024 10:59:43 +0200
Message-Id: <20240619085957.2787700-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 09:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200887

From: Alexander Kanavin <alex@linutronix.de>

As the comment says this was used by very old kernels
(pre 3.10), and slang has been the only option for a
long time. Also, correct the option to disable slang TUI.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-kernel/perf/perf.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 11fa9176490..058f887b861 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -14,10 +14,7 @@ PACKAGECONFIG ??= "python tui libunwind libtraceevent"
 PACKAGECONFIG[dwarf] = ",NO_DWARF=1"
 PACKAGECONFIG[perl] = ",NO_LIBPERL=1,perl"
 PACKAGECONFIG[python] = ",NO_LIBPYTHON=1,python3 python3-setuptools-native"
-# gui support was added with kernel 3.6.35
-# since 3.10 libnewt was replaced by slang
-# to cover a wide range of kernel we add both dependencies
-PACKAGECONFIG[tui] = ",NO_NEWT=1,libnewt slang"
+PACKAGECONFIG[tui] = ",NO_SLANG=1,slang"
 PACKAGECONFIG[libunwind] = ",NO_LIBUNWIND=1 NO_LIBDW_DWARF_UNWIND=1,libunwind"
 PACKAGECONFIG[libnuma] = ",NO_LIBNUMA=1"
 PACKAGECONFIG[bfd] = ",NO_LIBBFD=1"
-- 
2.39.2


