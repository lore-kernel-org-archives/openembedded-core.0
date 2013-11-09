Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA6676D784
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 05:28:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA95T1Kg015869
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Nov 2013 21:29:01 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 8 Nov 2013 21:29:01 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 9 Nov 2013 13:28:54 +0800
Message-ID: <fd4330bd341f1c59aeecbce0d0f85f498ff68ed7.1383974819.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383974819.git.Qi.Chen@windriver.com>
References: <cover.1383974819.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] kmod: install libkmod into base_libdir
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
X-List-Received-Date: Sat, 09 Nov 2013 05:28:59 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Install libkmod into base_libdir because udevd requires it. The purpose
is to make system boot into single user mode even if /usr is missing.

This patch fixes the following QA issue about unsafe references in
binaries.

/lib/udevd requires libkmod.so.2 (=> /usr/lib/libkmod.so.2)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-kernel/kmod/kmod_git.bb |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index f90b9aa..f9cb4da 100644
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
@@ -33,6 +31,9 @@ do_install_append () {
         # install depmod.d file for search/ dir
         install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${base_libdir}/depmod.d/search.conf"
 
+        # mv the .pc file to ${libdir}
+        install -d ${D}${libdir}
+        mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
 }
 
 do_compile_prepend() {
-- 
1.7.9.5


