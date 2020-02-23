Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id D46D061621
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 13:53:23 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id g3so7243392wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 05:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DsnJco9o0vKlZwps5TAkHS9JKaHPKkoTUcd8sXpz4w4=;
	b=rDlbCKkXwRyXxcCVt3xtuMeQd91RoE+V1268uESu5wYHAKvW6/0ccQM3bJr741OpzO
	b4oHZR6s0V85Tl/EUzRroGaBDSDCxpL9QAKw3kVLnSJ4tSmq1xKH6zHcnyXEwYiQIkx3
	bJev5tBA/EjojskwqWGfYy72rPDgejdd+i+KDIinIGO4jjv8OX3TQkcdYYaFHWVR4Isr
	06pCDsM/N0A+JIsXcN6xKucupZmFR2vnmeoW6aBX7VlqOKs4noR4+jod1Arp6y2WiDdE
	JVpZd4a7XS5sZDnCycj1/9cvwH8mnb1/WLWFfI3JujA/Y0fy91+PKlC6jMczhnYNmuDw
	TKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DsnJco9o0vKlZwps5TAkHS9JKaHPKkoTUcd8sXpz4w4=;
	b=GsuFNeKzBNRYpWt+Y2X08tv1TXvg04ruEkHPG3Pgn3qo0B65RVmMAEBw2bybrEOc/I
	v3zwRXsB6GtQTzPtwnKUqoSJpXFppwreTwqwfDDZ0ovdl+o4VJPyzuBu02v6jZ+dGZUp
	YblpKzhdVrN4KAVe9Aq59TL61s+Y4m9WA15FYaVnLD52fwEF6vLA7A98eVQGMfEdbPcd
	oGmPk9mTYWq4M2RhSU3SjHFWM2C5pjoQ5ssXTgqJKblF2SgYb1dingPAwBUqkKtGLNKY
	HBEd57aSr8tX2o28t7F8eiXptXJGEOYWBi5byFV1tzZ1ues+4ci5gUsnH0A0SHV3xBkK
	uexg==
X-Gm-Message-State: APjAAAXV+C9fuxX+NFISwaOQ9P3CJtgmTw8NYFM8gpvfNDQPfY6BmxYC
	UYirR1og/YKMvxnsXUSVfGoKTtHc
X-Google-Smtp-Source: APXvYqzVUtfEKd7V9Tw3noXgYftwNOd8NcFsF+Pbal7S0wFLT70pY/9EG44H6tbUBld8Hx7XjksvNQ==
X-Received: by 2002:adf:b60f:: with SMTP id f15mr63430271wre.372.1582466004355;
	Sun, 23 Feb 2020 05:53:24 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	g15sm13984949wro.65.2020.02.23.05.53.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 23 Feb 2020 05:53:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 14:52:31 +0100
Message-Id: <20200223135231.22138-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200223135231.22138-1-alex.kanavin@gmail.com>
References: <20200223135231.22138-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] ptest: add an option to enforce a failure (e.g. ptests are required to pass)
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
X-List-Received-Date: Sun, 23 Feb 2020 13:53:24 -0000
Content-Transfer-Encoding: 8bit

This can be useful with a more specific, targeted and robust set of ptest
packages; the benefit is that ptest regressions are caught as they happen
and can be more easily traced to changes that caused them.

The existing AB ptest image continues to be expected to fail, my observation
of the AB runs is that the full set of ptests is not robust enough
(particularly around socket/network related tests) and sporadically fails
in random places. This can probably be addressed by making ptests exclusive
to a worker (e.g. there is no other workload happening at the same time as
ptests).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/runtime/cases/ptest.py              | 15 ++++++++++++++-
 .../images/core-image-sato-sdk-ptest.bb           |  3 +++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index eb284df439..5626f707b9 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -18,7 +18,20 @@ class PtestRunnerTest(OERuntimeTestCase):
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['ptest-runner'])
     @unittest.expectedFailure
-    def test_ptestrunner(self):
+    def test_ptestrunner_expectfail(self):
+        if not self.td.get('PTEST_EXPECT_FAILURE'):
+            self.skipTest('Cannot run ptests with @expectedFailure as ptests are required to pass')
+        self.do_ptestrunner()
+
+    @skipIfNotFeature('ptest', 'Test requires ptest to be in DISTRO_FEATURES')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['ptest-runner'])
+    def test_ptestrunner_expectsuccess(self):
+        if self.td.get('PTEST_EXPECT_FAILURE'):
+            self.skipTest('Cannot run ptests without @expectedFailure as ptests are expected to fail')
+        self.do_ptestrunner()
+
+    def do_ptestrunner(self):
         status, output = self.target.run('which ptest-runner', 0)
         if status != 0:
             self.skipTest("No -ptest packages are installed in the image")
diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index 58c257c49f..bf749acd79 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -18,3 +18,6 @@ IMAGE_ROOTFS_EXTRA_SPACE = "1124288"
 # ptests need more memory than standard to avoid the OOM killer
 # also lttng-tools needs /tmp that has at least 1G
 QB_MEM = "-m 2048"
+
+# Sadly at the moment the full set of ptests is not robust enough and sporadically fails in random places
+PTEST_EXPECT_FAILURE = "1"
-- 
2.25.0


