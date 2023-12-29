Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950E3C47072
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:46:28 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.151549.1703864781322207618
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:46:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=01GUpVGL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d426ad4433so24168625ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864780; x=1704469580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=741ANwDec7YXTBr90YSnfxQLAgN9HQW0Kxcwhb+byDM=;
        b=01GUpVGLSWXkXAOfM20FRwpURKM6S2HxL06s336P4y8jwt7/2swUK5QjCXmkIHBGYg
         7d/QSASyEwyH79Ja6LspYmYbyiXxKN42bb3Fd/+35L4sLS85RpudmllddRVZ1PAM7BmW
         4OS7BK6lslAPyaPQP/8MSJUStfqwv3oyBKjgMQn+7NXu14il3HRUEMWY2LDImOwZ7bJV
         FvnKvB5+wQCeZhwxSFhe1OSPlR04Zpi5bTKDBZoJxtWRPyLccfOvhTXouQmHV+mXFDzL
         +OT7U+IpIvvQVDzYl0B0RS+o3w+XSsLE6JThh8KICYsoJs3uO1Tb9IUP9m/w1QzqzWex
         HNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864780; x=1704469580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=741ANwDec7YXTBr90YSnfxQLAgN9HQW0Kxcwhb+byDM=;
        b=uiJ4UZIzTP3UudCCdEaeAxAn7SIoMTwaw1zWvDn20L3V1TCrF2uQgbJc+ovNMhOaHc
         RdCIN4WAYg1T4v9BfT6tPxcMbyREUFfaMvlz1S/x6dx6FQMzVeFF5aB3PDS9mKJonZt+
         PFmltO0XAVMcPUvrHybrbCUiQZF5UuSOJfScoEfBpxcQvuDROLHEoBdWmx+8zJVTdXdh
         UMvRcCqdF0Zs9dPOCCbJAF5ACJX0+XzbVyoIaeWfvxAtmdW3gpqipKnDbR937LehRUFq
         nMNzlG7ym/5fmTnkT+zVO9qHRvkGYb/IOz5+FBW8O9XyIMvqTSSNphZutfaaLg+gIIDh
         LwQg==
X-Gm-Message-State: AOJu0Yx9QN7Utw9lsCGE2J23tEfJzu3nXjVWPcCN80T+gEssbIh86thK
	J1dHJEwr5eMzM0B4wWWCL2zIggUlo6D2wCkjExp/hgTyiyaNWg==
X-Google-Smtp-Source: AGHT+IHdZLPXgq5XH0X4QjyVJ+/xbAu5wAv0HIXpsDQdAyf6m6AUg3Fs6CsNhf7kloOyyFwJUZ7NaA==
X-Received: by 2002:a17:902:cec6:b0:1d4:2f07:4fb4 with SMTP id d6-20020a170902cec600b001d42f074fb4mr5914479plg.7.1703864780480;
        Fri, 29 Dec 2023 07:46:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.46.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:46:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 41/41] tcl: skip async and event tests in run-ptest
Date: Fri, 29 Dec 2023 05:44:55 -1000
Message-Id: <e6a2793afdf4d48479e5f369a0446db51a681117.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193058

From: Ross Burton <ross.burton@arm.com>

These test suites are full of timing-sensitive test cases, so skip
them too.

[ YOCTO #15321 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dd06c3668dbe9ec1cf9a0a84d7a6bc9851f9c662)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-devtools/tcltk/tcl/run-ptest
index 51e1e4aa7b..87e025fce1 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -5,8 +5,8 @@ export TZ="Europe/London"
 export TCL_LIBRARY=library
 
 # Some tests are overly strict with timings and fail on loaded systems.
-# See bugs #14825 #14882 #15081.
-SKIPPED_TESTS='cmdMZ-6.6 exit-1.* socket-* socket_inet-*'
+# See bugs #14825 #14882 #15081 #15321.
+SKIPPED_TESTS='async-* cmdMZ-6.6 event-* exit-1.* socket-* socket_inet-*'
 
 for i in `ls tests/*.test | awk -F/ '{print $2}'`; do
     ./tcltest tests/all.tcl -file $i -skip "$SKIPPED_TESTS" >$i.log 2>&1
-- 
2.34.1


