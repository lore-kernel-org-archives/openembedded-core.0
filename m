Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TjC2t-0006UM-B8
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 17:54:07 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so1127402bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2012 08:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=AUk/76NI+zrbkLv5vR0IuFUOMJx4IEIhr6cQy56zzXU=;
	b=TExiuKdp14aVOj5NjQc2g51Vv/KO+861yLu69cMnesuhvN6fEpRafLhx9cWsa0/X+l
	+lCQRSDBeZRIrPHSdQXK2YB4onEzWBxMUO4o7UrBHa39sGWvhsjjO+Ab2t8mKdKIozHI
	0lwpf5YykYfgR0cN8m7y7jDBkhE/OF1R4VPF/hFlzAM8vcC4FJPGJPb3JTlnlrpH/EQM
	z/LRGT/8SjycGmQYertiB4y8uyr1uD3p5Ki6NetTS/MM8r97P+tZxobn0BFdVnRX4z77
	vrSTAG6CElDvgtrqbWpq32ZHUGTUejrWEhChob0Xf9NFfeXEs+PL0tfzAlbwRE0rEuks
	Y9AA==
Received: by 10.204.148.145 with SMTP id p17mr1313044bkv.136.1355416768271;
	Thu, 13 Dec 2012 08:39:28 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id m20sm1967296bkw.4.2012.12.13.08.39.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 08:39:26 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TjBoh-0007bt-Qj; Thu, 13 Dec 2012 18:39:23 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Dec 2012 18:39:22 +0200
Message-Id: <1355416762-28857-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] eglibc: fix checksums of fetched patches
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
X-List-Received-Date: Thu, 13 Dec 2012 16:54:07 -0000

As downloaded files are not named, tarball checksum is used also
for downloaded patches, causing checksum check for them to fail.
Added correct checksums of their own for all downloaded files.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-core/eglibc/eglibc_2.16.bb |   21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 973be65..c35d94c 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 DEPENDS += "gperf-native kconfig-frontends-native"
 PR = "r19"
 
-SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr21224.tar.bz2 \
+SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr21224.tar.bz2;name=tarball \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
            file://IO-acquire-lock-fix.patch \
            file://mips-rld-map-check.patch \
@@ -27,15 +27,24 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr21
            file://0001-Add-name_to_handle_at-open_by_handle-etc.-to-PowerPC.patch \
            file://fsl-ppc-no-fsqrt.patch \
            file://0001-R_ARM_TLS_DTPOFF32.patch \
-           http://people.linaro.org/~toolchain/openembedded/patches/eglibc/aarch64-0001-glibc-fsf-v1-eaf6f205.patch \
-           http://people.linaro.org/~toolchain/openembedded/patches/eglibc/aarch64-0002-Synchronize-with-linux-elf.h.patch \
-           http://people.linaro.org/~toolchain/openembedded/patches/eglibc/aarch64-0003-Adding-AArch64-support-to-elf-elf.h.patch \
+           http://people.linaro.org/~toolchain/openembedded/patches/eglibc/aarch64-0001-glibc-fsf-v1-eaf6f205.patch;name=patch1 \
+           http://people.linaro.org/~toolchain/openembedded/patches/eglibc/aarch64-0002-Synchronize-with-linux-elf.h.patch;name=patch2 \
+           http://people.linaro.org/~toolchain/openembedded/patches/eglibc/aarch64-0003-Adding-AArch64-support-to-elf-elf.h.patch;name=patch3 \
            file://tzselect-sh.patch \
            file://tzselect-awk.patch \
           "
 
-SRC_URI[md5sum] = "88894fa6e10e58e85fbd8134b8e486a8"
-SRC_URI[sha256sum] = "460a45f422da6eb1fd909baab6a64b5ae4c8ba18ea05a1491ed1024c8b98eeaa"
+SRC_URI[tarball.md5sum] = "88894fa6e10e58e85fbd8134b8e486a8"
+SRC_URI[tarball.sha256sum] = "460a45f422da6eb1fd909baab6a64b5ae4c8ba18ea05a1491ed1024c8b98eeaa"
+
+SRC_URI[patch1.md5sum] = "5e52bf8fd9ac390b665d86a57ab7dba7"
+SRC_URI[patch1.sha256sum] = "b7eea76e72675a6ed3066952a9e08389c99838d74a58b736d527c82c34e754eb"
+
+SRC_URI[patch2.md5sum] = "e1ae1c416c01e2c991c7ca7e169c577b"
+SRC_URI[patch2.sha256sum] = "6093bb80a187081090cb14412f466c08fcaf39ccd62b751e3d871a8c5af03b0d"
+
+SRC_URI[patch3.md5sum] = "6d1d84e14f7abfe9ee3237d0ec6fe9ca"
+SRC_URI[patch3.sha256sum] = "03e79ace9eade0d57a3684cb0dc6b415ea52e4f152bfb380684b08445f125410"
 
 LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-- 
1.7.10.4



