Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 20AA47FC0D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:50:52 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id v93so2337856pjb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CTKHuYIdlGI1K3BGETzGGNJ3x3TD6nzJoEQ5WbWUBUo=;
	b=AUBnaeh//3Y6CGypebfnutQYuAr1kjaXt/Nr5sq+vWFdrSpDtJBU9FifzDCxaIy0XH
	TvpZHihaw1jxrWqrl3aMNcyW5a3zZSyL6hSp2zWBlYeKyOcv0aK6/k+aoSO72gYwiB32
	mCUkNALZTrvKnDpn5zTH2CVjiEGx1HT7uJ3TC7J4T6GOnDHzAclQ3Yz4hDG+1wcer78y
	aEMFaO/Sy/Ip6VcOHeavYmi1/Sr18yvq3Ww2u8qBUtm3FhWANw8nSYHWutu3SGcc4PxP
	e3ACpEeuQlV0U2zsViMEeiSjfjYcvu0itOHqe8id7WZuy+keS9nRgv6/u2mUVB/q0tJW
	3hFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CTKHuYIdlGI1K3BGETzGGNJ3x3TD6nzJoEQ5WbWUBUo=;
	b=l06xsK4QmnjbtoBTJIKhOuR8ZN+rYA/wfI6PyRBOXe1Nga1v4AvwqIsAMq7xUS1R0g
	6MvPF3NSVnHWdMVCMm9TYK2pWqITqM+CXMRhlpwwq/IwI7Qjsie3+w4rPClm+dgg4rwL
	YAXWHVKT9PXIoJdIAlyTeruLdO5DOPJ9Pxi0mZkRr6aitkfkBPWb7fpAPqg4NRzjgS61
	ZCBQgliyiiik57DhIx4CwtCa6KHAYUNdU3Bia5IMilua2pZCfyLXRKuR95zh78vEfxPc
	HpSD52IN8F+kLlvfKN+JaDKT8rtBOOoagsNUBV0uAx/UgLLgMqRq57xrb2qqma4GgGcq
	s70A==
X-Gm-Message-State: APjAAAVlwX3UTe9mtKO/ysPaCDlrLsuuORry5doflD3M9yAiaoVEQ5i7
	47Qa+OPyrVyOhq6Msc8QFCCDWONB
X-Google-Smtp-Source: APXvYqzpBzqdVw/0fGOKl4n1/GKOemBk3GO0wrrhuuGBPgqDtWp7EOMuMaRgT/xBOI8KOhJaNP60Ow==
X-Received: by 2002:a17:902:6b47:: with SMTP id
	g7mr25829858plt.87.1574639453006; 
	Sun, 24 Nov 2019 15:50:53 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.50.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:50:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:15 -0800
Message-Id: <a4775cdd06974b722666e953dae027ec9a064a01.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 10/35] cve-check: fetch CVE data once at a time instead of in a single call
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
X-List-Received-Date: Sun, 24 Nov 2019 23:50:52 -0000

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
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/cve-check.bbclass | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index e95716d..19ed554 100644
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
2.7.4


