Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F870C433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 23:19:10 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.3236.1636586347739549709
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 15:19:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=hGqhcbYm;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636586349;
  x=1668122349;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=nHdj+ueRsjKRh3zEVrdxdEISBKHndKpwNmWz8oG7L2s=;
  b=hGqhcbYme+SWzc5lW4DsGzjvrTAd760qdMqUwAqEOaWiytmoeOJgKnpp
   VlPPZeBBKL8vkiwuyM11SUQZRL3J/kgwq3qoVdaR/20xVpc1LhL3BNPNe
   IpjYU+cuiYHbbfXUsTCY2kUVbCE99S0dvJwp+PXoJRW39LT73ws8yMrJ1
   4p8Qa9kiBSCy5GBEUFkJDl+uVXzKeFVIGrEaJ4X98dM+WTsLy+OKmo5aK
   D9cl0qejW/aPzUJ3ngO3T4UbG4LfCSoqYC0fuzgSVFwQ0Rj5D3QTQRuDX
   ZbpFPGiU4dMb3QmLoNlqmE3WYCpsGZEEkiTzVGGmZn/kYyYwwRHJzMUry
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/5] own-mirrors.bbclass: Clean up the additions to PREMIRRORS
Date: Thu, 11 Nov 2021 00:18:53 +0100
Message-ID: <20211110231856.5799-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20211110231856.5799-1-pkj@axis.com>
References: <20211110231856.5799-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 23:19:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158117

* Since commit ce0579dc in bitbake (fetch2: Revert the regexp removal
  for the type field and instead anchor regexp) the type regexp has
  been automatically anchored at the end.
* Since commit 044fb04d in bitbake (fetch2: Allow whitespace only mirror
  entries) there is no need to separate the entries in PREMIRRORS with
  "\n".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/own-mirrors.bbclass | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/classes/own-mirrors.bbclass b/meta/classes/own-mirrors.bbclass
index e244de592d..ef972740ce 100644
--- a/meta/classes/own-mirrors.bbclass
+++ b/meta/classes/own-mirrors.bbclass
@@ -1,14 +1,14 @@
 PREMIRRORS:prepend = " \
-cvs://.*/.*     ${SOURCE_MIRROR_URL} \n \
-svn://.*/.*     ${SOURCE_MIRROR_URL} \n \
-git://.*/.*     ${SOURCE_MIRROR_URL} \n \
-gitsm://.*/.*   ${SOURCE_MIRROR_URL} \n \
-hg://.*/.*      ${SOURCE_MIRROR_URL} \n \
-bzr://.*/.*     ${SOURCE_MIRROR_URL} \n \
-p4://.*/.*      ${SOURCE_MIRROR_URL} \n \
-osc://.*/.*     ${SOURCE_MIRROR_URL} \n \
-https?$://.*/.* ${SOURCE_MIRROR_URL} \n \
-ftp://.*/.*     ${SOURCE_MIRROR_URL} \n \
-npm://.*/?.*    ${SOURCE_MIRROR_URL} \n \
-s3://.*/.*      ${SOURCE_MIRROR_URL} \n \
+cvs://.*/.*     ${SOURCE_MIRROR_URL} \
+svn://.*/.*     ${SOURCE_MIRROR_URL} \
+git://.*/.*     ${SOURCE_MIRROR_URL} \
+gitsm://.*/.*   ${SOURCE_MIRROR_URL} \
+hg://.*/.*      ${SOURCE_MIRROR_URL} \
+bzr://.*/.*     ${SOURCE_MIRROR_URL} \
+p4://.*/.*      ${SOURCE_MIRROR_URL} \
+osc://.*/.*     ${SOURCE_MIRROR_URL} \
+https?://.*/.*  ${SOURCE_MIRROR_URL} \
+ftp://.*/.*     ${SOURCE_MIRROR_URL} \
+npm://.*/?.*    ${SOURCE_MIRROR_URL} \
+s3://.*/.*      ${SOURCE_MIRROR_URL} \
 "

