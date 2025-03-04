Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A502DC021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 11:12:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19578.1741086758541626676
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 03:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2D2CFEC
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 03:12:51 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BDFAF3F5A1
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 03:12:37 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] xserver-nodm-init: improve XDG_RUNTIME_DIR fallback creation
Date: Tue,  4 Mar 2025 11:12:33 +0000
Message-ID: <20250304111233.4038622-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304111233.4038622-1-ross.burton@arm.com>
References: <20250304111233.4038622-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 11:12:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212263

This directory must have mode 0700, and should be under /run/user (as
recommended in the specification, and as weston-init does).

Also check the permissions if the directory already exists and fail
early if they're incorrect.

[ YOCTO #13878 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../X11/Xsession.d/13xdgbasedirs.sh           | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsess=
ion.d/13xdgbasedirs.sh b/meta/recipes-graphics/x11-common/xserver-nodm-in=
it/X11/Xsession.d/13xdgbasedirs.sh
index 6bd40b2fc57..912f79761c6 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/1=
3xdgbasedirs.sh
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/X11/Xsession.d/1=
3xdgbasedirs.sh
@@ -1,13 +1,19 @@
 # Minimal/stub implementation of the XDG Base Directory specification.
 # http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
-#
-# Wayland needs XDG_RUNTIME_DIR, so set it to /tmp.  This isn't complian=
t with
-# the specification (wrong mode, wrong owner) but it's mostly sufficient=
.
-#
-# In the ideal case where SystemD is booting and userspace is initiated =
by a
-# SystemD user session this will have been set already, so don't overwri=
te it.
=20
+# If the runtime directory hasn't been set already (for example by syste=
md,
+# elogind, or pam) create a directory in TMPDIR.
 if [ -z "$XDG_RUNTIME_DIR" ]; then
-    XDG_RUNTIME_DIR=3D"/tmp"
+    XDG_RUNTIME_DIR=3D/run/user/$(id -u)
     export XDG_RUNTIME_DIR
 fi
+
+if [ -d "$XDG_RUNTIME_DIR" ]; then
+    # If the directory exists, check the permissions and ownership
+    if [ "$(stat -c %u-%a "$XDG_RUNTIME_DIR")" !=3D "$(id -u)-700" ]; th=
en
+        echo "ERROR: $XDG_RUNTIME_DIR has incorrect permissions"
+        exit 1
+    fi
+else
+    mkdir --mode 0700 --parents "${XDG_RUNTIME_DIR}"
+fi
--=20
2.43.0


