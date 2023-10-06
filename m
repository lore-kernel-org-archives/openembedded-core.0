Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB120E94105
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 19:13:07 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web11.2784.1696619577604106309
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 12:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=z9d+ySHN;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=UOunT9oG;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.28, mailfrom: pavel@zhukoff.net)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id EFD915C01BB;
	Fri,  6 Oct 2023 15:12:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 06 Oct 2023 15:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1696619574; x=1696705974; bh=6D4vlpoDbn
	RmHfcVFKrt1RkNc5QdhUR/KO2huCnKAq4=; b=z9d+ySHNKQGuN06dwnDV3zhlv2
	/Nz4wt5r9KO03QHeG5QQcakLzGEnlcgAZcHuAC7+QVlQopvVAs0jEhn8uwDIBqUL
	XY4T56ylwGsWCwutQb0tPL3rns6PGOozPgRJViBBR1WUICB8xYwNsSdc9RWzjI0E
	ccZsI7msAhgGsjRuQMFio8vHZvabSFhbuJyEud8hNLBRySUq7CfZoG6M6crdDEiK
	qYvKn7ZcMOPJyBjunVecOH3Ld6QHJWM2YS0ZKfzMTUUb3YM2gOsXHqBZwiWLc1C0
	zlPFoE3YhpWQebRWoBQiaNUAefIjvdJHqZAzifdU8oxDMmvWpUcidcT4T6xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696619574; x=1696705974; bh=6D4vlpoDbnRmH
	fcVFKrt1RkNc5QdhUR/KO2huCnKAq4=; b=UOunT9oGyvJtfMVC8D70GcoSVfG6X
	AcFJW0nM/0II3Ph4oV8hC5z/d1uUFIBNabyJlcT6J2DCECnaD+ksiU843tXVt5eN
	iQAe1WKu+XlG1XrltJbCgQqHIwvbO2rt1u9kibED4SbLaHICdgYTIXXmcgxCu7iF
	9EU6s1ChnUq7/LhDYfx4XQms/8FTVgxR9OONQGrzTHcSNeS2F3UAF8ph9LaYoMSG
	xRx9VVCLyh+UN1efFdwoygRmB0PhQdCo3ln2BCcGIY1wpzymm/PauGSRMiJmt2SC
	wy7UdN8Kzk9iA12T0zgzTcvKmsUFzkItSSo10MTCHWpxLLbaanG/NN2PA==
X-ME-Sender: <xms:NlwgZdHkTHQ2ds132QG8xX2ruZCXSfu7d01qM2In5zvDCR8RQLm4tA>
    <xme:NlwgZSVP8xDOs3aI4yNofjSZY7g8q1G8P2abTqf4S3HJGozWEN15LJDZKlH1-tFd1
    VuZKN59SmU7QZosP1I>
X-ME-Received: <xmr:NlwgZfJIMNSBGYY7UgexWe6lErvMttMoZvU6_E2nGm9GRen5hSLY8Ev4IvCC-4XsDYARWFtjGvKidAZlIgVnEqcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgeeigddufedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhho
    fhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeevfeejkeejudegledtkeejhfettdefje
    euffehieekvddugfdtffffledvvdefhfenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:NlwgZTHnExrlbuYaNT-exyLcFUhIIuQB5xU3ecE2WciMhjrZX78HIQ>
    <xmx:NlwgZTU6n9dlKlxmtqP9pqcDzJg7h9e0G7p63j8LzFq7_6wQRZpS5A>
    <xmx:NlwgZeMC2vzUPzLOqNG_JpDDaSjQgyVUDTUpulg5rrKrR-7UKJmkmw>
    <xmx:NlwgZUfSzliUcSWQdxKlQaP4tcm7-_sq45OhFEr6sgp89sWN2cRLjw>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Oct 2023 15:12:53 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH v2 1/4] dummy-sdk-package.inc: Filter packages which are marked for installation
Date: Fri,  6 Oct 2023 21:10:11 +0200
Message-ID: <20231006191013.3770695-2-pavel@zhukoff.net>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 19:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188779

if packages is provided by dummysdk and in the same time marked for
installation with IMAGE_INSTALL it causes conflict in apt because virtual providers are
not taken into account if package is asked to be installed explicitly.
Filter such packages from provides/conflicts to workaround this problem.
This workaround brakes RPM usecase because of file conlicts with
DUMMYPROVIDES, use DUMMYPROVIDES_PACKAGES_MULTILIB instead (which
doesn't include file based conflicts).
While this is needed for the case of package_deb only adding it for all
package managers to not complicate the code.

Fixes: [Yocto #13338] [Yocto #14066]

Fixes:
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 target-sdk-provides-dummy : Conflicts: bash
E: Unable to correct problems, you have held broken packages.

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta/recipes-core/meta/dummy-sdk-package.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
index bd26e39ad3..99863b86f1 100644
--- a/meta/recipes-core/meta/dummy-sdk-package.inc
+++ b/meta/recipes-core/meta/dummy-sdk-package.inc
@@ -19,13 +19,14 @@ PR[vardeps] += "DUMMYPROVIDES"
 PR[vardeps] += "DUMMYPROVIDES_PACKAGES"
 
 DUMMYPROVIDES_PACKAGES ??= ""
-DUMMYPROVIDES_PACKAGES_MULTILIB = "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split()])}"
+DUMMYPROVIDES_PACKAGES_FILTERED = "${@' '.join([pkg for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split() if d.getVar('IMAGE_INSTALL') is None or pkg not in d.getVar('IMAGE_INSTALL').split()])}"
+DUMMYPROVIDES_PACKAGES_MULTILIB = "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES_FILTERED').split()])}"
 DUMMYPROVIDES += "${DUMMYPROVIDES_PACKAGES_MULTILIB}"
 
 python populate_packages:prepend() {
     p = d.getVar("PN")
     d.appendVar("RPROVIDES:%s" % p, "${DUMMYPROVIDES}")
-    d.appendVar("RCONFLICTS:%s" % p, "${DUMMYPROVIDES}")
+    d.appendVar("RCONFLICTS:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
     d.appendVar("RREPLACES:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
 }
 
-- 
2.41.0


