Return-Path: <martyn.welch@collabora.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 046C1C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 10:50:25 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by mx.groups.io with SMTP id smtpd.web09.10353.1635245423641554870
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 03:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: collabora.com, ip: 46.235.227.227, mailfrom: martyn.welch@collabora.com)
Received: from pan.home (unknown
 [IPv6:2a00:23c6:c31a:b300:6338:938c:ab16:fa48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: martyn)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E5BFD1F4208F;
	Tue, 26 Oct 2021 11:50:11 +0100 (BST)
From: Martyn Welch <martyn.welch@collabora.com>
To: openembedded-core@lists.openembedded.org
Cc: Martyn Welch <martyn.welch@collabora.com>
Subject: [PATCH v6 1/2] image.bbclass: add prohibited-paths QA test
Date: Tue, 26 Oct 2021 11:50:00 +0100
Message-Id: 
 <06387e0dd040237457de963fd13ff3db3e02be61.1635240032.git.martyn.welch@collabora.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 10:50:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157379

Sometimes we wish to ensure that files or directories are not installed
somewhere that may prove detrimental to the operation of the system. For
example, this may be the case if files are placed in a directory that is
utilised as a mount point at run time, thus making them inaccessible once
when the mount point is being utilised.

Implement the prohibited paths QA test, which enables such locations to b=
e
specified in a "IMAGE_QA_PROHIBITED_PATHS" variable. This implementation
allows for a colon separated list of paths to be provided. Shell style
wildcards can be used.

Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
---

This patch series was submitted many years ago (2017!!!), but did not at
the time get applied. Finally submitting again.

Changes since v1:
 - Correcting author and SOB.

Changes since v2:
 - Reimplemented as image rather than package level QA test.
 - Changed variable from PROHIBITED_PATH to PROHIBITED_PATHS to better
   reflect its use.

Changes since v3:
 - Rename variable to IMAGE_QA_PROHIBITED_PATHS.
 - Use str.startswith().
 - Simplify if statement.

Changes since v4:
 - Move QA test to new class "image-insane.bbclass".

Changes since v5:
 - Port to latest version

 meta/classes/image-insane.bbclass | 20 ++++++++++++++++++++
 meta/classes/image.bbclass        |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/classes/image-insane.bbclass

diff --git a/meta/classes/image-insane.bbclass b/meta/classes/image-insan=
e.bbclass
new file mode 100644
index 0000000000..29935cf24c
--- /dev/null
+++ b/meta/classes/image-insane.bbclass
@@ -0,0 +1,20 @@
+python image_check_prohibited_paths () {
+    import glob
+    from oe.utils import ImageQAFailed
+
+    rootfs =3D d.getVar('IMAGE_ROOTFS')
+
+    path =3D (d.getVar('IMAGE_QA_PROHIBITED_PATHS') or "")
+    if path !=3D "":
+        for p in path.split(':'):
+            if not p.startswith('/'):
+                raise ImageQAFailed("IMAGE_QA_PROHIBITED_PATHS \"%s\" mu=
st be an absolute path" % p, image_check_prohibited_paths)
+
+            match =3D glob.glob("%s%s" % (rootfs, p))
+            if match:
+                loc =3D ", ".join(item.replace(rootfs, '') for item in m=
atch)
+                raise ImageQAFailed("Match(es) for IMAGE_QA_PROHIBITED_P=
ATHS \"%s\": %s" % (p, loc), image_check_prohibited_paths)
+}
+
+IMAGE_QA_COMMANDS +=3D "image_check_prohibited_paths"
+
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2fa69a40d1..4cb4360f98 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -15,6 +15,7 @@ IMGCLASSES +=3D "${@bb.utils.contains('IMAGE_FSTYPES', =
'container', 'image-contain
 IMGCLASSES +=3D "image_types_wic"
 IMGCLASSES +=3D "rootfs-postcommands"
 IMGCLASSES +=3D "image-postinst-intercepts"
+IMGCLASSES +=3D "image-insane"
 inherit ${IMGCLASSES}
=20
 TOOLCHAIN_TARGET_TASK +=3D "${PACKAGE_INSTALL}"
--=20
2.33.0


