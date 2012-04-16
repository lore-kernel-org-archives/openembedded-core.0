Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SJvEi-0000RF-2J
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 01:21:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3GNC62D015290
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 16:12:06 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 16 Apr 2012 16:12:05 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 18:16:26 -0500
Message-ID: <46cac7039f29b813d84e88f2a8511e2f5c6271b6.1334616144.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1334616144.git.mark.hatle@windriver.com>
References: <cover.1334616144.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 13/17] kbd: Use update-alternatives
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
X-List-Received-Date: Mon, 16 Apr 2012 23:21:32 -0000
Content-Type: text/plain

Change to use ALTERNATIVE_LINKS from update-alternatives.  This ensures
the links are created consistently and the package provides are
correct.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/kbd/kbd_1.15.2.bb |   34 +++++++---------------------------
 1 files changed, 7 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-core/kbd/kbd_1.15.2.bb b/meta/recipes-core/kbd/kbd_1.15.2.bb
index eea04a0..99a6a50 100644
--- a/meta/recipes-core/kbd/kbd_1.15.2.bb
+++ b/meta/recipes-core/kbd/kbd_1.15.2.bb
@@ -10,7 +10,7 @@ RREPLACES_${PN} = "console-tools"
 RPROVIDES_${PN} = "console-tools"
 RCONFLICTS_${PN} = "console-tools"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI="${KERNELORG_MIRROR}/linux/utils/kbd/kbd-1.15.2.tar.bz2"
 SRC_URI[md5sum] = "e850eb91e4d3b94b194efe8e953204c5"
@@ -23,29 +23,9 @@ FILES_${PN}-consoletrans = "${datadir}/consoletrans"
 FILES_${PN}-keymaps = "${datadir}/keymaps"
 FILES_${PN}-unimaps = "${datadir}/unimaps"
 
-ALTERNATIVE_NAMES_USRBIN = "chvt deallocvt fgconsole openvt"
-
-do_install_append() {
-  usrbinprogs_a="${ALTERNATIVE_NAMES_USRBIN}"
-  for p in $usrbinprogs_a; do
-    if [ -f "${D}${bindir}/$p" ]; then
-      mv "${D}${bindir}/$p" "${D}${bindir}/$p.${PN}"
-    fi
-  done
-}
-
-pkg_postinst_${PN} () {
-  usrbinprogs_a="${ALTERNATIVE_NAMES_USRBIN}"
-  for p in $usrbinprogs_a; do
-    if [ -f "$D${bindir}/$p" ]; then
-      update-alternatives --install ${bindir}/$p $p $p.${PN} 100
-    fi
-  done
-}
-
-pkg_postrm_${PN} () {
-  usrbinprogs_a="${ALTERNATIVE_NAMES_USRBIN}"
-  for p in $usrbinprogs_a; do
-    update-alternatives --remove $p $p.${PN}
-  done
-}
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+
+bindir_progs = "chvt deallocvt fgconsole openvt"
+ALTERNATIVE_LINKS = "${bindir}/${@' ${bindir}/'.join((d.getVar('bindir_progs', True)).split())}"
-- 
1.7.3.4



