Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 703F1793D7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 09:40:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7U9eUYg028473
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 02:40:31 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 30 Aug 2018 02:40:30 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Aug 2018 17:45:13 +0800
Message-ID: <5866ef08f2dff80047ec4513374c4d3a0cf800b7.1535621964.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1535621964.git.Qi.Chen@windriver.com>
References: <cover.1535621964.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] busybox: fix the alternatives logic
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
X-List-Received-Date: Thu, 30 Aug 2018 09:40:30 -0000
Content-Type: text/plain

The current alternatives setting logic in busybox is not ideal.
For example, the 'syslogd' alternative should be handled by
busybox-syslog package, but it is now handled by the busybox package.

In other words, despite the fact that busybox recipe has multiple
packages, the alternatives settings are all done for the main busybox
package.

This will cause problems. For example, if we have an image with sysklogd
and busybox installed, there will be do_rootfs failure if busybox is
installed after sysklogd.

Note that in the above situation, the image does not have busybox-syslog.
The 'syslogd' entry should really be handled by busybox-syslog instead of
busybox.

And the same logic applies to other packages in the busybox recipe.

So change the alternatives handling codes in busybox to fix this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 8c6dbba..5ca1bab 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -29,6 +29,13 @@ FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
 FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
 
+ALTERNATIVE_${PN}-httpd = "httpd"
+ALTERNATIVE_${PN}-syslog = "syslogd klogd"
+ALTERNATIVE_${PN}-mdev = "mdev"
+ALTERNATIVE_${PN}-udhcpd = "udhcpd"
+ALTERNATIVE_${PN}-udhcpc = "udhcpc"
+ALTERNATIVE_${PN}-hwclock = "hwclock"
+
 INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock"
 
 INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
@@ -357,21 +364,46 @@ python do_package_prepend () {
 
     dvar = d.getVar('D')
     pn = d.getVar('PN')
+    pkgs = d.getVar('PACKAGES').split()
     def set_alternative_vars(links, target):
         links = d.expand(links)
         target = d.expand(target)
         f = open('%s%s' % (dvar, links), 'r')
+        valid_names = []
         for alt_link_name in f:
             alt_link_name = alt_link_name.strip()
             alt_name = os.path.basename(alt_link_name)
             # Match coreutils
             if alt_name == '[':
                 alt_name = 'lbracket'
-            d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
+            valid_names.append(alt_name)
+            # if not already specified by ALTERNATIVE_pkg, default to put it in ALTERNATIVE_${PN}
+            flag_default = True
+            for pkg in pkgs:
+                if pkg == pn:
+                    continue
+                if alt_name in (d.getVar('ALTERNATIVE_%s' % pkg) or '').split():
+                    flag_default = False
+                    break
+            if flag_default:
+                d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
             d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link_name)
             if os.path.exists('%s%s' % (dvar, target)):
                 d.setVarFlag('ALTERNATIVE_TARGET', alt_name, target)
         f.close()
+        # iterate over pkgs to remove invalid entries for ALTERNATIVE_pkg
+        for pkg in pkgs:
+            if pkg == pn:
+                continue
+            final_names = []
+            names = (d.getVar('ALTERNATIVE_%s' % pkg) or '').split()
+            for name in names:
+                if name in valid_names:
+                    final_names.append(name)
+            if final_names:
+                d.setVar('ALTERNATIVE_%s' % pkg, ' '.join(final_names))
+            else:
+                d.delVar('ALTERNATIVE_%s' % pkg)
         return
 
     if os.path.exists('%s/etc/busybox.links' % (dvar)):
-- 
1.9.1


