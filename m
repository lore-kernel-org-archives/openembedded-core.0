Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFAA8C982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 09:24:33 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5967.1790069065259960480
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 02:24:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=oYC6rHVs;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout02.t-online.de (Postfix) with SMTP id 0EEA3E792
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 11:24:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.249]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8wjc-3frliM0; Tue, 22 Sep 2026 11:24:20 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 3/5] spdx_license: give UnknownId a name
Date: Tue, 22 Sep 2026 11:23:34 +0200
Message-ID: <20260922092411.262885-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922092411.262885-1-f_l_k@t-online.de>
References: <20260922092411.262885-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790069060-88FF6986-0401A1B1/0/0 CLEAN NORMAL
X-TOI-MSGID: 0dd23829-b047-4489-8914-a6453a9ec46f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790069062; i=f_l_k@t-online.de;
	bh=mQS0fyh8kxTLJiagmdWHRlxnlYW+eCbaOAGAOD/JYv8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=oYC6rHVs4vHiuShNv8orSS7NQFvw/WYMcY9BKYdxnWZ3oFLhe2a9NU45snbcDxK5P
	 r1ovUJVaHXyqh/vA2sv8xpPoGYyF6owAWEoqIlVzxSb5ai99DEf8KK74PM/GDwy36V
	 cC76SmfzG42ehLSkUCkgbJLtX5Nrldw8kE0rG2fUQBAlEKgpSOEZaLXWQtDwWfbCqW
	 2nV58rmXKCTiDJAaJIqcwKqPizIjTabqyT9OLjhrxTYa/0eO22nL2KboCq80iHPTZ8
	 +OqyZz09JR7WsTn3NDzWblPrtzEU4grDAHkmNKeZhELnHWR0e9JGdfTTfA/3fdEa2q
	 hJKE0hoMEPSAA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 09:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246396

A LICENSE that contains an unknown identifier, as go-mod-update-modules
writes it for modules whose license it could not classify, made
do_populate_lic fail with an AttributeError in get_license_path instead
of the license-exists QA error. Give UnknownId the same name property
as LicenseId and ExceptionId so the lookup can fail gracefully.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/lib/oe/spdx_license.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/spdx_license.py b/meta/lib/oe/spdx_license.py
index 1e201f21d5..7369eca9ef 100644
--- a/meta/lib/oe/spdx_license.py
+++ b/meta/lib/oe/spdx_license.py
@@ -240,6 +240,10 @@ class Identifier(Node):
=20
=20
 class UnknownId(Identifier):
+    @property
+    def name(self):
+        return self.ident
+
     @classmethod
     def reduce(cls, stack, lookahead):
         if not check_stack_types(stack, [Token]):
--=20
2.55.0


