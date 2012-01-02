Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RholJ-0008H9-IT
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jan 2012 21:45:41 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Jan 2012 12:38:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108039311"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jan 2012 12:38:15 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 12:38:01 -0800
Message-Id: <3dfd63a9d3cd981ee53a5f56a4ff2733fa721f76.1325536389.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <0a113cb0a2defae38913df19d2bd3d6e378e370f.1325536389.git.nitin.a.kamble@intel.com>
References: <0a113cb0a2defae38913df19d2bd3d6e378e370f.1325536389.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1325536389.git.nitin.a.kamble@intel.com>
References: <cover.1325536389.git.nitin.a.kamble@intel.com>
Subject: [PATCH v2 05/15] autotools.bbclass: fix cp error for empty dir
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
X-List-Received-Date: Mon, 02 Jan 2012 20:45:41 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

the .../usr/share/aclocal is empty for build from scratch. so avoid cp
error if the directory is empty.

Fixes this error, which is thrown before pseudo is built:

| cp: cannot stat
`/builddisk/build/build0/tmp/sysroots/x86_64-linux/usr/share/aclocal/*':
No such file or directory
NOTE: package libtool-native-2.4.2-r0.0: task do_configure: Failed

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/autotools.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 7536bac..2f462ff 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -122,7 +122,9 @@ autotools_do_configure() {
 			# We avoid this by taking a copy here and then files cannot disappear.
 			if [ -d ${STAGING_DATADIR}/aclocal ]; then
 				mkdir -p ${B}/aclocal-copy/
-				cp ${STAGING_DATADIR}/aclocal/* ${B}/aclocal-copy/
+				# for scratch build this directory can be empty
+				# so avoid cp's no files to copy error
+				cp -r ${STAGING_DATADIR}/aclocal/. ${B}/aclocal-copy/
 				acpaths="$acpaths -I ${B}/aclocal-copy/"
 			fi
 			# autoreconf is too shy to overwrite aclocal.m4 if it doesn't look
-- 
1.7.6.4



