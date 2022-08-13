Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F71C25B0F
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 04:28:21 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.1915.1660364891995234857
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 21:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sd2pjpgg;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id r69so2336711pgr.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 21:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=esSbNueaOs0//ii79HceSRHJA1vlx1WMh7PSiDc/1j0=;
        b=Sd2pjpggeUQc8oJzJlzkqwTTx4b4o7z4BW8WlSyt4m6THjS8FZO6GYu4+WnAwAIe2S
         5ZGqk02Nzqu6UVIQlpZ9kwcFvnri6hiZ1Qhxqvv6qYWPXNrJ2K2fuE0jzVrjFgQ0Xrtb
         +I2ukGerGj47MczQNQ8tQu8t6r/H0McXnWXwCgPNnNxkl7fUYJuiB+OmVoj5i27qgGJo
         8HZfTSiYnqbre1Ua/TlRgdnXHu5/In4MlgZCuZ3pKN15VUSLyeJhOgBiklhflJY8GTNt
         VtOJKtFQkePtRG06FjjkfILx9LNd3/4v3HP07QiCukVTz8rAhp2lM4dZpxV/QM2FBG9v
         lC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=esSbNueaOs0//ii79HceSRHJA1vlx1WMh7PSiDc/1j0=;
        b=Dvx1nq8jeQ/PidVg66LN7n1zkfPqWSyRA8rUJE/pImRbmZ13spn3futi8VG74NAZZ9
         w1MMrEM1SxOU/8kXJqwMsq1gNsMzeI/8umIUkgu57S0bFrFwo6arjYT3NsJEtVYbnvZn
         zPT4OCkq8vu8OxGtQS/w5oBg0Wbg364Gk4ql/K0D6ALpJTwpZLdf6IGBK2U2PtsniNSL
         3RHIymR2nt8PWaGr/lGs5nIbkxDSFLBJi30ntT2AUh2JyRSXAEuc2dQmiEdcXG2B7y45
         6v3w/G9oLzvYnKwVWyZeWPLGyEqVzKfqgGk5CFPt6sXxxpILRuz15Ywgv8Pn9SSGuMWZ
         FEzg==
X-Gm-Message-State: ACgBeo2E7Wq96DouRQ+ky6s+YtE1E5ziFq9VV/XqU5dboj01aaeslDHr
	RW6aZM6Up8pY8CvKStVN48XBE653POE=
X-Google-Smtp-Source: 
 AA6agR7sQwj2q2U8++72Y2Rz3NeIX5B5UwJ2UINceWXP6R1rEPpZ7j/gRXYbMBxRYkPaPlhj0lzM9A==
X-Received: by 2002:a63:8c47:0:b0:40d:2d4:e3a2 with SMTP id
 q7-20020a638c47000000b0040d02d4e3a2mr5721824pgn.2.1660364890890;
        Fri, 12 Aug 2022 21:28:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 h18-20020aa796d2000000b0052d4afc4302sm2536105pfq.175.2022.08.12.21.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 21:28:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/5] zip: Always enable LARGE_FILE_SUPPORT
Date: Fri, 12 Aug 2022 21:28:03 -0700
Message-Id: <20220813042807.3533472-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Aug 2022 04:28:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169296

largefile distro feature is deprecated

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/zip/zip_3.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 65d9b0995bf..1930a40140b 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -31,7 +31,8 @@ CVE_CHECK_IGNORE += "CVE-2018-13410"
 # Not for zip but for smart contract implementation for it
 CVE_CHECK_IGNORE += "CVE-2018-13684"
 
-CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-DLARGE_FILE_SUPPORT', '', d)}"
+# Enable largefile support
+CFLAGS += "-DLARGE_FILE_SUPPORT"
 
 # zip.inc sets CFLAGS, but what Makefile actually uses is
 # CFLAGS_NOOPT.  It will also force -O3 optimization, overriding
-- 
2.37.1


