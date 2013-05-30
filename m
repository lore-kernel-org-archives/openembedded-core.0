Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7313D60991
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 08:51:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4U8pSd4005277
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 01:51:28 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 30 May 2013 01:51:27 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 May 2013 16:51:48 +0800
Message-ID: <61b6db5766ad5f6690aa059ffd26f0b00834e433.1369895527.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1369895527.git.Qi.Chen@windriver.com>
References: <cover.1369895527.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/1] busybox: fix to support FEATURE_INDIVIDUAL
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
X-List-Received-Date: Thu, 30 May 2013 08:51:27 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Previously, if CONFIG_FEATURE_INDIVIDUAL was enabled for busybox,
yocto-based systems could start correctly.

This is because if busybox is built as individual apps, '/bin/busybox'
may not be present, so setting the default ALTERNATIVE_TARGET to
'/bin/busybox' is not appropriate and could lead to errors.

This patch fixes this problem by checking the existence of '/bin/busybox'
before setting the ALTERNATIVE_TARGET to '/bin/busybox'.

After this change, if busybox is built as individual apps, we'll have
links like '/bin/ls -> /bin/ls.busybox', otherwise, we'll have links
like '/bin/ls -> /bin/busybox'.

Besides, this patch removes the pkg_postinst part in the busybox recipe,
because it's redundant.

[YOCTO #4570]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc |   16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index c8908b0..6abe167 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -171,7 +171,7 @@ do_install () {
 			install -m 0755 "0_lib/$NAME" "${D}$FILE.${BPN}"
 		done
 		# add suid bit where needed
-		for i in `grep -E "APPLET.*_BB_SUID_((MAYBE|REQUIRE))" include/applets.h | grep -v _BB_SUID_DROP | cut -f 3 -d '(' | cut -f 1 -d ','`; do
+		for i in `grep -E "APPLET.*BB_SUID_((MAYBE|REQUIRE))" include/applets.h | grep -v _BB_SUID_DROP | cut -f 3 -d '(' | cut -f 1 -d ','`; do
 			find ${D} -name $i.${BPN} -exec chmod a+s {} \;
 		done
 		install -m 0755 0_lib/libbusybox.so.${PV} ${D}${libdir}/libbusybox.so.${PV}
@@ -242,14 +242,16 @@ ALTERNATIVE_TARGET[syslog-init] = "${sysconfdir}/init.d/syslog.${BPN}"
 ALTERNATIVE_LINK_NAME[syslog-startup-conf] = "${sysconfdir}/syslog-startup.conf"
 ALTERNATIVE_TARGET[syslog-startup-conf] = "${sysconfdir}/syslog-startup.conf.${BPN}"
 
-ALTERNATIVE_TARGET = "/bin/busybox"
-
 python do_package_prepend () {
     # We need to load the full set of busybox provides from the /etc/busybox.links
     # Use this to see the update-alternatives with the right information
 
     dvar = d.getVar('D', True)
     pn = d.getVar('PN', True)
+
+    if os.path.exists('%s/bin/busybox' % (dvar)):
+        d.setVar('ALTERNATIVE_TARGET', "/bin/busybox")
+
     f = open('%s/etc/busybox.links' % (dvar), 'r')
 
     for alt_link_name in f:
@@ -265,14 +267,6 @@ python do_package_prepend () {
     f.close()
 }
 
-pkg_postinst_${PN} () {
-	# If we are not making an image we create links for the utilities that doesn't exist
-	# so the update-alternatives script will get the utilities it needs
-	# (update-alternatives have no problem replacing links later anyway)
-	test -n 2> /dev/null || alias test='busybox test'
-	if test "x$D" = "x"; then while read link; do if test ! -h "$link"; then case "$link" in /*/*/*) to="../../bin/busybox";; /bin/*) to="busybox";; /*/*) to="../bin/busybox";; esac; busybox ln -s $to $link; fi; done </etc/busybox.links; fi
-}
-
 pkg_prerm_${PN} () {
 	# This is so you can make busybox commit suicide - removing busybox with no other packages
 	# providing its files, this will make update-alternatives work, but the update-rc.d part
-- 
1.7.9.5


