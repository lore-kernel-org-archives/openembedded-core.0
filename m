Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3C75B7135C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 06:35:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s896ZchR005092
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Sep 2014 23:35:38 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 23:35:38 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Sep 2014 14:35:51 +0800
Message-ID: <5f798bfff43c475d770b81a6ba653b0d9f8d98c0.1410244514.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410244514.git.Qi.Chen@windriver.com>
References: <cover.1410244514.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] kmod: install libkmod into base_libdir
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
X-List-Received-Date: Tue, 09 Sep 2014 06:35:37 -0000
Content-Type: text/plain

From: Chen Qi <qi.chen@windriver.com>

[CQID: WIND00444742]

Install libkmod into base_libdir because udevd requires it. The purpose
is to make system boot into single user mode even if /usr is missing.

This patch fixes the following QA issue about unsafe references in
binaries.

/lib/udevd requires libkmod.so.2 (=> /usr/lib/libkmod.so.2)

(LOCAL REV: NOT UPSTREAM) -- Sent to oe-core on 20131113

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
---
 meta/recipes-kernel/kmod/kmod_git.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index d4c21a4..090f5fb 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -13,9 +13,7 @@ RREPLACES_${PN} += "module-init-tools-insmod-static module-init-tools-depmod mod
 RCONFLICTS_libkmod2 += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
 
 # autotools set prefix to /usr, however we want them in /bin and /sbin
-bindir = "${base_bindir}"
-sbindir = "${base_sbindir}"
-# libdir = "${base_libdir}"
+EXTRA_OECONF += "--bindir=${base_bindir} --sbindir=${base_sbindir} --libdir=${base_libdir}"
 
 do_install_append () {
         install -dm755 ${D}${base_bindir}
@@ -34,6 +32,11 @@ do_install_append () {
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
1.9.1


