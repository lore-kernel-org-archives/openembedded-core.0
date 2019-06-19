Return-Path: <lemagoup@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2DC757E73A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 14:00:18 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id h19so4706131wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 07:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=vg/vuVgtVTwwzchzlxFsEw97m/YaozkS6pJo3atuSYk=;
	b=Y3PsVHPifX7WhK3q2fOS+33GMVlF3OgMTyZ58xPrC/F3Ir6eoTXDhqLUGdRdop9x4H
	OgDOJue/Jv2dVipPD3fCm+gSd7YaDVZQ5N43L8ygPte5fczEB/4M7LUHJTKHGl9aWmgU
	RGmMrTpuLz+6beBHbO++s3jpoL+1j5x0ayf2FFBgH8tV3vzlCCqR2f2pR5EthfqIM7oy
	R6c5/ROvvA4Yn1RnCg+H/tJUU8ecggeZNfPxLEexUJjrFOfmXs5KCXh3hEzB8Ya3NWer
	ipaKESPtJ0WxUipYZDu7rK6ddXss+Z1ETiyCpGjhCUz64uX2g44CwmIyUNBOWySjU32D
	XP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vg/vuVgtVTwwzchzlxFsEw97m/YaozkS6pJo3atuSYk=;
	b=S7ND4IqZmUeFt6WelQpJOtqJdWfxsjrOXLBlUqrBYVOFyet4LFpwblS7t6taVGkK3Q
	X1+XIvZoyP40NSU/jVgNZyv+NZ46N1e2ylLtSFvG8he1ctFUIbwv6+ydvbgV5GHK6J5E
	yqkP+JCLV4rM5HBVvj/uNQ7kVl/UHiBNC7c9GzF4uwsV6ydgGqwo/NueWsq2KfJ+2YS/
	n6HhoXTs/o6vvR4VjVEZ2nlFDYS1+71fMziyM/YzKe3bRDjK1OoLDtv4t6twEGh1gm8l
	JCpGVEKucqaufY5KB5dbhN6+griX8to05rv7wz+dflBGBlV0lb7E08SdysoRNqGwbUfu
	nnhA==
X-Gm-Message-State: APjAAAXZhUARyOufX4qVK78rAwxotqO3GBVvtmLHzj35RToaasoNV1ih
	EcjApoMT3dowIpd1Jw8GsJLZvzzo
X-Google-Smtp-Source: APXvYqwDXddlRcQACY+cGbXZmm1giaGQY8MQOiS5J6HpnePhe6wi7uuSLXWoyM414W3QpV0ST07ILw==
X-Received: by 2002:a7b:c7d7:: with SMTP id z23mr8828283wmk.46.1560952818326; 
	Wed, 19 Jun 2019 07:00:18 -0700 (PDT)
Received: from localhost.localdomain
	(softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu.
	[158.255.112.194]) by smtp.gmail.com with ESMTPSA id
	g131sm924905wmf.37.2019.06.19.07.00.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jun 2019 07:00:11 -0700 (PDT)
From: Pierre Le Magourou <lemagoup@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 15:59:37 +0200
Message-Id: <20190619135940.18544-1-lemagoup@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/4] cve-update-db: New recipe to update CVE database
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
X-List-Received-Date: Wed, 19 Jun 2019 14:00:18 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

cve-check-tool-native do_populate_cve_db task was using deprecated NVD
xml data feeds, cve-update-db uses NVD json data feeds.

Sqlite database schema was updated to take into account CVSSv3 CVE
scores and operator in affected product versions.
A new META table was added to store the last modification date of the
NVD json data feeds.

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
---
 meta/recipes-core/meta/cve-update-db.bb | 121 ++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100644 meta/recipes-core/meta/cve-update-db.bb

