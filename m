Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4762A78865
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 12:25:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jan 2018 04:25:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,348,1511856000"; d="scan'208";a="23487102"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 12 Jan 2018 04:25:18 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 30EBA58057E;
	Fri, 12 Jan 2018 04:25:16 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jan 2018 14:26:37 +0200
Message-Id: <1515759997-18192-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1515759997-18192-1-git-send-email-maxin.john@intel.com>
References: <1515759997-18192-1-git-send-email-maxin.john@intel.com>
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
X-List-Received-Date: Fri, 12 Jan 2018 12:25:16 -0000

From: Maxin John <maxin.john@intel.com>

Update the SRC_URI to point to kernel.org location where
i2c-tools is hosted these days.

Remove Modules.mk since it was used for deprecated binaries
(eepromer, eeprom)

Backported the following patches to fix races during build:
        a) 0001-tools-Module.mk-Add-missing-dependencies.patch
        b) 0001-i2c-tools-eeprog-Module.mk-Add-missing-dependency.patch
        c) 0001-lib-Module.mk-Add-missing-dependencies.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...s-eeprog-Module.mk-Add-missing-dependency.patch | 32 ++++++++++
 ...01-lib-Module.mk-Add-missing-dependencies.patch | 37 +++++++++++
 ...-tools-Module.mk-Add-missing-dependencies.patch | 69 +++++++++++++++++++++
 meta/recipes-devtools/i2c-tools/files/Module.mk    | 72 ----------------------
 .../{i2c-tools_3.1.2.bb => i2c-tools_4.0.bb}       | 21 ++++---
 5 files changed, 150 insertions(+), 81 deletions(-)
 create mode 100644 meta/recipes-devtools/i2c-tools/files/0001-i2c-tools-eeprog-Module.mk-Add-missing-dependency.patch
 create mode 100644 meta/recipes-devtools/i2c-tools/files/0001-lib-Module.mk-Add-missing-dependencies.patch
 create mode 100644 meta/recipes-devtools/i2c-tools/files/0001-tools-Module.mk-Add-missing-dependencies.patch
 delete mode 100644 meta/recipes-devtools/i2c-tools/files/Module.mk
 rename meta/recipes-devtools/i2c-tools/{i2c-tools_3.1.2.bb => i2c-tools_4.0.bb} (52%)

