Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTTbN-0005m5-Uq
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 08:47:54 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jun 2011 23:44:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,325,1304319600"; 
   d="scan'208";a="7609029"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.187])
	by azsmga001.ch.intel.com with ESMTP; 05 Jun 2011 23:44:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Jun 2011 23:44:21 -0700
Message-Id: <7d39ba93c8c439b65a1c55df1678043e1d3f3ec4.1307342214.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [CONSOLIDATED PULL 17/20] useradd-example: example recipe for using inherit useradd
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
X-List-Received-Date: Mon, 06 Jun 2011 06:47:56 -0000

From: Scott Garman <scott.a.garman@intel.com>

An example recipe for demonstrating/documenting how user and
group manipulation is done with 'inherit useradd'

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../recipes-skeleton/useradd/useradd-example.bb    |   72 ++++++++++++++++++++
 1 files changed, 72 insertions(+), 0 deletions(-)
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file1
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file2
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file3
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file4

diff --git a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
new file mode 100644
index 0000000..6c6edf0
--- /dev/null
+++ b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
@@ -0,0 +1,72 @@
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
1.7.3.4



