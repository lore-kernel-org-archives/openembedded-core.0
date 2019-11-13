Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1D23175E2D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 17:02:37 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b17so2860782wmj.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 09:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mf45DdTgWRs5x5BDGPO5ZG82r/eQAhxp1MbZLLqNFhQ=;
	b=cAUA3dV26YXaF3QTZ4HyoIEtqs3pI/pvi54Lc59B8LGe2315a8maSjErd5emOiDDaG
	hGvxsMWHLLU3SGlu7OpeaTdIyJJMTs5UkGGtE1muIZ0liyrZD20CIvTZ1rsRrH6TGdkh
	15mV870ZhV1rGLexDz5env/eQN2UbX7qPWk5CNculm426XYyRwgxmj1ioGOm9+3unR3z
	6mkgY5oY8PlPOc0zS+9hppkSRZNtzeD3X2TDI9TKQa64mmnizFZlPAVKU/H6GEFocgVl
	0Gks4cNHC1ZjJX8SHpIsN70+ZKCGtkdXshqi7ajDlgVtw6UtVrnoL9I305D+2cXAWIv2
	YxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mf45DdTgWRs5x5BDGPO5ZG82r/eQAhxp1MbZLLqNFhQ=;
	b=oQ1Il/OkJ1p33v4b5Ry8b8ORrATW8/XzP9RKh0834OI8yXGnWLGgy444PxMtOT67Cq
	qNYeNHRz8vhdjNZP+cCfpY6chYYL923kOa4tuPh3fcfwxGtO37NOhRKEGdNgpwkmQ7i9
	lRKoJqPoNc/59U8T1ulRx/6DpNApJP+7kQlxfpdFUP9068WAgpVsds+EiUJ4m3/MECQP
	CvO7ZIecuAh65EVIA3neIaqABQXnyHFuzUUozfEZbuRmU5oqcwM5UcqttV6mhtNqZusV
	BhZ2vsMVp0m71SOfBszXFL2TNcXpeSjcESv0BbelHtuyVFpImC6i0l1QRS4nO+/T7iNR
	Dmvg==
X-Gm-Message-State: APjAAAXkXcOGP8Pqb449LOpG2e3HXgdpFbJsydHKBuMMUVHrCanpuJKI
	jikTIedKQTcXWIcVcQKsWt13ibQO9GI=
X-Google-Smtp-Source: APXvYqzG2iIfbC9ZXjT3TteP96x3EHKt3Bfxx0P4+YtRjOOPAT7UJSdsa0giodlvIoMo+CLqNO3gOg==
X-Received: by 2002:a1c:ab0a:: with SMTP id u10mr3978932wme.0.1573664558339;
	Wed, 13 Nov 2019 09:02:38 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id j3sm3318736wrs.70.2019.11.13.09.02.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 09:02:36 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 17:02:35 +0000
Message-Id: <20191113170235.9907-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v3] cve-check: fetch CVE data once at a time instead of in a single call
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
X-List-Received-Date: Wed, 13 Nov 2019 17:02:38 -0000
Content-Transfer-Encoding: 8bit

This code used to construct a single SQL statement that fetched the NVD data for
every CVE requested.  For recipes such as the kernel where there are over 2000
CVEs to report this can hit the variable count limit and the query fails with
"sqlite3.OperationalError: too many SQL variables".  The default limit is 999
variables, but some distributions such as Debian set the default to 250000.

As the NVD table has an index on the ID column, whilst requesting the data
CVE-by-CVE is five times slower when working with 2000 CVEs the absolute time
different is insignificant: 0.05s verses 0.01s on my machine.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cve-check.bbclass | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index e95716d9ded..19ed5548b3a 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -267,17 +267,17 @@ def get_cve_info(d, cves):
 
     cve_data = {}
     conn = sqlite3.connect(d.getVar("CVE_CHECK_DB_FILE"))
-    placeholders = ",".join("?" * len(cves))
-    query = "SELECT * FROM NVD WHERE id IN (%s)" % placeholders
-    for row in conn.execute(query, tuple(cves)):
-        cve_data[row[0]] = {}
-        cve_data[row[0]]["summary"] = row[1]
-        cve_data[row[0]]["scorev2"] = row[2]
-        cve_data[row[0]]["scorev3"] = row[3]
-        cve_data[row[0]]["modified"] = row[4]
-        cve_data[row[0]]["vector"] = row[5]
-    conn.close()
 
+    for cve in cves:
+        for row in conn.execute("SELECT * FROM NVD WHERE ID IS ?", (cve,)):
+            cve_data[row[0]] = {}
+            cve_data[row[0]]["summary"] = row[1]
+            cve_data[row[0]]["scorev2"] = row[2]
+            cve_data[row[0]]["scorev3"] = row[3]
+            cve_data[row[0]]["modified"] = row[4]
+            cve_data[row[0]]["vector"] = row[5]
+
+    conn.close()
     return cve_data
 
 def cve_write_data(d, patched, unpatched, cve_data):
-- 
2.20.1


