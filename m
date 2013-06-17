Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 63B6060812
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 05:49:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5H5naTR007968
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jun 2013 22:49:36 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 16 Jun 2013 22:49:34 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2013 13:49:28 +0800
Message-ID: <b5688fe465a6f4fd3e21ce9eae41ce5fc8eb84db.1371447869.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1371447869.git.Qi.Chen@windriver.com>
References: <cover.1371447869.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V2 2/9] busybox: add support for CONFIG_FEATURE_INDIVIDUAL
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
X-List-Received-Date: Mon, 17 Jun 2013 05:49:33 -0000
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

Note there's a grep expression change in this patch. The old expression
doesn't work well, it has an unwanted underscore, so I changed it to make
it work.

[YOCTO #4570]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index f4efeb8..99d4e99 100644
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
@@ -242,8 +242,6 @@ ALTERNATIVE_TARGET[syslog-init] = "${sysconfdir}/init.d/syslog.${BPN}"
 ALTERNATIVE_LINK_NAME[syslog-startup-conf] = "${sysconfdir}/syslog-startup.conf"
 ALTERNATIVE_TARGET[syslog-startup-conf] = "${sysconfdir}/syslog-startup.conf.${BPN}"
 
-ALTERNATIVE_TARGET = "/bin/busybox"
-
 python do_package_prepend () {
     # We need to load the full set of busybox provides from the /etc/busybox.links
     # Use this to see the update-alternatives with the right information
@@ -252,6 +250,9 @@ python do_package_prepend () {
     pn = d.getVar('PN', True)
     f = open('%s/etc/busybox.links' % (dvar), 'r')
 
+    if os.path.exists('%s/bin/busybox' % (dvar)):
+        d.setVar('ALTERNATIVE_TARGET', "/bin/busybox")
+
     for alt_link_name in f:
         alt_link_name = alt_link_name.strip()
         alt_name = os.path.basename(alt_link_name)
-- 
1.7.9.5


