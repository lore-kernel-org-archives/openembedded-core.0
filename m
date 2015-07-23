Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 45F36761D6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 19:57:26 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so1219984pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 12:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=073f450Q7o/cwVjILMo50NQMM0NDbFYYAPVGDIqfBSE=;
	b=UBUqWGkUZp0HWHdAJHYNVGcb/bUzUOgP0BFm+eSBaNkik05GE6nYySpL188gV6Rdc5
	GzJ0S1Td53U54c7kqTXi0P9xEbSfRJgpsYYQpJtEbR0sG3pdyiLdJIz+02kNaNtQscsS
	y9XG1wJ99+E0C1XV0Ned9YLdBZDcQHFiSQpLAq/HBZPiqA/JVr5+azdEsGU5hKse0kcd
	5nd0h7wf/OdGH0K6H/2ArH4dPB/Pf1qPbwxS+UQrZ2EikYYEgq2vA83L/pdp8fNv6yZ2
	gB3V5XIikPBUSyDQ5e/H9ouLvqiWwkByCC01eWgbaKcNooShVTriDBngGH7Rag5Uzj8H
	1ylg==
X-Received: by 10.70.132.135 with SMTP id ou7mr22073848pdb.112.1437681446578; 
	Thu, 23 Jul 2015 12:57:26 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id j9sm5019734pdl.65.2015.07.23.12.57.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jul 2015 12:57:25 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 12:58:11 -0700
Message-Id: <5e4d26c052e1b835b9850a73c7a28a495075fde9.1437663603.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <38fd16a3ab690b57f0b920bb961881ccdef04fb2.1437663603.git.chris_larson@mentor.com>
References: <38fd16a3ab690b57f0b920bb961881ccdef04fb2.1437663603.git.chris_larson@mentor.com>
In-Reply-To: <cover.1437663603.git.chris_larson@mentor.com>
References: <cover.1437663603.git.chris_larson@mentor.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv3 6/7] oe-selftest: obey oeqa.selftest.__path__
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
X-List-Received-Date: Thu, 23 Jul 2015 19:57:27 -0000

From: Christopher Larson <chris_larson@mentor.com>

This ensures that all paths that hold selftest tests will be checked
(oeqa.selftest is a namespace package).

[YOCTO #7625]

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
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


