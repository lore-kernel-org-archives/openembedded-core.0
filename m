Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCEB5C4450B
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 14:17:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6905.1784125052971051441
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 07:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=POmIV/Ny;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55A261477
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:17:28 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2F4D33F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784125052; bh=Fzy7uyh+fZB3Y4FqMFkCk8ag4jumibQ7KWsgJNLMgOU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=POmIV/NyVSHv/97NeTPVpaD8ahmWi6DuVkj21/4GybweIO8by022QC3UCXXPpF1nE
	 ybQS4E4KIr+GjRVzySH1NxBzWEYOgSw/jjzwxwVZIC/muXQD+UfeshGkYET+t4QqzW
	 sdqfSuMak3ZbLW2ejMwFY1rg7OkTObuJNSml3dkM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] classes/testimage: capture systemd coredumps on failure
Date: Wed, 15 Jul 2026 15:17:28 +0100
Message-ID: <20260715141728.2384771-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715141728.2384771-1-ross.burton@arm.com>
References: <20260715141728.2384771-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 14:17:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240974

Add /var/lib/systemd/coredump/ to the list of artifacts to save on test
failures, as this is where coredumpctl will write any core dumps that
have occured during testimage.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/testimage.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/=
testimage.bbclass
index 9902b8a5682..fd20eafdf90 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -28,6 +28,7 @@ TESTIMAGE_FAILED_QA_ARTIFACTS =3D "\
     ${sysconfdir}/version \
     ${sysconfdir}/os-release \
     ${nonarch_libdir}/os-release \
+    ${localstatedir}/lib/systemd/coredump/ \
 "
=20
 # If some ptests are run and fail, retrieve corresponding directories
--=20
2.43.0


