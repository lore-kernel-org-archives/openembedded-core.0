Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1ScHgK-0002GE-Mh
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 16:57:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q56ElSs1018021
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jun 2012 07:47:28 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 6 Jun 2012 07:47:28 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jun 2012 09:53:15 -0500
Message-ID: <f33daa49ebd9193dd5689490ca3cbad3803082c5.1338994308.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1338994308.git.mark.hatle@windriver.com>
References: <cover.1338994308.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 4/6] shared-mime-info: fix build race condition
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
X-List-Received-Date: Wed, 06 Jun 2012 14:57:58 -0000
Content-Type: text/plain

From: Joe Slater <jslater@windriver.com>

The definition of install-data-hook in Makefile.am leads
to multiple, overlapping, executions of the install-binPROGRAMS
target.  We modify the definition to avoid that.

Signed-off-by: Joe Slater <jslater@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../shared-mime-info/install-data-hook.patch       |   21 ++++++++++++++++++++
 .../shared-mime-info/shared-mime-info_0.91.bb      |    5 ++-
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
1.7.3.4



