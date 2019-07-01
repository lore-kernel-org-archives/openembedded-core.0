Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3EBDB7E799
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 18:23:13 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id k8so31062823iot.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 11:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TjSj0XwgO/04uNDvBzAfJlwVbxoSrobiUh+l3IsWXqw=;
	b=EqCFjSf/u0zGDyY5YVbjZ2jl/PIlI3gyFxH6zi1mhIDW9JOZlb3bl4snybyKVAVXlD
	BzQYVDbWVxlItkJDj+u+LaC3/vrt63hEOmY1f6ElpYAM3sMEXV6zKix+IXbYEh9Xo9Mp
	xIlAbjCHwdzJpULaOkiwhX1i/aaHkgDBlS8B2doK9yHcyJ5NjmysryzdukjyKvyMB4x5
	6KdU4Ntj9cqfDoG2uDAnvnYDwoA8aM8EPr7hwBafFh4PTG+CzeQFelx2ImYj0vGSQUHV
	lm+kzF7FSUIDfA98/bpLO+gdtKv9Ayfd7J4HcKdMeQQkheO0/Uwf7z89NOeHiCXLH47z
	Fvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TjSj0XwgO/04uNDvBzAfJlwVbxoSrobiUh+l3IsWXqw=;
	b=TupG6T65ZQxtnTeMgimvRAqCxa2StDI8Tqb1IpIeTYnXEYotUq3i2g5rCt8de5I+Fn
	ZJseqp9ro+JJC/5gZCxME2sRfDhrgNO/LUr+DDH4Sk70MmE6xd9bSbmIN/vozvyJNJOE
	9elvFVLKeA8bHXPlUR4D1Tz+FbxDIC7rrJU75fJ4JI04cZ1He4bhn4t0A5+U+q03YNve
	GbxiBoA4vbLXAe9WjmOQNJRD08x7gdc9Ok/FlVRlGZSZjnvqp3wg/7irlVlSWTJ01gTL
	tfM9WMJdvyOm+xHctfRl8kRKWlVz6ZuU9O/9XG56KvAKD6tRPXXYRs/6e5mU8dkUR9dd
	iiJg==
X-Gm-Message-State: APjAAAUD+8puPIONNMqD1wGu2Zk0vWELvVazj/EblIxNKBYkoVBJyD5w
	5sz6s7mGxjQdbMi81q+0h9dqK+kT
X-Google-Smtp-Source: APXvYqytufToPl3T1rhi9w/beLj2r2x3QgdQfrf1e8lQnP5UBVzGkbOchCYl+hZyeRXBwoUr8kTA1g==
X-Received: by 2002:a5e:da4b:: with SMTP id o11mr26551681iop.212.1562005393938;
	Mon, 01 Jul 2019 11:23:13 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	20sm11479443iog.62.2019.07.01.11.23.13
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 01 Jul 2019 11:23:13 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2019 13:23:06 -0500
Message-Id: <20190701182306.32677-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] oeqa: Test bitbake --skip-setsecene
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
X-List-Received-Date: Mon, 01 Jul 2019 18:23:13 -0000
Content-Transfer-Encoding: 8bit

Tests the bitbake --skip-setscene option to verify that it correctly
reuses tasks previously restored from sstate, but doesn't execute new
sstate tasks

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 30 +++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index e9ad44b027e..2a310bc4af2 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -242,6 +242,36 @@ INHERIT_remove = \"report-error\"
             self.assertIn('_setscene', task, 'A task different from _setscene ran: %s.\n'
                                              'Executed tasks were: %s' % (task, str(tasks)))
 
+    def test_skip_setscene(self):
+        test_recipe = 'ed'
+
+        bitbake(test_recipe)
+        bitbake('-c clean %s' % test_recipe)
+
+        ret = bitbake('--setscene-only %s' % test_recipe)
+        tasks = re.findall(r'task\s+(do_\S+):', ret.output)
+
+        for task in tasks:
+            self.assertIn('_setscene', task, 'A task different from _setscene ran: %s.\n'
+                                             'Executed tasks were: %s' % (task, str(tasks)))
+
+        # Run without setscene. Should do nothing
+        ret = bitbake('--skip-setscene %s' % test_recipe)
+        tasks = re.findall(r'task\s+(do_\S+):', ret.output)
+
+        self.assertFalse(tasks, 'Tasks %s ran when they should not have' % (str(tasks)))
+
+        # Clean (leave sstate cache) and run with --skip-setscene. No setscene
+        # tasks should run
+        bitbake('-c clean %s' % test_recipe)
+
+        ret = bitbake('--skip-setscene %s' % test_recipe)
+        tasks = re.findall(r'task\s+(do_\S+):', ret.output)
+
+        for task in tasks:
+            self.assertNotIn('_setscene', task, 'A _setscene task ran: %s.\n'
+                                                'Executed tasks were: %s' % (task, str(tasks)))
+
     def test_bbappend_order(self):
         """ Bitbake should bbappend to recipe in a predictable order """
         test_recipe = 'ed'
-- 
2.21.0


