Return-Path: <ticotimo@gmail.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id EF30060703
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 22:33:49 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id hq11so8666141vcb.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 15:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rzfvKXRiGmZDVyp+CeDBQoD0z55SgendtQsFfauzuWg=;
	b=InJ2Fc/Y3g2kMxN0E0ngS7hzjrdu9PRyrRUUZOYqaD/sN1TGEHUExzmovOjwuL9eKv
	FVFSUZEuv81xsITKrPL/G1xMUGaAq88cr1sLUWK9G6hmAjmNAtu5hKkLNb8c9ZRflqpx
	fqmkurNdiujgA72fcqqYU8u+Z5GM3NKjFnUBMq0rkKSmlot7s1zDpXDMZfnT8BrvCjXf
	QgSox3P6shnkBUJ5gYa/EyZD3d/M/BzPqNAYVeanJ3rwSZ1XQESTUNP+pMc/rCabxxaP
	xGRwewGvvOQsdCDDNB4CYpdIJEE179m/dHP4FOPFLV72rwiQVuVk2FVzmvSpjYmWxj6g
	CZOg==
X-Received: by 10.52.24.68 with SMTP id s4mr2535305vdf.37.1405377230671;
	Mon, 14 Jul 2014 15:33:50 -0700 (PDT)
Received: from localhost.localdomain.com ([196.40.10.133])
	by mx.google.com with ESMTPSA id bq2sm5710712veb.11.2014.07.14.15.33.48
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jul 2014 15:33:49 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jul 2014 15:32:08 -0700
Message-Id: <1405377128-19646-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] classes/cpan_build.bbclass: add EXTRA_CPAN_BUILD_FLAGS
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
X-List-Received-Date: Mon, 14 Jul 2014 22:33:51 -0000

Some packages have additional configuration options that are currently
not accessible through cpan_build.bbclass. Similar to cpan.bbclass, add
EXTRA_CPAN_BUILD_FLAGS to pass the optional parameters to perl Build.PL.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta/classes/cpan_build.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cpan_build.bbclass b/meta/classes/cpan_build.bbclass
index 5b0ad61..2eb8162 100644
--- a/meta/classes/cpan_build.bbclass
+++ b/meta/classes/cpan_build.bbclass
@@ -3,6 +3,8 @@
 #
 inherit cpan-base perlnative
 
+EXTRA_CPAN_BUILD_FLAGS ?= ""
+
 # Env var which tells perl if it should use host (no) or target (yes) settings
 export PERLCONFIGTARGET = "${@is_target(d)}"
 export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
@@ -36,7 +38,8 @@ cpan_build_do_configure () {
 				--install_path script=${bindir} \
 				--install_path bin=${bindir} \
 				--install_path bindoc=${mandir}/man1 \
-				--install_path libdoc=${mandir}/man3
+				--install_path libdoc=${mandir}/man3 \
+                                ${EXTRA_CPAN_BUILD_FLAGS}
 }
 
 cpan_build_do_compile () {
-- 
1.9.3


