Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F4C6C44506
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 12:54:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11843.1783688071195590991
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 05:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=mhvMOOn2;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 708DC1EA6
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 05:54:26 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 57A063F85F
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 05:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783688070; bh=TxBSV3jU266rjs9+dko1DvI3QVnabhkY9F2oe2d8qSo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mhvMOOn2JWCqRa42C75bgdx7GiJ0Hb6xuvfamltnozK5Xw1cdNkUSTTt73u6vt5su
	 XGcU64ShjU7uwkMDkS77E2JAsZYLA+lFnNmL6SFiqpFFFctQeNrEQpAlGbPFkjwhpd
	 1jalc91y8k7DixiJlO6vBR/K3ON0pLPJMZF8ZXNs=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] classes/systemd: remove obsolete DEPENDS
Date: Fri, 10 Jul 2026 13:54:22 +0100
Message-ID: <20260710125425.220975-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710125425.220975-1-ross.burton@arm.com>
References: <20260710125425.220975-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 12:54:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240636

Recipes that use systemd don't need systemctl at build time, so this
dependency can be removed.

It was added in [1] but no rationale was given or is obvious.

[1] oe-core e9444649f4 ("systemd: Restore mask and preset targets, fix in=
stance creation")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/systemd.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/sy=
stemd.bbclass
index 5d8e6086b2..df464baddd 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -21,7 +21,6 @@ python __anonymous() {
     # Inhibit update-rcd from doing any work so that systemd images don'=
t have
     # redundant init files.
     if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
-        d.appendVar("DEPENDS", " systemd-systemctl-native")
         d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
=20
--=20
2.43.0


