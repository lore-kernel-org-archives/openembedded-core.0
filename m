Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 74B4978A2C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24054083"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:38 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:59 +0200
Message-Id: <20180308181804.31261-37-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 37/42] zlib: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:38 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../zlib/zlib-1.2.11/remove.ldconfig.call.patch             | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/zlib/zlib-1.2.11/remove.ldconfig.call.patch b/meta/recipes-core/zlib/zlib-1.2.11/remove.ldconfig.call.patch
index 403b4825c9b..7ccbe1f44c6 100644
--- a/meta/recipes-core/zlib/zlib-1.2.11/remove.ldconfig.call.patch
+++ b/meta/recipes-core/zlib/zlib-1.2.11/remove.ldconfig.call.patch
@@ -7,14 +7,15 @@ So remove ldconfig call from make install-libs
 
 Upstream-Status: Inappropriate [disable feature]
 
-diff -uNr zlib-1.2.6.orig/Makefile.in zlib-1.2.6/Makefile.in
---- zlib-1.2.6.orig/Makefile.in	2012-01-28 23:48:50.000000000 +0100
-+++ zlib-1.2.6/Makefile.in	2012-02-13 15:38:20.577700723 +0100
-@@ -199,7 +199,6 @@
+Index: zlib-1.2.11/Makefile.in
+===================================================================
+--- zlib-1.2.11.orig/Makefile.in
++++ zlib-1.2.11/Makefile.in
+@@ -322,7 +322,6 @@ install-libs: $(LIBS)
  	  rm -f $(DESTDIR)$(sharedlibdir)/$(SHAREDLIB) $(DESTDIR)$(sharedlibdir)/$(SHAREDLIBM); \
  	  ln -s $(SHAREDLIBV) $(DESTDIR)$(sharedlibdir)/$(SHAREDLIB); \
  	  ln -s $(SHAREDLIBV) $(DESTDIR)$(sharedlibdir)/$(SHAREDLIBM); \
 -	  ($(LDCONFIG) || true)  >/dev/null 2>&1; \
  	fi
- 	cp zlib.3 $(DESTDIR)$(man3dir)
- 	chmod 644 $(DESTDIR)$(man3dir)/zlib.3
+ 	rm -f $(DESTDIR)$(man3dir)/zlib.3
+ 	cp $(SRCDIR)zlib.3 $(DESTDIR)$(man3dir)
-- 
2.16.1


