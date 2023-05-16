Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1888C7EE24
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 18:40:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.29900.1684262441633885715
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 11:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BADE2F4;
	Tue, 16 May 2023 11:41:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BE7EE3F793;
	Tue, 16 May 2023 11:40:40 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	kubiznak@2n.com
Subject: [PATCH 5/7] gi-docgen.bbclass: depends on gobject-introspection-data being enabled
Date: Tue, 16 May 2023 19:40:29 +0100
Message-Id: <20230516184031.2255171-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516184031.2255171-1-ross.burton@arm.com>
References: <20230516184031.2255171-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 18:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181418

From: Ross Burton <ross.burton@arm.com>

The gi-docgen tool depends, as it's name suggests, on
gobject-introspection being available.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/gi-docgen.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/gi-docgen.bbclass b/meta/classes-recipe/=
gi-docgen.bbclass
index 8b7eaacea3f..eb30c6011f8 100644
--- a/meta/classes-recipe/gi-docgen.bbclass
+++ b/meta/classes-recipe/gi-docgen.bbclass
@@ -10,7 +10,8 @@
=20
 # This variable is set to True if api-documentation is in
 # DISTRO_FEATURES, and False otherwise.
-GIDOCGEN_ENABLED ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'api-docu=
mentation', 'True', 'False', d)}"
+GIDOCGEN_ENABLED ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'api-docu=
mentation gobject-introspection-data', 'True', 'False', d)}"
+
 # When building native recipes, disable gi-docgen, as it is not necessar=
y,
 # pulls in additional dependencies, and makes build times longer
 GIDOCGEN_ENABLED:class-native =3D "False"
--=20
2.34.1


