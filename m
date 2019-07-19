Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6CFB97F1CC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 20:33:26 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id h19so24447085wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 13:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=gRZ2nKNkQHNFH21Pp6bphmKeLPDT4193/vucv/vuzII=;
	b=DFJJbO8mQQeI9V9A6WZy/OUUZa5Pg0U4IGdSNBqD2xRQlJQKBE1AJQSCvWJhULKfKi
	UZ34A3MfW7XGkzJ2+mY7Ae2aSIY6jfbv72pjGwnoMoZpxDEKdkGbvTItHVmXoD3GF2sW
	TnoGK56oKOikJgM+RUgCg0xd+fwMNgqiOmJrzVGAoKhgpphCui6nhO2nIEfvTz3kXCWF
	A38t+HwJ0AyqDK1DNldJ9oLjjm2y81bdqLvJgi+rdYIXLtpCn2TBEsaDz9+uanDO484r
	EgPIt+jtR8u6+wLeymdcVJzz4XppCIsKzwSR1c+XIFmiGSiOEbLZW1+IrIwItGGIFIgk
	H/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gRZ2nKNkQHNFH21Pp6bphmKeLPDT4193/vucv/vuzII=;
	b=DMZS///yOp7oE4Jqtzpk6mTa5vQGcxiom6S+3eY20VI/rdn958gbLB3v8wCxZtoFot
	JdPm63an2sBWS/8hZsIa3YhYTJ1IdJQcVAu/f18cFrE2UlR4K7V5d22sRHlznwpnVFtZ
	v7d3OgfFzpZt2gaixFl5D2OfL2UGff0epyOfFr8qsbDvK9KUNTcCL5bLSVUKDxCvr0O8
	nmMVOMfkHwdmu7hfQiFcySR/si+vYv0TqVg/YYyM+uAuXkFkws8h2FeurExhfHUfnkjT
	TlQeS4q6D56JHPrh2EmrCSSUwmwVGyfdG9KlWFFJnfb/FQJ7mYI4HrNEdyU708heWluE
	lNzQ==
X-Gm-Message-State: APjAAAUQXgDu+8k4YxqZLBfoUVuqbrGyzazsLD6R0g1aPtNKDBLJ3s9j
	xn8JBmWxuK76oVJ7MhptAnyz78QgtRc=
X-Google-Smtp-Source: APXvYqy4FiPWWkYdeDIBZYRPjl08zMcwtdzsJkqj9ydzqN44YThSTj2NlY1umi31PlV2wPTd/P1uKw==
X-Received: by 2002:a05:600c:228f:: with SMTP id
	15mr46115667wmf.60.1563568406986; 
	Fri, 19 Jul 2019 13:33:26 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z1sm35298988wrp.51.2019.07.19.13.33.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 19 Jul 2019 13:33:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jul 2019 21:33:19 +0100
Message-Id: <20190719203319.20580-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719203319.20580-1-ross.burton@intel.com>
References: <20190719203319.20580-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] cve-update-db-native: clean up JSON fetching
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
X-List-Received-Date: Fri, 19 Jul 2019 20:33:26 -0000
Content-Transfer-Encoding: 8bit

Currently the code fetches the compressed JSON, writes it to a temporary file,
uncompresses that with gzip and passes the fake file object to update_db().

Instead, uncompress the gzip'd data in memory and pass the JSON directly to
update_db().

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-core/meta/cve-update-db-native.bb | 29 ++++++++-----------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 41a2aa8f207..9c083bdc991 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -67,25 +67,20 @@ python do_populate_cve_db() {
         meta = c.fetchone()
         if not meta or meta[0] != last_modified:
             # Clear products table entries corresponding to current year
-            cve_year = 'CVE-' + str(year) + '%'
-            c.execute("delete from PRODUCTS where ID like ?", (cve_year,))
+            c.execute("delete from PRODUCTS where ID like ?", ('CVE-%d%%' % year,))
 
             # Update db with current year json file
-            req = urllib.request.Request(json_url)
-            if proxy:
-                req.set_proxy(proxy, 'https')
             try:
-                with urllib.request.urlopen(req, timeout=1) as r, \
-                     open(json_tmpfile, 'wb') as tmpfile:
-                    shutil.copyfileobj(r, tmpfile)
-            except:
+                req = urllib.request.Request(json_url)
+                if proxy:
+                    req.set_proxy(proxy, 'https')
+                with urllib.request.urlopen(req) as r:
+                    update_db(c, gzip.decompress(r.read()))
+                c.execute("insert or replace into META values (?, ?)", [year, last_modified])
+            except urllib.error.URLError as e:
                 cve_f.write('Warning: CVE db update error, CVE data is outdated.\n\n')
-                break
-
-            with gzip.open(json_tmpfile, 'rt') as jsonfile:
-                update_db(c, jsonfile)
-            c.execute("insert or replace into META values (?, ?)",
-                    [year, last_modified])
+                bb.warn("Cannot parse CVE data (%s), update failed" % e.reason)
+                return
 
         # Update success, set the date to cve_check file.
         if year == date.today().year:
@@ -148,9 +143,9 @@ def parse_node_and_insert(c, node, cveId):
 
     c.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)", cpe_generator())
 
-def update_db(c, json_filename):
+def update_db(c, jsondata):
     import json
-    root = json.load(json_filename)
+    root = json.loads(jsondata)
 
     for elt in root['CVE_Items']:
         if not elt['impact']:
-- 
2.20.1


