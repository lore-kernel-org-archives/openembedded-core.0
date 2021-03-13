Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web08.2560.1615661542313013164
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:52:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DxDFMM0B;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id v192so22840769oia.5
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=teUFtaxCJbUVeSuZZZM8h2VnH353KdvM8YYcvfq246U=;
        b=DxDFMM0BOuSSA4vTddfEeYpg5x25tRVTS9lxnTsJDFqjcbjAq6jtX2AHUoYRQN6Wiq
         GVSFe8tn1wlX55w+9yn8a5nzjo5O4csyv2fQJ15dysF/PRrVFDhP3fE/WLOEBMARuboo
         BeG2aauO8y1Lr8JKIoWsMEWuWbp3nVWDrLUBEv3zLx+UKr37viLZD0JbEBnrz3OwLnyl
         D/pDG7MTqul7RbBOnqtPrlzNdz2qU08V478s/Jt86wOIpD/WI77rQprnZNizKgeHuenW
         ZNKp9a8xVziRQ6ASUxLS3qkMSawocN5LnOwWoeEfxHmYFwu7grrmBHInn/OJXBaRI04e
         eUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=teUFtaxCJbUVeSuZZZM8h2VnH353KdvM8YYcvfq246U=;
        b=rnrhohwd3jiDbLnvudY4zgPQ78zxtTXjxeD26cOGxOfg6XBcykr88LPTFOfSruP3wY
         WKbmPsHjNYZR+Wnz0bwyGHmmuQB6iDpn+HIJOPRY3XqNVbGLhkL3HkppaJFUV3gGfsa+
         00QBcadJaPelScg91+YR3anzf8cZ66ZuqB7RLQAvEv0D0vWp8xsK5zRFV2RmF9n1vEof
         VHW0dueAbRBP9T9lXwJsyiNIfv/wZOAvw4aqu4tkyKRD/DA5Cm43THcy+p8MF6LJVjX5
         S0b/DR+yAxHYh1fBs7fno8/wjV4/dMPXIQweeXN7j1TvdcAtX8DgDfywIdtdBxzGFj/l
         Y6Kw==
X-Gm-Message-State: AOAM532+brZt3XHvP3jmyQBfeHNmW+ZAj9xX8sILYlod/nP5BnTG2F+L
	F4SZhLkc/eM69bwVf+/qlHrtqdTUmh8B7vE4
X-Google-Smtp-Source: ABdhPJzdux+GyVczJrpn4MWFnNYB79yoFgoJrFu3Pldi1AyMr49BrGSMP9+kPDoupySGyOJqBtJBHQ==
X-Received: by 2002:aca:d90a:: with SMTP id q10mr435349oig.63.1615661541125;
        Sat, 13 Mar 2021 10:52:21 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.52.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:52:20 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 30/38] rxvt-unicode: Do not use throw specifications
Date: Sat, 13 Mar 2021 08:49:19 -1000
Message-Id: <5cdb675b4219e33eb9f8a5b3be1a6c9efe2099fc.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Fixes build with -std=c++17

| ../../rxvt-unicode-9.22/src/../libev/ev++.h:379:46: error: ISO C++17 does not allow dynamic exception specifications
|   379 |     default_loop (unsigned int flags = AUTO) throw (bad_loop)
|       |                                              ^~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f437b226aac498240bc1e3a02eb0257a7deeedea)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1

