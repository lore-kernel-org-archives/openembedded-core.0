Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B35C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 11:03:47 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.57356.1723115022843403282
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 04:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PSBlBHT2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-368526b1333so1119857f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 04:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723115021; x=1723719821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UbEcqQh//txrKHzj7toBVs6n9vOgbHPY7WQ9Vx4k1W8=;
        b=PSBlBHT2o6MIEcS0dEHFOEpafXpnOoHuA4JvvvIco7cf0idlsy5jD5b6rcpJC6Xlbj
         shQ+pUUZRfJ5lu7JlzHynC8Z/mnEt+Bh/y8ZcFPR9W4mfj4nYu0KCDVTofBVHB/ilDHC
         fZlFCpgGAvhJzoAgYz1HxWTz1iLSuM0DPz7SI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723115021; x=1723719821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UbEcqQh//txrKHzj7toBVs6n9vOgbHPY7WQ9Vx4k1W8=;
        b=sCL0Dg7GguRI/j99UzEcTq3f9+gyn0ixO/G9L9aeIC3DrQJiLbYrmKqzrJetAAxW8u
         em0A/3Sbny1bPNQk6UuSgxMUP8zrK7IXz1m51Fd7MiTbEVnvnbuEIdQ/CjHYeXPcEidj
         8L0/2vLARGGLg8i+3ioVjLumL35MRbOv2jFLLkBs0Zp6SwDW0xeXYqNg1D/DQH1AhG/J
         YIJeY24Br1tUo5G0ZtDfuqi47KD6Wj83mf/flZpVsZ2WloUh+t5UQ5sOIE9VXLRV+dWk
         7O12aKTfb8HXW1Jbhjj+MNt5O9meBasJYObQbIgmwzd5GqE0DB9wSSIGCyHVaktGApIx
         VysQ==
X-Gm-Message-State: AOJu0YxA8XewyXCaZJz3Ef97woQGPpf/tdKTKj9mECKgRFXgGBiOdNCl
	U55NK2SbLu2NNc2W8otVZCge4tl4hSm+HTTDkvCr+iXKciAr09lnqpMq/73xBr08xpBGmaNv6QQ
	4WxY=
X-Google-Smtp-Source: AGHT+IH8LTbzTQEpIoH0XmDsTb/1nyH/JwUOvKGhVPVJ5vuq/mPojibYR+8Td+Pp+f4aS86zGOpxdw==
X-Received: by 2002:a05:6000:18ae:b0:360:8c88:ab82 with SMTP id ffacd0b85a97d-36d2819ccf9mr1601071f8f.30.1723115019909;
        Thu, 08 Aug 2024 04:03:39 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:43bd:e590:a93b:4c51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d2724c72asm1507227f8f.113.2024.08.08.04.03.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 04:03:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] coreutils: Fix intermittent ptest issue
Date: Thu,  8 Aug 2024 12:03:38 +0100
Message-ID: <20240808110338.328403-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 11:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203130

The test writes to the disk and means the space used changes. If this
crosses a number boundary, the heading spacing can change causing a test
failure. This was triggered by a recent gcc upgrade.

Add a fix for this which has been shared with upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../coreutils/intermittent-testfailure.patch  | 29 +++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.5.bb  |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/intermittent-testfailure.patch

diff --git a/meta/recipes-core/coreutils/coreutils/intermittent-testfailure.patch b/meta/recipes-core/coreutils/coreutils/intermittent-testfailure.patch
new file mode 100644
index 00000000000..dc1e1592e12
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/intermittent-testfailure.patch
@@ -0,0 +1,29 @@
+tests/df: Fix intermittent test failure
+
+The test writes to the disk and means the space used changes. If this
+crosses a number boundary, the heading spacing can change:
+
+-Filesystem     1024-blocks  Used Available Capacity Mounted on
++Filesystem     1024-blocks   Used Available Capacity Mounted on
+
+The test is to make sure the 1024 blocks element remains the same and
+the spacing doesn't matter. Therefore strip any duplicate spaces using tr.
+
+Upstream-Status: Submitted [https://github.com/coreutils/coreutils/pull/88]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: coreutils-9.5/tests/df/df-P.sh
+===================================================================
+--- coreutils-9.5.orig/tests/df/df-P.sh
++++ coreutils-9.5/tests/df/df-P.sh
+@@ -20,8 +20,8 @@
+ print_ver_ df
+ 
+ 
+-              df -P . > t1 || fail=1
+-BLOCK_SIZE=1M df -P . > t2 || fail=1
++              df -P . | tr -s ' ' > t1 || fail=1
++BLOCK_SIZE=1M df -P . | tr -s ' ' > t2 || fail=1
+ 
+ # Since file system utilization may be changing, compare only df's header line.
+ # That records the block size.  E.g., for "1M", it would be:
diff --git a/meta/recipes-core/coreutils/coreutils_9.5.bb b/meta/recipes-core/coreutils/coreutils_9.5.bb
index 178dadc3c5f..af0fcdcc4cf 100644
--- a/meta/recipes-core/coreutils/coreutils_9.5.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.5.bb
@@ -16,6 +16,7 @@ inherit autotools gettext texinfo
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
+           file://intermittent-testfailure.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "cd328edeac92f6a665de9f323c93b712af1858bc2e0d88f3f7100469470a1b8a"

