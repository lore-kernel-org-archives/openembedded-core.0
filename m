Return-Path: <kergoth@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id DB190610D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 14:50:25 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c13so908666eek.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 06:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=6O9sp2cJ8di1URRMc0p15NTpQYydiHytbxziEDzkXng=;
	b=u5WFT0J7i+WaNisL98vzisxQGTDUVidu4I+6G2r+pqBfQe5NPk7KzbNL1hOd6AiqJL
	gZzvniMll+G5XE6MY59Snvm+FbqUWwN/5uglWc+jqfhVJwCb7EFMzgAis57YAJjTUji5
	v6gzdk8jTsZbsQ/aLq+x9AglBCdhngisQcGg9BFzUPOtjwppV8U1ih+NBD4uCKtDRW5Y
	fqV752X+7vwdH+glGvO5W3dHDHi9UJb55lbOMuYHKjWfy8NCjB4qiEj3sZNCkfGpITqh
	tNtLbIe2lT+aWFpqan1KPV3kIZGOvRoM3jQ3SLp1LXiu4KNv+bhm2XzNTK/NIAyw8rqP
	xW3w==
X-Received: by 10.15.108.73 with SMTP id cc49mr3286480eeb.93.1386946225236;
	Fri, 13 Dec 2013 06:50:25 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id o47sm7527284eem.21.2013.12.13.06.50.23
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Dec 2013 06:50:24 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Dec 2013 07:50:11 -0700
Message-Id: <9950f35b110f1c3032e199c9d0b32a2e43a326b2.1386946076.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1386946076.git.kergoth@gmail.com>
References: <cover.1386946076.git.kergoth@gmail.com>
In-Reply-To: <cover.1386946076.git.kergoth@gmail.com>
References: <cover.1386946076.git.kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/3] git: leverage upstream relocation support
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
X-List-Received-Date: Fri, 13 Dec 2013 14:50:26 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-devtools/git/git.inc | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 183a93c..f33069c 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -16,7 +16,7 @@ EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl \
 
 inherit autotools perlnative
 
-EXTRA_OEMAKE = "NO_PYTHON=1"
+EXTRA_OEMAKE = "NO_PYTHON=1 RUNTIME_PREFIX=1"
 
 do_compile_prepend () {
 	# Remove perl/perl.mak to fix the out-of-date perl.mak error
@@ -35,18 +35,6 @@ do_install () {
 	rmdir ${D}${exec_prefix}/lib || true
 }
 
-do_install_append_class-native() {
-	create_wrapper ${D}/${bindir}/git \
-		GIT_EXEC_PATH=${libexecdir}/git-core \
-		GIT_TEMPLATE_DIR=${STAGING_DATADIR_NATIVE}/git-core/templates
-}
-
-do_install_append_class-nativesdk() {
-	create_wrapper ${D}/${bindir}/git \
-		GIT_EXEC_PATH=${libexecdir}/git-core \
-		GIT_TEMPLATE_DIR=${STAGING_DATADIR_NATIVE}/git-core/templates
-}
-
 FILES_${PN} += "${datadir}/git-core ${libxecdir}/git-core/"
 FILES_${PN}-dbg += "${libexecdir}/git-core/.debug"
 
-- 
1.8.3.4


