Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF39C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 18:38:26 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.4943.1717094301151444968
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 11:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=T86mP6XN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7022cabdc0aso1065758b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 11:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717094300; x=1717699100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Wevm+Cko/vfvWgCzzD+yZTQ5DSH6lkYVjWYXM5+OHQ=;
        b=T86mP6XNBLqs5qiHStgYdBICV9lPISDv9rbPZx7jBh7MrrrSkufE9dhiYb9Izksnqh
         0LbgfK/nW1kykUrKAigJF99czBj0kSqLA9A6wG1w4zaistFpYPI9hXaosPL778/IcjRM
         sqs2wQFbDQvNNux3qK4eHVIi/c+9IU7ICZye7NrnjAq9VxJJKsnqg3qfiGl9J367I+0o
         eOsIhr7LlZTi4NIYzWf6P2NCbK3TTWxVrxZxKULx9fW6tFv97ERGqoUoqGrZdeAuKqz0
         P1T9WFS5AG64oQjFPGuEmY+csRkYnHMwaTHVz5pAej6uqhmget7hRO0LNSG+A8ksVNNQ
         kuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717094300; x=1717699100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Wevm+Cko/vfvWgCzzD+yZTQ5DSH6lkYVjWYXM5+OHQ=;
        b=t4A7k3OnMBAYUEjwn0ktLm6hyqbQ6noyqXOCc3g2CCuidweVwQsxA9SWHI9/C9lBRv
         o8SSHGmO34x4LvGQrSwwj8ohf1Tq3UsU2SbTclS2S9L2mMmY6SoR0OcSO2ezwOiNIm0K
         aQ+32Zq33TD9Fdfe56wZ2WFLosFHUTFvCJWW4eZxNPpS5Rf38l53rEuJ9sFhMkQGW5+C
         tj1uDyt3HMvuiDohn3ZzQNuoQPV6ErcTu2jepUddmkP02OO6l63LAcqsTRiOrz7Ine/1
         zzX9E7YBC1HzIjxKhY/1Xb5uxnkp0pjutvXp5WRK5ns8ek5qQuoUj0RC5YKjQiFisflc
         +X8Q==
X-Gm-Message-State: AOJu0YxtIlTsHODeO3qe7ZyXPI5Dqt79IhpIagBqXEUX0A7D0QkjMs9o
	PBzMnHTgTgVvoaDkuGZtZNrUVikVSY8xW8F6/2dwF1McmKS4hBrmaqbtQGVZGenK5THj6L420B0
	M
X-Google-Smtp-Source: AGHT+IEt4KmvQpeIr4OgZcO4EYlfbt4+LMfuPStvj7NVwR0F5QsWgNGUu42DFZNGVFFqbROe3z5MAw==
X-Received: by 2002:a05:6300:8981:b0:1a9:509c:eba6 with SMTP id adf61e73a8af0-1b264d4a581mr2923469637.25.1717094300406;
        Thu, 30 May 2024 11:38:20 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423dbfc4sm62005b3a.66.2024.05.30.11.38.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 11:38:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/7] ghostscript: fix CVE-2023-52722
Date: Thu, 30 May 2024 11:38:04 -0700
Message-Id: <66228a9e8177e70a5653b61742836a3ad83e78af.1717094145.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717094145.git.steve@sakoman.com>
References: <cover.1717094145.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 18:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200043

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2023-52722.patch          | 43 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-52722.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-52722.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-52722.patch
new file mode 100644
index 0000000000..8fbfc9ef09
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-52722.patch
@@ -0,0 +1,43 @@
+From 1ff9a695947967d2d327c45bf5145dd381fc1745 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Tue, 12 Sep 2023 10:46:10 +0100
+Subject: [PATCH 5/5] In SAFER (default) don't allow eexec seeds other than the
+ Type 1 standard
+
+CVE: CVE-2023-52722
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=1ff9a695947967d2d327]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ psi/zmisc1.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/psi/zmisc1.c b/psi/zmisc1.c
+index 3c47e99..81556ac 100644
+--- a/psi/zmisc1.c
++++ b/psi/zmisc1.c
+@@ -93,6 +93,9 @@ zexE(i_ctx_t *i_ctx_p)
+
+     if (code < 0)
+         return code;
++    if (gs_is_path_control_active(imemory) != 0 && state.cstate != 55665) {
++        return_error(gs_error_rangecheck);
++    }
+     return filter_write(i_ctx_p, code, &s_exE_template, (stream_state *)&state, 0);
+ }
+
+@@ -130,6 +133,11 @@ zexD(i_ctx_t *i_ctx_p)
+     }
+     if (code < 0)
+         return code;
++
++    if (gs_is_path_control_active(imemory) != 0 && state.cstate != 55665) {
++        return_error(gs_error_rangecheck);
++    }
++
+     /*
+      * If we're reading a .PFB file, let the filter know about it,
+      * so it can read recklessly to the end of the binary section.
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 1fd08d1cfe..2e332b1589 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -49,6 +49,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2024-33871-0001.patch \
                 file://CVE-2024-33871-0002.patch \
                 file://CVE-2024-29510.patch \
+                file://CVE-2023-52722.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.34.1


