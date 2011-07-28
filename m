Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1QmTRT-0007kY-4E
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 18:28:11 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Jul 2011 09:23:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,283,1309762800"; d="scan'208";a="31328467"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by orsmga002.jf.intel.com with ESMTP; 28 Jul 2011 09:23:54 -0700
Received: from orsmsx104.amr.corp.intel.com (10.22.225.131) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 28 Jul 2011 09:23:54 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.233]) by
	ORSMSX104.amr.corp.intel.com ([169.254.3.12]) with mapi id
	14.01.0289.001; Thu, 28 Jul 2011 09:23:53 -0700
From: "Zhang, Jessica" <jessica.zhang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] [M3]meta-environment: set correct
	*MULTIMACH_TARGET_SYS.
Thread-Index: AQHMTUK9heVr/VKd9EKvLX/J8Z02mA==
Date: Thu, 28 Jul 2011 16:23:53 +0000
Message-ID: <C6510F6D410BB64A8C15398EDC6B847C136FBF0A@ORSMSX101.amr.corp.intel.com>
References: <cover.1311851957.git.lianhao.lu@intel.com>
	<4249ed775fcb53aec8c516f5c10fbed2a084bf16.1311851957.git.lianhao.lu@intel.com>
In-Reply-To: <4249ed775fcb53aec8c516f5c10fbed2a084bf16.1311851957.git.lianhao.lu@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] [M3]meta-environment: set correct	*MULTIMACH_TARGET_SYS.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jul 2011 16:28:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Lianhao Lu
Sent: Thursday, July 28, 2011 4:24 AM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 1/1] meta-environment: set correct *MULTIMACH_TAR=
GET_SYS.

Fixed [BUGID #1299]. OLD_MULTIMACH_TARGET_SYS is no longer available.
Use new recipe-scope variable REAL_MULTIMACH_TARGET_SYS instead.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
Acted-by: Jessica Zhang <jessica.zhang@intel.com>
---
 meta/classes/toolchain-scripts.bbclass     |    7 ++++---
 meta/recipes-core/meta/meta-environment.bb |    9 +++++----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchai=
n-scripts.bbclass
index 3301319..832cce4 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -66,13 +66,14 @@ toolchain_create_tree_env_script () {
 # This function creates an environment-setup-script for use by the ADT ins=
taller
 toolchain_create_sdk_env_script_for_installer () {
        # Create environment setup script
-       script=3D${SDK_OUTPUT}/${SDKPATH}/environment-setup-${OLD_MULTIMACH=
_TARGET_SYS}
+       local multimach_target_sys=3D$1
+       script=3D${SDK_OUTPUT}/${SDKPATH}/environment-setup-${multimach_tar=
get_sys}
        rm -f $script
        touch $script
-       echo 'export PATH=3D${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNA=
TIVE}${bindir_nativesdk}/${OLD_MULTIMACH_TARGET_SYS}:$PATH' >> $script
+       echo 'export PATH=3D${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNA=
TIVE}${bindir_nativesdk}/'"${multimach_target_sys}"':$PATH' >> $script
        echo 'export PKG_CONFIG_SYSROOT_DIR=3D##SDKTARGETSYSROOT##' >> $scr=
ipt
        echo 'export PKG_CONFIG_PATH=3D##SDKTARGETSYSROOT##${target_libdir}=
/pkgconfig' >> $script
-       echo 'export CONFIG_SITE=3D${SDKPATH}/site-config-${OLD_MULTIMACH_T=
ARGET_SYS}' >> $script
+       echo 'export CONFIG_SITE=3D${SDKPATH}/site-config-'"${multimach_tar=
get_sys}" >> $script
        echo 'export CC=3D${TARGET_PREFIX}gcc' >> $script
        echo 'export CXX=3D${TARGET_PREFIX}g++' >> $script
        echo 'export GDB=3D${TARGET_PREFIX}gdb' >> $script
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core=
/meta/meta-environment.bb
index 351cbf0..6d547bb 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -2,13 +2,14 @@ DESCRIPTION =3D "Package of environment files for SDK"
 LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285e=
c7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788=
c80a0384361b4de20420"
 LICENSE =3D "MIT"
-PR =3D "r4"
+PR =3D "r5"

 EXCLUDE_FROM_WORLD =3D "1"

 inherit toolchain-scripts
 # get target config site before inheritting cross-canadian
 TARGET_CONFIG_SITE :=3D "${@siteinfo_get_files(d)}"
+REAL_MULTIMACH_TARGET_SYS =3D "${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS=
}"

 SDK_DIR =3D "${WORKDIR}/sdk"
 SDK_OUTPUT =3D "${SDK_DIR}/image"
@@ -22,12 +23,12 @@ do_generate_content() {
     rm -rf ${SDK_OUTPUT}
     mkdir -p ${SDK_OUTPUT}/${SDKPATH}

-    toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-$=
{OLD_MULTIMACH_TARGET_SYS} ${TARGET_CONFIG_SITE}
+    toolchain_create_sdk_siteconfig ${SDK_OUTPUT}/${SDKPATH}/site-config-$=
{REAL_MULTIMACH_TARGET_SYS} ${TARGET_CONFIG_SITE}

-    toolchain_create_sdk_env_script_for_installer
+    toolchain_create_sdk_env_script_for_installer ${REAL_MULTIMACH_TARGET_=
SYS}

     # Add version information
-    toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${OLD_MU=
LTIMACH_TARGET_SYS}
+    toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${REAL_M=
ULTIMACH_TARGET_SYS}
 }
 addtask generate_content before do_install after do_compile

--
1.7.0.4


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


