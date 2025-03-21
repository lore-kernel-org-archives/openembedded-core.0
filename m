Return-Path: <Mario.Schuknecht@iris-sensing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C7DC36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 15:13:40 +0000 (UTC)
Received: from o1.shr1-de.smtp.net (o1.shr1-de.smtp.net [185.71.125.101])
 by mx.groups.io with SMTP id smtpd.web11.2365.1742570016275619893
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 08:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=mario.schuknecht@iris-sensing.com header.s=smtp header.b=HDEn8wm8;
 spf=fail (domain: iris-sensing.com, ip: 185.71.125.101, mailfrom: mario.schuknecht@iris-sensing.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; s=smtp; d=iris-sensing.com;
 h=X-CSA-Complaints:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:List-Help; i=mario.schuknecht@iris-sensing.com;
 bh=feS3X8moT/1NLMgii2pbKRkYeVnJfSw86pw8Y1kauU8=;
 b=HDEn8wm8yjDq87ogQUFuPHHJ54NuF9qPtbcYmyev9PH73aJkR1KW1RZc98DxU+PJfodGzf6+ji5+
   jxX2LFLky85O/MEnEQgRMuvG+g2UgMbg8k3XOyfDzL4YspKPtMz1ivXxB0eY2LDdfYHt8SBRgW/u
   4VmPagl0d6HzQz345tEGZfHxvG3xFuKq6x8GhZ7j3NSP7ymk4aNmRDBJicAG7qruny+1bzaly3Gj
   v/B7Jck611UbvprPKlPKbvxc7gqz7stNNJFTT5HS28+ZWDU5XSEvE1qQtE0cNVp/4OACdGUdzRj9
   tyrugNOlxnDmRIzd0Fd3fe+eLt8WW6oSzZ1ErQ==
X-CSA-Complaints: csa-complaints@eco.de
From: Mario Schuknecht <mario.schuknecht@iris-sensing.com>
To: openembedded-core@lists.openembedded.org
Cc: Mario Schuknecht <mario.schuknecht@iris-sensing.com>
Subject: [meta-core][PATCH v2] libgpg-error: inherit lib_package
Date: Fri, 21 Mar 2025 16:12:45 +0100
Message-ID: <20250321151245.21227-1-mario.schuknecht@iris-sensing.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Complaints-To: abuse@smtp.net
List-Help: <https://www.rapidmail.de/unsubscribe_help>
Feedback-ID: ohorkrd6ro6lu91c:3291:trx:rapidmail
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 15:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213479

Inherit lib_package to create an extra libgpg-error-bin package for
executables. As a result, the gpg-error and yat2m executables are now in
this libgpg-error-bin package, and no longer in the libgpg-error
package.

Signed-off-by: Mario Schuknecht <mario.schuknecht@iris-sensing.com>
---
 meta/recipes-support/libgpg-error/libgpg-error_1.51.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb
index 741969beb0..e0287d813b 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb
@@ -24,7 +24,7 @@ SRC_URI[sha256sum] = "be0f1b2db6b93eed55369cdf79f19f72750c8c7c39fc20b577e7245454
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-inherit autotools binconfig-disabled pkgconfig gettext multilib_header multilib_script ptest
+inherit autotools lib_package binconfig-disabled pkgconfig gettext multilib_header multilib_script ptest
 
 RDEPENDS:${PN}-ptest:append = " make bash"
 
@@ -47,7 +47,6 @@ do_install_ptest() {
     install ${B}/tests/Makefile ${D}${PTEST_PATH}
 }
 
-FILES:${PN}-dev += "${bindir}/gpg-error"
 FILES:${PN}-doc += "${datadir}/libgpg-error/errorref.txt"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.3


