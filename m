Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 8DA0878563
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 12:42:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Mar 2018 04:42:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,422,1515484800"; d="scan'208";a="179744482"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga004.jf.intel.com with ESMTP; 04 Mar 2018 04:42:26 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 04:41:51 -0800
Message-Id: <3310f09cbf7dea7b4cf5d1f9d96222d1d772f120.1520166347.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1520166347.git.timothy.t.orling@linux.intel.com>
References: <cover.1520166347.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH 3/7] liberror-perl: inherit ptest-perl
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
X-List-Received-Date: Sun, 04 Mar 2018 12:42:24 -0000

* Enable ptest by inheriting new ptest-perl.bbclass

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/perl/liberror-perl_0.17025.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/liberror-perl_0.17025.bb b/meta/recipes-devtools/perl/liberror-perl_0.17025.bb
index 251b13195a..f6dc30d077 100644
--- a/meta/recipes-devtools/perl/liberror-perl_0.17025.bb
+++ b/meta/recipes-devtools/perl/liberror-perl_0.17025.bb
@@ -18,11 +18,16 @@ SRC_URI[sha256sum] = "6c9f474ad3d4fe0cabff6b6be532cb1dd348245986d4a6b600ad921d5c
 
 S = "${WORKDIR}/Error-${PV}"
 
-inherit cpan
+inherit cpan ptest-perl
 
 do_compile() {
 	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
 	cpan_do_compile
 }
 
+do_install_prepend() {
+	# test requires "-T" (taint) command line option
+	rm -rf ${B}/t/pod-coverage.t
+}
+
 BBCLASSEXTEND = "native"
-- 
2.14.3


