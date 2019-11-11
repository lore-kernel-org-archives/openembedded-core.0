Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5FE277FAAA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 22:13:42 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t1so16369919wrv.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 14:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=BvLw+Q5ig6tUnaYjdSmgh3xKOEyw45Rn18F3gm7mWBk=;
	b=P1QmOfbqqCwiu9CuYXVohJXXuydBw3FCN0F3GutpRENAHyUC7gr8OPIM6PsZ6HM/xz
	aAK7TYKXM1naoOMs+ch5eD7hVHZjVC5Jg+yP4vGPxEsaDD4j7tUkQzM1zMDvz/lNCd3j
	rEtzvmkgjFAYrLHQBUGtIYzqwZwDksLfbVoa2C7sUwsxoNl5EB+Fy4ufJy8lUR/noZJo
	ujZuMb+I5fQT+DuNvS2wGK35bHalACMPVcE2gIHRYeHkmD8U3d5JkLCo8v0e3EyRG3gj
	wsrqPj6BHTR8VMkK49iVkJxiN392q0yBjPCpkRaJPPRHo1Lw1pKroB+j5qoGZm62sIt8
	dGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BvLw+Q5ig6tUnaYjdSmgh3xKOEyw45Rn18F3gm7mWBk=;
	b=RixVwaTC3xzdfLE9/F17CCKRdWfyLeET7P6a1Fh7XrQ1ButCx7e3RycS4phwNn4Jyf
	s3RVX8xLpvUbEijkEDOcwJfNIQFWWtwHe55qoJ5Szu0AaiiZFZa1dY+vR/1vnYkIn6bS
	3HtWhoFq0iiFA7mZARyXKEkn1ALEXWPkHjMkwLu6Y4CxKgAt9eaQiwjSH9F6seER3ZGY
	mRCVZoueoPxFO2O2rxPWcJYQpFhiptOGQN7VGZeVnh7npP7uPE3Dz0RucY7MJgesi9TM
	TRPLSu1VUf40Qg9qN31B6C5DRGHt24zqpAYGmJ2AERmxzJS5AGOZuBMbbn+/LyrMRdFj
	vpsQ==
X-Gm-Message-State: APjAAAWydX0O/HstrN2c0j2gOHTmeeiJMF4uQXlInaWe2Ax6wG66VrV2
	SvLWOSXh/CTcuXEDKAaF1SrXayVuew0=
X-Google-Smtp-Source: APXvYqxO7lLsxJBlo1E/GQy0nKyG3609TK0GjwhNpHp7h8SglJ+i53wQlzDkTMfu7d6WMXTQinGbRg==
X-Received: by 2002:adf:e78c:: with SMTP id n12mr20979334wrm.94.1573510422808; 
	Mon, 11 Nov 2019 14:13:42 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d11sm24900083wrf.80.2019.11.11.14.13.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 11 Nov 2019 14:13:42 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 22:13:36 +0000
Message-Id: <20191111221337.20332-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191111221337.20332-1-ross.burton@intel.com>
References: <20191111221337.20332-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] cve-check: neaten get_cve_info
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
X-List-Received-Date: Mon, 11 Nov 2019 22:13:42 -0000
Content-Transfer-Encoding: 8bit

Remove obsolete Python 2 code, and use convenience methods for neatness.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cve-check.bbclass | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 3326944d791..419b2c9148f 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -256,23 +256,15 @@ def check_cves(d, patched_cves):
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


