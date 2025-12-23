Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4B9E6FE34
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:22:46 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.108970.1766524965896879884
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:22:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tibFwvSY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0d0788adaso48435195ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766524965; x=1767129765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RirXUGP2wmWRUOouuDLB7virsPw9hdE6IZtMljt/Nno=;
        b=tibFwvSYOLQhCI7ibzlv2vUyMnvMYQwr8kZnJGhkIyda9vLe9x29ZG6sTihGYQNHye
         D9Ih4+EEgSJ39+B0AZkIh5qiKr0AfZD5JZiUcKnGwy64WBII1g07fXZqE0O3RSK/2RLp
         magwRJDKWySM4/pFtO5k70zHQnUOeLmK1PaOxdoA9/zMngOX43DUdpc7O3czoPVomT4w
         9QCQTjM4DxQSqb01w00WiykMN3Wq0tBd3mdWBb/3sU+VIX4Y6zXycjc3wLYL6cjO+ygb
         rqq89GyUzfwt6TrB6tMAVhNnibaPsG3mxm7QlqiIxgtczXHLF4jyecPt52MaBhK3FBd9
         Sxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766524965; x=1767129765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RirXUGP2wmWRUOouuDLB7virsPw9hdE6IZtMljt/Nno=;
        b=WQkjYTSr1Dr+sJ7nqAt8Ky8mT/Q4ffwfazG4Ou9IOIszdB1w0RhhvCAA2fyCO0UXMM
         zTujkHUXvm/oJ8FuEDizabZTwLjzyiYanlaVuXtOVk1e/813B/gOQuxMKVps1sq8KUfW
         2ySxZQo7lrZulk5FD6L3Cro/2KI67+IO5XqwuaG9Sx2SY45BItmR63ktOmwzV1xFVhAS
         1M6Q2Y/J7xuzB7WZbdpGm0U7lbCJzVIi2XkeKLGhv4y3E6KS85gR2QqUPSOZ+EqpD+fB
         APpoQvNN6SbChju+IHsvTky4TcTMkzmgv7BDZStxdRScW1LhtnlOPnSML5jWjeLV0uWZ
         Kw+w==
X-Gm-Message-State: AOJu0Yz5u9fvkTn0Co3JDW6xvPh+6PKTSZbK4iJfShds63+cM05ZQTxe
	7NvZdE8buXOftu+IawOEJcZQRYUFQRG9vf+fWnmC+4Ay2B0oktwyAI3WanrDiOOEtMliueHu5cg
	O3gVV
X-Gm-Gg: AY/fxX65tq3imCmYyxUPTkYCqK7TFvxH2f1f7zVZmujYM/gE459+P/j3UuFYEHHIkny
	De9db+SqiefiYUgFP+4LwIzgpzydo0D8or0Zr7pBUtSroo5XlKu/fhErGCjmbqBCgNyzWTII4q0
	aTrJSNllSnZgsRJaONbb/Q01MthqYb6Frk30o6s83Pi1KZt6x87ispQmQaSaRV/4ukKJbimunL9
	tNQ0v9K3oYsa+F/YpgwBCkqAUvX7ejV21jSqHN+/lLsxKsLSy2ADcDr9E2MyrF7wrH2GJKPS+fb
	w4gVyc7v8SIiQ2uDgNzWVjYilDfb5HhZvsReu05ALVqqTc16iCR7qUEF5AdmLEdRZecdyX0Kvxb
	FEbfOZLZpWe5mMO+Xr1sudaId94c5adv2xDMtJn+nX8f28KaYDRN6tDKh2txtynFfDZtW8Yn6NF
	NWexp7WexQvOs9
X-Google-Smtp-Source: AGHT+IESX7ST33CPfW6lfXdQEIM5Pf9zni7qkkPp/yBgaTtS5y6MAmU9QKSnVFAtT7uBE+0l77p+dg==
X-Received: by 2002:a17:902:ec8d:b0:2a0:daa7:8a57 with SMTP id d9443c01a7336-2a2f2836573mr153623975ad.30.1766524965099;
        Tue, 23 Dec 2025 13:22:45 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbe5sm137258785ad.60.2025.12.23.13.22.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:22:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/18] rsync: fix CVE-2025-10158
Date: Tue, 23 Dec 2025 13:22:09 -0800
Message-ID: <110933506d7a1177d1a074866d08fe0b0da612d7.1766524798.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766524798.git.steve@sakoman.com>
References: <cover.1766524798.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228477

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Fix an out-of-bounds read triggered by a malicious rsync client
acting as a receiver. The issue can be exploited with read access
to an rsync module.

CVE: CVE-2025-10158

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../rsync/files/CVE-2025-10158.patch          | 36 +++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch b/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
new file mode 100644
index 0000000000..a19cc15107
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
@@ -0,0 +1,36 @@
+From 797e17fc4a6f15e3b1756538a9f812b63942686f Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Sat, 23 Aug 2025 17:26:53 +1000
+Subject: [PATCH] fixed an invalid access to files array
+
+
+this was found by Calum Hutton from Rapid7. It is a real bug, but
+analysis shows it can't be leverged into an exploit. Worth fixing
+though.
+
+Many thanks to Calum and Rapid7 for finding and reporting this
+
+CVE: CVE-2025-10158
+Upstream-Status: Backport
+[https://github.com/RsyncProject/rsync/commit/797e17fc4a6f15e3b1756538a9f812b63942686f]
+Signed-off-by: Adarsh Jagadish Kamini<adarsh.jagadish.kamini@est.tech>
+---
+ sender.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/sender.c b/sender.c
+index 2bbff2fa..5528071e 100644
+--- a/sender.c
++++ b/sender.c
+@@ -262,6 +262,8 @@ void send_files(int f_in, int f_out)
+ 
+ 		if (ndx - cur_flist->ndx_start >= 0)
+ 			file = cur_flist->files[ndx - cur_flist->ndx_start];
++		else if (cur_flist->parent_ndx < 0)
++			exit_cleanup(RERR_PROTOCOL);
+ 		else
+ 			file = dir_flist->files[cur_flist->parent_ndx];
+ 		if (F_PATHNAME(file)) {
+-- 
+2.44.1
+
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index d0796d3c12..14beafb681 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2024-12087-0003.patch \
            file://CVE-2024-12088.patch \
            file://CVE-2024-12747.patch \
+           file://CVE-2025-10158.patch \
            "
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
 
-- 
2.43.0


