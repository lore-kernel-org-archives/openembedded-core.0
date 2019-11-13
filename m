Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id D1BA47F7CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:43:42 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z19so2544751wmk.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6Edv7S5OWg9AzVxjsZ6fOG25umJEn6snKB45Ig5mwao=;
	b=W6hhBq2j6Y2cj5EKMiUbCwac0yvMoymnTDoFf7MkSDwOxqi1+6P5mBGmq5KSIGepW4
	vtrhO60rfJ6lQ4lAKlLNxVWOn8AXj9UbbuRzc7b7S5/KURUFvMd2kfKTSvFlj94iPZtZ
	FSlaiNi7dQ6i4PzyyFB0dwDjhjwKyHa2ZFRQeFNeBXCTNtOQQQpa5Cm9QM6VgR3on2ob
	brGLOhqp9RBuSOxgQKApOi8qIa05z68yiMjyu35I4tKeFuxMVTIct9mRpUZA8m6hToBx
	jjH7vqPoa1VNXS6IZm/FZZ8g12S7jMnfjYPwpZAxRmgL28sYSlle7iwnbUZ82mEBxsYX
	OaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6Edv7S5OWg9AzVxjsZ6fOG25umJEn6snKB45Ig5mwao=;
	b=gTnIduyJUlwOSOunPLTPRM/s6Kz9Sy47P7Cwum5Saog3Dw24Gh+8HNhD1OYgCrVs7d
	HFdp94rZL+bj2A/CGmPzPVEY3P1Pj4sswvYGQyRA9bY1SEVkgQoaF3no17pLqRm6Ampf
	zg+y0qk99J2E+RYe0R2xQ5qFH79iRR/Q9g53t8LJFXg3LySuEx1oqurJ2xPCiLeeAGJ6
	iCPMzSoIfn5ycprSPX6kVA/ro4uFwF4E9HJhXM8Jg6gXhsE/+0auf2Xyeq0sRQ1JTyML
	ReBrdMEV1K9EYaVIkAeMMsX7K2uN6CuTss5/ptSSDULViIzmKIwshOSFW+Vkyf5gTXBa
	K4+Q==
X-Gm-Message-State: APjAAAX/WSswYJ07GU89J6tRP30nJbT5XEQn0z8zfLcxFR8a+kp8V2yV
	0NKsqUGJi48gGhBSQEu0Wpr3+j4JGkQ=
X-Google-Smtp-Source: APXvYqw3DqFjdhLQ/YpDM/jVfrpcalr5CFhstW0+U3thEigD1Htz6oF3/PglN6qmxc4wwxWgQVwu7g==
X-Received: by 2002:a1c:96d5:: with SMTP id y204mr3265547wmd.63.1573659822959; 
	Wed, 13 Nov 2019 07:43:42 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d7sm3456066wrx.11.2019.11.13.07.43.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 07:43:42 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 15:43:40 +0000
Message-Id: <20191113154340.8974-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2] cve-check: fetch CVE data once at a time instead of in a single call
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
X-List-Received-Date: Wed, 13 Nov 2019 15:43:43 -0000
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


