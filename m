Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id A8852780EC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 14:59:27 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z45so13213731wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 07:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UXOH1wowpbzITHqw8NwnvEhRN3CfTY0e6DSIINmJyfU=;
	b=hylIol8M+KeoZZMDcP/xdK3aqqRRxrqbdW5kBZ+jD+E+v94q/WCAXZq2jc75WQs+KS
	eqFjfuBxr/TyEi6UL6jYrivirxIJI2rs5cVuE3EQmMuNfzDeiC2clJqzQTdQ1NAHT+lm
	o37QmJz9tq1y1OJ9r39ufKg4gf4WyN9XsOInEy3bGCBn59WngOttX2cN9aQ4FJ5b/4rl
	yuNhYHYo5mC9VO1AQFFd3jpzYGsY7zeVzbwg22/imdRnpovF+lSu5bcwfyxGk/2pvrXF
	NDbn7HXyXIubKuJtv74uMi+0pKOumhwe4GUYzWRO6DUk8ysP44rI8ADdYC856wCglZ7q
	kRaQ==
X-Gm-Message-State: AKS2vOyH5vFhQ1jPd1SlG1eRYHoHnxw3bW1bOg0m+ioIvtOAqQZuuK0P
	zzZgT1KUQRJApzqt+KI=
X-Received: by 10.28.92.130 with SMTP id q124mr1096240wmb.21.1498229968641;
	Fri, 23 Jun 2017 07:59:28 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	b94sm4041008wrd.40.2017.06.23.07.59.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Jun 2017 07:59:27 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Jun 2017 15:59:24 +0100
Message-Id: <20170623145924.21097-3-git@andred.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170623145924.21097-1-git@andred.net>
References: <20170623145924.21097-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 3/3] copyleft_filter.bbclass: restore possiblity to filter on type
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
X-List-Received-Date: Fri, 23 Jun 2017 14:59:27 -0000
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


