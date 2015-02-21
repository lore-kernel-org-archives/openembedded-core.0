Return-Path: <peter.kjellerstedt@axis.com>
X-Greylist: delayed 342 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 21 Feb 2015 03:07:40 UTC
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6CEB3606E8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 03:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 3673518154
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 04:02:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id YOD9uaIELHoi
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 04:01:58 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id D19D118166
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 04:01:58 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id B40061264
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 04:01:58 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id A90D21262
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 04:01:58 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id A6EBD3E229
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 04:01:58 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id t1L31wdc014417
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 04:01:58 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id t1L31wCL014416
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Feb 2015 04:01:58 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Feb 2015 04:01:54 +0100
Message-Id: <1574ff4603e528bd76f5ebf3cfea9f6908e0ab7b.1424487658.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1424487658.git.pkj@axis.com>
References: <cover.1424487658.git.pkj@axis.com>
In-Reply-To: <cover.1424487658.git.pkj@axis.com>
References: <cover.1424487658.git.pkj@axis.com>
Subject: [PATCH 1/1] gst-plugins-package.inc: Avoid dependency on ${PN} from ${PN}-<plugin>
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
X-List-Received-Date: Sat, 21 Feb 2015 03:07:40 -0000

A recent change to this file added a runtime dependency from ${PN} on
${PN}-meta since users tend to believe that installing the main
package will bring in all of the individual plugin packages, which
previously was not the case. However, since all plugin packages had a
dependency on the main package, this caused all plugin packages to be
pulled in whenever one plugin package was installed...

Since the main package is now guaranteed to be empty, there is no
reason for the plugin packages to depend on it any more.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-package.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index bc33b0e..cb1be06 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -7,7 +7,7 @@ python split_gstreamer10_packages () {
     glibdir = d.getVar('libdir', True)
 
     do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True)
-    do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', d.expand('${PN}-%s'), 'GStreamer plugin for %s', postinst=postinst, extra_depends=d.expand('${PN}'))
+    do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', d.expand('${PN}-%s'), 'GStreamer plugin for %s', postinst=postinst, extra_depends='')
     do_split_packages(d, gst_libdir, 'libgst(.*)\.la$', d.expand('${PN}-%s-dev'), 'GStreamer plugin for %s (development files)', extra_depends=d.expand('${PN}-dev'))
     do_split_packages(d, gst_libdir, 'libgst(.*)\.a$', d.expand('${PN}-%s-staticdev'), 'GStreamer plugin for %s (static development files)', extra_depends=d.expand('${PN}-staticdev'))
 }
@@ -40,8 +40,7 @@ python set_metapkg_rdepends () {
     d.setVar('DESCRIPTION_' + metapkg, pn + ' meta package')
 }
 
-# metapkg has runtime dependency on PN
-# each plugin depends on PN, plugin-dev on PN-dev, plugin-staticdev on PN-staticdev
+# each plugin-dev depends on PN-dev, plugin-staticdev on PN-staticdev
 # so we need them even when empty (like in gst-plugins-good case)
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-dev = "1"
-- 
2.1.0


