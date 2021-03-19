Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.3574.1616143519097291269
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 01:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LXivXx/a;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id va9so8355752ejb.12
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 01:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oG5rtOG9yYW44oGJ5R00oTb85uLvt9MUM1jLWjJuI2Y=;
        b=LXivXx/a6lV3qmRXN23L/O1goy0KMq0EWS2Q9uCNE86rOtEr2lpKAf/dWJHhLF7Jtv
         7HZ+hIbMOZ/bfGkxXVVDj2+mMfy5s/pR7+acHPzNmRDApvM2AntmE60HaxF0g+s7re3K
         MLytu6i2J6jyN88KB+uckvLJdVMciRhROyQmAujUZLHDLSqi+7hw9WCXD45Zd7AYhfQ4
         ccL8bLzpn2MQBo/6TAkV/JM/Ek8SYxDYKbNz7pHz4B2NG4A04ZtlE6zxhiBbbfHVdwai
         7GCJzJCC0zazBjPr7NVpT7G3fINHIWOkABy+bmURASkazHpWfUs6rSKG9nOYJuW8NJR5
         NMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oG5rtOG9yYW44oGJ5R00oTb85uLvt9MUM1jLWjJuI2Y=;
        b=fCeWGjywIVvqkAa8K3tk1NVvF1kS4wsv7jckDWPtAXbuq9s7x7BkPRkzWC5eFebhN/
         cLGezmkMwLi1PO1cg+PLnnPvTzncf8nbjtffvxf3o62YbHrmxJMJbOWjjriiK7itp/59
         ibbfsiRQ91o7MdQCOImpHHkxU793xMyCoskEffkh/1BEhkODnYgZYzu9oGTERMBNgHkh
         IeVUzaSbiQ0an9ToIl1001QoZczrnF3W4abQ/P31+yqKGd3Jn3a8QNyYj52Q+fCAbzcS
         lnjKft5GmLCxslHAzmEmhAzmRP03W1tz3PUl5vEaYsgNTlQF9n27h0tPn6taBeRUmEBw
         OJdw==
X-Gm-Message-State: AOAM530l7hxS/tQ4j97bSpa9UJT4/IrFIPsC4QkK7PSlyy3VMp+/Gi2t
	/PPFQ7gbA4bl4tCwtNAh7ZUgO4SPW66GBg==
X-Google-Smtp-Source: ABdhPJxfojsjoDE8qjbRvemrxhEy4huwqfpKQGGNI9doO6npIae1RwmoyrhWj3P8uz3s/DFxhyPIlg==
X-Received: by 2002:a17:906:38da:: with SMTP id r26mr3133113ejd.251.1616143517635;
        Fri, 19 Mar 2021 01:45:17 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id nd36sm3262248ejc.21.2021.03.19.01.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 01:45:17 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/16] libxcrypt: fix sporadic failures in nativesdk-libxcrypt-compat
Date: Fri, 19 Mar 2021 09:44:01 +0100
Message-Id: <20210319084401.576728-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319084401.576728-1-alex.kanavin@gmail.com>
References: <20210319084401.576728-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...e.ac-do-not-use-compute-symver-floor.patch | 32 +++++++++++++++++++
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/libxcrypt/files/0001-configure.ac-do-not-use-compute-symver-floor.patch

diff --git a/meta/recipes-core/libxcrypt/files/0001-configure.ac-do-not-use-compute-symver-floor.patch b/meta/recipes-core/libxcrypt/files/0001-configure.ac-do-not-use-compute-symver-floor.patch
new file mode 100644
index 0000000000..4e6b427104
--- /dev/null
+++ b/meta/recipes-core/libxcrypt/files/0001-configure.ac-do-not-use-compute-symver-floor.patch
@@ -0,0 +1,32 @@
+From b28bb856ccebe8fded51d11362bf5920699eed59 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 18 Mar 2021 10:52:13 +0000
+Subject: [PATCH] configure.ac: do not use compute-symver-floor
+
+This script (newly introduced in 4.4.18) sporadically fails, without
+failing configure(), which has been reported at
+https://github.com/besser82/libxcrypt/issues/123
+
+Upstream-Status: Inappropriate
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 45b91b4..f3ba945 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -426,11 +426,7 @@ if test x$enable_shared != xyes; then enable_obsolete_api=0; fi
+ # need to be binary backward compatible with.
+ if test $enable_obsolete_api = 1; then
+   AC_MSG_CHECKING([minimum symbol version to use for compatibility symbols])
+-  SYMVER_FLOOR=$(
+-    $PERL ${srcdir}/build-aux/compute-symver-floor \
+-      ${srcdir}/lib/libcrypt.minver $host_os $host_cpu \
+-    2>&AS_MESSAGE_LOG_FD
+-  )
++  SYMVER_FLOOR=GLIBC_2.0
+   AC_MSG_RESULT([$SYMVER_FLOOR])
+   case "$SYMVER_FLOOR" in
+     ERROR)
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index e9f968b556..b5ca863d54 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=bd5d9777dfe7076c4f2928f12fed226a \
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
+SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH} \
+           file://0001-configure.ac-do-not-use-compute-symver-floor.patch \
+           "
 SRCREV = "94d84f92ca123d851586016c4678eb1f21c19029"
 SRCBRANCH ?= "develop"
 
-- 
2.29.2

