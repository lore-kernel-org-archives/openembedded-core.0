Return-Path: <martin.jansa@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id AE6AB6086B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 08:56:12 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id fa10so2718457pad.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 01:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=1UpGVlXwhvB9EhNP4WAX9uF2gptSLRjxU4jOnbp4R60=;
	b=ntH8gC3fM3ASG74NxUCe2nb3n/IynvH9AydMABOAVtmtPvKM840FyXFwqTA5mf4Hxy
	+QY1oKCr5BhdxxbnwpArWk4IW2z8sh28Ar1E8F7JFFrGgamawJ7+JqjnGGJUZAdeFGao
	fdQerIQKRuxyNiNYqdJfHR6lsfYtdnL7jDIKZlJHZaKfshbck5B2Qv/ngpTGMDDfW+a/
	3RD/FYp7xsz3Nm5ETMtYF1INl8J6bhaHWka/hsDFS6ca7YyjbJLOlKhxME//0hPg7ZFu
	x2jyFG2l/XIrUhUkaouu70yJ5t3QzB0namowO65z55bf0hY/dlbLoUrL1b3hjE1ecRAp
	F6Mw==
X-Received: by 10.66.150.106 with SMTP id uh10mr12428371pab.118.1369299373843; 
	Thu, 23 May 2013 01:56:13 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	zs12sm12003345pab.0.2013.05.23.01.56.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 23 May 2013 01:56:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2013 10:55:03 +0200
Message-Id: <1369299303-15980-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <519DD2D2.3010009@intel.com>
References: <519DD2D2.3010009@intel.com>
Subject: [PATCH] libdrm: fix packaging after last upgrade
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
X-List-Received-Date: Thu, 23 May 2013 08:56:12 -0000

* 2.4.44 adds 2 more tests kmstest and vbltest which got packaged
  to PN, causing PKG rename and breaking upgrade path
  * check_data_file_clashes: Package libdrm wants to install file /usr/lib/libdrm.so.2
         But that file is already provided by package  * libdrm2
  * check_data_file_clashes: Package libdrm wants to install file /usr/lib/libdrm.so.2.4.0
         But that file is already provided by package  * libdrm2
  put them to PN-tests where they belong

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/drm/libdrm.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics/drm/libdrm.inc
index e395e03..497220f 100644
--- a/meta/recipes-graphics/drm/libdrm.inc
+++ b/meta/recipes-graphics/drm/libdrm.inc
@@ -11,6 +11,7 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/libdrm-${PV}.tar.bz2"
 PROVIDES = "drm"
 DEPENDS = "libpthread-stubs udev"
 
+# be aware that libdrm_2.4.44.bb ignores this
 INC_PR = "r4"
 
 #libpciaccess is required starting from libdrm 2.4.26
@@ -29,7 +30,7 @@ PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
 RDEPENDS_${PN}-drivers = "${PN}-radeon ${PN}-nouveau ${PN}-omap ${PN}-intel \
                           ${PN}-exynos"
 
-FILES_${PN}-tests = "${bindir}/dr* ${bindir}/mode*"
+FILES_${PN}-tests = "${bindir}/dr* ${bindir}/mode* ${bindir}/*test"
 FILES_${PN}-radeon = "${libdir}/libdrm_radeon.so.*"
 FILES_${PN}-nouveau = "${libdir}/libdrm_nouveau.so.*"
 FILES_${PN}-omap = "${libdir}/libdrm_omap.so.*"
-- 
1.8.2.1


