Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 29D2F7897E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 15:38:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Mar 2018 07:38:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,412,1515484800"; d="scan'208";a="208390081"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 02 Mar 2018 07:38:13 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Mar 2018 17:32:20 +0200
Message-Id: <20180302153220.16494-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
Subject: [PATCH] perl: use parallel build where possible
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
X-List-Received-Date: Fri, 02 Mar 2018 15:38:13 -0000

While the upstream just runs a number of make tasks hardcoded to a single thread
in succession, we can add '-j n_threads' to a few of them. The benefit
is real: on my machine the do_compile() time goes from 250 seconds to about 90.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/perl/perl_5.24.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index f13a63a80a3..67cc8d668db 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -184,6 +184,11 @@ do_compile() {
         # Fix to avoid recursive substitution of path
         sed -i -e 's|(@libpath, ".*"|(@libpath, "${STAGING_LIBDIR}"|g' cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
 
+        # Build auxillary make targets (more/more2/more3/more4) in parallel.
+        # Unfortunately the core target will race, and so remains single-threaded.
+        # Still, this cuts do_compile() time from 250 seconds to about 90.
+        sed -i -e 's, more, ${PARALLEL_MAKE} more,g' Cross/Makefile
+
         cd Cross
         oe_runmake perl LD="${CCLD}"
 }
-- 
2.15.1


