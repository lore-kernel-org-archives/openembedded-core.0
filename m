Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6EA7D71B1D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 16:18:00 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id y8so2512575wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 08:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fh6ueIyO9H/jb+GRh2P9bwqDzLV8PP4yCWHQJW2a1sk=;
	b=sFsRhlf1w2iOXdSW8W5mhVUU5uuUUV6grZSbBvcA0/p6onCJBEJ0feFPC8p2ClB6pq
	n0xv9PIDc9RpYOMfL+cY+oOT6cfREybCyDGjYSQ6OwYolPYsnoTNuYRwabV120ggsPvA
	B1brxlKAeRWzSY9dy+SLsw6+SBasaTOqmaiR8umOQjbO5/SIjhb2cqo7zV1lAHfU+jOf
	HZZdjSJgkDJjPVZhC0Vyir53Jqkh9UJmA5QgU8RYj1/IFs4Ly9/3S7RAwspE6awpTAtA
	2dckV9fVQy/eQ8zhc9D/skWq7bRcS74ycZSXjQyJahqqd5uV9r1bRlMClWlFiTsUZCad
	9cag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fh6ueIyO9H/jb+GRh2P9bwqDzLV8PP4yCWHQJW2a1sk=;
	b=SituIQ1oBYCe5z+UQzeLDZ2jNk7qFPAsRUz+LkbmAYGI/SdQCh132qY2tfwFiuOkv8
	CeoVAsR/LgOt4xowrWyjQg9OK6qo7IST+Fc1Q6bi0Bp67Y80gbfSAlXng3P5Y/fj+5Ui
	N5Ny3R1r/QLiojuNeU7Y3Ra3yn3cFvHLDPPygwbJa3Y6F5ix/xf/isuWzPbulYBW2+TP
	bUjsrJMTNfUjKb1WoXEwacIm6s+AzJSrvehl8KEIWpKdYp9RcuC2CfsW9sWBo6Ux3jnq
	TLQWdXxMmd9y9cO+LupFZyM+f6omIKRXTwrPQ9zh+YnmIc810DF97GuSJuJf6qPhBZes
	yzZQ==
X-Gm-Message-State: AJcUukdO3SZ91T7QwkOkgInbaT0MO1rcb58zNgPNxRyslbfRO89+tfso
	hNrNdp+q6UqGe2MBxyDnGxgpy1To
X-Google-Smtp-Source: ALg8bN6VmSyNvjmBnwSuCL2YnCH35AJdYF9S5Qtmfkd1YcXC/uPPvPSxICMfc/JXh3T9OhlIupfMhw==
X-Received: by 2002:a1c:b14:: with SMTP id 20mr3411542wml.103.1548260280829;
	Wed, 23 Jan 2019 08:18:00 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm161192189wre.91.2019.01.23.08.17.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jan 2019 08:18:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jan 2019 17:17:43 +0100
Message-Id: <20190123161744.45763-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190123161744.45763-1-alex.kanavin@gmail.com>
References: <20190123161744.45763-1-alex.kanavin@gmail.com>
Subject: [PATCH 09/10] lib/oe/reciputils.py: parallelize upstream version checks
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
X-List-Received-Date: Wed, 23 Jan 2019 16:18:00 -0000

Previously this was done via bitbake tasks, and when this
was rewritten to a for loop, performance sufered significantly:
from 90 seconds to about 12 minutes for oe-core. This change
restores the previous run time, and makes it possible
to perform such checks with command line utilities in an
interactive way.

Implementation note: we have to create a copy of the recipe
data, as Tinfoil API can't be used from multiple threads
and only allows one process to access the data at a time.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oe/recipeutils.py | 77 +++++++++++++++++++++++++++-----------
 1 file changed, 56 insertions(+), 21 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 39d3de4bb1f..92c0f65257f 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1020,8 +1020,54 @@ def get_recipe_upstream_version(rd):
 
     return ru
 
