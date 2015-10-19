Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 80B447704A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 16:33:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Oct 2015 09:33:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,702,1437462000"; d="scan'208";a="830461005"
Received: from ggwalsh-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.6.253])
	by fmsmga002.fm.intel.com with ESMTP; 19 Oct 2015 09:33:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 17:33:09 +0100
Message-Id: <df347e66d79897460965194eac695ad48b564195.1445272352.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1445272352.git.paul.eggleton@linux.intel.com>
References: <cover.1445272352.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1445272352.git.paul.eggleton@linux.intel.com>
References: <cover.1445272352.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v3 2/5] classes/populate_sdk_ext: prevent image construction from executing on install
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
X-List-Received-Date: Mon, 19 Oct 2015 16:33:21 -0000

In order to prepare the build system within the extensible SDK, we
actually go ahead and build the targets specified by SDK_TARGETS (by
default the image the SDK was built for). Assuming that's an image, we
don't actually need to build the image itself - we just need to have
everything done up to the point before building the image, so that we
have everything needed in the sysroot.

In order to do this, create temporary bbappends for each of the targets
in the workspace layer that stub out do_rootfs and related tasks if they
exist. This is a little bit of a hack but is the least intrusive fix at
this point. To make things a bit tidier, I have split out the
preparation commands into a separate script so we can run that in the
appropriate environment rather than all the commands separately.

Fixes [YOCTO #7590].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass |  5 ++++-
 meta/files/ext-sdk-prepare.sh         | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta/files/ext-sdk-prepare.sh

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 90033ba..0feb3b2 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -203,6 +203,8 @@ install_tools() {
 	install $buildtools_path ${SDK_OUTPUT}/${SDKPATH}
 
 	install ${SDK_DEPLOY}/${BUILD_ARCH}-nativesdk-libc.tar.bz2 ${SDK_OUTPUT}/${SDKPATH}
+
+	install -m 0755 ${COREBASE}/meta/files/ext-sdk-prepare.sh ${SDK_OUTPUT}/${SDKPATH}
 }
 
 # Since bitbake won't run as root it doesn't make sense to try and install
@@ -242,8 +244,9 @@ sdk_ext_postinst() {
 		# dash which is /bin/sh on Ubuntu will not preserve the
 		# current working directory when first ran, nor will it set $1 when
 		# sourcing a script. That is why this has to look so ugly.
-		sh -c ". buildtools/environment-setup* > preparing_build_system.log && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> preparing_build_system.log && bitbake ${SDK_TARGETS} >> preparing_build_system.log" || { echo "SDK preparation failed: see `pwd`/preparing_build_system.log" ; exit 1 ; }
+		sh -c ". buildtools/environment-setup* > preparing_build_system.log && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> preparing_build_system.log && $target_sdk_dir/ext-sdk-prepare.sh $target_sdk_dir '${SDK_TARGETS}' >> preparing_build_system.log 2>&1" || { echo "SDK preparation failed: see `pwd`/preparing_build_system.log" ; exit 1 ; }
 	fi
+	rm -f $target_sdk_dir/ext-sdk-prepare.sh
 	echo done
 }
 
diff --git a/meta/files/ext-sdk-prepare.sh b/meta/files/ext-sdk-prepare.sh
new file mode 100644
index 0000000..160c71e
--- /dev/null
+++ b/meta/files/ext-sdk-prepare.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+# Prepare the build system within the extensible SDK
+
+target_sdk_dir="$1"
+sdk_targets="$2"
+
+# Avoid actually building images during this phase, but still
+# ensure all dependencies are extracted from sstate
+# This is a hack, to be sure, but we really don't need to do this here
+for sdktarget in $sdk_targets ; do
+	bbappend=`recipetool newappend $target_sdk_dir/workspace $sdktarget`
+	printf 'python do_rootfs_forcevariable () {\n    bb.utils.mkdirhier(d.getVar("IMAGE_ROOTFS", True))\n}\n' > $bbappend
+	printf 'python do_bootimg () {\n    pass\n}\n' >> $bbappend
+	printf 'python do_bootdirectdisk () {\n    pass\n}\n' >> $bbappend
+	printf 'python do_vmimg () {\n    pass\n}\n' >> $bbappend
+	printf "Created bbappend %s\n" "$bbappend"
+done
+bitbake $sdk_targets || exit 1
+rm -rf $target_sdk_dir/workspace/appends/*
-- 
2.1.0


