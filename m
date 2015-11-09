Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4AD0A65CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 22:02:29 +0000 (UTC)
Received: by wmec201 with SMTP id c201so104001808wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Nov 2015 14:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=3yI1YFtfJXC7aqRe/I91tIVjqsszWZJK+tLsqIJPZhY=;
	b=TXwgXVz7RLAKwhDeRfmngzPGaTCcVsBL1iZOhp+UYREFfyHOnWT3uz+B2/hs1upd9b
	C89Ag2PRn9U/9mlLZDBbsuQ2RlHFjrKJ17bbB5rT+tw0X8cbgo/KqFJH9eaxutI3wFat
	CEmphdeFzvk6VHStqm4tsvJ/GIsiosJpjRKxN9dleBKX7f1TiQUKVRNbvcSZba24J3KK
	paYqiW/3n6oRFreA9rCvm5yb8mp6jutnxRnChWHOwYNsyaDcUV7v9xA9M2wMxCiXmPie
	MrSn9t6zSp/hpHcJG9MKSLnl8p6J+TDOlYecJdQ9PZ4ZQjhW7pm7YQtlM2rDWqZRFv9M
	Zhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3yI1YFtfJXC7aqRe/I91tIVjqsszWZJK+tLsqIJPZhY=;
	b=SMZMIO0bn4E/rNM+MlUuJidBpAF0vy6LD5UyONqPTgo7T/SjD2fABlegjDRtDChTCL
	P8yk1Z3/J0vZDSlkZCMtYCf4RKeEMzNQ9UG36hLMRE+zDDiqijuAIjP+7C7i/7dPVvXK
	dZhL2bah968gCw1CTskwYgU9hv/rg1x9zwc9h6hbfgD8dScEiIA1ShOCCYNYtPKGAhny
	F8kbZnYruUifvz/StlcVFFLZxzdWeG5dJlVvhAeYhb4jbvLxOvJ1Vb0t7OQCsO/51b/Y
	2f/sekUBimK5PY8HXzscYivGoCBGziI6bTmN2xZ76LNNQAbFzKzMNjEaV99DxBmisT6W
	etjQ==
X-Gm-Message-State: ALoCoQlQn3mUHzkWXnxrz9AeeVNI69NC7SrJfB9Met+tmKcePiD+UPFJL6yzxdQqKfkcvqInfg7r
X-Received: by 10.194.23.104 with SMTP id l8mr173643wjf.132.1447106549323;
	Mon, 09 Nov 2015 14:02:29 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id u17sm718290wmd.8.2015.11.09.14.02.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Nov 2015 14:02:28 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 21:54:12 +0000
Message-Id: <1447106052-12454-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/selftest/sstatetests: prettier output for allarch test
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
X-List-Received-Date: Mon, 09 Nov 2015 22:02:34 -0000

Instead of creating two lists of full paths and comparing them which in failure
produces a list of every stamp file (so all tasks, twice), reduce the filename
down to a recipe/task->hash dictionary and compare those, meaning unittest
shows the differences in the dictionaries.

In the future get_files() should be generalised so all tests in this class can
use it, and find a pair of hashes that don't match and run diffsigs on them.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/sstatetests.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index 3c23062..512cb4f 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -309,27 +309,27 @@ MACHINE = \"qemuarm\"
         bitbake("world meta-toolchain -S none")
 
         def get_files(d):
-            f = []
+            f = {}
             for root, dirs, files in os.walk(d):
                 for name in files:
                     if "meta-environment" in root or "cross-canadian" in root:
                         continue
                     if "do_build" not in name:
-                        f.append(os.path.join(root, name))
+                        # 1.4.1+gitAUTOINC+302fca9f4c-r0.do_package_write_ipk.sigdata.f3a2a38697da743f0dbed8b56aafcf79
+                        (_, task, _, shash) = name.rsplit(".", 3)
+                        f[os.path.join(os.path.basename(root), task)] = shash
             return f
         files1 = get_files(topdir + "/tmp-sstatesamehash/stamps/all" + targetvendor + "-" + targetos)
         files2 = get_files(topdir + "/tmp-sstatesamehash2/stamps/all" + targetvendor + "-" + targetos)
-        files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash") for x in files2]
         self.maxDiff = None
-        self.assertItemsEqual(files1, files2)
+        self.assertEqual(files1, files2)
 
         nativesdkdir = os.path.basename(glob.glob(topdir + "/tmp-sstatesamehash/stamps/*-nativesdk*-linux")[0])
 
         files1 = get_files(topdir + "/tmp-sstatesamehash/stamps/" + nativesdkdir)
         files2 = get_files(topdir + "/tmp-sstatesamehash2/stamps/" + nativesdkdir)
-        files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash") for x in files2]
         self.maxDiff = None
-        self.assertItemsEqual(files1, files2)
+        self.assertEqual(files1, files2)
 
     @testcase(1369)
     def test_sstate_sametune_samesigs(self):
-- 
2.1.4


