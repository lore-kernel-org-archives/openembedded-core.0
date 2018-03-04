Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 0B1CF60269
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 12:42:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Mar 2018 04:42:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,422,1515484800"; d="scan'208";a="179744492"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga004.jf.intel.com with ESMTP; 04 Mar 2018 04:42:30 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 04:41:52 -0800
Message-Id: <3f13984481fcfd6fba4b8191354d6c398b1554b2.1520166347.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1520166347.git.timothy.t.orling@linux.intel.com>
References: <cover.1520166347.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH 4/7] liburi-perl: inherit ptest-perl
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
X-List-Received-Date: Sun, 04 Mar 2018 12:42:29 -0000

* Enable ptest by inheriting new ptest-perl.bbclass
* Remove t/cwd.t and t/file.t which require "-T"
  (taint) command line option as they will fail.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/perl/liburi-perl_1.73.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/liburi-perl_1.73.bb b/meta/recipes-devtools/perl/liburi-perl_1.73.bb
index 7cdf6dc61d..49238f3df5 100644
--- a/meta/recipes-devtools/perl/liburi-perl_1.73.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_1.73.bb
@@ -20,11 +20,19 @@ S = "${WORKDIR}/URI-${PV}"
 
 EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
 
-inherit cpan
+inherit cpan ptest-perl
 
 do_compile() {
 	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
 	cpan_do_compile
 }
 
+do_install_prepend() {
+	# these tests require "-T" (taint) command line option
+	rm -rf ${B}/t/cwd.t
+	rm -rf ${B}/t/file.t
+}
+
+RDEPENDS_${PN}-ptest += "libtest-needs-perl"
+
 BBCLASSEXTEND = "native"
-- 
2.14.3


