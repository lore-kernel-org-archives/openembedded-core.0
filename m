Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 48A7971A15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 09:52:41 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id n21so128686288qka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 01:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=92kvAfgXVkLk1MtwvjFj196kl71c+b96BwsheN3vPB0=;
	b=PAyeO6+ZJGlHGIADOxPfpj1OiO2AolMWRFghS+sGwn3eA6mEjADWgX0H3PvLpY9rcP
	AMT4Le4GVG4siyyfv69qZD13xnKP6Il9ZnBOHJOGkRBCqRDml0OCW6cjJ4WRBIlLSbzY
	eTGbX1BYwXfKZML5P5qJi7HYGHIhIl7LDtTXwNUUQS4j05yfISxiPuJ6lkkl2WMcYqNQ
	lfkdEl0I5R2is7DTNBhRksSdjzAXscUe1GgZjeIXdnpPXEjhgzo7CXFF+hlWCeQ4ekD1
	TVlY5OXJ4AdiQAGjFKHOrTTUXrCaqgfsCkeTHXubRig90Skw5QIoumGw+VEkDACYTdbu
	7Q/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=92kvAfgXVkLk1MtwvjFj196kl71c+b96BwsheN3vPB0=;
	b=RpESzcjDpyy5e58sXhYhXff/lDD4zSPdBAxxdZxmSNmH3GYfOiUo5/eGfmokIZtfQ6
	aM2YBa/7jClkY3DQsqUQbGQUwXLKI4ccpa337lMRin8ETAfKjLBCxJhqEgbaIqJqLaju
	Jkdj7MDyuwRMdaXQjrlzfA0WXdNQfIx5N4yDX2ZXMAkr3MfUxhezp37rM+JjNgMv0azc
	pztXApkCEDZjzX6AuZsNH9hegaBfS2kR5+Ojr4gEjqptfhdTUR85CtgBoBkAsCvcL4g8
	BIi/3F8Ri9zP4S8TEKzOlTzC+9dM7WBq4RVcK/eKjNxZXLHHtSo7YtsneAbIwSvzlX/w
	A9kg==
X-Gm-Message-State: ABUngvdoWLODREXDqvfCrFipWi9Ih/fd1CxnFxuJGwNrh05Gl5JNlOl0djp3/O8Aqg0JTw==
X-Received: by 10.25.5.7 with SMTP id 7mr8512717lff.125.1479203563023;
	Tue, 15 Nov 2016 01:52:43 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id
	u204sm6093118lja.5.2016.11.15.01.52.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Nov 2016 01:52:42 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 10:52:10 +0100
Message-Id: <f090572546b9cd3e0734442ec0ec4a0c3cc7c6aa.1479203195.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479201985.git.maciej.borzecki@rndity.com>
References: <cover.1479201985.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1479203195.git.maciej.borzecki@rndity.com>
References: <cover.1479203195.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v3 10/11] oe-selftest: fix handling of test cases without ID in --list-tests-by
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
X-List-Received-Date: Tue, 15 Nov 2016 09:52:42 -0000

Running `oe-selftest --list-tests-by module wic` will produce the
following backtrace:

Traceback (most recent call last):
  File "<snip>/poky/scripts/oe-selftest", line 668, in <module>
    ret = main()
  File "<snip>/poky/scripts/oe-selftest", line 486, in main
    list_testsuite_by(criteria, keyword)
  File "<snip>/poky/scripts/oe-selftest", line 340, in list_testsuite_by
    ts = sorted([ (tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule) for tc in get_testsuite_by(criteria, keyword) ])
TypeError: unorderable types: int() < NoneType()

The root cause is that a test case does not necessarily have an ID
assigned, hence its value is None. Since Python 3 does not allow
comparison of heterogeneous types, TypeError is raised.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 scripts/oe-selftest | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index d9ffd40e8c4caa734cd490d77304cc600cc75b73..c3215ea6592e128d17da550d778272985f5bd1a6 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -336,10 +336,15 @@ def list_testsuite_by(criteria, keyword):
     # Get a testsuite based on 'keyword'
     # criteria: name, class, module, id, tag
     # keyword: a list of tests, classes, modules, ids, tags
-
-    ts = sorted([ (tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule) for tc in get_testsuite_by(criteria, keyword) ])
-
-    print('%-4s\t%-20s\t%-60s\t%-25s\t%-20s' % ('id', 'tag', 'name', 'class', 'module'))
+    def tc_key(t):
+        if t[0] is None:
+            return  (0,) + t[1:]
+        return t
+    # tcid may be None if no ID was assigned, in which case sorted() will throw
+    # a TypeError as Python 3 does not allow comparison (<,<=,>=,>) of
+    # heterogeneous types, handle this by using a custom key generator
+    ts = sorted([ (tc.tcid, tc.tctag, tc.tcname, tc.tcclass, tc.tcmodule) \
+                  for tc in get_testsuite_by(criteria, keyword) ], key=tc_key)
     print('_' * 150)
     for t in ts:
         if isinstance(t[1], (tuple, list)):
-- 
2.5.0


