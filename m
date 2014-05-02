Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 43113606E0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 08:37:08 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id q58so4172934wes.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 May 2014 01:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m8zSZRN0UJfPANVCRGYnREJ6vr13wsRhZq16EPD0Smo=;
	b=CkLtN4Rry5wQSDuCN41w2tWqGVZqBPQ6CWfEuxmRJ5drzQbqOaP+pkHQfZZTsTlwz2
	TCdQacW3oDBy18be2Cl/+yB1Kg20BvQyQAamPifAC3pcRQTUo1oNwN/M5RLCQIR/SEpJ
	KcvAPwam6BlpAFY6o5N5l0rNsYaUVfDbjXjIFXYkNwKpdmrhjjSQ/bS8Dsv5j7F4uIzX
	D33FhNxomkWcnUDVhwf0FOl94Q9qlsgsrONrf2HHIUvcAEe1g0rkNRSJaHbVBsa3biyZ
	0yH2OkCZ/VFrJl/zkblU4PB8cez2v1NuyeBDqY8WvtwBxSgiCsAfoSV2H8ZM/TTWyyEs
	GUXA==
X-Gm-Message-State: ALoCoQn6aOB6bihDS0AV0y2qmvyuAEYihMSVUFe8mB6nwQChQ839WYrmcAkO1CI95LDk5U96wTXA
X-Received: by 10.194.24.194 with SMTP id w2mr12714000wjf.25.1399019829429;
	Fri, 02 May 2014 01:37:09 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id gi8sm2357502wib.8.2014.05.02.01.37.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 May 2014 01:37:08 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 May 2014 10:36:58 +0200
Message-Id: <1399019818-4767-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCHv4] git: fix perl binding installation
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
X-List-Received-Date: Fri, 02 May 2014 08:37:10 -0000

Git.pm wasn't ending up in the package because do_install removed it
with a misleading comment about multilib. Workaround the problem so
that Git.pm ends up in the correct dir *and* doesn't get deleted.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-devtools/git/git.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 73e11eb..178b768 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -28,10 +28,14 @@ do_install () {
 		template_dir=${datadir}/git-core/templates \
 		GIT_PYTHON_DIR=${D}${datadir}/git-core/python
 
+	cd ${B}/perl && oe_runmake install DESTDIR="${D}" bindir=${bindir}
+
 	# ${libdir} is not applicable here, perl-native files are always
 	# installed to /usr/lib on both 32/64 bits targets.
+	# Fix up build paths and point to target locations.
+	mv ${D}${exec_prefix}/lib/perl-native/perl ${D}${exec_prefix}/lib/perl
+	sed -i -e s:${D}::g ${D}${exec_prefix}/lib/perl/*/auto/Git/.packlist
 	rm -rf ${D}${exec_prefix}/lib/perl-native
-	rmdir ${D}${exec_prefix}/lib || true
 }
 
 PERLSEDFIXUP = " \
@@ -75,6 +79,7 @@ PERLTOOLS = " \
 PACKAGES =+ "${PN}-perltools"
 FILES_${PN}-perltools += " \
     ${PERLTOOLS} \
+    ${prefix}/lib/perl \
     ${datadir}/perl \
 "
 RDEPENDS_${PN}-perltools = "${PN} perl perl-module-file-path liberror-perl findutils"
-- 
1.9.0


