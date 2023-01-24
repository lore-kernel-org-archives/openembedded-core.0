Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31AEC05027
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 02:38:06 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.6201.1674527881012518455
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 18:38:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y8kTcazP;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 36so10412524pgp.10
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 18:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0m/xBa+aHHaUFrcKwW9NhhCCBB2RugMgzLVJ80xxWpE=;
        b=Y8kTcazPrAofyS7qeSuytjZQ6K3CtAu/8fCN5sz4qCmR1d8+e0WevTRdpWnxMbEBFR
         mARAh1ny3pqrOdk6KfdmykczFWxrQNLl1n9nCjLZW9tyGtkV91zR2hSD6d/FwrQktq6K
         xB/iG7PRBw+DzLzUjFp1V2sgmYrpfaRnj1kfJ58t7ywJ4NHiWJwv7spR6kAv4iA/fyG9
         yMQojgMzPY0etdFo113hck0YNJlc2SRBZIsfrcdq7zG/LtAwN7Gfc3va7mPKEks91GTx
         s8KO940iM4yiorM8jbK5vO+4/saGnqIU72ABwftjvfyzDzlZtkKLg/DdMbNZRnP1fINc
         mSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0m/xBa+aHHaUFrcKwW9NhhCCBB2RugMgzLVJ80xxWpE=;
        b=6iyQpzCt04Q9x992iXKLLKUd/Q6SIz0ndCj8TMbRjimhMm+/U8YjWV8RSbs3mWDyxb
         D2/G9ar1I/2LmsrftRgIeYqXpqKVOW93OehQJtv6pfDnn0XwALjoRkiWDhV9ypHZwVST
         aKaX2vhvVXs1RRctxl2F8ZR7bXuBzlUhl+r/LgaaR6gJ4FNAtiNXK1BG+UUTERea99mi
         bAVxBvsv352hRkM5jUYKswEttXOQaJC86xDGTrBi6sERDhiJz/5PTZ2oeUaFzgjJLpKu
         BExWBSY/6E6QeBGjBscdd5nIxUEjt86Ow028hYxGllKnrabWjApEGhfmRS1zJoe1Y4vF
         e/Aw==
X-Gm-Message-State: AFqh2kq0OUBWeT8WTJqh4cgkb5PdkhIjIljcM/4antwix0ZIY9fdak3u
	9ikSFARs3MbEGglGfd0ciy6Su2Kdi8D3IQ==
X-Google-Smtp-Source: AMrXdXusZJWqnWwNXhrXXQLx9fj6eTCZ7VdbZOXozqt9NAbdpKW+W5YJ03IB/bYDm7N9IMD6BfLVRA==
X-Received: by 2002:a05:6a00:2a3:b0:585:7a3f:8de8 with SMTP id q3-20020a056a0002a300b005857a3f8de8mr23859059pfs.23.1674527880151;
        Mon, 23 Jan 2023 18:38:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id b26-20020aa78eda000000b0058b9c9def36sm289810pfr.139.2023.01.23.18.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 18:37:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] apt: add missing <cstdint> for uint16_t
Date: Mon, 23 Jan 2023 18:37:55 -0800
Message-Id: <20230124023756.543982-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230124023756.543982-1-raj.khem@gmail.com>
References: <20230124023756.543982-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 02:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176322

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-add-missing-cstdint-for-uint16_t.patch | 35 +++++++++++++++++++
 meta/recipes-devtools/apt/apt_2.4.5.bb        |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-add-missing-cstdint-for-uint16_t.patch

diff --git a/meta/recipes-devtools/apt/apt/0001-add-missing-cstdint-for-uint16_t.patch b/meta/recipes-devtools/apt/apt/0001-add-missing-cstdint-for-uint16_t.patch
new file mode 100644
index 0000000000..44aa8a5873
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-add-missing-cstdint-for-uint16_t.patch
@@ -0,0 +1,35 @@
+From 960d10e89cf60d39998dae6fdcd4f0866b753a79 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Jan 2023 12:31:35 -0800
+Subject: [PATCH] add missing <cstdint> for uint16_t
+
+This fixes build problems with gcc 13 snapshot [1]
+
+Fixes
+| include/apt-pkg/pkgcache.h:257:23: warning: cast from 'char*' to 'const uint16_t*' {aka 'const short unsigned int*'} increases required alignment of target type [-Wcast-align]
+|   257 |       uint16_t len = *reinterpret_cast<const uint16_t*>(name - sizeof(uint16_t));
+|       |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+[1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
+
+Upstream-Status: Submitted [https://salsa.debian.org/apt-team/apt/-/merge_requests/276]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ apt-pkg/contrib/mmap.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/apt-pkg/contrib/mmap.cc b/apt-pkg/contrib/mmap.cc
+index 642e20473..0568e1cd0 100644
+--- a/apt-pkg/contrib/mmap.cc
++++ b/apt-pkg/contrib/mmap.cc
+@@ -23,6 +23,7 @@
+ #include <apt-pkg/macros.h>
+ #include <apt-pkg/mmap.h>
+ 
++#include <cstdint>
+ #include <cstring>
+ #include <string>
+ #include <errno.h>
+-- 
+2.39.1
+
diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb b/meta/recipes-devtools/apt/apt_2.4.5.bb
index 4b9f804039..4ecbf98554 100644
--- a/meta/recipes-devtools/apt/apt_2.4.5.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
@@ -16,6 +16,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-Remove-using-std-binary_function.patch \
            file://0001-typecast-time_t-and-suseconds_t-from-std-chrono.patch \
            file://0002-interactive-helper-Undefine-_FORTIFY_SOURCE.patch \
+           file://0001-add-missing-cstdint-for-uint16_t.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.39.1


