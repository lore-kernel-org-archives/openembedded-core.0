Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B7AC4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 22:02:32 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.8315.1701381744921090990
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 14:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=145rE6tM;
 spf=pass (domain: baylibre.com, ip: 209.85.128.49, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40b552deba0so14961465e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 14:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701381743; x=1701986543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvE4x+BSWCykvr7+GHabCu0YsMh+yRIas/EieK3kU4E=;
        b=145rE6tMq5vHWBzT7Obuz+sqyzXtTs9kG6eW522a2cdrj4BK1mtvQ6RukPdPCTJfFI
         C8jj8HVpVV1mBUpmGPPoFdgSBTuugIMOlb5//TOy2cc9KibNIP8DYScgt0HdV1CBOd/o
         QxrhiRgn/fFLqy44au7l7seO8NfopCdZNjmUdBl+ihRAnWWlsNg50yc6qYjWz/DxjIfw
         VK8Q/vUVCp5ZqDcTkQ1VwVxKThsbmBNAQ77naX6hsCfqVeD+ZDelJh7wInt0lamSbTKb
         JoBANs9QYZtp07e7Ny+jqsP405uE0Totboi9EhN1cUZe7dfKNZfqe/S5FwnSZKerVEIX
         g6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701381743; x=1701986543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvE4x+BSWCykvr7+GHabCu0YsMh+yRIas/EieK3kU4E=;
        b=VEV/OZ7ipUw5ug8jV28KOu7jGC2zZNCW5r0YueOO/egsF3hrzIZvbec0QMjbfdtpQy
         SiY81AJWXjNWok+ihfns6luTS5EJIkdtgmfzwuP0IT8Dn/HbhQAx+qnVuz0bw1Fiqjbf
         h5AoRkfBBea5EOINUIcLSvcOqsk5qbxl9ehhsLu0sAMzGgrDSp65Id7JZdOvVPvZ3Ghb
         U6EtmqWiFBIwS3QVMCB1bspA4P3spxpzwEkYrlBF0IXqgZnyLfhsF45LS12eL0c/T1Go
         fZ8Vhm5V9XCbmxvXg49O/k2Rh01NNDyj5f2RxQAvqUmvL4yFLGkwOK280f92sDwpDDX+
         rRqw==
X-Gm-Message-State: AOJu0YxeFy4wfa7+X9fX9HkAa8YKF+hUtU0o11w0J+bnM8C7e3t1sSE9
	VO2xK1JEe8u604io03La2pLh6+RO4sC9SBSCtoCX3w==
X-Google-Smtp-Source: AGHT+IFWwTcEkUzjIYMx9L7Q0sBIpbcNv7Puj1B2ZD55dI99IAy1bkr/s10eo3tOJJBwUQ5Ouam9yA==
X-Received: by 2002:a05:600c:26d3:b0:40b:5e21:dd44 with SMTP id 19-20020a05600c26d300b0040b5e21dd44mr77925wmv.114.1701381743332;
        Thu, 30 Nov 2023 14:02:23 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id w3-20020a05600c474300b0040b36050f1bsm3231372wmo.44.2023.11.30.14.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 14:02:23 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 8/8] oeqa/selftest/recipetool: appendsrc: add test for update mode
Date: Thu, 30 Nov 2023 23:01:56 +0100
Message-ID: <20231130220156.726263-9-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231130220156.726263-1-jstephan@baylibre.com>
References: <20231130220156.726263-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 22:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191552

add a basic test for testing the update mode of recipetool
appendsrcfile(s)

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 7d5ac4b47a5..7a114335821 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -1179,6 +1179,34 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
     def test_recipetool_appendsrcfile_machine(self):
         self._test_appendsrcfile('base-files', 'a-file', machine='mymachine')
 
+    def test_recipetool_appendsrcfile_update_recipe_basic(self):
+        testrecipe = "base-files"
+        recipefile = get_bb_var('FILE', testrecipe)
+        result = runCmd('bitbake-layers show-layers')
+        layerrecipe = None
+        for line in result.output.splitlines()[3:]:
+            with open("/tmp/juju.txt", "a") as file:
+                layer = line.split()[1]
+                print(layer, file=file)
+                if layer in recipefile:
+                    layerrecipe = layer
+                    break
+        self.assertTrue(layerrecipe, 'Unable to find the layer containing %s' % testrecipe)
+        cmd = 'recipetool appendsrcfile -u %s %s %s' % (layerrecipe, testrecipe, self.testfile)
+        result = runCmd(cmd)
+        self.assertNotIn('Traceback', result.output)
+        self.add_command_to_tearDown('cd %s; rm -f %s/%s; git checkout .' % (os.path.dirname(recipefile), testrecipe, os.path.basename(self.testfile)))
+
+        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
+                           ('??', '.*/%s/%s/%s$' % (testrecipe, testrecipe, os.path.basename(self.testfile)))]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+        result = runCmd('git diff %s' % os.path.basename(recipefile), cwd=os.path.dirname(recipefile))
+        removelines = []
+        addlines = [
+            'file://%s \\\\' % os.path.basename(self.testfile),
+        ]
+        self._check_diff(result.output, addlines, removelines)
+
     def test_recipetool_appendsrcfile_replace_file_srcdir(self):
         testrecipe = 'bash'
         filepath = 'Makefile.in'
-- 
2.42.0


