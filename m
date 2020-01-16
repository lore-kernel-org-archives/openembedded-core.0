Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6CC4A7F959
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:21:09 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z124so10021648pgb.13
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gxXju7FHcV6HZ9f4Ik3KCyjSDfLoiNM3yYPrnhht+J8=;
	b=DJmhA7A6jannkQftiDc0LbBLcGtNvQj1Cso/6Eeeqri4XdIlzxMZw0T1Kyuv0BFKAV
	oayyQnx8VByISiqgmP+mEd95cKTxX15EuwPwve91AoP+a5q+S4hLqdmGO6q9Q/ZQC1Ir
	XeLkDJTMQWYfE7xun1iZcowwxEIKZeQWwGhnJlFfNbmCgwjysZL+4b/FSi0m8YQxV/tW
	cz3+7DB/dExOYBrqAvs5hQLMhTl5BI93gXExszPi2EH95udZDV+LcU24und4hPqffth4
	uhwWoLA+YtqIumMI1rUclT4hA5K7Sobx1NEa3dyxRhTAT3Zc0+iN6KBBMiYZHFhgHUtt
	Al5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gxXju7FHcV6HZ9f4Ik3KCyjSDfLoiNM3yYPrnhht+J8=;
	b=oG3FqHgJIAH0x5GVIymeqdTKzo5n15uKF2krK2BJFhHtGWnZ2O8CLMC111guBUIJL6
	644BJYyr4+bgo1WxMoVhq83W/M26qJWitZkg/7kniL22ftpUIRVYcoaOHE71kaz7fF0i
	fSuQ2SpAuGCL5lSea04rz9iNTfFBRZoZ2yqSUoBRrVehLZhZasDZiyBEZVDkxfN+dAcV
	Lgw9U8LmbUcO2sNBTtF0PSiefSPkMahM/BJf9bYO4DpS2ze8v8H88Jtp1JD4jXchUWjT
	5MBHx5vbbdW2+62PHYmwzcx2oRz+b4p2wTfcAD71bTe+0HK0nEagGeIo9EbQ7EHSmTYf
	aj3g==
X-Gm-Message-State: APjAAAX/kY3qAQPSpxQdxGCdRrtRZQkbJs/ZeJ54CPrVW4Xw12IYicZA
	VIQzuUcL48LXO/kstWDgUOzhwjp1
X-Google-Smtp-Source: APXvYqwJx5I/BozCd+xxpR9Ef+aG5imk7jKDOljtz/0vspTX939sEMkXnrEKU4paz20zqbmvZ90L6Q==
X-Received: by 2002:a63:a707:: with SMTP id d7mr38657162pgf.93.1579188070402; 
	Thu, 16 Jan 2020 07:21:10 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.21.09
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:21:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:36 -0800
Message-Id: <0f5b748a5b7fec41bac16bbc1346230e86bb99e3.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 27/32] cve-check: fetch CVE data once at a time instead of in a single call
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
X-List-Received-Date: Thu, 16 Jan 2020 15:21:09 -0000

From: Ross Burton <ross.burton@intel.com>

This code used to construct a single SQL statement that fetched the NVD data for
every CVE requested.  For recipes such as the kernel where there are over 2000
CVEs to report this can hit the variable count limit and the query fails with
"sqlite3.OperationalError: too many SQL variables".  The default limit is 999
variables, but some distributions such as Debian set the default to 250000.

As the NVD table has an index on the ID column, whilst requesting the data
CVE-by-CVE is five times slower when working with 2000 CVEs the absolute time
different is insignificant: 0.05s verses 0.01s on my machine.

(From OE-Core rev: 53d0cc1e9b7190fa66d7ff1c59518f91b0128d99)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index e95716d9de..19ed5548b3 100644
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
2.17.1


