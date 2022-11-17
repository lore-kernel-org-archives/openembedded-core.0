Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7E6C4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 06:26:21 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.9503.1668666375160756588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 22:26:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gBpRG9fd;
 spf=pass (domain: mvista.com, ip: 209.85.215.172, mailfrom: vkumbhar@mvista.com)
Received: by mail-pg1-f172.google.com with SMTP id v3so1136065pgh.4
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 22:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BV6yHYhdHVU6cjbVA1juL91L5KPDvNoWucA019vJYwY=;
        b=gBpRG9fd/EzCnYqigaOARwhtfa2G0s4u8PZ7KOCb+r4UlOKlEI7tRKQ9WRN+8g6fGb
         yjd3DKSdEZUnTZYnWOqUiTiudGx4DpvTOdXvOBpSbjYy4JZl7r0X5+hjYLtJP8bKZyFK
         yfi0BJ3S1VlUeGsCkCra3tf/hSmdO5lSAaouQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BV6yHYhdHVU6cjbVA1juL91L5KPDvNoWucA019vJYwY=;
        b=qFDRb+7EML9jsXKPkJsjqWryNOmcv9lNg6HoEOUgEvxAApI2iyGgAO9s56wqsVDWJY
         3lgQ0rvvCkfYaaPSe3kHm3WcZNVc+FgfHtvy3sRG1ywWzhKdoOZ3ZjRtC5+iBdL5Md8Z
         b2jvrKOwxc/ZVGU0q+kS4OKIG4SqHWmiBwwO+EO7rx3oDo6MIQDlwPQ5yXT5z8oFlvfG
         GioLvckRKbxMfERxXhuSa8pgHE7xuglqoUyZt7++uRwj/zzVlwIb6/lA9ldPtdpfHNH5
         sm7P1Mc2+YGbgKYv3FkoJkhhMPJLdCmGXrNsIfq9+isZBTRkCEeh0u+63KHft69bb0Rq
         fHHQ==
X-Gm-Message-State: ANoB5pkEwVSJ3B6CATJPCwHijfRJ/ypJvArJxHMIFiPQObiTMp/MyrJ3
	9ZMKj2J65u5+/0CK/1rcipj1oqc0Dh/98w==
X-Google-Smtp-Source: AA0mqf5WfndU8fuHdBKYmiBSWsSociP7Q/8axkZEmxCEXeh0iH2G3tb4H/JYsJFa7wEQ83XYOS0kUg==
X-Received: by 2002:a63:ec07:0:b0:470:90f1:6216 with SMTP id j7-20020a63ec07000000b0047090f16216mr864165pgh.42.1668666374345;
        Wed, 16 Nov 2022 22:26:14 -0800 (PST)
Received: from vivek-Latitude-3400.mvista.com ([116.73.95.148])
        by smtp.gmail.com with ESMTPSA id w13-20020aa79a0d000000b00562a237179esm153462pfj.131.2022.11.16.22.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 22:26:13 -0800 (PST)
From: vkumbhar@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH v2] libx11: fix CVE-2022-3555 memory leak in _XFreeX11XCBStructure() of xcb_disp.c
Date: Thu, 17 Nov 2022 11:55:59 +0530
Message-Id: <20221117062559.185941-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 06:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173402

From: Vivek Kumbhar <vkumbhar@mvista.com>

Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/8a368d808fec166b5fb3dfe6312aab22c7ee20af]

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../xorg-lib/libx11/CVE-2022-3555.patch       | 38 +++++++++++++++++++
 .../recipes-graphics/xorg-lib/libx11_1.6.9.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3555.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3555.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3555.patch
new file mode 100644
index 0000000000..82309e7f62
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3555.patch
@@ -0,0 +1,38 @@
+From 5f43fbe704d32a6934bb3b3957feb85c20414ad9 Mon Sep 17 00:00:00 2001
+From: Vivek Kumbhar <vkumbhar@mvista.com>
+Date: Thu, 17 Nov 2022 11:33:01 +0530
+Subject: [PATCH] CVE-2022-3555
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/8a368d808fec166b5fb3dfe6312aab22c7ee20af]
+CVE: CVE-2022-3555
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+
+Fix two memory leaks in _XFreeX11XCBStructure()
+
+Even when XCloseDisplay() was called, some memory was leaked.
+
+XCloseDisplay() calls _XFreeDisplayStructure(), which calls
+_XFreeX11XCBStructure().
+
+However, _XFreeX11XCBStructure() did not destroy the condition variables,
+resulting in the leaking of some 40 bytes.
+---
+ src/xcb_disp.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/xcb_disp.c b/src/xcb_disp.c
+index 0fa40de..03fa1e8 100644
+--- a/src/xcb_disp.c
++++ b/src/xcb_disp.c
+@@ -102,6 +102,8 @@ void _XFreeX11XCBStructure(Display *dpy)
+ 		dpy->xcb->pending_requests = tmp->next;
+ 		free(tmp);
+ 	}
++	xcondition_clear(dpy->xcb->event_notify);
++	xcondition_clear(dpy->xcb->reply_notify);
+ 	xcondition_free(dpy->xcb->event_notify);
+ 	xcondition_free(dpy->xcb->reply_notify);
+ 	Xfree(dpy->xcb);
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
index 72ab1d4150..ad3fab1204 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
@@ -17,6 +17,7 @@ SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
             file://CVE-2020-14363.patch \
             file://CVE-2021-31535.patch \
             file://CVE-2022-3554.patch \
+            file://CVE-2022-3555.patch \
 "
 
 SRC_URI[md5sum] = "55adbfb6d4370ecac5e70598c4e7eed2"
-- 
2.25.1


