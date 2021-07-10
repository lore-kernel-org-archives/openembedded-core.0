Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.851.1625954309864419080
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jul 2021 14:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bOidz7OG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id k4so11696939wrc.8
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Jul 2021 14:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dkfvsmg4t46udH1V61Tgq96e9VNnTjYKSvfmUiUWSmc=;
        b=bOidz7OGoMNXgI+B+cTK6YIfNdaXMWLTUTJjsdivvJpTjoE9iC8gRXAAXpk/AqzPiH
         8BHd9GEIdsTZN9nQqr+ULaOj0DqySmgP28Euz/wtoCYIq9ftGStTOv4Iqli7yZmBAoTZ
         j3UQR0DJ0EyPq8Q2m/BpJh19XkQCg/NDp6m+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dkfvsmg4t46udH1V61Tgq96e9VNnTjYKSvfmUiUWSmc=;
        b=clYOgLzTHyMp8BcrGeUAt0oqQOLFucLZBuc2Dh/1PtypVTPYLansG4lrC4AQX63P1r
         shX7yKz4H2m98y5MAdDxyAiJAAXjSViHqToi1QFdCL3eeazenhy48SjOwUFPqkCpltja
         a9iPArNB4PpzsvPi6V7f6zuaDRg/3Vsml0TJeveo5DGbo66CpXTy+U6kr0/DwXrSjekK
         MHm149+7Whbu3KIFuSc9uN/K1cXXZqQiLfgc1Xfv42Dh3YVKFB1B+hq2OnaVN6a75pA8
         FYT90EIlNIOCmPHuW+6XPXfeLKqXfZPspxF5I/tqcR/ddw6jEJzOibns4+7dfGBHql/A
         oGdQ==
X-Gm-Message-State: AOAM533mBE42j4E2GJnr57GKkAF8OQVFFVdqDgpxn0m9kVWM3WIByOhk
	JUH8mSRJ4JOPldM/0yHFDa6uNWBS1tg1xA==
X-Google-Smtp-Source: ABdhPJx2WBhrMNsjaPrj3mG/Tqp7ZhVcwToI8Ud/MEVu7d7pjYCeYnKXz31tnxDqsg1xlRgnUz/dZQ==
X-Received: by 2002:a5d:4912:: with SMTP id x18mr18481908wrq.310.1625954308227;
        Sat, 10 Jul 2021 14:58:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5e67:1ea9:260d:3e7f])
        by smtp.gmail.com with ESMTPSA id v18sm11131611wrr.54.2021.07.10.14.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 14:58:27 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH] ports/linux: Always build statx support
Date: Sat, 10 Jul 2021 22:58:27 +0100
Message-Id: <20210710215827.2793347-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We want a pseudo which can build on a system without statx support but work on
one with statx support. By adding a copy of the struct we can do this and then
work correclty with OE's uninative again.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ports/linux/nostatx/portdefs.h | 38 ++++++++++++++++++++++++++++++++++
 ports/linux/subports           |  5 +++++
 2 files changed, 43 insertions(+)
 create mode 100644 ports/linux/nostatx/portdefs.h

diff --git a/ports/linux/nostatx/portdefs.h b/ports/linux/nostatx/portdefs.h
new file mode 100644
index 0000000..ded8ff9
--- /dev/null
+++ b/ports/linux/nostatx/portdefs.h
@@ -0,0 +1,38 @@
+/*
+ * SPDX-License-Identifier: LGPL-2.1-only
+ *
+ * Copy of the statx struct to allow a pseudo built on a system without
+ * statx to work on one with statx and hence work with OE's uninative
+ */
+
+struct statx_timestamp
+{
+  __int64_t tv_sec;
+  __uint32_t tv_nsec;
+  __int32_t __statx_timestamp_pad1[1];
+};
+
+struct statx
+{
+  __uint32_t stx_mask;
+  __uint32_t stx_blksize;
+  __uint64_t stx_attributes;
+  __uint32_t stx_nlink;
+  __uint32_t stx_uid;
+  __uint32_t stx_gid;
+  __uint16_t stx_mode;
+  __uint16_t __statx_pad1[1];
+  __uint64_t stx_ino;
+  __uint64_t stx_size;
+  __uint64_t stx_blocks;
+  __uint64_t stx_attributes_mask;
+  struct statx_timestamp stx_atime;
+  struct statx_timestamp stx_btime;
+  struct statx_timestamp stx_ctime;
+  struct statx_timestamp stx_mtime;
+  __uint32_t stx_rdev_major;
+  __uint32_t stx_rdev_minor;
+  __uint32_t stx_dev_major;
+  __uint32_t stx_dev_minor;
+  __uint64_t __statx_pad2[14];
+};
diff --git a/ports/linux/subports b/ports/linux/subports
index 740ec83..099ea59 100755
--- a/ports/linux/subports
+++ b/ports/linux/subports
@@ -55,6 +55,8 @@ else
 fi
 rm -f dummy.c dummy.o
 
+# For statx, we want a pseudo which can work with OE's uninative, i.e. build on a system without
+# statx but work on one with it. We have a header in nostatx to allow this.
 cat > dummy.c <<EOF
 #define _GNU_SOURCE
 #include <sys/stat.h>
@@ -62,6 +64,9 @@ struct statx x;
 EOF
 if ${CC} -c -o dummy.o dummy.c >/dev/null 2>&1; then
 	echo "linux/statx"
+else
+	echo "linux/nostatx"
+	echo "linux/statx"
 fi
 rm -f dummy.c dummy.o
 
-- 
2.30.2

