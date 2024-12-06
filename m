Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4412FE77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 23:02:34 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.50602.1733526150405404353
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 15:02:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=OOe8hPmQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202412062302278606636dd68ecb00cb-7rkojl@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202412062302278606636dd68ecb00cb
        for <openembedded-core@lists.openembedded.org>;
        Sat, 07 Dec 2024 00:02:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=zSLP0ly8K3IzBjkUrglOOaMn8P3VSdpBoNX2H4us4q4=;
 b=OOe8hPmQZNS0yzOCiepBm7gCqUHeP0DZsldjHwzjURbreWeubtxarmocVXcrnTqe+YKGEh
 BUCvVC8IQG+dOHOHcANJfuqFHg/sE4rDT3FfGEfX+BHZ8EAu48WjUE09lK1gA+RS6UaiaEYL
 SYmdFjmLDo5SY82XfUy1iHDL4vfwUKZK3CASdr3B0g/TOQrJBDVQMoRKl5tJcbpFHqZVELta
 nUhW8joDaORu7jDxtrPovBPGoLBiZzh1pMeuIhGLfvgiZtK0qjcApPU4GYuZhAJrmrsTrJpP
 /Paa65BY56JRz89MK9QgHKudhw8Rhb1oPf6INWHS6DE8PT0dw73rJxbA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] libsdl2: ignore CVE-2020-14409 and CVE-2020-14410
Date: Sat,  7 Dec 2024 00:01:40 +0100
Message-Id: <20241206230140.302542-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 23:02:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208442

From: Peter Marko <peter.marko@siemens.com>

This was fixed in 2.0.14, but NVD DB lists > 2.0.20 causing
false positives in CVE metrics.

NVD entries [1] and [2] list commit [3] which redirects to commit [4].
Also Debian 10 uses this commit, while Debian 11 with 2.0.14 does not
patch it and claims it's fixed.

Trying to apply the patch shows it's already applied.

Following shows git history of this commit wrt tags.
SDL$ git describe a7ff6e96155f550a5597621ebeddd03c98aa9294 --tags
release-2.0.12-305-ga7ff6e961
SDL$ git describe release-2.0.14 --tags --match=release-2.0.12
release-2.0.12-873-g4cd981609
SDL$ git describe release-2.0.20 --tags --match=release-2.0.12
release-2.0.12-3126-gb424665e0

[1] https://nvd.nist.gov/vuln/detail/CVE-2020-14409
[2] https://nvd.nist.gov/vuln/detail/CVE-2020-14410
[3] https://hg.libsdl.org/SDL/rev/3f9b4e92c1d9
[4] https://github.com/libsdl-org/SDL/commit/a7ff6e96155f550a5597621ebeddd03c98aa9294

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
index abcf232e25..6d30d0baa8 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
@@ -82,3 +82,6 @@ PACKAGECONFIG[x11]        = "-DSDL_X11=ON,-DSDL_X11=OFF,virtual/libx11 libxext l
 CFLAGS:append:class-native = " -DNO_SHARED_MEMORY"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# These are fixed since 2.0.14, NVD DB incorrectly lists > 20.0.20
+CVE_CHECK_IGNORE += "CVE-2020-14409 CVE-2020-14410"
-- 
2.30.2


