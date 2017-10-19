Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2C3A27834A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Oct 2017 20:11:07 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Oct 2017 13:11:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,403,1503385200"; d="scan'208";a="140154947"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga004.jf.intel.com with ESMTP; 19 Oct 2017 13:11:05 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Oct 2017 13:10:47 -0700
Message-Id: <20171019201047.148436-2-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20171019201047.148436-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20171019201047.148436-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 2/2] texinfo: upgrade to 6.5
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
X-List-Received-Date: Thu, 19 Oct 2017 20:11:08 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Besides revision change, this version includes the project M4 macros path into
EXTRA_AUTORECONF which avoid the following compilation issue:

    In file included from ../../../texinfo-6.5/gnulib/lib/mbrtowc.c:21:0:
    ./wchar.h:571:6: error: #if with no expression
     # if
          ^
    Makefile:1378: recipe for target 'mbrtowc.o' failed
    make[4]: *** [mbrtowc.o] Error 1
    make[4]: *** Waiting for unfinished jobs....
    In file included from ../../../texinfo-6.5/gnulib/lib/mbswidth.c:33:0:
    ./wchar.h:571:6: error: #if with no expression
     # if
          ^

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/recipes-extended/texinfo/{texinfo_6.3.bb => texinfo_6.5.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/texinfo/{texinfo_6.3.bb => texinfo_6.5.bb} (94%)

diff --git a/meta/recipes-extended/texinfo/texinfo_6.3.bb b/meta/recipes-extended/texinfo/texinfo_6.5.bb
similarity index 94%
rename from meta/recipes-extended/texinfo/texinfo_6.3.bb
rename to meta/recipes-extended/texinfo/texinfo_6.5.bb
index f58df928aa..f966457f88 100644
--- a/meta/recipes-extended/texinfo/texinfo_6.3.bb
+++ b/meta/recipes-extended/texinfo/texinfo_6.5.bb
@@ -37,13 +37,15 @@ SRC_URI = "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
            ${TARGET_PATCH} \
           "
 
-SRC_URI[md5sum] = "9b08daca9bf8eccae9b0f884aba41f9e"
-SRC_URI[sha256sum] = "300a6ba4958c2dd4a6d5ce60f0a335daf7e379f5374f276f6ba31a221f02f606"
+SRC_URI[md5sum] = "94e8f7149876793030e5518dd8d6e956"
+SRC_URI[sha256sum] = "d34272e4042c46186ddcd66bd5d980c0ca14ff734444686ccf8131f6ec8b1427"
 
 tex_texinfo = "texmf/tex/texinfo"
 
 inherit gettext autotools
 
+EXTRA_AUTORECONF += "-I ${S}/gnulib/m4"
+
 do_configure_prepend () {
 	# autotools_do_configure updates po/Makefile.in.in, we also need
 	# update po_document.
-- 
2.12.3


