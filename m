Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DFAEB610F5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 15:43:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s76FhuXk010683
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Aug 2014 08:43:56 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 6 Aug 2014 08:43:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Aug 2014 08:43:55 -0700
Message-ID: <1bdd0676a1fc6324a5243010ff35c63502ba6dc9.1407338196.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1407338196.git.liezhi.yang@windriver.com>
References: <cover.1407338196.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] boot-directdisk.bbclass: use local HDDDIR
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
X-List-Received-Date: Wed, 06 Aug 2014 15:44:01 -0000
Content-Type: text/plain

Use $HDDDIR rather than ${HDDDIR} in build_boot_dd(), otherwise may
errors:
- Set these in local.conf:
  IMAGE_FSTYPES += "live"
  IMAGE_FSTYPES += "vmdk"
  AUTO_SYSLINUXMENU = "1"
  NOHDD = "1"

$ bitbake core-image-sato
  DEBUG: Executing shell function build_boot_dd
  install: cannot create regular file
  `/path/to/core-image-sato-1.0/hddimg//vesamenu.c32': No such file or directory
  WARNING: exit code 1 from a shell command.

This because it uses the ${HDDDIR} which is set in bootimg.bbclass, use
local HDDDIR which is set in build_boot_dd() will fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/boot-directdisk.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 5107d7f..09da032 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -102,9 +102,9 @@ build_boot_dd() {
 
 	if [ "${IS_VMDK}" = "true" ]; then
 		if [ "x${AUTO_SYSLINUXMENU}" = "x1" ] ; then
-			install -m 0644 ${STAGING_DIR}/${MACHINE}/usr/share/syslinux/vesamenu.c32 ${HDDDIR}${SYSLINUXDIR}/vesamenu.c32
+			install -m 0644 ${STAGING_DIR}/${MACHINE}/usr/share/syslinux/vesamenu.c32 $HDDDIR/${SYSLINUXDIR}/
 			if [ "x${SYSLINUX_SPLASH}" != "x" ] ; then
-				install -m 0644 ${SYSLINUX_SPLASH} ${HDDDIR}${SYSLINUXDIR}/splash.lss
+				install -m 0644 ${SYSLINUX_SPLASH} $HDDDIR/${SYSLINUXDIR}/splash.lss
 			fi
 		fi
 	fi
-- 
1.7.9.5


