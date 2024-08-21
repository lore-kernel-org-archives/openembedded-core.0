Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E87C52D7C
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 11:42:33 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.17667.1724240548021312159
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 04:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: esben@geanix.com)
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sgjjM-0009sV-WF; Wed, 21 Aug 2024 13:42:25 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sgjjN-000Kmo-19;
	Wed, 21 Aug 2024 13:42:24 +0200
From: esben.haabendal@huawei.com
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Esben Haabendal <esben@geanix.com>
Subject: [PATCH] mesa: Fix build with etnaviv gallium driver
Date: Wed, 21 Aug 2024 13:42:24 +0200
Message-ID: <f0385d39c4df4823383e476f4cdb4a538766f707.1724239111.git.esben@geanix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27374/Wed Aug 21 10:47:59 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 11:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203584

From: Esben Haabendal <esben@geanix.com>

As of mesa version 24.1.0, the etnaviv gallium driver requires the Python
pycparser module when building.

Without it, build fails with something like:

../mesa-24.1.4/src/etnaviv/hwdb/meson.build:17:2: ERROR: Problem encountered: Python (3.x) pycparser module >= 2.20 required to build mesa.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 973b76213571..20a352b9b758 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -149,7 +149,7 @@ OPENCL_NATIVE = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-Dopencl-na
 PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools python3-ply-native"
 
 PACKAGECONFIG[broadcom] = ""
-PACKAGECONFIG[etnaviv] = ""
+PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
 PACKAGECONFIG[freedreno] = ""
 PACKAGECONFIG[kmsro] = ""
 PACKAGECONFIG[vc4] = ""
-- 
2.45.2


