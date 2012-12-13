Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TjBxg-0006ID-3h
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 17:48:44 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 301F5D22CD;
	Thu, 13 Dec 2012 17:34:10 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Dec 2012 17:33:46 +0100
Message-Id: <1355416426-11959-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH] eglibc: add 'name' to tarball to unbreak other fetches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2012 16:48:44 -0000

Without that I got (r23 due to PRINC):

NOTE: recipe eglibc-2.16-r23: task do_fetch: Failed
ERROR: Task 34 (/mnt/ci_build/workspace/openembedded-armv8-minimal/openembedded-core/meta/recipes-core/eglibc/eglibc_2.16.bb, do_fetch) failed with exit code '1'
ERROR: Checksum failure fetching http://people.linaro.org/~toolchain/openembedded/patches/eglibc/aarch64-0001-glibc-fsf-v1-eaf6f205.patch
ERROR: Function failed: Fetcher failure for URL: 'http://people.linaro.org/~toolchain/openembedded/patches/eglibc/aarch64-0001-glibc-fsf-v1-eaf6f205.patch'.  Checksum mismatch!
File: '/mnt/ci_build/workspace/downloads/aarch64-0001-glibc-fsf-v1-eaf6f205.patch' has md5 checksum 5e52bf8fd9ac390b665d86a57ab7dba7 when 88894fa6e10e58e85fbd8134b8e486a8 was expected
File: '/mnt/ci_build/workspace/downloads/aarch64-0001-glibc-fsf-v1-eaf6f205.patch' has sha256 checksum b7eea76e72675a6ed3066952a9e08389c99838d74a58b736d527c82c34e754eb when 460a45f422da6eb1fd909baab6a64b5ae4c8ba18ea05a1491ed1024c8b98eeaa was expected
If this change is expected (e.g. you have upgraded to a new version
without updating the checksums) then you can use these lines within the
recipe:
SRC_URI[md5sum] = "5e52bf8fd9ac390b665d86a57ab7dba7"
SRC_URI[sha256sum] = "b7eea76e72675a6ed3066952a9e08389c99838d74a58b736d527c82c34e754eb"
Otherwise you should retry the download and/or check with upstream to
determine if the file has become corrupted or otherwise unexpectedly
modified.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-core/eglibc/eglibc_2.16.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index aa9256c..22e572f 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 DEPENDS += "gperf-native kconfig-frontends-native"
 PR = "r17"
 
-SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr21224.tar.bz2 \
+SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr21224.tar.bz2;name=tarball \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://IO-acquire-lock-fix.patch \
            file://mips-rld-map-check.patch \
@@ -29,8 +29,8 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr21
            file://0001-R_ARM_TLS_DTPOFF32.patch \
           "
 
-SRC_URI[md5sum] = "88894fa6e10e58e85fbd8134b8e486a8"
-SRC_URI[sha256sum] = "460a45f422da6eb1fd909baab6a64b5ae4c8ba18ea05a1491ed1024c8b98eeaa"
+SRC_URI[tarball.md5sum] = "88894fa6e10e58e85fbd8134b8e486a8"
+SRC_URI[tarball.sha256sum] = "460a45f422da6eb1fd909baab6a64b5ae4c8ba18ea05a1491ed1024c8b98eeaa"
 
 LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-- 
1.8.0



