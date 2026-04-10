Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4820F44863
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 13:11:12 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155765.1775826664541136657
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 06:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rB1fjEVV;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9B2FE4E429B0;
	Fri, 10 Apr 2026 13:11:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70031603F0;
	Fri, 10 Apr 2026 13:11:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C99F81045001A;
	Fri, 10 Apr 2026 15:10:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775826661; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=5oXq6/V9ggr+EAwdPxezTog7glo60qc6ETc2bGS495A=;
	b=rB1fjEVVbJsFr6fV6T1ri5eAJO+vpA4wdywucoVCs4XXDWiTxdhcHFi/bWP/JcmAP8SABU
	bWTjyLkUF96/ANw1H0nMaCv5RhABWF8vuF/VZ+0Jwf7Ke7kWVOB2uPLIOV/qDTemxZBgOA
	RFIbkT3pztZxwvJ8TBQC2Ij6lFWPqc5tQdFSxOG3leu5AGkTZdLNKJqLoAJ+aa6dVChbFp
	Bdqa3AGYeFPMhmtiULDCN8vZeuLH8od4VWpyZedkQPPJic7ob4aFWk4eIAQuLktUCxIO+n
	Bx/hdOV0hzt5WOn8vZmki2safpZVfPYF0TyxhJ4ySCyOwXI9UbFKlAijUUkEbw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Subject: [PATCH 0/4] cve: Fix escaping of CPE
Date: Fri, 10 Apr 2026 15:10:42 +0200
Message-Id: <20260410-fix-cpe-escaping-v1-0-ed63c2477f46@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSw6DMAxF0a0gj7GUQMtvK4hBMC6YQYhiWlVC7
 L0pDI/03j1AOQordNkBkT+isvkEm2dAi/Mzo0zJUJiiMg9r8CVfpMDISi6In/E5Uuuq2jWTLSH
 dQuS0uZL9cFvf48q0/ztwnj8r5sH2dAAAAA==
X-Change-ID: 20260410-fix-cpe-escaping-5bc9a67a8d13
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
 peter.marko@siemens.com, stefano.tondo.ext@siemens.com, 
 jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 13:11:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235024

This series tries to fix the regression introduced by commit
9dd9c0038907 ("cve_check: Escape special characters in CPE 2.3 strings")

CVE_PRODUCT was already escaped. Now it no longer needs to be escaped,
otherwise double escaping is realized.

Also add a patch in this series that try to handle the transition between
the previous behavior and the new one.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
Benjamin Robin (4):
      cve_check: Improve escaping of special characters in CPE 2.3
      cve_check: do not break old CVE_PRODUCT with escaped +
      gtk+: Remove escaping of the plus sign in `CVE_PRODUCT`
      webkitgtk: Remove escaping of the plus sign in `CVE_PRODUCT`

 meta/lib/oe/cve_check.py                     | 29 ++++++++++++++--------------
 meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb     |  2 +-
 meta/recipes-sato/webkit/webkitgtk_2.50.6.bb |  2 +-
 3 files changed, 16 insertions(+), 17 deletions(-)
---
base-commit: 853baa702e3275fc8b4dc492a93d9a00c8cf5c0f
change-id: 20260410-fix-cpe-escaping-5bc9a67a8d13

Best regards,
--  
Benjamin Robin <benjamin.robin@bootlin.com>


