Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A69C4332F
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 06:10:32 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.6968.1670479831209177420
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 22:10:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HBisJhMY;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670479829; i=@fujitsu.com;
	bh=aXP/qb0rYUHoKaDzxr1CrO41EVHrrvLnFss7OdVXzjM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=HBisJhMYeF9/1sGkzXtSRTW75OVRIw52D7doqaITI7pVb+Z65sKL9Hz79kysvgsrI
	 FfG6n8UhkLDAMd7CTeTlwYTPn8Dzp/u/lwsYIN+cElxgjBzqE4mzxlwAlg9SRkQdfs
	 zfyo1JTJk3zKyzqXRV3YrW4LUzcuDAwzAPLLi0/ygAtDljfUq/AuFhi5JU2c+KX33g
	 R4IhEMwrNavSiT/bscX38vSSnTP614AXG0C5qcmf7ylpErs8MPkvwsDPauTLhYOzw/
	 i9Rz89a5W09gFhvuBojj1ztCVGZMDv1xYSZULLxCxG3deRVNyO5wt1edy/JHKI7r3U
	 zg8OUM0dBQu5w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpHulfmK
  ywbPlEhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8ap7VdZC+7xVHy++JKxgXEHdxcjF4eQwANG
  ifWfe1ggnMtMEpte9TBDOLsZJdo/HmXrYuTkYBOQkrhx/z+QzcEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jAV2LGqYmMICUsQPHl531AwrwCjhJbN1wEmyIhoCAx5eF7ZhCbU8BJYtvbFjBbCKhm6o
  Tp7BD1ghInZz5hgRgvIXHwxQtmiF5FidmXm1kg7AqJWbPamCBsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYzYpTi8pSi3Qt9ZKKMtMzSnITM3P0Eqt0E/VSS3Xz8otKMnQN9RLLi/VSi4v1iitzk3NS
  9PJSSzYxAkM3pTg9dwfjpWV/9A4xSnIwKYnyvqjuTxbiS8pPqcxILM6ILyrNSS0+xCjDwaEkw
  XuhcmKykGBRanpqRVpmDjCOYNISHDxKIry+tUBp3uKCxNzizHSI1ClGRSlxXpM6oIQASCKjNA
  +uDRa7lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ89aBTOHJzCuBm/4KaDET0OJ7/3tBFpc
  kIqSkGpjy7xSsNGmb6S0y+fCXyH+cCs8EnzU4LNk/I2/e2vUpjdp7rt6ctkN4wfKwXw2b7K8V
  CaY9ujYhLqNE+fZnlnkb1Q+c8WbIzvbwl8qa83UeR0H0LtcSh45vSntYJqozvQl8oif2IXxfc
  WxghGbpCtYJpnIttiKfXDl77Y6qbRC/8cq3IP94m3uctMzX9jyJP+tq7rvueHp1qvUj+fyZJ5
  LZ9s38/y1IwPkek22If0B/VNUxuSe6v/0CdioEN1wrk9o2e1fL1OylTi6y67fyzCzV2X58W5H
  0nZUNcxIZG2esd/ETtHvhVrJZcMHua5G5m8Rype79OerY3pH9Qld/75UL3vbd7638RD09TKtd
  bimxFGckGmoxFxUnAgCu5StHWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-732.messagelabs.com!1670479828!174275!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28046 invoked from network); 8 Dec 2022 06:10:28 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-22.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Dec 2022 06:10:28 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id DB00F1B3
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Dec 2022 06:10:27 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D01421B1
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Dec 2022 06:10:27 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 8 Dec 2022 06:10:26 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-traitlets: upgrade 5.5.0 -> 5.6.0
Date: Thu, 8 Dec 2022 14:09:51 +0800
Message-ID: <1670479794-1225-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670479794-1225-1-git-send-email-wangmy@fujitsu.com>
References: <1670479794-1225-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 06:10:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174378

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 Adopt jupyter releaser #806
 Use base setup dependency type #805
 More CI Cleanup #803
 More maintenance cleanup #802
 Add project description #801
 Bump actions/setup-python from 2 to 4 #798
 Bump actions/checkout from 2 to 3 #797
 Bump pre-commit/action from 2.0.0 to 3.0.0 #796
 Bump actions/upload-artifact from 2 to 3 #795
 Add dependabot #794
 Add more typings #791
 Format changelog #789

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-traitlets_5.5.0.bb => python3-traitlets_5.6.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.5.0.bb => python3-traitlets_5.6.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.5.0.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.6.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.5.0.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.6.0.bb
index 6ac17f5ec..1e82dd341 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.6.0.bb
@@ -4,7 +4,7 @@ AUTHOR = "IPython Development Team <ipython-dev@scipy.org>"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.md;md5=f17a3ba4cd59794dd6e005c8e150aef0"
 
-SRC_URI[sha256sum] = "b122f9ff2f2f6c1709dab289a05555be011c87828e911c0cf4074b85cb780a79"
+SRC_URI[sha256sum] = "10b6ed1c9cedee83e795db70a8b9c2db157bb3778ec4587a349ecb7ef3b1033b"
 
 inherit pypi python_hatchling
 
-- 
2.25.1


