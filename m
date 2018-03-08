Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0399E789FB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24054091"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:40 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:18:00 +0200
Message-Id: <20180308181804.31261-38-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 38/42] irda-utils: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:40 -0000

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
 .../irda-utils/irda-utils-0.9.18/ldflags.patch     | 64 +++++++++++++---------
 1 file changed, 38 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch
index e95fe35f8f8..b246de8f5fd 100644
--- a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch
+++ b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch
@@ -3,72 +3,84 @@ Obey LDFLAGS
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
 Upstream-Status: Pending
 
+Index: irda-utils-0.9.18/findchip/Makefile
+===================================================================
 --- irda-utils-0.9.18.orig/findchip/Makefile
 +++ irda-utils-0.9.18/findchip/Makefile
 @@ -65,5 +65,5 @@ install: findchip
-
- gfindchip: gfindchip.c
-	$(prn_cc)
+ 
+ gfindchip: gfindchip.c 
+ 	$(prn_cc)
 -	$(ECMD))$(CC) $(CFLAGS) `gtk-config --cflags`  $< -o $@ `gtk-config --libs`
 +	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) `gtk-config --cflags`  $< -o $@ `gtk-config --libs`
-
+ 
+Index: irda-utils-0.9.18/irattach/Makefile
+===================================================================
 --- irda-utils-0.9.18.orig/irattach/Makefile
 +++ irda-utils-0.9.18/irattach/Makefile
 @@ -49,13 +49,13 @@ all: $(TARGETS)
-
+ 
  irattach: irattach.o util.o
-	$(prn_cc_o)
+ 	$(prn_cc_o)
 -	$(ECMD)$(CC) $(CFLAGS) irattach.o util.o -o $@
 +	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) irattach.o util.o -o $@
-
-
-
+ 
+ 
+ 
  dongle_attach: dongle_attach.o
-	$(prn_cc_o)
+ 	$(prn_cc_o)
 -	$(ECMD)$(CC) $(CFLAGS) dongle_attach.o -o $@
 +	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) dongle_attach.o -o $@
-
-
+ 
+ 
  install: $(TARGETS)
+Index: irda-utils-0.9.18/irdadump/Makefile
+===================================================================
 --- irda-utils-0.9.18.orig/irdadump/Makefile
 +++ irda-utils-0.9.18/irdadump/Makefile
 @@ -40,7 +40,7 @@ lib_irdadump.a: $(LIBIRDADUMP_OBJS)
-
+ 
  irdadump: $(IRDADUMP_OBJS) $(LIBIRDADUMP_TARGET)
-	$(prn_cc_o)
+ 	$(prn_cc_o)
 -	$(ECMD)$(CC) $(CFLAGS) `pkg-config --libs glib-2.0` -o  $(IRDADUMP_TARGET) $< $(LIBIRDADUMP_TARGET)
 +	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) `pkg-config --libs glib-2.0` -o  $(IRDADUMP_TARGET) $< $(LIBIRDADUMP_TARGET)
-
-
+ 
+ 
  .c.o:
+Index: irda-utils-0.9.18/irdaping/Makefile
+===================================================================
 --- irda-utils-0.9.18.orig/irdaping/Makefile
 +++ irda-utils-0.9.18/irdaping/Makefile
 @@ -56,7 +56,7 @@ all: $(TARGETS)
-
+ 
  irdaping: $(OBJS)
-	$(prn_cc_o)
+ 	$(prn_cc_o)
 -	$(ECMD)$(CC) $(CFLAGS) $(OBJS) -o $@
 +	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $@
-
-
+ 
+ 
  .c.o:
+Index: irda-utils-0.9.18/irnetd/Makefile
+===================================================================
 --- irda-utils-0.9.18.orig/irnetd/Makefile
 +++ irda-utils-0.9.18/irnetd/Makefile
 @@ -50,7 +50,7 @@ all: $(TARGETS)
-
+ 
  irnetd: $(OBJS)
-	$(prn_cc_o)
+ 	$(prn_cc_o)
 -	$(ECMD)$(CC) $(CFLAGS) $(OBJS) -o $@
 +	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $@
-
-
+ 
+ 
  install: irnetd
+Index: irda-utils-0.9.18/psion/Makefile
+===================================================================
 --- irda-utils-0.9.18.orig/psion/Makefile
 +++ irda-utils-0.9.18/psion/Makefile
 @@ -25,4 +25,4 @@ install: $(PSION_TARGETS)
  CFLAGS += -g -I../include -Wall -Wstrict-prototypes $(RPM_OPT_FLAGS)
- irpsion5:
-	$(prn_cc_o)
+ irpsion5: 
+ 	$(prn_cc_o)
 -	$(ECMD)$(CC) $(CFLAGS) $(PSION_SRC) -o $@
 \ No newline at end of file
 +	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) $(PSION_SRC) -o $@
-- 
2.16.1


