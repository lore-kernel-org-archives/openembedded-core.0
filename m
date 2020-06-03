Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.5893.1591152858260891960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 19:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vbeKprri;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id r2so1007549ila.4
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 19:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qLE2xavfWqzPiMNJYNxkmr/DoKEttQByHYxmiFhLxI0=;
        b=vbeKprriPWsjC8mMuRlemYSFWkIdWBj4q4Dm90W9/PO1h7KCqHeuJYpcfIfCK4vY4u
         fTA2Mv0WUGV84wJFYr3AUpq918NndkVtK5n4QOvYXwtV1RevTfzexCZNgumNDXNi590E
         uX0V57TfiuZsAkAaqXwlF5jR/OvfIoR4+zDgQo3hJ48kTCTpY4KpCyqZjEMqlGzCsnUi
         YcBUQZhi4ElQC1SEiO2p3cgsJKENAW+eHjd9SGmy1LB0KUViIJkRZIc+Yax5u7Y0PLcA
         QOfgi4CPwW56IaVRqO0aahS1HcZqMJxcLS1cXM7kDcSXi20gnu+9SKW2aZKPaNZsiYo+
         vibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qLE2xavfWqzPiMNJYNxkmr/DoKEttQByHYxmiFhLxI0=;
        b=f3+NIs3BB4pv+0AbXalLuXGd2jahyirq/lyLQjfle4B53ZWoy8JzaC/uWofD/4F66w
         S4sVMms22L8joNr1JHntci9HXgJFPehXVKS9hzQbxZty5mnmoHksLqyhyCSLPdv683aY
         aK3sxvOi7B/l1mWa7Qv1vKLuYidyRriFR9NzyYfVwE0r3RfBeAr8wAoQ1X116ufTqpP3
         POkznGv0/HaBDUFMC6gQWtWVqJVmxn+Z1kDXFdfkZAETRGZT0RlfGjHxoU5SwwSsp+Qf
         rn948xA195hju76NIuHCd5BCbuTcOCabInju6B+7DveTPa6qPBUqSYb4PgPu0C8xUyz5
         KAzQ==
X-Gm-Message-State: AOAM530+K73wpqjfOxvNG3nVl2eD16I8G21Kl/DUgq4POiyCiHdCRJzO
	6DJcGYRuKYuJbyyQgOYfS3TBcESl0zM=
X-Google-Smtp-Source: ABdhPJzWrUyRPnvf0AbrV/hKtdQZHi+owletZ4Ay924fQLkUIxhBkmgDD/x5sNTM/UAWAtnE57x72w==
X-Received: by 2002:a92:155d:: with SMTP id v90mr2067291ilk.73.1591152857178;
        Tue, 02 Jun 2020 19:54:17 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:b01b:daad:c850:7bb9])
        by smtp.gmail.com with ESMTPSA id x15sm355643ilj.78.2020.06.02.19.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 19:54:16 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 7/8] bitbake: tests: Add tests for BBMASK in multiconfig
Date: Tue,  2 Jun 2020 21:54:04 -0500
Message-Id: <20200603025405.26885-8-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200603025405.26885-1-JPEWhacker@gmail.com>
References: <20200601202807.26357-1-JPEWhacker@gmail.com>
 <20200603025405.26885-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a test to validate that multiconfigs can independently mask off
recipes by setting BBMASK. See the test description for further
information about how the test works.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../lib/bb/tests/runqueue-tests/conf/bitbake.conf |  3 ++-
 .../runqueue-tests/conf/multiconfig/mc1.conf      |  1 +
 .../runqueue-tests/conf/multiconfig/mc2.conf      |  1 +
 .../runqueue-tests/recipes/fails-mc/fails-mc1.bb  |  5 +++++
 .../runqueue-tests/recipes/fails-mc/fails-mc2.bb  |  4 ++++
 bitbake/lib/bb/tests/runqueue.py                  | 15 +++++++++++++++
 6 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 bitbake/lib/bb/tests/runqueue-tests/recipes/fails-mc/fails-mc1.bb
 create mode 100644 bitbake/lib/bb/tests/runqueue-tests/recipes/fails-mc/fails-mc2.bb

diff --git a/bitbake/lib/bb/tests/runqueue-tests/conf/bitbake.conf b/bitbake/lib/bb/tests/runqueue-tests/conf/bitbake.conf
index 5e451fc2c0..efebf001a9 100644
--- a/bitbake/lib/bb/tests/runqueue-tests/conf/bitbake.conf
+++ b/bitbake/lib/bb/tests/runqueue-tests/conf/bitbake.conf
@@ -1,7 +1,8 @@
 CACHE = "${TOPDIR}/cache"
 THISDIR = "${@os.path.dirname(d.getVar('FILE'))}"
 COREBASE := "${@os.path.normpath(os.path.dirname(d.getVar('FILE')+'/../../'))}"
