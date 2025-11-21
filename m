Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA83CFA76B
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 09:54:35 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8131.1763718866533331410
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 01:54:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=IrjJBjg7;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C0B19C10199;
	Fri, 21 Nov 2025 09:54:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2840D60719;
	Fri, 21 Nov 2025 09:54:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 08E2810371E8C;
	Fri, 21 Nov 2025 10:54:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763718864; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=wVnSF+0mwo1kAqyA1/Gulyd28KtE7GEVWFloAlwhxbc=;
	b=IrjJBjg7ntre6L6jV2utIARGUyZ9nMQbN5CtEzEhVXAu7z6uK65NWsYQwB+F80JqAhpfNn
	aeMG2n7SzSffZMwjZeDixJWHdHKeU5KIIMgprafr4QUq8v+cYn/Dob/r4C4isn1j11Gv3l
	CRbgL7gTXVEcmBzZya7ch851yBF1nU/fF9Q2dt96Y2K5QIg9c3SdXnKL7tFf9neqNMQVAk
	cc3bZBmLraCgfN6F8kDIgtpg44YReOYJg2ZHlSHkVGYV0uH2lAs+wzGKZHfktsA5hiUQFl
	2ZO+T/sFLqY22VGCh9pUsOyiDL7nueFqia2kjK8jTYfjjWH0L9iZJvHFdG406w==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	mathieu.dubois-briand@bootlin.com,
	miquel.raynal@bootlin.com,
	antonin.godard@bootlin.com,
	kamel.bouhara@bootlin.com,
	pascal.eberhard@se.com,
	jpewhacker@gmail.com,
	Peter Marko <peter.marko@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap v2 4/5] spdx: extend CVE_STATUS variables
Date: Fri, 21 Nov 2025 10:54:12 +0100
Message-ID: <20251121095415.288301-5-benjamin.robin@bootlin.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251121095415.288301-1-benjamin.robin@bootlin.com>
References: <20251121095415.288301-1-benjamin.robin@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 09:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226661

If spdx is generated without inheriting cve/vex classes (which is poky
default), only explicitly set CVE_STATUS fields are handled.
Calculated ones (e.g. from CVE_STATUS_GROUPS) are ignored.

Fix this by expanding the CVE_STATUS in spdx classes.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ead9c6a8770463c21210a57cc5320f44f7754dd3)
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
---
 meta/classes/spdx-common.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.=
bbclass
index 36feb5680777..713a7fc651e5 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -37,6 +37,11 @@ SPDX_CUSTOM_ANNOTATION_VARS ??=3D ""
=20
 SPDX_MULTILIB_SSTATE_ARCHS ??=3D "${SSTATE_ARCHS}"
=20
+python () {
+    from oe.cve_check import extend_cve_status
+    extend_cve_status(d)
+}
+
 def create_spdx_source_deps(d):
     import oe.spdx_common
=20
--=20
2.51.2


