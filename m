Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1290C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 18:58:48 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web12.13627.1644001128122308859
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 10:58:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hp+3SVv+;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: geoffhp@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d1so5907418plh.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 10:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1j01FcI6DgeKJmEdompjPVXluAk8F3WeQ1k6cK4SBY0=;
        b=hp+3SVv+JQThYCCnOn08W66U3VITBFi15ciut9F7GhEHQ8LV019gApfFyGtfV0a6/9
         RhpMikD/JAXk8FKi7I45mrcMjc/p5lLdOU8lCu4Gk3ynXobNJ0bFSqtu3pkNN3TIyukt
         apMouzkdoqvtJwXv3XJARVDpXnUNbXwzNKWwAfCvJR3PrvhSaWBnLLVT5HzrxXuj36V9
         fUVfD4VrqkwCUCzAmXVnAYcP/eHSsVsQOr5TR2LZbILf1Uegayod5hwG6Uc6kKAfd/xn
         ZsrQk4YLIjTQdS8/mGK3k6TPY3UM7yLjl/KQw0Bc1qHVUGVAfjjL0HgNrXiaj/ej0/H8
         OvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1j01FcI6DgeKJmEdompjPVXluAk8F3WeQ1k6cK4SBY0=;
        b=l6m41luH9mDYFrk6yuT7bPXNFQGSyzqMjDjBGg22sfdqvu6malCMB8daGh+oaIxBRI
         KMvA7QCH+oxV7xkrVAmhEOwHO6tSpp8OkY1dO1/fjp6SFlqJkYDJ0NjB+SFjjWQSmZxG
         yBtkyPjZi0GYo7FAHjFCyyVYNm4l+HgG2N8G9V7WP7C/DKeTgXphZgMUJJ29H2SuYYyo
         ynS9WvL7xFWim+uPh4Ccb7c3DNNqOibIQ9CSMuhjW8d3bUGFt+E0ndezG6ouaay50q12
         EZELHX67rwDjxfG65KWJG71etEJDMkH+5pKCwMxocZqcNwGV6NWmsOUnnR37PKdgzEUy
         Oh3w==
X-Gm-Message-State: AOAM531BqAwB7J3NcL6Q7G8YcoWj/kEKH6YtBPyiQmbvx/nuNIRtNPHR
	NRN9KipshzQ0/jC3zJBIMOkcbJFuNGY=
X-Google-Smtp-Source: 
 ABdhPJzclBhKPV8c1uZqyC8kikyv96iEmxBKqS+8CxtH5clDmMvXNlP9iotFbaqlgJn8QGkeenvSyw==
X-Received: by 2002:a17:903:124e:: with SMTP id
 u14mr4601471plh.57.1644001127294;
        Fri, 04 Feb 2022 10:58:47 -0800 (PST)
Received: from localhost.localdomain (cpe-107-185-48-203.socal.res.rr.com.
 [107.185.48.203])
        by smtp.gmail.com with ESMTPSA id
 79sm3272960pfv.117.2022.02.04.10.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 10:58:47 -0800 (PST)
From: geoffhp@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [PATCH] python3-pyobject: Add patch to fix resource leak that causes
 mem leak & OOM
Date: Fri,  4 Feb 2022 10:58:20 -0800
Message-Id: <20220204185820.1210659-1-geoffhp@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 18:58:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161378

From: Geoff Parker <geoffrey.parker@arthrex.com>

Memory leak and OOM in our code involving dbus was traced to a resource leak
in python3-gobject above v3.24.1 noted in these links.

https://github.com/LEW21/pydbus/issues/83
https://gitlab.gnome.org/GNOME/pygobject/-/issues/307

This patch fixed the leak for us.

This issue has existed at least 3 years. The author of this patch
opened an issue 2 years ago on the upstream pygobject gnome project and
submitted this patch a year ago. The maintainer seems unresponsive,
since the last upstream change to the affected file  was on 2020-04-15.

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 ...d-to-fix-the-invocation-object-leaks.patch | 40 +++++++++++++++++++
 .../python/python3-pygobject_3.42.0.bb        |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pygobject/0002-workaround-to-fix-the-invocation-object-leaks.patch

diff --git a/meta/recipes-devtools/python/python3-pygobject/0002-workaround-to-fix-the-invocation-object-leaks.patch b/meta/recipes-devtools/python/python3-pygobject/0002-workaround-to-fix-the-invocation-object-leaks.patch
new file mode 100644
index 0000000000..51832aaf55
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pygobject/0002-workaround-to-fix-the-invocation-object-leaks.patch
@@ -0,0 +1,40 @@
+From 3da1eaaa891b7dfdba57b16c079ff8c6100ebb45 Mon Sep 17 00:00:00 2001
+From: Frederic Martinsons <frederic.martinsons@gmail.com>
+Date: Fri, 15 Jan 2021 07:24:37 +0100
+Subject: [PATCH] Workaround to fix the invocation object leaks
+
+See https://gitlab.gnome.org/GNOME/pygobject/-/issues/307 for description
+
+Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
+---
+ gi/pygi-object.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/gi/pygi-object.c b/gi/pygi-object.c
+index 00b36c1b..5ca45975 100644
+--- a/gi/pygi-object.c
++++ b/gi/pygi-object.c
+@@ -213,8 +213,18 @@ _pygi_marshal_cleanup_from_py_interface_object (PyGIInvokeState *state,
+     /* If we processed the parameter but fail before invoking the method,
+        we need to remove the ref we added */
+     if (was_processed && state->failed && data != NULL &&
+-            arg_cache->transfer == GI_TRANSFER_EVERYTHING)
++            arg_cache->transfer == GI_TRANSFER_EVERYTHING) {
+         g_object_unref (G_OBJECT(data));
++        return;
++    }
++
++    /* BAD hack to solve https://gitlab.gnome.org/GNOME/pygobject/-/issues/307 */
++    if (was_processed && data != NULL && arg_cache->transfer == GI_TRANSFER_EVERYTHING) {
++        GObject* obj = G_OBJECT(data);
++        if (!g_strcmp0(G_OBJECT_TYPE_NAME(obj), "GDBusMethodInvocation") && obj->ref_count > 1) {
++            g_object_unref (G_OBJECT(data));
++        }
++    }
+ }
+ 
+ 
+-- 
+2.25.1
+
+
diff --git a/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
index 74318337ba..7923f1ef6b 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
@@ -17,6 +17,7 @@ SRCNAME="pygobject"
 SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
     file://0001-Do-not-build-tests.patch \
+    file://0002-workaround-to-fix-the-invocation-object-leaks.patch \
 "
 SRC_URI[sha256sum] = "9b12616e32cfc792f9dc841d9c472a41a35b85ba67d3a6eb427e307a6fe4367b"
 
-- 
2.30.2


