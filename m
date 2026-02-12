Return-Path: <clement.faure@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA7FFEB48FE
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 10:38:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42759.1770892718199280675
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 02:38:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: clement.faure@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 815C6497;
	Thu, 12 Feb 2026 02:38:31 -0800 (PST)
Received: from MGC575JXM4.arm.com (unknown [10.57.7.242])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBFDC3F632;
	Thu, 12 Feb 2026 02:38:36 -0800 (PST)
From: Clement Faure <clement.faure@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: saul.wold@windriver.com,
	ross.burton@arm.com,
	Clement Faure <clement.faure@arm.com>
Subject: [PATCH v2 1/2] devtool: avoid recursion into nested git repos with submodules
Date: Thu, 12 Feb 2026 11:38:02 +0100
Message-ID: <20260212103803.63277-2-clement.faure@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260212103803.63277-1-clement.faure@arm.com>
References: <20260212103803.63277-1-clement.faure@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 10:38:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231019

Prevent devtool from recursing into nested git repositories with
submodules to avoid double git submodule add operation.

Signed-off-by: Clement Faure <clement.faure@arm.com>
---
changes in v2:
- look for .gitmodules in files instead of dirs + files
---

 scripts/lib/devtool/__init__.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init=
__.py
index 969d6dc13a..1359473496 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -248,6 +248,10 @@ def setup_git_repo(repodir, version, devbranch, base=
tag=3D'devtool-base', d=3DNone):
                     remote_url =3D stdout.splitlines()[0]
                     logger.error(os.path.relpath(os.path.join(root, ".."=
), root))
                     bb.process.run('git submodule add %s %s' % (remote_u=
rl, os.path.relpath(root, os.path.join(root, ".."))), cwd=3Dos.path.join(=
root, ".."))
+                    # Do not descend into nested git repos that have sub=
modules themselves.
+                    if ".gitmodules" in files:
+                        logger.warning('Nested git repository with submo=
dules %s; devtool will not recurse into it', root)
+                        dirs[:] =3D []
                     found =3D True
                 if found:
                     oe.patch.GitApplyTree.commitIgnored("Add additional =
submodule from SRC_URI", dir=3Dos.path.join(root, ".."), d=3Dd)
--=20
2.43.0


