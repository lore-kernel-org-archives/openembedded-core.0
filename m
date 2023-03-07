Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E136EC678D5
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 22:48:55 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.8617.1678229299776983764
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 14:48:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vpkCSKLd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id y10so9089782pfi.8
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 14:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678229334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pfBPE8YuWr4rqVgNiMq6+BVek+6vBM0UelkUp5HypZU=;
        b=vpkCSKLdJbxj35XfWwkEsJU20MIegt7Xm7tIAonbz6xBCjuoTNWbVojSQpdjx8t8qx
         pihJi8UHAb8MWgr/XCxMq1Fahqxfp0yel9X5QNk9izOMOU86U+mnOf4AhikWnR7mfeq6
         oCwDpARP8Fdax9uueEYf1ajy7KTsN31DlZVU3MXz0+r4r9zlAPDjyUQTDzfEVT2J9l95
         XM3Z/Y02EIg1MrGm1cGmLJZMStJAtrMIQU0Xd0MwRhlRkm88mSL8JKIGk8rz0vcU0As3
         AAo5M08FkHapWnFQh08Urkm3cgKECe5wVRMFfHH2x6sBOjuo4N80NWOuhLdUyoVxhpy0
         4T+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678229334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfBPE8YuWr4rqVgNiMq6+BVek+6vBM0UelkUp5HypZU=;
        b=PYs11pB9sdNLe3ltQyy9ECH0oKrVq1NQH5aWfpKfMqBVEhc7uaW8LPClBGOhMTPYiw
         ovL+xHwOApXVrKvASG8KIJtCGE/Wu5WNiXumJ3WuGIx3ECMUk8aYpGOqYufYc7EWi28u
         Q5zyfgfD/f5Ba5LVbxozLOxwEJkeAUYcUdJJlMWvefbIbnjXSpbUCDp+aKZERYPu8z88
         jS8oq7AR086e5m0iYZPvmHivHScHlhcJlz8bfhcs5kW+gUB+VqLNR0fb0XsMl/VgVt27
         xjmahfYRCaKGla/BafJ2vblJK1eZVguzzXnwJb/FoIklqPLR+CbrTwcp4iX5WfiwXn5y
         Q6Gg==
X-Gm-Message-State: AO0yUKUFLwKftte3KwIcufa+5r92Mw3uVTNIvE0ELoJ6l55yryuiCY9N
	jzIWDyFeuweam4z2eeD+XYacbM/QbKB5XaYXL6E=
X-Google-Smtp-Source: AK7set9DJVxt9tu83Q6wQevwTs9yXgtpcmX+o/C/TpCAVxhxF/Y3Mq+E3Hjbj9OqUUyV08Ueuw/CGQ==
X-Received: by 2002:a62:1dd4:0:b0:5aa:6125:dbf4 with SMTP id d203-20020a621dd4000000b005aa6125dbf4mr17150534pfd.11.1678229333828;
        Tue, 07 Mar 2023 14:48:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k1-20020aa78201000000b005cdbd9c8825sm8388958pfi.195.2023.03.07.14.48.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:48:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/23] gcc: Fix inconsistent noexcept specifier for valarray in libstdc++
Date: Tue,  7 Mar 2023 12:47:54 -1000
Message-Id: <9779b66162a014f26594bdde43afdc4332617240.1678228988.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678228988.git.steve@sakoman.com>
References: <cover.1678228988.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178142

From: Virendra Thakur <virendrak@kpit.com>

Backport of gcc upstream commit 2b2d97fc545635a0f6aa9c9ee3b017394bc494bf
to gcc release 9.5.0. This fix is available to all release-branches
except releases/gcc-9 because upstream do not support gcc-9 now.

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-9.5.inc         |  1 +
 ...nsistent-noexcept-specific-for-valar.patch | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.5/0002-libstdc-Fix-inconsistent-noexcept-specific-for-valar.patch

diff --git a/meta/recipes-devtools/gcc/gcc-9.5.inc b/meta/recipes-devtools/gcc/gcc-9.5.inc
index 6a0a892b10..ec28246bf3 100644
--- a/meta/recipes-devtools/gcc/gcc-9.5.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.5.inc
@@ -69,6 +69,7 @@ SRC_URI = "\
            file://0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch \
            file://0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
            file://0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch \
+           file://0002-libstdc-Fix-inconsistent-noexcept-specific-for-valar.patch \
 "
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 SRC_URI[sha256sum] = "27769f64ef1d4cd5e2be8682c0c93f9887983e6cfd1a927ce5a0a2915a95cf8f"
diff --git a/meta/recipes-devtools/gcc/gcc-9.5/0002-libstdc-Fix-inconsistent-noexcept-specific-for-valar.patch b/meta/recipes-devtools/gcc/gcc-9.5/0002-libstdc-Fix-inconsistent-noexcept-specific-for-valar.patch
new file mode 100644
index 0000000000..506064bfc2
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-9.5/0002-libstdc-Fix-inconsistent-noexcept-specific-for-valar.patch
@@ -0,0 +1,44 @@
+From 60d966708d7cf105dccf128d2b7a38b0b2580a1a Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Fri, 5 Nov 2021 21:42:20 +0000
+Subject: [PATCH] libstdc++: Fix inconsistent noexcept-specific for valarray
+ begin/end
+
+These declarations should be noexcept after I added it to the
+definitions in <valarray>.
+
+libstdc++-v3/ChangeLog:
+
+	* include/bits/range_access.h (begin(valarray), end(valarray)):
+	Add noexcept.
+
+(cherry picked from commit 2b2d97fc545635a0f6aa9c9ee3b017394bc494bf)
+
+Upstream-Status: Backport [https://github.com/hkaelber/gcc/commit/2b2d97fc545635a0f6aa9c9ee3b017394bc494bf]
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+
+---
+ libstdc++-v3/include/bits/range_access.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libstdc++-v3/include/bits/range_access.h b/libstdc++-v3/include/bits/range_access.h
+index 3d99ea92027..4736e75fda1 100644
+--- a/libstdc++-v3/include/bits/range_access.h
++++ b/libstdc++-v3/include/bits/range_access.h
+@@ -101,10 +101,10 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
+ 
+   template<typename _Tp> class valarray;
+   // These overloads must be declared for cbegin and cend to use them.
+-  template<typename _Tp> _Tp* begin(valarray<_Tp>&);
+-  template<typename _Tp> const _Tp* begin(const valarray<_Tp>&);
+-  template<typename _Tp> _Tp* end(valarray<_Tp>&);
+-  template<typename _Tp> const _Tp* end(const valarray<_Tp>&);
++  template<typename _Tp> _Tp* begin(valarray<_Tp>&) noexcept;
++  template<typename _Tp> const _Tp* begin(const valarray<_Tp>&) noexcept;
++  template<typename _Tp> _Tp* end(valarray<_Tp>&) noexcept;
++  template<typename _Tp> const _Tp* end(const valarray<_Tp>&) noexcept;
+ 
+   /**
+    *  @brief  Return an iterator pointing to the first element of
+-- 
+2.25.1
\ No newline at end of file
-- 
2.34.1


