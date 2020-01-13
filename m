Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1213E7FD25
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:58 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id q10so5034644pfs.6
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gxXju7FHcV6HZ9f4Ik3KCyjSDfLoiNM3yYPrnhht+J8=;
	b=Gbxcqi4MhKTBCVXyK6iL/dhmI37v9mtKTZ5Db/hcQHVTqH4QxoMpPgK4iMgSENM2TM
	lfgdrsSkQsurI4tlFnsO+YmRGTBATxxfNT0GbUz8qe/1nS34t9hqmdGYjydRaNFb4f5k
	6mKP+KzgXRw1Ah+vapIg9cXJMX+cETdwqJ2wXWNUhIt1tMK9WLGDprUWsL41EI+dfkdp
	3UNuct1gFh/GHzJco9IYYEiRzCGyQcxKP3UO4bsI8JCCjKGzv1E5uDqU2q/5G5NmW5B2
	UMv1i1WvsQ4yYiXI8O/PTTmLF7APCV6v0SUSmgz+A/w1I+Ygunn1t8Kg3469wMEQLXAc
	j3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gxXju7FHcV6HZ9f4Ik3KCyjSDfLoiNM3yYPrnhht+J8=;
	b=YgZ1cvP8QryweGadgzhHU0hRkiIVZIbUQdeuG5ODGowUWW/hZmwNwg99w+Oyp248dg
	CMs+zy/I07u/MZSj0qwGg0O9DtJ67CgiuYwEXV3bnBOuRcPcV2TnPti3VUN6//0sTzBk
	0SVjgM8CH+7UFMMAXcctPV1ZKay1fgdHQtpaZT2eIX629BhYkhOCsVMv6wzjZa512TrN
	SMW1fYp7be4c8ir+HOEKCjJtvItlLbCVT8yP/knleGK3nN18TgrkEY2DOI9NHw41jRFf
	uWkRN91aQQt1sFVunALKv62wquJxhDzoHcGEJJeC7z/VjBStJxmF94nateADP9adiaJq
	qD7w==
X-Gm-Message-State: APjAAAXvulIEB7JJjtxT+XBCmhOfQvU+lpzp0M+3F7jCAtWZq6XpA+a2
	q9h9hHgEOaSYL8yMpUN9pVWYxKKA
X-Google-Smtp-Source: APXvYqy59Z3yELDj+MGh28jwxIJIk64m9Jzax0PKH4Mdz4QTOPrQe1LGIEtqFugnhnwbMRkbvULPlw==
X-Received: by 2002:a65:4587:: with SMTP id o7mr21021339pgq.303.1578929459929; 
	Mon, 13 Jan 2020 07:30:59 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:22 -0800
Message-Id: <0f5b748a5b7fec41bac16bbc1346230e86bb99e3.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 23/28] cve-check: fetch CVE data once at a time instead of in a single call
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
X-List-Received-Date: Mon, 13 Jan 2020 15:30:59 -0000

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


