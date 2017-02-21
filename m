Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A20A973005
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 23:07:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 21 Feb 2017 15:07:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,191,1484035200"; d="scan'208";a="1133086865"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2017 15:07:45 -0800
Received: from fmsmsx126.amr.corp.intel.com (10.18.125.43) by
	FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Tue, 21 Feb 2017 15:07:45 -0800
Received: from fmsmsx107.amr.corp.intel.com ([169.254.6.78]) by
	FMSMSX126.amr.corp.intel.com ([169.254.1.200]) with mapi id
	14.03.0248.002; Tue, 21 Feb 2017 15:07:45 -0800
From: "Pedraza Gonzalez, Francisco J" <francisco.j.pedraza.gonzalez@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 3/3] classes/populate_sdk_base: Adds support to
	generate extensible sdk package manifest
Thread-Index: AQHSjJSw1d+sKm/ui0Cf5V/AICYUVqF0FP/g
Date: Tue, 21 Feb 2017 23:07:44 +0000
Message-ID: <475C95148A21B945A7A18605A8298B99102CD9BF@fmsmsx107.amr.corp.intel.com>
References: <1487717331-26684-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
	<1487717331-26684-3-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
In-Reply-To: <1487717331-26684-3-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.108]
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] classes/populate_sdk_base: Adds support to generate extensible sdk package manifest
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
X-List-Received-Date: Tue, 21 Feb 2017 23:07:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I tested this implementation and is writing the installed packages on host =
and target manifest properly.
https://bugzilla.yoctoproject.org/attachment.cgi?id=3D3639
https://bugzilla.yoctoproject.org/attachment.cgi?id=3D3638

Regards,




Francisco Pedraza=20
Open-source Technology Center=20
Yocto Project



-----Original Message-----
From: Pedraza Gonzalez, Francisco J=20
Sent: Tuesday, February 21, 2017 4:49 PM
To: openembedded-core@lists.openembedded.org
Cc: Pedraza Gonzalez, Francisco J <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH 3/3] classes/populate_sdk_base: Adds support to generate ex=
tensible sdk package manifest

This function writes on host and target manifest files for eSDK.
[YOCTO #9038]

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate=
_sdk_base.bbclass
index 33665cd..db700d7 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -59,6 +59,9 @@ SDK_TITLE ?=3D "${@d.getVar('DISTRO_NAME') or d.getVar('D=
ISTRO')} SDK"
=20
 SDK_TARGET_MANIFEST =3D "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.target.ma=
nifest"
 SDK_HOST_MANIFEST =3D "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.host.manife=
st"
+SDK_EXT_TARGET_MANIFEST =3D "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.targ=
et.manifest"
+SDK_EXT_HOST_MANIFEST =3D "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.m=
anifest"
+
 python write_target_sdk_manifest () {
     if d.getVar('BB_CURRENTTASK') =3D=3D 'populate_sdk':
         from oe.sdk import sdk_list_installed_packages @@ -69,6 +72,17 @@ =
python write_target_sdk_manifest () {
             bb.utils.mkdirhier(sdkmanifestdir)
         with open(d.getVar('SDK_TARGET_MANIFEST'), 'w') as output:
             output.write(format_pkg_list(pkgs, 'ver'))
+    elif d.getVar('BB_CURRENTTASK') =3D=3D 'populate_sdk_ext':
+        from oe.sdk import get_extra_sdkinfo
+        sstate_dir =3D d.expand('${SDK_OUTPUT}/${SDKPATH}/sstate-cache')
+        extra_info =3D get_extra_sdkinfo(sstate_dir)
+        target =3D d.getVar('TARGET_SYS')
+        target_multimach =3D d.getVar('MULTIMACH_TARGET_SYS')
+        with open(d.getVar('SDK_EXT_TARGET_MANIFEST'), 'w') as f:
+            for fn in extra_info['filesizes']:
+                info =3D fn.split(':') #added
+                if info[2] in (target, target_multimach):
+                    f.write("%s %s %s\n" % (info[1], info[2], info[3]))
 }
=20
 python write_sdk_test_data() {
@@ -88,12 +102,22 @@ python write_host_sdk_manifest () {
             bb.utils.mkdirhier(sdkmanifestdir)
         with open(d.getVar('SDK_HOST_MANIFEST'), 'w') as output:
             output.write(format_pkg_list(pkgs, 'ver'))
+    elif d.getVar('BB_CURRENTTASK') =3D=3D 'populate_sdk_ext':
+        from oe.sdk import get_extra_sdkinfo
+        sstate_dir =3D d.expand('${SDK_OUTPUT}/${SDKPATH}/sstate-cache')
+        extra_info =3D get_extra_sdkinfo(sstate_dir)
+        host =3D d.getVar('BUILD_SYS')
+        with open(d.getVar('SDK_EXT_HOST_MANIFEST'), 'w') as f:
+            for fn in extra_info['filesizes']:
+                info =3D fn.split(':') #added
+                if info[2] =3D=3D host:
+                    f.write("%s %s %s\n" % (info[1], info[2], info[3]))
 }
=20
 POPULATE_SDK_POST_TARGET_COMMAND_append =3D " write_target_sdk_manifest ; =
write_sdk_test_data ; "
 POPULATE_SDK_POST_HOST_COMMAND_append =3D " write_host_sdk_manifest; "
 SDK_PACKAGING_COMMAND =3D "${@'${SDK_PACKAGING_FUNC};' if '${SDK_PACKAGING=
_FUNC}' else ''}"
-SDK_POSTPROCESS_COMMAND =3D " create_sdk_files; check_sdk_sysroots; tar_sd=
k; ${SDK_PACKAGING_COMMAND} "
+SDK_POSTPROCESS_COMMAND =3D " create_sdk_files; check_sdk_sysroots; tar_sd=
k; write_target_sdk_manifest; write_host_sdk_manifest; ${SDK_PACKAGING_COMM=
AND} "
=20
 def populate_sdk_common(d):
     from oe.sdk import populate_sdk
--
1.8.3.1


