Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrP5R-0004Vz-Dj
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 09:54:21 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Jul 2012 00:43:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169736812"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by azsmga001.ch.intel.com with ESMTP; 18 Jul 2012 00:43:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 00:42:42 -0700
Message-Id: <ee4a44d60de9535a6aca59a6177494fb1717cb40.1342597081.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
References: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342597081.git.sgw@linux.intel.com>
References: <cover.1342597081.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/18] webkit-gtk: remove no-parallel bodge
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
X-List-Received-Date: Wed, 18 Jul 2012 07:54:23 -0000

From: Ross Burton <ross.burton@intel.com>

This workaround was originally for GNU Make 3.82 which upstream was blaming
for a parallel build failure.  Since then I've changed numerous variables
and now parallel builds are working with 3.82 (and succeed in 20 minutes
instead of 2 hours).

Revert the change until we've more data about what causes the breakage, then
we can bring it back with more finesse.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
index b2bfd24..3cef0e4 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
@@ -29,11 +29,6 @@ inherit autotools lib_package pkgconfig
 
 S = "${WORKDIR}/webkit-${PV}/"
 
-# GNU Make 3.82 has a bug where it incorrectly prunes intermediate targets in
-# parallel builds.  See https://bugs.webkit.org/show_bug.cgi?id=79498 for the
-# WebKitGTK bug, and savannah.gnu.org/bugs/?30653 for the upstream bug.
-PARALLEL_MAKE = ""
-
 EXTRA_OECONF = "\
                 --enable-debug=no \
                 --enable-svg \
-- 
1.7.7.6



