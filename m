Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055F0C79FBF
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 11:04:42 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11257.1789038273788151417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 04:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Z68CAxUM;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 716C5C2BB0D
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 11:05:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A6FF602B8
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 11:04:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C5B611C78AEE;
	Thu, 10 Sep 2026 13:04:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789038271; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=L9g/NQQImKXU1HwTFXLVOp+BlZDH7CMcLRFlf7/0EJs=;
	b=Z68CAxUMenewiSSRFJq+191N2yCigRmzWnZ+k8cIhPo5FDtTlet8hcUCnOPjMPI6ypQv+d
	hVBpz30nzit8dwb6QgQUPhNFC11+uSM+JJtelWBzkIKZnGGpDGmrMSzVxwABz4UT0RaT1B
	lQykZpIg1d20/dBbNc/bQqWYI85C3sWz8Xvjeufw+h0ok9KjlDJmLpVxBkTLN8+iwMu/CJ
	zegZSSqqGs1RZcTplMtbKxveESa7xiXgTX6ryUpdPRL88elI7TDfJJA3h+Cw/4sKnJ4sQK
	dn6Iytx4CI3TVdc/ILgKNRm+4xwm84PUdb7QdZzFTAjAADmHzxmsD4P17EBlGQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Thu, 10 Sep 2026 13:03:59 +0200
Subject: [PATCH 6/7] libcap-ng,libcap-ng-python: upgrade 0.9.5 -> 0.9.6
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-mathieu-updates-2026-09-10-v1-6-da1b555eace9@bootlin.com>
References: <20260910-mathieu-updates-2026-09-10-v1-0-da1b555eace9@bootlin.com>
In-Reply-To: <20260910-mathieu-updates-2026-09-10-v1-0-da1b555eace9@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789038241; l=2187;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=/5DhVYo140Wxv1cevGAYkn7dj14HMd+RVHjqMePVTao=;
 b=I8Oe4Hp2eo1Favi4p7WFgbVwEV82O0GIxPuJvUcC5Ay56TX9RWdPUHqkAhWLX21xfT1bKA2Xd
 K3mKmAuB0rDBwu4jijiLcYCJOjHcphWDOeZX1g1BCceYqR0034nxSWY
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 11:04:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245556

Changelog:

- Fix supplementary group changes in capng_change_id
- Reduce cap-audit size and memory use; builds now require llvm-strip
- Preserve capability evidence during cap-audit shutdown
- In cap-audit, fix optional SETPCAP false positives w/o hiding required caps
- Fix ambient capabilities and capability list handling in cap-audit --service
- In cap-audit, reject unsupported systemd unit syntax
- Fix tree branch drawing for repeated socket owners in netcap --advanced
- Fix utility builds with musl libc
- Ensure capng_change_id is multi-thread safe

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../libcap-ng/{libcap-ng-python_0.9.5.bb => libcap-ng-python_0.9.6.bb}  | 0
 meta/recipes-support/libcap-ng/libcap-ng.inc                            | 2 +-
 .../libcap-ng/{libcap-ng_0.9.5.bb => libcap-ng_0.9.6.bb}                | 0
 3 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.5.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.6.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.9.5.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.9.6.bb
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 2a31be6f4ddc..0f3179f59f97 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 SRC_URI = "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "9ae44402f4c405f08b9dd5ec070127d0d92afee4"
+SRCREV = "c382c641ca5730442289c09d3c3d30cc2c8635a9"
 
 inherit lib_package autotools pkgconfig bash-completion
 
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb

-- 
2.47.3


