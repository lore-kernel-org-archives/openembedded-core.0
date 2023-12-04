Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1648FC46CA0
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 15:26:22 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.71455.1701703580534360315
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 07:26:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=IFcjoy8a;
 spf=pass (domain: baylibre.com, ip: 209.85.128.44, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40b399a6529so35194565e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701703578; x=1702308378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWxlOCe/hdZJ+F4EXIapSccS7y66VxWLnP8DNmgSPhk=;
        b=IFcjoy8aeHa4x1AnPtD2vnLsKSlUU1+iDT2oR7/HM0HEiIZeK1rJe8eDZpKgH368Yf
         U7qrmvwE4KUqMI9ynYqp/GTAKg6xuMOfUGaBTSTzei7q9jjg83HaebPoIIzN8gCj6rBf
         WaMF94ml7s7dryQfd1E39cApwvuYOWO48WHoeO18Sjb8KxkXut+MOzO8rU0xivI0jC3z
         cFP0crmJEh2SysIOYdPkLIBDhGWSb3AXyulFT5YxcsJHNfTKn1U29a1m3sR7IgghcNXs
         jZnBgwB0AHBYxKE+DR1BKzIXFcr+jpXdKXR4OoFonDJ5w1CuS+L6/m+t6xahCJzHcd/m
         5OjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701703578; x=1702308378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWxlOCe/hdZJ+F4EXIapSccS7y66VxWLnP8DNmgSPhk=;
        b=gzgr9rAEzDqY9YKfjPmJFZu8zNwWhA7IrZ7itSjO9ByObsr4EhxbSjeKZGB/HSlOpr
         8oYYbPfmQ6rXmyXJ+gs03bZuuRtXhAkcPEImmgCRAl7r48DD2iq8F9yZTIqfINm6H6y5
         ztAVBB03wAOUPOZ7rt3dkQHfKKShEOONP3TNVHaEAi+gD2i4T7m3VL5sOH1CFqf5mDU8
         YfYqEVv1Qt9+1rX3wRcrn47xvxpRsZQbsTrYvxzIIhoUVL2VJJcr97QVm9+CIMUtRBsT
         TpKiqvJ13GxMiPQ6HfV0XR21njOHjb/7SWWpaqfg1MTcuEQ9xoOBHYs2Lk3JzOWrKzbd
         rS8A==
X-Gm-Message-State: AOJu0YyKhoJmHCBlbkFKJ0LffhlxGMhzUXdSS9HHpnQxqwCmYpUYmq7z
	y9hAmep23JJyq0b8+COTJVUTYe5GVhO9xYM/muv9kg==
X-Google-Smtp-Source: AGHT+IHcRjAeDeqlBqoCEos2NoXjl+m1uSbtC8czp4WBI0eilRvOf78TJTPpYiKVDqk+sTxs02Cu9A==
X-Received: by 2002:a05:600c:816:b0:40b:5e4a:2345 with SMTP id k22-20020a05600c081600b0040b5e4a2345mr2906566wmp.71.1701703578290;
        Mon, 04 Dec 2023 07:26:18 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id w7-20020a5d6087000000b0033340937da6sm5257341wrt.95.2023.12.04.07.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:26:17 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v2 9/9] oeqa/selftest/recipetool: appendsrc: add test for update mode
Date: Mon,  4 Dec 2023 16:26:03 +0100
Message-ID: <20231204152603.831495-10-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204152603.831495-1-jstephan@baylibre.com>
References: <20231204152603.831495-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 15:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191752

add a basic test for testing the update mode of recipetool
appendsrcfile(s)

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index c55025e7df6..0a82b081a2d 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -1193,6 +1193,34 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
         # A more complex test: existing entry in src_uri with different param
         self.test_recipetool_appendsrcfile_existing_in_src_uri_diff_params(machine='mymachine')
 
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


