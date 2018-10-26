Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 457F5745AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 10:28:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9QASTqT022100
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 03:28:29 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 26 Oct 2018 03:28:28 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Oct 2018 17:45:37 +0800
Message-ID: <4009fec3e60f4b806c3d030fb55464efa1203b52.1540547104.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1540547104.git.kai.kang@windriver.com>
References: <cover.1540547104.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] toolchain-scripts.bbclass: fix paths of siteconfig files
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
X-List-Received-Date: Fri, 26 Oct 2018 10:28:28 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It can't find right siteconfig files in toolchain-scripts.bbclass after
adapting to RSS. Correct the paths.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/toolchain-scripts.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 6d1ba69473..cfc5eb9fae 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -158,7 +158,7 @@ EOF
 
 #we get the cached site config in the runtime
 TOOLCHAIN_CONFIGSITE_NOCACHE = "${@siteinfo_get_files(d)}"
-TOOLCHAIN_CONFIGSITE_SYSROOTCACHE = "${STAGING_DIR}/${MLPREFIX}${MACHINE}/${target_datadir}/${TARGET_SYS}_config_site.d"
+TOOLCHAIN_CONFIGSITE_SYSROOTCACHE = "${COMPONENTS_DIR}/${DEFAULTTUNE}"
 TOOLCHAIN_NEED_CONFIGSITE_CACHE ??= "virtual/${MLPREFIX}libc ncurses"
 DEPENDS += "${TOOLCHAIN_NEED_CONFIGSITE_CACHE}"
 
@@ -178,11 +178,12 @@ toolchain_create_sdk_siteconfig () {
 		# Resolve virtual/* names to the real recipe name using sysroot-providers info
 		case $sitefile in virtual/*)
 			sitefile=`echo $sitefile | tr / _`
-			sitefile=`cat ${STAGING_DIR_TARGET}/sysroot-providers/$sitefile`
+			sitefile=`cat ${STAGING_DIR_TARGET}/sysroot-providers/$sitefile | sed "s/^${MLPREFIX}//"`
 		esac
 
-		if [ -r ${TOOLCHAIN_CONFIGSITE_SYSROOTCACHE}/${sitefile}_config ]; then
-			cat ${TOOLCHAIN_CONFIGSITE_SYSROOTCACHE}/${sitefile}_config >> $siteconfig
+		sitefile_config=${TOOLCHAIN_CONFIGSITE_SYSROOTCACHE}/${MLPREFIX}${sitefile}/${target_datadir}/${TARGET_SYS}_config_site.d/${sitefile}_config
+		if [ -r $sitefile_config ]; then
+			cat $sitefile_config >> $siteconfig
 		fi
 	done
 }
-- 
2.18.0


