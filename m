Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id EB45265D00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 15:57:30 +0000 (UTC)
Received: by pdbqm3 with SMTP id qm3so8053141pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 08:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Aq5ecHYjlWRUXa4il2PEa+Ki4295UyYRcKDfzCC4/Qw=;
	b=zD+fS2eUZm7mpcC5Yoomyh9TibQUlalBvMxa8AgZ0M22ecAnlfNFXvrRiSQckOSMd/
	XUtygAzPIEFd2HmuKYhzA+unrIoSTtShXcNpM8dk9z0Q+3QebIJhVd1YjyPtU73uURnK
	19fhqHMrMB6qt0+BqenQgTPxyfDYJHnV62GwIAfzfgLs4mdPQAWUrGrY35T5oO7zi9md
	ejZ2fEIWO+Eyd9I/yItlbJy8fa6fFLJSZsoT65NKkK7I1Sb9GY4atm9wsmT0tBQNomb9
	olf5qukPiMWMa2K3ZAfqGD0OCZ01LUCr5DqPYPEu3GQp9grm4/zpXTj61lL3koaTXLo2
	eQEQ==
X-Received: by 10.70.9.162 with SMTP id a2mr82605277pdb.61.1436889450850;
	Tue, 14 Jul 2015 08:57:30 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id k5sm1781519pdb.53.2015.07.14.08.57.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jul 2015 08:57:29 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 08:57:43 -0700
Message-Id: <437d5f10080c9ccb336477e475078d59215016e1.1436889188.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <e15b0bbe895d669fd6908504f11d62a89aeda5c4.1436889188.git.chris_larson@mentor.com>
References: <e15b0bbe895d669fd6908504f11d62a89aeda5c4.1436889188.git.chris_larson@mentor.com>
In-Reply-To: <cover.1436889188.git.chris_larson@mentor.com>
References: <cover.1436889188.git.chris_larson@mentor.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 5/6] oe-selftest: obey oeqa.selftest.__path__
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
X-List-Received-Date: Tue, 14 Jul 2015 15:57:31 -0000

From: Christopher Larson <chris_larson@mentor.com>

This ensures that all paths that hold selftest tests will be checked
(oeqa.selftest is a namespace package).

[YOCTO #7625]

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/oe-selftest | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index fa6245a..c19c692 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -142,11 +142,12 @@ def get_tests(exclusive_modules=[], include_hidden=False):
     for x in exclusive_modules:
         testslist.append('oeqa.selftest.' + x)
     if not testslist:
-        testpath = os.path.abspath(os.path.dirname(oeqa.selftest.__file__))
-        files = sorted([f for f in os.listdir(testpath) if f.endswith('.py') and not (f.startswith('_') and not include_hidden) and not f.startswith('__') and f != 'base.py'])
-        for f in files:
-            module = 'oeqa.selftest.' + f[:-3]
-            testslist.append(module)
+        for testpath in oeqa.selftest.__path__:
+            files = sorted([f for f in os.listdir(testpath) if f.endswith('.py') and not (f.startswith('_') and not include_hidden) and not f.startswith('__') and f != 'base.py'])
+            for f in files:
+                module = 'oeqa.selftest.' + f[:-3]
+                if module not in testslist:
+                    testslist.append(module)
 
     return testslist
 
-- 
2.2.1


