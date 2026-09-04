Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95AEEC624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 08:43:05 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9366.1788511379555166446
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 01:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=IAtQn3tH;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 40AE41A1997;
	Fri,  4 Sep 2026 08:42:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 141AC6057F;
	Fri,  4 Sep 2026 08:42:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 70F1111C7A753;
	Fri,  4 Sep 2026 10:42:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788511372; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=4g6OEf9Z/AFZVP7SW0/bD3bNSuYShziWBzHXzTDhmgg=;
	b=IAtQn3tHpUHE2P2IUfbu9GK2QG3kbsdyumW0smpuW8RZX/Cr43hTH4ePiLi0EX05hI6ZPD
	eE3eJ6Qlq3XnSk6FW6SOt3FtJf/DLP8D/+lu4fmn9LulCecX5i0b+2SyFqC8y7dwFkFF9A
	16zxJdusoijl4KrhwgVPGOQhGhiOaC2W9XPxUv/87HRTaLdRbBPSi39ORnrp8q0iZLjPKn
	4RVD+li+0GGqMJCnQnM1yOyCoNPxea9yveEtOiwW9/nvFzETPwT0/SdtO/a+fut+WTJYqv
	L3R0Tu+2Fvmt8Xp1hk659qyuQqhjT3W4a3WHEI7CvdXM4VM+tZeRmogyyWq3Qg==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Fri, 04 Sep 2026 10:42:39 +0200
Subject: [PATCH] sbom-cve-check-update-db: Exclude recipes from rm_work
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260904-sbom-cve-check-update-db-no-rm-work-v1-1-e19b06eba7ea@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNTQ6CMBBA4auQWTtJQdToVYwL5gcZCS1pAU0Id
 6fq8tu8t0LSaJrgVqwQdbFkwWeUhwK4a/xT0SQbKled3dXVmCgMyIsid8o9zqM0k6IQ+oBxwHe
 IPToSupRyPLXEkEtj1NY+v8v98Xea6aU8fdOwbTt4CzpVhwAAAA==
X-Change-ID: 20260904-sbom-cve-check-update-db-no-rm-work-0bdb71d35fbc
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 08:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245072

If the "rm_work" task runs on these recipes, the next execution of the
do_sbom_cve_check task would force the CVE databases to be extracted
again. Excluding the recipes from "rm_work" allows the build system to
remember that the unpack and patch tasks were already executed, so
it does not run them a second time. Extracting the CVE databases is
slow, and it also removes the database "index", which sbom-cve-check
has to regenerate =E2=80=94 an even slower step.

Keeping WORKDIR around is cheap: for the recipes downloading the CVE
databases, it stays below 400 kB (not counting the "temp" directory,
which rm_work leaves in place anyway).

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
---
 meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-d=
b.inc b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
index fbdc561e8c6a..2efc080b9327 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
@@ -2,6 +2,7 @@
=20
 INHIBIT_DEFAULT_DEPS =3D "1"
 EXCLUDE_FROM_WORLD =3D "1"
+RM_WORK_EXCLUDE +=3D "${PN}"
=20
 inherit native
 require conf/sbom-cve-check-config.inc

---
base-commit: 934e84e9ea1fa2faf14bdafa71638fdca22dd79a
change-id: 20260904-sbom-cve-check-update-db-no-rm-work-0bdb71d35fbc

Best regards,
-- =20
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


