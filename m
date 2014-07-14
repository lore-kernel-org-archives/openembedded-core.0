Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8B170394
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 14:31:34 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so2695099wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 07:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=q7m/BHqBiFZ6tRAZnThkBwgMMfGVehzBlWA6Vg9zJtQ=;
	b=l/3i1h7qYJmba28NQ+kBK0pKzW9VoX6lZRXT8qCPhI/Nfl9lnZLGrPIgR13GjE0BFl
	qW2ukSNnKoUqnqIbfEHpjVf04aB4+RDEcnQSXEqKKOtMxTZzoA4gifsAyOwEUuCxI85v
	JJ+86734DsAZ4o++euKArs5pIPp0O6YRIZOxpQEDSOgeye5ud0gmmVUs6GYgwNw+4Tyg
	ahtYn6l80VkFhrT+VHweQMT1Kkmq888FMQ0/Kwntdvu+6mIFk51FcJ7vBy8iRY6RsJG5
	7fC9y005IFPbbV/ud9eAgyqT76U/5k7Tz8Dk6fAhc01HPCp7EX1JO6Pxteim2xUrXbYP
	jtzw==
X-Gm-Message-State: ALoCoQmnOCoCi8faV5z8PCeromr/E2hloGWt7OmZcnVsOh/8Syng20VoCyp46uDhjcSCH1W8pgSN
X-Received: by 10.194.185.238 with SMTP id ff14mr19980694wjc.9.1405348295146; 
	Mon, 14 Jul 2014 07:31:35 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	de5sm31767681wib.18.2014.07.14.07.31.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jul 2014 07:31:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jul 2014 15:31:27 +0100
Message-Id: <1405348287-30244-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1405348287-30244-1-git-send-email-ross.burton@intel.com>
References: <1405348287-30244-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] xorg-driver: use PACKAGEFUNCS instead of populate_packages_prepend
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
X-List-Received-Date: Mon, 14 Jul 2014 14:31:36 -0000

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


