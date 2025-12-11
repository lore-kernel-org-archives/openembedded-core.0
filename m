Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915ACD43341
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 17:59:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16103.1765475953050079957
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 09:59:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6870B1063
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 09:59:05 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3DDD63F73B
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 09:59:12 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] oe-setup-build: use context manager when loading JSON
Date: Thu, 11 Dec 2025 17:59:08 +0000
Message-ID: <20251211175908.3952420-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211175908.3952420-1-ross.burton@arm.com>
References: <20251211175908.3952420-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 17:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227563

Use a context manager to avoid warnings about unclosed files.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/oe-setup-build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index edbcd48355a..b391f3b9254 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -21,7 +21,10 @@ def discover_templates(layers_file):
         raise Exception("List of layers {} does not exist; were the laye=
rs set up using the setup-layers script or bitbake-setup tool?".format(la=
yers_file))
=20
     templates =3D []
-    layers_list =3D json.load(open(layers_file))["layers"]
+
+    with open(layers_file) as f:
+        layers_list =3D json.load(f)["layers"]
+
     for layer in layers_list:
         template_dir =3D os.path.join(os.path.dirname(layers_file), laye=
r, 'conf','templates')
         if os.path.exists(template_dir):
--=20
2.43.0


