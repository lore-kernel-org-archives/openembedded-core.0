Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E169C5DF92
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:58:03 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10422.1787155079558586557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=j6UuMMmT;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-472326ca506so815973f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155078; x=1787759878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j7l81iDrTnHNiIUXaQdYKKwnMpu7rJdAzdWQtq4wp+s=;
        b=j6UuMMmTZnmAVIvql+a2g/SE66J8VKnQMgVQxk6yb8ulA4KQ3QbCgzOT47O1qbZNJR
         I/O827vIIJ1gMLXhMXkbEH2O2tGFlBWVYlY2sAszyd/P/p5Xr+rq8YOg6oyK36XEfHYz
         V1qZ3dyBkJCnYJ1mSUGr0fU15rnQGw/ClQwK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155078; x=1787759878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j7l81iDrTnHNiIUXaQdYKKwnMpu7rJdAzdWQtq4wp+s=;
        b=HW60auk558VU2UwnU+XvDxro//YNXItSOeqxEzrxq8jRS6uDyoM40uBMA1l6nG/Rkh
         YUTX8pdkANtCSOFuYpOnIsl8JvivykF1cWYwOiQlRovQcyOqOHLpFycZvDy419Bq5yrG
         V3GqlGXDrhITkHRIfbJHtGDtNk8GlShCl4uQP/jGax0t1dm4eyNcXX+8VYL5pEdK2t/F
         fQe5R46vFLThd7WduSjyT+qvyext5eHBSmscAxDCiYtk8X4i95D60ARUPMVXI3ztW2W5
         H6Dw9YYKvEXWv2lf5Y6wxiggCglxUdOikhTYCBlr9FbFf/Ouxa3qVhR1wcxz25plGPso
         2jdw==
X-Gm-Message-State: AFuF++kMJPut4ajH7NPGrYUD/QmLcCN4+2IuR4/CM3KHvrCHOnlXocd7
	3spVvWPxTpVxW/hF8rk9vI0mYrKg0MrdL8+ucMUJCm1fkR6dFNEKFNrmyi/EmJHs6Q7/mh6CUHR
	QVqNQTlE=
X-Gm-Gg: AR+sD12uhu1IPV2BiSRCDAYhR1jXDKOUJIwahKkP7x7YcDM7PH8o1t11yqSx+WfkcMm
	KsOESIGZDdts217fU5iqkMxzfcHM8UhpIK2BEAGkOEEpfPMzJDTw/ePgVB2vWxvZ1sMFyAUPJUu
	LUWQ0++8CUHAHkmSqbKuSwzH7s4SI9Kql0zx3qWQVUw+Wdyabf3IYqRG1D4Z/LemKAqormBx7SF
	E1sEs/A9/scSaJcefX346zFpBDZFbOUlS6+0w+xIUbzcpxkWtptiFVYXnIRmasoSHGY/NgOTyhE
	JXlj28NKqQtuR04aBgcXnThF/EG8Orp2LKna53VYmrVi9ATQrX2Rh7mmDkITYASO7ZEKM+XXeMk
	KRzFmQAq99uzKhLZmQffi7n442CcD+SESnfY9Fu7YiN3exr7XB3B91r4e0wxDhqpJSWF4NmF/+s
	qBhxhKG0Ly1xlaRZp8wAJuibwrudWOJNRSXkwhWDlJTXkPqYFl1rQHjqqpXLKEnWGCe2SfWbMqv
	LciAWFPlpVdY7YydflvA0lfAmpbYLdSsjqpXF/mkhW9sMgduJxzGF7UhUj1Wchp+iOXST3Wl4we
	JM+FcK/XaJ0nBLiIqt+gcTSb3EwUtYabogBLzZwk
X-Received: by 2002:a05:6000:715:b0:47f:86d5:d1d7 with SMTP id ffacd0b85a97d-482b1e957b9mr11787851f8f.6.1787155077700;
        Wed, 19 Aug 2026 08:57:57 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:57 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 32/37] libssh2: fix CVE-2026-66032
Date: Wed, 19 Aug 2026 17:57:03 +0200
Message-ID: <ff0d15e746e245a2762cf18a52caa7d76c384463.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:58:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243768

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-66032
https://github.com/libssh2/libssh2/commit/5e4776146552d898b9c0e1b313cd093fa8dc92d0

libssh2 ptest results (qemux86-64):
  before: PASSED: 1 FAILED: 0 SKIPPED: 0
  after:  PASSED: 1 FAILED: 0 SKIPPED: 0

(From OE-Core rev: 19f03bde8988ecff900d2c6f12fb93db84a6d48c)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../libssh2/libssh2/CVE-2026-66032.patch      | 36 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66032.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-66032.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-66032.patch
new file mode 100644
index 00000000000..15a52664853
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-66032.patch
@@ -0,0 +1,36 @@
+From 352341aaebcf91ab16e7fcff158fef4a3b8c32f6 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Tue, 4 Aug 2026 12:32:31 +0000
+Subject: [PATCH] Prevent dangling pointer by nullifying data (#2180)
+
+Set data to NULL after freeing it to avoid dangling pointer. fixes
+GHSA-px3w-7g75-hg7w.
+
+Credit: VladimirEliTokarev
+
+CVE: CVE-2026-66032
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/5e4776146552d898b9c0e1b313cd093fa8dc92d0]
+
+Backport adaptations:
+- The upstream fix uses SSH2_FREE() which was renamed from
+  LIBSSH2_FREE() in newer libssh2. Context adjusted to match
+  the 1.11.1 codebase (different line numbers and surrounding
+  function/macro names).
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/sftp.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/sftp.c b/src/sftp.c
+index 6ede3111..793f267c 100644
+--- a/src/sftp.c
++++ b/src/sftp.c
+@@ -1279,6 +1279,7 @@ sftp_open(LIBSSH2_SFTP *sftp, const char *filename,
+                                "got HANDLE FXOK"));
+ 
+                 LIBSSH2_FREE(session, data);
++                data = NULL;
+ 
+                 /* silly situation, but check for a HANDLE */
+                 rc = sftp_packet_require(sftp, SSH_FXP_HANDLE,
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 1b281e62966..260f06204df 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2025-15661-1.patch \
            file://CVE-2025-15661-2.patch \
            file://CVE-2025-15661-3.patch \
+           file://CVE-2026-66032.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"

