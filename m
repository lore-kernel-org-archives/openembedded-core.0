Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 841C260F18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 18:17:53 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ez12so2518176wid.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 11:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=okPF3A64vJAVm5KblzIbQFZ5zrjI2vF/fgOBHTOhdgU=;
	b=VC7YRg7fl/KjiaNiLQa3cEY+Vf9mqB0KwuXOpsClSNYnPfFmj0ZM1JGKMb33kMeTBN
	JopnbM3vCjMP32WGyTF6nglDDjfqmll+HDwjw9ZYNTP/1YotEldk731K5e42DfAZr5YD
	EDrQTLlhmemHO+MvXaNwtSPb6ZDNM8wdtFD34Y7rQohTIJRJgw2XfFMfERSE63ugXo/L
	+f5yY9B98nAVRAj2kR/FmowYAByzFH8XCz4rT2CT5G6VXP8QOgrDwXByYMRcV1a3mMLQ
	vWgtxpeyCwbMx8WV0sNlDdeTM1RysvdRs5L/0y4C1ihuvyfCeNk8Oqz81UEEwe+DSPL2
	Cwiw==
X-Gm-Message-State: ALoCoQlw7hDyQ6kTCju1WQOuofBFlf/nh5CltvhjoUgzpM1o8CxpOVn+MyjaCJSPSgsapeMRlyXh
X-Received: by 10.180.187.41 with SMTP id fp9mr2421613wic.33.1378923475016;
	Wed, 11 Sep 2013 11:17:55 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fb9sm12442961wid.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 11 Sep 2013 11:17:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2013 19:17:43 +0100
Message-Id: <1378923463-31773-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1378923463-31773-1-git-send-email-ross.burton@intel.com>
References: <1378923463-31773-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] base: add RRECOMMENDS to PACKAGECONFIG
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
X-List-Received-Date: Wed, 11 Sep 2013 18:17:54 -0000

Add a fifth optional element of the PACKAGECONFIG flags that can be used to set
RRECOMMENDS_${PN}.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass |   14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 37dc790..924c45b 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -394,7 +394,7 @@ python () {
     # These take the form:
     #
     # PACKAGECONFIG ??= "<default options>"
-    # PACKAGECONFIG[foo] = "--enable-foo,--disable-foo,foo_depends,foo_runtime_depends"
+    # PACKAGECONFIG[foo] = "--enable-foo,--disable-foo,foo_depends,foo_runtime_depends,foo_runtime_recommends"
     pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
     if pkgconfigflags:
         pkgconfig = (d.getVar('PACKAGECONFIG', True) or "").split()
@@ -420,7 +420,7 @@ python () {
         def appendVar(varname, appends):
             if not appends:
                 return
-            if "DEPENDS_" in varname:
+            if "DEPENDS_" in varname or "RRECOMMENDS_" in varname:
                 if pn.startswith("nativesdk-"):
                     appends = expandFilter(appends, "", "nativesdk-")
                 if pn.endswith("-native"):
@@ -432,14 +432,15 @@ python () {
 
         extradeps = []
         extrardeps = []
+        extrarrecs = []
         extraconf = []
         for flag, flagval in pkgconfigflags.items():
             if flag == "defaultval":
                 continue
             items = flagval.split(",")
             num = len(items)
-            if num > 4:
-                bb.error("Only enable,disable,depend,rdepend can be specified!")
+            if num > 5:
+                bb.error("Only enable,disable,depend,rdepend,rrecommend can be specified!")
 
             if flag in pkgconfig:
                 if items:
@@ -457,10 +458,15 @@ python () {
                     item = items.pop(0)
                     if item:
                         extrardeps.append(item)
+                if items:
+                    item = items.pop(0)
+                    if item:
+                        extrarrecs.append(item)
             elif num >= 2 and items[1]:
                     extraconf.append(items[1])
         appendVar('DEPENDS', extradeps)
         appendVar('RDEPENDS_${PN}', extrardeps)
+        appendVar('RRECOMMENDS_${PN}', extrarrecs)
         if bb.data.inherits_class('cmake', d):
             appendVar('EXTRA_OECMAKE', extraconf)
         else:
-- 
1.7.10.4


