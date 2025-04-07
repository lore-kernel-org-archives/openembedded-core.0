Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADD4C369A1
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:40:59 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.42760.1744018857757984534
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f+rXXy3O;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso3644869f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744018856; x=1744623656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnEKViEOAmn6ycOZnfNlf3LYEpXidTFhrtm91dWuziE=;
        b=f+rXXy3OM4Ob/cv7Q/YtPLRcpUAiuUwmDW5ltTs1KZgUhBrR0F8aEtvcGZf/vlAaad
         SixjUerdsTlrhBZOB4+XtxY4PcylLpLXpzEqwD7r0qgA0ODXjaLGViiZABnMecVKDu7y
         YGsQU5QYFmxqKBWIxjw6b64OnZtqWDhOrYzrElG/9V55cF51G+lPBRwwSFkf8+yCodnE
         NA5Z01KVure5sxJpDJUVizpuLlO0g4qLiLpXaM10eMzqSDHY83qY8shECdzeeJ+7Dldb
         y6lG4jYMsGjOYXUfBXDu11MTdWaT6ePlW1g6XVM3d1U9q6NZaLrsAlRXvt7FJ9o5ePb/
         NE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018856; x=1744623656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FnEKViEOAmn6ycOZnfNlf3LYEpXidTFhrtm91dWuziE=;
        b=u4U4IFaMAs8OFq+eCaaQiMqRK/qyziU6g0EDP3hYgozq+hsUS7hXnIXUgo0teMzFI/
         hOd4k1rgJfVyz/191NlGbb71uw/iWj0JOra87UH4NvQRH8kLjdnvIZPamRdcxYzjbVnp
         j2GWoXmyLDNLKsICeQaiapcvcSgKWMUCCVKcJXA9A7MZKhumS4jgz31JfTT7Eqf+5eYn
         YxCtHt1TVV2fWdaJJAzBE/+Ac7UfcMOm6SJkFsEvz/dFEbKv4VjAKK/njcnbE1hjUu/K
         u9g1Wq2wDWTq0dC05mo8yv5D+oyINLxUiQBVo3e3T+akpHQhDMQusHwBMVdqUddAp2uM
         s/sg==
X-Gm-Message-State: AOJu0YwqJXpnnh4EWySrj8aNNcbCQ3aCp68HVvBqo+3H/NAbpOSxmcXq
	foHG5I0WnSYMGtA4xYztV44MxFKClFwNiRHp6/C8eJiO2lyMVw6cq1M1PQ==
X-Gm-Gg: ASbGncuS+Z7z4bSsySdI51G96DjUVvD5SxIr5zUWxpVHe2QTxI/n55c7Dxn0S7o0WNe
	fUGQKh/EKhPK1wSsKwKzy1WrMQQrUtkzfu6yYHVw1IF9VQuPE7HonUEdZ3xC9ewt5whxvaK05HP
	YXo8wKOQeWHxVbEBO49MnG5ZSB0Go5boEgxzmCHYVHQlBKlfvkRCVtQrdvplou8SIMXV9aOYnAt
	uO9MpqCt0s+j6JMuFUTCt4mWOEGAH9frRcIAnuA/577rIFh6OfZ78XiAVd2kU5c4mgNU3eO5dYD
	ka424gM/+seO962Hf38vvZ0wb/XMUC9J77LzkzOqecoM/oHvtZaon8glwZSYP0Ky7sSBoBglExY
	+OAP5yA==
X-Google-Smtp-Source: AGHT+IFnnN9KE2ID4eLToByw1MO9GiWcx5PziYRHAjz/Jhoom+t1Y6TKtxlRZOnv+fwDBiBWLKKT7Q==
X-Received: by 2002:a05:6000:1844:b0:391:12a5:3c95 with SMTP id ffacd0b85a97d-39d0de255d4mr9638810f8f.22.1744018855854;
        Mon, 07 Apr 2025 02:40:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a76cesm11562459f8f.37.2025.04.07.02.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:40:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/18] apt: remove 0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch
Date: Mon,  7 Apr 2025 11:40:37 +0200
Message-Id: <20250407094045.753021-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407094045.753021-1-alex.kanavin@gmail.com>
References: <20250407094045.753021-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214419

From: Alexander Kanavin <alex@linutronix.de>

The recipe unconditionally disables seccomp, so the code isn't
even compiled. If this needs to come back in the future please
submit upstream first.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...atat64-and-prlimit64-defines-on-musl.patch | 48 -------------------
 meta/recipes-devtools/apt/apt_2.6.1.bb        |  1 -
 2 files changed, 49 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch

diff --git a/meta/recipes-devtools/apt/apt/0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch b/meta/recipes-devtools/apt/apt/0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch
deleted file mode 100644
index f1816836b59..00000000000
--- a/meta/recipes-devtools/apt/apt/0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From e849b161ce1d87ab369b921438abcf5b3a03e186 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 25 Apr 2021 08:57:03 -0700
-Subject: [PATCH] Hide fstatat64 and prlimit64 defines on musl
-
-musl defines fstatat64 and prlimit64 as macros which confuses the
-seccomp sysall rewiring since there are syscalls with same names
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- methods/aptmethod.h | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/methods/aptmethod.h b/methods/aptmethod.h
-index bd50e80..3085aed 100644
---- a/methods/aptmethod.h
-+++ b/methods/aptmethod.h
-@@ -121,6 +121,12 @@ protected:
-       if (ctx == NULL)
- 	 return _error->FatalE("HttpMethod::Configuration", "Cannot init seccomp");
- 
-+#ifndef __GLIBC__
-+#pragma push_macro("fstatat64")
-+#pragma push_macro("prlimit64")
-+#undef fstatat64
-+#undef prlimit64
-+#endif
- #define ALLOW(what)                                                     \
-    if ((rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(what), 0))) \
-       return _error->FatalE("HttpMethod::Configuration", "Cannot allow %s: %s", #what, strerror(-rc));
-@@ -320,9 +326,11 @@ protected:
- 	 if ((rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, seccomp_syscall_resolve_name(custom.c_str()), 0)))
- 	    return _error->FatalE("aptMethod::Configuration", "Cannot allow %s: %s", custom.c_str(), strerror(-rc));
-       }
--
- #undef ALLOW
--
-+#ifndef __GLIBC__
-+#pragma pop_macro("fstatat64")
-+#pragma pop_macro("prlimit64")
-+#endif
-       rc = seccomp_load(ctx);
-       if (rc == -EINVAL)
-       {
--- 
-2.31.1
-
diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtools/apt/apt_2.6.1.bb
index 62a674d62bb..d605d950dd3 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
@@ -11,7 +11,6 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-Fix-musl-build.patch \
            file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch \
            file://0001-cmake-Do-not-build-po-files.patch \
-           file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch \
            file://0001-aptwebserver.cc-Include-array.patch \
            file://0001-Remove-using-std-binary_function.patch \
            file://0001-strutl-Add-missing-include-cstdint-gcc-15.patch \
-- 
2.39.5


