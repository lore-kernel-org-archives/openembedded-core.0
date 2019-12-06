Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 059407FAAE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 18:42:09 +0000 (UTC)
IronPort-SDR: mvx64/R4d8+n03W27XAxv1r3UZvRF49ei5/0KdrKiiv/RAq8uIn8tlzJjooE9HDoNMBU3FUpMz
	tbiSU7bbARhsRilh3hj+vifQZIGRyLPlzAJW0Q2D2dUGIc0RU2vQDob1Lg984Td3VrOtk2N/x8
	aoK7xexsWw8fjeh8thz+c6OyQAAwT4GWd2Iret9cJt4WvjkcMNjLryXTayMJt2A13n23dnraVk
	FfOa7hwYJlE4DerzYVbCctJI8WTCYjSh43psx9ljeASPjf3KKa4wZ9A5NcQQIQ+89xWyntG697
	UFA=
X-IronPort-AV: E=Sophos;i="5.69,285,1571695200"; 
   d="scan'208";a="3243439"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 19:42:08 +0100
Message-Id: <20191206184208.7856-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [zeus][PATCH] Revert "libtirpc: create the symbol link for rpc header files"
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
X-List-Received-Date: Fri, 06 Dec 2019 18:42:10 -0000
Content-Transfer-Encoding: 8bit

This reverts commit 0b9748c655b6f733b504e70288f4b91dca2e4d58.

The headers provided by libtirpc are not drop in replacements for the
RPC header files previously provided by glibc, so do not install them
as if they were. Additionally, they clash with the header files
installed by glibc if an older version of glibc is used.

Any problems related to the lack of the old header files from glibc
should be addressed in the application/library that expects them.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
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


