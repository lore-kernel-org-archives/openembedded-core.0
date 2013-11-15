Return-Path: <Hongbo.Zhong@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6F2076DA6B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 06:52:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAF6qgHM019149
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 22:52:42 -0800 (PST)
Received: from hzhong.corp.ad.wrs.com (128.224.162.173) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 14 Nov 2013 22:52:42 -0800
From: Zhong Hongbo <hongbo.zhong@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Nov 2013 14:52:59 +0800
Message-ID: <1384498379-30017-2-git-send-email-hongbo.zhong@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1384498379-30017-1-git-send-email-hongbo.zhong@windriver.com>
References: <1384498379-30017-1-git-send-email-hongbo.zhong@windriver.com>
MIME-Version: 1.0
Subject: [V2 2/2] bluez4: use legacy pygobject instead of gobject-introspection
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
X-List-Received-Date: Fri, 15 Nov 2013 06:52:40 -0000
Content-Type: text/plain

From: Zhong Hongbo <hongbo.zhong@windriver.com>

Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
---
 ...pygobject-instead-ofgobject-introspection.patch |   27 ++++++++++++++++++++
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |    1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.patch

diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.patch b/meta/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.patch
new file mode 100644
index 0000000..37037f5
--- /dev/null
+++ b/meta/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Inappropriate
+
+use legacy pygobject instead of gobject-introspection
+
+Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
+---
+diff -Nurd bluez-4.101.orig/test/simple-agent bluez-4.101/test/simple-agent
+--- bluez-4.101.orig/test/simple-agent	2013-11-13 17:14:08.138118159 +0800
++++ bluez-4.101/test/simple-agent	2013-11-13 17:14:29.034118107 +0800
+@@ -2,7 +2,7 @@
+ 
+ from __future__ import absolute_import, print_function, unicode_literals
+ 
+-from gi.repository import GObject
++import gobject
+ 
+ import sys
+ import dbus
+@@ -122,7 +122,7 @@
+ 	path = "/test/agent"
+ 	agent = Agent(bus, path)
+ 
+-	mainloop = GObject.MainLoop()
++	mainloop = gobject.MainLoop()
+ 
+ 	if len(args) > 1:
+ 		if len(args) > 2:
diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
index e61ba02..ba80d5a 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://bluetooth.conf \
             file://obsolete_automake_macros.patch \
             file://network-fix-network-Connect-method-parameters.patch \
             file://install-test-script.patch \
+            file://use-legacy-pygobject-instead-ofgobject-introspection.patch \
 "
 
 SRC_URI[md5sum] = "fb42cb7038c380eb0e2fa208987c96ad"
-- 
1.7.9.5


