Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 84EE1736B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 23:54:01 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so56805537pac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 16:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Vtj9xxwh+lSE0DUnucLQ6aWEEknh+VjDihjSgkxz7dw=;
	b=Tz/3iCx8JeM6mLshtQhKIKpGtIpG0NTMS2EPaDZGsxLXS7h7mwNBMLfe1xkpo7rI+N
	r//6rZGgtp4BBRbfecbOm2zr0LEYx80g2F4Lz8ISCGCbr+AGScjhbBKjE6MR2B5f6I+W
	o8/leZxjb6kaAKetx2jArsFwqow2jvczwjY6PIVHAq0hrEpl78k8nNArKiATDY0J4X9A
	xrFJ/1LiT7lqrUkN6LalBZvqhwYYDxLRk+UtMZHkVZoQL0eDrPXWr6Uwp02xwORVMOE7
	PayzTYiYc8Vh2s8CLOAr/u+CliL7jKrYk++X0got2+UBiJZjFC0Fv3Xbx6/ZbKhIBBFO
	IXDw==
X-Received: by 10.68.111.3 with SMTP id ie3mr89730699pbb.63.1441929241445;
	Thu, 10 Sep 2015 16:54:01 -0700 (PDT)
Received: from haswell.localdomain ([2601:646:8601:4580:baca:3aff:fe80:aa8f])
	by smtp.gmail.com with ESMTPSA id
	xm9sm14117676pbc.32.2015.09.10.16.54.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Sep 2015 16:54:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2015 17:03:09 -0700
Message-Id: <e4c70967dd05d254bd59bd4f8a49836c3d499bfb.1441929533.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <cover.1441929533.git.raj.khem@gmail.com>
References: <cover.1441929533.git.raj.khem@gmail.com>
Subject: [PATCH V2 1/3] rootfs: Conditionally uninstall update-rc.d
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Sep 2015 23:54:01 -0000

update-rc.d is now needed by systemd to interact with sysv
scripts, so if we have a mixed system, then we can not uninstall
update-rc.d as it is going to break systemd functionality, we check for
sysvinit and sytemd in distro and also ensure that its not building an
image with readonly rootfs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oe/rootfs.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index ba62273..6cc96e6 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -230,6 +230,14 @@ class Rootfs(object):
 
         runtime_pkgmanage = bb.utils.contains("IMAGE_FEATURES", "package-management",
                          True, False, self.d)
+        sysvcompat_in_distro = bb.utils.contains("DISTRO_FEATURES", [ "systemd", "sysvinit" ],
+                         True, False, self.d)
+        image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
+                         True, False, self.d)
+        if sysvcompat_in_distro and not image_rorfs:
+            pkg_to_remove = ""
+        else:
+            pkg_to_remove = "update-rc.d"
         if not runtime_pkgmanage:
             # Remove components that we don't need if we're not going to install
             # additional packages at runtime
@@ -242,7 +250,7 @@ class Rootfs(object):
                         pkg = pkg_installed.split()[0]
                         if pkg in ["base-passwd",
                                 "shadow",
-                                "update-alternatives",
+                                "update-alternatives", pkg_to_remove,
                                 self.d.getVar("ROOTFS_BOOTSTRAP_INSTALL", True)
                                 ]:
                             pkgs_to_remove.append(pkg)
-- 
2.5.1


