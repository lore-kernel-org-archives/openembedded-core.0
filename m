Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RPoFz-0002Dy-5b
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 05:34:56 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2011 20:28:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="75055130"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.217])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2011 20:28:16 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Nov 2011 20:28:01 -0800
Message-Id: <0f778a42d4a55d9786e210a3327f10908fa7be17.1321244755.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
References: <cover.1321244755.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/21] time: use u-a for time, conflicts with busybox
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
X-List-Received-Date: Mon, 14 Nov 2011 04:34:57 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* it was reported here:
  http://lists.linuxtogo.org/pipermail/openembedded-core/2011-September/009409.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/time/time.inc    |   10 ++++++++++
 meta/recipes-extended/time/time_1.7.bb |    2 ++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/time/time.inc b/meta/recipes-extended/time/time.inc
index 2d9dab8..401288b 100644
--- a/meta/recipes-extended/time/time.inc
+++ b/meta/recipes-extended/time/time.inc
@@ -6,3 +6,13 @@ SECTION = "utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
+inherit update-alternatives
+
+do_install_append () {
+        mv ${D}${bindir}/time ${D}${bindir}/time.${PN}
+}
+
+ALTERNATIVE_NAME = "time"
+ALTERNATIVE_LINK = "${bindir}/time"
+ALTERNATIVE_PATH = "${bindir}/time.${PN}"
+ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-extended/time/time_1.7.bb b/meta/recipes-extended/time/time_1.7.bb
index 35afb1e..c38608f 100644
--- a/meta/recipes-extended/time/time_1.7.bb
+++ b/meta/recipes-extended/time/time_1.7.bb
@@ -1,5 +1,7 @@
 require time.inc
 
+PR = "r1"
+
 SRC_URI = "${GNU_MIRROR}/time/time-${PV}.tar.gz \
 	   file://debian.patch"
 
-- 
1.7.6.4



