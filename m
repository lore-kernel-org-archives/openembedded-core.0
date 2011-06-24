Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QaCKj-000367-I9
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 21:46:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5OJgqoK015947
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 12:42:52 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 24 Jun 2011 12:42:51 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jun 2011 14:42:48 -0500
Message-ID: <4f64811b18665d26645a376fda0828dad0b07c7c.1308944503.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308944503.git.mark.hatle@windriver.com>
References: <cover.1308944503.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1] prelink: Uprev prelink to latest version (V2)
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
X-List-Received-Date: Fri, 24 Jun 2011 19:46:30 -0000
Content-Type: text/plain

The latest cross-prelink version tracks the prelink r190 SVN.

Fix two minor issues as well.  If we remove the package, we would
unprelink the filesystem after the rm was finished.  This is
incorrect.. we need to do this prerm.

Move the cron and cron configuration file to a new package split.
This item is not valid for most embedded users.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../prelink/prelink/prelink.default                |    2 +-
 meta/recipes-devtools/prelink/prelink_git.bb       |   25 +++++++++++++++++--
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/prelink/prelink/prelink.default b/meta/recipes-devtools/prelink/prelink/prelink.default
index 901258e..d8802f8 100644
--- a/meta/recipes-devtools/prelink/prelink/prelink.default
+++ b/meta/recipes-devtools/prelink/prelink/prelink.default
@@ -2,7 +2,7 @@
 # or to yes to enable it.
 # (if you change this from yes to no prelink -ua
 # will be run next night to undo prelinking)
-PRELINKING=unknown
+PRELINKING=yes
 
 # Options to pass to prelink
 # -m	Try to conserve virtual memory by allowing overlapping
diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index 1eea30a..b57c145 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -8,9 +8,24 @@ and executables, so that far fewer relocations need to be resolved at \
 runtime and thus programs come up faster."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
-SRCREV = "909470ee441237563d6236c505cb2d02ddc48704"
+SRCREV = "ac461e73b17253a4da25c5aafeac7193b553156c"
 PV = "1.0+git${SRCPV}"
-PR = "r2"
+PR = "r3"
+
+#
+# The cron script attempts to re-prelink the system daily -- on
+# systems where users are adding applications, this might be reasonable
+# but for embedded, we should be re-running prelink -a after an update.
+#
+# Default is prelinking is enabled.
+#
+SUMMARY_${PN}-cron = "Cron scripts to control automatic prelinking"
+DESCRIPTION_${PN}-cron = "Cron scripts to control automatic prelinking.  \
+See: ${sysconfdir}/cron.daily/prelink for configuration information."
+
+FILES_${PN}-cron = "${sysconfdir}/cron.daily ${sysconfdir}/default"
+
+PACKAGES =+ "${PN}-cron"
 
 SRC_URI = "git://git.yoctoproject.org/prelink-cross.git;protocol=git \
            file://prelink.conf \
@@ -53,9 +68,13 @@ fi
 prelink -a
 }
 
-pkg_postrm_prelink() {
+pkg_prerm_prelink() {
 #!/bin/sh
 
+if [ "x$D" != "x" ]; then
+  exit 1
+fi
+
 prelink -au
 }
 
-- 
1.7.3.4



