Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98275C352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 16:37:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20443.1670431015958813872
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 08:36:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D611FEC;
	Wed,  7 Dec 2022 08:37:02 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2149B3F73B;
	Wed,  7 Dec 2022 08:36:55 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] combo-layer: add sync-revs command
Date: Wed,  7 Dec 2022 16:36:50 +0000
Message-Id: <20221207163650.3561591-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207163650.3561591-1-ross.burton@arm.com>
References: <20221207163650.3561591-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 16:37:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174363

When starting to use combo-layer, or if someone else is using it too,
the local last_revision may be incorrect.

This command will forcibly update the last_revision config values to the
latest SHA on the remote branch that is tracked.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/combo-layer | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index e467f390c1e..7f2020fca71 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -191,6 +191,23 @@ def runcmd(cmd,destdir=3DNone,printerr=3DTrue,out=3D=
None,env=3DNone):
     logger.debug("output: %s" % output.replace(chr(0), '\\0'))
     return output
=20
+def action_sync_revs(conf, args):
+    """
+    Update the last_revision config option for each repo with the latest
+    revision in the remote's branch. Useful if multiple people are using
+    combo-layer.
+    """
+    repos =3D get_repos(conf, args[1:])
+
+    for name in repos:
+        repo =3D conf.repos[name]
+        ldir =3D repo['local_repo_dir']
+        branch =3D repo.get('branch', "master")
+        runcmd("git fetch", ldir)
+        lastrev =3D runcmd('git rev-parse origin/%s' % branch, ldir).str=
ip()
+        print("Updating %s to %s" % (name, lastrev))
+        conf.update(name, "last_revision", lastrev)
+
 def action_init(conf, args):
     """
         Clone component repositories
@@ -1301,6 +1318,7 @@ actions =3D {
     "update": action_update,
     "pull": action_pull,
     "splitpatch": action_splitpatch,
+    "sync-revs": action_sync_revs,
 }
=20
 def main():
@@ -1311,10 +1329,11 @@ def main():
 Create and update a combination layer repository from multiple component=
 repositories.
=20
 Action:
-  init                 initialise the combo layer repo
-  update [components]  get patches from component repos and apply them t=
o the combo repo
-  pull [components]    just pull component repos only
-  splitpatch [commit]  generate commit patch and split per component, de=
fault commit is HEAD""")
+  init                   initialise the combo layer repo
+  update [components]    get patches from component repos and apply them=
 to the combo repo
+  pull [components]      just pull component repos only
+  sync-revs [components] update the config file's last_revision for each=
 repository
+  splitpatch [commit]    generate commit patch and split per component, =
default commit is HEAD""")
=20
     parser.add_option("-c", "--conf", help =3D "specify the config file =
(conf/combo-layer.conf is the default).",
                action =3D "store", dest =3D "conffile", default =3D "con=
f/combo-layer.conf")
--=20
2.34.1