+def _get_recipe_upgrade_status(data):
+    uv = get_recipe_upstream_version(data)
+
+    pn = data.getVar('PN')
+    cur_ver = uv['current_version']
+
+    upstream_version_unknown = data.getVar('UPSTREAM_VERSION_UNKNOWN')
+    if not uv['version']:
+        status = "UNKNOWN" if upstream_version_unknown else "UNKNOWN_BROKEN"
+    else:
+        cmp = vercmp_string(uv['current_version'], uv['version'])
+        if cmp == -1:
+            status = "UPDATE" if not upstream_version_unknown else "KNOWN_BROKEN"
+        elif cmp == 0:
+            status = "MATCH" if not upstream_version_unknown else "KNOWN_BROKEN"
+        else:
+            status = "UNKNOWN" if upstream_version_unknown else "UNKNOWN_BROKEN"
+
+    next_ver = uv['version'] if uv['version'] else "N/A"
+    revision = uv['revision'] if uv['revision'] else "N/A"
+    maintainer = data.getVar('RECIPE_MAINTAINER')
+    no_upgrade_reason = data.getVar('RECIPE_NO_UPDATE_REASON')
+
+    return (pn, status, cur_ver, next_ver, maintainer, revision, no_upgrade_reason)
+
 def get_recipe_upgrade_status(recipes=None):
     pkgs_list = []
+    data_copy_list = []
+    copy_vars = ('SRC_URI',
+                 'PV',
+                 'GITDIR',
+                 'DL_DIR',
+                 'PN',
+                 'CACHE',
+                 'PERSISTENT_DIR',
+                 'BB_URI_HEADREVS',
+                 'UPSTREAM_CHECK_COMMITS',
+                 'UPSTREAM_CHECK_GITTAGREGEX',
+                 'UPSTREAM_CHECK_REGEX',
+                 'UPSTREAM_CHECK_URI',
+                 'UPSTREAM_VERSION_UNKNOWN',
+                 'RECIPE_MAINTAINER',
+                 'RECIPE_NO_UPDATE_REASON',
+                 'RECIPE_UPSTREAM_VERSION',
+                 'RECIPE_UPSTREAM_DATE',
+                 'CHECK_DATE',
+            )
+
     with bb.tinfoil.Tinfoil() as tinfoil:
         tinfoil.prepare(config_only=False)
 
@@ -1043,28 +1089,17 @@ def get_recipe_upgrade_status(recipes=None):
                 bb.note(" Skip package %s as upstream check unreliable" % pn)
                 continue
 
-            uv = get_recipe_upstream_version(data)
-
-            pn = data.getVar('PN')
-            cur_ver = uv['current_version']
-
-            upstream_version_unknown = data.getVar('UPSTREAM_VERSION_UNKNOWN')
-            if not uv['version']:
-                status = "UNKNOWN" if upstream_version_unknown else "UNKNOWN_BROKEN"
-            else:
-                cmp = vercmp_string(uv['current_version'], uv['version'])
-                if cmp == -1:
-                    status = "UPDATE" if not upstream_version_unknown else "KNOWN_BROKEN"
-                elif cmp == 0:
-                    status = "MATCH" if not upstream_version_unknown else "KNOWN_BROKEN"
-                else:
-                    status = "UNKNOWN" if upstream_version_unknown else "UNKNOWN_BROKEN"
+            data_copy = bb.data.init()
+            for var in copy_vars:
+                data_copy.setVar(var, data.getVar(var))
+            for k in data:
+                if k.startswith('SRCREV'):
+                    data_copy.setVar(k, data.getVar(k))
 
-            next_ver = uv['version'] if uv['version'] else "N/A"
-            revision = uv['revision'] if uv['revision'] else "N/A"
-            maintainer = data.getVar('RECIPE_MAINTAINER')
-            no_upgrade_reason = data.getVar('RECIPE_NO_UPDATE_REASON')
+            data_copy_list.append(data_copy)
 
-            pkgs_list.append((pn, status, cur_ver, next_ver, maintainer, revision, no_upgrade_reason))
+    from concurrent.futures import ProcessPoolExecutor
+    with ProcessPoolExecutor(max_workers=utils.cpu_count()) as executor:
+        pkgs_list = executor.map(_get_recipe_upgrade_status, data_copy_list)
 
     return pkgs_list
-- 
2.17.1


