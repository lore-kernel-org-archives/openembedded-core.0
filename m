Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QRVXK-0004lg-C5
	for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 22:27:34 +0200
Received: from localhost.localdomain (c-76-105-143-140.hsd1.or.comcast.net
	[76.105.143.140])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id F2EAB2FEF8;
	Tue, 31 May 2011 15:53:29 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 12:53:17 -0700
Message-Id: <ea3163ab446883b772207bf0600f0198a3041a7a.1306865217.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1306865217.git.scott.a.garman@intel.com>
References: <cover.1306865217.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1306865217.git.scott.a.garman@intel.com>
References: <cover.1306865217.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: F2EAB2FEF8.E0986
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 5/7] useradd-example: example recipe for using inherit useradd
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
X-List-Received-Date: Tue, 31 May 2011 20:27:34 -0000

An example recipe for demonstrating/documenting how user and
group manipulation is done with 'inherit useradd'

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../recipes-skeleton/useradd/useradd-example.bb    |   59 ++++++++++++++++++++
 1 files changed, 59 insertions(+), 0 deletions(-)
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file1
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file2
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file3
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file4

diff --git a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
new file mode 100644
index 0000000..1e6ae87
--- /dev/null
+++ b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
@@ -0,0 +1,59 @@
+SUMMARY = "Example recipe for using inherit useradd"
+DESCRIPTION = "This recipe serves as an example for using features from useradd.bbclass"
+SECTION = "examples"
+PR = "r0"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://file1 \
+           file://file2 \
+           file://file3 \
+           file://file4"
+
+S = "${WORKDIR}"
+
+inherit useradd
+
+# Specify which package(s) should include the user/group code.
+# Make sure that any packages which install files owned by custom
+# users/groups are included here. The code which adds users and
+# groups is idempotent.
+USERADD_PACKAGES = "useradd-example"
+
+# You *must* set USERADD_PARAM and/or GROUPADD_PARAM when
+# you inherit useradd.
+
+# USERADD_PARAM specifies command line options to pass to the
+# useradd command. Multiple users can be created by separating
+# the commands with a semicolon. Here we'll create two users,
+# user1 and user3:
+USERADD_PARAM_useradd-example = "-u 1200 -d /home/user1 -r -s /bin/bash user1; -u 1201 -d /home/user3 -r -s /bin/bash user3"
+
+# GROUPADD_PARAM works the same way, which you set to the options
+# you'd normally pass to the groupadd command. This will create
+# groups group1, group2, and group3:
+GROUPADD_PARAM_useradd-example = "-g 880 group1; -g 890 group2; -g 900 group3"
+
+do_install () {
+	install -d -m 755 ${D}/usr/share/user1
+	install -d -m 755 ${D}/usr/share/user3
+	install -p -m 644 file1 ${D}/usr/share/user1/
+	install -p -m 644 file2 ${D}/usr/share/user1/
+	install -p -m 644 file3 ${D}/usr/share/user3/
+	install -p -m 644 file4 ${D}/usr/share/user3/
+
+	# The new users and groups are created before the do_install
+	# step, so you are now free to make use of them:
+	chown -R user1 ${D}/usr/share/user1
+	chown -R user3 ${D}/usr/share/user3
+	chgrp group1 ${D}/usr/share/user1/file1
+	chgrp group3 ${D}/usr/share/user1/file2
+	chgrp group1 ${D}/usr/share/user3/file3
+	chgrp group3 ${D}/usr/share/user3/file4
+}
+
+PACKAGES =+ "${PN}-user3"
+
+FILES_${PN} = "/usr/share/user1/*"
+FILES_${PN}-user3 = "/usr/share/user3/*"
diff --git a/meta-skeleton/recipes-skeleton/useradd/useradd-example/file1 b/meta-skeleton/recipes-skeleton/useradd/useradd-example/file1
new file mode 100644
index 0000000..e69de29
diff --git a/meta-skeleton/recipes-skeleton/useradd/useradd-example/file2 b/meta-skeleton/recipes-skeleton/useradd/useradd-example/file2
new file mode 100644
index 0000000..e69de29
diff --git a/meta-skeleton/recipes-skeleton/useradd/useradd-example/file3 b/meta-skeleton/recipes-skeleton/useradd/useradd-example/file3
new file mode 100644
index 0000000..e69de29
diff --git a/meta-skeleton/recipes-skeleton/useradd/useradd-example/file4 b/meta-skeleton/recipes-skeleton/useradd/useradd-example/file4
new file mode 100644
index 0000000..e69de29
-- 
1.7.1



