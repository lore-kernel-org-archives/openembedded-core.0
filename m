Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C18C10F04
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:57:01 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.102656.1701788213495136709
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 06:56:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=hhieskrC;
 spf=pass (domain: baylibre.com, ip: 209.85.221.42, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-333536432e0so1254565f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701788211; x=1702393011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWxlOCe/hdZJ+F4EXIapSccS7y66VxWLnP8DNmgSPhk=;
        b=hhieskrCtctJ0z4F23zHM8RGuuhi4FIwZLjZxXWxKEFqsI0yydMpMRRq/Y+deUj7Jy
         IUqG8r5Pbf98TJN2+Zzlmu0g4kGGYsqU77dmlJLg5KB+EGiNIjvrHpIIKTH0aNBptt5N
         FZNBNSQxS77l+h0VHk9ytBG/eEbDXFzgF1nA0EgEoXxYdOynYU1KL+ZnXYGYzSIXWHzD
         ExcsLNnNf3twDmmnVjzQHE7z0Irl94tY1QYsXEN8D+IuurMeez9oQ53EsVVKOkaiiogc
         eTdiForgjPUlk5377fBpCpj6npNAVQbvtxFGnDLpvTpBXe8Y/fbeKZKbV7ZmM9lUzGxD
         qxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701788211; x=1702393011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWxlOCe/hdZJ+F4EXIapSccS7y66VxWLnP8DNmgSPhk=;
        b=Fc26lKlWa5vRjb+oiv3X6UEHQVyJV1UIGHm6G44rHOqcPIYqucUXqqb1hq/UPeDrsO
         N2xeojpZ5y+DUErxMohzC4xZ9xdoq3byPZkeBHXIFveEALl+k6Wsw+fwL2lXSpYa8uU9
         CvSAg21bBDaE4j1l5YPW/ReYpcebHDJuAd/ysBCvAIiT8PJIfODXp/AmSF2zEWtNXULh
         dObu7laCCM6Rr7L8DQRvNwx0yAe3aocTj0l0qIiEjO9gUcCCGc7YjQdEdO+KsfiVSeuz
         Al3/0BouTXNN8pA/TVX9nbPV62qIIQjSaGsnDlG/PJewWFRqHHPObOcFSZkcOKqGv23g
         UWrg==
X-Gm-Message-State: AOJu0YxRF9OLhJh335G9YazanZbsBJnAN4HzbOMzpO8RNJL3wGYPmYbM
	AYOiwvcGeMD1GUoLRjXEpNeMIbfI9tS2J7DNr3ISUQ==
X-Google-Smtp-Source: AGHT+IHjd7laiQRpDSj4svFiM+ryDThwFRRLvubMJLczmo9sOmodxKFem9rBkDR9gywjOFobvXUQQA==
X-Received: by 2002:a05:600c:452:b0:40b:5e1c:5c1d with SMTP id s18-20020a05600c045200b0040b5e1c5c1dmr548228wmb.50.1701788211533;
        Tue, 05 Dec 2023 06:56:51 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id cp6-20020a056000400600b003334520e49bsm6750082wrb.53.2023.12.05.06.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 06:56:51 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 10/10] oeqa/selftest/recipetool: appendsrc: add test for update mode
Date: Tue,  5 Dec 2023 15:56:36 +0100
Message-ID: <20231205145636.960819-11-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205145636.960819-1-jstephan@baylibre.com>
References: <20231205145636.960819-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 14:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191839

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


