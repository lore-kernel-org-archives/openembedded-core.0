Return-Path: <ovidiu.vancea@ni.com>
Received: from ni.com (unknown [130.164.83.110])
	by mail.openembedded.org (Postfix) with ESMTP id ECBE765CBB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 07:48:09 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u4O7m9DX019864 for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 02:48:09 -0500
Received: from ovidiu-ro-l0 ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016052402480965-407573 ;
	Tue, 24 May 2016 02:48:09 -0500 
Date: Tue, 24 May 2016 10:48:06 +0300
From: Ovidiu-Adrian Vancea <ovidiu.vancea@ni.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20160524104806.277f3155@ovidiu-ro-l0>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 05/24/2016 02:48:10 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 05/24/2016 02:48:10 AM,
	Serialize complete at 05/24/2016 02:48:10 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-05-24_02:, , signatures=0
Subject: [oe][RFT] Make kernel install update module dependencies with appropriate version
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
X-List-Received-Date: Tue, 24 May 2016 07:48:12 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Updating the kernel ("opkg install kernel") does not update the modules bec=
ause there is no version enforcement specifed in the OE recipe. Upon reboot=
ing, the older version modules do not load and can leave hardware in a non-=
functioning state if their drivers are not built into the kernel.

We would like to make the kernel depend on modules using RRECOMMENDS so tha=
t they also update with the kernel.

I've been exploring two solutions and would like some feedback:

1. use the Version field from the kernel package on its rdepends, rrecommen=
ds, and rsuggests fields=E2=80=99 version. This would force the packages on=
 which the kernel depends to be the same version as the kernel.
     -- deletes modules from previous kernel version
     -- version contains package build number (including git hash) and  pac=
kage revision. This restricts the kernel and modules to always be built tog=
ether.

2. append the KERNEL_VERSION to all kernel modules=E2=80=99 package name
     -- keeps modules from previous kernel version

[PATCH for solution 1]

in the recipe that inherits kernel.bbclass add the following line:
VERSION_KERNEL_MODULES =3D "1"

and the following OE-core patch:

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bb=
class
index f1ad1d5..8468caf 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -196,6 +196,15 @@ python do_package_ipk () {
         rconflicts =3D bb.utils.explode_dep_versions2(localdata.getVar("RC=
ONFLICTS", True) or "")
         debian_cmp_remap(rconflicts)
=20
+        if (pkgname =3D=3D "kernel") and (localdata.getVar("VERSION_KERNEL=
_MODULES", False) =3D=3D "1"):
+            suffix =3D "=3D"+localdata.getVar('PKGV', True)+"-"+localdata.=
getVar('PKGR', True)
+            for key in rdepends:
+                rdepends[key]    =3D suffix
+            for key in rsuggests:
+                rsuggests[key]   =3D suffix
+            for key in rrecommends:
+                rrecommends[key] =3D suffix
+
         if rdepends:
             ctrlfile.write("Depends: %s\n" % bb.utils.join_deps(rdepends))
         if rsuggests:


[PATCH for solution 2]

In the kernel recipe that inherits kernel.bbclass add the following two lin=
es:

KERNEL_MODULES_SUFFIX =3D "-${KERNEL_VERSION}"
RRECOMMENDS_${KERNEL_PACKAGE_NAME} +=3D "${KERNEL_PACKAGE_NAME}-modules${KE=
RNEL_MODULES_SUFFIX}"

and the following OE-core patch:

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel=
-module-split.bbclass
index e1a70e6..ae556ce 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -181,7 +181,11 @@ python split_kernel_module_packages () {
=20
     module_deps =3D parse_depmod()
     module_regex =3D '^(.*)\.k?o$'
-    module_pattern =3D 'kernel-module-%s'
+    kernel_modules_suffix =3D d.getVar("KERNEL_MODULES_SUFFIX", True)
+    if kernel_modules_suffix is None:
+        module_pattern =3D '%s-module-%%s' % (kernel_package_name)
+    else:
+        module_pattern =3D '%s-module-%%s%s' % (kernel_package_name, kerne=
l_modules_suffix)
=20
     postinst =3D d.getVar('pkg_postinst_modules', True)
     postrm =3D d.getVar('pkg_postrm_modules', True)
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index c5355cf..15a2b3c 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -370,15 +370,18 @@ inherit cml1
=20
 EXPORT_FUNCTIONS do_compile do_install do_configure
=20
+KERNEL_MODULES_SUFFIX ?=3D ""
+KERNEL_MODULES_META_PACKAGE =3D "kernel-modules${KERNEL_MODULES_SUFFIX}"
+
 # kernel-base becomes kernel-${KERNEL_VERSION}
 # kernel-image becomes kernel-image-${KERNEL_VERSION}
-PACKAGES =3D "kernel kernel-base kernel-vmlinux kernel-image kernel-dev ke=
rnel-modules"
+PACKAGES =3D "kernel kernel-base kernel-vmlinux kernel-image kernel-dev ${=
KERNEL_MODULES_META_PACKAGE}"
 FILES_${PN} =3D ""
 FILES_kernel-base =3D "/lib/modules/${KERNEL_VERSION}/modules.order /lib/m=
odules/${KERNEL_VERSION}/modules.builtin"
 FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
 FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers* /boot/config=
* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
 FILES_kernel-vmlinux =3D "/boot/vmlinux*"
-FILES_kernel-modules =3D ""
+FILES_${KERNEL_MODULES_META_PACKAGE} =3D ""
 RDEPENDS_kernel =3D "kernel-base"
 # Allow machines to override this dependency if kernel image files are=20
 # not wanted in images as standard
@@ -390,8 +393,8 @@ RPROVIDES_kernel-base +=3D "kernel-${KERNEL_VERSION}"
 ALLOW_EMPTY_kernel =3D "1"
 ALLOW_EMPTY_kernel-base =3D "1"
 ALLOW_EMPTY_kernel-image =3D "1"
-ALLOW_EMPTY_kernel-modules =3D "1"
-DESCRIPTION_kernel-modules =3D "Kernel modules meta package"
+ALLOW_EMPTY_${KERNEL_MODULES_META_PACKAGE} =3D "1"
+DESCRIPTION_${KERNEL_MODULES_META_PACKAGE} =3D "Kernel modules meta packag=
e"
=20
 pkg_postinst_kernel-base () {
        if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then


