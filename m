Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 84C7978445
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 10:32:45 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id l22so608624wrc.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 02:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=0OkKokS0GhDc4wQUKQ5MmU1h4zVO+qTxG8IvpCjXR8Y=;
	b=qS6lARrzBuEI7C3gJX4oZbJiBwQYYDoHKI4HwzbxlUofeHIaR8JkM/PuHTulAxuqcJ
	rFekOU0b6g+ajRApHw3Ae0dwCU97DOMDPMNaNBkdJjSlyJraAIfFDMvb6349TIX7PmLL
	xwkUBTeS64vMMsg1A9vnEdPomXEme/eN7pG4ufcZocxXueLCl1qbew2JrPTPVkECdwOY
	i38CeOzdwwsDX53Ls9QhjgabrQn4pOpO8QtKCKEyNvYCdgGi9HN0QmX2t9JwRwVFNoq5
	uC4o0C68ySFejEl/D90FRdewQHH/jdZZfRiZwYmFNe49TU9KzlMJQPye0uOms2mCFVyD
	RulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0OkKokS0GhDc4wQUKQ5MmU1h4zVO+qTxG8IvpCjXR8Y=;
	b=dv8+2iB5nc9ToX9IwzlT8H8dtDS5Y87DC4oLAHM7tt9vruN4iu4bx70hc6cpkkVDrY
	QkqGeT3qy+9Yn0n466AiMZk2UKJ9rQXF958OfU8PjmAHrcHH4neAV16fhgcC4UlAx4Hv
	610qtNAYtU1eIwwejThfytu/EsQJ+8u6H0TcSdG48Md6WFmh4+gyw+A/krJuSvt8gmCR
	zxmyGdDsg2sezs46LaF111q4H4GOIF9BqwqO/DTHWuX46N6ADBKM2bOPrdPurS0dFQLF
	eBfAGpAb4MM28tS0aADGQ9Ssu0gVJ6Ehk7offCS3gKVczh0WYXSQ31NQS22JCZxhcR/i
	yQxw==
X-Gm-Message-State: AJaThX5aMDahsSmiarCNaIK+gFdrmUxfZBsHmSqKLr0662df43gdjtGy
	G7HQAYsHJiK9+xRcP0G/L9Pckjbx
X-Google-Smtp-Source: ABhQp+Sc8SGsRiTASOUwtOaaUbW1RO1zuWCXzqAoSHxcGnJUjMDyP4+1o9Z5RXyiYYBSt0/Sv0ef3g==
X-Received: by 10.223.175.199 with SMTP id y7mr2367958wrd.207.1510050765995;
	Tue, 07 Nov 2017 02:32:45 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	x75sm1480188wme.29.2017.11.07.02.32.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Nov 2017 02:32:45 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Nov 2017 10:32:43 +0000
Message-Id: <20171107103243.9420-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] tests/fetch: use subtests in the wget tests
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
X-List-Received-Date: Tue, 07 Nov 2017 10:32:45 -0000

As we test multiple URLs in this these tests and one failing abandons the test,
use subtests so all URLs are tested. This should help us identify patterns in
the failing URLs.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 bitbake/lib/bb/tests/fetch.py | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/bitbake/lib/bb/tests/fetch.py b/bitbake/lib/bb/tests/fetch.py
index f1799a7eff3..b07bf00470f 100644
--- a/bitbake/lib/bb/tests/fetch.py
+++ b/bitbake/lib/bb/tests/fetch.py
@@ -848,10 +848,11 @@ class FetchCheckStatusTest(FetcherTest):
     def test_wget_checkstatus(self):
         fetch = bb.fetch2.Fetch(self.test_wget_uris, self.d)
         for u in self.test_wget_uris:
-            ud = fetch.ud[u]
-            m = ud.method
-            ret = m.checkstatus(fetch, ud, self.d)
-            self.assertTrue(ret, msg="URI %s, can't check status" % (u))
+            with self.subTest(url=u):
+                ud = fetch.ud[u]
+                m = ud.method
+                ret = m.checkstatus(fetch, ud, self.d)
+                self.assertTrue(ret, msg="URI %s, can't check status" % (u))
 
     @skipIfNoNetwork()
     def test_wget_checkstatus_connection_cache(self):
@@ -862,10 +863,11 @@ class FetchCheckStatusTest(FetcherTest):
                     connection_cache = connection_cache)
 
         for u in self.test_wget_uris:
-            ud = fetch.ud[u]
-            m = ud.method
-            ret = m.checkstatus(fetch, ud, self.d)
-            self.assertTrue(ret, msg="URI %s, can't check status" % (u))
+            with self.subTest(url=u):
+                ud = fetch.ud[u]
+                m = ud.method
+                ret = m.checkstatus(fetch, ud, self.d)
+                self.assertTrue(ret, msg="URI %s, can't check status" % (u))
 
         connection_cache.close_connections()
 
-- 
2.11.0


