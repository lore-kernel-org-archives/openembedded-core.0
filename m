Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F39ACD4F53
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 10:25:20 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.18633.1695378318572239601
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 03:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=alVQaArd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 58C4640004;
	Fri, 22 Sep 2023 10:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695378316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=n6U/glkUF72HegLCVAgzROqzqvauMFsI4VXVGDnQnFE=;
	b=alVQaArdXGEIoxeDPkRjULnV6vTf7tWqyfoC8vktSlDIlWRcR9FVJifkhX83rms/JfaXR7
	h8aGJvJAKdqhV4Vt/BD16mIL7DUgJxEC2r2ugGq5ymAX8Z6llPlZN2UYUguNexSPyAW3C4
	AlFEkwbtGgGYvL9WHjZ1IBNO6pPtuUhe5DWYrSEdaa3BtJEgDS+irxwsM80hqbg0Ap2eXR
	RORO1Uk9bnM9zHOeuQ1M+TvkvoOeNwTqe7m+cFXiu9LXmvQlN7r2nWlngybSv2BcyBno2b
	fJ9KJNO1531dXFm2PTc3LsQKiyIVSmiFwhv2GlB9ByvFW6FNo2+9Y937BhdpTQ==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Meenali Gupta <meenali.gupta@windriver.com>
Subject: [dunfell][PATCH] flac: fix CVE-2020-22219
Date: Fri, 22 Sep 2023 12:25:06 +0200
Message-Id: <20230922102506.1341353-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 10:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188093

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Buffer Overflow vulnerability in function bitwriter_grow_ in flac before
1.4.0 allows remote attackers to run arbitrary code via crafted input to
the encoder.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Tested-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

---
 meta/recipes-multimedia/flac/flac_1.3.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/flac/flac_1.3.3.bb b/meta/recipes-multimedia/flac/flac_1.3.3.bb
index cb6692aedf..ca04f36d1a 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.3.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.3.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
 DEPENDS = "libogg"
 
 SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
+           file://CVE-2020-22219.patch \
 "
 
 SRC_URI[md5sum] = "26703ed2858c1fc9ffc05136d13daa69"
-- 
2.34.1


