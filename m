Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 463EEC3DA64
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 21:43:14 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.35081.1722807789871466002
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 14:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=fENB5hh/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20240804214306a42f2b99ed64c9f301-iz4pge@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20240804214306a42f2b99ed64c9f301
        for <openembedded-core@lists.openembedded.org>;
        Sun, 04 Aug 2024 23:43:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=f9jksnbRfnCNN98dJkUl0Hi5URpwIbIXYrEYfjKKwJA=;
 b=fENB5hh/IIKpqb8j5PjSJrtfWelPuVsE3nHnju7xcsS7PrJx3W7xyZHXOZk6BPMnLtXvwT
 QSTzeriFEC5K2gF39DsUFB4z5BDVZO5MyPp6eNX8lbaLSNUtxrttajwOv7bKCHWMt1Umo38G
 3Ginra9sArfEi2P/cxBPXA/y91NKiR0tyEgIW4xIxO7pEV9qYPXCZ1EjB9vhU+C9SVhAVnWG
 /VDGZKFfrFeR8/0v0d5c3iUYmp23ozMBKL/GY3Ojgo1f3UiYD+rqf/PQhGykbuAJdM+GZoj+
 jkWu4a+P4NWsWppmHsnBeOmFRM+rC34KurUXL7VKKf5aEVOeI9SNwcFg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] libmnl: explicitly disable doxygen
Date: Sun,  4 Aug 2024 23:42:18 +0200
Message-Id: <20240804214218.1666876-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 21:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202980

From: Peter Marko <peter.marko@siemens.com>

libmnl autoconf autodetects doxygen to generate manpages.
If doxygen is provided via hosttools, the build fails.
Also until now manpages were not needed.
So explicitly disable doxygen in configure step.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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


