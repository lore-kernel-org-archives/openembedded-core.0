Return-Path: <xiao.zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B08857886A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 09:13:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2C9DfMH013042
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 02:13:41 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 12 Mar 2018 02:13:03 -0700
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>
Date: Mon, 12 Mar 2018 02:12:59 -0700
Message-ID: <20180312091303.121887-3-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180312091303.121887-1-xiao.zhang@windriver.com>
References: <20180312091303.121887-1-xiao.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] vala: fix file conflict when multilib enabled
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
X-List-Received-Date: Mon, 12 Mar 2018 09:13:40 -0000
Content-Type: text/plain

Config file vala-gen-introspect-${SHRT_VER} conflicts between 32 and
64 bit packages. Use update-alternatives to add base_libdir as suffix
to avoid it.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta/recipes-devtools/vala/vala.inc | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index b22faad780..5c958cdbf0 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -19,7 +19,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz"
-inherit autotools pkgconfig upstream-version-is-even
+inherit autotools pkgconfig upstream-version-is-even update-alternatives
+
+MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
+ALTERNATIVE_${PN} = "vala-gen-introspect"
+ALTERNATIVE_LINK_NAME[vala-gen-introspect] = "${bindir}/vala-gen-introspect-${SHRT_VER}"
+ALTERNATIVE_TARGET[vala-gen-introspect] = "${bindir}/vala-gen-introspect-${SHRT_VER}-${MULTILIB_SUFFIX}"
+
+PACKAGE_PREPROCESS_FUNCS += "alternative_rename"
+
+alternative_rename() {
+        mv ${PKGD}${bindir}/vala-gen-introspect-${SHRT_VER} \
+           ${PKGD}${bindir}/vala-gen-introspect-${SHRT_VER}-${MULTILIB_SUFFIX}
+}
+
 
 FILES_${PN} += "${datadir}/${BPN}-${SHRT_VER}/vapi ${libdir}/${BPN}-${SHRT_VER}/"
 FILES_${PN}-doc += "${datadir}/devhelp"
-- 
2.11.0


