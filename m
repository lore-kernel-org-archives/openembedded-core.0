Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 477D67F8A6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 16:46:57 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c22so19731500wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 08:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=6haDPYCzHqezaXGvQyoUaSEXVQuVUHGkZo5mjHvOvpQ=;
	b=qI8UY7XtMYI6NJSNP1z9U4wtLwyXHrpGOSmsnYuV/o07K6Lui+TIwbiQSIYxo/KoHe
	qqTp6B71LFaXRGse7IY4i2ng/okl9NwBXv2ShFtlYgn2YtZRM+ufquULI6T/PpIFE7kw
	XTcqStY27oQFGT8ejhQarq4GKsWc5V1dQMdBMTw1EVCImlA6BG7whyQCz2d/lsIrcQOS
	ZWyed4pyYcttSHwaWslSfUDdTRd6BrawrPnxyGhqm/H+5mr8FNjvdfw0TJO7s1ctf12A
	zFwPs8bnbNMRpIz/6u9KhAxbS11InG0+xn35aBb9qIgqT1t9ZQ2t3t6Pju//olme8Udj
	JQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6haDPYCzHqezaXGvQyoUaSEXVQuVUHGkZo5mjHvOvpQ=;
	b=eDJpTO0nmnNv2iMPK7cLOZP6dpJOwvXGrtZUm18trLG7Em2GX+gyeHY3yZtQLQI3ON
	Tyw5ncEsvDEmlPkDP8jyvlymw/4qMSzpzFcOgPd2J164r5xJiwiNy+FrRHcIy8nEKKt9
	ClmXNBixg+i7HcwxF57b/qBXOiqbuOsza0dq6U0JJLr2z6Tbbr/3J/qhS8WJLqDlAaZg
	6NKatO8mRePYCTUTPtJBGVS8zqX0wyvdfFflSFUxfDRBvy2kMTyRCN5aqHAyh2ESgMUh
	vyUfUPILTHkCYw6C+zP2SNJ5SJ03OmZcOVQMZcXxeAr3c1kJx+WiqnY6eGo2U6trJGMv
	WI4w==
X-Gm-Message-State: APjAAAX+IlWoaOAZer1QWfA9gKwEhp42urt8cVHUYXwPF1MTXjgEQJkY
	jYr70OnBUErruawuZI+shb0zLH9o6g0=
X-Google-Smtp-Source: APXvYqw+jn8Hrg8qaj2qX/HVMtLzEhzVmuWNHitnhcdJS9OIkN/Op7086DC5L12bBIeCoLWjEJpBCw==
X-Received: by 2002:a1c:2d17:: with SMTP id t23mr28990514wmt.59.1574095617691; 
	Mon, 18 Nov 2019 08:46:57 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y189sm20936208wmb.13.2019.11.18.08.46.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 08:46:56 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 16:46:46 +0000
Message-Id: <20191118164647.29409-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191118164647.29409-1-ross.burton@intel.com>
References: <20191118164647.29409-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] cve-check: neaten get_cve_info
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
X-List-Received-Date: Mon, 18 Nov 2019 16:46:57 -0000
Content-Transfer-Encoding: 8bit

Remove obsolete Python 2 code, and use convenience methods for neatness.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cve-check.bbclass | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index c1cbdbde7b7..e95716d9ded 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -261,23 +261,15 @@ def check_cves(d, patched_cves):
 def get_cve_info(d, cves):
     """
     Get CVE information from the database.
-
-    Unfortunately the only way to get CVE info is set the output to
-    html (hard to parse) or query directly the database.
     """
 
-    try:
-        import sqlite3
-    except ImportError:
-        from pysqlite2 import dbapi2 as sqlite3
+    import sqlite3
 
     cve_data = {}
-    db_file = d.getVar("CVE_CHECK_DB_FILE")
-    placeholder = ",".join("?" * len(cves))
-    query = "SELECT * FROM NVD WHERE id IN (%s)" % placeholder
-    conn = sqlite3.connect(db_file)
-    cur = conn.cursor()
-    for row in cur.execute(query, tuple(cves)):
+    conn = sqlite3.connect(d.getVar("CVE_CHECK_DB_FILE"))
+    placeholders = ",".join("?" * len(cves))
+    query = "SELECT * FROM NVD WHERE id IN (%s)" % placeholders
+    for row in conn.execute(query, tuple(cves)):
         cve_data[row[0]] = {}
         cve_data[row[0]]["summary"] = row[1]
         cve_data[row[0]]["scorev2"] = row[2]
-- 
2.20.1


