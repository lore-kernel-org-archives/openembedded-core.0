Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38525.1793004975015738863
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 01:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=Mp12dZ4Y;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 226123D81844;
	Mon, 26 Oct 2026 04:56:14 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id gL1-4LGr0uVE; Mon, 26 Oct 2026 04:56:13 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 368693D818BA;
	Mon, 26 Oct 2026 04:56:13 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 368693D818BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1793004973; bh=qIDYJjJ09oCXWLLZg+cU+4J0bwnr7WYvhUM/m3YSX1Y=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=Mp12dZ4YeJnGOwqT2AS7EsROQQPKld5NOaX6uvg5wYejbwsaHi4mbaMCjiGHpBFHK
	 X8OoHaIwWhLeO85g9Poz11v3IdAt2ModAN0iD2nN3bEqMYMDxE++EAP/3UwNMqcJsM
	 nU9ADDwq9jkkyVmFzp33OcxEsyBMNe/4V689UI2d4D8UeQA7zJlw7BC+8rECi/RX9V
	 mHgKtW7Dt0WDRKRFf0UVnz5wlJkWeC/98L4WKqh/LoJsIskbVzd5GmDKAg0Pw8ye9l
	 s3Y0J7dEjqU/Q/ygpgfgJDR/rkru6Jd/xS+JJ2XXDU3LV6EnHY22ZUU+UegSlsPpWc
	 +73IQhiul3A4w==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id HP0lp3ahAywA; Mon, 26 Oct 2026 04:56:13 -0400 (EDT)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 8FBC03D818BC;
	Mon, 26 Oct 2026 04:56:12 -0400 (EDT)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 26 Oct 2026 09:55:44 +0100
Subject: [PATCH 06/20] devtool: ide-sdk: share IntelliSense architecture
 mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-devtool-ide-sdk-cargo-v1-6-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 08:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248644

Move the target architecture map out of the Meson branch so Cargo C/C++
IntelliSense for FFI and build-script code can reuse the same mapping instead
of duplicating it.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index 85f286335f..95ef472ed4 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -352,16 +352,16 @@ class IdeVSCode(IdeBase):
         properties_dict = {
             "name": modified_recipe.recipe_id_pretty,
         }
+        arch_map = {
+            'aarch64': 'arm64', 'x86_64': 'x64', 'arm': 'arm',
+            'i686': 'x86', 'i586': 'x86', 'riscv64': 'x64', 'riscv32': 'x86',
+        }
         if modified_recipe.build_tool is BuildTool.CMAKE:
             properties_dict["configurationProvider"] = "ms-vscode.cmake-tools"
         elif modified_recipe.build_tool is BuildTool.MESON:
             # configurationProvider = "mesonbuild.mesonbuild" does not work because
             # the cross-compiler is not in PATH and omits the sysroot by default.
             compiler_type = 'clang' if modified_recipe.toolchain == 'clang' else 'gcc'
-            arch_map = {
-                'aarch64': 'arm64', 'x86_64': 'x64', 'arm': 'arm',
-                'i686': 'x86', 'i586': 'x86', 'riscv64': 'x64', 'riscv32': 'x86',
-            }
             intelli_arch = arch_map.get(modified_recipe.target_arch, 'x64')
             properties_dict["compilerPath"] = os.path.join(
                 modified_recipe.staging_bindir_toolchain,

-- 
2.53.0

