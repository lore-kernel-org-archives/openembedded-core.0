Return-Path: <lemagoup@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 013F860111
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 12:26:27 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id z23so1902071wma.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 05:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3faCK+DIknNmb9dgyYGvQnG3n7B2zWDerKTe3g2Xhuo=;
	b=i9cabzAOn/Xq9Q4EbFPEBUZRwBgNpYSekqUtuYeiOVYWZvrOwz/Ft0MqZyNYpykciF
	XlCgvELz5kVPV2Vpxa83tLgLPR2bEsGOSFl4luq9yZQRFzX4U0kq61JDEk5TBMFQXR3g
	qiRXVWPbLd/n77NvMu+GKzMDJPSA6Hq60XiQtb3+2eJ9L/73MO192p6e7g4JpuHtdDqm
	lEDeclW/+9VOhc+O1U2j5p820sKp+lQG/6Y7P1Pyc4Z7fKlgfHvwCbJmgH2L68R53qI9
	+nK14PQjjGoOa5giRvfrWLZO2KOui6GnyqLuRTFxx0Qvjg3usIu+Mrl36MJ8AlN9+lqx
	bjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3faCK+DIknNmb9dgyYGvQnG3n7B2zWDerKTe3g2Xhuo=;
	b=dtRqa9TVed3G4UCoPcAkh6c9ONmDiilVEQxmRKbCOlmHPOORLu3Eam0+sKDKZVOWxY
	o6qaHXGDp1tES39hF48T3i+x/TqPKcGxKskU/RpDWnL07bLk5Nl+V81KCIVP/mZWIoDw
	NEzk0dkxy7fTtm1VEB4Ff9ASVguWlQJz9P1Umy8UxUoPw4/lAFYR+cGPFYj0feKaf6DD
	6Fo1WDrRdfpeWNjvhw57KXlAixQCVbWi6fvL1nNLSavlyAT8a9+GC3qc4pfQDMb4cOxb
	MBK8zTHBSvbMj9IjEYyD/uNg+WY0WewUxUTNrCBUaz5XBRspybSwF3qNytyuhGpzRxnK
	aIIQ==
X-Gm-Message-State: APjAAAVwbIrUtln+RIrHpvQ231ad0auk9TDjW1knPdro1zwOcKf76k2M
	aVGbdW7P7yNutBG2o+Xi1kT12sy+
X-Google-Smtp-Source: APXvYqy9f/t5bPsEDXoJ3KPi9zR4u107JLikK43LyDtY3RwFzzM1THxXFz9XCX2Z/OSKPRSPzRsrrQ==
X-Received: by 2002:a1c:a686:: with SMTP id p128mr2536126wme.163.1561551988255;
	Wed, 26 Jun 2019 05:26:28 -0700 (PDT)
Received: from localhost.localdomain
	(softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu.
	[158.255.112.194]) by smtp.gmail.com with ESMTPSA id
	t1sm23095340wra.74.2019.06.26.05.26.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jun 2019 05:26:27 -0700 (PDT)
From: Pierre Le Magourou <lemagoup@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 14:25:58 +0200
Message-Id: <20190626122558.32336-1-lemagoup@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] cve-update-db: Manage proxy if needed.
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
X-List-Received-Date: Wed, 26 Jun 2019 12:26:28 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

If https_proxy environment variable is defined, manage proxy to be able
to download meta and json data feeds from https://nvd.nist.gov

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
---
 meta/recipes-core/meta/cve-update-db.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db.bb b/meta/recipes-core/meta/cve-update-db.bb
index 5778e00e79..bcc8d4ab1a 100644
--- a/meta/recipes-core/meta/cve-update-db.bb
+++ b/meta/recipes-core/meta/cve-update-db.bb
@@ -24,6 +24,7 @@ python do_populate_cve_db() {
     BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
     YEAR_START = 2002
     JSON_TMPFILE = d.getVar("CVE_CHECK_DB_DIR") + '/nvd.json.gz'
+    proxy = d.getVar("https_proxy")
 
     # Connect to database
     db_file = d.getVar("CVE_CHECK_DB_FILE")
@@ -38,7 +39,10 @@ python do_populate_cve_db() {
         json_url = year_url + ".json.gz"
 
         # Retrieve meta last modified date
-        with urllib.request.urlopen(meta_url) as r:
+        req = urllib.request.Request(meta_url)
+        if proxy:
+            req.set_proxy(proxy, 'https')
+        with urllib.request.urlopen(req) as r:
             date_line = str(r.read().splitlines()[0])
             last_modified = re.search('lastModifiedDate:(.*)', date_line).group(1)
 
@@ -47,7 +51,10 @@ python do_populate_cve_db() {
         meta = c.fetchone()
         if not meta or meta[0] != last_modified:
             # Update db with current year json file
-            with urllib.request.urlopen(json_url) as r, open(JSON_TMPFILE, 'wb') as tmpfile:
+            req = urllib.request.Request(json_url)
+            if proxy:
+                req.set_proxy(proxy, 'https')
+            with urllib.request.urlopen(req) as r, open(JSON_TMPFILE, 'wb') as tmpfile:
                 shutil.copyfileobj(r, tmpfile)
             with gzip.open(JSON_TMPFILE, 'rt') as jsonfile:
                 update_db(c, jsonfile)
-- 
2.11.0


