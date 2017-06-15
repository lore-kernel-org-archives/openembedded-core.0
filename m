Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E8F3765D35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 21:35:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5FLZSH3024879
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 14:35:29 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 15 Jun 2017 14:35:28 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Jun 2017 14:35:27 -0700
Message-ID: <1497562527-13137-2-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1497562527-13137-1-git-send-email-jslater@windriver.com>
References: <1497562527-13137-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
Subject: [v4][PATCH 2/2] ghostscript: add X11 PACKAGECONFIG info
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
X-List-Received-Date: Thu, 15 Jun 2017 21:35:29 -0000
Content-Type: text/plain

Add information necessary to build for x11, but
do not enable that option.

Fix parallel build directory creation issue.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.21.bb | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.21.bb b/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
index ed0fd43..fb36a13 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
@@ -48,7 +48,21 @@ SRC_URI_class-native = "${SRC_URI_BASE} \
 SRC_URI[md5sum] = "5f213281761d2750fcf27476c404d17f"
 SRC_URI[sha256sum] = "02bceadbc4dddeb6f2eec9c8b1623d945d355ca11b8b4df035332b217d58ce85"
 
-EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec \
+# Put something like
+#
+#   PACKAGECONFIG_append_pn-ghostscript = " x11"
+#
+# in local.conf to enable building with X11.  Be careful.  The order
+# of the overrides matters!
+#
+#PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG_class-native = ""
+
+PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR}, \
+                      --without-x, virtual/libx11 libxext libxt gtk+3\
+                      "
+
+EXTRA_OECONF = "--with-system-libtiff --without-jbig2dec \
                 --with-fontpath=${datadir}/fonts \
                 --without-libidn --with-cups-serverbin=${exec_prefix}/lib/cups \
                 --with-cups-datadir=${datadir}/cups \
-- 
2.7.4


