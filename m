Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA222CA5FC9
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:17:02 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8491.1790756213983363543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jMFNhhAq;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 481BC1A1080
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15CAA60749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55755103298AF;
	Wed, 30 Sep 2026 10:16:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756211; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=moxs7eVRT8kU4KW7IMG6ZHjs7TvRQyPVgTm34iB4oag=;
	b=jMFNhhAqwmd4YZwaCqDV1oA7pKKNNhkbg3FuniWvDOMQANc7O13LvPINdNDkNyxclqKO3l
	sUyXHY7zsUnzrrevT5JsrxhgmUv5mKKbs+cvR6YdpmYWHyW1Z6F9jhh/aG3W2700unr2/i
	3eDz4JXplQPqsL2PpbliSzrbUZM7px2KFsTE48TdXqUJTry79WH5Jw3lfz2E4/OagYjB4c
	HOUfVJ/9bEbMZ9nMFS82aIE78NRTypM8rU9Kvdv/s+FZPqmcx2WgybQgoBz59KV5NQb5gW
	tUEH9/Wd1Ohsvm0GBl/TqbpI0oDKknrwe2OW+edX+s22AwvaLIanurW4D/r5qA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:34 +0200
Subject: [PATCH 09/24] python3-hypothesis: upgrade 6.168.1 -> 6.168.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-9-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=1639;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=N9ckUmQ99nyweG1AtsNR+mMKn1T2lv+MKQzRjyn5t40=;
 b=jHreJUeaoAxXQKTA5OUBQ8ezNU++/Vy2x/CQVQRqhdeYkdldKjq1LoABJxU2+unOgxa4GWpQW
 ZT3lrleFLeHB6imXxHzQitsbpFEKlIJ7MTTuHcAtsXXlrW2Ktc+9ZTu
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246933

Changelog:
6.168.3 - 2026-09-28
- This patch fixes quadratic-time behaviour when summarising the
  statistics of a test run, which Hypothesis does for every test when
  running under pytest. This avoids an apparent hang after the last test
  case with a high number of test cases (>100k).

6.168.2 - 2026-09-27
- This patch makes writes to the cache of constants collected from local
  source files atomic. Previously, a concurrent process sharing the same
  .hypothesis directory, such as another pytest-xdist worker, could read
  a partially written cache file, which silently changed the data
  generated for a given @seed.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../{python3-hypothesis_6.168.1.bb => python3-hypothesis_6.168.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.168.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.168.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb
index 7386f26afa4a..980161d42cb4 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.168.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb
@@ -16,7 +16,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "fd8acb5c67f260dfbdcc1b2dc95ff48b2b3f90708ae595c76f591bbf3f6f8eeb"
+SRC_URI[sha256sum] = "a43388f9067678fef6e13bdff325b6cfa6961a590498bb37f7ff31589c83bc75"
 
 RDEPENDS:${PN} += " \
     python3-attrs \

-- 
2.47.3


