Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C96DC61D94
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 14:06:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.41303.1700575579938736904
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 06:06:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6110FFEC;
	Tue, 21 Nov 2023 06:07:06 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2CC6D3F7A6;
	Tue, 21 Nov 2023 06:06:19 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] lib/oe/patch: ensure os.chdir restoring always happens
Date: Tue, 21 Nov 2023 14:06:17 +0000
Message-Id: <20231121140617.2660822-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 14:06:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190983

From: Ross Burton <ross.burton@arm.com>

If we chdir(), do the chdir back to the original directory in a finally
block so they always run.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oe/patch.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index ff9afc9df9f..9b480b2b285 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -772,8 +772,9 @@ class NOOPResolver(Resolver):
             self.patchset.Push()
         except Exception:
             import sys
-            os.chdir(olddir)
             raise
+        finally:
+            os.chdir(olddir)
=20
 # Patch resolver which relies on the user doing all the work involved in=
 the
 # resolution, with the exception of refreshing the remote copy of the pa=
tch
@@ -833,9 +834,9 @@ class UserResolver(Resolver):
                             # User did not fix the problem.  Abort.
                             raise PatchError("Patch application failed, =
and user did not fix and refresh the patch.")
         except Exception:
-            os.chdir(olddir)
             raise
-        os.chdir(olddir)
+        finally:
+            os.chdir(olddir)
=20
=20
 def patch_path(url, fetch, workdir, expand=3DTrue):
--=20
2.34.1


