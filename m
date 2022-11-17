Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0128C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 07:12:31 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.10093.1668669150063221005
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 23:12:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ovZ4U-007VDv-KU; Thu, 17 Nov 2022 09:12:27 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ovZ4U-000S1T-Bl; Thu, 17 Nov 2022 09:12:26 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 0/2] image specific configuration with oeqa runtime tests
Date: Thu, 17 Nov 2022 09:12:21 +0200
Message-Id: <20221117071223.107064-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20221117071223.107064-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 07:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173404

Many runtime tests would need customization for different
machines and images. Currently some tests like parselogs.py are hard
coding machine specific exceptions into the test itself. I think these
machine specific exceptions fit better as image specific ones, since a
single machine config can generate multiple images which behave
differently. Thus create a "testimage_data.json" file format which image
recipes can deploy. This is then used by tests like parselogs.py to find
the image specific exception list.

Same approach would fit other runtime tests too. For example systemd
tests could include a test case which checks that an image specific list of
services are running.

I don't know how this data storage would be used with SDK or selftests,
but maybe it could work there too with some small tweaks.

Mikko Rapeli (2):
  oeqa: add utils/data.py with get_data() function
  oeqa parselogs.py: use get_data() to fetch image specific error list

 meta/lib/oeqa/runtime/cases/parselogs.py | 17 +++++++---
 meta/lib/oeqa/utils/data.py              | 41 ++++++++++++++++++++++++
 2 files changed, 54 insertions(+), 4 deletions(-)
 create mode 100644 meta/lib/oeqa/utils/data.py

-- 
2.34.1


