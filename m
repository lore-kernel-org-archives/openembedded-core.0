Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id E37917E094
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 16:57:25 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id v7so11559408iob.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 09:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OwDndQ3qy/JW3vBdSM4MwH3MwwEV6dUxpYqGj57JDUo=;
	b=N0BZjRwdz/a6LSSjHaV0elK2ZYjUdzyrNBrVhy4hs5xGx38JOjLjRKQ8mfQ/QOn7IX
	OM0c4A1467qFWjioO99fOCJMXIAgEJ594W3AuIqM5oCaFV44j9Y89Cvd4I/uhucq4nKD
	7G/qwWjWrYryancb1rPktilTzCgzvQNzRVYRPaquV+3pOJUBNtxqFvpK4KQYBEoDnY6w
	6oFFBKq5eAtXN48JPZSwZv5qKAAWblN05QdTkkGq3rj7/dh2nJ4JnZ/dxfMyJGzljFQP
	JO7p2PBwHcGnkx42Dip+ZzOV0+hVC4xKOYUKA7pTZ1V/AL1Wzt4TRCeryMnppgZPNeyl
	v9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OwDndQ3qy/JW3vBdSM4MwH3MwwEV6dUxpYqGj57JDUo=;
	b=PsRApyohsZ6CmkQk69cdUHNnJ7jxHqsE+5MJqpQgv2FHe/Ve9J9/+Q3VpJDXBmWxMF
	Vh5xqOZDl+94zswqfCgiw7XzRkYjmAvKOpHVPOWsjXiNe+wBzimdZ41zp0lPS4RduyZN
	oiK0o1spBGKJl/y/qLgHMb//xemqAM34QzfWmnYcq70L7L46CoJj6BqD6owK2r6NzUP0
	jsWabpfTPVbKHDQ5TlK7lN0Fh/tZKfSVK68+QhHmgVLPP4wUILQhxej4ECnSCf9JjHcJ
	kqfjozwGFq9W2JeRNrk8Xw+gYvGj0g/sxg+Dx/m+XpPSR8G61/dxSy9dY5T+EsBUCxT7
	ZeaA==
X-Gm-Message-State: APjAAAWlwxScTwCK1n94AbfPkE5BZbsfq5OH760i7XxIeuNXFzSyBL9+
	IIT9r/cutXqERCrQwqAPw52ZhS6o
X-Google-Smtp-Source: APXvYqzEUlG71miNTEpWUwsJmSnh4lEdAoHAa38gaB2UiO7nBr2lW5KJheA5p5gBZvFqkOmJ6A0mLQ==
X-Received: by 2002:a5d:9b04:: with SMTP id y4mr8804504ion.195.1558371446622; 
	Mon, 20 May 2019 09:57:26 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id b8sm5633122ior.5.2019.05.20.09.57.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 May 2019 09:57:25 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 11:57:19 -0500
Message-Id: <20190520165719.20041-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520165719.20041-1-JPEWhacker@gmail.com>
References: <20190520165719.20041-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] oeqa: Add reproducible build selftest
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
X-List-Received-Date: Mon, 20 May 2019 16:57:26 -0000
Content-Transfer-Encoding: 8bit

