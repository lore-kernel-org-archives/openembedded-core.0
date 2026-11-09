Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6076.1794231923991731249
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:45:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=V62odj1H;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 1C0E63D8182D;
	Mon,  9 Nov 2026 08:45:23 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id CMM85TaRMK5a; Mon,  9 Nov 2026 08:45:22 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 3B7493D818F4;
	Mon,  9 Nov 2026 08:45:22 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 3B7493D818F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1794231922; bh=Brm56ZBdRKDiuJ+rNTRyUTVDEWpeCtfABTMl+Q6BO8c=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=V62odj1H3iQLtQaEsJXLKwm6Y92s5JwfEl11ZpJRHWAk3Zesc497uQpztSe8XFGDD
	 g+BrlNDJ9jLUKB9qpdTgFigDmzz26ZMXT/1yzzOwXeSXXYNHjPcZGVTplWfidyPr7m
	 2aTuGg5WU5Yz/E5VYbtCog98P/eGM8SsQsOcRuY5xFySB+AEZoxCmg5nasBq3qh7HP
	 /22kKJnD1DEhAk9rrkaYrigdMafyXET4Qyt60/D5Qyk+CuVVTcW7w9uDfvHyS/mpj7
	 Gl/nnm8F8H33tamsK0Miz/L9zrp0surO3UmiEyn27bqIgxVzJ+ueXKR+g2RCrkVKh/
	 TesGv/ceOFC2g==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id uUOqBZasPGgz; Mon,  9 Nov 2026 08:45:21 -0500 (EST)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 878F53D81838;
	Mon,  9 Nov 2026 08:45:21 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 09 Nov 2026 14:44:33 +0100
Subject: [PATCH v2 16/18] oeqa/selftest: run IDE tasks with configured
 environment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-devtool-ide-sdk-cargo-v2-16-d56134000561@savoirfairelinux.com>
References: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
In-Reply-To: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:45:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249843

Apply each generated shell task's options.env and return its runCmd
results. Cargo build tasks intentionally keep only the SDK PATH, and the
following rebuild integration test needs both to execute and inspect
that task.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index f0bfa5ce27..f23e1a7f95 100644
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

