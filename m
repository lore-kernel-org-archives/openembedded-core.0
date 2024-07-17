Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B5B9C3DA62
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 18:22:50 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.317.1721240562006271089
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 11:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JERQv/Wa;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-36844375001so14622f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 11:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721240560; x=1721845360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bU06XgkugksKhEWVpJGRNjs8HkpCMYrJK4WwAGkWESk=;
        b=JERQv/WaGvREaVWv5VMbBgW9Ggf+KhGnwBTZJJMXX8oRPlbwmNf7pWuNDETZkxhRqZ
         KRzi+dY0qd1EowQA3y27xSri7h3tDy+DrRcSbsLz3ZLKNfNKGsnhhi09VVHyD5B5lG/i
         e0kUBBWBx+dAhTQYTh9qsMxJCDDhr80TCHUgHyYg4OWwLIUzDfWZYMcgPiFM+KjIdjpS
         S9Rdvfqn1xVcxSXPqJVXLeaq+ZcZmr/LK2415RgB7uZiLvoYl5k3lQUeng1w69auwY+J
         SMPGIVZhV1g2+XNENjEZFisgrelTG7K0ZHSDw1oLkN5PWHVJVgNGdc5lhmX8xPQqwhwm
         3Heg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721240560; x=1721845360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bU06XgkugksKhEWVpJGRNjs8HkpCMYrJK4WwAGkWESk=;
        b=Vqx2BBwea+RSDmTj4S85zxE1GfExig+id7gdHYq3cg8nYCJPW8rapj+ba1MgqKVUqe
         syI/N0+7txy/VjyrEDbZaVcR+dF7ifJnHuzYE+agU/ZJO1YUBh2AeJivr0UOkVr/9QpB
         WmKUjsrClshRhkSLj7500huxnjNOlrHIMdunnRnMOclIjth2g1qkEldghNGTldAJHgCO
         QFz1QusBVLx8+63W8m9PzN4P6jWqLc9X0BNetI1mDzuysltPSigxiSzhBocZJpPjoA6n
         T/02QOOV4XtwO5jz4tTmx19uqJljv82a2F1zznpgM3h7d9z5LL6X0q7yZN+NfB4Jb7nv
         REEg==
X-Gm-Message-State: AOJu0YxlTSZ2IT41vHg0BOjMkUqgMq9CbP+HgruzkxsPKSUR6BO9lPab
	kGxR6nWpB0ie0pb9hfqh+AVOlRL3Rp79CNl7ijGly89d7+550zcB71aX3A==
X-Google-Smtp-Source: AGHT+IHpB1O5iFF2IvCaIcGW5Vum+E5EAG64xw/u5HEta6oa6ojBlQXWVjK5ask/KKIn92Zxa/aACg==
X-Received: by 2002:a5d:4843:0:b0:367:4e1a:240e with SMTP id ffacd0b85a97d-3683175d0cemr1736090f8f.50.1721240560093;
        Wed, 17 Jul 2024 11:22:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db0489csm12421868f8f.104.2024.07.17.11.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 11:22:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/4] recipeutils/get_recipe_upgrade_status: group recipes when they need to be upgraded together
Date: Wed, 17 Jul 2024 20:22:15 +0200
Message-Id: <20240717182216.1661015-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717182216.1661015-1-alex.kanavin@gmail.com>
References: <20240717182216.1661015-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 18:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202174

From: Alexander Kanavin <alex@linutronix.de>

This will allow 'lockstep upgrades' of such recipes, improving success
rates in automated version updating process.

devtool check-upgrade-status now prints:

These recipes need to be upgraded together {
glib-2.0                  2.80.2          2.80.4          Anuj Mittal <anuj.mittal@intel.com>
glib-2.0-initial          2.80.2          2.80.4          Anuj Mittal <anuj.mittal@intel.com>
}
These recipes need to be upgraded together {
util-linux                2.39.3          2.40.2          Chen Qi <Qi.Chen@windriver.com>
util-linux-libuuid        2.39.3          2.40.2          Chen Qi <Qi.Chen@windriver.com>
}
These recipes need to be upgraded together {
cmake                     3.29.3          3.30.0          Unassigned <unassigned@yoctoproject.org>
cmake-native              3.29.3          3.30.0          Unassigned <unassigned@yoctoproject.org>
}

etc.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oe/recipeutils.py                 | 23 +++++++++++++++++-
 meta/lib/oeqa/selftest/cases/distrodata.py |  6 ++---
 scripts/lib/devtool/upgrade.py             | 28 +++++++++++++++-------
 3 files changed, 44 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 7586332fe0c..56be75dc9c9 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1154,6 +1154,7 @@ def get_recipe_upgrade_status(recipes=None):
         if not recipes:
             recipes = tinfoil.all_recipe_files(variants=False)
 
