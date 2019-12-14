Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A0F5C7F8C8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 06:15:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2019 22:15:27 -0800
X-IronPort-AV: E=Sophos;i="5.69,312,1571727600"; d="scan'208";a="204540220"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.64.187])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2019 22:15:26 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Dec 2019 14:15:00 +0800
Message-Id: <6695b54b27782fc8169efd2de6d5e5faad1f25aa.1576303901.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1576303901.git.anuj.mittal@intel.com>
References: <cover.1576303901.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 06/11] Revert "libtirpc: create the symbol link for rpc header files"
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
X-List-Received-Date: Sat, 14 Dec 2019 06:15:25 -0000
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This reverts commit 0b9748c655b6f733b504e70288f4b91dca2e4d58.

The headers provided by libtirpc are not drop in replacements for the
RPC header files previously provided by glibc, so do not install them
as if they were. Additionally, they clash with the header files
installed by glibc if an older version of glibc is used.

Any problems related to the lack of the old header files from glibc
should be addressed in the application/library that expects them.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
index 8977a37cf0..692f0d9f9c 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
@@ -22,21 +22,7 @@ inherit autotools pkgconfig
 EXTRA_OECONF = "--disable-gssapi"
 
 do_install_append() {
-        chown root:root ${D}${sysconfdir}/netconfig
-        install -d ${D}${includedir}/rpc
-        install -d ${D}${includedir}/rpcsvc
-        for link_header in ${D}${includedir}/tirpc/rpc/*; do
-            if [ -f $link_header -a ! -e ${D}/${includedir}/rpc/$(basename $link_header) ]; then
-                ln -sf ../tirpc/rpc/$(basename $link_header) ${D}${includedir}/rpc/$(basename $link_header)
-            fi
-        done
-        for link_header in ${D}${includedir}/tirpc/rpcsvc/*; do
-            if [ -f $link_header -a ! -e ${D}/${includedir}/rpcsvc/$(basename $link_header) ]; then
-                ln -sf ../tirpc/rpc/$(basename $link_header) ${D}${includedir}/rpcsvc/$(basename $link_header)
-            fi
-        done
-        ln -sf  tirpc/netconfig.h ${D}/${includedir}/netconfig.h
-
+	chown root:root ${D}${sysconfdir}/netconfig
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.21.0


