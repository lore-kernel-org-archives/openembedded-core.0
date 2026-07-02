Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F93C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 13:52:54 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70128.1783000364494052010
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 06:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wdZc6/rB;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 55DC11A0DDF;
	Thu,  2 Jul 2026 13:52:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 23B355FF03;
	Thu,  2 Jul 2026 13:52:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8514F104C957F;
	Thu,  2 Jul 2026 15:52:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783000361; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=qj03otANxasgBl4QsSeANqsbxh0jO68tCMsks3lH/IA=;
	b=wdZc6/rBHStW8/RdcuADU23l1X4hI10MGIw0olfim1EJVYWS+7Pd2wP317rWuAMsEKAHHu
	8A5qAGD821scsfAPUhWE86ZjkvUQb8MJIqOCW/ejg0qIPsZiF9ZdhQc3rDSMuen+E1vjVg
	XToLgcRz0Q6m+Dbmi/OtYLgjszDsPiO6UF8FtvD5SNsxUT0udhisDKz44uNjlAz2ME8cFG
	2ZMXeU0md2aFXz+fhJzjaKBwLOq2Zxp3uy3lTmM96rEHFiJz5VJjMIgahvjLQx+bP/umYD
	VzXngp6cRnoazcMVh2h8N/GrNmt+kXaDpKlWTslmXa73eoVyH8HCS40JuiSwug==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Thu, 02 Jul 2026 15:52:38 +0200
Subject: [scarthgap][PATCH v2] openssh: CVE-2026-35387 patch also fixes
 CVE-2026-35414
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-openssh-cve-2026-35414-v2-1-6ff7fb38872f@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOSw7CIBRFt2IY+0z59KMj99F0APhaMAoNINE03
 bulLsDhubm/hUQMFiO5HBYSMNtovduAHQ9EG+kmBHvbmLCKNVVbMfAzuhgN6IxQROC1oAKqVpx
 FW3PacUm28BxwtO+9uB9+HF/qjjqVtj5qGZKZ5DwUs7Ex+fDZT2RaIn/3MgUKSnUN10x3bKyvy
 vv0sO6k/ZMM67p+AcUc0gXbAAAA
X-Change-ID: 20260702-openssh-cve-2026-35414-07494753183a
To: openembedded-core@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>, 
 "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 13:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240052

The openssh commit fd1c7e131f331942d20f42f31e79912d570081fa fixes 2 CVEs:
CVE-2026-35414 and CVE-2026-35387.

CVE-2026-35414:
| OpenSSH before 10.3 mishandles the authorized_keys principals option
| in uncommon scenarios involving a principals list in conjunction
| with a Certificate Authority that makes certain use of comma
| characters.

The match_principals_option() function is fixed. Before this fix:
When matching an authorized_keys principals="" option against a list of
principals in a certificate, an incorrect algorithm was used that could
allow inappropriate matching in cases where a principal name in the
certificate contains a comma character. Exploitation of the condition
requires an authorized_keys principals="" option that lists more than
one principal *and* a CA that will issue a certificate that encodes more
than one of these principal names separated by a comma (typical CAs
strongly constrain which principal names they will place in a
certificate). This condition only applies to user- trusted CA keys in
authorized_keys, the main certificate authentication path
(TrustedUserCAKeys/AuthorizedPrincipalsFile) is not affected.

CVE-2026-35387:
| OpenSSH before 10.3 can use unintended ECDSA algorithms. Listing of
| any ECDSA algorithm in PubkeyAcceptedAlgorithms or
| HostbasedAcceptedAlgorithms is misinterpreted to mean all ECDSA
| algorithms.

The rest of the patch allows to correctly match ECDSA signature algorithms
against algorithm allowlists.

The full explanation can be found on debian repository:
https://salsa.debian.org/ssh-team/openssh/-/commit/ae190b6440b7c599d759527965334eeb49cc75b3

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
Changes in v2:
- Update commit message to clarify why the patch is fixing 2 CVEs
- Link to v1: https://patch.msgid.link/20260702-openssh-cve-2026-35414-v1-1-bb863c2c82f5@bootlin.com
---
 .../{CVE-2026-35387.patch => CVE-2026-35414-CVE-2026-35387.patch}       | 2 +-
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb                      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-35387.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35414-CVE-2026-35387.patch
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh/CVE-2026-35387.patch
rename to meta/recipes-connectivity/openssh/openssh/CVE-2026-35414-CVE-2026-35387.patch
index c4806bd9935c..4839d76fa808 100644
--- a/meta/recipes-connectivity/openssh/openssh/CVE-2026-35387.patch
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35414-CVE-2026-35387.patch
@@ -14,7 +14,7 @@ Reported by Christos Papakonstantinou of Cantina and Spearbit.
 
 OpenBSD-Commit-ID: c790e2687c35989ae34a00e709be935c55b16a86
 
-CVE: CVE-2026-35387
+CVE: CVE-2026-35414 CVE-2026-35387
 Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/fd1c7e131f331942d20f42f31e79912d570081fa]
 Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
 ---
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index ea158b56b419..4193bc8a5b41 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -35,7 +35,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2025-61985.patch \
            file://CVE-2025-61984_CVE-2026-35386.patch \
            file://CVE-2026-35385.patch \
-           file://CVE-2026-35387.patch \
+           file://CVE-2026-35414-CVE-2026-35387.patch \
            file://CVE-2026-35388.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"

---
base-commit: 2814f0962f56c8d1afa4de76d2895ba9b5cb767d
change-id: 20260702-openssh-cve-2026-35414-07494753183a

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


