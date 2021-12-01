Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B869C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 15:42:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.93368.1638373356528786064
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 07:42:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 381F2147A
	for <openembedded-core@lists.openembedded.org>;
 Wed,  1 Dec 2021 07:42:35 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7FEA3F766
	for <openembedded-core@lists.openembedded.org>;
 Wed,  1 Dec 2021 07:42:34 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] recipetool: extend curl detection when creating recipes
Date: Wed,  1 Dec 2021 15:42:32 +0000
Message-Id: <20211201154232.25193-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201154232.25193-1-ross.burton@arm.com>
References: <20211201154232.25193-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 15:42:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159036

If a configure.ac uses LIBCURL_CHECK_CONFIG it wants curl.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/recipetool/create_buildsys.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/reci=
petool/create_buildsys.py
index 35a97c9345..5015634476 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -545,7 +545,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
                 deps.append('zlib')
             elif keyword in ('AX_CHECK_OPENSSL', 'AX_LIB_CRYPTO'):
                 deps.append('openssl')
-            elif keyword =3D=3D 'AX_LIB_CURL':
+            elif keyword in ('AX_LIB_CURL', 'LIBCURL_CHECK_CONFIG'):
                 deps.append('curl')
             elif keyword =3D=3D 'AX_LIB_BEECRYPT':
                 deps.append('beecrypt')
@@ -624,6 +624,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
                     'AX_CHECK_OPENSSL',
                     'AX_LIB_CRYPTO',
                     'AX_LIB_CURL',
+                    'LIBCURL_CHECK_CONFIG',
                     'AX_LIB_BEECRYPT',
                     'AX_LIB_EXPAT',
                     'AX_LIB_GCRYPT',
--=20
2.25.1


