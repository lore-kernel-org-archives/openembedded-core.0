Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E51C5AC82
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 11:53:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28042.1786362786924649383
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 04:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=BbquFi+9;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92B1714BF
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:53:02 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 38AF93F632
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786362786; bh=OfISK2L5x3G9Ta+komX/67qpl5yqEZOoZ93+hgEVBMQ=;
	h=From:To:Subject:Date:From;
	b=BbquFi+9+Mj7UsCLiwPMMHNdQDXRvYWNap6HJM/817ggWFP+hwIS/6wstX21Kvb+0
	 R1MvdN28T097KOlGZs+28VPdFcG3QKAc4ScRg7OWke5b+E5+7NDOfQlu3h+BQCgl9O
	 n29CH6YfCgd0ZvcFE/++B8wX0GHOs86YjmjLaoV4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] classes/setuptools3: skip the backend-check early
Date: Mon, 10 Aug 2026 12:53:02 +0100
Message-ID: <20260810115304.562663-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 11:53:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243127

There's no point doing the backend check if we're going to ignore it,
so check INSANE_SKIP first.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/setuptools3.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/setuptools3.bbclass b/meta/classes-recip=
e/setuptools3.bbclass
index 0bbe3780231..b29152e7664 100644
--- a/meta/classes-recipe/setuptools3.bbclass
+++ b/meta/classes-recipe/setuptools3.bbclass
@@ -13,6 +13,9 @@ SETUPTOOLS_BUILD_ARGS ?=3D ""
 SETUPTOOLS_SETUP_PATH ?=3D "${S}"
=20
 python do_check_backend() {
+    if "pep517-backend" in (d.getVar("INSANE_SKIP") or "").split():
+        return
+
     import re
     filename =3D d.expand("${SETUPTOOLS_SETUP_PATH}/pyproject.toml")
     if os.path.exists(filename):
@@ -21,8 +24,7 @@ python do_check_backend() {
             if not match: continue
=20
             msg =3D f"inherits setuptools3 but has pyproject.toml with {=
match[1]}, use the correct class"
-            if "pep517-backend" not in (d.getVar("INSANE_SKIP") or "").s=
plit():
-                oe.qa.handle_error("pep517-backend", msg, d)
+            oe.qa.handle_error("pep517-backend", msg, d)
     oe.qa.exit_if_errors(d)
 }
 addtask check_backend after do_patch before do_configure
--=20
2.43.0


