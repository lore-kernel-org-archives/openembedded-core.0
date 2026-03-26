Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA12A10A88EA
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 17:15:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52919.1774545340885307256
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 10:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=aoeJbSRs;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66C002BCB
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:15:34 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 01BAC3F641
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774545340; bh=hUNqabwdRy7Sp34oqqu2UjqqcXRadecMntV+NO8BL5o=;
	h=From:To:Subject:Date:From;
	b=aoeJbSRsArezW4HswgeXtXdrmIuxEcdtUvUYSQAQ53GepfrgdalDzfoBb9UJHkcuW
	 ntwiOrHIWY6OHStijY4crZunyneMtr+sxcVxohzm+RuWEG4T1k6FtktJ02ATeLRft5
	 /PWJssP/YDZlCBkKOaVxpXNEpm/3v98hi24scElQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] systemd: remove incorrect python3-pyzstd dependency
Date: Thu, 26 Mar 2026 17:15:33 +0000
Message-ID: <20260326171536.2014116-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 17:15:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234031

ukify has never used the pyzstd module.  It originally used the zstd
module[1], switched to zstandard[2], and as of systemd 259 will use
the standard compression.zstd if available[3].

Our Python is 3.14 which has comoression.zstd, so we don't need any
dependencies.

[1] systemd 483c9c1b8a ("ukify: try to find the uname string in the linux=
 image if not specified")
[2] systemd fbc6fecf1a ("ukify: switch from zstd to zstandard")
[3] systemd 1e5498e237 ("ukify: prefer compression.zstd when available")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd_259.5.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-co=
re/systemd/systemd_259.5.bb
index f0cc83095da..c3cb605b4df 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -642,7 +642,6 @@ RDEPENDS:${PN}-ukify =3D " \
                         python3-pefile \
                         python3-pprint \
                         python3-pydoc \
-                        python3-pyzstd \
                         python3-shell \
                        "
=20
--=20
2.43.0