-BBFILES = "${COREBASE}/recipes/*.bb"
+EXTRA_BBFILES ?= ""
+BBFILES = "${COREBASE}/recipes/*.bb ${EXTRA_BBFILES}"
 PROVIDES = "${PN}"
 PN = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[0]}"
 PF = "${BB_CURRENT_MC}:${PN}"
diff --git a/bitbake/lib/bb/tests/runqueue-tests/conf/multiconfig/mc1.conf b/bitbake/lib/bb/tests/runqueue-tests/conf/multiconfig/mc1.conf
index ecf23e1c73..f34b8dcccf 100644
--- a/bitbake/lib/bb/tests/runqueue-tests/conf/multiconfig/mc1.conf
+++ b/bitbake/lib/bb/tests/runqueue-tests/conf/multiconfig/mc1.conf
@@ -1 +1,2 @@
 TMPDIR = "${TOPDIR}/mc1/"
+BBMASK += "recipes/fails-mc/fails-mc1.bb"
diff --git a/bitbake/lib/bb/tests/runqueue-tests/conf/multiconfig/mc2.conf b/bitbake/lib/bb/tests/runqueue-tests/conf/multiconfig/mc2.conf
index eef338e4cc..c3360fc5c8 100644
--- a/bitbake/lib/bb/tests/runqueue-tests/conf/multiconfig/mc2.conf
+++ b/bitbake/lib/bb/tests/runqueue-tests/conf/multiconfig/mc2.conf
@@ -1 +1,2 @@
 TMPDIR = "${TOPDIR}/mc2/"
+BBMASK += "recipes/fails-mc/fails-mc2.bb"
diff --git a/bitbake/lib/bb/tests/runqueue-tests/recipes/fails-mc/fails-mc1.bb b/bitbake/lib/bb/tests/runqueue-tests/recipes/fails-mc/fails-mc1.bb
new file mode 100644
index 0000000000..17a181fffb
--- /dev/null
+++ b/bitbake/lib/bb/tests/runqueue-tests/recipes/fails-mc/fails-mc1.bb
@@ -0,0 +1,5 @@
+python () {
+    if d.getVar("BB_CURRENT_MC") == "mc1":
+        bb.fatal("Multiconfig is mc1")
+}
+
diff --git a/bitbake/lib/bb/tests/runqueue-tests/recipes/fails-mc/fails-mc2.bb b/bitbake/lib/bb/tests/runqueue-tests/recipes/fails-mc/fails-mc2.bb
new file mode 100644
index 0000000000..cc69e7b82d
--- /dev/null
+++ b/bitbake/lib/bb/tests/runqueue-tests/recipes/fails-mc/fails-mc2.bb
@@ -0,0 +1,4 @@
+python () {
+    if d.getVar("BB_CURRENT_MC") == "mc2":
+        bb.fatal("Multiconfig is mc2")
+}
diff --git a/bitbake/lib/bb/tests/runqueue.py b/bitbake/lib/bb/tests/runqueue.py
index 4ba12a0772..091b5e41e0 100644
--- a/bitbake/lib/bb/tests/runqueue.py
+++ b/bitbake/lib/bb/tests/runqueue.py
@@ -232,6 +232,21 @@ class RunQueueTests(unittest.TestCase):
                 expected.remove(x)
             self.assertEqual(set(tasks), set(expected))
 
+    def test_multiconfig_bbmask(self):
+        # This test validates that multiconfigs can independently mask off
+        # recipes they do not want with BBMASK. It works by having recipes
+        # that will fail to parse for mc1 and mc2, then making each multiconfig
+        # build the one that does parse. This ensures that the recipes are in
+        # each multiconfigs BBFILES, but each is masking only the one that
+        # doesn't parse
+        with tempfile.TemporaryDirectory(prefix="runqueuetest") as tempdir:
+            extraenv = {
+                "BBMULTICONFIG" : "mc1 mc2",
+                "BB_SIGNATURE_HANDLER" : "basic",
+                "EXTRA_BBFILES": "${COREBASE}/recipes/fails-mc/*.bb",
+            }
+            cmd = ["bitbake", "mc:mc1:fails-mc2", "mc:mc2:fails-mc1"]
+            self.run_bitbakecmd(cmd, tempdir, "", extraenv=extraenv)
 
     @unittest.skipIf(sys.version_info < (3, 5, 0), 'Python 3.5 or later required')
     def test_hashserv_single(self):
-- 
2.26.2

