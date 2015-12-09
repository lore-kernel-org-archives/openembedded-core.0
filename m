Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym02.jp.fujitsu.com (mgwym02.jp.fujitsu.com [211.128.242.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4D7A76FF76
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 07:56:55 +0000 (UTC)
Received: from yt-mxoi1.gw.nic.fujitsu.com (unknown [192.168.229.67]) by
	mgwym02.jp.fujitsu.com with smtp
	id 5f44_167c_80f87018_ea3c_41dc_8327_d74fb72c348e;
	Wed, 09 Dec 2015 16:56:51 +0900
Received: from g01jpfmpwyt02.exch.g01.fujitsu.local
	(g01jpfmpwyt02.exch.g01.fujitsu.local [10.128.193.56])
	by yt-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 92FCBAC019C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 16:56:51 +0900 (JST)
Received: from g01jpexchyt35.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	D35A6584236 for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 16:56:50 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt35.g01.fujitsu.local (10.128.193.50) with Microsoft SMTP
	Server id 14.3.266.1; Wed, 9 Dec 2015 16:56:50 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Dec 2015 16:57:54 +0900
Message-ID: <1449647874-13465-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH] sudo: upgrade to 1.8.15
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
X-List-Received-Date: Wed, 09 Dec 2015 07:56:56 -0000
Content-Type: text/plain

1. upgrade to 1.8.15
2. delete patch file due to the bug has been fixed in sudo 1.8.15
(http://bugzilla.sudo.ws/show_bug.cgi?id=708)

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 ...rrect-path-to-init.d-and-tmpfiles.d-files.patch | 31 ----------------------
 .../sudo/{sudo_1.8.14p3.bb => sudo_1.8.15.bb}      |  5 ++--
 2 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-extended/sudo/sudo/0001-Use-correct-path-to-init.d-and-tmpfiles.d-files.patch
 rename meta/recipes-extended/sudo/{sudo_1.8.14p3.bb => sudo_1.8.15.bb} (86%)

diff --git a/meta/recipes-extended/sudo/sudo/0001-Use-correct-path-to-init.d-and-tmpfiles.d-files.patch b/meta/recipes-extended/sudo/sudo/0001-Use-correct-path-to-init.d-and-tmpfiles.d-files.patch
deleted file mode 100644
index 2418689..0000000
--- a/meta/recipes-extended/sudo/sudo/0001-Use-correct-path-to-init.d-and-tmpfiles.d-files.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-The makefile uses top_srcdir to find files that were created by configure, when
-it should use top_builddir.
-
-Upstream-Status: Submitted (http://bugzilla.sudo.ws/show_bug.cgi?id=708)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
----
- src/Makefile.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/Makefile.in b/src/Makefile.in
-index f009e10..7acfb2d 100644
---- a/src/Makefile.in
-+++ b/src/Makefile.in
-@@ -165,11 +165,11 @@ install-dirs:
- 
- install-rc: install-dirs
- 	if [ -n "$(INIT_SCRIPT)" ]; then \
--	    $(INSTALL) $(INSTALL_OWNER) -m 0755 $(top_srcdir)/init.d/$(INIT_SCRIPT) $(DESTDIR)$(INIT_DIR)/sudo; \
-+	    $(INSTALL) $(INSTALL_OWNER) -m 0755 $(top_builddir)/init.d/$(INIT_SCRIPT) $(DESTDIR)$(INIT_DIR)/sudo; \
- 	    rm -f $(DESTDIR)$(RC_LINK); \
- 	    ln -s $(INIT_DIR)/sudo $(DESTDIR)$(RC_LINK); \
- 	elif test -n "$(tmpfiles_d)"; then \
--	    $(INSTALL) $(INSTALL_OWNER) -m 0644 $(top_srcdir)/init.d/sudo.conf $(DESTDIR)$(tmpfiles_d)/sudo.conf; \
-+	    $(INSTALL) $(INSTALL_OWNER) -m 0644 $(top_builddir)/init.d/sudo.conf $(DESTDIR)$(tmpfiles_d)/sudo.conf; \
- 	fi
- 
- install-binaries: install-dirs $(PROGS)
--- 
-2.1.4
-
diff --git a/meta/recipes-extended/sudo/sudo_1.8.14p3.bb b/meta/recipes-extended/sudo/sudo_1.8.15.bb
similarity index 86%
rename from meta/recipes-extended/sudo/sudo_1.8.14p3.bb
rename to meta/recipes-extended/sudo/sudo_1.8.15.bb
index 4db85e2..042043e 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.14p3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.15.bb
@@ -2,14 +2,13 @@ require sudo.inc
 
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
-           file://0001-Use-correct-path-to-init.d-and-tmpfiles.d-files.patch \
            file://0001-Include-sys-types.h-for-id_t-definition.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "93dbd1e47c136179ff1b01494c1c0e75"
-SRC_URI[sha256sum] = "a8a697cbb113859058944850d098464618254804cf97961dee926429f00a1237"
+SRC_URI[md5sum] = "7cf6b9b76d0478a572432bed481dd7b5"
+SRC_URI[sha256sum] = "4316381708324da8b6cb151f655c1a11855207c7c02244d8ffdea5104d7cc308"
 
 DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
1.8.4.2


