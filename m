Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9816CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 21:10:59 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.2873.1759957851230621606
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 14:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=BkBXU+Ly;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20251008211047344591d65300020701-a4ru2w@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20251008211047344591d65300020701
        for <openembedded-core@lists.openembedded.org>;
        Wed, 08 Oct 2025 23:10:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=UwR7/E9GeZNhYp1XLel02/+lFSEELJVC0anfRJS2YwU=;
 b=BkBXU+LyI4U64WxWdim1oFNngwfpqpOYiMv5rREzF8KQNm50G5AqLzNITFqmr+cXAzYuqP
 tKxJ+Jas8wg3zTXixIvRgAmgNDwamgubgnsFvMQ+IiTBgUH2gQ5T6W0aozjRBXwrZIHgZbyY
 K7e8XJ+LbpnFRbO5LBb83Ons8Bh1jhDw+UV+ygDNbs7Zr8CAYw5qYaNQWOlKMSDpyZpzgITe
 NOyEPl5LiqqWnDVe1IKaHVuJGI4hMlZ69xDCOcRcfG/lvho/Edwj1ooV3er+tuPFhepifYgs
 0pseFw1lOSs6EazDZA44D18rBxZa1ovyi6ofBj99T1IIACouX+rJXFEg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] ffmpeg: ignore 8 CVEs fixed in 6.1.1 and  6.1.3 releases
Date: Wed,  8 Oct 2025 23:10:45 +0200
Message-Id: <20251008211045.1704195-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 21:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224602

From: Peter Marko <peter.marko@siemens.com>

Following are mentioned in commit upgrading the recipe to 6.1.3:
* CVE-2023-49502 CVE-2023-50007 CVE-2023-50008 CVE-2024-31578 CVE-2024-31582

Following are fixed via mentioned commits already in 6.1.1:
* CVE-2023-50009: https://github.com/FFmpeg/FFmpeg/commit/162b4c60c8f72be2e93b759f3b1e14652b70b3ba
* CVE-2023-50010: https://github.com/FFmpeg/FFmpeg/commit/e809c23786fe297797198a7b9f5d3392d581daf1
* CVE-2024-31585: https://github.com/FFmpeg/FFmpeg/commit/3061bf668feffc7c1f0b244205167b3b86da8015

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb
index dbd0a3f270f..38c6d1f2b7d 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb
@@ -50,6 +50,10 @@ CVE_STATUS[CVE-2023-39018] = "cpe-incorrect: This issue belongs to ffmpeg-cli-wr
 # Fixed: https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/43be8d07281caca2e88bfd8ee2333633e1fb1a13
 CVE_STATUS[CVE-2025-1373]  = "fixed-version: Vulnerable code not present in any release"
 
+CVE_STATUS_GROUPS += "CVE_STATUS_FIXED_61x"
+CVE_STATUS_FIXED_61x = "CVE-2023-49502 CVE-2023-50007 CVE-2023-50008 CVE-2023-50009 CVE-2023-50010 CVE-2024-31578 CVE-2024-31582 CVE-2024-31585"
+CVE_STATUS_FIXED_61x[status] = "cpe-incorrect:these CVEs are fixed in 6.1.x"
+
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"

