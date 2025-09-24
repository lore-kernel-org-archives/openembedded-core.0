Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698F3CAC5B3
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:07:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10835.1758715673029197184
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62D77497
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 05:07:44 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1FE1F3F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 05:07:52 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] classes/cython: also process .cpp files
Date: Wed, 24 Sep 2025 13:07:39 +0100
Message-ID: <20250924120745.2883969-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924120745.2883969-1-ross.burton@arm.com>
References: <20250924120745.2883969-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 12:07:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223966

Some Python packages, such as python3-frozenlist, generate .cpp files
with cython so we should also process those.

Frustratingly this doesn't actually solve the reproducible problem with
frozenlist as the path is a temporary directory...

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/cython.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cython.bbclass b/meta/classes-recipe/cyt=
hon.bbclass
index dd9fc732bcb..9ae7a291345 100644
--- a/meta/classes-recipe/cython.bbclass
+++ b/meta/classes-recipe/cython.bbclass
@@ -4,5 +4,5 @@ do_compile[postfuncs] =3D "strip_cython_metadata"
 strip_cython_metadata() {
     # Remove the Cython Metadata headers that we don't need after the bu=
ild, and
     # may contain build paths.
-    find ${S} -name "*.c" -print0 | xargs --no-run-if-empty --null sed -=
i -e "/BEGIN: Cython Metadata/,/END: Cython Metadata/d"
+    find ${S} \( -name "*.c" -o -name "*.cpp" \) -print0 | xargs --no-ru=
n-if-empty --null sed -i -e "/BEGIN: Cython Metadata/,/END: Cython Metada=
ta/d"
 }
--=20
2.43.0


