Return-Path: <nitin.a.kamble@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DDE9E6FEB0
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 06:01:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jun 2014 23:01:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,499,1400050800"; d="scan'208";a="557204756"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2014 23:01:44 -0700
From: nitin.a.kamble@intel.com
To: richard.purdie@linuxfoundation.org,
	Openembedded-core@lists.openembedded.org
Date: Tue, 17 Jun 2014 23:04:56 -0700
Message-Id: <d85fc19225f111f9fbb686f58f8bb7814ba683af.1403071319.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1403071319.git.nitin.a.kamble@intel.com>
References: <cover.1403071319.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] kernel-module-split.bbclass: fix a typo in var name
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
X-List-Received-Date: Wed, 18 Jun 2014 06:01:55 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The recently added kernel-module-split.bbclass had a bug in processing of
the KERNEL_MODULE_AUTOLOAD variable. It was using the older autload variable
in place of the newer autoloadlist variable, which was causing build failure
as seen below.

The stack trace of python calls that resulted in this exception/failure was:
File: 'split_kernel_module_packages', lineno: 164, function: <module>
     0160:        if len(os.listdir(dir)) == 0:
     0161:            os.rmdir(dir)
     0162:
     0163:
 *** 0164:split_kernel_module_packages(d)
     0165:
File: 'split_kernel_module_packages', lineno: 150, function: split_kernel_module_packages
     0146:
     0147:    postinst = d.getVar('pkg_postinst_modules', True)
     0148:    postrm = d.getVar('pkg_postrm_modules', True)
     0149:
 *** 0150:    modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION", True)))
     0151:    if modules:
     0152:        metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE', True)
     0153:        d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
     0154:
File: 'package.bbclass', lineno: 148, function: do_split_packages
     0144:                d.setVar('pkg_postrm_' + pkg, postrm)
     0145:        else:
     0146:            d.setVar('FILES_' + pkg, oldfiles + " " + newfile)
     0147:        if callable(hook):
 *** 0148:            hook(f, pkg, file_regex, output_pattern, m.group(1))
     0149:
     0150:    d.setVar('PACKAGES', ' '.join(packages))
     0151:    return split_packages
     0152:
File: 'split_kernel_module_packages', lineno: 109, function: frob_metadata
  File "split_kernel_module_packages", line 109, in frob_metadata

Exception: AttributeError: 'NoneType' object has no attribute 'split'

ERROR: Function failed: split_kernel_module_packages

Fixes bug:
[Yocto #6461]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/kernel-module-split.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index e38a6f6..088de5f 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -137,7 +137,7 @@ python split_kernel_module_packages () {
         if basename in autoloadlist:
             name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
             f = open(name, 'w')
-            for m in autoload.split():
+            for m in autoloadlist:
                 f.write('%s\n' % m)
             f.close()
             postinst = d.getVar('pkg_postinst_%s' % pkg, True)
-- 
1.8.1.4


