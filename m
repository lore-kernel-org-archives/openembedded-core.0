Return-Path: <ross.burton@intel.com>
Received: from mail-wj0-f182.google.com (mail-wj0-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id A026060017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 16:50:43 +0000 (UTC)
Received: by mail-wj0-f182.google.com with SMTP id tg4so111473529wjb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2016 08:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=orUCJQY2AyGDI8JPgcP6cq+uGV7GUN5hTC77FL+5fTc=;
	b=ZJGUH60wBG89/tihYkuzyMLy7mxkXaHutwQIxsLB5of/nauGqJbYeVdxoqEhnp8+0c
	WPBTXuH2fm3GaK+dIcnj6+VTag1KRNyC0ne0RxAKLKWRARH/C7JtvcuvxPvGl5EVghmb
	hX31qOTBpzMsXtYpm2VNzUGFjZFxvMNeaMs477fOZgp4VfqvIYkAyfPWbCzVLiXpRIA/
	Eofrz45wZqQmTRes3THUqWuCPBGSannr5yWIYhlmTWBOexqnmn5W7Rwmzz+rZC8FCv1f
	kQpwaPUWnLWh/GhoaKEj+Kl/NqMRbEVaz4byFwxb36mFRwEV8laEIIrhdccn6iU1AAAw
	PYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=orUCJQY2AyGDI8JPgcP6cq+uGV7GUN5hTC77FL+5fTc=;
	b=FHeE2DXgttmMk8hLP5g5JsOlx7d4hqcFVQdTIJIbXBIyy5r7t6SIvHKcXdFHnNzS3w
	Q+de+rkijFo3zEVtxaQyD6qXNs8tRNqloD/rL8KWb7+ZX5uKO9oVUnjSOsrbYaf4FsOD
	JrqjE6sJMFGbupVdmh/Wynv4Ppdo1G4yYyMg6CRNqeH/7ZU1QeJSw8nkCNLYdj6fGGcD
	F3HmV1ZDmVLhAvFFTMW9U0iE0VY2ihxVLT826nIcapxYGeAszEeietOeFQiL1VNrxP3D
	MMBabHgL5Z56YaAqJx+Dv7p0YQpO7xJyy/304B+bmx0vNFUr8mBrOk2jJQJMl8UeEOV2
	tSNg==
X-Gm-Message-State: AKaTC02r4JxfkojYqTecS9+CBnZrjgUyyoThrLZft/wCNHAMkXQ8Yj7pspZBIOXzuSJ9fZb6
X-Received: by 10.194.171.66 with SMTP id as2mr71804106wjc.77.1481129444083;
	Wed, 07 Dec 2016 08:50:44 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	138sm10535402wms.20.2016.12.07.08.50.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Dec 2016 08:50:43 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2016 16:50:36 +0000
Message-Id: <1481129438-28306-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/3] cve-check: allow recipes to override the product name
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
X-List-Received-Date: Wed, 07 Dec 2016 16:50:43 -0000

Add a new variable CVE_PRODUCT for the product name to look up in the NVD
database.  Default this to BPN, but allow recipes such as tiff (which is libtiff
in NVD) to override it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cve-check.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index b0febfb..75b8fa9 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -20,6 +20,10 @@
 # the only method to check against CVEs. Running this tool
 # doesn't guarantee your packages are free of CVEs.
 
+# The product name that the CVE database uses.  Defaults to BPN, but may need to
+# be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=libtiff).
+CVE_PRODUCT ?= "${BPN}"
+
 CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
 CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvd.db"
 
@@ -144,7 +148,7 @@ def check_cves(d, patched_cves):
 
     cves_patched = []
     cves_unpatched = []
-    bpn = d.getVar("BPN", True)
+    bpn = d.getVar("CVE_PRODUCT")
     pv = d.getVar("PV", True).split("git+")[0]
     cves = " ".join(patched_cves)
     cve_db_dir = d.getVar("CVE_CHECK_DB_DIR", True)
-- 
2.8.1


