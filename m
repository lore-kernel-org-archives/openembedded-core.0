Return-Path: <prvs=3996e59f5=Martin.Hundeboll@prevas.dk>
Received: from mail02.prevas.se (mail02.prevas.se [62.95.78.10])
	by mail.openembedded.org (Postfix) with ESMTP id 6022071985
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 09:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=2321; q=dns/txt;
	s=ironport2; t=1503307319; x=1534843319;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=+otIQPNI9LmWyVXFeUbJjK9UNZLJh209E5fz68McvmY=;
	b=we+NrKDsG/3pr6Dlz96Bz72XawCJJ2dcujpRM/7iP9GH6lG9QIQEMQW1
	vXrrYhTIblOA8IyK6zJ2fYUcFFS9wtSXTVQZwn9JeMQe/zqpCyOSQB7SK
	jQmdiRXS4DxtHX+aL69Mvo0Ok7fWN8GF8zi4bStFf/bZlCUpz9qglhBqO g=;
X-IronPort-AV: E=Sophos;i="5.41,408,1498514400"; 
   d="scan'208";a="2406183"
Received: from vmprevas4.prevas.se (HELO smtp.prevas.se) ([172.16.8.104])
	by ironport2.prevas.se with ESMTP/TLS/DHE-RSA-AES256-SHA;
	21 Aug 2017 11:21:56 +0200
Received: from mnhu.prevas.se (172.16.8.31) by smtp.prevas.se (172.16.8.104)
	with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Mon, 21 Aug 2017 11:21:56 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <mnhu@prevas.dk>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Aug 2017 11:21:34 +0200
Message-ID: <20170821092134.6329-1-mnhu@prevas.dk>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170821083946.4493-1-mnhu@prevas.dk>
References: <20170821083946.4493-1-mnhu@prevas.dk>
MIME-Version: 1.0
X-Originating-IP: [172.16.8.31]
Subject: [PATCH v2] kernel-module-split: rrecommend kernel-image instead of rdepend
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
X-List-Received-Date: Mon, 21 Aug 2017 09:21:57 -0000
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
index 1035525dac..78843c5474 100644
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
 
-    modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION")))
+    modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='')
     if modules:
         metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
         d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
-- 
2.14.1


