Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 668D77F943
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 16:46:58 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id u18so18185809wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 08:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=mf45DdTgWRs5x5BDGPO5ZG82r/eQAhxp1MbZLLqNFhQ=;
	b=ZTpCgP/d6YCPTAqSVX/4TEoW4bG5zuz855H/TTNbAPkNrEqzXBrcf7w+YHfZ751GOb
	kbsxnr3Aa8013p5kWCPP4NLzgtt3L7POYvyxyObPKLQN2Wb+ffMv8VP0RGsyTF7x9SFS
	/my/Z8AJ9okF6GpkD+RycXsL2nFyuuCHaY1kWovbCrnM6gFalf6HPf+IMhxeCEWOrP4W
	16zaatV576Jg2f0jnlUrIG116U7JeTaLqVG8nVE4NA7YDpA5ydmJHttPANhxvDsM1Kk/
	kx+k2n9vdfEWMUa06O2kxbxkbcSTOcjqfVQSw5L+QhAfbE4Zf4ZAwu/slck1+pxz5kEp
	jFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mf45DdTgWRs5x5BDGPO5ZG82r/eQAhxp1MbZLLqNFhQ=;
	b=tCnkZ2VSzUdk3Hmrzi8cBE0U17CKv1haZ2udZcJ70yShK4rectYKxr0O7bYV3nWQnf
	9MGIQgaJFiwzL+xR6/MapBt+FmVCnIt44ozt4FKRKDbvdrsMS8yuErFZ3d5SvFtnzFMW
	/1XkEzPxT6Q1wRrLoQGIPTvLEQNBp8vSTrI8AMs6U1shpvnaWaIW/B1yM9X3WXXWc5gn
	y+sjM7ARokMJW3AExth+QpCMwNDXJWPJl5UO5+cegHUhVkm//dHgfgQxrOPdBGHnsTDz
	IgkzqvOvsXWX0UDI3Xiezv4XBS8UWnLqrsR81rlzPo/D9S+0Fhq5Jcx1e+4VoP7rMJmb
	xTbg==
X-Gm-Message-State: APjAAAWCB3DRx/D5QzaTuynRtiZ3XkNOBGJfiSgHA0fX8OMb/KfbNQ6m
	2Y9ae8M+DWh78ZgLAoq8soqE47jtbj4=
X-Google-Smtp-Source: APXvYqwvmxe+y+b6HK3L+fmRmDvZy6AMeOB3wU4UfZXJTcovSjNEBSTKG85rRRtohCT6FQKwsPc7iQ==
X-Received: by 2002:a1c:650b:: with SMTP id z11mr30156006wmb.149.1574095618686;
	Mon, 18 Nov 2019 08:46:58 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y189sm20936208wmb.13.2019.11.18.08.46.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 08:46:58 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 16:46:47 +0000
Message-Id: <20191118164647.29409-6-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191118164647.29409-1-ross.burton@intel.com>
References: <20191118164647.29409-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] cve-check: fetch CVE data once at a time instead of in a single call
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
X-List-Received-Date: Mon, 18 Nov 2019 16:46:58 -0000
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


