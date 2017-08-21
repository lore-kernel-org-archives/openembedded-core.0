Return-Path: <prvs=3996e59f5=Martin.Hundeboll@prevas.dk>
X-Greylist: delayed 603 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 21 Aug 2017 08:50:04 UTC
Received: from mail01.prevas.se (mail01.prevas.se [62.95.78.3])
	by mail.openembedded.org (Postfix) with ESMTP id 539B878249
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 08:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=2285; q=dns/txt;
	s=ironport1; t=1503305407; x=1534841407;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=9FVMUymMxGT/oCnEo9nUzpKhK8/PwpOMql/2c6FZuMI=;
	b=IFCtPPPj5vQW2GYH5XzmIa9aLmW3GS/1D/NNMe90L8K+TA1uLGwrzaf+
	nhGUxc82J6C99DT/5Y/caJPar1lsg3mZygwCGJdEO4W0s+KhXnQ0gXrIl
	sKRUI1XXdJqPze/IUOPfRINw45YVjy2d97qIqROasHSTK/tjKwvpmchly Y=;
X-IronPort-AV: E=Sophos;i="5.41,408,1498514400"; 
   d="scan'208";a="2514935"
Received: from vmprevas4.prevas.se (HELO smtp.prevas.se) ([172.16.8.104])
	by ironport1.prevas.se with ESMTP/TLS/DHE-RSA-AES256-SHA;
	21 Aug 2017 10:40:00 +0200
Received: from mnhu.prevas.se (172.16.8.31) by smtp.prevas.se (172.16.8.104)
	with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Mon, 21 Aug 2017 10:40:00 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <mnhu@prevas.dk>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Aug 2017 10:39:46 +0200
Message-ID: <20170821083946.4493-1-mnhu@prevas.dk>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-Originating-IP: [172.16.8.31]
Subject: [PATCH] kernel-module-split: rrecommend kernel-image instead of rdepend
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
X-List-Received-Date: Mon, 21 Aug 2017 08:50:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hard depending on the kernel makes it impossible to install kernel
modules without getting the kernel image installed too. This is
inconvenient in e.g. initramdisks, where the kernel is loaded from
outside the initramdisk.

Making the kernel modules rrecommend kernel-image-<version> instead of
rdepending on it, makes it possible to install kernel modules without
the kernel image by setting "kernel-image" in BAD_RECOMMENDATIONS.

Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>
---
 meta/classes/kernel-module-split.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index ba9cc1517e..7a0260e3db 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -120,6 +120,11 @@ python split_kernel_module_packages () {
                 rdepends[dep] = []
         d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
 
+        # let kernel modules runtime recommend kernel image
+        rrecommends = bb.utils.explode_dep_versions2(d.getVar('RRECOMMENDS_' + pkg) or "")
+        rrecommends['kernel-image'] = []
+        d.setVar('RRECOMMENDS_' + pkg, bb.utils.join_deps(rrecommends, commasep=False))
+
         # Avoid automatic -dev recommendations for modules ending with -dev.
         d.setVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs', 1)
 
@@ -138,7 +143,7 @@ python split_kernel_module_packages () {
     postinst = d.getVar('pkg_postinst_modules')
     postrm = d.getVar('pkg_postrm_modules')
 
-    modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION")))
+    modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='')
     if modules:
         metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
         d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
-- 
2.14.1


