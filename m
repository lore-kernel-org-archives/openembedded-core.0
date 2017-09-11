Return-Path: <prvs=42006fa7b=Martin.Hundeboll@prevas.dk>
Received: from mail02.prevas.se (mail02.prevas.se [62.95.78.10])
	by mail.openembedded.org (Postfix) with ESMTP id 1A13978217
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=2358; q=dns/txt;
	s=ironport2; t=1505132949; x=1536668949;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=kHydL5K1dOe0afkcsOVbxpEleIvwdf64OMSW1l9/C1Q=;
	b=habgCe2OoOr0t3q1OOP5ONa5+PRSMrQGbR2UVrLVKTbmqohA8NPsE5Hf
	GTeeuuwtsGNwah2as1V98BHXScC4pMwrChmVZ0mJ/iJKN1hYVtG6MKOXZ
	UvVnN1Mk//bsmtSMws+v+yieyKOYlf4rf2qGopVquA08JzmedhV1VRGaD 0=;
X-IronPort-AV: E=Sophos;i="5.42,377,1500933600"; 
   d="scan'208";a="2470072"
Received: from vmprevas3.prevas.se (HELO smtp.prevas.se) ([172.16.8.103])
	by ironport2.prevas.se with ESMTP/TLS/DHE-RSA-AES256-SHA;
	11 Sep 2017 14:29:07 +0200
Received: from mnhu.prevas.se (172.16.8.31) by smtp.prevas.se (172.16.8.103)
	with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Mon, 11 Sep 2017 14:29:07 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <mnhu@prevas.dk>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 14:28:36 +0200
Message-ID: <20170911122836.15465-1-mnhu@prevas.dk>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911072328.8449-1-mnhu@prevas.dk>
References: <20170911072328.8449-1-mnhu@prevas.dk>
MIME-Version: 1.0
X-Originating-IP: [172.16.8.31]
Subject: [PATCHv2] Revert "kernel-module-split: rrecommend kernel-image instead of rdepend"
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
X-List-Received-Date: Mon, 11 Sep 2017 12:29:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This reverts commit e0ed52c51464855e9a6a37ea49df7efde7e91076.

Commit e0ed52c514 ('kernel-module-split: rrecommend kernel-image instead
of rdepend') changed kernel modules to rrecommend kernel-image instead
of rdepend on kernel. This broke existing setups, where the kernel is
omitted by setting RDEPEND_kernel-base = "".

Revert the patch, as the existing way of omitting kernel-image in images
works just fine.

Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>

---

Changes in v2:
 * Added signed-of-by line

---
 meta/classes/kernel-module-split.bbclass | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 78843c5474..1035525dac 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -120,11 +120,6 @@ python split_kernel_module_packages () {
                 rdepends[dep] = []
         d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends, commasep=False))
 
-        # let kernel modules runtime recommend kernel image
-        rrecommends = bb.utils.explode_dep_versions2(d.getVar('RRECOMMENDS_' + pkg) or "")
-        rrecommends['kernel-image'] = []
-        d.setVar('RRECOMMENDS_' + pkg, bb.utils.join_deps(rrecommends, commasep=False))
-
         # Avoid automatic -dev recommendations for modules ending with -dev.
         d.setVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs', 1)
 
@@ -143,7 +138,7 @@ python split_kernel_module_packages () {
     postinst = d.getVar('pkg_postinst_modules')
     postrm = d.getVar('pkg_postrm_modules')
 
-    modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='')
+    modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION")))
     if modules:
         metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
         d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
-- 
2.14.1


