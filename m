Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A3F6E7F996
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 09:44:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xA69irKi028589
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Nov 2019 01:44:53 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 6 Nov 2019 01:44:52 -0800
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Nov 2019 01:44:52 -0800
Message-ID: <20191106094452.54576-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] libtirpc: create the symbol link for rpc header files
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
X-List-Received-Date: Wed, 06 Nov 2019 09:44:53 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Issue: LIN1018-5190

Since the Sun RPC is deprecated in glibc, the rpc header files
are not provided any more, but it allows alternative RPC
implementations, such as TIRPC or rpcsvc-proto, to be used.

So we create the symbol link for rpc header files for tirpc to
be more compatible with the glibc version and the application usage.

(LOCAL REV: NOT UPSTREAM) -- Send to oe-core on 20191106

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
index e73ffe7b17..a284521c1e 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
@@ -23,6 +23,20 @@ EXTRA_OECONF = "--disable-gssapi"
 
 do_install_append() {
         chown root:root ${D}${sysconfdir}/netconfig
+        install -d ${D}${includedir}/rpc
+        install -d ${D}${includedir}/rpcsvc
+        for link_header in ${D}${includedir}/tirpc/rpc/*; do
+            if [ -f $link_header -a ! -e ${D}/${includedir}/rpc/$(basename $link_header) ]; then
+                ln -sf ${includedir}/tirpc/rpc/$(basename $link_header) ${D}${includedir}/rpc/$(basename $link_header)
+            fi
+        done
+        for link_header in ${D}${includedir}/tirpc/rpcsvc/*; do
+            if [ -f $link_header -a ! -e ${D}/${includedir}/rpcsvc/$(basename $link_header) ]; then
+                ln -sf ${includedir}/tirpc/rpc/$(basename $link_header) ${D}${includedir}/rpcsvc/$(basename $link_header)
+            fi
+        done
+        ln -sf  ${includedir}/tirpc/netconfig.h ${D}/${includedir}/netconfig.h
+
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.23.0


