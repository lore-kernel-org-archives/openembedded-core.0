Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43EA8C001E0
	for <webhook@archiver.kernel.org>; Sat, 29 Jul 2023 18:24:05 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.59230.1690655038436528674
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jul 2023 11:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Lvh4jnhs;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2023072918235673e906ba7e21c68967-qk9w9d@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2023072918235673e906ba7e21c68967
        for <openembedded-core@lists.openembedded.org>;
        Sat, 29 Jul 2023 20:23:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Rl5zMKaTd3CWWw1nfbOONxera2AIYfj1i43dFNaM59Y=;
 b=Lvh4jnhsPKpLdGQ7gR1qcT6LubZIHTXyT4muI1YOkkgfT9J//H6PCFlGq2p7CiAR/ZDyt/
 Cqhs5PoZA4cJbUqubL7TnP+FjwcCNZynARlKCWHcAUbPWuDbJ2cq/mk61xH7OyLLgwYFoxB4
 El4oa9GoQ9v2oQ++BljtDk/WZwh/4=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][dunfell][PATCH] libarchive: ignore CVE-2023-30571
Date: Sat, 29 Jul 2023 20:23:19 +0200
Message-Id: <20230729182319.1522991-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jul 2023 18:24:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185057

From: Peter Marko <peter.marko@siemens.com>

This issue was reported and discusses under [1] which is linked in NVD CVE report.
It was already documented that some parts or libarchive are thread safe and some not.
[2] was now merged to document that also reported function is not thread safe.
So this CVE *now* reports thread race condition for non-thread-safe function.
And as such the CVE report is now invalid.

The issue is still not closed for 2 reasons:
* better document what is and what is not thread safe
* request to public if someone could make these functions thread safe
This should however not invalidate above statment about ignoring this CVE.

[1] https://github.com/libarchive/libarchive/issues/1876
[2] https://github.com/libarchive/libarchive/pull/1875

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/libarchive/libarchive_3.4.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
index 582787d3f3..728eedc401 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.4.2.bb
@@ -46,6 +46,9 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
 SRC_URI[md5sum] = "d953ed6b47694dadf0e6042f8f9ff451"
 SRC_URI[sha256sum] = "b60d58d12632ecf1e8fad7316dc82c6b9738a35625746b47ecdcaf4aed176176"
 
+# upstream-wontfix: upstream has documented that reported function is not thread-safe
+CVE_CHECK_WHITELIST += "CVE-2023-30571"
+
 inherit autotools update-alternatives pkgconfig
 
 CPPFLAGS += "-I${WORKDIR}/extra-includes"
-- 
2.30.2


