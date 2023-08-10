Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBCCC001DB
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 04:49:44 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.10606.1691642982952046489
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 21:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=FUQd/uNx;
 spf=pass (domain: mvista.com, ip: 209.85.216.48, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-26948743648so367619a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 21:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1691642981; x=1692247781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s5SATxe8pAapSfNTwA6S9ReXBsJtgsd4YC6jAC48cPE=;
        b=FUQd/uNxU9YVdzn9KchNXomGY1gNiSczvKGG++EZYhW60/AVF7oyK9GEPMzODirPLs
         2HgWMmbcTkIO7z0E6JY08b4TJDjcQEh9/u+85+JXGdf9HrorC0eAfdzVV6YbPOIZLm6M
         xLjAkgIF/MvDj69UDSycAEPtL8an1CkTW9Lhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691642981; x=1692247781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5SATxe8pAapSfNTwA6S9ReXBsJtgsd4YC6jAC48cPE=;
        b=H09UntVo4dPx/MoTgGpF3zckXb2pKmVOlj4IELxP+F4CUsqqAq181XenGQzGv3KHX1
         F5K07SEfqJorIoBgwquQ0VPwp0JynAxYatYF8VbE9e/HRYoGjIh7hOGynov+YEvpbEhq
         qewyhZRZnc6pChc62ASY3AWt6gboo6Qhq3/5aaWAq2z5mDJ3ao/11eQPla1mgI4MFgVm
         p2Ejrza6CpvldpWyD0kTEP4IdQnrPdrp6fhu18/nPVvsFp3dUqxHr4aT4GrwS+Ip06Ts
         u7tYSWWVC7YkpRS2Mxcb3QoCwq4RjF8Bl836N46W1JmvnlxDKlvv0ZLyChN+8StluRQv
         GDxg==
X-Gm-Message-State: AOJu0YztJ41kbPTfW1AdV0Ut21kKGUcRg2YUavzdLWKCuXXm6eKTX2Fb
	+m8i+28vnXsBlM7U0CqnZc5cADNlwyCOISUDbss=
X-Google-Smtp-Source: AGHT+IGJQWlRunVqwiu72ZqecR9Mg8eWq20+ma3XeigEBWMGFP5suUVXlxOfliiSxaZaP8TE36HH0A==
X-Received: by 2002:a17:90a:d685:b0:268:5c3b:6f37 with SMTP id x5-20020a17090ad68500b002685c3b6f37mr1245649pju.0.1691642980936;
        Wed, 09 Aug 2023 21:49:40 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.37.147.45])
        by smtp.gmail.com with ESMTPSA id mj10-20020a17090b368a00b00268320ab9f2sm2385836pjb.6.2023.08.09.21.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 21:49:40 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] ghostscript: backport fix for CVE-2023-38559
Date: Thu, 10 Aug 2023 10:17:25 +0530
Message-Id: <20230810044725.962965-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 04:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185723

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=d81b82c70bc1fb9991bb95f1201abb5dea55f57f

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...pcx-buffer-overrun-fix-from-devices-.patch | 31 +++++++++++++++++++
 .../ghostscript/ghostscript_9.52.bb           |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch
new file mode 100644
index 0000000000..91b9f6df50
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch
@@ -0,0 +1,31 @@
+From d81b82c70bc1fb9991bb95f1201abb5dea55f57f Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Mon, 17 Jul 2023 14:06:37 +0100
+Subject: [PATCH] Bug 706897: Copy pcx buffer overrun fix from
+ devices/gdevpcx.c
+
+Bounds check the buffer, before dereferencing the pointer.
+
+Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=d81b82c70bc1fb9991bb95f1201abb5dea55f57f]
+CVE: CVE-2023-38559
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ base/gdevdevn.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/base/gdevdevn.c b/base/gdevdevn.c
+index 3b019d6..2888776 100644
+--- a/base/gdevdevn.c
++++ b/base/gdevdevn.c
+@@ -1980,7 +1980,7 @@ devn_pcx_write_rle(const byte * from, const byte * end, int step, gp_file * file
+         byte data = *from;
+ 
+         from += step;
+-        if (data != *from || from == end) {
++        if (from >= end || data != *from) {
+             if (data >= 0xc0)
+                 gp_fputc(0xc1, file);
+         } else {
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
index 57f0b51ad3..37e9ed8e84 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
@@ -40,6 +40,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2021-3781_2.patch \
                 file://CVE-2021-3781_3.patch \
                 file://CVE-2023-28879.patch \
+                file://0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.25.1


