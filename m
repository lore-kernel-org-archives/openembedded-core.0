Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SeY0M-0002Za-BC
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 22:47:58 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 284BD2FD1D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 16:37:19 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2012 13:36:45 -0700
Message-Id: <d8a09cb17f2f3b43718ba354da7368a2ed793766.1339533128.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 284BD2FD1D.149B4
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 14/16] shared-mime-info: fix build race condition
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jun 2012 20:47:58 -0000

From: Joe Slater <jslater@windriver.com>

The definition of install-data-hook in Makefile.am leads
to multiple, overlapping, executions of the install-binPROGRAMS
target.  We modify the definition to avoid that.

Signed-off-by: Joe Slater <jslater@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../shared-mime-info/install-data-hook.patch       |   21 ++++++++++++++++++++
 .../shared-mime-info/shared-mime-info_0.91.bb      |    5 +++--
 2 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch b/meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch
new file mode 100644
index 0000000..4c075f2
--- /dev/null
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch
@@ -0,0 +1,21 @@
+fix shared-mime-info build race condition
+
+The definition of install-data-hook in Makefile.am leads
+to multiple, overlapping, executions of install-binPROGRAMS
+target.  We modify the definition to avoid that.
+
+Signed-off-by: Joe Slater <jslater@windriver.com>
+
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -44,7 +44,9 @@ $(pkgconfig_DATA): config.status
+ @INTLTOOL_XML_RULE@
+ @INTLTOOL_DESKTOP_RULE@
+ 
+-install-data-hook: install-binPROGRAMS
++# do NOT make this dependent on anything!
++#
++install-data-hook:
+ if ENABLE_UPDATE_MIMEDB
+ 	$(DESTDIR)"$(bindir)/update-mime-database" -V "$(DESTDIR)$(datadir)/mime"
+ endif
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
index 7ae6e10..910cb7f 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
@@ -1,7 +1,8 @@
 require shared-mime-info.inc
-PR = "r3"
+PR = "r4"
 
 SRC_URI[md5sum] = "982a211560ba4c47dc791ccff34e8fbc"
 SRC_URI[sha256sum] = "98cfebe1d809afb24934e634373821e2a1dfa86fc6462cab230589a1c80988bd"
 
-SRC_URI =+ "file://parallelmake.patch"
+SRC_URI =+ "file://parallelmake.patch \
+	    file://install-data-hook.patch"
-- 
1.7.9.5



