Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E48D26E630
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 06:40:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8F6eCkh003322
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 14 Sep 2015 23:40:12 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 14 Sep 2015 23:40:12 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <sgw@linux.intel.com>
Date: Tue, 15 Sep 2015 14:34:24 +0800
Message-ID: <1442298864-25559-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] perf: fix the install-python_ext on upstream kernel
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
X-List-Received-Date: Tue, 15 Sep 2015 06:40:14 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

The Perf source code between Yocto and upstream are different, like below
commit is not in upstream, so broaden the "--root" replacement to Makefile*

   commit 33e96fb1e2d77541e81eb341ccd3fbe9419e4c9a
   Author: Tom Zanussi <tom.zanussi@intel.com>
   Date:   Tue Jul 3 13:07:23 2012 -0500

      perf: change --root to --prefix for python install

      Otherwise we get the sysroot path appended to the build path, not what
      we want.

      Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index adb3a2c..241cca9 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -148,7 +148,7 @@ do_configure_prepend () {
             ${S}/tools/perf/Makefile.perf
     fi
     sed -i -e "s,--root='/\$(DESTDIR_SQ)',--prefix='\$(DESTDIR_SQ)/usr' --install-lib='\$(DESTDIR)\$(PYTHON_SITEPACKAGES_DIR)',g" \
-        ${S}/tools/perf/Makefile
+        ${S}/tools/perf/Makefile*
 
     if [ -e "${S}/tools/build/Makefile.build" ]; then
         sed -i -e 's,\ .config-detected, $(OUTPUT)/config-detected,g' \
-- 
1.9.1


