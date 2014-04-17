Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id F127365D11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 09:08:23 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id hi2so2600609wib.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 02:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9bLeK56v6OosHAdOR+H90gHGF6bg/EPwU2ZTPk6wSfM=;
	b=XZLxHDbp5aKXvG+KiQfFwVfdyIbMiDRTm31HyQdG09mqBGEGML17HYzmLJ2FHyYRna
	cwRZJA/XiDQ3PPeOVPfjq7hpS9HA8i1sz5GDxDGvNgwGBYJAPCGdf1xmvg6hEv476XOl
	ID46K9LdrOfoKcV2D8OWqYDyHo27QZse+hDhqi88L6jqWwiB0TFJ5m4R4n78SbUo4pyt
	QJUE2cTAu0aeU4TGpmix7xOWMpj5LO5a/P2huYP2XTyRzYv8YzXDzaX2h9uDEZF9LmX/
	RCOJeL44DxI0rn7gb+8uo1BT8MAfOVDDuz/XnirMRxIOy4/jreXxxp9/xRGTwgPlQl43
	lYOg==
X-Gm-Message-State: ALoCoQm6BlQlyYXlYQgZpgd9Gd/fCiyUkazbHqLEPqUGkNoGTOgFecPsnrrKqUZuXlTFGeJelfQ0
X-Received: by 10.194.174.42 with SMTP id bp10mr1120491wjc.57.1397725704149;
	Thu, 17 Apr 2014 02:08:24 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id wl6sm38146825wjb.3.2014.04.17.02.08.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Apr 2014 02:08:23 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Apr 2014 11:07:37 +0200
Message-Id: <1397725659-9004-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH 1/3] git: fix perl binding installation
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
X-List-Received-Date: Thu, 17 Apr 2014 09:08:26 -0000

Git.pm wasn't ending up in the package because do_install removed it
with a misleading comment about multilib. Fix the problem at the source
so that Git.pm ends up in the correct dir *and* doesn't get deleted.

The perl.mak file gets updated during the regular do_install, so add an
extra make install step to install the *.pm files to the correct
directory.

This is the first step in making git-perltools actually work.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-devtools/git/git.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index f5013f1..888b2a5 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -28,10 +28,16 @@ do_install () {
 		template_dir=${datadir}/git-core/templates \
 		GIT_PYTHON_DIR=${D}${datadir}/git-core/python
 
+	sed -i -e 's#${STAGING_BINDIR_NATIVE}/perl-native/#${bindir}/#' \
+	       -e 's#${STAGING_LIBDIR_NATIVE}/#${libdir}/#' \
+	       -e 's#/lib/perl-native#/lib#g' \
+	       ${S}/perl/perl.mak
+
+	cd ${S}/perl && oe_runmake install DESTDIR="${D}" bindir=${bindir}
+
 	# ${libdir} is not applicable here, perl-native files are always
 	# installed to /usr/lib on both 32/64 bits targets.
 	rm -rf ${D}${exec_prefix}/lib/perl-native
-	rmdir ${D}${exec_prefix}/lib || true
 }
 
 PERLSEDFIXUP = " \
@@ -75,6 +81,7 @@ PERLTOOLS = " \
 PACKAGES =+ "${PN}-perltools"
 FILES_${PN}-perltools += " \
     ${PERLTOOLS} \
+    ${prefix}/lib/perl \
     ${datadir}/perl \
 "
 RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path findutils"
-- 
1.9.0


