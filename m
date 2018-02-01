Return-Path: <zboszor@pr.hu>
Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
	by mail.openembedded.org (Postfix) with ESMTP id 30723783C9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 13:08:41 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1ehEbd-0005CI-0t
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Feb 2018 14:08:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RnDRehM//egl+Dx6nfqsvYTdJ6yhqC5+JcJ0iEyrXYM=;
	b=ho0t0FkEotZsPRik0jswpjBdYL
	WEpFYZLVAyUcJ0nCnU0UpMCP4Dqr2eBYgYO/1YjjY9xHLLhyPWaofRqfGqZIGMQCufIMqHe7YWjQM
	UnZInwUkUn50RhgUi09ivq7dKlL4UtPq2bVLPY0jfXFINH05hsy1YdSJvAQBnhpEoYWhnK4jOy+fv
	6VpG1P1UUrvKXrPoJ7J7Nt20AVLh1WE6nbAA6YBuYa5XNEHlVlupkC50iHD1TH5oC4Su9lAuhXdHd
	hkSM5HNcQif018FTAoOYHtWWmIJ1CNIM9LZlmgogbPm/E2diNL2furl5g/hCceaX8Cr4JY7bNrPBl
	HBuinBYQ==;
Received: from host-87-242-32-111.prtelecom.hu ([87.242.32.111]
	helo=s002.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1ehEbX-0005Ce-8E; Thu, 01 Feb 2018 14:08:40 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 14:08:30 +0100
Message-Id: <20180201130831.4027-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Scan-Signature: 02d3abc61471e6dd9f9388029c518d83
X-Spam-Tracer: backend.mail.pr.hu -0.4 20180201130840Z
Subject: [PATCH 1/2] npm.bbclass: Fix building node modules with npm@5
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
X-List-Received-Date: Thu, 01 Feb 2018 13:08:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

npm cache clear throws an error with npm@5 and suggests to
use npm cache verify instead. But our cache is actually empty,
so use npm cache clear --force.

npm install in the source directory creates symlinks with npm@5.

Use a combination of npm pack and npm install module-version.tgz
that works the same way with older and new npm versions and is
guaranteed to create actual copies instead of directory symlinks.

This change allows using nodejs 8.x LTS, tested with 8.9.4.

Signed-off-by: Zoltán Böszörményi <zboszor@pr.hu>
---
 meta/classes/npm.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index a69bedbb28..898a54eb50 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -31,7 +31,7 @@ npm_do_compile() {
 	fi
 	npm set cache ${WORKDIR}/npm_cache
 	# clear cache before every build
-	npm cache clear
+	npm cache clear --force
 	# Install pkg into ${S} without going to the registry
 	if [  "${NPM_INSTALL_DEV}" = "1" ]; then
 		npm --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --no-registry install
@@ -45,7 +45,8 @@ npm_do_install() {
 	# be created in this directory
 	export HOME=${WORKDIR}
 	mkdir -p ${NPM_INSTALLDIR}/
-	npm install --prefix ${D}${prefix} -g --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --production --no-registry
+	npm pack .
+	npm install --prefix ${D}${prefix} -g --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --production --no-registry ${PN}-${PV}.tgz
 	if [ -d ${D}${prefix}/etc ] ; then
 		# This will be empty
 		rmdir ${D}${prefix}/etc
-- 
2.14.3


