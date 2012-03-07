Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1S5C2h-0002Wl-7A
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 09:16:15 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Mar 2012 00:07:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115740777"
Received: from unknown (HELO localhost) ([10.255.15.187])
	by azsmga001.ch.intel.com with ESMTP; 07 Mar 2012 00:07:34 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Mar 2012 00:06:46 -0800
Message-Id: <83eeb4ed11a6a63abda1f3978c849a46516b92a1.1331107546.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1331107546.git.dvhart@linux.intel.com>
References: <cover.1331107546.git.dvhart@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/1] kernel.bbclass: Remove warnings for modutils and modprobe.d
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
X-List-Received-Date: Wed, 07 Mar 2012 08:16:15 -0000

Fixes [Yocto #2036]

The source and build directories are unused, remove them.

The modutils and modprobe.d directories may be used if modules are built that
are either autoloaded or have modprobe.d entries. This isn't known at install
time, so check after the package split if these directories are empty and
remove them if they are.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/kernel.bbclass |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8fbec90..169df33 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -105,6 +105,8 @@ kernel_do_install() {
 		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
 		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.order"
 		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.builtin"
+		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
+		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
 	else
 		bbnote "no modules to install"
 	fi
@@ -450,6 +452,14 @@ python populate_packages_prepend () {
 	do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.cis$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
 	do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='update-modules kernel-%s' % d.getVar("KERNEL_VERSION", True))
 
+	# If modutils and modprobe.d are empty at this point, remove them to
+	# avoid warnings. removedirs only raises an OSError if an empty
+	# directory cannot be removed.
+	dvar = d.getVar('PKGD', True)
+	for dir in ["%s/etc/modutils" % (dvar), "%s/etc/modprobe.d" % (dvar)]:
+		if len(os.listdir(dir)) == 0:
+			os.rmdir(dir)
+
 	import re
 	metapkg = "kernel-modules"
 	d.setVar('ALLOW_EMPTY_' + metapkg, "1")
-- 
1.7.6.5



