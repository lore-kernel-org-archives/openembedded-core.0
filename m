Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD26C47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 14:07:08 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.13148.1706018819071496232
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 06:06:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=zz7+8OIy;
 spf=pass (domain: baylibre.com, ip: 209.85.208.176, mailfrom: jstephan@baylibre.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ceba21ccccso26216471fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 06:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1706018816; x=1706623616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImmVnxbKZqVDhBcDBEdPfxHuaz+S0teTbpVaIWgLr6I=;
        b=zz7+8OIyePP/r/tJ87t/etcKHE6cUB9EDkCMj+10KjpoJJecquksN8MIafqMgpbERi
         hstbIzW6aUgt2XQ0HvQSp2afE4IaFhIvLRQ2ejMv8Iwg8xYLD4Dx7jD+WIrOTs/biriM
         4cp2LUWK2UxCjnOEXjPur6FCceM8CPc38AwkWbfVLmH98HfGbcWf3KpJYvvSltBKJ/cq
         JkCvJekZOmJ1EgT2Sbd9M+HNHg/hudZHfDWerR9xIVGqmQ0/xaDENc1WFieHoS8gkVpe
         TCQVHANz17/2sYPMHkTBuVdCB4zC8jXLTDaXuizLJXZIYV6dqM9Z6D+GClaDPl16pz0Z
         QhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706018816; x=1706623616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ImmVnxbKZqVDhBcDBEdPfxHuaz+S0teTbpVaIWgLr6I=;
        b=W9mzTKReHeMHMTpoyhWVp6mb40oGTVUYJv+DpRAHq1W/AwW7J3rKV4mWVPNl8KKVtp
         UcQkx+LBhAhAJevrQ2Exul7ZV6kbPU5p4oj9cJIFLjAQqUQOKc8ZKYv/diLV1K5wcxnm
         4UQaZZkO+PCqsLtUFrc8pAPRrPzTJ4/K5REw4cDojOzS+f0dpjd57550dsBM0qb9WQoE
         e3jRKf3wiRInunnd0LEcnmurhAIZFTlPWQSRZ91dkOyytk02/MF1REI3k5wHfxSos47M
         x/I9oqeoJJA0a+yeGQiYGNtPfTouFEuDLiNrTITHHMDoHrFsH3y2V/qVbznqHOmYHo9I
         U4nw==
X-Gm-Message-State: AOJu0Yy3BQrp0nzCG4tSvVZXnN2xq1yaoQMlEbuUs0gc+OW89cRYLRdD
	MiyQlyAOkJ0h6vwRynJyz9Z0NvthSRUvYsi7T54XjwdYJQEPDjCYrFRrSWDwPU7z56+6PEjzDp8
	/8ec=
X-Google-Smtp-Source: AGHT+IGTlpkzcgHlAV2ED9t/fCb4WovYyOxRtL9zM4DvmQj6xPwAYdS+FMuL3zQIuxUsntEZPWCEcg==
X-Received: by 2002:a2e:8801:0:b0:2cd:c75d:8a60 with SMTP id x1-20020a2e8801000000b002cdc75d8a60mr2743882ljh.40.1706018816607;
        Tue, 23 Jan 2024 06:06:56 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id q9-20020adff789000000b00337d6aa3912sm12998447wrp.10.2024.01.23.06.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 06:06:55 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 3/3] oeqa/selftest/devtool: add test for recipes with multiple sources in SRC_URI
Date: Tue, 23 Jan 2024 15:06:51 +0100
Message-ID: <20240123140651.930307-4-jstephan@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123140651.930307-1-jstephan@baylibre.com>
References: <20240123140651.930307-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 14:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194240

add a non regression test for devtool modify/build on recipe having
several sources in SRC_URI

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 26 +++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index a8777207694..6ed51d7a452 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1086,6 +1086,32 @@ class DevtoolModifyTests(DevtoolBase):
         check('devtool-override-qemuarm', 'This is a test for qemuarm\n')
         check('devtool-override-qemux86', 'This is a test for qemux86\n')
 
+    def test_devtool_modify_multiple_sources(self):
+        # This test check that recipes fetching several sources can be used with devtool modify/build
+        # Check preconditions
+        testrecipe = 'bzip2'
+        src_uri = get_bb_var('SRC_URI', testrecipe)
+        src1 = 'https://' in src_uri
+        src2 = 'git://' in src_uri
+        self.assertTrue(src1 and src2, 'This test expects the %s recipe to fetch both a git source and a tarball and it seems that it no longer does' % testrecipe)
+        # Clean up anything in the workdir/sysroot/sstate cache
+        bitbake('%s -c cleansstate' % testrecipe)
+        # Try modifying a recipe
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        self.assertEqual(result.status, 0, "Could not modify recipe %s. Output: %s" % (testrecipe, result.output))
+        # Test devtool status
+        result = runCmd('devtool status')
+        self.assertIn(testrecipe, result.output)
+        self.assertIn(tempdir, result.output)
+        # Try building
+        result = bitbake(testrecipe)
+        self.assertEqual(result.status, 0, "Bitbake failed, exit code %s, output %s" % (result.status, result.output))
+
 class DevtoolUpdateTests(DevtoolBase):
 
     def test_devtool_update_recipe(self):
-- 
2.43.0


