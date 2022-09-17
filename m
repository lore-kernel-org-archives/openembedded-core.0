Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A008ECAAD3
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 15:14:10 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.6866.1663427645446679306
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 08:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=futSWmFz;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 207so14592865pgc.7
        for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 08:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=UwoL3Z9R6zBa1CaQ2FCfO4+r8t7LWtqcs5NF2CPw9Sc=;
        b=futSWmFzdQp+/gIRAQJrBQyfkEUHwd9Fd+083BA085ToHQ0Ys8+GB87xR76ovzzXRH
         eNeR5AoE4viT9PF0YTbFpcQ4i3NTEvWeANBnOPpAyxXNRKFuOsHpAyhVA7OdIENt9E+E
         e0Gz+u8Fvo3nGT5KtAxRpFptEsMby3PEWOXDFjHM/NlQM2DYVMx9wDBkElKmd5V3ybnP
         GWyazNcvQZ4w4KjubtjvbLzYrxFjoK4022fbugfW6yTwrDzUGSOHDw6Vp47f/dFyEkv1
         13p+FugGefLFyK9nJBuCi+gFWCeIbbI33xcM1vxuykCKmb7OhiX3eHuyz/a3tocRujF+
         dkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=UwoL3Z9R6zBa1CaQ2FCfO4+r8t7LWtqcs5NF2CPw9Sc=;
        b=YUEspELtoiZp1Rr0BQ4aDikSFOnL8pi1Tlx2sk9OQfnoXzecX7pay/veNRv+7mDOct
         GxEE0Q92ZEA2L/+WPc722ukQWD8vvv+guvYO9E7/d+IThxxlWR/u24aKzVy0wumwTztr
         PBJxUNld5UUOsmd+K2777qFd4SksnFz6qSTDNSPJd8rNZokm47cyOww9PfTMuZgpBkAa
         vqdBgAKuiVAHH+RUayPzTv06LpVLFzmKMGyXyOKq7xwQacxCKkmU9iqzT8h63BUdKKmt
         o0IbIQ40dXC2weduhhFABVUWf7CxHfAs4JIhtkiuQLpNgFFN4JckiMNwxjavBYYsdaPF
         Tekw==
X-Gm-Message-State: ACrzQf2kFcG+/2vzlSpgsTDEoMY6RggKFb9htZONC2GjIgP2NsA2eW1P
	QyqWtErNWgD5POAbZisfgrzUrqEqxrYCvA==
X-Google-Smtp-Source: 
 AMsMyM70+UwhWOe3EnkMP6UBWGJRtUGsSs1ElJ1+7JzIXa3nGMMdxP+dzT3fyU+mrYeP2PKSY9PkMw==
X-Received: by 2002:a63:20e:0:b0:438:fa57:aa0c with SMTP id
 14-20020a63020e000000b00438fa57aa0cmr8902954pgc.186.1663427644575;
        Sat, 17 Sep 2022 08:14:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7ab3])
        by smtp.gmail.com with ESMTPSA id
 az6-20020a17090b028600b001f3162e4e55sm3335851pjb.35.2022.09.17.08.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Sep 2022 08:14:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] apt: Fix type mismatches and ptest builds
Date: Sat, 17 Sep 2022 08:14:02 -0700
Message-Id: <20220917151402.3493271-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Sep 2022 15:14:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170838

These issues are found with clang15

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...me_t-and-suseconds_t-from-std-chrono.patch | 64 +++++++++++++++++++
 ...tive-helper-Undefine-_FORTIFY_SOURCE.patch | 27 ++++++++
 meta/recipes-devtools/apt/apt_2.4.5.bb        |  2 +
 3 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-typecast-time_t-and-suseconds_t-from-std-chrono.patch
 create mode 100644 meta/recipes-devtools/apt/apt/0002-interactive-helper-Undefine-_FORTIFY_SOURCE.patch

