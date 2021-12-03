Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D18B1C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 18:21:32 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.15178.1638555692047496662
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=R78ELOjj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id v19so2669261plo.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sfJy54YJofoYbeotJqViD3hnYvuTAcRDGu9MHiY+FEE=;
        b=R78ELOjjCBT0MoX8OtaYzh+NXVKiPt/9pOIHuhqAjG0HXsvbdyKScU4nnJR/7yZDdl
         ICeks2LlxnmAIBtpUOMoOAbT8RHrU4GDbw4zX2yiygR9xurm25BwfiaHNxI9VDV5Apcj
         KsEq4T5xQ3PRPtuJt42mkJ2RS6hk4rgjHuzwHiChHtSZXdQt/3k2HaGRdNDjPhQLGN5S
         FfKATnScgyAiHqUHx6HrddJs46dVhCXwyF0o1M69TGF7zsycdI4qXB/yfXa3ETa2IAyY
         qjxlgFk7pghzoOFUd7EJPvi/6KcHLwCKfGurbMU6vcwd/0FK1/1dxS5Q4jDugUbfq2tr
         8JLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sfJy54YJofoYbeotJqViD3hnYvuTAcRDGu9MHiY+FEE=;
        b=uhXGgydyotWSp8lSo1AARuhn8jfQQP8ErqabA/z7KFwvNWkhXABJGZsIOVYZTCdvZX
         Hyr/Lo6yEfYNoJU5h0K/TdunB2mqK1RMHgKCqOVyxGnEAwWiAe8OvRgU+I5vGGN3WmIP
         VmybWcda3G0CjbEuxMIppO+EgYBoDzGXX6fvcuCC7yi7OtH6iXEaLI2Kmw6+wZbwCguV
         NGQ93lboTAnbWGiYBaWAPc3pVyQtQi0iAmBBMf/6k8+Rnry7dTaGjPISur/o9AuTVt2/
         PjDnQ2YVFPjlQ4F4qUjU+a4n6iqLXbMt0t8U3h9Aks3d3op120xsq1i5zwi3j01uIexd
         /wqg==
X-Gm-Message-State: AOAM533wBTCjmyZ9EmBfJWhIXYLRWQPZnugdLSYEt7TG9AH7jeeT1cKE
	WoPGIBIhaLb6gVbX2pdHux+FS54L2RWe6cky23Y=
X-Google-Smtp-Source: 
 ABdhPJwWYBVamBHocot4Z1DeeQIIavdjQzWK1ClQ6uGfJuKq2jfQlcfMMEClTGAyy3AqfDZw8Zh7uQ==
X-Received: by 2002:a17:902:8346:b0:142:9e66:2f54 with SMTP id
 z6-20020a170902834600b001429e662f54mr24246940pln.27.1638555691051;
        Fri, 03 Dec 2021 10:21:31 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 130sm3959753pfu.13.2021.12.03.10.21.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 10:21:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/18] busybox: Fix for CVE-2021-42374
Date: Fri,  3 Dec 2021 08:18:50 -1000
Message-Id: 
 <4faf92eef73c7f1a1940f99e245026a483187910.1638555254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638555254.git.steve@sakoman.com>
References: <cover.1638555254.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 18:21:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159129

From: Pavel Zhukov <pavel.zhukov@huawei.com>

An out-of-bounds heap read in unlzma leads to information leak and
denial of service when crafted LZMA-compressed input is decompressed.
This can be triggered by any applet/format that internally supports
LZMA compression.

Reference: https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42374

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../busybox/busybox/CVE-2021-42374.patch      | 53 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2021-42374.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2021-42374.patch b/meta/recipes-core/busybox/busybox/CVE-2021-42374.patch
new file mode 100644
index 0000000000..aef8a3db85
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2021-42374.patch
@@ -0,0 +1,53 @@
+From 04f052c56ded5ab6a904e3a264a73dc0412b2e78 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Tue, 15 Jun 2021 15:07:57 +0200
+Subject: [PATCH] unlzma: fix a case where we could read before beginning of
+ buffer
+Cc: pavel@zhukoff.net
+
+Testcase:
+
+  21 01 01 00 00 00 00 00 e7 01 01 01 ef 00 df b6
+  00 17 02 10 11 0f ff 00 16 00 00
+
+Unfortunately, the bug is not reliably causing a segfault,
+the behavior depends on what's in memory before the buffer.
+
+function                                             old     new   delta
+unpack_lzma_stream                                  2762    2768      +6
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
+
+CVE: CVE-2021-42374
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?h=1_33_stable&id=d326be2850ea2bd78fe2c22d6c45c3b861d82937]
+Comment: testdata dropped because of binary format
+
+---
+ archival/libarchive/decompress_unlzma.c |   5 ++++-
+ testsuite/unlzma.tests                  |  17 +++++++++++++----
+ testsuite/unlzma_issue_3.lzma           | Bin 0 -> 27 bytes
+ 3 files changed, 17 insertions(+), 5 deletions(-)
+ create mode 100644 testsuite/unlzma_issue_3.lzma
+
+diff --git a/archival/libarchive/decompress_unlzma.c b/archival/libarchive/decompress_unlzma.c
+index 0744f231a1d64d92676b0cada2342f88f3b39b31..fb5aac8fe9ea0c53e0c2d7a7cbd05a753e39bc9d 100644
+--- a/archival/libarchive/decompress_unlzma.c
++++ b/archival/libarchive/decompress_unlzma.c
+@@ -290,8 +290,11 @@ unpack_lzma_stream(transformer_state_t *xstate)
+ 				uint32_t pos;
+ 
+ 				pos = buffer_pos - rep0;
+-				if ((int32_t)pos < 0)
++				if ((int32_t)pos < 0) {
+ 					pos += header.dict_size;
++					if ((int32_t)pos < 0)
++						goto bad;
++				}
+ 				match_byte = buffer[pos];
+ 				do {
+ 					int bit;
+-- 
+2.34.0
+
diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
index d9d5f4f96b..55c00eb483 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -52,6 +52,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-hwclock-make-glibc-2.31-compatible.patch \
            file://0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch \
            file://0001-mktemp-add-tmpdir-option.patch \
+           file://CVE-2021-42374.patch \
            "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.25.1


