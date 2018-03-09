Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BA9A678958
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32651977"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:17 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:55:56 +0200
Message-Id: <20180309185614.31113-18-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 18/36] cups: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:17 -0000

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
 .../0001-don-t-try-to-run-generated-binaries.patch     | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/cups/cups/0001-don-t-try-to-run-generated-binaries.patch b/meta/recipes-extended/cups/cups/0001-don-t-try-to-run-generated-binaries.patch
index 5379eb6aa2b..db013cf08c4 100644
--- a/meta/recipes-extended/cups/cups/0001-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups/0001-don-t-try-to-run-generated-binaries.patch
@@ -10,12 +10,12 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  ppdc/Makefile |   30 +++++++++++++++---------------
  1 files changed, 15 insertions(+), 15 deletions(-)
 
-Index: cups-2.0.0/ppdc/Makefile
+Index: cups-2.2.6/ppdc/Makefile
 ===================================================================
---- cups-2.0.0.orig/ppdc/Makefile
-+++ cups-2.0.0/ppdc/Makefile
-@@ -242,8 +242,8 @@ genstrings:		genstrings.o libcupsppdc.a
- 	$(CXX) $(ARCHFLAGS) $(LDFLAGS) -o genstrings genstrings.o \
+--- cups-2.2.6.orig/ppdc/Makefile
++++ cups-2.2.6/ppdc/Makefile
+@@ -228,8 +228,8 @@ genstrings:		genstrings.o libcupsppdc.a
+ 	$(LD_CXX) $(ARCHFLAGS) $(LDFLAGS) -o genstrings genstrings.o \
  		libcupsppdc.a ../cups/$(LIBCUPSSTATIC) $(LIBGSSAPI) $(SSLLIBS) \
  		$(DNSSDLIBS) $(COMMONLIBS) $(LIBZ)
 -	echo Generating localization strings...
@@ -25,8 +25,8 @@ Index: cups-2.0.0/ppdc/Makefile
  
  
  #
-@@ -260,9 +260,9 @@ ppdc-static:		ppdc.o libcupsppdc.a ../cu
- 	$(CXX) $(ARCHFLAGS) $(LDFLAGS) -o ppdc-static ppdc.o libcupsppdc.a \
+@@ -246,9 +246,9 @@ ppdc-static:		ppdc.o libcupsppdc.a ../cu
+ 	$(LD_CXX) $(ARCHFLAGS) $(LDFLAGS) -o ppdc-static ppdc.o libcupsppdc.a \
  		../cups/$(LIBCUPSSTATIC) $(LIBGSSAPI) $(SSLLIBS) $(DNSSDLIBS) \
  		$(COMMONLIBS) $(LIBZ)
 -	echo Testing PPD compiler...
@@ -38,8 +38,8 @@ Index: cups-2.0.0/ppdc/Makefile
  
  
  #
-@@ -288,17 +288,17 @@ ppdi-static:		ppdc-static ppdi.o libcups
- 	$(CXX) $(ARCHFLAGS) $(LDFLAGS) -o ppdi-static ppdi.o libcupsppdc.a \
+@@ -274,17 +274,17 @@ ppdi-static:		ppdc-static ppdi.o libcups
+ 	$(LD_CXX) $(ARCHFLAGS) $(LDFLAGS) -o ppdi-static ppdi.o libcupsppdc.a \
  		../cups/$(LIBCUPSSTATIC) $(LIBGSSAPI) $(SSLLIBS) $(DNSSDLIBS) \
  		$(COMMONLIBS) $(LIBZ)
 -	echo Testing PPD importer...
-- 
2.16.1