diff --git a/meta/recipes-devtools/apt/apt/0001-typecast-time_t-and-suseconds_t-from-std-chrono.patch b/meta/recipes-devtools/apt/apt/0001-typecast-time_t-and-suseconds_t-from-std-chrono.patch
new file mode 100644
index 0000000000..fc3509d336
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-typecast-time_t-and-suseconds_t-from-std-chrono.patch
@@ -0,0 +1,64 @@
+From b7a1a4d3259557f2587f7d5d47502691d94c21c2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Sep 2022 20:00:30 -0700
+Subject: [PATCH 1/2] typecast time_t and suseconds_t from std::chrono
+
+This fixes build on some architectures like mips
+progress.cc:125:31: error: non-constant-expression cannot be narrowed from type 'std::chrono::duration<long long>::rep' (aka 'long long') to '__time_t' (aka 'long') in initializer list [-Wc++11-narrowing]
+   struct timeval NowTime = { Now_sec.count(), Now_usec.count() };
+
+Upstream-Status: Submitted [https://salsa.debian.org/apt-team/apt/-/merge_requests/259]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ apt-pkg/acquire.cc           | 4 ++--
+ apt-pkg/contrib/progress.cc  | 2 +-
+ ftparchive/apt-ftparchive.cc | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/apt-pkg/acquire.cc b/apt-pkg/acquire.cc
+index 100ccde..dd0624a 100644
+--- a/apt-pkg/acquire.cc
++++ b/apt-pkg/acquire.cc
+@@ -53,11 +53,11 @@
+ using namespace std;
+ 
+ // helper to convert time_point to a timeval
+-static struct timeval SteadyDurationToTimeVal(std::chrono::steady_clock::duration Time)
++constexpr struct timeval SteadyDurationToTimeVal(std::chrono::steady_clock::duration Time)
+ {
+    auto const Time_sec = std::chrono::duration_cast<std::chrono::seconds>(Time);
+    auto const Time_usec = std::chrono::duration_cast<std::chrono::microseconds>(Time - Time_sec);
+-   return {Time_sec.count(), Time_usec.count()};
++   return timeval{static_cast<time_t>(Time_sec.count()), static_cast<suseconds_t>(Time_usec.count())};
+ }
+ 
+ std::string pkgAcquire::URIEncode(std::string const &part)		/*{{{*/
+diff --git a/apt-pkg/contrib/progress.cc b/apt-pkg/contrib/progress.cc
+index 03f88d4..eb688b9 100644
+--- a/apt-pkg/contrib/progress.cc
++++ b/apt-pkg/contrib/progress.cc
+@@ -122,7 +122,7 @@ bool OpProgress::CheckChange(float Interval)
+    auto const Now = std::chrono::steady_clock::now().time_since_epoch();
+    auto const Now_sec = std::chrono::duration_cast<std::chrono::seconds>(Now);
+    auto const Now_usec = std::chrono::duration_cast<std::chrono::microseconds>(Now - Now_sec);
+-   struct timeval NowTime = { Now_sec.count(), Now_usec.count() };
++   struct timeval NowTime = { static_cast<time_t>(Now_sec.count()), static_cast<suseconds_t>(Now_usec.count()) };
+ 
+    std::chrono::duration<decltype(Interval)> Delta =
+       std::chrono::seconds(NowTime.tv_sec - LastTime.tv_sec) +
+diff --git a/ftparchive/apt-ftparchive.cc b/ftparchive/apt-ftparchive.cc
+index 56fdc22..0a253b1 100644
+--- a/ftparchive/apt-ftparchive.cc
++++ b/ftparchive/apt-ftparchive.cc
+@@ -58,7 +58,7 @@ static struct timeval GetTimevalFromSteadyClock()			/*{{{*/
+    auto const Time = std::chrono::steady_clock::now().time_since_epoch();
+    auto const Time_sec = std::chrono::duration_cast<std::chrono::seconds>(Time);
+    auto const Time_usec = std::chrono::duration_cast<std::chrono::microseconds>(Time - Time_sec);
+-   return { Time_sec.count(), Time_usec.count() };
++   return { static_cast<time_t>(Time_sec.count()), static_cast<suseconds_t>(Time_usec.count()) };
+ }
+ 									/*}}}*/
+ static auto GetTimeDeltaSince(struct timeval StartTime)			/*{{{*/
+-- 
+2.37.3
+
diff --git a/meta/recipes-devtools/apt/apt/0002-interactive-helper-Undefine-_FORTIFY_SOURCE.patch b/meta/recipes-devtools/apt/apt/0002-interactive-helper-Undefine-_FORTIFY_SOURCE.patch
new file mode 100644
index 0000000000..18c4641b22
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0002-interactive-helper-Undefine-_FORTIFY_SOURCE.patch
@@ -0,0 +1,27 @@
+From 891076c2cf4298b5d587545497f4831f0d21caa1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Sep 2022 20:04:43 -0700
+Subject: [PATCH 2/2] interactive-helper: Undefine _FORTIFY_SOURCE
+
+This ensures that it compiles when clang compiler is passing
+-DFORTIFY_SOURCES=2
+
+Upstream-Status: Submitted [https://salsa.debian.org/apt-team/apt/-/merge_requests/259]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/interactive-helper/libnoprofile.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/test/interactive-helper/libnoprofile.c b/test/interactive-helper/libnoprofile.c
+index f11b898..b26ec2a 100644
+--- a/test/interactive-helper/libnoprofile.c
++++ b/test/interactive-helper/libnoprofile.c
+@@ -1,4 +1,5 @@
+ #define _GNU_SOURCE
++#undef _FORTIFY_SOURCE
+ #include <stdarg.h>
+ #include <stdlib.h>
+ #include <string.h>
+-- 
+2.37.3
+
diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb b/meta/recipes-devtools/apt/apt_2.4.5.bb
index 564bdeec41..4b9f804039 100644
--- a/meta/recipes-devtools/apt/apt_2.4.5.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
@@ -14,6 +14,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch \
            file://0001-aptwebserver.cc-Include-array.patch \
            file://0001-Remove-using-std-binary_function.patch \
+           file://0001-typecast-time_t-and-suseconds_t-from-std-chrono.patch \
+           file://0002-interactive-helper-Undefine-_FORTIFY_SOURCE.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.37.3


