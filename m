Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059C9E810D5
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 01:57:18 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com [212.3.242.68])
 by mx.groups.io with SMTP id smtpd.web10.5520.1695866230897409813
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 18:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=robert.joslyn@redrectangle.org header.s=20230812-3u04 header.b=n/oUAlIF;
 spf=pass (domain: redrectangle.org, ip: 212.3.242.68, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
	by wilbur.contactoffice.com (Postfix) with ESMTP id E8EE25D0;
	Thu, 28 Sep 2023 03:57:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1695866227;
	s=20230812-3u04; d=redrectangle.org;
	i=robert.joslyn@redrectangle.org;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	l=1073; bh=K4HMqrrclsRl+1e/hKktJFQGkej0Qk+01sSZtRM1VA4=;
	b=n/oUAlIFCepJqw9p0OUNi8TqUldwDz8J7Nr+a6DkwQIMzrYIbzqwBOV5b9rKBC+H
	Pt9JdHmsuUa8fxGhyIRFN9FtKw02VaB8i3864S1u0FW0X9cPLGeGoFt2o8L4QEMdag6
	kvseAig3F/UxAmuPaO34JMGWOzyn7p4ZnE0wB21VJO4PWUm1Xcoafi930QrIxyDPxJM
	SYrfCy+qIIZDgkN1NpxBjVTBtYTHcOOUBseZ9lmYNPgrdBvgrs0dlhdJpwAQ+QQ2PWf
	IJqFXk1VfnrCbLmlXHkOqRcKi2tu8H2m7J63Nbb8Y90YeQGDAHXewAosLt+HDHV1Bto
	vqrXEixY2A==
Received: by smtp.mailfence.com with ESMTPSA ; Thu, 28 Sep 2023 03:57:06 +0200 (CEST)
From: robert.joslyn@redrectangle.org
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] curl: Skip tests marked flaky
Date: Wed, 27 Sep 2023 18:56:06 -0700
Message-ID: <20230928015606.3252024-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-ContactOffice-Account: com:454140407
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 01:57:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188349

From: Robert Joslyn <robert.joslyn@redrectangle.org>

Some tests can fail intermittently and upstream has marked these as
flaky so they can easily be skipped. At present there are 12 tests
marked flaky with 10 of them running in the default recipe
configuration. Skip them to avoid the failures.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-support/curl/curl/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl/run-ptest b/meta/recipes-supp=
ort/curl/curl/run-ptest
index 95af2bd7b3..8f9c20f34d 100644
--- a/meta/recipes-support/curl/curl/run-ptest
+++ b/meta/recipes-support/curl/curl/run-ptest
@@ -1,6 +1,6 @@
 #!/bin/sh
 cd tests
-{ ./runtests.pl -a -n -s -j4 || echo "FAIL: curl" ; } | sed \
+{ ./runtests.pl -a -n -s -j4 !flaky || echo "FAIL: curl" ; } | sed \
      -e 's|\([^ ]* *\) \([^ ]* *\)...OK|PASS: \1 \2|' \
      -e 's|\([^ ]* *\) \([^ ]* *\)...FAILED|FAIL: \1 \2|' \
      -e 's/Warning: test[0-9]\+ not present in tests\/data\/Makefile.inc=
//'
--=20
2.41.0


