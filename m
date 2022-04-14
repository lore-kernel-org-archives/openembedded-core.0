Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B13CC54F64
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:55 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.8427.1649915978336849180
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 22:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=isTVDTMD;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 2so4190186pjw.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 22:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cR6lci7SqsdKdecmS2pAcsQD2Aiq4y4yvCZkmqfE1cs=;
        b=isTVDTMDOpnMxzJEotFGg6/EdVG2m3qSJXjFP67TQud+hreLBLl0AVl7h8oE3Ei7f4
         IfgGhVV1fsHHVhuuXAmMVhdzYGt7SODbIHyGcaiVDUQC+IQozKZSGS1e9BGm3/9y/UME
         i4QzqlhnrCCnJbYXMoRpBbiwMgXm7yaduJR6Vod/BShNjwhnsNttoc+BE7j6bfr8Mxom
         l5niW8uAPw6Ef/9E1kQ1HsoSDydYzqpFU8Kh4LfvQWA5rU3vlX9c6uyP14PKjbxKsxS9
         a+i2NewxCK7tPfYGuuJXswD5vvsq4SRi2hzFjv7wamrmUv0cQ7BIh/QpfoHKQw5rt3a/
         p9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cR6lci7SqsdKdecmS2pAcsQD2Aiq4y4yvCZkmqfE1cs=;
        b=wjcMJfaaopNzNyewIs6aWsxFi2rwlu8akNInlaD7M/Q0V4Nty2vpPjgRUswi+nzgql
         CVleUUqJ8WRrReRMWMDOm/8QWODteHaYO7nsB48cc2BDxmzwACkpzAvfgy65WMnFHUwP
         Xq7sj5AFd+XETFZgWKB4AxOmu3+Vp771XLUda81VplYiZ0NH2nintaC9ysd6DwO36Zd9
         OUKxTbqyeBfrHD82z1QhlXYN5EpBd2jyiNdzdTwE0qdrerug1WZfoCmFFSWyyVKBftu0
         vMlIyfOuE4eAKIzCQTwKWlZz26V2K85Dt+9CK/Xjm2oajM24rBW3h2sjnJUnhSWu+Ks2
         ca2w==
X-Gm-Message-State: AOAM532oXkwkHfYRH7N2qbKfKL+KY5sYJrAmvWTeHTxxmAJ/81B7U2Qb
	UtNnZqdzKEIXTdwDNoY6wil3BlLLWgnYBw==
X-Google-Smtp-Source: 
 ABdhPJzc4X/cD4HfetSyrylYOw3Rj1H1fWWaZNDMOT6gXb9pFUYuxAJaxYdEtPC/0ar/1DwOxjHAdQ==
X-Received: by 2002:a17:902:a613:b0:156:b53d:c137 with SMTP id
 u19-20020a170902a61300b00156b53dc137mr46457057plq.73.1649915977407;
        Wed, 13 Apr 2022 22:59:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::4307])
        by smtp.gmail.com with ESMTPSA id
 t186-20020a625fc3000000b0050595843879sm865223pfb.213.2022.04.13.22.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 22:59:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 6/6] pango: Skip test-layout ptest
Date: Wed, 13 Apr 2022 22:59:34 -0700
Message-Id: <20220414055934.834792-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164390

This has intermittent behavior, is sensitive to harfbuzz version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add link to upstream bug

 .../0001-Skip-running-test-layout-test.patch  | 45 +++++++++++++++++++
 meta/recipes-graphics/pango/pango_1.50.6.bb   |  4 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/pango/pango/0001-Skip-running-test-layout-test.patch

diff --git a/meta/recipes-graphics/pango/pango/0001-Skip-running-test-layout-test.patch b/meta/recipes-graphics/pango/pango/0001-Skip-running-test-layout-test.patch
new file mode 100644
index 00000000000..ec7fb4727eb
--- /dev/null
+++ b/meta/recipes-graphics/pango/pango/0001-Skip-running-test-layout-test.patch
@@ -0,0 +1,45 @@
+From b9bfe3a79f165682a6db3d7ee1928365e93b1ccf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 13 Apr 2022 19:39:29 -0700
+Subject: [PATCH] Skip running test-layout test
+
+This fails intermittently, it varies based on what version of harfbuzz
+is installed and if it does not match with what pango CI tests then we
+get random failures in this test. This has been disabled in other
+distros [1] too
+
+We want to drop this on next upgrade and see if this test passes if not
+then keep it disabled
+
+Fixes
+
+Running test: pango/test-layout.test
+1..36
+ok 1 /layout/letterspacing.layout
+ok 2 /layout/valid-7.layout
+not ok 3 /layout/valid-14.layout
+Bail out!
+FAIL: pango/test-layout.test (Child process killed by signal 6)
+
+[1] https://github.com/archlinux/svntogit-packages/commit/3f883e7ff8071adad23b6bcc0ba4b995aff10d52
+
+Upstream-Status: Inappropriate [bugfix https://gitlab.gnome.org/GNOME/pango/-/issues/677]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/test-layout.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/test-layout.c b/tests/test-layout.c
+index 1139e4f..b47a066 100644
+--- a/tests/test-layout.c
++++ b/tests/test-layout.c
+@@ -222,5 +222,5 @@ main (int argc, char *argv[])
+     }
+   g_dir_close (dir);
+ 
+-  return g_test_run ();
++  return 77;
+ }
+-- 
+2.35.2
+
diff --git a/meta/recipes-graphics/pango/pango_1.50.6.bb b/meta/recipes-graphics/pango/pango_1.50.6.bb
index cd04801db10..93e16534641 100644
--- a/meta/recipes-graphics/pango/pango_1.50.6.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.6.bb
@@ -18,7 +18,9 @@ inherit gnomebase gi-docgen ptest-gnome upstream-version-is-even gobject-introsp
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-SRC_URI += "file://run-ptest"
+SRC_URI += "file://run-ptest \
+            file://0001-Skip-running-test-layout-test.patch \
+"
 
 SRC_URI[archive.sha256sum] = "a998bcf36881c3ac20495d40bceb304f4eaa9175bd2967c85656434cbdafe86a"
 
-- 
2.35.2


