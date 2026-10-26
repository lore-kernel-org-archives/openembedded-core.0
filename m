Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38532.1793004982251604166
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 01:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=emyeuCEG;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 5C2673D81844;
	Mon, 26 Oct 2026 04:56:21 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id T1ePr6_rDGop; Mon, 26 Oct 2026 04:56:20 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 75C413D81829;
	Mon, 26 Oct 2026 04:56:20 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 75C413D81829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1793004980; bh=UZbZKDjYHLKur1gUrDrH5mQtwzwH0j9faQ8bi+M0woE=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=emyeuCEGOs1ql8CzlCueL12A5T53dbWmPom3dtfeU0NFvHnKDCr/dWIdyKWYybrVA
	 ClqRyMyj1jLrPtA8Q6aLtpobqCmvpnbLugDleeD3LYPU6Tgt4s7jguK0rJBCt68VBH
	 9/7RCReTnro0DFRcysKl11gRDzNFU9VhhJ263YXKnrtwwRlZDcldkSkowtaTOIHSYB
	 qALno4DAGBgNtxKM4PFD/N0IPNlZ0Xhyduuaota6aTa5rJm1VWbatMpWC1iqNdbXrM
	 zYG4sPXqjCja+uLor+6tQQIvHw3eZLw6CZCn67/mv6pEDrvvxxEwGm89nWgvURERiI
	 k5bXc8Zdy5O5A==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 78SsAdZxunRM; Mon, 26 Oct 2026 04:56:20 -0400 (EDT)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id E96DB3D81833;
	Mon, 26 Oct 2026 04:56:19 -0400 (EDT)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 26 Oct 2026 09:55:56 +0100
Subject: [PATCH 18/20] oeqa/selftest: run IDE tasks with configured
 environment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-devtool-ide-sdk-cargo-v1-18-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 08:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248656

Apply each generated shell task's options.env and return its runCmd results.
Cargo build tasks intentionally keep only the SDK PATH, and the following
rebuild integration test needs both to execute and inspect that task.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 99e6531877..114536fc16 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3485,6 +3485,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.assertIn(task_label, task_by_label,
                       "Task '%s' not found in tasks.json" % task_label)
 
+        task_results = []
         ran = set()
 
         def run_task(label, execute_task):
@@ -3509,14 +3510,20 @@ class DevtoolIdeSdkTests(DevtoolBase):
                         args = [args]
                     task_cmd = [command] + [str(arg) for arg in args]
 
-                    task_cwd = task.get('options', {}).get('cwd', tempdir)
+                    task_options = task.get('options', {})
+                    task_cwd = task_options.get('cwd', tempdir)
                     if isinstance(task_cwd, str):
                         task_cwd = task_cwd.replace('${workspaceFolder}', tempdir)
-                    runCmd(task_cmd, cwd=task_cwd, output_log=self._cmd_logger)
+                    task_env = os.environ.copy()
+                    task_env.update(task_options.get('env', {}))
+                    task_results.append(runCmd(
+                        task_cmd, cwd=task_cwd, env=task_env,
+                        output_log=self._cmd_logger))
 
             ran.add(label)
 
         run_task(task_label, run_main_task)
+        return task_results
 
     def _ide_sdk_package_opts(self):
         """Extra `devtool ide-sdk --package` options. Override to scope packages."""

-- 
2.53.0

