Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.952.1602094917753193044
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 11:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D8C21042
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Oct 2020 11:21:57 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE01C3F71F
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Oct 2020 11:21:56 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] devtool: fix modify with patches in override directories
Date: Wed,  7 Oct 2020 19:21:52 +0100
Message-Id: <20201007182152.1331417-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201007182152.1331417-1-ross.burton@arm.com>
References: <20201007182152.1331417-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If a recipe applies patches which are in machine-specific override
directories, devtool will fail to fetch the patches that don't match the
default configuration.  For example where there are patches at
qemux86/x86.patch and qemuarm/arm.patch:

SRC_URI =3D "file://source"
SRC_URI_append_qemuarm =3D " file://arm.patch"
SRC_URI_append_qemux86 =3D " file://x86.patch"

The patch apply phase sets OVERRIDES but does not set FILESOVERRIDES, so
it cannot find the patch files as the search path isn't correct.  Fix
this by setting FILESOVERRIDES too.

Also when iterating through the overrides we need to be sure that other
overrides that are used are not enabled, so extend no_overrides instead o=
f
simply appending the current override.

Fixes most but not all of [ YOCTO #14060 ].

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/devtool-source.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-s=
ource.bbclass
index 280d6009f3..41900e651f 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -199,6 +199,7 @@ python devtool_post_patch() {
             # Run do_patch function with the override applied
             localdata =3D bb.data.createCopy(d)
             localdata.setVar('OVERRIDES', ':'.join(no_overrides))
+            localdata.setVar('FILESOVERRIDES', ':'.join(no_overrides))
             bb.build.exec_func('do_patch', localdata)
             rm_patches()
             # Now we need to reconcile the dev branch with the no-overri=
des one
@@ -216,7 +217,8 @@ python devtool_post_patch() {
                 # Reset back to the initial commit on a new branch
                 bb.process.run('git checkout %s -b devtool-override-%s' =
% (initial_rev, override), cwd=3Dsrcsubdir)
                 # Run do_patch function with the override applied
-                localdata.appendVar('OVERRIDES', ':%s' % override)
+                localdata.setVar('OVERRIDES', ':'.join(no_overrides + [o=
verride]))
+                localdata.setVar('FILESOVERRIDES', ':'.join(no_overrides=
 + [override]))
                 bb.build.exec_func('do_patch', localdata)
                 rm_patches()
                 # Now we need to reconcile the new branch with the no-ov=
errides one
--=20
2.25.1

