Return-Path: <geissonator@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F34C6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 20:13:46 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.7440.1679688826023491859
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 13:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JhlStEV0;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: geissonator@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id bi31so2114768oib.9
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 13:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679688825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/t3fozCPGT8x3H5nNSRu+WR+lUngKcgAzTJJ65crkMc=;
        b=JhlStEV0NE3Gqahrt6em9FNwOmxzpYIDi7euranCKaIXqJBMzAxOMQGIBOqttBULuy
         KteH3JGOLiW1xCw1WUxX8WWmC4x6Exns/Bh+CbtPj1Kacx2lGPzajCiYrzoGYkxNNily
         JMneAHwuKMGv7id+EnhifPd9kBK2osSqhOMKhNADBPeDZo6McGcCm3GyFi0csU8MXpwo
         7Hv6doo8UBKNQRF6T5T2FXyo2cSH8qlKc1S57mtUqT3tgFqMhgXs84X57wFsNqJRYNlg
         tVY9/lFDzFSaveWzMUIK9/cd8+OMYbKEhK2zud7dW5QeZhHDpT34OGbKzDWu1Elnfajp
         DnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679688825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/t3fozCPGT8x3H5nNSRu+WR+lUngKcgAzTJJ65crkMc=;
        b=CZSC53DYZEldPRm9S+pwsi/qrTmPKYVZr+2TIEimpZyt3Au6nrXH5GwJdHlAK2IWIN
         iKGoGl7LxrJ66EZFqR7Gi/ZhMD3vwId5NGOHr/YJis2ckoNsiiwFFFoSJxKuRKoKRzT+
         EgzaZJ12c4o4xX2iSTqakFW47m/KfieCIQlHaoLaEMAgCkMoF5dyQtpdhTgdNxizZZ3x
         Zp1oR+zx5TjfySAqQiDHSLDKtNlG0u/uoZ4uqGk41aYInBoSKaQItWbuNRRqWHXaQkNo
         oYrNuMrwvCGbhyiCZsynSHiZ7NVF/L2UdADKxkLGh51Mk5m5Rhxz0Pd0LgMt9FAhQw+L
         9Ypg==
X-Gm-Message-State: AO0yUKWIRMq29RC5JWQNG2kaEp0CZIoDLxHRlShWtOpslesa0tiKGKQD
	IWB4k0NRe69IqCojETtpNBmh0Ba3vajqiA==
X-Google-Smtp-Source: AK7set/QR5ryR+R2Gu6b54+2pCV2aFGwwO2k7/WVKphqVLJWzDR4uwEpi+PQu3LLuckBmU2idNT0Nw==
X-Received: by 2002:a05:6808:3a84:b0:37b:2252:b94c with SMTP id fb4-20020a0568083a8400b0037b2252b94cmr1779700oib.4.1679688825093;
        Fri, 24 Mar 2023 13:13:45 -0700 (PDT)
Received: from localhost.localdomain ([2600:8803:af0f:ec00:c550:b209:c1e1:c7b9])
        by smtp.gmail.com with ESMTPSA id s129-20020acadb87000000b0038756901d1esm2433089oig.35.2023.03.24.13.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 13:13:44 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrew Geissler <geissonator@gmail.com>
Subject: [PATCH] filemap.py: enforce maximum of 4kb block size
Date: Fri, 24 Mar 2023 15:13:33 -0500
Message-Id: <20230324201333.77508-1-geissonator@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 20:13:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179079

The logic in this script validates that the length of data sections are
evenly divisible by the block size. On most systems the block size is
4KB and all is good. Some systems though, such as ppc64le, have a block
size larger then 4KB. For example on a POWER9 based ppc64le system, the
block size is 64KB.

This results in this script failing with errors like this when building
wic images:
|440, in _do_get_mapped_ranges
|     assert extent_len % self.block_size == 0
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| AssertionError

In this case the data section size was 268KB and the block size was
64KB, resulting in the above assert failure.

Resolves https://bugzilla.yoctoproject.org/show_bug.cgi?id=15075

Signed-off-by: Andrew Geissler <geissonator@gmail.com>
---
 scripts/lib/wic/filemap.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 4d9da28172..85b39d5d74 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -46,6 +46,13 @@ def get_block_size(file_obj):
             bsize = stat.st_blksize
         else:
             raise IOError("Unable to determine block size")
+
+    # The logic in this script only supports a maximum of a 4KB
+    # block size
+    max_block_size = 4 * 1024
+    if bsize > max_block_size:
+        bsize = max_block_size
+
     return bsize
 
 class ErrorNotSupp(Exception):
-- 
2.37.1 (Apple Git-137.1)


