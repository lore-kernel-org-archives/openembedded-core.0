Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 316CC7947D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Oct 2018 12:48:29 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id d2-v6so1684875wro.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Oct 2018 05:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BmiOwtddznsojPW+Z6hrSblBn4dijZhs6mABv3W1lIM=;
	b=dHXSkayMJ3Yin+YNuXEXpxNXyMkHi7FCDBDyyP5t5ERBly/ByN1Ms6ZwIiBVFYrjBj
	F38lqNKnOXFu5kX3lzyY9+y/FaMiU7mJDTu7CtbZ8jNeRKCnEPhbPXSX40NIVfArpsax
	x7WAgJ4B1Xo0MgbHQj2J6zwsVDTVBSDLi/Qcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BmiOwtddznsojPW+Z6hrSblBn4dijZhs6mABv3W1lIM=;
	b=Bf9VqEtGzrLCs6RO+EsGew5pZJ9QPKIjKyZiQxjoyMdsBx9Co5Nu/OotkBHEVXjeJW
	qJWY9dUqlY3i5OWLk6AWz2krwPvp9R89boXZMsPZf2FPk7mTeTioBIX3AGl/lEnQjjsl
	dhXQ2GwpyHTHJeZL8hcj1Ba5jIgtjgQlQEDi4PpNN9GBCf895W5pG8RevQAtBUgSWKn/
	Cn377E//NsfFxCZSfn37ee/oyFHVWzIfZlqHR3X9VOaFYtqGYsHAbPK8rysxjX4nUjLb
	Ebi3rKTlga2Bie5i5+stqYkrKgPzU/fU652xoFy3cbIg21PhaQsU4k/LBloSs95JDC1g
	BFLQ==
X-Gm-Message-State: ABuFfogYucW/736Gn59omXGQz1tI6itKqsCGb5CoEtNlAjS4XxIsWED1
	nyqY4vAVmiEpGnb59h+Mu6bgDZ+H/v0=
X-Google-Smtp-Source: ACcGV62ky7KZJ3EjiIt5oKlVeO8nGtiTB1qkMkOlDB7u2oL/9fk7imBVZcDCLaa0aKy03NiLAUiImg==
X-Received: by 2002:adf:f7c1:: with SMTP id
	a1-v6mr18547327wrq.152.1539089309363; 
	Tue, 09 Oct 2018 05:48:29 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i4-v6sm21599592wrs.87.2018.10.09.05.48.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Oct 2018 05:48:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2018 13:48:25 +0100
Message-Id: <20181009124825.11864-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181009124825.11864-1-richard.purdie@linuxfoundation.org>
References: <20181009124825.11864-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] selftest/runqemu: Handle SystemExit
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
X-List-Received-Date: Tue, 09 Oct 2018 12:48:29 -0000

The sigchld handler in runqemu can raise a SystemExit when qemu shuts down.
Rather than backtracing, accept this as a successful test result.

ERROR: runqemu.QemuTest.test_qemu_can_shutdown (subunit.RemotedTestCase)
testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/runqemu.py", line 183, in test_qemu_can_shutdown
    qemu_shutdown_succeeded = self._start_qemu_shutdown_check_if_shutdown_succeeded(qemu, shutdown_timeout)
  File "/home/pokybuild/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/runqemu.py", line 175, in _start_qemu_shutdown_check_if_shutdown_succeeded
    time.sleep(1)
  File "/home/pokybuild/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/utils/qemurunner.py", line 100, in handleSIGCHLD
    raise SystemExit
SystemExit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index e57f503a577..edc2e424e6e 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -166,14 +166,17 @@ class QemuTest(OESelftestTestCase):
         # when qemu was shutdown by the above shutdown command
         qemu.runner.stop_thread()
         time_track = 0
-        while True:
-            is_alive = qemu.check()
-            if not is_alive:
-                return True
-            if time_track > timeout:
-                return False
-            time.sleep(1)
-            time_track += 1
+        try:
+            while True:
+                is_alive = qemu.check()
+                if not is_alive:
+                    return True
+                if time_track > timeout:
+                    return False
+                time.sleep(1)
+                time_track += 1
+        except SystemExit:
+            return True
 
     def test_qemu_can_shutdown(self):
         self.assertExists(self.qemuboot_conf)
-- 
2.17.1


