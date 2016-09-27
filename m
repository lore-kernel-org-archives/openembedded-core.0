Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 476E76025F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 18:25:19 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b4so2410910wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 11:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Vh6+Os+NhBQaQ0qL2K0M0aqCeG6JA/iSXmJZtDkeXBM=;
	b=O2MXc/wJ2HYfSxBuA+SRCWyzQRJv1C3RY6A5zsTEz+TNvFpvjeuCE8SZUTBArHCF1l
	g9c7K4A+AFg+yRYsFvtgJKrRLvxrkvZGZH8scpx4AOAf9Uwd+aVZnjp0XT4hG0ohcTQt
	AWOFIyB+RJFtYqev6/iw7CRn+NyYiDSb8aVhMUG35VGeF1XRvYK0KIEKyzyG2/zFtXRl
	hYifGdaJzyDkKjZPIFdnCefm3XQvljlU9ByfiS5clLn2YYvTUxQbIzmf86upybSnVZb6
	0LU9vCsmjet0POywjBtHZa4r1n1YZLDvEE7lH+Y8AoBZfstqd+zB7+UJ+xBUCyRpEnCh
	GJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Vh6+Os+NhBQaQ0qL2K0M0aqCeG6JA/iSXmJZtDkeXBM=;
	b=lnqUSrAz2EqDXM9gruX3OqQV4TedxdleMDB+yIwbJymVxJ00lK64AUG3MsCdVQ5O2D
	1aZoMFEJ6Itm0KSS2J24PvZsBg5tSxHREVIrhHGOk6EbnAkQek1V9sMbK39rsvOH7j7O
	KSfg0QnWmNpKrAPSywPvVr+jbg3vPOtrwiyH2ft/naSFRB1b7rtOX/OlUeEouGanmWaj
	vQG2F3K8Bmsp6kc7MOVmgCQWbcKtCl2ipm/uaEaovQzOaXsM4XxBN6fVZuA89keeRXIQ
	EcDZv10K3cBxeRM3PyuDQX2gne/bzzTM7/v/bfvyOBhaBY0NCMKbU2NKtOsqZO5ngddk
	gWDQ==
X-Gm-Message-State: AA6/9RmlpHkzWl+xR3OA6u1I+Q6a+NpdS6Mts+wVf6LZpWp6HbCWdtJUl1SeiYc9FiuTxw==
X-Received: by 10.28.101.214 with SMTP id z205mr4390910wmb.123.1475000719888; 
	Tue, 27 Sep 2016 11:25:19 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	bj8sm3963823wjc.49.2016.09.27.11.25.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Sep 2016 11:25:18 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2016 11:25:09 -0700
Message-Id: <1475000709-32040-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] recipetool: newappend: drop _provide_to_pn
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Sep 2016 18:25:19 -0000

From: Christopher Larson <chris_larson@mentor.com>

This function was broken by the multi-config changes, and isn't needed anymore
now that recipeutils.pn_to_recipe can handle provides. Without this, the
newappend sub-command fails.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/lib/recipetool/newappend.py | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/scripts/lib/recipetool/newappend.py b/scripts/lib/recipetool/newappend.py
index 4fbb40a..fbdd7bc 100644
--- a/scripts/lib/recipetool/newappend.py
+++ b/scripts/lib/recipetool/newappend.py
@@ -39,16 +39,6 @@ def tinfoil_init(instance):
     tinfoil = instance
 
 
-def _provide_to_pn(cooker, provide):
-    """Get the name of the preferred recipe for the specified provide."""
-    import bb.providers
-    filenames = cooker.recipecache.providers[provide]
-    eligible, foundUnique = bb.providers.filterProviders(filenames, provide, cooker.expanded_data, cooker.recipecache)
-    filename = eligible[0]
-    pn = cooker.recipecache.pkg_fn[filename]
-    return pn
-
-
 def _get_recipe_file(cooker, pn):
     import oe.recipeutils
     recipefile = oe.recipeutils.pn_to_recipe(cooker, pn)
@@ -70,8 +60,7 @@ def layer(layerpath):
 def newappend(args):
     import oe.recipeutils
 
-    pn = _provide_to_pn(tinfoil.cooker, args.target)
-    recipe_path = _get_recipe_file(tinfoil.cooker, pn)
+    recipe_path = _get_recipe_file(tinfoil.cooker, args.target)
 
     rd = tinfoil.config_data.createCopy()
     rd.setVar('FILE', recipe_path)
-- 
2.8.0


