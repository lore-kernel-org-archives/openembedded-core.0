Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E22DEC369DC
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 14:02:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12955.1746108160446673831
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 07:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 727E01CC4
	for <openembedded-core@lists.openembedded.org>; Thu,  1 May 2025 07:02:32 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AB2083F673
	for <openembedded-core@lists.openembedded.org>; Thu,  1 May 2025 07:02:39 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] classes/yocto-check-layer: add check for tasks that allow network access
Date: Thu,  1 May 2025 15:02:34 +0100
Message-ID: <20250501140234.4113519-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250501140234.4113519-1-ross.burton@arm.com>
References: <20250501140234.4113519-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 14:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215774

Add a new test that checks that no tasks between do_fetch (exclusive)
and do_build (inclusive) are allowed to use the network, with rare
exceptions.

The only exception currently is build-appliance-image's do_image task,
as that currently usese pip to install the required Toaster dependencies.

Note that this will mean layers that have Go-based recipes will fail
unless they're using the gomod fetcher and have a complete list of
modules in the SRC_URI.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/yocto-check-layer.bbclass | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/classes-global/yocto-check-layer.bbclass b/meta/classes=
-global/yocto-check-layer.bbclass
index 92a392af9c3..ba93085325f 100644
--- a/meta/classes-global/yocto-check-layer.bbclass
+++ b/meta/classes-global/yocto-check-layer.bbclass
@@ -27,6 +27,36 @@ def check_insane_skip(d):
             d.setVar("QA_ERRORS_FOUND", "True")
=20
=20
+# Check that no tasks (with rare exceptions) between do_fetch and do_bui=
ld
+# use the network.
+def check_network_flag(d):
+    # BPN:task names that are allowed to reach the network, using fnmatc=
h to compare.
+    allowed =3D []
+    # build-appliance-image uses pip at image time
+    allowed +=3D ["build-appliance-image:do_image"]
+
+    def is_allowed(bpn, task):
+        from fnmatch import fnmatch
+        name =3D f"{bpn}:{task}"
+        return any(fnmatch(name, pattern) for pattern in allowed)
+
+    bpn =3D d.getVar("BPN")
+    seen =3D set()
+    stack =3D {"do_build"}
+    while stack:
+        task =3D stack.pop()
+        if task =3D=3D "do_fetch":
+            continue
+
+        seen.add(task)
+        deps =3D d.getVarFlag(task, "deps") or []
+        stack |=3D {d for d in deps if d not in seen}
+
+        network =3D bb.utils.to_boolean(d.getVarFlag(task, "network"))
+        if network and not is_allowed(bpn, task):
+            bb.error(f"QA Issue: task {task} has network enabled")
+
 python () {
     check_insane_skip(d)
+    check_network_flag(d)
 }
--=20
2.43.0


