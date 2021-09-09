Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.web09.4594.1631174724018709764
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 01:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: wusto.de, ip: 80.241.56.151, mailfrom: tobias.kaufmann@wusto.de)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4H4s4c4YKjzQk9W;
	Thu,  9 Sep 2021 10:05:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
From: tobias.kaufmann@wusto.de
To: openembedded-core@lists.openembedded.org
Cc: Tobias Kaufmann <Tobias.KA.Kaufmann@bmw.de>
Subject: [PATCH 1/2] mount-copybind: add SELinux support
Date: Thu,  9 Sep 2021 10:05:04 +0200
Message-Id: <20210909080505.242105-1-tobias.kaufmann@wusto.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 8465218BB
Content-Transfer-Encoding: quoted-printable

From: Tobias Kaufmann <Tobias.KA.Kaufmann@bmw.de>

bind mounts don't use the SELinux label of the target, but the SELinux
label of the source.

This patch restores the SELinux context of the bind mount recursively usi=
ng
restorecon.

Signed-off-by: Tobias Kaufmann <Tobias.KA.Kaufmann@bmw.de>
---
Hi guys,

currently mount-copybind does not support SELinux.
This patchset adds the necessary functionality.

The SELinux related commands are only executed, when SELinux is enabled a=
nd
SELinux tools are installed.

Would be great to get this merged. Questions/Suggestions are welcomed any=
time. :)

Kind regards
Tobias

 .../recipes-core/volatile-binds/files/mount-copybind | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-core/volatile-binds/files/mount-copybind b/meta=
/recipes-core/volatile-binds/files/mount-copybind
index e32e675308..57a5ce5f21 100755
--- a/meta/recipes-core/volatile-binds/files/mount-copybind
+++ b/meta/recipes-core/volatile-binds/files/mount-copybind
@@ -46,6 +46,12 @@ if [ -d "$mountpoint" ]; then
         fi
=20
         mount -o "bind$options" "$spec" "$mountpoint"
+        # restore the selinux context.
+        if command -v selinuxenabled > /dev/null 2>&1; then
+            if selinuxenabled; then
+                restorecon -R "$mountpoint"
+            fi
+        fi
     fi
 elif [ -f "$mountpoint" ]; then
     if [ ! -f "$spec" ]; then
@@ -53,4 +59,10 @@ elif [ -f "$mountpoint" ]; then
     fi
=20
     mount -o "bind$options" "$spec" "$mountpoint"
+    # restore the selinux context.
+    if command -v selinuxenabled > /dev/null 2>&1; then
+        if selinuxenabled; then
+            restorecon -R "$mountpoint"
+        fi
+    fi
 fi
--=20
2.33.0

