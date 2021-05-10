Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web08.32548.1620657082426907504
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CKauCnk0;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.173, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f173.google.com with SMTP id k25so15972917oic.4
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=l6iq7Iwpo7UOvTmhfiv5FJsPzdzAmTvDZTWViAg53c4=;
        b=CKauCnk00aoiN8fQy0a9miraxYbKto4cu5imfsxfokyWi7rhQiEOd8ciZxuiSXDDbi
         5dJyI+dKnf7bdR/4k2c80Qx9o974YP3h1flrkQwDhyqLWEHqlOr7C4v/G6d6AAkiFWO0
         jqT7GE+gczi43wxHdkDAkfvih4AJcgM+67jAEMzdSQ3SIujS5sFA31YIZ0yzjai+CbXe
         A+4Te6Cg6eSjhJFuebuTyi9yvZnf2EqS4UbO4pSF9PbzdRFI0nYsF3gXRw23Ie+rkYwb
         LYtjjQlgc+RT5pkwFxzRpaqSlL658qedCQduq1tNc6SVRj4ZzdVx5xnqzjE77DLPdtS6
         K9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l6iq7Iwpo7UOvTmhfiv5FJsPzdzAmTvDZTWViAg53c4=;
        b=T3O7+GV3ZY905nxX34THtlQLB2dkuGctZvhc5gyRVN0It9yHoUAbuSW2aaNoYwx5XJ
         ohRuPn9fRovC1/Zh8SBCpB75Yzy5aoFW9SKIWvnQaHwlpZs+o/VHvzv5zsSEokkM27BM
         0IqirFoMV089JWwOSZ2D1fc7jm0D3PqaX0aYW3BGXuNreK0xeeVe7HY3JLoGkIJ8GBhL
         wLL72H+1VqelJAMHBc1A0ip8lbAEm+xQHyYWLM0FLa/dfqBmjwqKpSO1qyARBgVc/z01
         dpua32n7EjMih1ogLJ171Q2mEE0uwfkZLwjt5tcSE1PBcS5QQvKOuJjk+Lx6otrg2Ok6
         Zl6w==
X-Gm-Message-State: AOAM533DG80bLBisIb0UePtpQG6Xi75CmbRGzx5g69tg0kcKWW3zzZPL
	Vsd+ttJgE8uPXQuCdPAvgjUQXBIfmq+Z34LvU8E=
X-Google-Smtp-Source: ABdhPJyjm6qMFP7b3kJ2yEW8ii1p/oi99Mk0YmvPmTrLZNJ+r+/MyZ/UkbuPD8BicZOBOeZEZqfAmQ==
X-Received: by 2002:aca:280a:: with SMTP id 10mr9397143oix.13.1620657081205;
        Mon, 10 May 2021 07:31:21 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g16sm2661309oof.43.2021.05.10.07.31.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:31:20 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/25] libevent: Increase ptest timing tolerance 50 ms -> 100 ms
Date: Mon, 10 May 2021 04:29:01 -1000
Message-Id: <3c59989b7a09f412704f90480c3726a0cb7df746.1620656333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620656333.git.steve@sakoman.com>
References: <cover.1620656333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yi Fan Yu <yifan.yu@windriver.com>

Adjusting the tolerance to a more reasonable time
given the load on the AB and given the high amount(100) of
events some of the tests like `common_timeout` generates.

[YOCTO #14163]

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 38b36d2b90d570149e63816e68f457aea28a5092)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ncrease-default-timeval-tolerance-50.patch | 33 +++++++++++++++++++
 .../libevent/libevent_2.1.11.bb               |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/libevent/libevent/0002-test-regress.h-Increase-default-timeval-tolerance-50.patch

diff --git a/meta/recipes-support/libevent/libevent/0002-test-regress.h-Increase-default-timeval-tolerance-50.patch b/meta/recipes-support/libevent/libevent/0002-test-regress.h-Increase-default-timeval-tolerance-50.patch
new file mode 100644
index 0000000000..0b20eda3c0
--- /dev/null
+++ b/meta/recipes-support/libevent/libevent/0002-test-regress.h-Increase-default-timeval-tolerance-50.patch
@@ -0,0 +1,33 @@
+From dff8fd27edb23bc1486809186c6a4fe1f75f2179 Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Thu, 22 Apr 2021 22:35:59 -0400
+Subject: [PATCH] test/regress.h: Increase default timeval tolerance 50 ms ->
+ 100 ms
+
+The default timeout tolerance is 50 ms,
+which causes intermittent failure in many the
+related tests in arm64 QEMU.
+
+See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14163
+(The root cause seems to be a heavy load)
+
+Upstream-Status: Submitted [https://github.com/libevent/libevent/pull/1157]
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ test/regress.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/regress.h b/test/regress.h
+index f06a7669..829af4a7 100644
+--- a/test/regress.h
++++ b/test/regress.h
+@@ -127,7 +127,7 @@ int test_ai_eq_(const struct evutil_addrinfo *ai, const char *sockaddr_port,
+ 	tt_int_op(labs(timeval_msec_diff((tv1), (tv2)) - diff), <=, tolerance)
+ 
+ #define test_timeval_diff_eq(tv1, tv2, diff)				\
+-	test_timeval_diff_leq((tv1), (tv2), (diff), 50)
++	test_timeval_diff_leq((tv1), (tv2), (diff), 100)
+ 
+ long timeval_msec_diff(const struct timeval *start, const struct timeval *end);
+
diff --git a/meta/recipes-support/libevent/libevent_2.1.11.bb b/meta/recipes-support/libevent/libevent_2.1.11.bb
index 84e8fe183e..75f9979c5b 100644
--- a/meta/recipes-support/libevent/libevent_2.1.11.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.11.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://github.com/libevent/libevent/releases/download/release-${PV}-
            file://Makefile-missing-test-dir.patch \
            file://run-ptest \
            file://0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch \
+           file://0002-test-regress.h-Increase-default-timeval-tolerance-50.patch \
            "
 
 SRC_URI[md5sum] = "7f35cfe69b82d879111ec0d7b7b1c531"
-- 
2.25.1

