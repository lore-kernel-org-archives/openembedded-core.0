Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69DCCCA47C
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:35:37 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.22260.1655667330988070407
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ZYq56eQ2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 y13-20020a17090a154d00b001eaaa3b9b8dso8399078pja.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pnsd9fGlgzfh1lFeAiHnwRvENCH9rGydJbvP8hHC7dA=;
        b=ZYq56eQ2T5ywKx6Qpq1mr+f9iLd9QBQxjrMRhiqffJF5/PmDjSqQEdCynMgxMWGRv+
         9JNe9wwXfgS+2qajcyzbr69M8CAyq7PaUbroT5I1BbFjUA8B+E3u796bHDEvArnOdDmo
         UTGmOsFKA4LhRKHVmMILVO49eUcyDoR+gR0rVxc4vNu4NzPa2X73+MDYf9qxD1VJRbTd
         mTeFnQoFJ9NQFADIlOfeZTxY+beGE+RYMNHHQsWOJcZZvgLi61w7TemMrjI+XnkeZ0X6
         E67bx6pKasU1e440MRfShgxy17kZHsXldkEwABhxcC7z2vNRZ+BGU2nrwBDnREOhqbOv
         lFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pnsd9fGlgzfh1lFeAiHnwRvENCH9rGydJbvP8hHC7dA=;
        b=yyFAT59/Q7tfcFfLkU3mTyd2VBtPgHwMMkBJnnYYL13K8oSOi46r8uYOg2n2T2hxQ3
         3FjewYmUmuxT+9Vvm0YjtNQh9bPUcWhQVnuEhDVUxgDKTpK+gcrPD1cqUkSKm7Cw7IsF
         xtdnbGHZapoaZOBNOWR7tFsLRmB4F/nLwL8K+waiXfieBcdSlX5LtxLL694NEP43T4xO
         xSluEY2+VjdSRKuYrUFf5SDvrZlcbRqRgUPCPrPauQHV0GMRxeTGQOaAx+F/7NxsMyp8
         hYEpndhPTDY1nqv2PYR9Z4Rv4rYncC6oXTaxU3+1s0yHOPEoIm/4Nrt1Tx7qD61MDrSL
         SJgw==
X-Gm-Message-State: AJIora+fhn6+WiN5/RTM/nZbgV3U+IWuI0+3UJYIbikdXA5f4xDJVJw9
	+oSvvK9dcXgcUrRPqfSXVg+jVnllyysWzxGz
X-Google-Smtp-Source: 
 AGRyM1vN7OfD4tYrhEPRoC7Te/u67EBvaxPrZAMcGiW/+xWvDsiZuV+DyNKffTBVidqUn1XAvdmUMg==
X-Received: by 2002:a17:902:8b8b:b0:167:4e55:2dac with SMTP id
 ay11-20020a1709028b8b00b001674e552dacmr20556302plb.132.1655667329981;
        Sun, 19 Jun 2022 12:35:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e5-20020a170902ed8500b001678dcb4c5asm216994plj.100.2022.06.19.12.35.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:35:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/12] license.bbclass: Bound beginline and endline
 in copy_license_files()
Date: Sun, 19 Jun 2022 09:35:00 -1000
Message-Id: 
 <27cd074d747c5ef4b475c8a62a8ede2bbe58f996.1655667170.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655667170.git.steve@sakoman.com>
References: <cover.1655667170.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:35:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167068

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Ensure that begin_idx (i.e., beginline - 1) and end_idx (i.e.,
endline) are positive numbers in copy_license_files(). This makes sure
the same lines are copied as populate_lic_qa_checksum() uses when it
calculates the checksum. Before, beginline=0 would typically lead to
that no lines were copied at all.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ab3cc3651d08d226675c461da760cda0bb6c0ce0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/license.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 6b03221c7f..806b5069fd 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -91,17 +91,17 @@ def copy_license_files(lic_files_paths, destdir):
                     os.link(src, dst)
                 except OSError as err:
                     if err.errno == errno.EXDEV:
-                        # Copy license files if hard-link is not possible even if st_dev is the
+                        # Copy license files if hardlink is not possible even if st_dev is the
                         # same on source and destination (docker container with device-mapper?)
                         canlink = False
                     else:
                         raise
-                # Only chown if we did hardling, and, we're running under pseudo
+                # Only chown if we did hardlink and we're running under pseudo
                 if canlink and os.environ.get('PSEUDO_DISABLED') == '0':
                     os.chown(dst,0,0)
             if not canlink:
-                begin_idx = int(beginline)-1 if beginline is not None else None
-                end_idx = int(endline) if endline is not None else None
+                begin_idx = max(0, int(beginline) - 1) if beginline is not None else None
+                end_idx = max(0, int(endline)) if endline is not None else None
                 if begin_idx is None and end_idx is None:
                     shutil.copyfile(src, dst)
                 else:
-- 
2.25.1


