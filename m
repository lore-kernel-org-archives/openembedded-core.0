Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id D6240705B9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 16:40:39 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id x13so5843879wgg.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 09:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=q7m/BHqBiFZ6tRAZnThkBwgMMfGVehzBlWA6Vg9zJtQ=;
	b=adfZ3Qjj06p7HrVHr9g1YFpbnIwFzRX2EJJDGdnAqvHg8plEd6LMF3tch2xBUScTSN
	AUDbJz3acAw0x6IBL4QD6PxBiOXO4iviHoFFdFGFq+9phFAMJdvWGT6tOVOki0RZpclv
	npHh7jsbDTipYiA3j6RS6AQTBb/io++goAsrqpeYcsv2T8WQaXnQQWKdFYLJ77RuTVV7
	yGj8XKKj/kMKmK1/AxWsjNJ7jvNRaUE2IlB5jAx79xn21eB9x1A3H/xVjYbkodqyR3rr
	Gn/HFazt1U4ZEYycoOIOlU28f4btH2e7Kpv/kujDAk7XzQHXVMei5PempvRGhjXapIra
	rapg==
X-Gm-Message-State: ALoCoQllpgrxS19qUbkiW4ux5YyrWAA0sv9+hBwGFAEs6+nQBkQxmleYpYrvKbjClrvYVtTcwdJK
X-Received: by 10.194.109.71 with SMTP id hq7mr13522763wjb.114.1405442439829; 
	Tue, 15 Jul 2014 09:40:39 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	eh10sm40897932wic.0.2014.07.15.09.40.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 09:40:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 17:40:33 +0100
Message-Id: <1405442433-22848-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1405442433-22848-1-git-send-email-ross.burton@intel.com>
References: <1405442433-22848-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][V2 3/3] xorg-driver: use PACKAGEFUNCS instead of populate_packages_prepend
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
X-List-Received-Date: Tue, 15 Jul 2014 16:40:41 -0000

The dependency adding function has nothing to do with package splitting, so move
it to a PACKAGEFUNC.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-driver/xorg-driver-common.inc |    4 ++--
 meta/recipes-graphics/xorg-driver/xorg-driver-input.inc  |    5 +++--
 meta/recipes-graphics/xorg-driver/xorg-driver-video.inc  |    5 +++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index b46974b..17fac8b 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -25,8 +25,8 @@ do_install_append() {
 }
 
 # Function to add the relevant ABI dependency to drivers, which should be called
-# from a populate_packages append/prepend.
-def add_abi_depends(d, name):
+# from a PACKAGEFUNC.
+def _add_xorg_abi_depends(d, name):
     # Map of ABI names exposed in the dependencies to pkg-config variables
     abis = {
       "video": "abi_videodrv",
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
index a544d71..fbec064 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
@@ -2,9 +2,10 @@ include xorg-driver-common.inc
 
 DEPENDS += "inputproto kbproto "
 
-python populate_packages_prepend() {
-    add_abi_depends(d, "input")
+python add_xorg_abi_depends() {
+    _add_xorg_abi_depends(d, "input")
 }
+PACKAGEFUNCS =+ "add_xorg_abi_depends"
 
 FILES_${PN} += " ${libdir}/xorg/modules/input/*.so"
 FILES_${PN}-dbg += " ${libdir}/xorg/modules/input/.debug"
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc
index 4fe3349..38281e0 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc
@@ -2,6 +2,7 @@ include xorg-driver-common.inc
 
 DEPENDS =+ "renderproto videoproto xextproto fontsproto"
 
-python populate_packages_prepend() {
-    add_abi_depends(d, "video")
+python add_xorg_abi_depends() {
+    _add_xorg_abi_depends(d, "video")
 }
+PACKAGEFUNCS =+ "add_xorg_abi_depends"
-- 
1.7.10.4


