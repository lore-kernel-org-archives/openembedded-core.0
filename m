Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 575DC6C4DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2018 09:55:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBC9toBx006119
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2018 01:55:51 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 12 Dec 2018 01:55:50 -0800
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Dec 2018 04:56:00 -0500
Message-ID: <1544608560-107439-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] kern-tools: modify grep pattern for tools/kconf_check
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
X-List-Received-Date: Wed, 12 Dec 2018 09:55:51 -0000
Content-Type: text/plain

The cmd line, <grep '^[  ]*\(menu\)*config '>, can't
match all expect config options.

This is because that it is not always space after 'config'
in kernel-source/*/.../Kconfig.
e.g. "config  IP_VS_IPV6" in net/netfilter/ipvs/Kconfig
	    ^^
	These are not spaces.

So we should change the cmd to grep '^[  ]*\(menu\)*config\s'.

License-Update: <Since the S is changed from WORKDIR to WORKDIR/git for
putting the patches to git/, the path of license should be changed too.>

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 ...0001-tool-kconf_check-modify-grep-pattern.patch | 37 ++++++++++++++++++++++
 .../kern-tools/kern-tools-native_git.bb            | 13 +++++---
 2 files changed, 46 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-kernel/kern-tools/files/0001-tool-kconf_check-modify-grep-pattern.patch

diff --git a/meta/recipes-kernel/kern-tools/files/0001-tool-kconf_check-modify-grep-pattern.patch b/meta/recipes-kernel/kern-tools/files/0001-tool-kconf_check-modify-grep-pattern.patch
new file mode 100644
index 0000000..7f9c5a2
--- /dev/null
+++ b/meta/recipes-kernel/kern-tools/files/0001-tool-kconf_check-modify-grep-pattern.patch
@@ -0,0 +1,37 @@
+From 080a0662e235bb359ef06f6ba922f56a6040078f Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Tue, 11 Dec 2018 04:54:59 -0500
+Subject: [PATCH] tool/kconf_check: modify grep pattern
+
+The cmd line, <grep '^[  ]*\(menu\)*config '>, can't
+match all expect config options.
+
+This is because that it is not always space after 'config'
+in kernel-source/*/.../Kconfig.
+e.g. "config  IP_VS_IPV6" in net/netfilter/ipvs/Kconfig
+
+So we should change the cmd to grep '^[  ]*\(menu\)*config\s'.
+
+Upstream-Status: Submitted [https://lists.yoctoproject.org/pipermail/yocto/2018-December/043564.html]
+
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+---
+ tools/kconf_check | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/kconf_check b/tools/kconf_check
+index aa86180..20b49cd 100755
+--- a/tools/kconf_check
++++ b/tools/kconf_check
+@@ -241,7 +241,7 @@ find ${kernel_source} \
+ # known list of all Kconfig* files.  Again, must filter dups.
+ rm -f ${LOGDIR}/all.cfg
+ for i in `cat ${LOGDIR}/all.kcf` ; do
+-    cat ${kernel_source}/$i | grep '^[ 	]*\(menu\)*config ' | \
++    cat ${kernel_source}/$i | grep '^[ 	]*\(menu\)*config\s' | \
+ 	awk '{print "CONFIG_"$2}' >> ${LOGDIR}/all.cfg
+ done
+ mv -f ${LOGDIR}/all.cfg ${LOGDIR}/all.cfg~
+-- 
+2.8.1
+
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index b353c21..682c726 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Tools for managing Yocto Project style branched kernels"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1bda400e2828845ba0d06c"
+LIC_FILES_CHKSUM = "file://tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1bda400e2828845ba0d06c"
 
 DEPENDS = "git-native"
 
@@ -10,8 +10,11 @@ PV = "0.2+git${SRCPV}"
 
 inherit native
 
-SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git"
-S = "${WORKDIR}"
+SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git \
+           file://0001-tool-kconf_check-modify-grep-pattern.patch \
+"
+
+S = "${WORKDIR}/git"
 UPSTREAM_CHECK_COMMITS = "1"
 
 do_compile() { 
@@ -19,6 +22,8 @@ do_compile() {
 }
 
 do_install() {
-	cd ${S}/git
+	cd ${S}
 	make DESTDIR=${D}${bindir} install
 }
+
+FILESEXTRAPATH = "${THISDIR}/files"
-- 
2.8.1


