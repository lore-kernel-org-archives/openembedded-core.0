Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB8AC43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 07:42:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.6373.1657611735998683618
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 00:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hSahN5ON;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657611734; i=@fujitsu.com;
	bh=+P7eqMUC/0CeT3Uikz+9ctzUUOUDH5O8+S5NNKFOcOE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hSahN5ONL74X+Tp2vY4Viryg6CB8nYXddNUpBHuAmSYlGvnV3DgoMK1cs+5hkEzxS
	 8eEZoOJlJOvmR2blkcwrFwaJBAcMVkWw64Ib6o8pf1qa8xC9mNzC+I6qVq20b6ej1p
	 QT5+Dm199wzAs5Gm8KtdpfDIv3jf4EYV+VHG88o46ZTzn1HGnwGO0dJrQq/7BggCic
	 H3eaAf7REG5vjqjf0Sk7ltpNorj7ltzY46dG7cwNyxtdciMk7z0NzT/j6VzG5DjvSh
	 3CPoafQ/XuOS5chw9Qg1fvs+oh8RcXj6EEl3p1q2V0WhsFiBpjx1aeSenP6XcctafZ
	 +25P5WpsfRqEA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSfeq6tk
  kg/nLjCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1owLyyaxFKzgrJh6ai1zA+Mlji5GLg4hgceM
  Eis2rGGFcK4xSTzseMwI4exhlFhw4AR7FyMnB5uAmsT0WzeAqjg4RAT0JK7+EwUJMwuoSLz43
  QNWIizgLnHv40EmEJtFQFWi59gmdpByXgEnieu/FEHCEgIKElMevmcGsTkFnCV+TfkGNlEIqG
  TnDTeQMK+AoMTJmU9YIKZLSBx88YIZolVRYvblZhYIu0JixoxtbBC2msTVc5uYJzAKzkLSPgt
  J+wJGplWM1klFmekZJbmJmTm6hgYGuoaGprrGFrpGhkZ6iVW6iXqppbrlqcUlukBuebFeanGx
  XnFlbnJOil5easkmRmAIpxSrXdnBuGfVT71DjJIcTEqivHnSZ5OE+JLyUyozEosz4otKc1KLD
  zHKcHAoSfDaqADlBItS01Mr0jJzgPEEk5bg4FES4TVRBkrzFhck5hZnpkOkTjEqSonzqoP0CY
  AkMkrz4NpgMXyJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvJch4nsy8Erjpr4AWMwEtlos
  8A7K4JBEhJdXAJL0wzc0kY47e+bz2SQ/2GJ/ualBl7fcK76qWlRZNfn32y8G3Xnzzzr5+HhNa
  EDSlroVt55G937W+TOJqkl9+qHCCcejZMpUF+vHBISamXy+kNT++qWlr9eX+teDVdwS5lGuZb
  qw1sTvFX92ZJVQv+mJPf+fj+ZtFOnpmX5i4fVum+NQ6eXuLDbH5MzRWHZL5uDLQe8MCp+dJMm
  n/LiV2PGFnrZnQJ/3bw+aInkd5ywXXxyf0Ppse8Et70HZPcZ4RX/jhyYwFPiK/9h/80L1s8S8
  Hc+fFfX6vvcx50lKUeX4l1WQ/VWgXfz2noWVLpr/Rs+MT9t2s++JqWxTlNa3sz7EDMnOXv/zu
  8v2jrsZOJZbijERDLeai4kQAbua0MlwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-571.messagelabs.com!1657611733!86469!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10843 invoked from network); 12 Jul 2022 07:42:13 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Jul 2022 07:42:13 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 854D9100078
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:42:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 78AF2100077
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:42:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 12 Jul 2022 08:42:11 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-atomicwrites: upgrade 1.4.0 -> 1.4.1
Date: Tue, 12 Jul 2022 15:41:43 +0800
Message-ID: <1657611705-30786-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657611705-30786-1-git-send-email-wangmy@fujitsu.com>
References: <1657611705-30786-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 07:42:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167897

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...on3-atomicwrites_1.4.0.bb => python3-atomicwrites_1.4.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-atomicwrites_1.4.0.bb => python3-atomicwrites_1.4.1.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb b/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
rename to meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb
index 065a2c7b4f..d4d15cea50 100644
--- a/meta/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/untitaker/python-atomicwrites"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=91cc36cfafeefb7863673bcfcb1d4da4"
 
-SRC_URI[md5sum] = "b5cc15c8f9f180a48665f9aacf91d817"
-SRC_URI[sha256sum] = "ae70396ad1a434f9c7046fd2dd196fc04b12f9e91ffb859164193be8b6168a7a"
+SRC_URI[sha256sum] = "81b2c9071a49367a7f770170e5eec8cb66567cfbbc8c73d20ce5ca4a8d71cf11"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


