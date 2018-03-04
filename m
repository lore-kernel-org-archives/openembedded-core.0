Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 6200E78A86
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 12:42:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Mar 2018 04:42:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,422,1515484800"; d="scan'208";a="179744502"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga004.jf.intel.com with ESMTP; 04 Mar 2018 04:42:35 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 04:41:53 -0800
Message-Id: <c718623d9f15c5cafad5c3473c87c8848e42a5e1.1520166347.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1520166347.git.timothy.t.orling@linux.intel.com>
References: <cover.1520166347.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH 5/7] libxml-parser-perl: inherit ptest-perl
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
X-List-Received-Date: Sun, 04 Mar 2018 12:42:33 -0000

* Enable ptest by inheriting new ptest-perl.bbclass

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
index cc3a660f7d..c5e0ae6769 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
@@ -14,7 +14,7 @@ S = "${WORKDIR}/XML-Parser-${PV}"
 
 EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR} CC='${CC}' LD='${CCLD}' FULL_AR='${AR}'"
 
-inherit cpan
+inherit cpan ptest-perl
 
 # fix up sub MakeMaker project as arguments don't get propagated though
 # see https://rt.cpan.org/Public/Bug/Display.html?id=28632
@@ -34,4 +34,13 @@ do_compile_class-native() {
 	cpan_do_compile
 }
 
+do_install_ptest() {
+	sed -i -e "s:/usr/local/bin/perl:/usr/bin/perl:g" ${B}/samples/xmlstats
+	sed -i -e "s:/usr/local/bin/perl:/usr/bin/perl:g" ${B}/samples/xmlfilter
+	sed -i -e "s:/usr/local/bin/perl:/usr/bin/perl:g" ${B}/samples/xmlcomments
+	sed -i -e "s:/usr/local/bin/perl:/usr/bin/perl:g" ${B}/samples/canonical
+	cp -r ${B}/samples ${D}${PTEST_PATH}
+	chown -R root:root ${D}${PTEST_PATH}/samples
+}
+
 BBCLASSEXTEND="native nativesdk"
-- 
2.14.3


