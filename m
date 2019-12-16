Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6034E7FDA4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 16:00:26 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id bd4so4647093plb.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 08:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AsGSA6vh4PXyQQ2kwt3gTgoxSfeCfvBSAQkQZ4bRL3w=;
	b=JKfDqR9dkUddcNbdZL0IoREZwRI663aEXmA2u3sILMyz29yse2ChGtnB6gBJvZUzqn
	ILvmmERND4ddgewZ+DCqLAXJZnk8B0dNGUTuDyPmYl1KDh+c3EBVYLXAF09umgRo/8UB
	EpFlU6DSmpofvJ0qPkFX0bPHQ0O/hNUHB2Tv9RBOe15dmTAIbbe/h0bxr3Fkh/yn05Xb
	S0rMz8ajIGwc2VUtj02363VKR3g0pQXyUBPOyBywZYRX4TSQ4LVnkPn9vIVcmDVMdGcT
	hO7AWUFWa0jKemd+lJ9Y2XVhWEYzX1qwc6/WzLyKErYGG4QAAH43mbLqp37pXdL2hxjU
	3tXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AsGSA6vh4PXyQQ2kwt3gTgoxSfeCfvBSAQkQZ4bRL3w=;
	b=O93EIrFf4BYLEt6dbpgLxk5Pm1RqbTlhOv869i08CsuYRrtoDXgITuJXEujBLbSO+E
	X8NTQn1UUyDsGALed/Ik8kDjyfSwKbS4TTSxdYq3zInGgNzc6BAx679faobgYmGZ8exU
	S7qwDEnpPJHaUgucBYTjkCnFh2ghE+7ZMQhrTfjwhfe6/JUENPRToFLCQqb2Mp2mqgCe
	Eddp/e5yvDoxhBRLq9Eo/Vf+IOE01vo3uLKpbzCBeBbIIarkW5CBG3vPu9pWkFtfzssq
	AjAZ7luI+gi/rVICls4pEPyNy+RBiEPDTRZ9eQwQxhbIHTwQ9RiN/AZbNdeFWiecRbmD
	8+KQ==
X-Gm-Message-State: APjAAAVawQPWG23fxN6QzCOrOfdq9Q6MLtOTvJGWZZ16osQGHIlEra+5
	59IpYnRJA5y5a350LVGj/WSaxM1lKUc=
X-Google-Smtp-Source: APXvYqz8aEOZhY0J33Gd5tkJutkEVJJCXO79pJ7a2F7eEATXeAtpvGkbIu80ph4hfdXf7Kh8wK7J+A==
X-Received: by 2002:a17:902:9043:: with SMTP id
	w3mr16730122plz.8.1576512027366; 
	Mon, 16 Dec 2019 08:00:27 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e5c5:31c9:a010:f145])
	by smtp.gmail.com with ESMTPSA id
	g6sm19568697pjl.25.2019.12.16.08.00.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Dec 2019 08:00:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2019 08:00:06 -0800
Message-Id: <b52d6340acdad27d41caf057b78f181297a9a75e.1576511913.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1576511913.git.akuster808@gmail.com>
References: <cover.1576511913.git.akuster808@gmail.com>
Subject: [thud 16/18] cve-check: fetch CVE data once at a time instead of in a single call
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
X-List-Received-Date: Mon, 16 Dec 2019 16:00:26 -0000

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


