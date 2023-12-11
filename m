Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2572C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 17:01:55 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.329.1702314107664222914
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 09:01:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=K0umi1fS;
 spf=pass (domain: baylibre.com, ip: 209.85.208.54, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-54da61eb366so6316610a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 09:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1702314105; x=1702918905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hb/xRNBoBwhGI47H2boklsAwez6yYnOtj72NwzIRAMA=;
        b=K0umi1fSpLw1j9sTLO66xe1y9grZi0lrKA23T/Sa1UDs0ZFmznkx0s8mc8bY2rG8V6
         lMNK6sz49uEX2dXhiHE+bWaJcMfmxwz+rXwwEakS/5SBj3HHQ86sX906DG8FEFcnw7sS
         d2u4R4qFBS2z7VjHnl/MccgONGP4T+6PomLXng7pYMh2/G5xT8DruP9BgE0zMTfJ1eQA
         l9d3k5H0hOI+Z/FY7laU1CBu14VAu+sMVQSM+PRsCZbMh+5IcWE5fEoe/440efJ6SR1g
         VGxjM8G2ypzQHVLcKRcw5hguY3ODJ+RpXR8rhqSBQP2/Ce6nuzRJ4iKoA86Jtvg/q+Ur
         qFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702314105; x=1702918905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hb/xRNBoBwhGI47H2boklsAwez6yYnOtj72NwzIRAMA=;
        b=fSLsKD+Bm8qGtRcPRwQDAdUVQSgmKLtrMyIWNpmWD2nRcqXc0sydq02o1XTxt8lIyT
         1ofqrM4Kv8wHZ4kQEwyUdgs7BVnTjD85xHAeFRqkaXihW2pfyScdIkAlgiKbb290aL5o
         OCLxXUNVAy5sV0M+xYu9Apuub3O2NSyP3taLgvXfXCjJ1r8rt8aQmxgOyIWDWnyEBuuV
         4wNn1HzQ6+h61EQMCjXwtXdh5UxBRa80EQy0RkwPcnyxXrZ/Mdhfw3+2Kq6naUr4rL9y
         vEu7DC5YBrj3OCQ5i+fMYuJ81IJ/9UBoTjxCo6gBxxFNj0KV/hAibv3K2S/l7NBhdpkp
         7XEA==
X-Gm-Message-State: AOJu0Yy2C/hsXkHD2PQRnLW2p+j0/dqS/G/aSok1UuoJA4TiF6ZTmNim
	TYn9Aa7Ej8wVsD32sJ2vPSFjiKH/fcBJLG25+hEt5A==
X-Google-Smtp-Source: AGHT+IHPkB+guju5ppM0Dwa9jHG+0HgsTvfFvxIXVOWq7CkYyQwxjJKed8sXuN+kqsmFidhhNR7OCA==
X-Received: by 2002:a17:906:4ece:b0:a19:a19b:c70b with SMTP id i14-20020a1709064ece00b00a19a19bc70bmr2832559ejv.91.1702314104755;
        Mon, 11 Dec 2023 09:01:44 -0800 (PST)
Received: from jstephan-bl.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id mn6-20020a1709077b0600b00a1dbda310f4sm5060879ejc.158.2023.12.11.09.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 09:01:44 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [OE-core][PATCH] oeqa/selftest/recipetool: fix metadata corruption on meta layer
Date: Mon, 11 Dec 2023 18:01:38 +0100
Message-ID: <20231211170138.2554156-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 17:01:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192182

[YOCTO #15314]

test_recipetool_appendsrcfile_update_recipe_basic is using base-files as
test recipe but modifies it directly which can corrupt metadata for other
tests relying on this recipe.

So use mtd-utils-selftest as test recipe from meta-selftest to avoid
this kind of issues

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
depends on https://lists.openembedded.org/g/openembedded-core/message/192176
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index c7f7a066f3a..d7719da70e3 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -1260,23 +1260,16 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
         self.test_recipetool_appendsrcfile_existing_in_src_uri_diff_params(machine='mymachine')
 
     def test_recipetool_appendsrcfile_update_recipe_basic(self):
-        testrecipe = "base-files"
+        testrecipe = "mtd-utils-selftest"
         recipefile = get_bb_var('FILE', testrecipe)
-        result = runCmd('bitbake-layers show-layers')
-        layerrecipe = None
-        for line in result.output.splitlines()[3:]:
-            layer = line.split()[1]
-            if layer in recipefile:
-                layerrecipe = layer
-                break
-        self.assertTrue(layerrecipe, 'Unable to find the layer containing %s' % testrecipe)
-        cmd = 'recipetool appendsrcfile -u %s %s %s' % (layerrecipe, testrecipe, self.testfile)
+        self.assertIn('meta-selftest', recipefile, 'This test expect %s recipe to be in meta-selftest')
+        cmd = 'recipetool appendsrcfile -W -u meta-selftest %s %s' % (testrecipe, self.testfile)
         result = runCmd(cmd)
         self.assertNotIn('Traceback', result.output)
         self.add_command_to_tearDown('cd %s; rm -f %s/%s; git checkout .' % (os.path.dirname(recipefile), testrecipe, os.path.basename(self.testfile)))
 
         expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
-                           ('??', '.*/%s/%s/%s$' % (testrecipe, testrecipe, os.path.basename(self.testfile)))]
+                           ('??', '.*/%s/%s$' % (testrecipe, os.path.basename(self.testfile)))]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
         result = runCmd('git diff %s' % os.path.basename(recipefile), cwd=os.path.dirname(recipefile))
         removelines = []
-- 
2.43.0