diff --git a/meta/recipes-devtools/i2c-tools/files/0001-i2c-tools-eeprog-Module.mk-Add-missing-dependency.patch b/meta/recipes-devtools/i2c-tools/files/0001-i2c-tools-eeprog-Module.mk-Add-missing-dependency.patch
new file mode 100644
index 0000000..5b1a538
--- /dev/null
+++ b/meta/recipes-devtools/i2c-tools/files/0001-i2c-tools-eeprog-Module.mk-Add-missing-dependency.patch
@@ -0,0 +1,32 @@
+From 01674fefe3bd24fd93412fbb3eb4e85fe70c80aa Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Mon, 18 Dec 2017 16:01:39 +0200
+Subject: [PATCH] i2c-tools: eeprog/Module.mk: Add missing dependency
+
+Absence of this dependency caused parallel build to run into a race
+and break.
+
+Upstream-Status: Accepted
+https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/commit/?id=f87c97317012a3b96b67237925893b8ffd5f4f50
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ eeprog/Module.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/eeprog/Module.mk b/eeprog/Module.mk
+index 9d36869..d215855 100644
+--- a/eeprog/Module.mk
++++ b/eeprog/Module.mk
+@@ -20,7 +20,7 @@ EEPROG_TARGETS	:= eeprog
+ # Programs
+ #
+ 
+-$(EEPROG_DIR)/eeprog: $(EEPROG_DIR)/eeprog.o $(EEPROG_DIR)/24cXX.o
++$(EEPROG_DIR)/eeprog: $(EEPROG_DIR)/eeprog.o $(EEPROG_DIR)/24cXX.o $(LIB_DEPS)
+ 	$(CC) $(LDFLAGS) -o $@ $^ $(EEPROG_LDFLAGS)
+ 
+ #
+-- 
+2.4.0
+
diff --git a/meta/recipes-devtools/i2c-tools/files/0001-lib-Module.mk-Add-missing-dependencies.patch b/meta/recipes-devtools/i2c-tools/files/0001-lib-Module.mk-Add-missing-dependencies.patch
new file mode 100644
index 0000000..426b433
--- /dev/null
+++ b/meta/recipes-devtools/i2c-tools/files/0001-lib-Module.mk-Add-missing-dependencies.patch
@@ -0,0 +1,37 @@
+From a6a59693066fd8da81f7107479df3e32a129247d Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Wed, 6 Dec 2017 09:55:04 +0100
+Subject: [PATCH] lib/Module.mk: Add missing dependencies
+
+The lib symlinks lacked a dependency to the actual library file, so
+parallel builds could run into a race and break.
+
+Upstream-Status: Backport
+
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ lib/Module.mk | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/Module.mk b/lib/Module.mk
+index 432a051..fd2c8c4 100644
+--- a/lib/Module.mk
++++ b/lib/Module.mk
+@@ -42,11 +42,11 @@ endif
+ $(LIB_DIR)/$(LIB_SHLIBNAME): $(LIB_DIR)/smbus.o
+ 	$(CC) -shared $(LDFLAGS) -Wl,--version-script=$(LIB_DIR)/libi2c.map -Wl,-soname,$(LIB_SHSONAME) -o $@ $^ -lc
+ 
+-$(LIB_DIR)/$(LIB_SHSONAME):
++$(LIB_DIR)/$(LIB_SHSONAME): $(LIB_DIR)/$(LIB_SHLIBNAME)
+ 	$(RM) $@
+ 	$(LN) $(LIB_SHLIBNAME) $@
+ 
+-$(LIB_DIR)/$(LIB_SHBASENAME):
++$(LIB_DIR)/$(LIB_SHBASENAME): $(LIB_DIR)/$(LIB_SHLIBNAME)
+ 	$(RM) $@
+ 	$(LN) $(LIB_SHLIBNAME) $@
+ 
+-- 
+2.4.0
+
diff --git a/meta/recipes-devtools/i2c-tools/files/0001-tools-Module.mk-Add-missing-dependencies.patch b/meta/recipes-devtools/i2c-tools/files/0001-tools-Module.mk-Add-missing-dependencies.patch
new file mode 100644
index 0000000..e47c02a
--- /dev/null
+++ b/meta/recipes-devtools/i2c-tools/files/0001-tools-Module.mk-Add-missing-dependencies.patch
@@ -0,0 +1,69 @@
+From 08b0d67ba7eceb862cb17f52eb1911e9579726ea Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Thu, 14 Dec 2017 08:52:26 +0100
+Subject: [PATCH] tools/Module.mk: Add missing dependencies
+
+Better build the library before building the tools which link against
+it, otherwise parallel builds could run into a race and break.
+
+Upstream-Status: Backport
+
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
+Acked-by: Angelo Compagnucci <angelo@amarulasolutions.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ lib/Module.mk   |  7 +++++++
+ tools/Module.mk | 10 +++++-----
+ 2 files changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/lib/Module.mk b/lib/Module.mk
+index 8a58f5b..67afe91 100644
+--- a/lib/Module.mk
++++ b/lib/Module.mk
+@@ -37,6 +37,13 @@ ifeq ($(BUILD_STATIC_LIB),1)
+ LIB_TARGETS	+= $(LIB_STLIBNAME)
+ endif
+ 
++# Library file to link against (static or dynamic)
++ifeq ($(USE_STATIC_LIB),1)
++LIB_DEPS	:= $(LIB_DIR)/$(LIB_STLIBNAME)
++else
++LIB_DEPS	:= $(LIB_DIR)/$(LIB_SHBASENAME)
++endif
++
+ #
+ # Libraries
+ #
+diff --git a/tools/Module.mk b/tools/Module.mk
+index 6421a23..609de7a 100644
+--- a/tools/Module.mk
++++ b/tools/Module.mk
+@@ -24,19 +24,19 @@ TOOLS_TARGETS	:= i2cdetect i2cdump i2cset i2cget i2ctransfer
+ # Programs
+ #
+ 
+-$(TOOLS_DIR)/i2cdetect: $(TOOLS_DIR)/i2cdetect.o $(TOOLS_DIR)/i2cbusses.o
++$(TOOLS_DIR)/i2cdetect: $(TOOLS_DIR)/i2cdetect.o $(TOOLS_DIR)/i2cbusses.o $(LIB_DEPS)
+ 	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
+ 
+-$(TOOLS_DIR)/i2cdump: $(TOOLS_DIR)/i2cdump.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o
++$(TOOLS_DIR)/i2cdump: $(TOOLS_DIR)/i2cdump.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o $(LIB_DEPS)
+ 	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
+ 
+-$(TOOLS_DIR)/i2cset: $(TOOLS_DIR)/i2cset.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o
++$(TOOLS_DIR)/i2cset: $(TOOLS_DIR)/i2cset.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o $(LIB_DEPS)
+ 	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
+ 
+-$(TOOLS_DIR)/i2cget: $(TOOLS_DIR)/i2cget.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o
++$(TOOLS_DIR)/i2cget: $(TOOLS_DIR)/i2cget.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o $(LIB_DEPS)
+ 	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
+ 
+-$(TOOLS_DIR)/i2ctransfer: $(TOOLS_DIR)/i2ctransfer.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o
++$(TOOLS_DIR)/i2ctransfer: $(TOOLS_DIR)/i2ctransfer.o $(TOOLS_DIR)/i2cbusses.o $(TOOLS_DIR)/util.o $(LIB_DEPS)
+ 	$(CC) $(LDFLAGS) -o $@ $^ $(TOOLS_LDFLAGS)
+ 
+ #
+-- 
+2.4.0
+
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
similarity index 52%
rename from meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb
rename to meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb
index 45d3d6d..e936fd7 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb
@@ -4,20 +4,20 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.bz2 \
-           file://Module.mk \
+SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/${BP}.tar.gz \
+           file://0001-lib-Module.mk-Add-missing-dependencies.patch \
+           file://0001-tools-Module.mk-Add-missing-dependencies.patch \
+           file://0001-i2c-tools-eeprog-Module.mk-Add-missing-dependency.patch \
 "
-UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/i/i2c-tools/"
-UPSTREAM_CHECK_REGEX = "i2c-tools_(?P<pver>.+)\.orig"
-SRC_URI[md5sum] = "7104a1043d11a5e2c7b131614eb1b962"
-SRC_URI[sha256sum] = "db5e69f2e2a6e3aa2ecdfe6a5f490b149c504468770f58921c8c5b8a7860a441"
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
@@ -33,4 +33,7 @@ FILES_${PN}-misc = "${sbindir}/i2c-stub-from-dump \
                         ${bindir}/decode-dimms \
                         ${bindir}/decode-vaio \
                        "
-RDEPENDS_${PN}-misc = "${PN} perl"
+RDEPENDS_${PN}-misc = "${PN} perl perl-module-posix \
+                       perl-module-constant perl-module-file-basename \
+                       perl-module-fcntl perl-module-strict perl-module-vars \
+                      "
-- 
2.4.0


