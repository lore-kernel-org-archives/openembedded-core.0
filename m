Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66ACC3DA63
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 16:43:22 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.19909.1721320992270917918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 09:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=HsvGxI4k;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202407181643075bea9a308e49191d1b-dounjv@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202407181643075bea9a308e49191d1b
        for <openembedded-core@lists.openembedded.org>;
        Thu, 18 Jul 2024 18:43:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=O7FK0FEu3awddO1lFmQbL9D/dms/kUYF1xZ+WpwKFyc=;
 b=HsvGxI4kdNFwWSMaKdC9EdNmRM5a/rkjA+vv77025jdZoaJunsVVFxWE/VrF9DLAQvc45y
 djUBfzUCumaqQ05cqsmL08UIgbN3LSq/x7XrsO77ceQv9kJGU5VCSjLiCwi6ymb+n7SrQDvC
 VYB7wVNkxvnjMhmYFZteYNsttlYWs=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] libarchive: ignore CVE-2024-37407
Date: Thu, 18 Jul 2024 18:42:19 +0200
Message-Id: <20240718164219.1007660-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 16:43:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202229

From: Peter Marko <peter.marko@siemens.com>

History of code changes:
* introduced: https://github.com/ilibarchive/libarchive/commit/390d83012fdba8c8db7fc9915338805882b0597a (v3.7.2-52-g390d8301)
* reverted: 6https://github.com/libarchive/libarchive/commit/2c8caf6611a7d0662d80176c4fdb40f85794699 (v3.7.2-53-g62c8caf6)
* re-introduced: 9https://github.com/libarchive/libarchive/commit/1f27004a5c88589658e38d68e46d223da6b75ca (v3.7.3-14-g91f27004)
* fixed: bhttps://github.com/libarchive/libarchive/commit/6a979481b7d77c12fa17bbed94576b63bbcb0c0 (v3.7.3-24-gb6a97948)

Since there is no release where this CVE was present, we can safely
ignore it.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/libarchive/libarchive_3.6.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index c83eec9b1a..a7a3e47412 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -38,6 +38,8 @@ SRC_URI[sha256sum] = "ba6d02f15ba04aba9c23fd5f236bb234eab9d5209e95d1c4df85c44d5f
 
 # upstream-wontfix: upstream has documented that reported function is not thread-safe
 CVE_CHECK_IGNORE += "CVE-2023-30571"
+# cpe-incorrect: this vulnerability was not in any release; introduced in v3.7.3-14-g91f27004; fixed in b6a97948
+CVE_CHECK_IGNORE += "CVE-2024-37407"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.30.2


