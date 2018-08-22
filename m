Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7F86A74FCB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 05:36:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7M5ax1g021293
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 22:36:59 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Tue, 21 Aug 2018 22:36:58 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Aug 2018 13:36:57 +0800
Message-ID: <1534916217-446958-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] u-boot: patch for CVE-2018-1000205
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
X-List-Received-Date: Wed, 22 Aug 2018 05:36:58 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../u-boot/files/CVE-2018-1000205-1.patch          |  59 +++++++++
 .../u-boot/files/CVE-2018-1000205-2.patch          | 143 +++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common_2018.07.inc  |   5 +-
 3 files changed, 206 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2018-1000205-1.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2018-1000205-2.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2018-1000205-1.patch b/meta/recipes-bsp/u-boot/files/CVE-2018-1000205-1.patch
new file mode 100644
index 0000000..fed3c3d
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2018-1000205-1.patch
@@ -0,0 +1,59 @@
+From 7346c1e192d63cd35f99c7e845e53c5d4d0bdc24 Mon Sep 17 00:00:00 2001
+From: Teddy Reed <teddy.reed@gmail.com>
+Date: Sat, 9 Jun 2018 11:45:20 -0400
+Subject: [PATCH] vboot: Do not use hashed-strings offset
+
+The hashed-strings signature property includes two uint32_t values.
+The first is unneeded as there should never be a start offset into the
+strings region. The second, the size, is needed because the added
+signature node appends to this region.
+
+See tools/image-host.c, where a static 0 value is used for the offset.
+
+Signed-off-by: Teddy Reed <teddy.reed@gmail.com>
+Reviewed-by: Simon Glass <sjg@chromium.org>
+
+Upstream-Status: Backport[http://git.denx.de/?p=u-boot.git;a=commit;
+                 h=7346c1e192d63cd35f99c7e845e53c5d4d0bdc24]
+
+CVE: CVE-2018-1000205
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ common/image-sig.c | 7 +++++--
+ tools/image-host.c | 1 +
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/common/image-sig.c b/common/image-sig.c
+index 8d2fd10..5a269d3 100644
+--- a/common/image-sig.c
++++ b/common/image-sig.c
+@@ -377,8 +377,11 @@ int fit_config_check_sig(const void *fit, int noffset, int required_keynode,
+ 	/* Add the strings */
+ 	strings = fdt_getprop(fit, noffset, "hashed-strings", NULL);
+ 	if (strings) {
+-		fdt_regions[count].offset = fdt_off_dt_strings(fit) +
+-				fdt32_to_cpu(strings[0]);
++		/*
++		 * The strings region offset must be a static 0x0.
++		 * This is set in tool/image-host.c
++		 */
++		fdt_regions[count].offset = fdt_off_dt_strings(fit);
+ 		fdt_regions[count].size = fdt32_to_cpu(strings[1]);
+ 		count++;
+ 	}
+diff --git a/tools/image-host.c b/tools/image-host.c
+index 8e43671..be2d59b 100644
+--- a/tools/image-host.c
++++ b/tools/image-host.c
+@@ -135,6 +135,7 @@ static int fit_image_write_sig(void *fit, int noffset, uint8_t *value,
+ 
+ 		ret = fdt_setprop(fit, noffset, "hashed-nodes",
+ 				   region_prop, region_proplen);
++		/* This is a legacy offset, it is unused, and must remain 0. */
+ 		strdata[0] = 0;
+ 		strdata[1] = cpu_to_fdt32(string_size);
+ 		if (!ret) {
+-- 
+2.7.4
+
diff --git a/meta/recipes-bsp/u-boot/files/CVE-2018-1000205-2.patch b/meta/recipes-bsp/u-boot/files/CVE-2018-1000205-2.patch
new file mode 100644
index 0000000..bb79af1
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2018-1000205-2.patch
@@ -0,0 +1,143 @@
+From 72239fc85f3eda078547956608c063ab965e90e9 Mon Sep 17 00:00:00 2001
+From: Teddy Reed <teddy.reed@gmail.com>
+Date: Sat, 9 Jun 2018 11:38:05 -0400
+Subject: [PATCH] vboot: Add FIT_SIGNATURE_MAX_SIZE protection
+
+This adds a new config value FIT_SIGNATURE_MAX_SIZE, which controls the
+max size of a FIT header's totalsize field. The field is checked before
+signature checks are applied to protect from reading past the intended
+FIT regions.
+
+This field is not part of the vboot signature so it should be sanity
+checked. If the field is corrupted then the structure or string region
+reads may have unintended behavior, such as reading from device memory.
+A default value of 256MB is set and intended to support most max storage
+sizes.
+
+Suggested-by: Simon Glass <sjg@chromium.org>
+Signed-off-by: Teddy Reed <teddy.reed@gmail.com>
+Reviewed-by: Simon Glass <sjg@chromium.org>
+
+Upstream-Status: Backport[http://git.denx.de/?p=u-boot.git;a=commit;
+                 h=72239fc85f3eda078547956608c063ab965e90e9]
+
+CVE: CVE-2018-1000205
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Kconfig                     | 10 ++++++++++
+ common/image-sig.c          |  5 +++++
+ test/py/tests/test_vboot.py | 33 +++++++++++++++++++++++++++++++++
+ tools/Makefile              |  1 +
+ 4 files changed, 49 insertions(+)
+
+diff --git a/Kconfig b/Kconfig
+index 5a82c95..c8b86cd 100644
+--- a/Kconfig
++++ b/Kconfig
+@@ -267,6 +267,16 @@ config FIT_SIGNATURE
+ 	  format support in this case, enable it using
+ 	  CONFIG_IMAGE_FORMAT_LEGACY.
+ 
++config FIT_SIGNATURE_MAX_SIZE
++	hex "Max size of signed FIT structures"
++	depends on FIT_SIGNATURE
++	default 0x10000000
++	help
++	  This option sets a max size in bytes for verified FIT uImages.
++	  A sane value of 256MB protects corrupted DTB structures from overlapping
++	  device memory. Assure this size does not extend past expected storage
++	  space.
++
+ config FIT_VERBOSE
+ 	bool "Show verbose messages when FIT images fail"
+ 	help
+diff --git a/common/image-sig.c b/common/image-sig.c
+index f65d883..8d2fd10 100644
+--- a/common/image-sig.c
++++ b/common/image-sig.c
+@@ -156,6 +156,11 @@ static int fit_image_setup_verify(struct image_sign_info *info,
+ {
+ 	char *algo_name;
+ 
++	if (fdt_totalsize(fit) > CONFIG_FIT_SIGNATURE_MAX_SIZE) {
++		*err_msgp = "Total size too large";
++		return 1;
++	}
++
+ 	if (fit_image_hash_get_algo(fit, noffset, &algo_name)) {
+ 		*err_msgp = "Can't get hash algo property";
+ 		return -1;
+diff --git a/test/py/tests/test_vboot.py b/test/py/tests/test_vboot.py
+index ee939f2..3d25ec3 100644
+--- a/test/py/tests/test_vboot.py
++++ b/test/py/tests/test_vboot.py
+@@ -26,6 +26,7 @@ Tests run with both SHA1 and SHA256 hashing.
+ 
+ import pytest
+ import sys
++import struct
+ import u_boot_utils as util
+ 
+ @pytest.mark.boardspec('sandbox')
+@@ -105,6 +106,26 @@ def test_vboot(u_boot_console):
+         util.run_and_log(cons, [mkimage, '-F', '-k', tmpdir, '-K', dtb,
+                                 '-r', fit])
+ 
++    def replace_fit_totalsize(size):
++        """Replace FIT header's totalsize with something greater.
++
++        The totalsize must be less than or equal to FIT_SIGNATURE_MAX_SIZE.
++        If the size is greater, the signature verification should return false.
++
++        Args:
++            size: The new totalsize of the header
++
++        Returns:
++            prev_size: The previous totalsize read from the header
++        """
++        total_size = 0
++        with open(fit, 'r+b') as handle:
++            handle.seek(4)
++            total_size = handle.read(4)
++            handle.seek(4)
++            handle.write(struct.pack(">I", size))
++        return struct.unpack(">I", total_size)[0]
++
+     def test_with_algo(sha_algo):
+         """Test verified boot with the given hash algorithm.
+ 
+@@ -146,6 +167,18 @@ def test_vboot(u_boot_console):
+         util.run_and_log(cons, [fit_check_sign, '-f', fit, '-k', tmpdir,
+                                 '-k', dtb])
+ 
++        # Replace header bytes
++        bcfg = u_boot_console.config.buildconfig
++        max_size = int(bcfg.get('config_fit_signature_max_size', 0x10000000), 0)
++        existing_size = replace_fit_totalsize(max_size + 1)
++        run_bootm(sha_algo, 'Signed config with bad hash', 'Bad Data Hash', False)
++        cons.log.action('%s: Check overflowed FIT header totalsize' % sha_algo)
++
++        # Replace with existing header bytes
++        replace_fit_totalsize(existing_size)
++        run_bootm(sha_algo, 'signed config', 'dev+', True)
++        cons.log.action('%s: Check default FIT header totalsize' % sha_algo)
++
+         # Increment the first byte of the signature, which should cause failure
+         sig = util.run_and_log(cons, 'fdtget -t bx %s %s value' %
+                                (fit, sig_node))
+diff --git a/tools/Makefile b/tools/Makefile
+index 5dd33ed..0c3341e 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -133,6 +133,7 @@ ifdef CONFIG_FIT_SIGNATURE
+ # This affects include/image.h, but including the board config file
+ # is tricky, so manually define this options here.
+ HOST_EXTRACFLAGS	+= -DCONFIG_FIT_SIGNATURE
++HOST_EXTRACFLAGS	+= -DCONFIG_FIT_SIGNATURE_MAX_SIZE=$(CONFIG_FIT_SIGNATURE_MAX_SIZE)
+ endif
+ 
+ ifdef CONFIG_SYS_U_BOOT_OFFS
+-- 
+2.7.4
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2018.07.inc b/meta/recipes-bsp/u-boot/u-boot-common_2018.07.inc
index d945253..22b44dc 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2018.07.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2018.07.inc
@@ -10,6 +10,9 @@ PE = "1"
 # repo during parse
 SRCREV = "8c5d4fd0ec222701598a27b26ab7265d4cee45a3"
 
-SRC_URI = "git://git.denx.de/u-boot.git"
+SRC_URI = "git://git.denx.de/u-boot.git \
+           file://CVE-2018-1000205-1.patch \
+           file://CVE-2018-1000205-2.patch \
+"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


