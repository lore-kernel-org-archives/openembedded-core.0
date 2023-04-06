Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641B4C76196
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 12:57:35 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.157498.1680785846595347825
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 05:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=YQpzYbE2;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1680785847;
  x=1712321847;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AfuxOCnq2TAIDPeWMOaiawHX03UFMtQPU1LIppX6Z4Y=;
  b=YQpzYbE29VinvTU9ewwkZQLDICDr6PNqihG5iov/cq6/4YQAqqtOKN0y
   cwWGubp9Yz0Tvyujqrp1EfAlw7cLLP5bBzwcBEWPtBdjwWHShIPkYowyw
   l83i+i70x2TnqgZIFw33nY5ldqqbS9xUTFdzdPTLuNQhkJ4MkazAktIgW
   cTNJeN5NThexjMHByDrFBWqqah6N3COCXJVJk0XfksGs18hbOZzV6E8OQ
   uqpUi7GzU1Y5swUl+NBG2+QnsKDGOqXQ1Nb7WAtBq5JlYd81Hq1Pi9R59
   IEyqFEndCFQ97g89CK9uth6QoRUmWw3weIilK648kHEpfOVwydbetJ3IZ
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] cargo-update-recipe-crates.bbclass: Do not add name= to crate:// URIs
Date: Thu, 6 Apr 2023 14:57:22 +0200
Message-ID: <20230406125722.2167382-1-pkj@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 12:57:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179773

With the recent change to the crate fetcher, which automatically sets
the name to for each crate to be versioned, there is no longer a need to
explicitly set the name= parameter for each URI. This also results in
generated files that are compatible with the crate fetcher in Kirkstone
and Langdale.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-recipe/cargo-update-recipe-crates.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
index 322b4e4d79..8980137d02 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -43,7 +43,7 @@ def get_crates(f):
     cksum_list = ''
     for c in crates_candidates:
         rename = "%s-%s" % (c['name'], c['version'])
-        c_list += '\n    crate://crates.io/%s/%s;name=%s \\\' % (c['name'], c['version'], rename)
+        c_list += '\n    crate://crates.io/%s/%s \\\' % (c['name'], c['version'])
         if 'checksum' in c:
             cksum_list += '\nSRC_URI[%s.sha256sum] = "%s"' % (rename, c['checksum'])
 

