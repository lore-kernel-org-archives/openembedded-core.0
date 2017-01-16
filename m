Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 97C9171C0F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 18:51:59 +0000 (UTC)
Received: from svr-orw-mbx-02.mgc.mentorg.com ([147.34.90.202])
	by relay1.mentorg.com with esmtp 
	id 1cTCNs-0006S2-G9 from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2017 10:52:00 -0800
Received: from localhost (147.34.91.1) by svr-orw-mbx-02.mgc.mentorg.com
	(147.34.90.202) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Mon, 16 Jan 2017 10:51:58 -0800
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jan 2017 12:51:43 -0600
Message-ID: <1484592706-28177-3-git-send-email-nathan_lynch@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484592706-28177-1-git-send-email-nathan_lynch@mentor.com>
References: <1484592706-28177-1-git-send-email-nathan_lynch@mentor.com>
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
	svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
Subject: [PATCH v2 2/5] lttng-ust: upgrade to 2.9.0
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
X-List-Received-Date: Mon, 16 Jan 2017 18:51:59 -0000
Content-Type: text/plain

buildhistory-diff says:

  /usr/lib/liblttng-ust-python-agent.so.0 was removed
  /usr/lib/liblttng-ust-python-agent.so.0.0.0 was removed

This is because prior versions of lttng-ust unconditionally built
the Python agent libraries; this was fixed upstream in 21ddb8e ("Only
build python lib when agent is enabled").

Switch to using release tarballs.

Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
---
 .../lttng/{lttng-ust_git.bb => lttng-ust_2.9.0.bb}          | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_git.bb => lttng-ust_2.9.0.bb} (84%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_git.bb b/meta/recipes-kernel/lttng/lttng-ust_2.9.0.bb
similarity index 84%
rename from meta/recipes-kernel/lttng/lttng-ust_git.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.9.0.bb
index 07ce2f4382bb..9cdefddf16bd 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.9.0.bb
@@ -18,13 +18,13 @@ RPROVIDES_${PN} = "lttng2-ust"
 RREPLACES_${PN} = "lttng2-ust"
 RCONFLICTS_${PN} = "lttng2-ust"
 
-SRCREV = "514a87f3b64181e384399935a5708a8f85b0cc83"
 PE = "2"
-PV = "2.8.1+git${SRCPV}"
 
-SRC_URI = "git://git.lttng.org/lttng-ust.git;branch=stable-2.8 \
+SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://lttng-ust-doc-examples-disable.patch \
           "
+SRC_URI[md5sum] = "77f3378ba37a36801420bce87b702e9c"
+SRC_URI[sha256sum] = "4d541a863f42dfc685ca05024027a442c70d03594c154a43e62bc109b1ea5daf"
 
 PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
 
@@ -33,10 +33,3 @@ do_install_append() {
         # still refer to Python 2 in the shebang
         sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${bindir}/lttng-gen-tp
 }
-
-
-S = "${WORKDIR}/git"
-
-do_configure_prepend () {
-	( cd ${S}; ${S}/bootstrap )
-}
-- 
2.7.4


