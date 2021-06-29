Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web11.4224.1624944292868727835
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 22:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 74F13E01C4;
	Tue, 29 Jun 2021 17:18:06 +1200 (NZST)
From: "Douglas" <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [PATCH] license_image: Use sstate to populate license directory
Date: Tue, 29 Jun 2021 17:18:01 +1200
Message-Id: <20210629051801.107631-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

We were getting an endlessly-growing list of directories in
build/tmp/deploy/licenses/ of the form myimage-mymachine-20210629010203.
Use the normal sstate behaviour to clean them. Brings license_image in
line with the do_populate_lic behaviour in license.bbclass.

We must only clean the (new) WORKDIR/license-destdir at do_rootfs time,
as the write_package_manifest and license_create_manifest rootfs
postprocess commands write the package.manifest and license.manifest
files at that time. They get stored in the sstate cache at
do_populate_lic_deploy time, alongside the image_license.manifest.

Looks like this:

    license-destdir/
    =E2=94=9C=E2=94=80=E2=94=80 myimage-mymachine -> myimage-mymachine-20=
210629025723/
    =E2=94=94=E2=94=80=E2=94=80 myimage-mymachine-20210629025723/
        =E2=94=9C=E2=94=80=E2=94=80 image_license.manifest
        =E2=94=9C=E2=94=80=E2=94=80 license.manifest
        =E2=94=94=E2=94=80=E2=94=80 package.manifest

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/license_image.bbclass | 35 ++++++++++++++++--------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_im=
age.bbclass
index 73cebb4d55e..4afbb5ed575 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -1,8 +1,9 @@
 ROOTFS_LICENSE_DIR =3D "${IMAGE_ROOTFS}/usr/share/common-licenses"
+LICSSTATEDIR =3D "${WORKDIR}/license-destdir/"
=20
 python write_package_manifest() {
     # Get list of installed packages
-    license_image_dir =3D d.expand('${LICENSE_DIRECTORY}/${IMAGE_NAME}')
+    license_image_dir =3D d.expand('${LICSSTATEDIR}/${IMAGE_NAME}')
     bb.utils.mkdirhier(license_image_dir)
     from oe.rootfs import image_list_installed_packages
     from oe.utils import format_pkg_list
@@ -32,7 +33,7 @@ python license_create_manifest() {
             pkg_lic_name =3D "LICENSE_" + pkg_name
             pkg_dic[pkg_name]["LICENSE"] =3D pkg_dic[pkg_name][pkg_lic_n=
ame]
=20
-    rootfs_license_manifest =3D os.path.join(d.getVar('LICENSE_DIRECTORY=
'),
+    rootfs_license_manifest =3D os.path.join(d.getVar('LICSSTATEDIR'),
                         d.getVar('IMAGE_NAME'), 'license.manifest')
     write_license_files(d, rootfs_license_manifest, pkg_dic, rootfs=3DTr=
ue)
 }
@@ -196,23 +197,15 @@ def license_deployed_manifest(d):
                 key,val =3D line.split(": ", 1)
                 man_dic[dep][key] =3D val[:-1]
=20
-    lic_manifest_dir =3D os.path.join(d.getVar('LICENSE_DIRECTORY'),
-                                    d.getVar('IMAGE_NAME'))
-    bb.utils.mkdirhier(lic_manifest_dir)
-    image_license_manifest =3D os.path.join(lic_manifest_dir, 'image_lic=
ense.manifest')
+    licsstatedir =3D d.getVar('LICSSTATEDIR')
+    image_name =3D d.getVar('IMAGE_NAME')
+    image_license_manifest =3D os.path.join(licsstatedir, image_name, 'i=
mage_license.manifest')
     write_license_files(d, image_license_manifest, man_dic, rootfs=3DFal=
se)
=20
     link_name =3D d.getVar('IMAGE_LINK_NAME')
     if link_name:
-        lic_manifest_symlink_dir =3D os.path.join(d.getVar('LICENSE_DIRE=
CTORY'),
-                                    link_name)
-        # remove old symlink
-        if os.path.islink(lic_manifest_symlink_dir):
-            os.unlink(lic_manifest_symlink_dir)
-
-        # create the image dir symlink
-        if lic_manifest_dir !=3D lic_manifest_symlink_dir:
-            os.symlink(lic_manifest_dir, lic_manifest_symlink_dir)
+        if image_name !=3D link_name:
+            os.symlink(image_name, os.path.join(licsstatedir, link_name)=
)
=20
 def get_deployed_dependencies(d):
     """
@@ -260,14 +253,24 @@ def get_deployed_files(man_file):
     return dep_files
=20
 ROOTFS_POSTPROCESS_COMMAND_prepend =3D "write_package_manifest; license_=
create_manifest; "
+do_rootfs[cleandirs] +=3D "${LICSSTATEDIR}"
 do_rootfs[recrdeptask] +=3D "do_populate_lic"
=20
 python do_populate_lic_deploy() {
     license_deployed_manifest(d)
 }
-
 addtask populate_lic_deploy before do_build after do_image_complete
+
+SSTATETASKS +=3D "do_populate_lic_deploy"
+do_populate_lic_deploy[dirs] =3D "${LICSSTATEDIR}/${IMAGE_NAME}"
 do_populate_lic_deploy[recrdeptask] +=3D "do_populate_lic do_deploy"
+do_populate_lic_deploy[sstate-inputdirs] =3D "${LICSSTATEDIR}"
+do_populate_lic_deploy[sstate-outputdirs] =3D "${LICENSE_DIRECTORY}/"
+
+python do_populate_lic_deploy_setscene () {
+    sstate_setscene(d)
+}
+addtask do_populate_lic_deploy_setscene
=20
 python license_qa_dead_symlink() {
     import os
--=20
2.25.1

