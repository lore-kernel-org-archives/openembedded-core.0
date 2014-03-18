Return-Path: <simone.agresta@bticino.it>
Received: from bticino.it (mx1.bticino.it [91.208.195.90])
	by mail.openembedded.org (Postfix) with ESMTP id E3A006F909
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 15:19:25 +0000 (UTC)
Received: from ([10.31.15.91])
	by smtp1.bticino.it with ESMTP  id 5RSHRF1.113925652;
	Tue, 18 Mar 2014 16:18:54 +0100
Received: from bticino-yocto.eu.dir.grpleg.com ([10.39.61.78])
	by notes-mta.srvnts.grpleg.com (Lotus Domino Release 8.5.3FP1)
	with ESMTP id 2014031816185290-122 ; Tue, 18 Mar 2014 16:18:52 +0100 
From: Simone Agresta <simone.agresta@bticino.it>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Mar 2014 16:18:33 +0100
Message-Id: <1395155913-19296-1-git-send-email-simone.agresta@bticino.it>
X-Mailer: git-send-email 1.7.10.4
X-MIMETrack: Itemize by SMTP Server on NOTES-MTA/BTICINO/IT(Release
	8.5.3FP1|March 07, 2012) at 18/03/2014 16:18:52,
	Serialize by Router on IT-VAR-HUB-01/SRV/GRPLEG(Release 8.5.3FP1|March
	07, 2012) at 18/03/2014 16.18.54,
	Serialize complete at 18/03/2014 16.18.54
X-TNEFEvaluated: 1
Subject: [PATCH v2] alsa-tools: fix build when x11 and gtk+ not available
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
X-List-Received-Date: Tue, 18 Mar 2014 15:19:27 -0000
Content-Type: text/plain;
	charset="UTF-8"

 Updated patch to work with alsa-tools version 1.0.27

Signed-off-by: Simone Agresta <simone.agresta@bticino.it>
---
 meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch |    9 +++++----
 meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb             |    2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch b/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
index 51f934d..11c5ad5 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
+++ b/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
@@ -8,14 +8,15 @@ diff --git a/Makefile b/Makefile
 --- a/Makefile
 +++ b/Makefile
 @@ -1,8 +1,8 @@
- VERSION = 1.0.26.1
+ VERSION = 1.0.27
  TOP = .
--SUBDIRS = ac3dec as10k1 envy24control \
+-SUBDIRS = as10k1 envy24control \
 -   mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
 -   us428control usx2yloader vxloader echomixer \
-+SUBDIRS = ac3dec as10k1 \
+-    hwmixvolume hdajackretask hda-verb
++SUBDIRS = as10k1 \
 +   mixartloader pcxhrloader sb16_csp seq sscape_ctl \
 +   us428control usx2yloader vxloader \
-    hwmixvolume hda-verb
++    hwmixvolume hda-verb
  
  all:
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
index b3c02b3..492f8a4 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
 SECTION = "console/utils"
 LICENSE = "GPLv2 & LGPLv2+"
-DEPENDS = "alsa-lib ncurses gtk+3"
+DEPENDS = "alsa-lib ncurses ${@base_contains('DISTRO_FEATURES', 'x11', 'gtk+3', '', d)}"
 
 LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://ld10k1/COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
-- 
1.7.10.4



Ce message, ainsi que tous les fichiers joints à ce message,
peuvent contenir des informations sensibles et/ ou confidentielles
ne devant pas être divulguées. Si vous n'êtes pas le destinataire
de ce message (ou que vous recevez ce message par erreur), nous
vous remercions de le notifier immédiatement à son expéditeur, et
de détruire ce message. Toute copie, divulgation, modification,
utilisation ou diffusion, non autorisée, directe ou indirecte, de
tout ou partie de ce message, est strictement interdite.

This e-mail, and any document attached hereby, may contain
confidential and/or privileged information. If you are not the
intended recipient (or have received this e-mail in error) please
notify the sender immediately and destroy this e-mail. Any
unauthorized, direct or indirect, copying, disclosure, distribution
or other use of the material or parts thereof is strictly
forbidden.

