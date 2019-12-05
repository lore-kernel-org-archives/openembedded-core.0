Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id CAC047F938
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 22:10:34 +0000 (UTC)
IronPort-SDR: rJ9JetMXe4OA6lJ2mDD2q06uuqgpilkV8eZ4z2fXhp0kCpsV2gMGPTD5CcFVAe72BMxgallQjS
	5c1tj1BVnhk+HTSa5Ypn/yV6LKYnDCmxqIatHziOKs7NSgZLJ3Z++T3FLj0bnIq3k+khXdL1q0
	gVqOp1aFNROAcEPACBQjZxe1XTADDmsIqK0k+4jSz5qJpgt9pBC5Rf2m4lsl3o06w+rf6mkBiF
	U/5srrcNLX3wyLMm4Wa2TsEkJiF3vBX6JPYs9M+SwsgHGviV4h90FmPy42vaMCGfxPgzZMNrex
	s2A=
X-IronPort-AV: E=Sophos;i="5.69,282,1571695200"; 
   d="scan'208";a="3192368"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 23:07:15 +0100
Message-Id: <20191205220716.29178-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [master][zeus][PATCH 1/2] libtirpc: Simplify the installation of symlinks for legacy headers
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
X-List-Received-Date: Thu, 05 Dec 2019 22:10:35 -0000
Content-Transfer-Encoding: 8bit

This also corrects the symbolic links installed in
/usr/include/rpcsvc.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../libtirpc/libtirpc_1.1.4.bb                | 27 +++++++++----------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
index 633cececd4..91e0ce6fd2 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Transport-Independent RPC library"
-DESCRIPTION = "Libtirpc is a port of Suns Transport-Independent RPC library to Linux"
+DESCRIPTION = "Libtirpc is a port of Sun's Transport-Independent RPC library to Linux"
 SECTION = "libs/network"
 HOMEPAGE = "http://sourceforge.net/projects/libtirpc/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=183075&atid=903784"
@@ -22,21 +22,18 @@ inherit autotools pkgconfig
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
+	chown root:root ${D}${sysconfdir}/netconfig
 
+	for dir in rpc rpcsvc; do
+		install -d ${D}${includedir}/$dir
+		for link_header in ${D}${includedir}/tirpc/$dir/*; do
+			if [ -f $link_header ] &&
+			   [ ! -e ${D}${includedir}/$dir/$(basename $link_header) ]; then
+				ln -sf ../tirpc/$dir/$(basename $link_header) ${D}${includedir}/$dir/$(basename $link_header)
+			fi
+		done
+	done
+	ln -sf tirpc/netconfig.h ${D}${includedir}/netconfig.h
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.21.0


