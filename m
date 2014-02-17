Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A92896EE34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 08:23:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 17 Feb 2014 00:23:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,859,1384329600"; d="scan'208";a="476400700"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.197])
	by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2014 00:23:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 00:22:56 -0800
Message-Id: <8aacbeede9e259d229c41500c3cc68a489325399.1392625337.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1392625337.git.sgw@linux.intel.com>
References: <cover.1392625337.git.sgw@linux.intel.com>
In-Reply-To: <cover.1392625337.git.sgw@linux.intel.com>
References: <cover.1392625337.git.sgw@linux.intel.com>
Subject: [PATCH 1/7] libnl: Update to 3.2.24
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
X-List-Received-Date: Mon, 17 Feb 2014 08:23:03 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...free-caused-by-freeing-link-af_data-in-rt.patch | 41 ----------------------
 .../libnl/{libnl_3.2.22.bb => libnl_3.2.24.bb}     |  8 ++---
 2 files changed, 4 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-support/libnl/libnl/0001-fix-double-free-caused-by-freeing-link-af_data-in-rt.patch
 rename meta/recipes-support/libnl/{libnl_3.2.22.bb => libnl_3.2.24.bb} (83%)

diff --git a/meta/recipes-support/libnl/libnl/0001-fix-double-free-caused-by-freeing-link-af_data-in-rt.patch b/meta/recipes-support/libnl/libnl/0001-fix-double-free-caused-by-freeing-link-af_data-in-rt.patch
deleted file mode 100644
index 6d2c8ff..0000000
--- a/meta/recipes-support/libnl/libnl/0001-fix-double-free-caused-by-freeing-link-af_data-in-rt.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 6f37b439af7e96104aadd8ec3ae8d3882df8d102 Mon Sep 17 00:00:00 2001
-From: Jiri Pirko <jiri@resnulli.us>
-Date: Wed, 21 Aug 2013 14:40:34 +0200
-Subject: [PATCH] fix double free caused by freeing link af_data in
- rtnl_link_set_family()
-
-Introduced by commit 8026fe2e3a9089eff3f5a06ee6e3cc78d96334ed ("link:
-Free and realloc af specific data upon rtnl_link_set_family()")
-
-link->l_af_data[link->l_af_ops->ao_family] is freed here but not set to
-zero. That leads to double free made by link_free_data->do_foreach_af.
-
-Fix this by setting link->l_af_data[link->l_af_ops->ao_family] to zero
-rigth after free.
-
-Signed-off-by: Jiri Pirko <jiri@resnulli.us>
-Signed-off-by: Thomas Graf <tgraf@suug.ch>
----
- lib/route/link.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/lib/route/link.c b/lib/route/link.c
-index a73e1db..0bb90a0 100644
---- a/lib/route/link.c
-+++ b/lib/route/link.c
-@@ -1762,9 +1762,11 @@ void rtnl_link_set_family(struct rtnl_link *link, int family)
- 	link->l_family = family;
- 	link->ce_mask |= LINK_ATTR_FAMILY;
- 
--	if (link->l_af_ops)
-+	if (link->l_af_ops) {
- 		af_free(link, link->l_af_ops,
- 			link->l_af_data[link->l_af_ops->ao_family], NULL);
-+		link->l_af_data[link->l_af_ops->ao_family] = NULL;
-+	}
- 
- 	link->l_af_ops = af_lookup_and_alloc(link, family);
- }
--- 
-1.8.4
-
diff --git a/meta/recipes-support/libnl/libnl_3.2.22.bb b/meta/recipes-support/libnl/libnl_3.2.24.bb
similarity index 83%
rename from meta/recipes-support/libnl/libnl_3.2.22.bb
rename to meta/recipes-support/libnl/libnl_3.2.24.bb
index 73b10c5..0d2ee21 100644
--- a/meta/recipes-support/libnl/libnl_3.2.22.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.24.bb
@@ -13,11 +13,10 @@ SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
            file://fix-pktloc_syntax_h-race.patch \
            file://fix-pc-file.patch \
            file://fix-lib-cache_mngr.c-two-parentheses-bugs.patch \
-           file://0001-fix-double-free-caused-by-freeing-link-af_data-in-rt.patch \
           "
 
-SRC_URI[md5sum] = "2e1c889494d274aca24ce5f6a748e66e"
-SRC_URI[sha256sum] = "c7c5f267dfeae0c1a530bf96b71fb7c8dbbb07d54beef49b6712d8d6166f629b"
+SRC_URI[md5sum] = "6e0e7bad0674749d930dd9f285343d55"
+SRC_URI[sha256sum] = "fb8d6e5dc8af5b85bc6d00a71582a68a01e6a3f7d1664d4a646e289a99dd6816"
 
 inherit autotools pkgconfig
 
@@ -31,10 +30,11 @@ FILES_${PN}-dev += "${libdir}/libnl/cli/*/*.so \
                     ${libdir}/libnl/cli/*/*.la"
 FILES_${PN}-staticdev += "${libdir}/libnl/cli/*/*.a"
 
-PACKAGES += "${PN}-cli ${PN}-route ${PN}-nf ${PN}-genl"
+PACKAGES += "${PN}-cli ${PN}-idiag ${PN}-route ${PN}-nf ${PN}-genl"
 FILES_${PN}-cli   = "${libdir}/libnl-cli-3.so.* \
                      ${libdir}/libnl/cli/*/*.so.* \
                      ${sbindir}/nl-*"
+FILES_${PN}-idiag  = "${libdir}/libnl-idiag-3.so.*"
 FILES_${PN}-route = "${libdir}/libnl-route-3.so.*"
 FILES_${PN}-nf    = "${libdir}/libnl-nf-3.so.*"
 FILES_${PN}-genl  = "${libdir}/libnl-genl-3.so.* \
-- 
1.8.3.1


