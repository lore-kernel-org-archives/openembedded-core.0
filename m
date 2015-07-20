Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6FDAD75979
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 22:15:22 +0000 (UTC)
Received: by padck2 with SMTP id ck2so107163143pad.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 15:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=073f450Q7o/cwVjILMo50NQMM0NDbFYYAPVGDIqfBSE=;
	b=roYRd+rlnaviGvHDs0airvLe11yb4ZySC1/ja8tZA/03xdXgSHMAXIbfdd5/6jHVW/
	tslGdBE3ruBTazVGmizSNZUgRLonXVxcjlblMhYBUE4c8ONPypH5ld6f+Z+gfc6KVo6q
	y0Guaw3gq+QVtd6G2S5Kh+oIrOMMoxuKx1GlzDA5TKLtMQUsMNfqDTpL9I1kYsnNQADN
	MUpBmxsrReh9qE4ONI8xfXPeQDYQNBjMnRFIn8eZouvqrFC2rTsuHs2adz9IfwZm/TVW
	aDA2r2T8j/MwbDSMbcQHxlhqJYM+1oX2/rBgkgaW8gsppHCwb5g0j/ddHvAtK7Qo1rPX
	DCsQ==
X-Received: by 10.70.38.170 with SMTP id h10mr27348010pdk.34.1437430523305;
	Mon, 20 Jul 2015 15:15:23 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	f1sm23612727pdp.39.2015.07.20.15.15.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jul 2015 15:15:22 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jul 2015 15:15:55 -0700
Message-Id: <e8e2307109ee2c1e39265dda5fad2d481a299433.1437430369.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <c5e5bbd5f85ed4ae437815656889d328da25e75b.1437430369.git.chris_larson@mentor.com>
References: <c5e5bbd5f85ed4ae437815656889d328da25e75b.1437430369.git.chris_larson@mentor.com>
In-Reply-To: <cover.1437430369.git.chris_larson@mentor.com>
References: <cover.1437430369.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 5/6] oe-selftest: obey oeqa.selftest.__path__
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
X-List-Received-Date: Mon, 20 Jul 2015 22:15:23 -0000

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


