Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 662C6D5AE62
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:00:49 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2989.1765620047432205650
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:00:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XgKLgXgI;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0833b5aeeso12015905ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620047; x=1766224847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJWVUg45msu84JrLVgwozO/a2ViJALRM7mUzsFdY8u8=;
        b=XgKLgXgIuwPntODFqg/SURxiXgVt7uMorIOeycQYCYw9E9VFc4bjnQu25vg7NXwbOa
         JHITgNEeqYS0Lo8vwm/W4WLc+91KiyFOdG3ZqPb0Hr86f8temua8sv9LGPKXTMPsyZa3
         6MNJEwKtXVhdqZr7K3UGRnI1b41xWGqkDk9HQXQ7YUmkWWB3QuES7xHuGI25+wUKVp3Z
         2X/9gCBSUCf/sXydSTFjk9xowqjpckP42Z4uUfs9BrQsd6bjDrRHHWBOtpJOt+XvRMFe
         XwI5GVb/Wj8I52buZoupEKcVX5cWROHDc2RRlPbhhVoSKPTTEfCrQpzfXVFaX2zfZiGp
         2GvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620047; x=1766224847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YJWVUg45msu84JrLVgwozO/a2ViJALRM7mUzsFdY8u8=;
        b=fsuFkmDwkSWvpUIIuPiqD7YOQEbjh8acq3P4wkXtMJK6loi2cJEkN6DR98vh6YhUsa
         Eq8LTn3f6mcfBZ/5FWT1sIkHupUaZh5f6CmrC+hcafPYYBVeKegpp/boI8oPm/+MYGed
         fbdOtKqz8NwQqAaoeA3svqGroVx64ue8chcprK5TZJVKEdxaPEJ9i5jpMpibhoSkfrZP
         NkIUuBlg74ZTmKfVcUq1pMvdAUftJpkgPWa4PlJCMBRb+GAEq09BF6XZjwIlEyXZ57E5
         upIk3bBwsMFsJApn0bQ0MsgFJbvD3Q2ldbweNGvYDbMdqQKsCvgj00fvC/ErNUpg5LIX
         ag9g==
X-Gm-Message-State: AOJu0YwGlfHkTjoFM+ke4FivI0h89fakzTCV3R6Tz3ZtL5C29kZclGIZ
	Przy+Z2vyj6BZefDOp34UK0NlkPh+stE09y+Dh7liQITLqizltI8H/C4nbcTZ1Cv
X-Gm-Gg: AY/fxX5dhe4JBKVDukHQMT3SbyMhdTeuTMsXqpUIXkS1iNzRGrLlGtqJHBodO45YS6a
	lyBg7G49xx28XVMw72P/QuJkhEmlvfxBlpIv79cGIxH6qQLK1ukd7BmPgriD+tKv3tliejc4DYy
	A07j+UReXquh5yw2vH92Ra4vcsE9ZqGUI4zNnzU9MFCCkWntoiElaga89gajnyazbKowt4UjduH
	eU6GdzhaipU3UAchZllgVHNvdxz/I0pSKZgB8sLi+x2m6nyWqxP6ON/V7is6S8ZlDrXJ2Jg+YEN
	hbdOucbO/gqxNWtQhp8uT4tetsVenGteZu8P3RuvHLc3NgYLr6rnlznW8RTTApt5GaxTVw7We5O
	xkfcBsV/3RzjwG5uoRZXzyEhwACVW1Zj5Tm8IF60JQ3/22ARzU60tCe2yetLBoYvCuBDvBsN41q
	1YCyKntmxHamHWPTeco3wOhtfrs4TylKHOiRo=
X-Google-Smtp-Source: AGHT+IEdHi/PxM4aC2Aj5wF84h+nuPhRr6EM6q/QRsdk5iss3C5LLqeT73KhO3uUsndAUuqqlXa4lg==
X-Received: by 2002:a17:903:fa7:b0:297:ece8:a3cb with SMTP id d9443c01a7336-29f23e55212mr44425945ad.25.1765620046567;
        Sat, 13 Dec 2025 02:00:46 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:00:46 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 25/67] gst-devtools: upgrade 1.26.5 -> 1.26.7
Date: Sat, 13 Dec 2025 15:28:49 +0530
Message-ID: <20251213095931.2571498-25-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:00:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227643

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 8abbe8c533f91780f4d315084290489c052d737e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{gst-devtools_1.26.5.bb => gst-devtools_1.26.7.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.26.5.bb => gst-devtools_1.26.7.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.7.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.26.7.bb
index b0de19c10d..dab66c3c9c 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.7.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "63d46a8effa8a225e25a464ba7538ace853fe0dc1e70366b27c208135e5401ce"
+SRC_URI[sha256sum] = "6912330ecfaf4f4f1329defbe97b9daf92e9aeaf8375e327a0dd30524d79f0a0"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"

