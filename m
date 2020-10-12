Received: from gw.hale.at (gw.hale.at [89.26.116.210])
 by mx.groups.io with SMTP id smtpd.web12.34989.1602484913062991491
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2020 23:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: hale.at, ip: 89.26.116.210, mailfrom: michael.thalmeier@hale.at)
IronPort-SDR: X387/9KYbIAneAO8j5nvLm79FeXtCsocf3ZU4wtDTivU/KjzWomyFzY9UOgIxEAylhP2z3RPo4
 7gzWWmU2FNlXLAFCzNnstJaWT5pVzi3OJ5mA5wkVCjZqRJENoQygs9yoDIbrZ1qr+oZf8OA2M4
 jK38qf6xea3gufh/sdMKCXxAKDT48GGkzKmgBcr6sEDYVrcjoTBLuff6OXOQHE1hjBr8/J12KH
 N7rKrtLiSZYESdhEi9+2G5dwyAOc5VO+jtQ++Ytt666sg/Gq8QJUwTkutADlvpzVpre8jXPkCn
 5yA=
Received: from unknown (HELO mail3.hale) ([192.168.100.5])
  by gw.hale.at with ESMTP; 12 Oct 2020 08:41:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail3.hale (Postfix) with ESMTP id ECFFDB25F7
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 08:41:49 +0200 (CEST)
Received: from mail3.hale ([127.0.0.1])
	by localhost (mail3.hale [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id l0FrCdZEIigk; Mon, 12 Oct 2020 08:41:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail3.hale (Postfix) with ESMTP id 938A7B4089;
	Mon, 12 Oct 2020 08:41:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mail3.hale
Received: from mail3.hale ([127.0.0.1])
	by localhost (mail3.hale [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id uhOufBA3ukeJ; Mon, 12 Oct 2020 08:41:49 +0200 (CEST)
Received: from michistation.sensberg10.at (unknown [172.16.1.89])
	by mail3.hale (Postfix) with ESMTP id 77014B25F1;
	Mon, 12 Oct 2020 08:41:49 +0200 (CEST)
From: "Michael Thalmeier" <michael.thalmeier@hale.at>
To: openembedded-core@lists.openembedded.org
Cc: Michael Thalmeier <michael.thalmeier@hale.at>
Subject: [PATCH] IMAGE_LOCALES_ARCHIVE: add option to prevent locale archive creation
Date: Mon, 12 Oct 2020 08:41:43 +0200
Message-Id: <20201012064143.82855-1-michael.thalmeier@hale.at>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Under some circumstances it is not desirable to create a combined locale
archive (/usr/lib/locale/locale-archive).
The new variable IMAGE_LOCALES_ARCHIVE defaults to '1', so the default
behaviour is not changed.

Signed-off-by: Michael Thalmeier <michael.thalmeier@hale.at>
---
 meta/classes/image.bbclass              |  5 ++++-
 meta/lib/oe/package_manager/__init__.py | 13 +++++++------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 730c843c18..045f4494c8 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -121,7 +121,7 @@ python () {
 def rootfs_variables(d):
     from oe.rootfs import variable_depends
     variables =3D ['IMAGE_DEVICE_TABLE','IMAGE_DEVICE_TABLES','BUILD_IMA=
GES_FROM_FEEDS','IMAGE_TYPES_MASKED','IMAGE_ROOTFS_ALIGNMENT','IMAGE_OVER=
HEAD_FACTOR','IMAGE_ROOTFS_SIZE','IMAGE_ROOTFS_EXTRA_SPACE',
-                 'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','=
IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEM=
ENTARY','IMAGE_LINGUAS', 'IMAGE_LINGUAS_COMPLEMENTARY',
+                 'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','=
IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEM=
ENTARY','IMAGE_LINGUAS', 'IMAGE_LINGUAS_COMPLEMENTARY', 'IMAGE_LOCALES_AR=
CHIVE',
                  'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB=
_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARI=
ANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
                  'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARG=
ET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_U=
RI','INTERCEPT_DIR','USE_DEVFS',
                  'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNE=
EDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIM=
ESTAMP_ROOTFS', 'IMAGE_INSTALL_DEBUGFS']
@@ -173,6 +173,9 @@ IMAGE_LINGUAS ?=3D "de-de fr-fr en-gb"
=20
 LINGUAS_INSTALL ?=3D "${@" ".join(map(lambda s: "locale-base-%s" % s, d.=
getVar('IMAGE_LINGUAS').split()))}"
=20
+# per default create a locale archive
+IMAGE_LOCALES_ARCHIVE ?=3D '1'
+
 # Prefer image, but use the fallback files for lookups if the image ones
 # aren't yet available.
 PSEUDO_PASSWD =3D "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}"
diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/packag=
e_manager/__init__.py
index 865d6f9493..42225a3b2e 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -397,12 +397,13 @@ class PackageManager(object, metaclass=3DABCMeta):
                          "'%s' returned %d:\n%s" %
                          (' '.join(cmd), e.returncode, e.output.decode("=
utf-8")))
=20
-        target_arch =3D self.d.getVar('TARGET_ARCH')
-        localedir =3D oe.path.join(self.target_rootfs, self.d.getVar("li=
bdir"), "locale")
-        if os.path.exists(localedir) and os.listdir(localedir):
-            generate_locale_archive(self.d, self.target_rootfs, target_a=
rch, localedir)
-            # And now delete the binary locales
-            self.remove(fnmatch.filter(self.list_installed(), "glibc-bin=
ary-localedata-*"), False)
+        if self.d.getVar('IMAGE_LOCALES_ARCHIVE') =3D=3D '1':
+            target_arch =3D self.d.getVar('TARGET_ARCH')
+            localedir =3D oe.path.join(self.target_rootfs, self.d.getVar=
("libdir"), "locale")
+            if os.path.exists(localedir) and os.listdir(localedir):
+                generate_locale_archive(self.d, self.target_rootfs, targ=
et_arch, localedir)
+                # And now delete the binary locales
+                self.remove(fnmatch.filter(self.list_installed(), "glibc=
-binary-localedata-*"), False)
=20
     def deploy_dir_lock(self):
         if self.deploy_dir is None:
--=20
2.26.2

