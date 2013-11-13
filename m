Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 750556D95C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 06:23:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rAD6N6er001348
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 22:23:06 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Tue, 12 Nov 2013 22:23:05 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2013 14:23:05 +0800
Message-ID: <acadb0c433798e502bc605c568f5acc27e1a1774.1384323613.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1384323613.git.Qi.Chen@windriver.com>
References: <cover.1384323613.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 3/7] kmod: install libkmod into base_libdir
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
X-List-Received-Date: Wed, 13 Nov 2013 06:23:03 -0000
Content-Type: text/plain

From: Chen Qi <qi.chen@windriver.com>

Install libkmod into base_libdir because udevd requires it. The purpose
is to make system boot into single user mode even if /usr is missing.

This patch fixes the following QA issue about unsafe references in
binaries.

/lib/udevd requires libkmod.so.2 (=> /usr/lib/libkmod.so.2)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-kernel/kmod/kmod_git.bb |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index f90b9aa..77d4c70 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -12,9 +12,7 @@ RREPLACES_${PN} += "module-init-tools-insmod-static module-init-tools-depmod mod
 RCONFLICTS_libkmod2 += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
 
 # autotools set prefix to /usr, however we want them in /bin and /sbin
-bindir = "${base_bindir}"
-sbindir = "${base_sbindir}"
-# libdir = "${base_libdir}"
+EXTRA_OECONF += "--bindir=${base_bindir} --sbindir=${base_sbindir} --libdir=${base_libdir}"
 
 do_install_append () {
         install -dm755 ${D}${base_bindir}
@@ -33,6 +31,11 @@ do_install_append () {
         # install depmod.d file for search/ dir
         install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${base_libdir}/depmod.d/search.conf"
 
+        if [ "${libdir}" != "${base_libdir}" ]; then
+            # mv the .pc file to ${libdir}
+            install -d ${D}${libdir}
+            mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
+        fi
 }
 
 do_compile_prepend() {
-- 
1.7.9.5


