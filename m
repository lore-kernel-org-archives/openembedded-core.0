Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D280577AA9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 08:18:39 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 131so164561wmq.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 01:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UXOH1wowpbzITHqw8NwnvEhRN3CfTY0e6DSIINmJyfU=;
	b=GSvWczkSueMkOer6QKM2A9uehXqz9unTAH3WmA5PBQdfxCZKRGZ8JE1uiSGIO24nJy
	kX78c5EpjvDH6FEGbcZCG3JwKyst3niK+qqAm1IASTJbsk8z+xEKcTTWlXNLCY4WriCX
	Kar/Jj+3eiPIX9/tYmVHi2aJ005IxpkVn4mMwhatpN2jjZtRuDLGMJvnLuHF63uRWVxQ
	QtGAwGx3eMm4josiCJuxuuwsshQc4XYgi0v6iujuFxPFOeF8YVsEVb42RD1OIDeSnZQU
	T+0NCJCtl/PEyr0usV2Qk1EwJ36xj3XD68eGKjjLFSC/vPN5p63aB8/lZ0Daid/ZP553
	yOXQ==
X-Gm-Message-State: AKS2vOyTTET2kblEww8pdJirV2IIGqPO00bgbNyTvlTrxE/LFJ0JzpQx
	n+XhA5VtIWHapBKsUhQ=
X-Received: by 10.80.225.8 with SMTP id h8mr16387053edl.21.1498465119911;
	Mon, 26 Jun 2017 01:18:39 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 2sm6954245edt.66.2017.06.26.01.18.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 01:18:39 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jun 2017 09:18:34 +0100
Message-Id: <20170626081834.23832-3-git@andred.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170626081834.23832-1-git@andred.net>
References: <20170623145924.21097-1-git@andred.net>
	<20170626081834.23832-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 3/3] copyleft_filter.bbclass: restore possiblity to filter on type
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
X-List-Received-Date: Mon, 26 Jun 2017 08:18:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

Since the changes introduced in ae9102bda398
("copyleft_filter.bbclass: Allow to filter on name"), it is
impossible to filter on the recipe type, all recipes are
treated as though they should be included if the license
matches, irrespective of the COPYLEFT_RECIPE_TYPES
variable.

Fix this.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/classes/copyleft_filter.bbclass | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/classes/copyleft_filter.bbclass b/meta/classes/copyleft_filter.bbclass
index 5867bb9f7e..c36bce431a 100644
--- a/meta/classes/copyleft_filter.bbclass
+++ b/meta/classes/copyleft_filter.bbclass
@@ -47,27 +47,27 @@ def copyleft_should_include(d):
     import oe.license
     from fnmatch import fnmatchcase as fnmatch
 
-    included, motive = False, 'recipe did not match anything'
-
     recipe_type = d.getVar('COPYLEFT_RECIPE_TYPE')
     if recipe_type not in oe.data.typed_value('COPYLEFT_RECIPE_TYPES', d):
-        include, motive = False, 'recipe type "%s" is excluded' % recipe_type
+        included, motive = False, 'recipe type "%s" is excluded' % recipe_type
+    else:
+        included, motive = False, 'recipe did not match anything'
 
-    include = oe.data.typed_value('COPYLEFT_LICENSE_INCLUDE', d)
-    exclude = oe.data.typed_value('COPYLEFT_LICENSE_EXCLUDE', d)
+        include = oe.data.typed_value('COPYLEFT_LICENSE_INCLUDE', d)
+        exclude = oe.data.typed_value('COPYLEFT_LICENSE_EXCLUDE', d)
 
-    try:
-        is_included, reason = oe.license.is_included(d.getVar('LICENSE'), include, exclude)
-    except oe.license.LicenseError as exc:
-        bb.fatal('%s: %s' % (d.getVar('PF'), exc))
-    else:
-        if is_included:
-            if reason:
-                included, motive = True, 'recipe has included licenses: %s' % ', '.join(reason)
-            else:
-                included, motive = False, 'recipe does not include a copyleft license'
+        try:
+            is_included, reason = oe.license.is_included(d.getVar('LICENSE'), include, exclude)
+        except oe.license.LicenseError as exc:
+            bb.fatal('%s: %s' % (d.getVar('PF'), exc))
         else:
-            included, motive = False, 'recipe has excluded licenses: %s' % ', '.join(reason)
+            if is_included:
+                if reason:
+                    included, motive = True, 'recipe has included licenses: %s' % ', '.join(reason)
+                else:
+                    included, motive = False, 'recipe does not include a copyleft license'
+            else:
+                included, motive = False, 'recipe has excluded licenses: %s' % ', '.join(reason)
 
     if any(fnmatch(d.getVar('PN'), name) \
             for name in oe.data.typed_value('COPYLEFT_PN_INCLUDE', d)):
-- 
2.11.0


