Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF75C982F1
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 09:24:33 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5997.1790069065259918692
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 02:24:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Gewrrq/7;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout02.t-online.de (Postfix) with SMTP id 2C4A2E9D0
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 11:24:22 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.249]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8wjc-3frliO0; Tue, 22 Sep 2026 11:24:20 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 5/5] go-mod-update-modules: include the generated files from the class
Date: Tue, 22 Sep 2026 11:23:36 +0200
Message-ID: <20260922092411.262885-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922092411.262885-1-f_l_k@t-online.de>
References: <20260922092411.262885-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790069060-E97F9986-0496B2EA/0/0 CLEAN NORMAL
X-TOI-MSGID: 443ec9a8-3117-46bb-8843-d0d525fb0b81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790069062; i=f_l_k@t-online.de;
	bh=/1D7qFwD+8GCj14cq3Va6OzIdr/TN596daE7ATugo68=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Gewrrq/7QrJrEmn8bZ6QjrQXtY7PyFAPV87nAFbPFcF7JZaA3h0JFHiICNcbCSru2
	 4mcUbQLsX79Tq2jusjUpKk9Kda5Ei7afbB0bE1OLy5qB7AwulhSyJIqCBfvzLBvE0l
	 u23ZpAlI/THenpd1TX5xxYG1Hwlib7FhOmmJIMFg3GbHdkll1Ow7oT6Zjwi7nYZ3P/
	 VvS+MvVtH+33C45BWQPWslmMuYDn30ss91HBp5lvhtYZbCXWbXcWN0FgUw5qbr8Adv
	 i78dczIAENFAwcAgaVKXpkNdCLmtq+5pcigi6xdzknKrhMhoju7xGFYAgQyF5ezP1C
	 g/T/IyBGpbY5w==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 09:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246399

A new recipe could not be parsed before its first update_modules run
because it had to require the two generated files itself. Include them
from the class instead, relative to the recipe, so a missing file is
tolerated until the task has written it.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/classes-recipe/go-mod-update-modules.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/go-mod-update-modules.bbclass b/meta/cla=
sses-recipe/go-mod-update-modules.bbclass
index 3a0f0a3377..bae9e47c0d 100644
--- a/meta/classes-recipe/go-mod-update-modules.bbclass
+++ b/meta/classes-recipe/go-mod-update-modules.bbclass
@@ -10,7 +10,12 @@ do_update_modules[network] =3D "1"
 # -licenses.inc will append LICENSE and LIC_FILES_CHKSUM with the found =
licenses
 # in the modules.
 #
-# These files are machine-generated and should not be modified.
+# These files are machine-generated and should not be modified. They are
+# included here so that a new recipe parses before they have been genera=
ted
+# by the first run of the update-modules task.
+
+include ${FILE_DIRNAME}/${BPN}-licenses.inc
+include ${FILE_DIRNAME}/${BPN}-go-mods.inc
=20
 python do_update_modules() {
     import subprocess, tempfile, json, re, urllib.parse
--=20
2.55.0


