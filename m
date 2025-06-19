Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C168BC7115D
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 13:20:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14643.1750339251566168974
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 06:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF3FE113E
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 06:20:30 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A4BF43F58B
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 06:20:50 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/4] oeqa/utils/command: fast-path get_bb_var()
Date: Thu, 19 Jun 2025 14:20:42 +0100
Message-ID: <20250619132045.1521932-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 13:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219077

get_bb_var() currently end up calling 'bitbake -e' and parsing the whole
output. However if postconfig isn't set then we can speed this up by
just calling bitbake-getvar.

The complication with failing bitbake-getvar calls is because we need to
be careful to return None instead of the empty string when the variable
doesn't exist.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/utils/commands.py | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/comman=
ds.py
index 2a47f90e327..b60a6e6c389 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -285,7 +285,20 @@ def get_bb_vars(variables=3DNone, target=3DNone, pos=
tconfig=3DNone):
     return values
=20
 def get_bb_var(var, target=3DNone, postconfig=3DNone):
-    return get_bb_vars([var], target, postconfig)[var]
+    if postconfig:
+        return bitbake("-e %s" % target or "", postconfig=3Dpostconfig).=
output
+    else:
+        # Fast-path for the non-postconfig case
+        cmd =3D ["bitbake-getvar", "--quiet", "--value", var]
+        if target:
+            cmd.extend(["--recipe", target])
+        try:
+            return subprocess.run(cmd, check=3DTrue, text=3DTrue, stdout=
=3Dsubprocess.PIPE).stdout.strip()
+        except subprocess.CalledProcessError as e:
+            # We need to return None not the empty string if the variabl=
e hasn't been set.
+            if e.returncode =3D=3D 1:
+                return None
+            raise
=20
 def get_test_layer(bblayers=3DNone):
     if bblayers is None:
--=20
2.43.0


