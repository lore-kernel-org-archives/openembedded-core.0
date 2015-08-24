Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0A66B76B69
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:18:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7OMIgRW010894
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:18:45 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 24 Aug 2015 15:18:41 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Aug 2015 17:18:39 -0500
Message-ID: <509c3b8c52f07a662998e2d57aaf9377ecd5fa8a.1440454005.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <cover.1440454005.git.peter.seebach@windriver.com>
References: <cover.1440454005.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pseudo_1.7.0.bb: New version of pseudo
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
X-List-Received-Date: Mon, 24 Aug 2015 22:18:46 -0000
Content-Type: text/plain

Pseudo 1.7 adds an experimental feature (which I think needs more testing
before it becomes the default) allowing the pseudo client to store modes
and uid/gid values in extended attributes rather than using the sqlite
database. On most Linux-like systems, this works only if the underlying
file is a plain file or a directory.

Also added is a profiling feature to allow some amount of reporting on
the wall-clock time the client spends in wrappers, processing operations,
or in IPC. This feature is not intendeded to be precisely accurate, but
gives a good overview of where time is going.

Based on the results from the profiling feature, the client now suppresses
OP_OPEN and OP_EXEC messages if the server is not logging messages, and
no longer uses constant dynamic allocation and free cycles for canonicalized
paths.

There's a few other likely-looking optimizations being considered, but
this seemed like a good cutoff for now.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/recipes-devtools/pseudo/pseudo_1.7.0.bb | 20 ++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb   |  4 ++--
 2 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.7.0.bb

diff --git a/meta/recipes-devtools/pseudo/pseudo_1.7.0.bb b/meta/recipes-devtools/pseudo/pseudo_1.7.0.bb
new file mode 100644
index 0000000..00dce03
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo_1.7.0.bb
@@ -0,0 +1,20 @@
+require pseudo.inc
+
+SRC_URI = " \
+    http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz2 \
+    file://fallback-passwd \
+    file://fallback-group \
+"
+
+
+SRC_URI[md5sum] = "de0fdfb12c76d98d654068ce7d9f9b56"
+SRC_URI[sha256sum] = "5caadb1cad228c0c69e1ecb1af715a6feeefc2dd88b9b726a8d1a5b6db054e7c"
+
+PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback"
+
+do_install_append_class-native () {
+	install -d ${D}${sysconfdir}
+	# The fallback files should never be modified
+	install -m 444 ${WORKDIR}/fallback-passwd ${D}${sysconfdir}/passwd
+	install -m 444 ${WORKDIR}/fallback-group ${D}${sysconfdir}/group
+}
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index aa315d3..6930fd1 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,7 +1,7 @@
 require pseudo.inc
 
-SRCREV = "db758fb11167c79d9682a17d359568e2a3c4acd5"
-PV = "1.6.5+git${SRCPV}"
+SRCREV = "cbcbe467c147f8c985bd38e34ab9adb72440f539"
+PV = "1.7.0+git${SRCPV}"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
2.3.1


