Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0957FC3DA4A
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 15:24:08 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.10682.1722871442152866228
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 08:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ibEcQWvS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20240805152359e1c879d371abdcceb6-rajiph@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20240805152359e1c879d371abdcceb6
        for <openembedded-core@lists.openembedded.org>;
        Mon, 05 Aug 2024 17:24:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=1FGF9QQt4b4E72+Uh+2DXeicYK7y8PhOlQ4sB0+t2T4=;
 b=ibEcQWvS+xYDz7ivb5GZzg0ttEbA5o1dXWehI/HvyULZsAXoWjFfZmCaPrwVrMaZpysNJx
 Ws9vDU2mymd4W3qzavJQ8lchZ9z+UNAYx1G0LFFKKNbC4QECcQjCZTWzd2cBkXeT9iVcn/XW
 f4EO0oPgbpHYCwEqNWcMIJAabIs+6SzKcLl/wfjag1qO2c6Np2S000rXv82qGe2UHVPK7g0n
 z+tEhIs99Ql3XHgzRG2CGZpCltSIF0wfnqgc6Nx8Q1f75vBsV1SCUDPluVoIf7sB93uCwTci
 EiSsyWvCRTuzwb5i4kMdfD7tRAIJBFOZVrB1u0T5ySXG054Km3dkPjGQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][PATCH] libmnl: explicitly disable doxygen
Date: Mon,  5 Aug 2024 17:23:09 +0200
Message-Id: <20240805152309.8766-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 15:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202999

From: Peter Marko <peter.marko@siemens.com>

libmnl autoconf autodetects doxygen to generate manpages.
If doxygen is provided via hosttools, the build fails.
Also until now manpages were not needed.
So explicitly disable doxygen in configure step.

(From OE-Core rev: 8d7bbf4d6936d831e341e9443a6b3711be09c7ab)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/libmnl/libmnl_1.0.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/libmnl/libmnl_1.0.5.bb b/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
index 748326c0a0..66b30d7f60 100644
--- a/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
+++ b/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
@@ -11,4 +11,6 @@ SRC_URI[sha256sum] = "274b9b919ef3152bfb3da3a13c950dd60d6e2bcd54230ffeca298d03b4
 
 inherit autotools pkgconfig
 
+EXTRA_OECONF += "--with-doxygen=no"
+
 BBCLASSEXTEND = "native"
-- 
2.30.2


