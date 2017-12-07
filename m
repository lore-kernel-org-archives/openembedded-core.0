Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B0CF4784EB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 13:22:08 +0000 (UTC)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Dec 2017 05:22:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,373,1508828400"; 
   d="scan'208";a="872095"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga008.jf.intel.com with ESMTP; 07 Dec 2017 05:22:09 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id D73EF5803B6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 05:22:08 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Dec 2017 15:22:17 +0200
Message-Id: <1512652937-15773-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] i2c-tools: upgrade to 4.0
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
X-List-Received-Date: Thu, 07 Dec 2017 13:22:08 -0000

Update the SRC_URI to point to kernel.org location where
i2c-tools is hosted these days.

Remove Modules.mk since it was used for deprecated binaries
(eepromer, eeprom)

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/i2c-tools/files/Module.mk    | 72 ----------------------
 .../{i2c-tools_3.1.2.bb => i2c-tools_4.0.bb}       | 14 ++---
 2 files changed, 5 insertions(+), 81 deletions(-)
 delete mode 100644 meta/recipes-devtools/i2c-tools/files/Module.mk
 rename meta/recipes-devtools/i2c-tools/{i2c-tools_3.1.2.bb => i2c-tools_4.0.bb} (64%)

diff --git a/meta/recipes-devtools/i2c-tools/files/Module.mk b/meta/recipes-devtools/i2c-tools/files/Module.mk
deleted file mode 100644
index fcaf72f..0000000
--- a/meta/recipes-devtools/i2c-tools/files/Module.mk
+++ /dev/null
@@ -1,72 +0,0 @@
-# EEPROMER
-#
-# Licensed under the GNU General Public License.
-
-EEPROMER_DIR	:= eepromer
-
-EEPROMER_CFLAGS	:= -Wstrict-prototypes -Wshadow -Wpointer-arith -Wcast-qual \
-		   -Wcast-align -Wwrite-strings -Wnested-externs -Winline \
-		   -W -Wundef -Wmissing-prototypes -Iinclude
-
-EEPROMER_TARGETS	:= eepromer eeprom eeprog
-
-#
-# Programs
-#
-
-$(EEPROMER_DIR)/eepromer: $(EEPROMER_DIR)/eepromer.o
-	$(CC) $(LDFLAGS) -o $@ $^
-
-$(EEPROMER_DIR)/eeprom: $(EEPROMER_DIR)/eeprom.o
-	$(CC) $(LDFLAGS) -o $@ $^
-
-$(EEPROMER_DIR)/eeprog: $(EEPROMER_DIR)/eeprog.o $(EEPROMER_DIR)/24cXX.o 
-	$(CC) $(LDFLAGS) -o $@ $^
-
-#
-# Objects
-#
-
-$(EEPROMER_DIR)/eepromer.o: $(EEPROMER_DIR)/eepromer.c
-	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@
-
-$(EEPROMER_DIR)/eeprom.o: $(EEPROMER_DIR)/eeprom.c
-	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@
-
-$(EEPROMER_DIR)/eeprog.o: $(EEPROMER_DIR)/eeprog.c
-	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@
-
-$(EEPROMER_DIR)/24cXX.o: $(EEPROMER_DIR)/24cXX.c
-	$(CC) $(CFLAGS) $(EEPROMER_CFLAGS) -c $< -o $@
-
-#
-# Commands
-#
-
-all-eepromer: $(addprefix $(EEPROMER_DIR)/,$(EEPROMER_TARGETS))
-
-strip-eepromer: $(addprefix $(EEPROMER_DIR)/,$(EEPROMER_TARGETS))
-	strip $(addprefix $(EEPROMER_DIR)/,$(EEPROMER_TARGETS))
-
-clean-eepromer:
-	$(RM) $(addprefix $(EEPROMER_DIR)/,*.o $(EEPROMER_TARGETS))
-
-install-eepromer: $(addprefix $(EEPROMER_DIR)/,$(EEPROMER_TARGETS))
-	$(INSTALL_DIR) $(DESTDIR)$(sbindir) $(DESTDIR)$(man8dir)
-	for program in $(EEPROMER_TARGETS) ; do \
-	$(INSTALL_PROGRAM) $(EEPROMER_DIR)/$$program $(DESTDIR)$(sbindir) ; done
-
-uninstall-eepromer:
-	for program in $(EEPROMER_TARGETS) ; do \
-	$(RM) $(DESTDIR)$(sbindir)/$$program ; \
-	$(RM) $(DESTDIR)$(man8dir)/$$program.8 ; done
-
-all: all-eepromer
-
-strip: strip-eepromer
-
-clean: clean-eepromer
-
-install: install-eepromer
-
-uninstall: uninstall-eepromer
diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb
similarity index 64%
rename from meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb
rename to meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb
index 45d3d6d..12d718b 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb
@@ -4,20 +4,16 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.bz2 \
-           file://Module.mk \
-"
-UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/i/i2c-tools/"
-UPSTREAM_CHECK_REGEX = "i2c-tools_(?P<pver>.+)\.orig"
-SRC_URI[md5sum] = "7104a1043d11a5e2c7b131614eb1b962"
-SRC_URI[sha256sum] = "db5e69f2e2a6e3aa2ecdfe6a5f490b149c504468770f58921c8c5b8a7860a441"
+SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "d92a288d70f306d3895e3a7e9c14c9aa"
+SRC_URI[sha256sum] = "5b60daf6f011de0acb61de57dba62f2054bb39f19961d67e0c91610f071ca403"
 
 inherit autotools-brokensep
 
 do_compile_prepend() {
-    cp ${WORKDIR}/Module.mk ${S}/eepromer/
     sed -i 's#/usr/local#/usr#' ${S}/Makefile
-    echo "include eepromer/Module.mk" >> ${S}/Makefile
+    echo "include eeprog/Module.mk" >> ${S}/Makefile
 }
 
 do_install_append() {
-- 
2.4.0


