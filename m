Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BC0C54E58
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 14:38:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23984.1710513474606127146
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 07:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F32DDC15
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 07:38:28 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4E2EB3F73F
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 07:37:53 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] python3_pip517: just count wheels in the directory, not subdirectories
Date: Fri, 15 Mar 2024 14:37:49 +0000
Message-Id: <20240315143751.1235135-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 14:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197136

From: Ross Burton <ross.burton@arm.com>

The install task uses a recursive find to check that it can only find
one wheel, but then does a non-recursive glob to install.  This can
lead to false-failures if PEP517_WHEEL_PATH points at a directory with
subdirectories.

Solve this mismatch by making the find non-recusive.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/python_pep517.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python_pep517.bbclass b/meta/classes-rec=
ipe/python_pep517.bbclass
index a1659c5f628..c30674c8ec8 100644
--- a/meta/classes-recipe/python_pep517.bbclass
+++ b/meta/classes-recipe/python_pep517.bbclass
@@ -42,7 +42,7 @@ python_pep517_do_compile () {
 do_compile[cleandirs] +=3D "${PEP517_WHEEL_PATH}"
=20
 python_pep517_do_install () {
-    COUNT=3D$(find ${PEP517_WHEEL_PATH} -name '*.whl' | wc -l)
+    COUNT=3D$(find ${PEP517_WHEEL_PATH} -name '*.whl' -maxdepth 1 | wc -=
l)
     if test $COUNT -eq 0; then
         bbfatal No wheels found in ${PEP517_WHEEL_PATH}
     elif test $COUNT -gt 1; then
--=20
2.34.1


