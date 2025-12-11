Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8837FD41D7C
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 17:59:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16123.1765475952260677105
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 09:59:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B79B41063
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 09:59:04 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8D2FD3F73B
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 09:59:11 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] scripts/patchreview: use context manager when opening file
Date: Thu, 11 Dec 2025 17:59:07 +0000
Message-ID: <20251211175908.3952420-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211175908.3952420-1-ross.burton@arm.com>
References: <20251211175908.3952420-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 17:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227562

To avoid warnings about unclosed files.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/contrib/patchreview.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview=
.py
index d8d7b214e5c..dcf20937a8f 100755
--- a/scripts/contrib/patchreview.py
+++ b/scripts/contrib/patchreview.py
@@ -253,7 +253,8 @@ if __name__ =3D=3D "__main__":
=20
     if args.json:
         if os.path.isfile(args.json):
-            data =3D json.load(open(args.json))
+            with open(args.json) as f:
+                data =3D json.load(f)
         else:
             data =3D []
=20
--=20
2.43.0


