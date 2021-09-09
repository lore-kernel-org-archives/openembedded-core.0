Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by mx.groups.io with SMTP id smtpd.web08.4529.1631174727902545880
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 01:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: wusto.de, ip: 80.241.56.172, mailfrom: tobias.kaufmann@wusto.de)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4H4s4j4fkQzQkBN;
	Thu,  9 Sep 2021 10:05:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
From: tobias.kaufmann@wusto.de
To: openembedded-core@lists.openembedded.org
Cc: Maximilian Blenk <Maximilian.Blenk@bmw.de>,
	Tobias Kaufmann <Tobias.KA.Kaufmann@bmw.de>
Subject: [PATCH 2/2] mount-copybind: add rootcontext mountoption for overlayfs
Date: Thu,  9 Sep 2021 10:05:05 +0200
Message-Id: <20210909080505.242105-2-tobias.kaufmann@wusto.de>
In-Reply-To: <20210909080505.242105-1-tobias.kaufmann@wusto.de>
References: <20210909080505.242105-1-tobias.kaufmann@wusto.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: BED071898
Content-Transfer-Encoding: quoted-printable

From: Maximilian Blenk <Maximilian.Blenk@bmw.de>

If selinux is enabled, the context of the mountpoint for overlayfs
needs to be specified manually via the rootcontext option. To this
end, the required context is determined using matchpathcon(1) and
passed via the rootcontext mount option.

Additionally, if the mount source directory is created by mount-copybind
it also needs to take care that the context of the directory is correct

Signed-off-by: Tobias Kaufmann <Tobias.KA.Kaufmann@bmw.de>
---
 .../volatile-binds/files/mount-copybind            | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/volatile-binds/files/mount-copybind b/meta=
/recipes-core/volatile-binds/files/mount-copybind
index 57a5ce5f21..aad022c6e4 100755
--- a/meta/recipes-core/volatile-binds/files/mount-copybind
+++ b/meta/recipes-core/volatile-binds/files/mount-copybind
@@ -31,6 +31,13 @@ if [ -d "$mountpoint" ]; then
     else
         specdir_existed=3Dno
         mkdir "$spec"
+        # If the $spec directory is created we need to take care that
+        # the selinux context is correct
+        if command -v selinuxenabled > /dev/null 2>&1; then
+            if selinuxenabled; then
+                restorecon "$spec"
+            fi
+        fi
     fi
=20
     # Fast version of calculating `dirname ${spec}`/.`basename ${spec}`-=
work
@@ -39,7 +46,12 @@ if [ -d "$mountpoint" ]; then
=20
     # Try to mount using overlay, which is must faster than copying file=
s.
     # If that fails, fall back to slower copy.
-    if ! mount -t overlay overlay -olowerdir=3D"$mountpoint",upperdir=3D=
"$spec",workdir=3D"$overlay_workdir" "$mountpoint" > /dev/null 2>&1; then
+    if command -v selinuxenabled > /dev/null 2>&1; then
+        if selinuxenabled; then
+            mountcontext=3D",rootcontext=3D$(matchpathcon -n $mountpoint=
)"
+        fi
+    fi
+    if ! mount -t overlay overlay -olowerdir=3D"$mountpoint",upperdir=3D=
"$spec",workdir=3D"$overlay_workdir""$mountcontext" "$mountpoint" > /dev/=
null 2>&1; then
=20
         if [ "$specdir_existed" !=3D "yes" ]; then
             cp -aPR "$mountpoint"/. "$spec/"
--=20
2.33.0

