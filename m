Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id DD7067F639
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:35:52 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z26so2468132wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=j1IWFqB7azBIn6DpZdrm8PijAFQZ1TpqjFaEslwaegg=;
	b=obr23LC/2Xk9MzStUHX0DZymqmy+oLgN4BDHgyK/FiNY37BcmQytjVttr6QS16HJNQ
	gf8Nhw+CnFYZl/EgTEnJ3kRk8NVvY17zf69hFIDaHQweE1TVycxmppdQB0A1FD+yPVlZ
	JmDOF8o+3fUlttkh+Glp5rxjBPMY1DmV1p2mzW+tPfYuOBLo57ChymEibZu4IgDNo3ir
	PXsIYvwED4ZM4Ij6+z7W2j14Sc6Gaj/6bfpWpDxB1hFfIDKNoQCrBUJxLcaxTR81Ynrd
	wCy75/Kd4dsJLO0DDWYlKbgPM+FRNt2Wfx4vw6bVZm8I7UmFpwBiMHtapsu+EFeTrsZU
	BeUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=j1IWFqB7azBIn6DpZdrm8PijAFQZ1TpqjFaEslwaegg=;
	b=UXO0pxXX6l4MDdgxLGCuPCmCjyMYeWsfzUPu2LZogZUw25eFgPAxcPEKnveVgHQKb6
	C34NOkOWe7IbCmmIHpCvdHUjjSV2bh2YsiyiT/h/2Jg6BFbnFvRMjhAtuxodRiB2bWbx
	qJgTGRkjxFYFnSOD4qeANMo3KiW1tfDfxujaJGZL5Nr34ZdpF0+FppwC2q5cNu/SfEPX
	SrsLcQbJZ3y0oMfewaEndyhvtoclNGVdD0eBnJKxjK/wqiZy2qlQGJ4XV5Fs4u7GiA30
	JGusgmKE9PCiflVfysfqS/vO6pfd1IhUXDhreUAwsZasf+JNidgZAMOlBWkxrcz80hjE
	9OTQ==
X-Gm-Message-State: APjAAAWQHXDURJVDygqXkBmGwxnksCfs7q/VkpT11D4KBzxrlE9+oixA
	iC56PFr4NXRG3OCNH2yxZNK7OePgCxU=
X-Google-Smtp-Source: APXvYqzc92eOIY+P4WkcKKR4Wtz6zw3ardLe0sKoS62VKTGULox0Q1y71datRu2P4NBy6AEatj5BgQ==
X-Received: by 2002:a05:600c:2202:: with SMTP id
	z2mr3245714wml.162.1573659353318; 
	Wed, 13 Nov 2019 07:35:53 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id z8sm3116812wrp.49.2019.11.13.07.35.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 07:35:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 15:35:48 +0000
Message-Id: <20191113153548.8644-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] cve-check: fetch CVE data once at a time instead of in a single call
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
X-List-Received-Date: Wed, 13 Nov 2019 15:35:53 -0000
Content-Transfer-Encoding: 8bit

This code used to construct a single SQL statement that fetched the NVD data for
every CVE requested.  For recipes such as the kernel where there are over 2000
CVEs to report this can hit limits in older sqlite releases and the query fails
with "sqlite3.OperationalError: too many SQL variables".

As the NVD table has an index on the ID column, whilst requesting the data
CVE-by-CVE is five times slower when working with 2000 CVEs the absolute time
different is insignificant: 0.05s verses 0.01s on my machine.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cve-check.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index e95716d9ded..f23f683ae80 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -267,17 +267,17 @@ def get_cve_info(d, cves):
 
     cve_data = {}
     conn = sqlite3.connect(d.getVar("CVE_CHECK_DB_FILE"))
-    placeholders = ",".join("?" * len(cves))
-    query = "SELECT * FROM NVD WHERE id IN (%s)" % placeholders
-    for row in conn.execute(query, tuple(cves)):
+
+    for cve in cves:
+        row = conn.execute("SELECT * FROM NVD WHERE ID IS ?", (cve,)).fetchone()
         cve_data[row[0]] = {}
         cve_data[row[0]]["summary"] = row[1]
         cve_data[row[0]]["scorev2"] = row[2]
         cve_data[row[0]]["scorev3"] = row[3]
         cve_data[row[0]]["modified"] = row[4]
         cve_data[row[0]]["vector"] = row[5]
-    conn.close()
 
+    conn.close()
     return cve_data
 
 def cve_write_data(d, patched, unpatched, cve_data):
-- 
2.20.1


