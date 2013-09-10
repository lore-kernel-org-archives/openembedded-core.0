Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 98FB8610F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 17:15:16 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id l18so7038566wgh.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 10:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xd2bJJGwXyENkVPFlEF2SVyLEobgzYEmNlriR+vnRY8=;
	b=OuLSWHX0tIXX69Sl9k5UTfS3nnBPCkq7nMcBn3UUxIc65XpunzMPqDT0zU/6dZYdKY
	0tyqLLCQJ29g5xP0GvauJ7IR9hqc3P4f/VuWe/+U2zgOwvpUSZZvviyAYv3rFOU0dS72
	DG4fY6M85F62axzCG0H5OF3wGKq4JIEnZilRbIR3tIWWLhhMMcRgdGMCqSUW/k7KlRa1
	UKURdgJsEITO1jR3+HaGdq8qaNulUB1dXm1BudF014j2xBzEy5dtCgj3sKgSSj7viGIn
	w428mvDRbycd7UWH3GOwjNS5ODPxEPW2aj1BfRKdOUNAIoVvlb+qusotqXb17P7svMAZ
	IelA==
X-Gm-Message-State: ALoCoQmL6oUGF/rvZJnxNaQhTxl1sFuOH7gY5zEkTZqYgOoWP1qgWyPqgZtgsCMn05GZnJpxFOqR
X-Received: by 10.194.23.8 with SMTP id i8mr1442163wjf.68.1378833317782;
	Tue, 10 Sep 2013 10:15:17 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fz8sm4932950wic.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Sep 2013 10:15:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Sep 2013 18:15:06 +0100
Message-Id: <1378833306-27394-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1378833306-27394-1-git-send-email-ross.burton@intel.com>
References: <1378833306-27394-1-git-send-email-ross.burton@intel.com>
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
X-List-Received-Date: Tue, 10 Sep 2013 17:15:17 -0000

Add a fifth optional element of the PACKAGECONFIG flags that can be used to set
RRECOMMENDS_${PN}.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 12c8741..651512a 100644
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
@@ -451,10 +452,13 @@ python () {
                     extradeps.append(items.pop(0))
                 if items:
                     extrardeps.append(items.pop(0))
+                if items:
+                    extrarrecs.append(items.pop(0))
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


