Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web09.821.1626303947859619956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 16:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nik9R6//;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id jx7-20020a17090b46c7b02901757deaf2c8so2502662pjb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 16:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bRLKgzupVk6jLj54/APtEwrUJD5u8TLPh5L3B+TNuJ8=;
        b=Nik9R6//xTBfgD37ccnl+byxKOdkd4OHPoyeL/1iEb5tsnUyLGag9B3YpwWQLUxT7p
         M/KtHMxQrr7U3uEfBFXfjpiacXr+lsNP3uoZpYR9dcKO4L/c/SsBmY2BrU16VPGWpSQT
         GHcH93p9fiJLVxTOehVsk01nFwOXUY+iW1V7QjC/mep/L5L+AX3AX7Znp4RWtXzM7PX9
         4s9gmDE1lMAuvBftK8kEIboBNL0jFHHmFsVaIy/INJWLSl8Ql9u8lCvOaiM0Ew2qsz7T
         rMuXkexn29+Mej0a0FW6tWY9Cus6WkMa8DpEtnHZosFv8Z3L37USVxnf4Dp6WnOVvd/K
         c0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bRLKgzupVk6jLj54/APtEwrUJD5u8TLPh5L3B+TNuJ8=;
        b=E5INVUAz4W0Oo4q2oYSvb/dp92lNqjCjHwqIdUjV1Lsaa2uNRniubHrIA6kGrbGv7R
         aIIhk2oRBEPALCeTRUA21x4HCg+V1/flAWc7LiFC8d3k4uhmDtBSIl/AZ4S8WifCdoj6
         yxNlHug3z0tATA4bGDvDzTKSLLS6+582SPyK+jVgCC52qjG5OyvzGuK1cX3OUvTTE7Nc
         hvMY/sreNIM1vwNn8B/Ka9fxsyXJ7MEHT7mjxXzHS5bluKQDQP7fPXNCVgiGvVeHWRMu
         ZXrblGlQhiWojgSqT29CFjRO7uL+uRw2qCDNBkBVCfZEWIObUiRcNUdQ/PLSZlSQnKdW
         4qmw==
X-Gm-Message-State: AOAM531vblwzoPByZs4WWXt8UdNsJUCKdGilpAGs0IZji4hVN9bLpJjn
	HdmNEEAdHDOJTRJ41gCseg+14UbhzuLDvw==
X-Google-Smtp-Source: ABdhPJxlDEWxOR19dB03L6MjlAVcw8seR5M0A+p+FOn/eSDr+bIbtk6cuMfl/DaJWs2lomQbe5EHRA==
X-Received: by 2002:a17:903:2c3:b029:11b:cbb9:edfb with SMTP id s3-20020a17090302c3b029011bcbb9edfbmr447189plk.12.1626303947017;
        Wed, 14 Jul 2021 16:05:47 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::5593])
        by smtp.gmail.com with ESMTPSA id t5sm4670423pgb.58.2021.07.14.16.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 16:05:46 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] util-linux: Fix signature of close_range()
Date: Wed, 14 Jul 2021 16:05:44 -0700
Message-Id: <20210714230544.3101410-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

close_range expects 3 parameters, thus far it was not implemented in
glibc so it was hidden but with glibc 2.34+ it will start to show up

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 .../0001-login-fix-close_range-use.patch      | 62 +++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-login-fix-close_range-use.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index f10d911fb1..0648366baf 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -41,6 +41,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://tests-ul.patch \
            file://tests-eject.patch \
            file://tests-lscpu.patch \
+           file://0001-login-fix-close_range-use.patch \
            "
 
 SRC_URI[sha256sum] = "bd07b7e98839e0359842110525a3032fdb8eaf3a90bedde3dd1652d32d15cce5"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-login-fix-close_range-use.patch b/meta/recipes-core/util-linux/util-linux/0001-login-fix-close_range-use.patch
new file mode 100644
index 0000000000..7a47597bd6
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-login-fix-close_range-use.patch
@@ -0,0 +1,62 @@
+From 76ae0badd3fd7c8653fa4d3c78d2dcfcec51d23d Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Wed, 14 Jul 2021 17:25:57 +0200
+Subject: [PATCH] login: fix close_range() use
+
+This new syscall comes with three arguments (see kernel commit
+278a5fbaed89dacd04e9d052f4594ffd0e0585de). Not sure why util-linux
+assume only two.
+
+Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/b8d99a618baffb4fc03cda4c40e29778b6d77ad4]
+Addresses: https://bugzilla.redhat.com/show_bug.cgi?id=1981729
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ include/fileutils.h | 4 ++--
+ lib/fileutils.c     | 2 +-
+ login-utils/login.c | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/include/fileutils.h b/include/fileutils.h
+index ad54b95..f86426b 100644
+--- a/include/fileutils.h
++++ b/include/fileutils.h
+@@ -82,9 +82,9 @@ static inline struct dirent *xreaddir(DIR *dp)
+ # if defined(SYS_close_range)
+ #  include <sys/types.h>
+ #  ifndef HAVE_CLOSE_RANGE
+-static inline int close_range(unsigned int first, unsigned int last)
++static inline int close_range(unsigned int first, unsigned int last, int flags)
+ {
+-	return syscall(SYS_close_range, first, last);
++	return syscall(SYS_close_range, first, last, flags);
+ }
+ #  endif
+ #  define HAVE_CLOSE_RANGE 1
+diff --git a/lib/fileutils.c b/lib/fileutils.c
+index 846b718..a979b03 100644
+--- a/lib/fileutils.c
++++ b/lib/fileutils.c
+@@ -189,7 +189,7 @@ int main(int argc, char *argv[])
+ 		ignore_result( dup(STDIN_FILENO) );
+
+ # ifdef HAVE_CLOSE_RANGE
+-		close_range(STDERR_FILENO + 1, ~0U);
++		close_range(STDERR_FILENO + 1, ~0U, 0);
+ # else
+ 		ul_close_all_fds(STDERR_FILENO + 1, ~0U);
+ # endif
+diff --git a/login-utils/login.c b/login-utils/login.c
+index 7fefd05..94a042d 100644
+--- a/login-utils/login.c
++++ b/login-utils/login.c
+@@ -1358,7 +1358,7 @@ static void initialize(int argc, char **argv, struct login_context *cxt)
+ #endif
+ 	}
+ #ifdef HAVE_CLOSE_RANGE
+-	close_range(STDERR_FILENO + 1, ~0U);
++	close_range(STDERR_FILENO + 1, ~0U, 0);
+ #else
+ 	ul_close_all_fds(STDERR_FILENO + 1, ~0U);
+ #endif
+--
+2.32.0
-- 
2.32.0

