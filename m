Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299EBC61DB6
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 06:56:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16285.1787640973386464340
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 23:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XQAgoKTe;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BDBA31A1810
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 06:56:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8CD52604C4
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 06:56:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1375F11C79F39;
	Tue, 25 Aug 2026 08:56:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787640967; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pJt58PPN2stMVpuYfB2tHf2AkFawTaOGsTtRhONhRoo=;
	b=XQAgoKTepZ7cbzt/9SB8eZt6EBb3x39jB4RvLNe/YS78vFdN+/bcpRKqYXbP5PSDptuScV
	e9RdWXOtmkDTaQI3IgbViLg4gKqOzcfbXdem+lN1ySFfZPkO89ondOPVGM78m5JN56kKYI
	et28YgHZoAWWn4u3wKZNAUBLK2W+a3W6ozFiG179qELGBW17e4nYVAZagRblLncJE6s4z3
	y9lF5vN4zD7CPv992bplP0COOaDuYDeJxNw2/ugInFIh2QwYWCNpJJF63ndlBWTKgNazp3
	auu7oYlSJw1HbhE8a4GpJf6b0AiAfUEnSUS/q04BL1rYY5t8QJY3PyJ6QVVM0w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 25 Aug 2026 08:55:50 +0200
Subject: [PATCH v2 2/3] lib/bbconfigbuild/configfragments.py: match
 Available and Enabled built-in fragment lists
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-sbom-cve-check-fragment-desc-v2-2-01c3823eb780@bootlin.com>
References: <20260825-sbom-cve-check-fragment-desc-v2-0-01c3823eb780@bootlin.com>
In-Reply-To: <20260825-sbom-cve-check-fragment-desc-v2-0-01c3823eb780@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=VxnS7CSr/lg1O/UMuL+t3QnD4g+puTdh9uvq9BHQO7w=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqjTx8+g+kd5lXDKMthB1ExtREwfNKRczlfC0ZR
 pXlQ3ua9OGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCao08fAAKCRDRgEFAKaOo
 NjqFD/41FJN2YG6UnjkBWhPPSb+pONigR255RQ8j2+tbYMJ/v6KUFwTwfFgqMbYyIa2OVE4etv9
 w1xcXCyiZlocUifKWlINIV/ZzPqxYQ6CijELQiQeGzeU9zAVh5G3KTo0FS9nAR/mLM/Fn9MaQNy
 OX5SkMa3nMGGf3b1CNp/eciqYOtK1LOIZsJ80GwIFJzy0Tk+23vzTeJ94X0DRPGQNk2IC+ZpBiF
 +Sn7d32nb+VT84qHSwcrbN+gJnZ4xEv+ZDxSd37FRkv0LHXWSHozTJETlCVUAnjuCgqvmuSICWR
 shwnK5s8dlvS2uKVw4e0RnXPzchoQR+nbPtZ6sJgkzlsnLxZmmXHytEBX625qkycbNe8iPUOYZF
 cg8RN+ndxZxdk1SfQxWIG9EuC12kNb+GxZVjz87MG1y2BeOUwG3vUcSxnNlJcrM3bOCsfjyl8qK
 C2PgsKhK35s4i4CVIjMAXdcxCi1Is3A2rMzyUmM8eOzM0P7s5+uXGDZweNvoff4pOJlRiGXDYy/
 sd5BpBesIrC73iHy3Y0p48RCO0YRlNpqyPP5/Kk5L5iCGDcF6wH1emauZ6BCAzRoSGgYieKIUPE
 hB6e5aQ86dE/ldYYEzoJ17V9USzdUxdYK1IKXJlNL+os4j+gacSjfGhgYfxow8secXxua15RMwj
 T/GTo0+bwwUE1fg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 06:56:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244207

Make the output of "Available built-in fragments" and "Enabled built-in
fragments" use the same output format:

  Available built-in fragments:
  machine/...     Sets MACHINE = "..."

  Enabled built-in fragments:
  machine/qemuarm64       Sets MACHINE = "qemuarm64"

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/lib/bbconfigbuild/configfragments.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
index 47605f3ddb..ccc1d8b610 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -66,7 +66,7 @@ class ConfigFragmentsPlugin(LayerPlugin):
             print('Available built-in fragments:')
             builtin_dict = {i[0]:i[1] for i in [f.split(':') for f in builtin]}
             for prefix,var in builtin_dict.items():
-                print('{}/...\tSets {} = ...'.format(prefix, var))
+                print('{}/...\tSets {} = "..."'.format(prefix, var))
             print('')
             enabled_builtin_fragments = [f for f in enabled if self.builtin_fragment_exists(f)]
             print('Enabled built-in fragments:')

-- 
2.55.0


