Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A99C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 11:08:38 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.4559.1640084916783939133
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 03:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WirwP4rV;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id q16so26149483wrg.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 03:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fMTZe9DroWf5kYWWL7y1B1pfyv7DZy+x+6FoXy3/Jcw=;
        b=WirwP4rV+yHPf+Akvjc5pVJPq4u9BcEAxwHWKYIU9NZ4IuALovcjNHe8df/eZ8FwTg
         wPhgQQiTUyk5rJ8eadynEH5o+lZoDZD+AccLAaCIgTs31a2EoE3ijHp3oZByQ6e9subj
         KHKdUAGXxWQMhRjioPfB56qRJXoUcIA3SfJovyO3JIPzXicmD3TGOhVxPbpjh8sUPvrX
         jB+Upn1NyoGpM35wowdt9ywYV7PpLCMg6EAeYJmFWbEEspv4Dcf1YNhrQVfWXGSghgbh
         edmCsKJdyporE9ZIAvwwOB73Smw1Rvtz8r1PXYdVqCRKNUdsTwFKhWoZGcJCOrA93JbI
         Y0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fMTZe9DroWf5kYWWL7y1B1pfyv7DZy+x+6FoXy3/Jcw=;
        b=33m0Tk45Hql8Y94WJWFKA4+R2lTaz3XWZ8nuQZU39yFUrwmsrIgoPdBhopu20YhQXp
         sVX4SkX8ZLACiOvw4rqW0Y7BObc732m2oXp/uibzgINh0UVH9xoVN9OeHozip/zjDPxi
         LUO2WZYE/FOeaWkQfINAc/PPuZmTGoZpiOrbvyA5ROUaXCkJvCIcIX9VxW1t6/y7QUCO
         ie0AR/MadXN99XkxHLCZzQ/sf/geUqQsP2W+sf++4mpWkSRO+Ri3DNJqTKZE4m4aVeqF
         fX9d+NhFv1BiJTUL9GolFR3EvzKF511suTFwNvoCdpkGCDCxFgpJrj31f9SbPefouqkq
         yiIA==
X-Gm-Message-State: AOAM532tWhclh48EEb3tFLo+NilYSQoh0x1dLT19uc3l5hHZq7J0YPif
	49v5/EftCt2xFPqcyWKqD9dv8GDG2/3CpA==
X-Google-Smtp-Source: 
 ABdhPJzuxaUJ2SWxOPj7iQaFJvLKWgvWd+JgVI/dRxetrt9A0AOvaGorhWs1zP3d38HvCwbBO1dJ0g==
X-Received: by 2002:adf:f3c5:: with SMTP id g5mr2199370wrp.683.1640084914983;
        Tue, 21 Dec 2021 03:08:34 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 p5sm18741227wrd.13.2021.12.21.03.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 03:08:34 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jose Quaresma <quaresma.jose@gmail.com>
Subject: [OE-core][dunfell][PATCH] gstreamer1.0: fix failing ptest
Date: Tue, 21 Dec 2021 11:06:36 +0000
Message-Id: <20211221110635.716342-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 11:08:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159911

From: Anuj Mittal <anuj.mittal@intel.com>

Backport a patch to increase the timeout that might help with the
intermittent seek test failure.

[YOCTO #14194]
[YOCTO #14669]

(From OE-Core rev: a7dc7a35334ad634926a1386f4a56b27aad3ce68)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7b90027aac9fa41b3dc98765151d761df8dabb97)
Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---

This patch is a bug fix 3.1.12.rc1
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14669

Backported from oe-core master

 ...-use-too-strict-timeout-for-validati.patch | 33 +++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.16.3.bb          |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch
new file mode 100644
index 0000000000..e32f3c101f
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch
@@ -0,0 +1,33 @@
+From 1db36347d05d88835519368442e9aa89c64091ad Mon Sep 17 00:00:00 2001
+From: Seungha Yang <seungha@centricular.com>
+Date: Tue, 15 Sep 2020 00:54:58 +0900
+Subject: [PATCH] tests: seek: Don't use too strict timeout for validation
+
+Expected segment-done message might not be seen within expected
+time if system is not powerful enough.
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/625>
+
+Upstream-Status: Backport [https://cgit.freedesktop.org/gstreamer/gstreamer/commit?id=f44312ae5d831438fcf8041162079c65321c588c]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+---
+ tests/check/pipelines/seek.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/check/pipelines/seek.c b/tests/check/pipelines/seek.c
+index 28bb8846d..5f7447bc5 100644
+--- a/tests/check/pipelines/seek.c
++++ b/tests/check/pipelines/seek.c
+@@ -521,7 +521,7 @@ GST_START_TEST (test_loopback_2)
+ 
+   GST_INFO ("wait for segment done message");
+ 
+-  msg = gst_bus_timed_pop_filtered (bus, (GstClockTime) 2 * GST_SECOND,
++  msg = gst_bus_timed_pop_filtered (bus, GST_CLOCK_TIME_NONE,
+       GST_MESSAGE_SEGMENT_DONE | GST_MESSAGE_ERROR);
+   fail_unless (msg, "no message within the timed window");
+   fail_unless_equals_string (GST_MESSAGE_TYPE_NAME (msg), "segment-done");
+-- 
+2.29.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
index a516fabdaf..236d6034d6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
@@ -22,6 +22,7 @@ SRC_URI = " \
     file://0003-meson-Add-valgrind-feature.patch \
     file://0004-meson-Add-option-for-installed-tests.patch \
     file://0005-bufferpool-only-resize-in-reset-when-maxsize-is-larger.patch \
+    file://0006-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch \
 "
 SRC_URI[md5sum] = "beecf6965a17fb17fa3b262fd36df70a"
 SRC_URI[sha256sum] = "692f037968e454e508b0f71d9674e2e26c78475021407fcf8193b1c7e59543c7"
-- 
2.34.1


