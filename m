Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A408CCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 19:50:19 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.794.1759953012901104716
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 12:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Apcyebr1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202510081950059a9df333bd0002072b-smhpuf@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202510081950059a9df333bd0002072b
        for <openembedded-core@lists.openembedded.org>;
        Wed, 08 Oct 2025 21:50:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=qT+kDusy28exrxvYc+Pq0FdI2Q6MmiWVUhl/Dfn6i58=;
 b=Apcyebr17YNRKakUDXbeWhqGYyk4oQ94mDvuVNSrT6Ey9oWSvvGoOQxKiPbLEBcvI4k884
 VqLotI0MH4c0QOi8wuZrLrcHNV81i2rA0qNm1iOkE0cZUFms1k6Yzjr4Nuglwhh8dfJhBpMr
 b0gJrIgJv/G4rRMRN7VQzby4PdiZqE3zPjAsAXJH1xJTBbUHvZLxRKfBVLqSTNX19o1I0Cqy
 SqXWOynEBexIQQxUqdYCIckRmlGnWgGzu9aRncxKteQsYXRl/FCSK46wNWZgV8lpFOteX1+g
 g8Wqfvryxdv8DwbwxHJ2EZoUu8asKW2jWMBrbAS3gkWcixdq5wibEm8w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 1/2] ffmpeg: ignore CVE-2023-6603
Date: Wed,  8 Oct 2025 21:49:58 +0200
Message-Id: <20251008194959.1689404-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 19:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224594

From: Peter Marko <peter.marko@siemens.com>

Per [1] this CVE is fixed by [2] which is available in version 5.0, so
version 5.0.3 is not vulnerable anymore.

[1] https://security-tracker.debian.org/tracker/CVE-2023-6603
[2] https://github.com/FFmpeg/FFmpeg/commit/28c83584e8f3cd747c1476a74cc2841d3d1fa7f3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index a46cb3480a..d64b97e787 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -101,6 +101,10 @@ CVE_CHECK_IGNORE += "CVE-2022-3109"
 # bugfix: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/481e81be1271ac9a0124ee615700390c2371bd89
 CVE_CHECK_IGNORE += "CVE-2022-3341"
 
+# This vulnerability was fixed in 5.0
+# bugfix: https://github.com/FFmpeg/FFmpeg/commit/28c83584e8f3cd747c1476a74cc2841d3d1fa7f3
+CVE_CHECK_IGNORE += "CVE-2023-6603"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"

