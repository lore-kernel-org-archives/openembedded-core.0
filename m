Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 05DAA60557
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 19:40:05 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so39592288wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 12:40:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=fwajo4UVbUn6kQBWicpwqGeZJWm1RF0mQgxnHSXFzq4=;
	b=NEVHkyPfZsavns//0jIh8IzdQtjOsGwRH6lnwWh+nECjF/3czb5Ik6cuCEqkYoJ2JV
	hTup08ZmmyuCNfZGA+k+Wer9dBok7+WveIDPH8i8F4RvEbHO95f6o5VTT8k2zwGSLGyY
	+qq6vk2TDB2h2X/QJrzVS51FCYM1htkNK4tsGjeJYx4JvAF1G5i41CC4pFYw1FQCcjGE
	bbR1Ts2s7llKxok8kth54WCmXZIb2ePIUdTl+Fwi4DyJ8ZO1ZpdfIhZqePHAhrZBnA7X
	FnNgQ6KIZ0g6D85SGeSDdyCmKBvwFQ/dR3YKBPZkidpUCWTiOayNuysdAwbhl7DJqBHm
	5eJg==
X-Gm-Message-State: ALoCoQkJCqVG7vt2/fd0xjQdIjOvM6WzeeifcirB9bEQc2napCKyFXGn7aEAMsAhi/BwrPsk//ap
X-Received: by 10.194.84.211 with SMTP id b19mr50409585wjz.120.1439235605373; 
	Mon, 10 Aug 2015 12:40:05 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id x6sm15310005wiy.6.2015.08.10.12.40.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 10 Aug 2015 12:40:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Aug 2015 20:33:58 +0100
Message-Id: <1439235238-13600-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] weston: improve parallel make race fixes
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
X-List-Received-Date: Mon, 10 Aug 2015 19:40:08 -0000

The original fix is upstream already so mark as a backport, and update the patch
with another race fix.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../wayland/weston/parallelmake.patch              | 38 ++++++++++++++++------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston/parallelmake.patch b/meta/recipes-graphics/wayland/weston/parallelmake.patch
index 34d7512..42b5efb 100644
--- a/meta/recipes-graphics/wayland/weston/parallelmake.patch
+++ b/meta/recipes-graphics/wayland/weston/parallelmake.patch
@@ -1,15 +1,33 @@
-The current approach used by the Makefile ends up installing 
-weston.desktop twice and can give build failures when using 
-parallel make flags. Change to just have one DATA reference.
+Backport two patches from upstream to fix parallel builds
 
-RP
-2015/8/3
-Upstream-Status: Pending
+- mkdir races (2eff22b8e6f6e5255a1915c33dfd91cecf02cbbc)
+- weston.desktop race (315476fa7b1f1c44c1b35116036df54ac5cb9a03)
 
-Index: weston-1.8.0/Makefile.am
-===================================================================
---- weston-1.8.0.orig/Makefile.am
-+++ weston-1.8.0/Makefile.am
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/Makefile.am b/Makefile.am
+index 5819b19..ff13b19 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -20,7 +20,7 @@ weston.ini : $(srcdir)/weston.ini.in
+ 		$< > $@
+ 
+ ivi-shell/weston.ini : $(srcdir)/ivi-shell/weston.ini.in
+-	$(AM_V_GEN)$(SED) \
++	$(AM_V_GEN)$(MKDIR_P) $(dir $@) && $(SED) \
+ 		-e 's|@bindir[@]|$(bindir)|g' \
+ 		-e 's|@abs_top_builddir[@]|$(abs_top_builddir)|g' \
+ 		-e 's|@abs_top_srcdir[@]|$(abs_top_srcdir)|g' \
+@@ -29,7 +29,7 @@ ivi-shell/weston.ini : $(srcdir)/ivi-shell/weston.ini.in
+ 		$< > $@
+ 
+ tests/weston-ivi.ini : $(srcdir)/ivi-shell/weston.ini.in
+-	$(AM_V_GEN)$(SED) \
++	$(AM_V_GEN)$(MKDIR_P) $(dir $@) && $(SED) \
+ 		-e 's|@bindir[@]|$(bindir)|g' \
+ 		-e 's|@abs_top_builddir[@]|$(abs_top_builddir)|g' \
+ 		-e 's|@abs_top_srcdir[@]|$(abs_top_srcdir)|g' \
 @@ -179,8 +179,7 @@ pkgconfigdir = $(libdir)/pkgconfig
  pkgconfig_DATA = src/weston.pc
  
-- 
2.1.4


