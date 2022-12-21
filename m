Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54313C46467
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 17:56:05 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.25708.1671645359477111026
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 09:55:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U1AHTUZz;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso3149926pjt.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 09:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHLoukGghhOl+eKvsdefEGUPSC+8832vZzZ1iMidWI8=;
        b=U1AHTUZz+ksBqY/TvC8uFc8Qs+D7Fk0THis+SXX5JmC8wilMq7NqXy1UCsKyEOzidw
         O/8PIAefKQvE1MhY/UlvwAVKE9ijKZtzeMZkLiLXdgPmEwi9yVh5+KZ8MPnTimoxbn0T
         AvnvLqmqXhM0moy6OVEXlxHt34OYMcSDb3MrTcyMWytJj8CJVOgwnd/+yAAG/V0siRr1
         N9YREKybA6kq24Wsg0h4XZyWXVC7kSusR75XPKPLL7NJqa6ECHxTiwF6YICt5cvkCjFx
         z3/ZNNaEngRc/K69rIEA72lOwqh2V2xl83SspW51gBWKsqJGhWLg3S84oS71B6l0id65
         5BLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHLoukGghhOl+eKvsdefEGUPSC+8832vZzZ1iMidWI8=;
        b=PQimaZTSczc+axeWDXEzEZmtUkopqSHD3hAiGwvzgQtUafDbP0JWiBTSSkh4RdJMH8
         POHRQstBpOspJGaACpE0027WoRLsE6o1BeOTCF77KjBlIDi9re0Oml95V5Gjt2It3UNS
         +j0npkjmITL0gxF/8DzdtaL6jIsZxJHftSeXQCg6oBYw+vZ2o5VLHTw36LNalPx/8zGa
         aciLKzBwMo8c6LCEwjqJ9jmy1RjYZEkhNBL9peEbL5YBQz6/jRoT+UUlbHxuUexkX5ts
         kbWM7G+GWqAt2z9aDdnQvgulGxxOn3SCXikZs1IKsiT2uIvSeJnSdA70N6IKIL/oVQPM
         rwYg==
X-Gm-Message-State: AFqh2koOSd4Fi1rP3VUZFrbal6CjGEbWUCQHSuRF9LIrVc/VHY9FfN5L
	y947G3v6yevhrTaOdpSYb6dA0ryNlLo=
X-Google-Smtp-Source: AMrXdXtplX9SspQ6G/rZgACrRgPYA3BFXGsGqZ+besMcH1h2u416sl6mLqfxfqiOqh4NKmiegSPhaw==
X-Received: by 2002:a17:90b:3d0b:b0:219:5955:7570 with SMTP id pt11-20020a17090b3d0b00b0021959557570mr2440516pjb.46.1671645358649;
        Wed, 21 Dec 2022 09:55:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id x11-20020a17090a294b00b00225a127b2a2sm1548943pjf.5.2022.12.21.09.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 09:55:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 6/9] lttng-tools: Fix build with largefile support
Date: Wed, 21 Dec 2022 09:55:48 -0800
Message-Id: <20221221175551.1940464-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221175551.1940464-1-raj.khem@gmail.com>
References: <20221221175551.1940464-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 17:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174931

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...pat-Define-off64_t-as-off_t-on-linux.patch | 35 +++++++++++++++++++
 .../lttng/lttng-tools_2.13.8.bb               |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch
new file mode 100644
index 0000000000..e3d421f730
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as-off_t-on-linux.patch
@@ -0,0 +1,35 @@
+From cc3e1abaa1e7ad85c6a299fe30a36e0cb732e1c8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 15 Dec 2022 14:51:20 -0800
+Subject: [PATCH] compat: Define off64_t as off_t on linux
+
+This helps compile with latest musl, where off64_t is not defined
+unless _LARGEFILE64_SOURCE is defined, on glibc _LARGEFILE64_SOURCE is
+defined if _GNU_SOURCE is defined, so the problem is only seen with musl
+
+Upstream-Status: Submitted [https://github.com/lttng/lttng-tools/pull/164]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/common/compat/fcntl.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/common/compat/fcntl.h b/src/common/compat/fcntl.h
+index 5e566e50..d19a6ece 100644
+--- a/src/common/compat/fcntl.h
++++ b/src/common/compat/fcntl.h
+@@ -7,7 +7,6 @@
+ 
+ #ifndef _COMPAT_FCNTL_H
+ #define _COMPAT_FCNTL_H
+-
+ #include <fcntl.h>
+ #include <sys/types.h>
+ 
+@@ -22,6 +21,7 @@ typedef off64_t loff_t;
+ #endif
+ 
+ #ifdef __linux__
++typedef off_t off64_t;
+ extern int compat_sync_file_range(int fd, off64_t offset, off64_t nbytes,
+ 		unsigned int flags);
+ #define lttng_sync_file_range(fd, offset, nbytes, flags) \
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
index a814eb79f9..e64eeba635 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
@@ -37,6 +37,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://lttng-sessiond.service \
            file://determinism.patch \
            file://disable-tests.patch \
+           file://0001-compat-Define-off64_t-as-off_t-on-linux.patch \
            "
 
 SRC_URI[sha256sum] = "b1e959579b260790930b20f3c7aa7cefb8a40e0de80d4a777c2bf78c6b353dc1"
-- 
2.39.0


