Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QaBpG-0000bk-FL
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 21:13:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5OJALF9012336
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 12:10:21 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 24 Jun 2011 12:10:20 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jun 2011 14:10:16 -0500
Message-ID: <149d6209aca5fcc3eb708b81e9d0f28bf3706763.1308942534.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308942534.git.mark.hatle@windriver.com>
References: <cover.1308942534.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1] prelink: Uprev prelink to latest version
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
X-List-Received-Date: Fri, 24 Jun 2011 19:13:58 -0000
Content-Type: text/plain

The latest cross-prelink version tracks the prelink r190 SVN.

Fix two minor issues as well.  If we remove the package, we would
unprelink the filesystem after the rm was finished.  This is
incorrect.. we need to do this prerm.

Also disable the cron configuration file.  This isn't appropriate
for embedded systems, but someone might still find it useful.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/prelink/prelink_git.bb |   18 +++++++++++++-----
 1 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index 1eea30a..044cb6b 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -8,9 +8,9 @@ and executables, so that far fewer relocations need to be resolved at \
 runtime and thus programs come up faster."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
-SRCREV = "909470ee441237563d6236c505cb2d02ddc48704"
+SRCREV = "ac461e73b17253a4da25c5aafeac7193b553156c"
 PV = "1.0+git${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "git://git.yoctoproject.org/prelink-cross.git;protocol=git \
            file://prelink.conf \
@@ -35,11 +35,15 @@ do_configure_prepend () {
         echo "all:" > ${S}/doc/Makefile.am
 }
 
+# Disabled the cron and cron configuration file, isn't appropriate for
+# embedded systems.  (The script re-prelinks the system daily -- on
+# systems where users are adding applications, this might be reasonable
+# but for embedded, we should be re-running prelink -a after an update.)
 do_install_append () {
 	install -d ${D}${sysconfdir}/cron.daily ${D}${sysconfdir}/default ${D}${sysconfdir}/rpm
 	install -m 0644 ${WORKDIR}/prelink.conf ${D}${sysconfdir}/prelink.conf
-	install -m 0644 ${WORKDIR}/prelink.cron.daily ${D}${sysconfdir}/cron.daily/prelink
-	install -m 0644 ${WORKDIR}/prelink.default ${D}${sysconfdir}/default/prelink
+#	install -m 0644 ${WORKDIR}/prelink.cron.daily ${D}${sysconfdir}/cron.daily/prelink
+#	install -m 0644 ${WORKDIR}/prelink.default ${D}${sysconfdir}/default/prelink
 	install -m 0644 ${WORKDIR}/macros.prelink ${D}${sysconfdir}/rpm/macros.prelink
 }
 
@@ -53,9 +57,13 @@ fi
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



