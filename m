Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD3DC25B0C
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 05:54:47 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.3335.1660197277573419196
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 22:54:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S5/Uzuld;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id u133so15631422pfc.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 22:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=nns53/K258uPQ/9AJNIeT6W1uTVh2hagnjrhrhhaxFQ=;
        b=S5/UzuldoFVHgormQVjHfPIyIBYBlc8nUk9L7BMN4NqPjv9naM7DXSTk3k0mUdMvsK
         nTnwArH8CbkWd8Fh9l9fOx1Of+8RAjYBbM+hQTZXBrhhXkY5rSgs4UFFcwVE8jNEj/Zv
         QkIwEkq9dQfr71D0Y7vbckYNn9TTHFcpElACLhFzn9dLx9UNUor5Sd9aPywnSXs5tMXE
         eBeePB+udNCxUp7GD+Eh5DRT+3jq+gquuNE6ipXN5RliNV6yqyZB9uMQ9vJl8ssUKPNg
         XuaAlOvpZTA83fRY+FXnYWm1PSifanXChDrcwuv04kQk6ZoNeQTiqFNvlASo6Jv+OdJd
         ixvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=nns53/K258uPQ/9AJNIeT6W1uTVh2hagnjrhrhhaxFQ=;
        b=Ab/AhJXUaZg9lkH2sY1eJaAzXfCwX6jkvSo0B72IDlMxm1HStycLe0b/6mtdhnAVfL
         FoZ2RIZPfnTCfUrUP5eR4+qiNb9T6Q9TosZdlys8u0VbDRTT70fLRPR6iwyG9AgMcmit
         hUKrOHIaFEH0TRB8cQo9TBV+brmcUXX5LohiUSiROCDugjWZQHJxYzQaUX9KmQ7o95/Y
         1sxfshMW8YWNxDJtR874BnP3d+Cn8Umqq8jlwedKKoI+k4SQtSVA0EPUv8RcvCmG74KU
         6R36xSGT6z9I5bhjt8Vqy3quECC2QsV7bJaYmVO3sHgexzpY5RMUb1AByCyzr3VJFSmH
         4axw==
X-Gm-Message-State: ACgBeo2zqF5qWuIpMSjmAgSEfq2/90KFdIT3zxYNAnid+xLXyku8MXv+
	zYhndGLS4F73HguD0ihEDbPBD26u9zw=
X-Google-Smtp-Source: 
 AA6agR63VwIJOuzyk42jHhQ6E7YmcEI2t2421kd6gKoapRyqVTtDpgFzrEahhTUI9YTkEgCYQROvdA==
X-Received: by 2002:a63:1b55:0:b0:41e:2cc8:4296 with SMTP id
 b21-20020a631b55000000b0041e2cc84296mr2590974pgm.510.1660197276448;
        Wed, 10 Aug 2022 22:54:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 e11-20020a17090301cb00b0016db6bd77f4sm14290483plh.117.2022.08.10.22.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 22:54:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/5] zip: Enable largefile support based on distro feature
Date: Wed, 10 Aug 2022 22:54:29 -0700
Message-Id: <20220811055433.819522-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 05:54:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169227

The configure test tries to run a binary during build to determine
largefile support, which wont work in cross-compile mode, therefore
specify it when largefile DISTRO_FEATURE is on.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/zip/zip_3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 07a67b96348..d560c83464b 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -29,6 +29,8 @@ CVE_CHECK_IGNORE += "CVE-2018-13410"
 # Not for zip but for smart contract implementation for it
 CVE_CHECK_IGNORE += "CVE-2018-13684"
 
+CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-DLARGE_FILE_SUPPORT', '', d)}"
+
 # zip.inc sets CFLAGS, but what Makefile actually uses is
 # CFLAGS_NOOPT.  It will also force -O3 optimization, overriding
 # whatever we set.
-- 
2.37.1


