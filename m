Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D02C77B7F
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 17:20:56 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.51572.1682788854250366077
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 10:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=rIGKDCGx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-24dec03ad8fso95418a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 10:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682788853; x=1685380853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zop7QyqOlnweELx104dtrZmqStiJ9p+/SqWmS6m4e+0=;
        b=rIGKDCGxMvLPmB5DmXizaXbXp/EtnbT48kRGSNigdUtWT3qe43fd4ycVoi/rExZfS2
         2Fqb5oC0ciphFlTFCWPrGSevA2s42ESDmoUQ2j++Kj11v/UmWApzGVnnJGH5wmersxg4
         jWHmP75t1YvRoRk1InWMpOAkcV2mC6tMTh6QmYjT+yzQhWRD2cGP1au+nl6QlvhwylSS
         pfKUgbyoUkErcju64+eClP7fEiCNZFfVFao/TuBgXEnkpSNH381l5OA1oPb7q7P0ePQO
         DJ3aTEeYbvv4MNj5M0sAs+QHXsbEa2iEIv0IyEggdyZZ9gao2JE9IFmAZwut0p1VI3X7
         EiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682788853; x=1685380853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zop7QyqOlnweELx104dtrZmqStiJ9p+/SqWmS6m4e+0=;
        b=dbHcuUKmqxwl3mx/qZ9FafkjsIfzqXjYNUsm4nSdO76hz9rKJLq5s9P8xO/6c4voxf
         xJcenzN6Dc8T4ganYK7ZbcSX5Zqk/ctJWcZxq1xIt1iJsUHpGXm92IijrnG7U/2HkClO
         7oeCvtRVMNlr6ZGg4rRMqq0KhcNDn92aK5nnChWJ8lhMRDZdK6zkPqhhbow8hhPI4ebO
         OKyUQwsF0m9aDoGnj84iFZ3aOqsZVF0MKdo2ESVfC+Z/BXY899Slb5cxEoOESAQr+nft
         8yyBAeMkDfMPH42HJqHe5c2fY9Sl7DfildPAndk4Vo/YKfrgXxzBCXIczhhMrCbDxDEp
         1/NQ==
X-Gm-Message-State: AC+VfDxqJ9WkGNVTUwQnBe4RHuN0uuJXhShcBo56G1Vrk3KlpHyMokd0
	wqIU+7udgYxpAR6Y0bs2sQQNboW7OgGAqpF7d2s=
X-Google-Smtp-Source: ACHHUZ59v0Mwhwpv2fpQQWB0s+VEHiktg4PjTtnTPDEaTErhzTAR6T5Bno9npCJE7Yrd167S55T+MA==
X-Received: by 2002:a17:902:e805:b0:19e:7a2c:78a7 with SMTP id u5-20020a170902e80500b0019e7a2c78a7mr11758522plg.57.1682788853212;
        Sat, 29 Apr 2023 10:20:53 -0700 (PDT)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902d90300b001a6b9c42dbasm15156041plz.88.2023.04.29.10.20.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 10:20:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/13] ghostscript: fix CVE-2023-29979
Date: Sat, 29 Apr 2023 07:20:22 -1000
Message-Id: <6d5baff50aa83c663856cccc375c522add97625e.1682788726.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682788726.git.steve@sakoman.com>
References: <cover.1682788726.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 17:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180545

From: Joe Slater <joe.slater@windriver.com>

Backport from 10.02.0 (unreleased).

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/cve-2023-28879.patch          | 60 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/cve-2023-28879.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/cve-2023-28879.patch b/meta/recipes-extended/ghostscript/ghostscript/cve-2023-28879.patch
new file mode 100644
index 0000000000..9b057d609a
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/cve-2023-28879.patch
@@ -0,0 +1,60 @@
+From 37ed5022cecd584de868933b5b60da2e995b3179 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <ken.sharp@artifex.com>
+Date: Fri, 24 Mar 2023 13:19:57 +0000
+Subject: [PATCH] Graphics library - prevent buffer overrun in (T)BCP encoding
+
+Bug #706494 "Buffer Overflow in s_xBCPE_process"
+
+As described in detail in the bug report, if the write buffer is filled
+to one byte less than full, and we then try to write an escaped
+character, we overrun the buffer because we don't check before
+writing two bytes to it.
+
+This just checks if we have two bytes before starting to write an
+escaped character and exits if we don't (replacing the consumed byte
+of the input).
+
+Up for further discussion; why do we even permit a BCP encoding filter
+anyway ? I think we should remove this, at least when SAFER is true.
+---
+CVE: CVE-2023-28879
+
+Upstream-Status: Backport [see text]
+
+git://git.ghostscript.com/ghostpdl
+cherry-pick
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+ base/sbcp.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/base/sbcp.c b/base/sbcp.c
+index 979ae0992..47fc233ec 100644
+--- a/base/sbcp.c
++++ b/base/sbcp.c
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 2001-2021 Artifex Software, Inc.
++/* Copyright (C) 2001-2023 Artifex Software, Inc.
+    All Rights Reserved.
+ 
+    This software is provided AS-IS with no warranty, either express or
+@@ -50,6 +50,14 @@ s_xBCPE_process(stream_state * st, stream_cursor_read * pr,
+         byte ch = *++p;
+ 
+         if (ch <= 31 && escaped[ch]) {
++            /* Make sure we have space to store two characters in the write buffer,
++             * if we don't then exit without consuming the input character, we'll process
++             * that on the next time round.
++             */
++            if (pw->limit - q < 2) {
++                p--;
++                break;
++            }
+             if (p == rlimit) {
+                 p--;
+                 break;
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 365420fb64..f29c57beea 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -34,6 +34,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
                 file://CVE-2022-2085.patch \
+                file://cve-2023-28879.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.34.1


