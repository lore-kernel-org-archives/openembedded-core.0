Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RkUmY-00042N-3v
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 07:02:02 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2012 21:54:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110535255"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.28])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jan 2012 21:54:20 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2012 21:54:04 -0800
Message-Id: <553deffc8040afabd56b1c1d87a8a8d24bbae5d0.1326174744.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/22] update-modules: don't run modutils.sh if systemd is installed
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
X-List-Received-Date: Tue, 10 Jan 2012 06:02:02 -0000

From: Steve Sakoman <steve@sakoman.com>

systemd has its own mechanism for loading kernel modules at startup

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../update-modules-1.0/update-modules              |    3 ++-
 .../update-modules/update-modules_1.0.bb           |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/update-modules/update-modules-1.0/update-modules b/meta/recipes-kernel/update-modules/update-modules-1.0/update-modules
index 636fe1c..7ee7df8 100755
--- a/meta/recipes-kernel/update-modules/update-modules-1.0/update-modules
+++ b/meta/recipes-kernel/update-modules/update-modules-1.0/update-modules
@@ -181,7 +181,8 @@ fi
 mv "$MODCONFTMPFILE" "$MODCONFFILE"
 mv "$MODULESTMPFILE" "$MODULESFILE"
 
-if [ $first_time -eq 1 ]; then
+# Don't run modutils.sh if systemd is installed
+if [ $first_time -eq 1 ] && [ ! -e /bin/systemctl ]; then
   /etc/init.d/modutils.sh || true
 fi
 
diff --git a/meta/recipes-kernel/update-modules/update-modules_1.0.bb b/meta/recipes-kernel/update-modules/update-modules_1.0.bb
index dc44965..d9697de 100644
--- a/meta/recipes-kernel/update-modules/update-modules_1.0.bb
+++ b/meta/recipes-kernel/update-modules/update-modules_1.0.bb
@@ -4,7 +4,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
 RDEPENDS_${PN} = "module-init-tools-depmod"
-PR = "r11"
+
+PR = "r12"
 
 SRC_URI = "file://update-modules \
            file://COPYING.GPL"
-- 
1.7.6.5



