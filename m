Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.8120.1630503923756723103
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZpSBDfKr;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so3457491otg.11
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6GohlZTR59B4J4aHE7uqWlS+a5tdPBOEzLa1N4hvPJQ=;
        b=ZpSBDfKrXtRuoFfKQcP5Fbr6QGOfqV2xuDsueIinmHuqJsvWEr6vO6cpykrwAXblQ3
         tnyuXe03wyuL/N39iQ+Mle7XS27yH+vdbh/RqA97OZnLNhHguxyIFyfxeh22cAYAHgeA
         nWd895Z2FyJ/xf1MF/8XBrNMfdDIGKDbjnAgZmcK7nW9P7pu1NrMjCIgr9uiSIxbtdL4
         AnLZGo5RrnJNWFbz9A6re551Pg7BOf14IyqSbxb+bFX0glmv+9kNkzPjJICdaOHIduaS
         Zb8RndAH5ye5U++brfQd7z7KNQpB0M/jtkuse1AMCA9nvo2dPgDyXUl6XhDrKnq6vKLp
         xHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6GohlZTR59B4J4aHE7uqWlS+a5tdPBOEzLa1N4hvPJQ=;
        b=MSei1wa/ererpHdGecujbkIODBLlQzeCm4oUt8MV5hLuxKbt9NNx82GHjgfSJVzaWC
         WcBSrG7q2XyGEHf1/CevAo/8NNP89vYCukmMr74AVrNbTRSiqkt6HT5sZ76lSL5uSeU9
         /NcxD5+Eh2M3T/q4/HZa/+9RM8sT2MqqVtAUyrz/BUqDy7Mo12mEhEkRyGetuEWHoZA4
         YmN7U5pSjRbT/qPZJLVOvsuXBMaP9ABZmd5OjZDzS0/Jm1y/AREknrxdPxgtjpP+lZEx
         XHqDQTsuWvRZEn3tf0uEwBB3h18Cfj/s18Itw68EZ7RycMe8dHdghz2DJnvWNiHd9MXY
         ZOHQ==
X-Gm-Message-State: AOAM531CncPfUwVYJchCSb985Yynro6xE7lGrjLI2S5/1bmq7sMcHAtP
	orWCRIpM04+n130Vnw/ism+GCEhVsL0=
X-Google-Smtp-Source: ABdhPJzXs73Fri+9eK1UxOx8IV12D0Ol6W3ZeD26RI6e9Xl/9CHgl4phxhFZzgit8jUvrCGa3EnrLA==
X-Received: by 2002:a05:6830:1105:: with SMTP id w5mr27771461otq.85.1630503922884;
        Wed, 01 Sep 2021 06:45:22 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:22 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 05/31] classes/create-spdx: Add index to DEPLOYDIR
Date: Wed,  1 Sep 2021 08:44:44 -0500
Message-Id: <20210901134510.29561-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the index to DEPLOYDIR in addition to adding it to the SPDX archive

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx.bbclass | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 5adad59065..14caae8a50 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -674,7 +674,16 @@ python image_combine_spdx() {
 
             tar.addfile(info, fileobj=index_str)
 
-    spdx_tar_link = imgdeploydir / (image_link_name + ".spdx.tar.zst")
-    spdx_tar_link.symlink_to(os.path.relpath(spdx_tar_path, spdx_tar_link.parent))
+    def make_image_link(target_path, suffix):
+        link = imgdeploydir / (image_link_name + suffix)
+        link.symlink_to(os.path.relpath(target_path, link.parent))
+
+    make_image_link(spdx_tar_path, ".spdx.tar.zst")
+
+    spdx_index_path = imgdeploydir / (image_name + ".spdx.index.json")
+    with spdx_index_path.open("w") as f:
+        json.dump(index, f, sort_keys=True)
+
+    make_image_link(spdx_index_path, ".spdx.index.json")
 }
 
-- 
2.32.0

