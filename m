Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id AF6327F968
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 22:11:42 +0000 (UTC)
IronPort-SDR: WAw3qb8ml6ZlFlRwCst3h6rgBSZ8Ku/ityh/qpUZen8TTy3PNrVNDNBXCeiTLANNKAUiUJaJrw
	PPfJwHuHmDYwXnoFvmwFG0ud+sfkNKCYJY/pcPPkARfz/xT9s0Mw6ywKvYhRclYUOOzeZieixy
	tldPRRKAVPrd1oZM9apIheU+rM8IcdW6Tcf7/G9IIQS9ebcnGiV1aWUyE8lrCLciL2WLZjK/fZ
	4OsZIlhAJBMcSkV+38pRBaKrOMQUcpE2/EQ89F9OxVS6yhHthC6k3oaLUn+RpO2caaViiVlVJK
	FH4=
X-IronPort-AV: E=Sophos;i="5.69,282,1571695200"; 
   d="scan'208";a="3292942"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 23:07:16 +0100
Message-Id: <20191205220716.29178-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191205220716.29178-1-pkj@axis.com>
References: <20191205220716.29178-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [master][zeus][PATCH 2/2] libtirpc: Make it easy to disable the installation of legacy headers
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
X-List-Received-Date: Thu, 05 Dec 2019 22:11:43 -0000
Content-Transfer-Encoding: 8bit

Providing symbolic links to the header files to replace the old
corresponding glibc headers seems like a band aid for applications
that have not been updated to cope with the lack of the RPC headers
from glibc. Additionally they clash with glibc if an older version of
glibc is used that still provides the header files. To remedy this,
make it easy to disable the installation of the legacy headers by not
setting the legacy-headers PACKAGECONFIG.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../libtirpc/libtirpc_1.1.4.bb                | 23 +++++++++++--------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
index 91e0ce6fd2..3c84694161 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
@@ -17,6 +17,9 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 SRC_URI[md5sum] = "f5d2a623e9dfbd818d2f3f3a4a878e3a"
 SRC_URI[sha256sum] = "2ca529f02292e10c158562295a1ffd95d2ce8af97820e3534fe1b0e3aec7561d"
 
+PACKAGECONFIG = "legacy-headers"
+PACKAGECONFIG[legacy-headers] = ""
+
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-gssapi"
@@ -24,16 +27,18 @@ EXTRA_OECONF = "--disable-gssapi"
 do_install_append() {
 	chown root:root ${D}${sysconfdir}/netconfig
 
-	for dir in rpc rpcsvc; do
-		install -d ${D}${includedir}/$dir
-		for link_header in ${D}${includedir}/tirpc/$dir/*; do
-			if [ -f $link_header ] &&
-			   [ ! -e ${D}${includedir}/$dir/$(basename $link_header) ]; then
-				ln -sf ../tirpc/$dir/$(basename $link_header) ${D}${includedir}/$dir/$(basename $link_header)
-			fi
+	if [ "${@bb.utils.filter('PACKAGECONFIG', 'legacy-headers', d)}" ]; then
+		for dir in rpc rpcsvc; do
+			install -d ${D}${includedir}/$dir
+			for link_header in ${D}${includedir}/tirpc/$dir/*; do
+				if [ -f $link_header ] &&
+				   [ ! -e ${D}${includedir}/$dir/$(basename $link_header) ]; then
+					ln -sf ../tirpc/$dir/$(basename $link_header) ${D}${includedir}/$dir/$(basename $link_header)
+				fi
+			done
 		done
-	done
-	ln -sf tirpc/netconfig.h ${D}${includedir}/netconfig.h
+		ln -sf tirpc/netconfig.h ${D}${includedir}/netconfig.h
+	fi
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.21.0


