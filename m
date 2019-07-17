Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3F0A27ECE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 10:45:46 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 207so21664466wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 03:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lfPFoX4HvJR9R/nnGjGvAmUDiw6rIPnEWENxuw+SRmE=;
	b=khJyOY/0zzNmf8lXSoBpEbP9w0Ez0hBqk14yCtvnm9m0KMoUYtesGFGeTn9TRpqSQU
	+cSlCIKkgavyJ0U0gEmhPZM1HwkqvJwAsW0GVpGX2hwr9zaDUq1lnGdpoFm2I/W+Ptbw
	cB0DN/xM3AFH8bdhWA9gLxNa1RiSqbUI04p+OSwudfz8wJXDPYX7nZOGBCpBeZEv5YqY
	J5yOTWYavaK/8mvRhyCn365MDSL0wciM4cSc60ZljeOVRPur0RJtup+vXTHpu8wMDP+B
	yDvjHC/zGxcTlWr/cL9M/UanusHuuhd+9YUF4jq8/DYIpRVdg3G5GnW0H1YctrNGfSZB
	/QEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lfPFoX4HvJR9R/nnGjGvAmUDiw6rIPnEWENxuw+SRmE=;
	b=kPuf5eDx2Tz02k11nVGp4jsam25OB7BzYNESRacsSGejhyCvvu3iZRcaTfciimrzdt
	EdFyXFiAgdFPI3U6J29mCPxwsSAa1Ag8c/0xYR0ZhGIWakOlWG/HqT1KZJ8qTHj7x6pI
	7gwGOS+Cyd4u1Gwi6/ZnTaiUgb4faKCqxJlqBeqFMfJCmkY/kvOLfXAQcY94NpuokVtX
	edzKTiRwYIa8yFrWCYwMwzJKLS2Au1pV8oEYgPvijYaBElaworj5UemojTnrDVREVijv
	a8mzMYHjTUyddSPUDA8Fj2IHcVk+Tnmiqy/+ldMrYhSNfxKYSbodBTN80tKX6aMC6DCz
	qFXw==
X-Gm-Message-State: APjAAAWs2N/tAU7iej0AtCTIdAibrtY8vuxmZfycRYpZv0gHGYPO4cqV
	1nWYlG+oJtiAKwaaEiCVdcTJwdJ6koc=
X-Google-Smtp-Source: APXvYqzMNg4FE7h/pP2QZslGBZCrq4ySJ3Mg6NaKkv8k2WLNeq/onZcpAaMd6F2Q3JVu4K9ASKAotg==
X-Received: by 2002:a1c:c14b:: with SMTP id r72mr20444555wmf.166.1563360346667;
	Wed, 17 Jul 2019 03:45:46 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o11sm22822097wmh.37.2019.07.17.03.45.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 17 Jul 2019 03:45:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 11:45:36 +0100
Message-Id: <20190717104538.20990-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] cve-check: allow comparison of Vendor as well as Product
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
X-List-Received-Date: Wed, 17 Jul 2019 10:45:46 -0000
Content-Transfer-Encoding: 8bit

Some product names are too vague to be searched without also matching the
vendor, for example Flex could be the parser compiler we ship, or Adobe Flex, or
Apache Flex, or IBM Flex.

If entries in CVE_PRODUCT contain a colon then split it as vendor:product to improve the search.

Also don't use .format() to construct SQL as that can lead to security
issues. Instead, use ? placeholders and lets sqlite3 handle the escaping.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cve-check.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 2a1381604ad..e8668b25663 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -190,12 +190,16 @@ def check_cves(d, patched_cves):
     import sqlite3
     db_file = d.getVar("CVE_CHECK_DB_FILE")
     conn = sqlite3.connect(db_file)
-    c = conn.cursor()
-
-    query = "SELECT * FROM PRODUCTS WHERE PRODUCT IS '{0}';"
 
     for product in products:
-        for row in c.execute(query.format(product, pv)):
+        c = conn.cursor()
+        if ":" in product:
+            vendor, product = product.split(":", 1)
+            c.execute("SELECT * FROM PRODUCTS WHERE PRODUCT IS ? AND VENDOR IS ?", (product, vendor))
+        else:
+            c.execute("SELECT * FROM PRODUCTS WHERE PRODUCT IS ?", (product,))
+
+        for row in c:
             cve = row[1]
             version_start = row[4]
             operator_start = row[5]
-- 
2.20.1


