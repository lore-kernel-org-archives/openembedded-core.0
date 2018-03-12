Return-Path: <xiao.zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7EEC788B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 09:14:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2C9E932013107
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 02:14:09 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 12 Mar 2018 02:13:31 -0700
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>
Date: Mon, 12 Mar 2018 02:13:02 -0700
Message-ID: <20180312091303.121887-6-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180312091303.121887-1-xiao.zhang@windriver.com>
References: <20180312091303.121887-1-xiao.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] xtrans: fix file conflict when multilib enabled
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
X-List-Received-Date: Mon, 12 Mar 2018 09:14:08 -0000
Content-Type: text/plain

Script file xtrans.pc conflicts between 32 and 64 bit packages.
Use update-alternatives to add base_libdir as suffix to avoid it.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta/recipes-graphics/xorg-lib/xtrans_1.3.5.bb | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.3.5.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.3.5.bb
index d5b7f1a2c6..ef64f1fcfc 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.3.5.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.3.5.bb
@@ -16,7 +16,20 @@ PE = "1"
 
 RDEPENDS_${PN}-dev = ""
 
-inherit gettext
+inherit gettext  update-alternatives
+
+MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
+
+FILES_${PN}-dev += "${datadir}/pkgconfig/xtrans.pc-${MULTILIB_SUFFIX}"
+ALTERNATIVE_${PN}-dev = "xtrans.pc"
+ALTERNATIVE_LINK_NAME[xtrans.pc] = "${datadir}/pkgconfig/xtrans.pc"
+ALTERNATIVE_TARGET[xtrans.pc] = "${datadir}/pkgconfig/xtrans.pc-${MULTILIB_SUFFIX}"
+
+PACKAGE_PREPROCESS_FUNCS += "xtrans_alternative_rename"
+
+xtrans_alternative_rename() {
+        mv ${PKGD}${datadir}/pkgconfig/xtrans.pc ${PKGD}${datadir}/pkgconfig/xtrans.pc-${MULTILIB_SUFFIX}
+}
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.11.0


