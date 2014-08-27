Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9B1036FE64
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 14:21:30 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kx10so378948pab.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 07:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rzfvKXRiGmZDVyp+CeDBQoD0z55SgendtQsFfauzuWg=;
	b=UCIhhpKDlIHse6PabgnBdbl2ZmDZESqUmrxjhgGkfwHWOkqghTQCvppdg+EBrM6LoH
	QWFa7EOFwPDAnC1mbfSTCIu1gSaJmo9Z+9KdfnscAoQ+e1KUDUD3+yALaRvDez2vb8sX
	uGazgldS6AsoyYJoNpEzelpY0qbcc1+zslbBvUcbHXTbTc6U6Fv9u+YcvzjRUDu/SiXt
	a8/QlhFJXCAD8l4qrtSG3thfKTJYdRMyv2tiuoURmSGBEXe4Q5lO3mDepiG7f3AqngLM
	qI1aYGoFW+UL+b/kZEZKghc17+JWqaroij9WJuaRsdilA65GjKHODXv6Cb8C+3bTpliT
	GqyQ==
X-Received: by 10.68.202.196 with SMTP id kk4mr45776707pbc.37.1409149291196;
	Wed, 27 Aug 2014 07:21:31 -0700 (PDT)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id ol8sm739177pdb.82.2014.08.27.07.21.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Aug 2014 07:21:30 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Aug 2014 07:21:21 -0700
Message-Id: <1409149281-27471-1-git-send-email-TicoTimo@gmail.com>
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
X-List-Received-Date: Wed, 27 Aug 2014 14:21:39 -0000

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


