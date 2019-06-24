Return-Path: <lemagoup@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id F22617C786
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 09:45:13 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id f15so3256428wrp.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 02:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Nz+qw8YINT7m0KTKJQ6jdPYXn5sOUaF48BbqKu/w+eI=;
	b=U7IF3G66xAfXTDtbn76dfPpZC14pBJJwHeQBmyHUIdhF3noub90S3ajLMK2LyIF1a1
	47Cr+bnGB9LdgNkYwpfdAr5D5/aI2vnqRmUht0NX2uE3hj02+G/XwWkq+NP0NZdP3K+8
	Mt472ZeIupqG9XOlAS6QkmqaTE9aRfcMYWrbDCQqopE7zK/ha7SY+OMoQo09ESWapH47
	VH3JGscnE8DcscawxWbx7vGThOjJ1uDuc+TEg8a6k0RT9E4i3ohzkVg1Fh/sC8lMkj5p
	27CJYb7Bgk6VwnpiQZDX9clM/YgHaq9QIX2SG7f/jgOPbF8APB40hDQeeq+0zy+1LebU
	WZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Nz+qw8YINT7m0KTKJQ6jdPYXn5sOUaF48BbqKu/w+eI=;
	b=pVDyCgOd/YBRw1AGLUIFF+5rKgd7JZR5sCncySogJRvRjYz9QJUyg9ueRPoJlMNd6K
	mykgIdpGnQn9E2ZYdvQs6pG/IQz+Qzv22E4lOwjO9IzvJVvIqaFoV3C6+TxoHK5M1+8B
	Uk1kS6fkU5o2VVV5d4ULRN3VlrZeyYMx5cbQyYCXom32Gop1knd5gJJnnpOkMQVOfzJi
	sn+u0bVHVSn6F8/q0N8uryIrAPSg9XDic/+xlr7AVr8OcfMKtVOVwamMCy0L3y+UT2lI
	+BzQhLGKMXwgSCYvcKOqgQjvvxNUeeQbQqpVHQSXHMIt3ApuumKV24y8HXxQc39z6Dv2
	zAjA==
X-Gm-Message-State: APjAAAWX4kY2P7ULtivXBZoE5aldmWGit4rSc5ER1WjWVjG9QdYPQQao
	ogItZBXny5HdIWCkOUAO1n6lEW5/
X-Google-Smtp-Source: APXvYqyfMEBBBcmT1muDCpbHm/ZbySzQqeRReY9anSVQ0FXae+kE8Ti+eNtL0CCHIH/3igNlfqzl9w==
X-Received: by 2002:a05:6000:114b:: with SMTP id
	d11mr41857291wrx.167.1561369514278; 
	Mon, 24 Jun 2019 02:45:14 -0700 (PDT)
Received: from localhost.localdomain
	(softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu.
	[158.255.112.194]) by smtp.gmail.com with ESMTPSA id
	o20sm11716313wro.65.2019.06.24.02.45.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jun 2019 02:45:13 -0700 (PDT)
From: Pierre Le Magourou <lemagoup@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jun 2019 11:44:38 +0200
Message-Id: <20190624094438.7596-1-lemagoup@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] cve-update-db: Use std library instead of urllib3
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
X-List-Received-Date: Mon, 24 Jun 2019 09:45:14 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

urllib3 was used in this recipe but it was not set as a
dependency. As it is not specifically needed, rewrite the recipe with
urllib from the standard library.

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
---
 meta/recipes-core/meta/cve-update-db.bb | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db.bb b/meta/recipes-core/meta/cve-update-db.bb
index 522fd23807..1f48820cc6 100644
--- a/meta/recipes-core/meta/cve-update-db.bb
+++ b/meta/recipes-core/meta/cve-update-db.bb
@@ -19,7 +19,7 @@ python do_populate_cve_db() {
     Update NVD database with json data feed
     """
 
-    import sqlite3, urllib3, shutil, gzip, re
+    import sqlite3, urllib, shutil, gzip, re
     from datetime import date
 
     BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
@@ -33,16 +33,14 @@ python do_populate_cve_db() {
 
     initialize_db(c)
 
-    http = urllib3.PoolManager()
-
     for year in range(YEAR_START, date.today().year + 1):
         year_url = BASE_URL + str(year)
         meta_url = year_url + ".meta"
         json_url = year_url + ".json.gz"
 
         # Retrieve meta last modified date
-        with http.request('GET', meta_url, preload_content=False) as r:
-            date_line = str(r.data.splitlines()[0])
+        with urllib.request.urlopen(meta_url) as r:
+            date_line = str(r.read().splitlines()[0])
             last_modified = re.search('lastModifiedDate:(.*)', date_line).group(1)
 
         # Compare with current db last modified date
@@ -50,7 +48,7 @@ python do_populate_cve_db() {
         meta = c.fetchone()
         if not meta or meta[0] != last_modified:
             # Update db with current year json file
-            with http.request('GET', json_url, preload_content=False) as r, open(JSON_TMPFILE, 'wb') as tmpfile:
+            with urllib.request.urlopen(json_url) as r, open(JSON_TMPFILE, 'wb') as tmpfile:
                 shutil.copyfileobj(r, tmpfile)
             with gzip.open(JSON_TMPFILE, 'rt') as jsonfile:
                 update_db(c, jsonfile)
-- 
2.11.0


