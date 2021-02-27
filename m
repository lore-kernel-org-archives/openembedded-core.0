Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web09.1544.1614411695947447476
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 23:41:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G3a8OBV/;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id o188so1153238pfg.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 23:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NBQ9rJ6i0IhSm1cHqRlUTG6Lhh0nHkDgI9IhgXsAWdk=;
        b=G3a8OBV/jHsm3k0i/xMDbOTKNCRxqfNsfmIoc8D9B0Gkvpkf+0pZQTvnYj1RuRqhdL
         zTbapUJAq9lcsVMndyFRNXr0LVxRdNBU3VfyFEHm16flxuWkfE8ZCQwdELD/k27y2nf9
         0uleOYwvUbtvB+t5wzw1Axl8UXPZRXh0knmEK3Wy40JoqwkR2zGPo5URAmbUROKoJ8KW
         4Zf88TGtFr/cON5YFbxVxNsiuaC5rjGPRQIeZvITjBKYxDnXVyLBMPGF3dXbtpmJYJ8K
         eWb92tjNhl1T2j/mCW+qq0kT1NvlK46vgGKkMd6xDRwoFAFTrHj5OwFOg62f+ihJjctO
         d2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NBQ9rJ6i0IhSm1cHqRlUTG6Lhh0nHkDgI9IhgXsAWdk=;
        b=C+yv/P28DXYAAnLnOx7BiDBSfIsoTIujz9w9l/S7xdp9PPxH81tTlv4W9JRSo9rHGF
         oUo7H9/qgCruEnmz0W6uEwl557QMu7mSZ1vIU7Eb0wucbGcREgkttHjNvuM7ObtixiBe
         p2y/cStUy0k51A1LSrx+ed/qE0kT0miqor3LpGn7AwZfVBexwREhIh8pdXbmuJnFpqTy
         GX55PHFoEJqFyoPXd2wscMyGWnjOd9n4loSLZJ54vQsdECybLF1yrSOEnyw3Uqv6DIc3
         uqTKVgjBRihWkRZfKDCGylJdlFco12BqzxwXoCOl7MNcOgNmz/62dbgI4MQF1pfwK30i
         eFXA==
X-Gm-Message-State: AOAM533EOPA6BT4OuJL4LGcoDL4sCDs14H9baTUPNYEfBTPH9SLuGjxc
	Bna9HGStoN1k2yXaqU4Rk6lXi8QFMYG/eQ==
X-Google-Smtp-Source: ABdhPJx1IIWT7hOHIokWmJgGHEn1wgsT3sy4P55egQ58GmAf7RBycjqrP1+ofAzqKh4kRSeX1Q+eeQ==
X-Received: by 2002:a62:68c1:0:b029:1ee:5dfa:860b with SMTP id d184-20020a6268c10000b02901ee5dfa860bmr1168178pfc.35.1614411695073;
        Fri, 26 Feb 2021 23:41:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id z137sm12462003pfc.172.2021.02.26.23.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 23:41:34 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/4] rxvt-unicode: Do not use throw specifications
Date: Fri, 26 Feb 2021 23:41:29 -0800
Message-Id: <20210227074132.4029374-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes build with -std=c++17

| ../../rxvt-unicode-9.22/src/../libev/ev++.h:379:46: error: ISO C++17 does not allow dynamic exception specifications
|   379 |     default_loop (unsigned int flags = AUTO) throw (bad_loop)
|       |                                              ^~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...emove-deprecated-throw-specification.patch | 30 +++++++++++++++++++
 .../rxvt-unicode/rxvt-unicode_9.22.bb         |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-libev-remove-deprecated-throw-specification.patch

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-libev-remove-deprecated-throw-specification.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-libev-remove-deprecated-throw-specification.patch
new file mode 100644
index 0000000000..f10dca09d6
--- /dev/null
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-libev-remove-deprecated-throw-specification.patch
@@ -0,0 +1,30 @@
+From 9a8f1d73e7b7e183768a8379ef32429a84f0e5c2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 26 Feb 2021 18:11:56 -0800
+Subject: [PATCH] libev: remove deprecated throw specification
+
+removes the throw specifications that are deprecated since C++11:
+warning: dynamic exception specifications are deprecated in C++11 [-Wdeprecated]
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libev/ev++.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libev/ev++.h b/libev/ev++.h
+index 4f0a36a..85ddf44 100644
+--- a/libev/ev++.h
++++ b/libev/ev++.h
+@@ -376,7 +376,7 @@ namespace ev {
+ 
+   struct default_loop : loop_ref
+   {
+-    default_loop (unsigned int flags = AUTO) throw (bad_loop)
++    default_loop (unsigned int flags = AUTO)
+ #if EV_MULTIPLICITY
+     : loop_ref (ev_default_loop (flags))
+ #endif
+-- 
+2.30.1
+
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.22.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.22.bb
index bfa8a614df..283e8d7751 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.22.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.22.bb
@@ -4,5 +4,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://src/main.C;beginline=1;endline=31;md5=d3600d7ee1062667fcd1193fbe6485f6"
 
-SRC_URI[md5sum] = "93782dec27494eb079467dacf6e48185"
+SRC_URI += "file://0001-libev-remove-deprecated-throw-specification.patch"
+
 SRC_URI[sha256sum] = "e94628e9bcfa0adb1115d83649f898d6edb4baced44f5d5b769c2eeb8b95addd"
+
-- 
2.30.1

