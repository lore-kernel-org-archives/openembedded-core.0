Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A648ACD5BB1
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 12:58:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35799.1779368333344067687
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 05:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=ZmhIdZJx;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F236BC2C64F;
	Thu, 21 May 2026 12:59:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D821E60495;
	Thu, 21 May 2026 12:58:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C267A107E8B8B;
	Thu, 21 May 2026 14:58:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779368331; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YB66WZWfSwfMq1Cfg41XmvEA86ASwCA+U6HyepF0TqY=;
	b=ZmhIdZJxYMepqNDegeN5+dRbfptgMKcuqApqcP6QKMZhF+AjZAfWtZIpDqh3VTfl/o5coH
	YDT9yLODikl+bpxX7r/CmxiXnBjsiJfHqRSdpfbC/s1TXKKKTPkGwwFtOYti6Px2vQN3wD
	q8Q8utVeiiHVwIYKtTA56E7U6h2O0rQ0iapNdyx839Zxug2iCAOj5U3mkQl4wqJh4NPADb
	jWr5dSvQz+aDT//CMQdKobgXcoTXZSRt7RJY4QQNRUVTJRnnCRrsk2b/0sUGEYVIWqHV8E
	v/9GRh0a38ZAe55RNnIPac+KGhMc07/v44ecVRd81gRc00L007Q79Pzs9Q2Kag==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Ross.Burton@arm.com,
	alex.kanavin@gmail.com,
	paul@pbarker.dev,
	richard.purdie@linuxfoundation.org,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 5/5] base.bbclass: introduce prune_source_tree function
Date: Thu, 21 May 2026 14:58:28 +0200
Message-ID: <20260521125828.718050-6-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260521125828.718050-1-joaomarcos.costa@bootlin.com>
References: <20260521125828.718050-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 12:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237512

Add a helper function to be executed after do_unpack, if PRUNE_KEEP_PATHS
is defined.

This variable is a list (space-separated) of paths that should be kept,
while the others will be pruned. They can be directory names and
filenames, but globbing is not supported as of now.

prune_source_tree() is not a task on its own, of course. It belongs in
do_unpack's 'postfuncs' list, and also in do_unpack_and_patch
(archiver.bbclass): this ensures the archived sources (patched or
configured) will also be pruned.

As a concrete example, add PRUNE_KEEP_PATHS to vim-xxd so that vim's
sources are deleted and only xxd sources are kept.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/classes-global/base.bbclass        | 49 +++++++++++++++++++++++++
 meta/classes/archiver.bbclass           |  1 +
 meta/recipes-support/vim/vim-xxd_9.2.bb |  4 ++
 3 files changed, 54 insertions(+)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
index 62f2814bb7..edf37a8016 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -256,6 +256,55 @@ python create_source_date_epoch_stamp() {
 }
 do_unpack[postfuncs] +=3D "create_source_date_epoch_stamp"
=20
+PRUNE_KEEP_PATHS ??=3D ""
+python prune_source_tree() {
+    import shutil
+
+    # Space-separated list of paths (relative to ${S}) to keep.
+    #
+    # Example:
+    #   PRUNE_KEEP_PATHS =3D "READMEdir/Contents.info src/xxd SECURITY.m=
d"
+    #
+    keep_paths =3D (d.getVar("PRUNE_KEEP_PATHS") or "").split()
+
+    if not keep_paths:
+        bb.debug(1, "do_unpack: prune_source_tree is disabled")
+        return
+
+    s =3D d.getVar("S")
+    keep_abs =3D {os.path.abspath(os.path.join(s, p)) for p in keep_path=
s}
+
+    def should_keep(path):
+        path =3D os.path.abspath(path)
+
+        for keep in keep_abs:
+            if (
+                path =3D=3D keep or # exact match with PRUNE_KEEP_PATHS
+                path.startswith(keep + os.sep) or # parent directories
+                keep.startswith(path + os.sep) # child directories
+            ):
+                return True
+        return False
+
+    for root, dirs, _ in os.walk(s, topdown=3DFalse):
+        for d in dirs:
+            path =3D os.path.join(root, d)
+
+            if not should_keep(path):
+                bb.debug(1, "Removing directory: %s" % path)
+                shutil.rmtree(path)
+
+    # in case there are leftover files:
+    for root, _, files in os.walk(s):
+        for f in files:
+            path =3D os.path.join(root, f)
+
+            if not should_keep(path):
+                bb.debug(1, "Removing file: %s" % path)
+                os.remove(path)
+}
+do_unpack[postfuncs] .=3D "${@" prune_source_tree" if d.getVar("PRUNE_KE=
EP_PATHS") else ''}"
+
 def get_source_date_epoch_value(d):
     return oe.reproducible.epochfile_read(d.getVar('SDE_FILE'), d)
=20
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclas=
s
index 1f1ee45bd7..1a0d6f8eea 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -620,6 +620,7 @@ addtask do_deploy_archives
 do_build[recrdeptask] +=3D "do_deploy_archives"
 do_rootfs[recrdeptask] +=3D "do_deploy_archives"
 do_populate_sdk[recrdeptask] +=3D "do_deploy_archives"
+do_unpack_and_patch[postfuncs] .=3D "${@" prune_source_tree" if d.getVar=
("PRUNE_KEEP_PATHS") else ''}"
=20
 python () {
     # Add tasks in the correct order, specifically for linux-yocto to av=
oid race condition.
diff --git a/meta/recipes-support/vim/vim-xxd_9.2.bb b/meta/recipes-suppo=
rt/vim/vim-xxd_9.2.bb
index 5cfacbcea6..b1058e18b7 100644
--- a/meta/recipes-support/vim/vim-xxd_9.2.bb
+++ b/meta/recipes-support/vim/vim-xxd_9.2.bb
@@ -16,6 +16,10 @@ inherit update-alternatives
=20
 PROVIDES +=3D "xxd"
=20
+# After unpacking, the files/dirs. outside of this list are removed
+# see prune_source_tree() in base.bbclass
+PRUNE_KEEP_PATHS =3D "src/xxd/Makefile src/xxd/xxd.c"
+
 do_compile() {
     cd  ${S}/src/xxd;
     oe_runmake xxd
--=20
2.43.0


