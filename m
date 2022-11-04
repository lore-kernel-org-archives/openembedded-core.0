Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09341C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 06:57:39 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.8387.1667545055360681465
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 23:57:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rPWQWL0a;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667545053; i=@fujitsu.com;
	bh=+3zfALjDQDFtNiG4TnujmzLVWNQHm3j/ZQ7w99wRih0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rPWQWL0aG/HUEZqEMoCf/LoxrWbwBveaI8QS25OZWTWePbvdb14v9K9Xv2wmKlnyO
	 a9ROrn0NU/f5sO0FgyRhKNny/hy5h6xJem/017TCMlRblu/lGpLV7c1cP6SL7ejMG/
	 cbsntrgFWRHI48OCSTw14SZY3uWwbiAmjf0KoxO3ae46kDDmisGnytSs2C/f0Zoi+J
	 Bts6ginCdkbe5gQHdPrFBT27wHSgrRMGcSMTNrkHB3x6qglGEh7z3VthvETmpNWctD
	 AO7NdNbFMt9x9Fw31vUO2+3axc+3lHe3tItYtDXQsuC+kpCBB0JF01+qOg4ZAewdsq
	 ncFPhJyDBqrqw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRWlGSWpSXmKPExsViZ8ORqHtne0q
  ywbZdyhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bm+bPZCjbxVTS3zWBpYHzF08XIxSEk8JhR
  YvOETUwQzjUmiY65k6Cc/YwSSzf9ZOxi5ORgE1CQWLj1DGsXIweHiICexNV/oiBhYQF3iYmLp
  rGDhFkEVCRe/vcBMXmBwo0v+UEqJIAapzx8zwxi8woISpyc+YQFxGYWkJA4+OIFM0i5hICixO
  zp8hDlFRKzZrUxQdhqElfPbWKewMg3C0n3LCTdCxiZVjGaFacWlaUW6RrrJRVlpmeU5CZm5ug
  lVukm6qWW6ublF5Vk6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEhltKcfr6HYzvlv7RO8QoycGk
  JMpbx5uSLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCN28bUE6wKDU9tSItMwcY+jBpCQ4eJRHe3
  /OA0rzFBYm5xZnpEKlTjLocm/Z1HWAWYsnLz0uVEuc9DTJDAKQoozQPbgQsDi8xykoJ8zIyMD
  AI8RSkFuVmlqDKv2IU52BUEuYNB5nCk5lXArfpFdARTEBHbKtOAjmiJBEhJdXA5Gj1SvWw9s3
  jJQGO7r837TPm5zkdaD5Hpn7yv8N3GRSzVx7UKahjWCsQcP7EndhHC3XDj73Oak7X+uVc9rvy
  PPfz4+8/T5j54tudCtaS37YG62XjLx4IX220QKnPXGqTv4HTD7XzxdP51zz8U/f+znOWhvqF9
  tEKi8wWh7HorHnvxeBa3KDB9jzRSXta8lqbX01d25oYg/iXy8y9djDZl9e08kZN28sMpYgXm0
  on7wvYWtVdfWSRnsfCpNMcT7iOyXc9FlNs/G9ptPnHz+sxArsminenbTurOunDVuc3YbcnfpN
  mOnbOzfN325S/8x3mFrN+2PZIfccHNoPZDHlfp3380/qdvS09m9/nIf+Gd0osxRmJhlrMRcWJ
  AH+7OC0+AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-728.messagelabs.com!1667545052!9642!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13924 invoked from network); 4 Nov 2022 06:57:32 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Nov 2022 06:57:32 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 1282110019E
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Nov 2022 06:57:32 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 06A0510019D
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Nov 2022 06:57:32 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 4 Nov 2022 06:57:30 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-jsonschema: upgrade 4.16.0 -> 4.17.0
Date: Fri, 4 Nov 2022 14:56:48 +0800
Message-ID: <1667545008-2409-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 06:57:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172697

Changelog:
===========

* The "check_schema" method on "jsonschema.protocols.Validator" instances
  now *enables* format validation by default when run. This can catch some
  additional invalid schemas (e.g. containing invalid regular expressions)
  where the issue is indeed uncovered by validating against the metaschema
  with format validation enabled as an assertion.
* The "jsonschema" CLI (along with "jsonschema.cli" the module) are now
  deprecated. Use "check-jsonschema" instead, which can be installed via
  "pip install check-jsonschema" and found
  'here <https://github.com/python-jsonschema/check-jsonschema>'_.
* Make "ErrorTree" have a more grammatically correct "repr".

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-jsonschema_4.16.0.bb => python3-jsonschema_4.17.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.16.0.bb => python3-jsonschema_4.17.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.16.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.17.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.16.0.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.17.0.bb
index 5704f55a15..02337fe85b 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.16.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.17.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "165059f076eff6971bae5b742fc029a7b4ef3f9bcf04c14e4776a7605de14b23"
+SRC_URI[sha256sum] = "5bfcf2bca16a087ade17e02b282d34af7ccd749ef76241e7f9bd7c0cb8a9424d"
 
 inherit pypi python_hatchling
 
-- 
2.25.1


