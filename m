Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05BDCC3DA60
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 18:22:51 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.320.1721240561767405306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 11:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EMv6eiVC;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so14701fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 11:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721240559; x=1721845359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vXI9Aog+t6CCsaSLBhYJScPX0YQX6T/lzu75FrjzTRI=;
        b=EMv6eiVCJQ10qsXeAWNtW8faS0Hy9mO4AN6vIUq5Oainkxv2SjZPIXqBtaWyU8O0nO
         VCRLXyTBE01ecoLFB3aVhfn/FhaA8L8QFP10iXBJKhbcq4AMiaLsSFk5TYj72ZgCDpQF
         ygAWIZ85sj2Rn34OV2QX/KAxXurfyXcLYRwI9hhta5fRxoru6G6Yrz5RoPJFahKpKrB6
         wpesf9S+9LEawmCYTBMyBZGn32fSr7iMImCGWteLGktpNcLYBJulY/EAj2//WGMC9zXE
         nW30bNhpVmbyIRl93M3crdw+x5lLnK7N1mThVC4sTmzZ3CBkt0W/HwijvnO5GRLqurCU
         2Kwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721240559; x=1721845359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXI9Aog+t6CCsaSLBhYJScPX0YQX6T/lzu75FrjzTRI=;
        b=lSpYVb1EB4h44UKvm2+lxspBuqiWd6R1f3dh8iBVDQFz6wY1hY4bcRaOCGq2GDN1U5
         te9bxszWUFaTr2Pyy/cufzINYbeg0oz+Q99lZLQjZ6V/i7pzGkJpGngH2QEXsRSu0NL+
         jASLitc8Ir1r1BSsXZS2ZC20XFrSCorekj2Hiq0B3Ew6fHHjZxLubNgB3ttUxiuBAptg
         emP+D/yelARMNaV9gC8RoZvGEGYvUaXRaGex6jnZOLKtcbn9ATNh8le9a1Iltjyx2f/Y
         I9Dlge43MpoR5FbWb/7JZjGuZm0Ig1NbznklOu/i1yrNfHyOTO/ayFh+7G+LEXf+JJi1
         6Pew==
X-Gm-Message-State: AOJu0YzAG81/tn4wwqX40clcDEmiRAJivItlx7xJHLgWtsEXjR6PtcTb
	ZShYx9UY7Y0P972NQjiXrC7Vc9D9CgC2B7LPDdZoj9p6YEXbUQYci8nEjw==
X-Google-Smtp-Source: AGHT+IH2WFXH1KfQtQSd3NaDQNlBsxDR1DtVvzla6DTTPwigfDobz1gPXBxuYRTSLAjZ8h1komLWBg==
X-Received: by 2002:a05:6512:280d:b0:52e:954d:3592 with SMTP id 2adb3069b0e04-52ee5446158mr1629790e87.46.1721240558998;
        Wed, 17 Jul 2024 11:22:38 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db0489csm12421868f8f.104.2024.07.17.11.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 11:22:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/4] lib/oe/recipeutils: return a dict in get_recipe_upgrade_status() instead of a tuple
Date: Wed, 17 Jul 2024 20:22:13 +0200
Message-Id: <20240717182216.1661015-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 18:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202173

From: Alexander Kanavin <alex@linutronix.de>

Putting various things in a tuple is an anti-pattern of sorts, as the consumers
have to unpack it into local variables for readability, or access items directly
with indexes, which makes code pretty much unreadable.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oe/recipeutils.py                 |  2 +-
 meta/lib/oeqa/selftest/cases/distrodata.py |  4 ++--
 scripts/lib/devtool/upgrade.py             | 14 +++++++-------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 2d69a331132..f9d7dfe253a 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1112,7 +1112,7 @@ def _get_recipe_upgrade_status(data):
     maintainer = data.getVar('RECIPE_MAINTAINER')
     no_upgrade_reason = data.getVar('RECIPE_NO_UPDATE_REASON')
 
-    return (pn, status, cur_ver, next_ver, maintainer, revision, no_upgrade_reason)
+    return {'pn':pn, 'status':status, 'cur_ver':cur_ver, 'next_ver':next_ver, 'maintainer':maintainer, 'revision':revision, 'no_upgrade_reason':no_upgrade_reason}
 
 def get_recipe_upgrade_status(recipes=None):
     pkgs_list = []
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index ad952c004b5..b60913dbca4 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -22,8 +22,8 @@ class Distrodata(OESelftestTestCase):
 
         pkgs = oe.recipeutils.get_recipe_upgrade_status()
 
-        regressed_failures = [pkg[0] for pkg in pkgs if pkg[1] == 'UNKNOWN_BROKEN']
-        regressed_successes = [pkg[0] for pkg in pkgs if pkg[1] == 'KNOWN_BROKEN']
+        regressed_failures = [pkg['pn'] for pkg in pkgs if pkg['status'] == 'UNKNOWN_BROKEN']
+        regressed_successes = [pkg['pn'] for pkg in pkgs if pkg['status'] == 'KNOWN_BROKEN']
         msg = ""
         if len(regressed_failures) > 0:
             msg = msg + """
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 8e13833b51c..10b4f8b5ee5 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -659,13 +659,13 @@ def check_upgrade_status(args, config, basepath, workspace):
     results = oe.recipeutils.get_recipe_upgrade_status(args.recipe)
     for result in results:
         # pn, update_status, current, latest, maintainer, latest_commit, no_update_reason
-        if args.all or result[1] != 'MATCH':
-            print("{:25} {:15} {:15} {} {} {}".format(   result[0],
-                                                               result[2],
-                                                               result[1] if result[1] != 'UPDATE' else (result[3] if not result[3].endswith("new-commits-available") else "new commits"),
-                                                               result[4],
-                                                               result[5] if result[5] != 'N/A' else "",
-                                                               "cannot be updated due to: %s" %(result[6]) if result[6] else ""))
+        if args.all or result['status'] != 'MATCH':
+            print("{:25} {:15} {:15} {} {} {}".format(   result['pn'],
+                                                               result['cur_ver'],
+                                                               result['status'] if result['status'] != 'UPDATE' else (result['next_ver'] if not result['next_ver'].endswith("new-commits-available") else "new commits"),
+                                                               result['maintainer'],
+                                                               result['revision'] if result['revision'] != 'N/A' else "",
+                                                               "cannot be updated due to: %s" %(result['no_upgrade_reason']) if result['no_upgrade_reason'] else ""))
 
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
-- 
2.39.2


