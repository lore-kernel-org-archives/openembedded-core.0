Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0101C4332F
	for <webhook@archiver.kernel.org>; Fri, 23 Dec 2022 07:10:36 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.67309.1671779433085039405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Dec 2022 23:10:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=V8/D7Tla;
 spf=pass (domain: mvista.com, ip: 209.85.215.176, mailfrom: vkumbhar@mvista.com)
Received: by mail-pg1-f176.google.com with SMTP id f9so2799519pgf.7
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 23:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=awLxS9sJgoASxHMhPanlUmrh3YIBmcC0HViEPkWRb9E=;
        b=V8/D7TlaILsqRlQvq56SNcAg4uQXTRjzGz/q4uGbX79/tmN9qIF6dEq3GT9G/WeKR0
         uL0BuNqoxJLnud9FCfOrDo0GdLCBKUzJFDT+sJB7tIyUW6XqVBHd0MlldL5ToY3N3GLj
         DklxRUByq+bAABaiy3PuFkZqSNn9/zWAKOk00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awLxS9sJgoASxHMhPanlUmrh3YIBmcC0HViEPkWRb9E=;
        b=i3Dj9gqUduEf/NBKyXiwQVrQv1EId4tOFpguxDcvQjhx5mXX1+mL+pzdjR0VYmRrlG
         rBxp/KR/shMqd3rH9W9Tjnl6O/8jQGEgtH1EGXKxUjhYerP1Ibhg5nZlPn3vHWaoU6X3
         wypRo1SyWZYYr6eH4Xq54os+HImpplpLpxjXEZ9qsxHKMnGYrvlu8kbRX8KB79FGQqgv
         yelzFllYzsjAq1IVFp60pbrPr0zVKX0GIwwuDKCQjWApJf6mdM6CT7B3FnTs2LRCNtlg
         /Qs9lKoWk28ccMJ3a6aJjr5mpuf6tytOwsfuTg2bxvsIxqss9t5UreYO4FLoyaNegNbM
         jIeA==
X-Gm-Message-State: AFqh2kqSmYdbRC242xfyR7RwjnZVQeo0XUEuYty8FGuXygCrlhznTrQM
	SkogPImfmVdrNl2ulXXftK2PeNeZQpC7Z27h
X-Google-Smtp-Source: AMrXdXvOzVYskgDJoj84JH1xZSUb+awUd0QEx6D7aHyfS63iQOw7qbpGBTzjLWA+ZjZ6ivQS5NII6Q==
X-Received: by 2002:a62:ed08:0:b0:577:272f:fdb with SMTP id u8-20020a62ed08000000b00577272f0fdbmr7569817pfh.29.1671779431747;
        Thu, 22 Dec 2022 23:10:31 -0800 (PST)
Received: from vkumbhar-latitude3400.mvista.com ([116.74.137.86])
        by smtp.gmail.com with ESMTPSA id e4-20020aa79804000000b00576f9773c81sm1752239pfl.211.2022.12.22.23.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 23:10:31 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
X-Google-Original-From: Vivek Kumbhar <vkumbhar@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH v2] libx11: fix CVE-2022-3555 memory leak in _XFreeX11XCBStructure() of xcb_disp.c
Date: Fri, 23 Dec 2022 12:40:23 +0530
Message-Id: <20221223071023.762305-1-vkumbhar@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Dec 2022 07:10:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174975

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../xorg-lib/libx11/CVE-2022-3555.patch       | 38 +++++++++++++++++++
 .../recipes-graphics/xorg-lib/libx11_1.6.9.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3555.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3555.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3555.patch
new file mode 100644
index 0000000000..855ce80e77
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3555.patch
@@ -0,0 +1,38 @@
+From 8a368d808fec166b5fb3dfe6312aab22c7ee20af Mon Sep 17 00:00:00 2001
+From: Hodong <hodong@yozmos.com>
+Date: Thu, 20 Jan 2022 00:57:41 +0900
+Subject: [PATCH] Fix two memory leaks in _XFreeX11XCBStructure()
+
+Even when XCloseDisplay() was called, some memory was leaked.
+
+XCloseDisplay() calls _XFreeDisplayStructure(), which calls
+_XFreeX11XCBStructure().
+
+However, _XFreeX11XCBStructure() did not destroy the condition variables,
+resulting in the leaking of some 40 bytes.
+
+Signed-off-by: Hodong <hodong@yozmos.com>
+
+Upstream-Status: Backport from [https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/8a368d808fec166b5fb3dfe6312aab22c7ee20af]
+CVE:CVE-2022-3555
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/xcb_disp.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/xcb_disp.c b/src/xcb_disp.c
+index 70a602f4..e9becee3 100644
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
+2.18.2
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
2.30.2


