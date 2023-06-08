Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C288C7EE2F
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 02:36:16 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.496.1686191776007885639
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 19:36:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=RlEImW9q;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-652328c18d5so21670b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 19:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686191775; x=1688783775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yixRNDyZ8lz4zrixMRXCG8U6+KsxHJVOBjHOdd0K1vY=;
        b=RlEImW9qcMvMXbpjiwEq4t3hEDC75iZtVlcfn9ef6v/Jyqy8SSRqUcJ2ENhC7PliJn
         5lqPwqNziBglyP1LQs0eY6jF+U1+6a3K1OGoOgBlPKdK59Ds7k0IiOFLzKkcDRq/jv8I
         fyThk+seOzeKRlo+wnI0DBfliKM6US4+zxSfTl0QMFgXAIjpneTME/gBZxp4AThQX6O+
         8IQDHpaN0fbndsEONmzXuzwtivN3jap2r6ZUj24m9uBMVBIiQOxQw0JoXFfN64QmIS2f
         G9qgVUv2YHTZAPvAb1NpRxALnGyhLxI+Vgd7/zARMhUyBF5uVrjgyytTCtv8fYkbZvxK
         4SRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686191775; x=1688783775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yixRNDyZ8lz4zrixMRXCG8U6+KsxHJVOBjHOdd0K1vY=;
        b=OFRx7HbJ6KHU+vuL9rvoBRPL1a5BxBf+6VmTixYjUyw9GTEVHQ0oCRNpfQEds7gx+x
         seluy5506+wD4F7/JqUUaKY8PVvGgLIoRdZm19jO2oPTem8rJxZD/rIXxgtBh7uXRw8p
         wr7nBvq/rsXyrJGHEPnql9SHXnpEu+UeKehanpLpJTY7EdVSwfnILwOaKAOTMS1DDd06
         LRNRoTuEOFKpUYoNFIc5voliZgF0qgsXk/f/vjkAcHtRRFvcZz0BN5WRL2F9QAZHzYkY
         R0zv2ytm0p/kMzSeS//4iT13D53kpKuG7CWnjzV10HpX+Hk8FQMUMJwwGGU+DDuSI+i5
         TbHQ==
X-Gm-Message-State: AC+VfDw8+nWIOri7GPFcuGRY/+pckngNHzBKAlenyw4x/wftNH82bWD5
	hZrQIUMtNvE7LnM5j0bKneVxMg2Cxh++gnpt/vY=
X-Google-Smtp-Source: ACHHUZ5x8z/HmQXFPilDmDOJ/5zCmPLc/UWS/lWfZZzL7TJdWy1wgw74akLXO51IJHEBcRklZ7IV5Q==
X-Received: by 2002:a05:6a00:114e:b0:65a:cbf3:4687 with SMTP id b14-20020a056a00114e00b0065acbf34687mr4036650pfm.0.1686191775065;
        Wed, 07 Jun 2023 19:36:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j8-20020a62b608000000b00649ac17779csm19478pff.160.2023.06.07.19.36.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 19:36:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/11] ghostscript: Fix CVE-2023-28879
Date: Wed,  7 Jun 2023 16:35:55 -1000
Message-Id: <ec0c6f941826903b763be76c450f1d4e0e67908e.1686191643.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686191643.git.steve@sakoman.com>
References: <cover.1686191643.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 02:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182484

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;h=37ed5022cecd584de868933b5b60da2e995b3179]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2023-28879.patch          | 54 +++++++++++++++++++
 .../ghostscript/ghostscript_9.52.bb           |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-28879.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-28879.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-28879.patch
new file mode 100644
index 0000000000..852f2459f7
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-28879.patch
@@ -0,0 +1,54 @@
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
+
+Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;h=37ed5022cecd584de868933b5b60da2e995b3179]
+CVE: CVE-2023-28879
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ base/sbcp.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/base/sbcp.c b/base/sbcp.c
+index 6b0383c..90784b5 100644
+--- a/base/sbcp.c
++++ b/base/sbcp.c
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 2001-2019 Artifex Software, Inc.
++/* Copyright (C) 2001-2023 Artifex Software, Inc.
+    All Rights Reserved.
+ 
+    This software is provided AS-IS with no warranty, either express or
+@@ -50,6 +50,14 @@ s_xBCPE_process(stream_state * st, stream_cursor_read * pr,
+         byte ch = *++p;
+ 
+         if (ch <= 31 && escaped[ch]) {
++            /* Make sure we have space to store two characters in the write buffer,
++	     * if we don't then exit without consuming the input character, we'll process
++	     * that on the next time round.
++	     */
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
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
index a829d4b4ae..57f0b51ad3 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
@@ -39,6 +39,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2021-3781_1.patch \
                 file://CVE-2021-3781_2.patch \
                 file://CVE-2021-3781_3.patch \
+                file://CVE-2023-28879.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.34.1


