Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6350FC87FCA
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 16:20:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.733.1753374058883367919
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 09:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B7D41A00
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 09:20:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 21A2A3F66E
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 09:20:58 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 2/2] ccache: drop CCACHE_COMPILERCHECK
Date: Thu, 24 Jul 2025 17:20:54 +0100
Message-ID: <20250724162054.2265319-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724162054.2265319-1-ross.burton@arm.com>
References: <20250724162054.2265319-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 16:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220850

This variable controls how ccache determines if the cache is valid or not
for a given compiler.

By default, ccache looks at the mtime of the compiler binary. This should
be sufficient for our purposes as the mtime is preserved from sstate
and will only be changed on rebuilds if the binary is actually different.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/ccache.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index 7c42e66bdf4..7daaa7e3aa2 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -37,9 +37,6 @@ CCACHE_NATIVE_RECIPES_ALLOWED ?=3D ""
 # in different builds.
 export CCACHE_BASEDIR ?=3D "${TMPDIR}"
=20
-# Used for sharing cache files after compiler is rebuilt
-export CCACHE_COMPILERCHECK ?=3D "%compiler% -dumpspecs"
-
 export CCACHE_CONFIGPATH ?=3D "${COREBASE}/meta/conf/ccache.conf"
=20
 export CCACHE_DIR ?=3D "${CCACHE_TOP_DIR}/${MULTIMACH_TARGET_SYS}/${PN}"
--=20
2.43.0


