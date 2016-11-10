Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9B6E071A67
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 12:18:54 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id t196so188556423lff.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 04:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=92kvAfgXVkLk1MtwvjFj196kl71c+b96BwsheN3vPB0=;
	b=Ddd7tMDeZ87sQJPqLlVKZwEU7CFX/Agv6TydPcoZAwnbOlYKzrfjGOhemvq1H1xB0n
	NPnuAY7UJyz39x6Yq2qIqe5STAKZMrmZjfBn7JUgSZB06kGys9tIzziuzpvtbifvKjhy
	XDBAu6QP9WEOFC6gK7zGnHzIXQZGcJqg6L1FKfyYKG3t77Cl5P8lWt8j9iFzNY98nTyp
	HhOdr5QQIim0Sgwwru/lDr9wA2cPrGDE4GtjDz350JnhXc3Wcxw0fLJRbGrE/SlXauhp
	sj8HILDhoPsawGEdWn2rwVsoVrYFfU8VRGW1ua2lpP8r/mfVOve/pBQyQPuZcgGJaPRN
	QTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=92kvAfgXVkLk1MtwvjFj196kl71c+b96BwsheN3vPB0=;
	b=kYr4tCj7E5hQUasV+BhlFu5W96zsZ6WyLgtc8KoDRe/Mmude2Ohm5/oXhOLciXBphe
	AGmlgdHqo4upUgGxjmuq6ScAk9+DAbuKW5VMW95CcCLtoBB/AU2t/LlkWMnQeRTTLxc8
	ftXuHpwBWPInezP/u+6sxDT6Q6PekpssISInFgJuqbEFgu7B5Xzt5RhBizlTlJjaXoPA
	wNI9/uUMMs2DWv6eLXbUpxkHYXIfplD7aR2SHhZhHd/XwfaUXwcZqfKtnedc5V/uUoLp
	SySvCYfIzGfGwbu0s0M3rpqnzCGAPQBK/rHyLyMfoDABQ10AhOrcgjR+fckUyxN73YP3
	zbOw==
X-Gm-Message-State: ABUngvdToxxj1CPqvgSbQX/qo4QpMtXAqGsxorrN5YT0URzJwnE3IVOkI7ZDBeZiborDTA==
X-Received: by 10.25.192.1 with SMTP id q1mr2775315lff.143.1478780334932;
	Thu, 10 Nov 2016 04:18:54 -0800 (PST)
Received: from comp_016_pc_buildenv.localdomain
	(staticline-31-182-60-238.toya.net.pl. [31.182.60.238])
	by smtp.gmail.com with ESMTPSA id g5sm934563lfe.47.2016.11.10.04.18.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Nov 2016 04:18:54 -0800 (PST)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 13:18:37 +0100
Message-Id: <cdfe7f669ad98f3d36c074e847e9ecd29eeab86b.1478779674.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1478779674.git.maciej.borzecki@rndity.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1478779674.git.maciej.borzecki@rndity.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v2 06/10] oe-selftest: fix handling of test cases without ID in --list-tests-by
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
X-List-Received-Date: Thu, 10 Nov 2016 12:18:54 -0000

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


