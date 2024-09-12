Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36133EED622
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 16:57:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.53149.1726160261871836558
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 09:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5D17DA7
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 09:58:10 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E49953F64C
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 09:57:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity: check for working user namespaces
Date: Thu, 12 Sep 2024 17:57:36 +0100
Message-Id: <20240912165736.1531460-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 16:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204449

If user namespaces are not available (typically because AppArmor is
blocking them), alert the user.

We consider network isolation sufficiently important that this is a fatal
error, and the user will need to configure AppArmor to allow bitbake to
create a user namespace.

[ YOCTO #15592 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-global/sanity.bbclass | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/san=
ity.bbclass
index 1d242f0f0a0..72dab0fea2b 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -475,6 +475,29 @@ def check_wsl(d):
             bb.warn("You are running bitbake under WSLv2, this works pro=
perly but you should optimize your VHDX file eventually to avoid running =
out of storage space")
     return None
=20
+def check_userns():
+    """
+    Check that user namespaces are functional, as they're used for netwo=
rk isolation.
+    """
+
+    # There is a known failure case with AppAmrmor where the unshare() c=
all
+    # succeeds (at which point the uid is nobody) but writing to the uid=
_map
+    # fails (so the uid isn't reset back to the user's uid). We can dete=
ct this.
+    parentuid =3D os.getuid()
+    pid =3D os.fork()
+    if not pid:
+        try:
+            bb.utils.disable_network()
+        except:
+            pass
+        os._exit(parentuid !=3D os.getuid())
+
+    ret =3D os.waitpid(pid, 0)[1]
+    if ret:
+        bb.fatal("User namespaces are not usable by BitBake, possibly du=
e to AppArmor.\n"
+                 "See https://discourse.ubuntu.com/t/ubuntu-24-04-lts-no=
ble-numbat-release-notes/39890#unprivileged-user-namespace-restrictions f=
or more information.")
+
+
 # Require at least gcc version 8.0
 #
 # This can be fixed on CentOS-7 with devtoolset-6+
@@ -641,6 +664,7 @@ def check_sanity_version_change(status, d):
     status.addresult(check_git_version(d))
     status.addresult(check_perl_modules(d))
     status.addresult(check_wsl(d))
+    status.addresult(check_userns())
=20
     missing =3D ""
=20
--=20
2.34.1


