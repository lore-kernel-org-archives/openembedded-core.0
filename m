Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C48BC41513
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 18:22:50 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.316.1721240561464283615
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 11:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dN0eHnnQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-367ab50a07aso14712f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 11:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721240560; x=1721845360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=69fcwcZEUKmUl8CGjBbiiCEWPKiT3PFxyEVSfOxcHcU=;
        b=dN0eHnnQt2/oSeKaj7JJzByPphFwliQw3HmcVH85DNxpcQ8GLMjvUmlyQZdZy5bsU0
         hpw7cuWwKQdLRf268NgETJqE6JyRLq5bsjPS1D5FoPcfJ4uR0DAxNKI9pvKhU61hSIRW
         tgQTqFhX7OS8aWU33KPaNDUUaB3oPHeb3mZwR9rQwqvvaqXsMZxSAghTpp/Z7Si394GM
         zLK4yECgFYeGba2iaFcX3MjAeq5TXTF8DBeomFkVSuGqsoB2FAJzUUwY0UUrwSTwafZy
         0NZ1a6knsbgoco2f9UkdjipIMRS/919P4OHnP88RYjMXgV5p5fupRsKmsfdwlhhR1qds
         aIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721240560; x=1721845360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=69fcwcZEUKmUl8CGjBbiiCEWPKiT3PFxyEVSfOxcHcU=;
        b=siaUdG1t36vcNw17YrDT3CEVvNgOAOk19V7kNv6tIEZ4PcPY6JqB2Sk1iEtBqZvvrB
         mAN3kEe9BEZPTo9Spb2VO11H9y9klJX54MxdZ7Gu7N1beb2a/8dR3UM8Y9rgwxYdTlA4
         DFqteB0DSknA8nWoYHzya2dJ4XAzLo1lEcbXISfzm98WY5c9hrBWexCdXj7WNyHpctDe
         lO1oQmqovwu+JRalV9zHMAuBbWedffWFGUQcnf7EA33rNpfjMjba0ssbQTuY8hqLziNf
         U7QnObEmihxV/nzOzVbVXRxgH8SjT0BsywouAbBXXYD1UVGq35I2k9N/0KsM2HjmjFc9
         NjFA==
X-Gm-Message-State: AOJu0YylzSRPyo5qVuS2hLGqgXCvEIZmH5OZkv9r9mx5jKMClZkyYB3a
	0zcGR6YKMqRDBD6sHO+ZdhDpMpWK5m6NzEYexpAMQSVhUzYtmnPPIYTS8g==
X-Google-Smtp-Source: AGHT+IFkOuHZC9NtswA91NyhQLVEQ9Cu+aPXqf4D3PceLEtAKPPI2GuSC4eWzvKNAPMH8NTEUbrscQ==
X-Received: by 2002:a05:6000:c8e:b0:367:8a87:ada2 with SMTP id ffacd0b85a97d-36831659bfcmr1617435f8f.26.1721240559543;
        Wed, 17 Jul 2024 11:22:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db0489csm12421868f8f.104.2024.07.17.11.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 11:22:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/4] lib/recipeutils: add a function to determine recipes with shared include files
Date: Wed, 17 Jul 2024 20:22:14 +0200
Message-Id: <20240717182216.1661015-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717182216.1661015-1-alex.kanavin@gmail.com>
References: <20240717182216.1661015-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 18:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202172

From: Alexander Kanavin <alex@linutronix.de>

This functionality is needed for 'lockstep version upgrades' where several
recipes need to be upgraded at the same time to produce a buildable
outcome.

The function itself obtains BBINCLUDED for each recipe and then massages
the data until it takes the form of a list of sets:

[{'cmake','cmake-native'},
 {'qemu','qemu-native','qemu-system-native'},
... ]

There's also a selftest that checks for the above.

Unfortunately this won't detect mutually exclusive recipes like mesa and mesa-gl
as they're chosen with PREFERRED_PROVIDER and can't be enabled in the same build
at the same time. ('devtool upgrade' will also accept just one of them but not the other)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oe/recipeutils.py                 | 37 ++++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/distrodata.py | 12 +++++++
 2 files changed, 49 insertions(+)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index f9d7dfe253a..7586332fe0c 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1183,3 +1183,40 @@ def get_recipe_upgrade_status(recipes=None):
         pkgs_list = executor.map(_get_recipe_upgrade_status, data_copy_list)
 
     return pkgs_list
+
+def get_common_include_recipes():
+    with bb.tinfoil.Tinfoil() as tinfoil:
+        tinfoil.prepare(config_only=False)
+
+        recipes = tinfoil.all_recipe_files(variants=False)
+
+        recipeincludes = {}
+        for fn in recipes:
+            data = tinfoil.parse_recipe_file(fn)
+            recipeincludes[fn] = {'bbincluded':data.getVar('BBINCLUDED').split(),'pn':data.getVar('PN')}
+        return _get_common_include_recipes(recipeincludes)
+
+def _get_common_include_recipes(recipeincludes_all):
+        recipeincludes = {}
+        for fn,data in recipeincludes_all.items():
+            bbincluded_filtered = [i for i in data['bbincluded'] if os.path.dirname(i) == os.path.dirname(fn) and i != fn]
+            if bbincluded_filtered:
+                recipeincludes[data['pn']] = bbincluded_filtered
+
+        recipeincludes_inverted = {}
+        for k,v in recipeincludes.items():
+            for i in v:
+                recipeincludes_inverted.setdefault(i,set()).add(k)
+
+        recipeincludes_inverted_filtered = {k:v for k,v in recipeincludes_inverted.items() if len(v) > 1}
+
+        recipes_with_shared_includes = list()
+        for v in recipeincludes_inverted_filtered.values():
+            recipeset = v
+            for v1 in recipeincludes_inverted_filtered.values():
+                if recipeset.intersection(v1):
+                    recipeset.update(v1)
+            if recipeset not in recipes_with_shared_includes:
+                recipes_with_shared_includes.append(recipeset)
+
+        return recipes_with_shared_includes
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index b60913dbca4..bc561605220 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -115,3 +115,15 @@ The list of oe-core recipes with maintainers is empty. This may indicate that th
                 self.fail("""
 Unable to find recipes for the following entries in maintainers.inc:
 """ + "\n".join(['%s' % i for i in missing_recipes]))
+
+    def test_common_include_recipes(self):
+        """
+        Summary:     Test that obtaining recipes that share includes between them returns a sane result
+        Expected:    At least cmake and qemu entries are present in the output
+        Product:     oe-core
+        Author:      Alexander Kanavin <alex.kanavin@gmail.com>
+        """
+        recipes = oe.recipeutils.get_common_include_recipes()
+
+        self.assertIn({'qemu-system-native', 'qemu', 'qemu-native'}, recipes)
+        self.assertIn({'cmake-native', 'cmake'}, recipes)
-- 
2.39.2