Adds an initial test for reproducible builds to the OE selftest. This
initial test builds core-image-minimal using sstate, then does a clean
build without sstate in another build directory, and finally does a
binary comparison of the resulting package files between the two builds.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 159 +++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/reproducible.py

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
new file mode 100644
index 00000000000..bf568a4c8ef
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -0,0 +1,159 @@
+#
+# SPDX-License-Identifier: MIT
+#
+# Copyright 2019 by Garmin Ltd. or its subsidiaries
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
+import bisect
+import functools
+import multiprocessing
+import textwrap
+
+MISSING = 'MISSING'
+DIFFERENT = 'DIFFERENT'
+SAME = 'SAME'
+
+@functools.total_ordering
+class CompareResult(object):
+    def __init__(self):
+        self.reference = None
+        self.test = None
+        self.status = 'UNKNOWN'
+
+    def __eq__(self, other):
+        return (self.status, self.test) == (other.status, other.test)
+
+    def __lt__(self, other):
+        return (self.status, self.test) < (other.status, other.test)
+
+class PackageCompareResults(object):
+    def __init__(self):
+        self.total = []
+        self.missing = []
+        self.different = []
+        self.same = []
+
+    def add_result(self, r):
+        self.total.append(r)
+        if r.status == MISSING:
+            self.missing.append(r)
+        elif r.status == DIFFERENT:
+            self.different.append(r)
+        else:
+            self.same.append(r)
+
+    def sort(self):
+        self.total.sort()
+        self.missing.sort()
+        self.different.sort()
+        self.same.sort()
+
+    def __str__(self):
+        return 'same=%i different=%i missing=%i total=%i' % (len(self.same), len(self.different), len(self.missing), len(self.total))
+
+def compare_file(reference, test, diffutils_sysroot):
+    result = CompareResult()
+    result.reference = reference
+    result.test = test
+
+    if not os.path.exists(reference):
+        result.status = MISSING
+        return result
+
+    r = runCmd(['cmp', '--quiet', reference, test], native_sysroot=diffutils_sysroot, ignore_status=True)
+
+    if r.status:
+        result.status = DIFFERENT
+        return result
+
+    result.status = SAME
+    return result
+
+class ReproducibleTests(OESelftestTestCase):
+    package_classes = ['deb']
+    images = ['core-image-minimal']
+
+    def setUpLocal(self):
+        super().setUpLocal()
+        needed_vars = ['TOPDIR', 'TARGET_PREFIX', 'BB_NUMBER_THREADS']
+        bb_vars = get_bb_vars(needed_vars)
+        for v in needed_vars:
+            setattr(self, v.lower(), bb_vars[v])
+
+        if not hasattr(self.tc, "extraresults"):
+            self.tc.extraresults = {}
+        self.extras = self.tc.extraresults
+
+        self.extras.setdefault('reproducible.rawlogs', {})['log'] = ''
+
+    def append_to_log(self, msg):
+        self.extras['reproducible.rawlogs']['log'] += msg
+
+    def compare_packages(self, reference_dir, test_dir, diffutils_sysroot):
+        result = PackageCompareResults()
+
+        old_cwd = os.getcwd()
+        try:
+            file_result = {}
+            os.chdir(test_dir)
+            with multiprocessing.Pool(processes=int(self.bb_number_threads or 0)) as p:
+                for root, dirs, files in os.walk('.'):
+                    async_result = []
+                    for f in files:
+                        reference_path = os.path.join(reference_dir, root, f)
+                        test_path = os.path.join(test_dir, root, f)
+                        async_result.append(p.apply_async(compare_file, (reference_path, test_path, diffutils_sysroot)))
+
+                    for a in async_result:
+                        result.add_result(a.get())
+
+        finally:
+            os.chdir(old_cwd)
+
+        result.sort()
+        return result
+
+    def test_reproducible_builds(self):
+        capture_vars = ['DEPLOY_DIR_' + c.upper() for c in self.package_classes]
+
+        common_config = textwrap.dedent('''\
+            INHERIT += "reproducible_build"
+            PACKAGE_CLASSES = "%s"
+            ''') % (' '.join('package_%s' % c for c in self.package_classes))
+
+        # Do an initial build. It's acceptable for this build to use sstate
+        self.write_config(common_config)
+        vars_reference = get_bb_vars(capture_vars)
+        bitbake(' '.join(self.images))
+
+        # Build native utilities
+        bitbake("diffutils-native -c addto_recipe_sysroot")
+        diffutils_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "diffutils-native")
+
+        # Perform another build. This build should *not* share sstate or pull
+        # from any mirrors, but sharing a DL_DIR is fine
+        self.write_config(textwrap.dedent('''\
+            TMPDIR = "${TOPDIR}/reproducible/tmp"
+            SSTATE_DIR = "${TMPDIR}/sstate"
+            SSTATE_MIRROR = ""
+            ''') + common_config)
+        vars_test = get_bb_vars(capture_vars)
+        bitbake(' '.join(self.images))
+
+        for c in self.package_classes:
+            package_class = 'package_' + c
+
+            deploy_reference = vars_reference['DEPLOY_DIR_' + c.upper()]
+            deploy_test = vars_test['DEPLOY_DIR_' + c.upper()]
+
+            result = self.compare_packages(deploy_reference, deploy_test, diffutils_sysroot)
+
+            self.logger.info('Reproducibility summary for %s: %s' % (c, result))
+
+            self.append_to_log('\n'.join("%s: %s" % (r.status, r.test) for r in result.total))
+
+            if result.missing or result.different:
+                self.fail("The following %s packages are missing or different: %s" %
+                        (c, ' '.join(r.test for r in (result.missing + result.different))))
+
-- 
2.21.0


