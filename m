Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id C846376FF2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 22:23:10 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so189278wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 15:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=h5G/flnLcRD+1j7CEpX5PVyatw+SbYLbMIAUm2BFFvw=;
	b=cLDVq0fuT4tToLGGanT6dhfLsl6lRwwo+5rlAHLBY+IMepG8WzJtyy6enSG6Nb4IdP
	8Ud0MrfICOHuCUSeO/jwtnjnUzru1l0HcPulEN8HrSo5nBkZAxUiBAibafUycgpqUvI1
	aBdew3+Ndgb678vt3AruPOqYmCYo+mcbM9S3XVPTmcD/6rxCO3O6Ew43tvIWXZ54Px+a
	qJRxkL4X4QL+VhPASj+gJp8srMKluQh12F3AN0jxPKdZgXEY16pOP8OTIKUtj3vorzJI
	OkbesNfBMD2eleTuqntcv5ldfRIzMAiGV0NxuNw1TiBlRy0lek9m2QKMRkPAGV+baqKt
	8mjA==
X-Received: by 10.180.11.176 with SMTP id r16mr368214wib.87.1441146190419;
	Tue, 01 Sep 2015 15:23:10 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id c3sm29264439wja.3.2015.09.01.15.23.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Sep 2015 15:23:09 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Sep 2015 15:23:02 -0700
Message-Id: <a3ec49e286110440a69f0cd3b7fd5dee7ba4ae07.1441145177.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1441145177.git.chris_larson@mentor.com>
References: <cover.1441145177.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 1/3] insane.bbclass: handle tests which need fakeroot
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
X-List-Received-Date: Tue, 01 Sep 2015 22:23:11 -0000

From: Christopher Larson <chris_larson@mentor.com>

If any tests listed in FAKEROOT_QA are enabled (listed in ALL_QA), then
run do_package_qa under fakeroot.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/insane.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index d9befc4..63376e7 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -38,6 +38,9 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             split-strip packages-list pkgv-undefined var-undefined \
             version-going-backwards expanded-d \
             "
+FAKEROOT_QA = ""
+FAKEROOT_QA[doc] = "QA tests which need to run under fakeroot. If any \
+enabled tests are listed here, the do_package_qa task will run under fakeroot."
 
 ALL_QA = "${WARN_QA} ${ERROR_QA}"
 
@@ -1210,6 +1213,11 @@ python () {
         for var in 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RCONFLICTS', 'RPROVIDES', 'RREPLACES', 'FILES', 'pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm', 'ALLOW_EMPTY':
             if d.getVar(var, False):
                 issues.append(var)
+
+        fakeroot_tests = d.getVar('FAKEROOT_QA', True).split()
+        if set(tests) & set(fakeroot_tests):
+            d.setVarFlag('do_package_qa', 'fakeroot', '1')
+            d.appendVarFlag('do_package_qa', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
     else:
         d.setVarFlag('do_package_qa', 'rdeptask', '')
     for i in issues:
-- 
2.2.1