diff --git a/meta/recipes-core/meta/cve-update-db.bb b/meta/recipes-core/meta/cve-update-db.bb
new file mode 100644
index 0000000000..522fd23807
--- /dev/null
+++ b/meta/recipes-core/meta/cve-update-db.bb
@@ -0,0 +1,121 @@
+SUMMARY = "Updates the NVD CVE database"
+LICENSE = "MIT"
+
+INHIBIT_DEFAULT_DEPS = "1"
+PACKAGES = ""
+
+inherit nopackages
+
+deltask do_fetch
+deltask do_unpack
+deltask do_patch
+deltask do_configure
+deltask do_compile
+deltask do_install
+deltask do_populate_sysroot
+
+python do_populate_cve_db() {
+    """
+    Update NVD database with json data feed
+    """
+
+    import sqlite3, urllib3, shutil, gzip, re
+    from datetime import date
+
+    BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
+    YEAR_START = 2002
+    JSON_TMPFILE = d.getVar("CVE_CHECK_DB_DIR") + '/nvd.json.gz'
+
+    # Connect to database
+    db_file = d.getVar("CVE_CHECK_DB_FILE")
+    conn = sqlite3.connect(db_file)
+    c = conn.cursor()
+
+    initialize_db(c)
+
+    http = urllib3.PoolManager()
+
+    for year in range(YEAR_START, date.today().year + 1):
+        year_url = BASE_URL + str(year)
+        meta_url = year_url + ".meta"
+        json_url = year_url + ".json.gz"
+
+        # Retrieve meta last modified date
+        with http.request('GET', meta_url, preload_content=False) as r:
+            date_line = str(r.data.splitlines()[0])
+            last_modified = re.search('lastModifiedDate:(.*)', date_line).group(1)
+
+        # Compare with current db last modified date
+        c.execute("select DATE from META where YEAR = '%d'" % year)
+        meta = c.fetchone()
+        if not meta or meta[0] != last_modified:
+            # Update db with current year json file
+            with http.request('GET', json_url, preload_content=False) as r, open(JSON_TMPFILE, 'wb') as tmpfile:
+                shutil.copyfileobj(r, tmpfile)
+            with gzip.open(JSON_TMPFILE, 'rt') as jsonfile:
+                update_db(c, jsonfile)
+            c.execute("insert or replace into META values (?, ?)",
+                    [year, last_modified])
+
+    conn.commit()
+    conn.close()
+
+    with open(d.getVar("CVE_CHECK_TMP_FILE"), 'a'):
+        os.utime(d.getVar("CVE_CHECK_TMP_FILE"), None)
+}
+
+# DJB2 hash algorithm
+def hash_djb2(s):
+    hash = 5381
+    for x in s:
+        hash = (( hash << 5) + hash) + ord(x)
+
+    return hash & 0xFFFFFFFF
+
+def initialize_db(c):
+    c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DATE TEXT)")
+    c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY TEXT, \
+        SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
+    c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (HASH INTEGER UNIQUE, ID TEXT, \
+        VENDOR TEXT, PRODUCT TEXT, VERSION TEXT, OPERATOR TEXT)")
+    c.execute("CREATE INDEX IF NOT EXISTS PRODUCT_IDX ON PRODUCTS \
+        (PRODUCT, VERSION)")
+
+def update_db(c, json_filename):
+    import json
+    root = json.load(json_filename)
+
+    for elt in root['CVE_Items']:
+        if not elt['impact']:
+            continue
+
+        cveId = elt['cve']['CVE_data_meta']['ID']
+        cveDesc = elt['cve']['description']['description_data'][0]['value']
+        date = elt['lastModifiedDate']
+        accessVector = elt['impact']['baseMetricV2']['cvssV2']['accessVector']
+        cvssv2 = elt['impact']['baseMetricV2']['cvssV2']['baseScore']
+
+        try:
+            cvssv3 = elt['impact']['baseMetricV3']['cvssV3']['baseScore']
+        except:
+            cvssv3 = 0.0
+
+        c.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?)",
+                [cveId, cveDesc, cvssv2, cvssv3, date, accessVector])
+
+        for vendor in elt['cve']['affects']['vendor']['vendor_data']:
+            for product in vendor['product']['product_data']:
+                for version in product['version']['version_data']:
+                    product_str = cveId+vendor['vendor_name']+product['product_name']+version['version_value']
+                    hashstr = hash_djb2(product_str)
+                    c.execute("insert or replace into PRODUCTS values (?, ?, ?, ?, ?, ?)",
+                            [ hashstr, cveId, vendor['vendor_name'],
+                                product['product_name'], version['version_value'],
+                                version['version_affected']])
+
+
+
+addtask do_populate_cve_db before do_cve_check
+do_populate_cve_db[nostamp] = "1"
+
+EXCLUDE_FROM_WORLD = "1"
-- 
2.11.0


