Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RBsjI-0003fI-GQ
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 20:31:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Oct 2011 11:25:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="60635656"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.197])
	by orsmga002.jf.intel.com with ESMTP; 06 Oct 2011 11:25:58 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2011 11:25:56 -0700
Message-Id: <5930749806604b40d1dd6c36ec4b44c2507b4493.1317925433.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1317925433.git.sgw@linux.intel.com>
References: <cover.1317925433.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317925433.git.sgw@linux.intel.com>
References: <cover.1317925433.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] acl/attr: don't make symlink if base_libdir = libdir
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
X-List-Received-Date: Thu, 06 Oct 2011 18:31:36 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/attr/ea-acl.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index 22d7848..6a45858 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -37,6 +37,9 @@ LDFLAGS_append_libc-uclibc = "${@['', ' -lintl '][(bb.data.getVar('PN', d, True)
 EXTRA_OECONF_append_libc-uclibc = "${@['', ' --disable-gettext '][(bb.data.getVar('PN', d, True) == bb.data.getVar('BPN', d , True)) and (bb.data.getVar('USE_NLS', d, True) == 'no')]}"
 
 fix_symlink () {
+	if test "${libdir}" = "${base_libdir}" ; then
+		return
+	fi
 	# Remove bad symlinks & create the correct symlinks
 	if test -L ${libdir}/lib${BPN}.so ; then
 		rm -rf ${libdir}/lib${BPN}.so
-- 
1.7.6.2



