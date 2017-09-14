Return-Path: <cinly.ooi@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 55D9D71A75
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 09:35:49 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Sep 2017 02:35:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,392,1500966000"; d="scan'208";a="149082186"
Received: from cinlyooi-mac03.png.intel.com (HELO ubuntu.png.intel.com)
	([10.221.16.64])
	by orsmga005.jf.intel.com with ESMTP; 14 Sep 2017 02:35:49 -0700
From: cinly.ooi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Sep 2017 17:35:48 +0800
Message-Id: <1505381748-7313-1-git-send-email-cinly.ooi@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] bzip2: Create Makefile for run-ptest
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
X-List-Received-Date: Thu, 14 Sep 2017 09:35:50 -0000

From: Ooi Cinly <cinly.ooi@intel.com>

To improve binary reproducibility, only the
relevent part of the Makefile in bzip2-ptest
package that run-ptest needs are copied to
the destination directory.

bzip2-ptest requires Makefile. The original
Makefile contains references to build host.
By copying only the relevent part,
we avoid those references making their way
into the target system

Used Makefile.am as the source to extract
the revelent part instead of Makefile as
it is easier to parse than Makefile.

A redundant command  in do_install_ptest()
that repeat the copying of Makefile that
was already copied by  Makefile's install-ptest
step is removed because it now interfers with
the creation of the new Makefile by
make's install-ptest.

[YOCTO #11596]

Signed-off-by: Ooi Cinly <cinly.ooi@intel.com>
---
 meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am | 3 ++-
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb          | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am b/meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am
index 05d389f..dcf6458 100644
--- a/meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am
+++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am
@@ -48,7 +48,8 @@ runtest:
 	else echo "FAIL: sample3 decompress"; fi
 
 install-ptest:
-	cp $(srcdir)/Makefile		$(DESTDIR)/
+	sed  -n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \
+           $(srcdir)/Makefile.am      > $(DESTDIR)/Makefile
 	cp $(srcdir)/sample1.ref	$(DESTDIR)/
 	cp $(srcdir)/sample2.ref	$(DESTDIR)/
 	cp $(srcdir)/sample3.ref	$(DESTDIR)/
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index 0512a75..de668d6 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -34,7 +34,6 @@ ALTERNATIVE_${PN} = "bunzip2 bzcat"
 EXTRA_OECONF_append_class-native = " --bindir=${STAGING_BINDIR_NATIVE}/${PN}"
 
 do_install_ptest () {
-	cp -f ${B}/Makefile ${D}${PTEST_PATH}/Makefile
 	sed -i -e "s|^Makefile:|_Makefile:|" ${D}${PTEST_PATH}/Makefile
 }
 
-- 
2.7.4


