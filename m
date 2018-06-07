Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B6EC271B99
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 09:02:03 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w57922ZU008571;
	Thu, 7 Jun 2018 02:02:02 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Thu, 07 Jun 2018 02:02:02 -0700
From: Kai Kang <kai.kang@windriver.com>
To: alexander.kanavin@linux.intel.com
Date: Thu,  7 Jun 2018 02:01:59 -0700
Message-Id: <20180607090200.44857-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] manpages.bbclass: Update RDEPENDS and post install scripts
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
X-List-Received-Date: Thu, 07 Jun 2018 09:02:03 -0000

If a package installs manual files, it should update manual index cache
after its installation. Add package 'man-db' to RDEPENDS which contains
command 'mandb' to update the cache. And do the update in the post
install scripts.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/manpages.bbclass | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/classes/manpages.bbclass b/meta/classes/manpages.bbclass
index d16237b8983..50c254763e8 100644
--- a/meta/classes/manpages.bbclass
+++ b/meta/classes/manpages.bbclass
@@ -3,3 +3,35 @@
 # tends to pull in the entire XML stack and other tools, so it's not enabled
 # by default.
 PACKAGECONFIG_append_class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'manpages', '', d)}"
+
+inherit qemu
+
+# usually manual files are packaged to ${PN}-doc except man-pages
+MAN_PKG ?= "${PN}-doc"
+
+# only add man-db to RDEPENDS when manual files are built and installed
+RDEPENDS_${MAN_PKG} += "${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'man-db', '', d)}"
+
+pkg_postinst_append_${MAN_PKG} () {
+	# only update manual page index caches when manual files are built and installed
+	if ${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'true', 'false', d)}; then
+		if test -n "$D"; then
+			if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true','false', d)}; then
+				sed "s:\(\s\)/:\1$D/:g" $D${sysconfdir}/man_db.conf | ${@qemu_run_binary(d, '$D', '${bindir}/mandb')} -C - -u -q $D${mandir}
+				mkdir -p $D${localstatedir}/cache/man
+				mv $D${mandir}/index.db $D${localstatedir}/cache/man
+			else
+				$INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} mlprefix=${MLPREFIX}
+			fi
+		else
+			mandb -q
+		fi
+	fi
+}
+
+pkg_postrm_append_${MAN_PKG} () {
+	# only update manual page index caches when manual files are built and installed
+	if ${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'true', 'false', d)}; then
+		mandb -q
+	fi
+}
-- 
2.11.0


