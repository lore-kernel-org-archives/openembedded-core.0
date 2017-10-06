Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9B2FE7823D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 12:13:17 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m72so2558089wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 05:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=aKg/jXMVfnvf7ewlENtxRT2wc2+HaC5rtOBINajAKtw=;
	b=J/mJvRT96rYZwRzuWybTqR4qYKCpXkZQrakRvk31xIbtkqHPDZtIbVkGnM//n7zkxd
	e+F9ek0Hgs3tOu2mbhMqmeSPzwRecVxBzyxhIfIG+74DK2g9kGIYsZUWwikHjaBjsQ+i
	WIk2thjeMgXvFxIjlh/vtjrZrNYkz0At9PwdyvpbkTuNSV3lG5DPHzOANasf2VjoRZ+F
	wpHyZs5ivI854nc9lrSIZ3eYna7CfLPJ75XccEz8RudrVMfMeflPGmJN6RLoGqTb6Nju
	qsks+aQMI7dB0w1Iq3kIZhT0OEVJPwW2tPLebvLJW3SuIGzPfZLK/eqemKT11bOiYG+c
	L8fg==
X-Gm-Message-State: AMCzsaXyIxLQHOwkuNnHE7DbVXTEMnBHJnHq48GXHYi6Ku+gRbb+bc6W
	YdY+yVMHtOhjaJz0Q2stGKCVbk6/
X-Google-Smtp-Source: AOwi7QBBuNswBdsoml18avxvDQ1118zAsctzLmy0oYmh/LK7223/ZjFG5aR5IiAKqCgMEBcNmSwrXA==
X-Received: by 10.28.7.82 with SMTP id 79mr1532970wmh.4.1507291998132;
	Fri, 06 Oct 2017 05:13:18 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id r15sm994045wrc.30.2017.10.06.05.13.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 05:13:17 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Oct 2017 13:12:49 +0100
Message-Id: <20171006121259.5817-8-git@andred.net>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006121259.5817-1-git@andred.net>
References: <20171006121259.5817-1-git@andred.net>
MIME-Version: 1.0
Subject: [pyro][PATCH 07/17] copyleft_filter.bbclass: restore possiblity to filter on type
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
X-List-Received-Date: Fri, 06 Oct 2017 12:13:18 -0000
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
Signed-off-by: Ross Burton <ross.burton@intel.com>

(cherry picked from commit e612dfa520c7d7ecf58006e82189be601204f38d)
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
2.14.2


