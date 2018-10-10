Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 18C7F79AD4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 15:45:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9AFjYtd013028
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Oct 2018 08:45:34 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 10 Oct 2018 08:45:33 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Oct 2018 23:03:01 +0800
Message-ID: <8f9f9d7165fe23703f67df7e4e421ad912749cbd.1539182705.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1539182705.git.kai.kang@windriver.com>
References: <cover.1539182705.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] vala: update vapigen-wrapper
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
X-List-Received-Date: Wed, 10 Oct 2018 15:45:35 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The .gir files from gobject-introspection are configured to install to
${libdir}/gir-1.0 when multilib is enabled. Update vapigen-wrapper accordingly.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/vala/vala.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index b22faad780..f680640ca6 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -24,12 +24,15 @@ inherit autotools pkgconfig upstream-version-is-even
 FILES_${PN} += "${datadir}/${BPN}-${SHRT_VER}/vapi ${libdir}/${BPN}-${SHRT_VER}/"
 FILES_${PN}-doc += "${datadir}/devhelp"
 
+# .gir files from gobject-introspection are installed to ${libdir} when multilib is enabled
+GIRDIR_OPT = "${@'--girdir=${STAGING_LIBDIR}/gir-1.0' if d.getVar('MULTILIBS') else ''}"
+
 do_configure_prepend_class-target() {
         # Write out a vapigen wrapper that will be provided by pkg-config file installed in target sysroot
         # The wrapper will call a native vapigen
         cat > ${B}/vapigen-wrapper << EOF
 #!/bin/sh
-vapigen-${SHRT_VER} "\$@"
+vapigen-${SHRT_VER} ${GIRDIR_OPT} "\$@"
 EOF
         chmod +x ${B}/vapigen-wrapper
 }
@@ -55,3 +58,5 @@ vapigen_sysroot_preprocess() {
            -e "s|vapigen=.*|vapigen=${bindir}/vapigen-wrapper|" \
            ${SYSROOT_DESTDIR}${libdir}/pkgconfig/vapigen-${SHRT_VER}.pc
 }
+
+SSTATE_SCAN_FILES += "vapigen-wrapper"
-- 
2.18.0


