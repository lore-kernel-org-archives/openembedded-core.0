Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1077110A1E80
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:46:12 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45454.1774525570518120910
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:46:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=MrOV0Ui+;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.66, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b978f4132c7so10534166b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 04:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1774525569; x=1775130369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GzjBirZFHZLdWNR0e6g4kOlOAwjQn42IxxrajG0EwfA=;
        b=MrOV0Ui+eMIq9NvuFAo7gdkudofFoc6jzEnJLTv7NzmjycmcsG4yoD1ikSy7rBeYGc
         l913P07O0gF7VYVTvncvzfKFTGz+o0/0X1CgW9dmclGkii7/q+HxUxiuZCA6UXhfwnKw
         MfNiJNg0r7ZXbMK8ecbBhqOXNgv0tuKRo7xcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774525569; x=1775130369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzjBirZFHZLdWNR0e6g4kOlOAwjQn42IxxrajG0EwfA=;
        b=oFencSchmDhuZxS4hZGydr/eFo08dYiJ5tX4BxJY6bqqor0yIoY26AA9YFrhKyt4XU
         VWLh4ZekOhVBQTOdJ77Py6JUOboL+lH7YN7IG2UMnGkMaENhvh86OsIjyaQhlVgQ1dVy
         NXOXX9wtvzuoo/KuqLPbr/IPnFBA2dEsQvrimIGhSIFGzUL481r+VVesbnib8WdGebgG
         uxvZLN9bmqeE14N2ngyDPkkGkrAB5WoaVbpfs0Q9Sww/sJURNtjz6IpMB5iVkmrreGb5
         mXqCqYVNHO26x218qBSQUAbuq9v1fxEKpygGeFphDr+ERn01sjeRoAiwseq7VZLLQrDI
         srQA==
X-Gm-Message-State: AOJu0YytjCLFZMO3ZsRE7eFbteKAPcMNSDFEDnU4ULLZzHR6toeo9wrI
	H6dF08mLZbJ4ZszX2oU5tJqnj6exeE9aCcjCoIEmJaYqaZrOzpPz9sqk5Mi7YqUjs+QBrwny9T7
	UlFNS/GA4zw==
X-Gm-Gg: ATEYQzxiVeHbrm0jBxwqbm4lqVnh9/dux8dfKZ/Bkd6bDkpQ6TVH2QJe73N3leB1Z4a
	Zb9/R9zSh0SXx2PNNoaCHeCXl/TM8IhNKPShdZ+g+5i0G/Sn8aoG0VH+Wbsnr16btteBUwnBWqF
	Z0IlIPteh1hBsvM+Me5LCtujLFy+4mklpRJj2R59voSHTjDxHGgznBu2sQDkQ8LasIvXfJiZ4rn
	uhdEYrEO/Ks0R7OmbMX7RlYjKHFoZzIhTaPDDr+R9eCSOAKMVAnRxHzP64vrxtxNCPMeN01zEws
	It5jrGns1ZsCS7IMB6VIx8grJr4Y+kiz9FV4AbXY0o5wrogo+qDwf1MFb84wQI/jGNocGmbmFaq
	K2mWpx2Z9uuRZsB0StG2qvFaupM8Yy8r5d/HliryOW9Z+aLuPKh6jp1Lxur+b5GHXklNCg+fxGQ
	i/xWEgwdLS31e6OxIc+vZgnfNCy7XgKtwU9LpaS1qlX7DIrMYiH74uWUW3jFNPwh9I/6wLZPukd
	wVo6xxRgCGqRU6hL4mvK7LjnUPxWjaR0alVo1KQWrqgv8xPHwkm7i7kbUzQuX1pLQHSow==
X-Received: by 2002:a17:907:7212:b0:b9b:1963:2ff2 with SMTP id a640c23a62f3a-b9b196334e2mr153378466b.0.1774525568791;
        Thu, 26 Mar 2026 04:46:08 -0700 (PDT)
Received: from adam.amarulasolutions.com (2001-1c00-8183-9900-dfb4-52e9-0b83-429b.cable.dynamic.v6.ziggo.nl. [2001:1c00:8183:9900:dfb4:52e9:b83:429b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b2029b0a6sm109108166b.27.2026.03.26.04.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:46:08 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v2 1/1] libsolv: add fix for musl segfaults
Date: Thu, 26 Mar 2026 12:46:06 +0100
Message-ID: <20260326114606.273018-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 11:46:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233980

By default, musl has a stack size of 128K, while the compress_buf
method uses 256KB of stack space, causing a segfault when the
repopagestore_compress_page method is called.

Pull request: https://github.com/openSUSE/libsolv/pull/612

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...0001-compress_buf-fix-musl-segfaults.patch | 44 +++++++++++++++++++
 .../libsolv/libsolv_0.7.36.bb                 |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0001-compress_buf-fix-musl-segfaults.patch

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-compress_buf-fix-musl-segfaults.patch b/meta/recipes-extended/libsolv/libsolv/0001-compress_buf-fix-musl-segfaults.patch
new file mode 100644
index 0000000000..cf87b3c4c6
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/0001-compress_buf-fix-musl-segfaults.patch
@@ -0,0 +1,44 @@
+From 23e2d4c5064ddb023ed1a9d364793dbe0d20717f Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Thu, 26 Mar 2026 12:11:42 +0100
+Subject: [PATCH] compress_buf: fix musl segfaults
+
+By default, musl has a stack size of 128K, while the compress_buf
+method uses 256KB of stack space!
+
+The easiest course of action is to add `static thread_local`
+to htab and hnext.
+
+Upstream-Status: Submitted [https://github.com/openSUSE/libsolv/pull/612]
+
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ src/repopage.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/repopage.c b/src/repopage.c
+index 77c7fcc7..470e4f34 100644
+--- a/src/repopage.c
++++ b/src/repopage.c
+@@ -29,6 +29,7 @@
+ #include <assert.h>
+ #include <fcntl.h>
+ #include <time.h>
++#include <threads.h>
+ 
+ #ifdef _WIN32
+   #include <windows.h>
+@@ -100,8 +101,8 @@ compress_buf(const unsigned char *in, unsigned int in_len,
+   unsigned int oo = 0;		/* out-offset */
+   unsigned int io = 0;		/* in-offset */
+ #define HS (65536)
+-  Ref htab[HS];
+-  Ref hnext[BLOCK_SIZE];
++  static thread_local Ref htab[HS];
++  static thread_local Ref hnext[BLOCK_SIZE];
+   unsigned int litofs = 0;
+   memset(htab, -1, sizeof (htab));
+   memset(hnext, -1, sizeof (hnext));
+-- 
+2.53.0
+
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.36.bb b/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
index f22230599b..852e79c45e 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "expat zlib zstd"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;tag=${PV} \
+           file://0001-compress_buf-fix-musl-segfaults.patch \
            file://run-ptest \
 "
 
-- 
2.53.0


