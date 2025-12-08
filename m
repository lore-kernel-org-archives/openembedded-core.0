Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9402BD3B7E2
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 11:27:41 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6237.1765193255351068536
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 03:27:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=CGgwqwTw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202512081127339c67af049c0002071c-p4hlcq@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202512081127339c67af049c0002071c
        for <openembedded-core@lists.openembedded.org>;
        Mon, 08 Dec 2025 12:27:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=+8ZDsPUulVaTff1ZPtO5d1P9vcD5UZ/aICj5d9BtnW4=;
 b=CGgwqwTwPm1E/RzM53VuHQmnnUoGGrf9bcYwWuU4R8icJmjgscmFAu0tfDinsmaSw7NTh2
 nBrJfBd158p2ZJQ9vkAD7ll0HnNBJVthZ9ADgGx5J9lNMjRi62ZZnDgQ/j7/HcW7cuG+sOSF
 da2HUtA2/alxVRVtjGEgTVYKMhBo7B9/rJOpdhCYDKBWKGhxig66MfeJMM5SJE4Dv6vl/Xqk
 7lTl0TAg+PceOUVgud9pui9VuAhA9jBiQN0eTxmc8RP/qKospRwqG1S7MAfywMKT0kkFedaS
 ZTJgatTWEZRhqByg1W5c9C4oJtdbDY8smUgdzSUFnUU4RQWg1dFD54zA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: changqing.li@windriver.com,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] libmicrohttpd: disable experimental code by default
Date: Mon,  8 Dec 2025 12:27:14 +0100
Message-Id: <20251208112714.1154237-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 11:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227389

From: Peter Marko <peter.marko@siemens.com>

Introduce new packageconfig to explicitly avoid compilation of
experimental code. Note that the code was not compiled by default also
before this patch, this now makes it explicit and makes it possible to
check for the flags in cve-check code.

This is less intrusive change than a patch removing the code which was
rejected in patch review.

This will solve CVE-2025-59777 and CVE-2025-62689 as the vulnerable code
is not compiled by default.
Set appropriate CVE status for these CVEs based on new packageconfig.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb
index 0628ee71b5e..a22b0c9342d 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb
@@ -19,9 +19,13 @@ PACKAGECONFIG ?= "curl https"
 
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
 PACKAGECONFIG[https] = "--enable-https,--disable-https,libgcrypt gnutls,"
+PACKAGECONFIG[experimental] = "--enable-experimental,--disable-experimental,"
 
 do_compile:append() {
     sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2025-59777] = "${@bb.utils.contains('PACKAGECONFIG', 'experimental', 'unpatched', 'not-applicable-config: experimental code not compiled', d)}"
+CVE_STATUS[CVE-2025-62689] = "${@bb.utils.contains('PACKAGECONFIG', 'experimental', 'unpatched', 'not-applicable-config: experimental code not compiled', d)}"