+        recipeincludes = {}
         for fn in recipes:
             try:
                 if fn.startswith("/"):
@@ -1178,11 +1179,13 @@ def get_recipe_upgrade_status(recipes=None):
 
             data_copy_list.append(data_copy)
 
+            recipeincludes[data.getVar('FILE')] = {'bbincluded':data.getVar('BBINCLUDED').split(),'pn':data.getVar('PN')}
+
     from concurrent.futures import ProcessPoolExecutor
     with ProcessPoolExecutor(max_workers=utils.cpu_count()) as executor:
         pkgs_list = executor.map(_get_recipe_upgrade_status, data_copy_list)
 
-    return pkgs_list
+    return _group_recipes(pkgs_list, _get_common_include_recipes(recipeincludes))
 
 def get_common_include_recipes():
     with bb.tinfoil.Tinfoil() as tinfoil:
@@ -1220,3 +1223,21 @@ def _get_common_include_recipes(recipeincludes_all):
                 recipes_with_shared_includes.append(recipeset)
 
         return recipes_with_shared_includes
+
+def _group_recipes(recipes, groups):
+    recipedict = {}
+    for r in recipes:
+        recipedict[r['pn']] = r
+
+    recipegroups = []
+    for g in groups:
+        recipeset = []
+        for r in g:
+            if r in recipedict.keys():
+                recipeset.append(recipedict[r])
+                del recipedict[r]
+        recipegroups.append(recipeset)
+
+    for r in recipedict.values():
+        recipegroups.append([r])
+    return recipegroups
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index bc561605220..bd375523649 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -20,10 +20,10 @@ class Distrodata(OESelftestTestCase):
         feature = 'LICENSE_FLAGS_ACCEPTED += " commercial"\n'
         self.write_config(feature)
 
-        pkgs = oe.recipeutils.get_recipe_upgrade_status()
+        pkggroups = oe.recipeutils.get_recipe_upgrade_status()
 
-        regressed_failures = [pkg['pn'] for pkg in pkgs if pkg['status'] == 'UNKNOWN_BROKEN']
-        regressed_successes = [pkg['pn'] for pkg in pkgs if pkg['status'] == 'KNOWN_BROKEN']
+        regressed_failures = [pkg['pn'] for pkgs in pkggroups for pkg in pkgs if pkg['status'] == 'UNKNOWN_BROKEN']
+        regressed_successes = [pkg['pn'] for pkgs in pkggroups for pkg in pkgs if pkg['status'] == 'KNOWN_BROKEN']
         msg = ""
         if len(regressed_failures) > 0:
             msg = msg + """
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 10b4f8b5ee5..4c268af3a7c 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -654,18 +654,28 @@ def latest_version(args, config, basepath, workspace):
     return 0
 
 def check_upgrade_status(args, config, basepath, workspace):
+    def _print_status(recipe):
+        print("{:25} {:15} {:15} {} {} {}".format(   recipe['pn'],
+                                                               recipe['cur_ver'],
+                                                               recipe['status'] if recipe['status'] != 'UPDATE' else (recipe['next_ver'] if not recipe['next_ver'].endswith("new-commits-available") else "new commits"),
+                                                               recipe['maintainer'],
+                                                               recipe['revision'] if recipe['revision'] != 'N/A' else "",
+                                                               "cannot be updated due to: %s" %(recipe['no_upgrade_reason']) if recipe['no_upgrade_reason'] else ""))
     if not args.recipe:
         logger.info("Checking the upstream status for all recipes may take a few minutes")
     results = oe.recipeutils.get_recipe_upgrade_status(args.recipe)
-    for result in results:
-        # pn, update_status, current, latest, maintainer, latest_commit, no_update_reason
-        if args.all or result['status'] != 'MATCH':
-            print("{:25} {:15} {:15} {} {} {}".format(   result['pn'],
-                                                               result['cur_ver'],
-                                                               result['status'] if result['status'] != 'UPDATE' else (result['next_ver'] if not result['next_ver'].endswith("new-commits-available") else "new commits"),
-                                                               result['maintainer'],
-                                                               result['revision'] if result['revision'] != 'N/A' else "",
-                                                               "cannot be updated due to: %s" %(result['no_upgrade_reason']) if result['no_upgrade_reason'] else ""))
+    for recipegroup in results:
+        upgrades = [r for r in recipegroup if r['status'] != 'MATCH']
+        currents = [r for r in recipegroup if r['status'] == 'MATCH']
+        if len(upgrades) > 1:
+            print("These recipes need to be upgraded together {")
+        for r in upgrades:
+            _print_status(r)
+        if len(upgrades) > 1:
+            print("}")
+        for r in currents:
+            if args.all:
+                _print_status(r)
 
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
-- 
2.39.2


