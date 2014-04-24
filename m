Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id E279965DAB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 10:33:33 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hm4so993252wib.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 03:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WjVU4CwxfjpaSKw47Bsru9rDzpRlm7T8T+nA41DvwGs=;
	b=kgBtIGA4tePJD4106fJsAeDTaXrvJum+uRdHxL8LbEx8paGDy6gGwwjJtYJNM7xeQ8
	8cwV58jEhYACaJE/pbtC4yBQHpXJqgIpI/nm/SUq3Oz80MLQJ72ZyBnBbp/BgX5/XmOS
	V2hN9xL+8lfE/57bExU6LD8q1HZsMZKd+M7isgPKjDqjv94fW0rNo7HFx5cnb5srVizT
	XrFAPCIhWAPngE0qL+A/s3SggBPVWBydakjHjDqIn7UpJtFuxNaG9Rtg9COSFtMY/TkY
	kS/3+Xqs95KYDhgZb/MAwbPkoG0LyC9cmHxPFqG9ovFCtWnM4iHrNnLoyYoGSfk8j3nW
	olBg==
X-Gm-Message-State: ALoCoQkfmKYnNRJ+9ZDA2tlCxCsg6DzHnsUy7KzGHCt9HnmSbOOSBWqyx3cgdNDTw3MEVZwfR45b
X-Received: by 10.180.184.167 with SMTP id ev7mr5740484wic.55.1398335613987;
	Thu, 24 Apr 2014 03:33:33 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id uc3sm9822442wib.10.2014.04.24.03.33.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Apr 2014 03:33:33 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Apr 2014 12:33:27 +0200
Message-Id: <1398335607-12046-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCHv2] git: fix perl binding installation
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
X-List-Received-Date: Thu, 24 Apr 2014 10:33:38 -0000

Git.pm wasn't ending up in the package because do_install removed it
with a misleading comment about multilib. Fix the problem at the source
so that Git.pm ends up in the correct dir *and* doesn't get deleted.

The perl.mak file gets updated during the regular do_install, so add an
extra make install step to install the *.pm files to the correct
directory.

This is the first step in making git-perltools actually work.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-devtools/git/git.inc | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index f5013f1..aa9ca28 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -23,15 +23,24 @@ do_compile_prepend () {
 	rm -f perl/perl.mak
 }
 
+# The perl portion fails with -j16
+PARALLEL_MAKEINST = ""
+
 do_install () {
 	oe_runmake install DESTDIR="${D}" bindir=${bindir} \
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
@@ -75,6 +84,7 @@ PERLTOOLS = " \
 PACKAGES =+ "${PN}-perltools"
 FILES_${PN}-perltools += " \
     ${PERLTOOLS} \
+    ${prefix}/lib/perl \
     ${datadir}/perl \
 "
 RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path findutils"
-- 
1.9.0


