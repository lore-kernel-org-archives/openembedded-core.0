Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QcW4v-0006EJ-Jh
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 07:15:45 +0200
Received: from localhost.localdomain (c-98-246-160-194.hsd1.or.comcast.net
	[98.246.160.194])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id B32D92FEF6;
	Fri,  1 Jul 2011 01:11:58 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 22:11:51 -0700
Message-Id: <7d99a563707d77c33a228809219651266d885147.1309497002.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1309497002.git.scott.a.garman@intel.com>
References: <cover.1309497002.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1309497002.git.scott.a.garman@intel.com>
References: <cover.1309497002.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: B32D92FEF6.68EB0
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 2/2] useradd-example: example recipe for using inherit useradd
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
X-List-Received-Date: Fri, 01 Jul 2011 05:15:45 -0000

An example recipe for demonstrating/documenting how user and
group manipulation is done with 'inherit useradd'

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../recipes-skeleton/useradd/useradd-example.bb    |   76 ++++++++++++++++++++
 1 files changed, 76 insertions(+), 0 deletions(-)
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file1
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file2
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file3
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file4

diff --git a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
new file mode 100644
index 0000000..02d56f6
--- /dev/null
+++ b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
@@ -0,0 +1,76 @@
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
+PACKAGES =+ "${PN}-user3"
+
+inherit useradd
+
+# Specify which package(s) should include the user/group code.
+# Make sure that any packages which install files owned by custom
+# users/groups are included here. The code which adds users and
+# groups is idempotent.
+USERADD_PACKAGES = "${PN} ${PN}-user3"
+
+# You *must* set USERADD_PARAM and/or GROUPADD_PARAM when
+# you inherit useradd.
+
+# USERADD_PARAM specifies command line options to pass to the
+# useradd command. Multiple users can be created by separating
+# the commands with a semicolon. Here we'll create two users,
+# user1 and user2:
+USERADD_PARAM_${PN} = "-u 1200 -d /home/user1 -r -s /bin/bash user1; -u 1201 -d /home/user2 -r -s /bin/bash user2"
+
+# user3 will be managed in the useradd-example-user3 pacakge:
+USERADD_PARAM_${PN}-user3 = "-u 1202 -d /home/user3 -r -s /bin/bash user3"
+
+# GROUPADD_PARAM works the same way, which you set to the options
+# you'd normally pass to the groupadd command. This will create
+# groups group1 and group2:
+GROUPADD_PARAM_${PN} = "-g 880 group1; -g 890 group2"
+
+# Likewise, we'll manage group3 in the useradd-example-user3 package:
+GROUPADD_PARAM_${PN}-user3 = "-g 900 group3"
+
+do_install () {
+	install -d -m 755 ${D}/usr/share/user1
+	install -d -m 755 ${D}/usr/share/user2
+	install -d -m 755 ${D}/usr/share/user3
+
+	install -p -m 644 file1 ${D}/usr/share/user1/
+	install -p -m 644 file2 ${D}/usr/share/user1/
+
+	install -p -m 644 file2 ${D}/usr/share/user2/
+	install -p -m 644 file3 ${D}/usr/share/user2/
+
+	install -p -m 644 file3 ${D}/usr/share/user3/
+	install -p -m 644 file4 ${D}/usr/share/user3/
+
+	# The new users and groups are created before the do_install
+	# step, so you are now free to make use of them:
+	chown -R user1 ${D}/usr/share/user1
+	chown -R user2 ${D}/usr/share/user2
+	chown -R user3 ${D}/usr/share/user3
+
+	chgrp -R group1 ${D}/usr/share/user1
+	chgrp -R group2 ${D}/usr/share/user2
+	chgrp -R group3 ${D}/usr/share/user3
+}
+
+FILES_${PN} = "/usr/share/user1/* /usr/share/user2/*"
+FILES_${PN}-user3 = "/usr/share/user3/*"
+
+# Prevents do_package failures with:
+# debugsources.list: No such file or directory:
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
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



