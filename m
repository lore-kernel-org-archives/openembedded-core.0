Return-Path: <jason.wessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E07DA6C4D8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 02:16:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5U2FwwS019865
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 19:16:09 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Sat, 29 Jun 2019 19:15:48 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Jun 2019 19:15:48 -0700
Message-ID: <20190630021548.60577-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v2] glibc: Fix multilibs + usrmerge builds
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
X-List-Received-Date: Sun, 30 Jun 2019 02:16:23 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The build of glibc fails when you have multilibs enabled + the distro
feature usrmerge.  Here is an example configuration:

===
MACHINE = "qemux86-64"
VIRTUAL-RUNTIME_init_manager = "systemd"
DISTRO_FEATURES_append = " systemd "
DISTRO_FEATURES_append += " usrmerge"

require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
===

This will fail with the following error:

NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: glibc-2.28-r0 do_poststash_install_cleanup: Function failed: do_poststash_install_cleanup (log file is located at /poky/build/tmp/work/core2-64-poky-linux/glibc/2.28-r0/temp/log.do_poststash_install_cleanup.107893)
ERROR: Logfile of failure stored in: /poky/build/tmp/work/core2-64-poky-linux/glibc/2.28-r0/temp/log.do_poststash_install_cleanup.107893

The fix is to not perform the rmdir check when using the multilib + usr/merge, namely:

if [ "${libdir}" != "${exec_prefix}/lib" ] && [ "${root_prefix}/lib" != "${exec_prefix}/lib" ]; then

This will evaluate as follows (collecting the output from bitbake -e glibc)

* no multilibs no usrmerge
        if [ "/usr/lib" != "/usr/lib" ] && [ "/lib" != "/usr/lib" ]; then
* no multilibs yes usrmerge
        if [ "/usr/lib" != "/usr/lib" ] && [ "/usr/lib" != "/usr/lib" ]; then
* yes multilibs no usrmerge
        if [ "/usr/lib64" != "/usr/lib" ] && [ "/lib" != "/usr/lib" ]; then
* yes multilibs yes user merge
        if [ "/usr/lib64" != "/usr/lib" ] && [ "/usr/lib" != "/usr/lib" ]; then

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index b7c64a0b2e..a1d79b3075 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -214,7 +214,7 @@ do_poststash_install_cleanup () {
 	rm -rf ${D}${libdir}/gconv
 	rm -rf ${D}/${localedir}
 	rm -rf ${D}${datadir}/locale
-	if [ "${libdir}" != "${exec_prefix}/lib" ]; then
+	if [ "${libdir}" != "${exec_prefix}/lib" ] && [ "${root_prefix}/lib" != "${exec_prefix}/lib" ]; then
 	    if [ -d "${D}${exec_prefix}/lib" ]; then
 		if [ -z "${ARCH_DYNAMIC_LOADER}" -o \
 		     ! -e "${D}${exec_prefix}/lib/${ARCH_DYNAMIC_LOADER}" ]; then
-- 
2.21.0


