Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CC2346E9F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 18:01:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 11 Feb 2014 09:56:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,826,1384329600"; d="scan'208";a="473523724"
Received: from rachelda-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.144])
	by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2014 10:00:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Feb 2014 18:00:15 +0000
Message-Id: <1392141615-31963-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] classes/cpan-base: fix signatures changing when perl is in sysroot
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
X-List-Received-Date: Tue, 11 Feb 2014 18:01:19 -0000

The previous fix for this same issue (OE-Core rev
f31f6a70ec24e8c9515d69c5092e15effc5e7d4d) was not sufficient - we are
setting the PERLVERSION variable from the get_perl_version function, but
we're setting it using immediate expansion; thus the value is going into
the signature and is still different between the time the recipe is
cached on an empty TMPDIR and after perl is in the sysroot and we run
bitbake -S perf. We could remove the immediate expansion, but that would
mean the get_perl_version function would be called more often, so just set
vardepvalue on the PERLVERSION variable to fix the problem instead.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/cpan-base.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cpan-base.bbclass b/meta/classes/cpan-base.bbclass
index aa502d5..d9817ba 100644
--- a/meta/classes/cpan-base.bbclass
+++ b/meta/classes/cpan-base.bbclass
@@ -44,6 +44,7 @@ def is_target(d):
 
 PERLLIBDIRS := "${@perl_get_libdirs(d)}"
 PERLVERSION := "${@get_perl_version(d)}"
+PERLVERSION[vardepvalue] = ""
 
 FILES_${PN}-dbg += "${PERLLIBDIRS}/auto/*/.debug \
                     ${PERLLIBDIRS}/auto/*/*/.debug \
-- 
1.8.5.3


