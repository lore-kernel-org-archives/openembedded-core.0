Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id BBDAE7F022
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 20:33:23 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id g67so26012586wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 13:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jG6IE2c5pJrCXjYWZfnMOlyX0lyiXgAM+gzZDJT1IC0=;
	b=iv5j58w21Kp6/+2bj+x3QmMdiw7IWYqpPuX7e7P+YKqidN64GgBNY3jyOwxO6zlrMO
	a/kcUTQoGbUFCHmePDDKy97nb78EHqwgMzN6+1qyNlI2CQUp505PvXPjJyEF+GTDfudT
	lE0GlR2FiGoST/RkOWCJn9fvThz4qWlKBuENa3UtSdCWMbIyePEIB1YVUqhgwO0BzWXk
	v5/aSq5Mikj5CdLVblfa8vBmtUyd9gBbMmT6Xr1gyxQaYrSamMYU49tZV02mzjGO8Whz
	Whn6OryHk+uDS6fbKoB5NC1XUJqA0dXO8NTkxH7gm1JLDm0yDCih36kgLkvspVoTKnYU
	Wf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jG6IE2c5pJrCXjYWZfnMOlyX0lyiXgAM+gzZDJT1IC0=;
	b=e2xhUFwXwBXkYQOu3zeHwAJKCzqj0Bv6XlN8GqUMVmBzs5wwdW8m+1RkS6ZsPS3jha
	z40xFQ7+8VTXiuiCmSbg7EBHjdXnqACnAoPIre4d6GJ6BiBzfKWq4e6F4Ca47OvzLc3Z
	fs0i66k+HEYC99FXp5WZuwsPc9tuacNV4k8Y+RH1T78BHrtM+gYrBsp95nUSKq8bAanh
	0Z9SLR2LAdt5l1IPqH0zu6xAY4cTIyhw7r47eOAkZXnuYCh8bRWvwuPb0NmuaW2rS3UF
	5LuTIcqNQg6AItUy7CjAPifwX6+2z1i6s2D2ZCt74nNrtxFC4iQJTcs9WAfJcfcwOvJ9
	xlcQ==
X-Gm-Message-State: APjAAAUgrzmmCtMzvpwqFcKKuMs5Igwk7RZYfVeSYWqvLzSNLfqNiGxo
	S/N1TqN5QxaUw2Ug6QxUuJkIxzDwRYo=
X-Google-Smtp-Source: APXvYqxu0ZI2f90V5BFo8McRhSsdQhCUzLh/7jjo/7mPolZlnzrXl5tGhTKVX9gVMPEgyxDsd0z8ZA==
X-Received: by 2002:a05:600c:2189:: with SMTP id
	e9mr46986179wme.56.1563568404093; 
	Fri, 19 Jul 2019 13:33:24 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z1sm35298988wrp.51.2019.07.19.13.33.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 19 Jul 2019 13:33:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jul 2019 21:33:17 +0100
Message-Id: <20190719203319.20580-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] cve-update-db-native: use executemany() to optimise CPE insertion
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
X-List-Received-Date: Fri, 19 Jul 2019 20:33:24 -0000
Content-Transfer-Encoding: 8bit

Instead of calling execute() repeatedly, rewrite the function to be a generator
and use executemany() for performance.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-core/meta/cve-update-db-native.bb | 85 +++++++------------
 1 file changed, 32 insertions(+), 53 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index cabbde5066c..09e19c0aaef 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -102,70 +102,49 @@ def initialize_db(c):
         VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START TEXT, \
         VERSION_END TEXT, OPERATOR_END TEXT)")
 
-def insert_elt(c, db_values):
-    query = "insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)"
-    c.execute(query, db_values)
-
 def parse_node_and_insert(c, node, cveId):
     # Parse children node if needed
-    try:
-        for child in node['children']:
-            parse_node_and_insert(c, child, cveId)
-    except:
-        pass
-
-    # Exit if the cpe_match node does not exists
-    try:
-        cpe_match = node['cpe_match']
-    except:
-        return
-
-    for cpe in cpe_match:
-        if not cpe['vulnerable']:
-            return
-        cpe23 = cpe['cpe23Uri'].split(':')
-        vendor = cpe23[3]
-        product = cpe23[4]
-        version = cpe23[5]
-
-        if version != '*':
-            # Version is defined, this is a '=' match
-            db_values = [cveId, vendor, product, version, '=', '', '']
-            insert_elt(c, db_values)
-        else:
-            # Parse start version, end version and operators
-            op_start = ''
-            op_end = ''
-            v_start = ''
-            v_end = ''
-
-            try:
-                if cpe['versionStartIncluding']:
+    for child in node.get('children', ()):
+        parse_node_and_insert(c, child, cveId)
+
+    def cpe_generator():
+        for cpe in node.get('cpe_match', ()):
+            if not cpe['vulnerable']:
+                return
+            cpe23 = cpe['cpe23Uri'].split(':')
+            vendor = cpe23[3]
+            product = cpe23[4]
+            version = cpe23[5]
+
+            if version != '*':
+                # Version is defined, this is a '=' match
+                yield [cveId, vendor, product, version, '=', '', '']
+            else:
+                # Parse start version, end version and operators
+                op_start = ''
+                op_end = ''
+                v_start = ''
+                v_end = ''
+
+                if 'versionStartIncluding' in cpe:
                     op_start = '>='
                     v_start = cpe['versionStartIncluding']
-            except:
-                pass
-            try:
-                if cpe['versionStartExcluding']:
+
+                if 'versionStartExcluding' in cpe:
                     op_start = '>'
                     v_start = cpe['versionStartExcluding']
-            except:
-                pass
-            try:
-                if cpe['versionEndIncluding']:
+
+                if 'versionEndIncluding' in cpe:
                     op_end = '<='
                     v_end = cpe['versionEndIncluding']
-            except:
-                pass
-            try:
-                if cpe['versionEndExcluding']:
+
+                if 'versionEndExcluding' in cpe:
                     op_end = '<'
                     v_end = cpe['versionEndExcluding']
-            except:
-                pass
 
-            db_values = [cveId, vendor, product, v_start, op_start, v_end, op_end]
-            insert_elt(c, db_values)
+                yield [cveId, vendor, product, v_start, op_start, v_end, op_end]
+
+    c.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)", cpe_generator())
 
 def update_db(c, json_filename):
     import json
-- 
2.20.1


