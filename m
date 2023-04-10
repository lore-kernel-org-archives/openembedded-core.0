Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DCCC77B74
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:34:49 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.41044.1681119280285796428
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yc3cgWRC;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681119278; i=@fujitsu.com;
	bh=pfXP5X53AXUL25eX2e37i6bfRekayC66MghirnnQcFs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=yc3cgWRCAFHixH8YrPf10zgSw6K169CzYvdyu8oLgLv6dDbiTAzpsdsnV810ilEXk
	 +L8b7Kl7GTkAwySaRZP6wkh1JMuYkypdC/6oJcfv+4o8H9wbwtF8BaWUPk6hKXDWKm
	 eGFIyT78WmzsC6UGgvfqKy84u4WwNvHdnz0R9lmE5C/4Rx+e/yDy9T0/Ygt1UJQ9w7
	 juj6Yv40YhpD57EeplCNvYfg6MrHlAzcY3wytzUHctlcQLAasDq9z4SkLW3TBCu3Y/
	 DzhFMMFr2vwNKxv+Jr+GnyqKZezKsO1yHA/MvOxCjDIG83KTEwV67m7RlM1JyB3HDl
	 64KJGpr4c9eAw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqKt7wzj
  F4MIndYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaPp0z+2gjM8FRsPKTYwTuPuYuTiEBJ4zChx
  cGUPC4RzjUli0ckd7BDOHkaJc1NOsXUxcnKwCUhJ3Lj/H8jm4BAR0JO4+k8UJMwsoCLx4ncPO
  4gtLOAssfT2BzCbRUBV4vbL22CtvAJOEtN+bGQGsSUEFCSmPHwPZnMC1d97f4wVxBYCqtk55Q
  U7RL2gxMmZT1gg5ktIHHzxAqpXUWL25WYWCLtConH6ISYIW03i6rlNzBMYBWchaZ+FpH0BI9M
  qRvPi1KKy1CJdQ1O9pKLM9IyS3MTMHL3EKt1EvdRS3bz8opIMXUO9xPJivdTiYr3iytzknBS9
  vNSSTYzA4E0pTpHbwXil76/eIUZJDiYlUd4uLuMUIb6k/JTKjMTijPii0pzU4kOMMhwcShK8D
  JeBcoJFqempFWmZOcBIgklLcPAoifBKXANK8xYXJOYWZ6ZDpE4xKkqJ83KcB0oIgCQySvPg2m
  DRe4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO+Zi0BTeDLzSuCmvwJazAS0mMvFAGRxSSJ
  CSqqBifm5zJPjgoFvr1re0Kg0i/S+rN76dE5mRcez617TgmrFP62P9bKdIb5ksrqi+B9fEYmp
  +a4bzJRjL7Roh857w7MpNkDpcK3CqtlbZjFe+2j3S1R6y+WQS/UBjnMnfU0Pi1uR/NdC38Vbu
  LGDQfhLVAWDndeuO9v6Jsy1mbFBh3dXLm+l9kJ2Ew7vs048lQ/Kpym1nLQ5/rJx9fKTDrfqDt
  xtW9vhOn1J6MmadS/NI7Nnh9fN2lokPGP3Li0/y2KZJZ7Lz12UfG5zT9kz+Of/OXOO/Jfb9fk
  mr+ZkhoZ79ZF5lsmTFKObFG4q9jb52as94Xq6IcfxZ7FKVM1EvXj50LjlOt6bHA9ZeMrH+jop
  sRRnJBpqMRcVJwIA/8Jpb1kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-732.messagelabs.com!1681119277!475024!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20727 invoked from network); 10 Apr 2023 09:34:37 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:34:37 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 16AC01001B0
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:34:37 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0AD0D1001A2
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:34:37 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:34:35 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] wpebackend-fdo: upgrade 1.14.0 -> 1.14.2
Date: Mon, 10 Apr 2023 17:34:13 +0800
Message-ID: <1681119256-25106-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681119256-25106-1-git-send-email-wangmy@fujitsu.com>
References: <1681119256-25106-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179869

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Reverted a change introduced in 1.14.1 which introduced crashes both
  with WebKitGTK and WPE running under Wayland in some configurations.
- Fix a crash caused by wrong assertion, which was typically triggered in
  debug builds when using the NVidia drivers.
- Fix WebKit no longer repainting after provisional navigation with
  PSON enabled.
- Fix graphics buffer leaks by always freeing them in buffer destroy
  listener callbacks.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{wpebackend-fdo_1.14.0.bb => wpebackend-fdo_1.14.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.14.0.bb => wpebackend-fdo_1.14.2.bb} (90%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb
similarity index 90%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb
index 708201043b..b3d7b229c8 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.14.0.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb
@@ -13,7 +13,7 @@ inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e75b0cb2c7145448416e8696013d8883f675c66c11ed750e06865efec5809155"
+SRC_URI[sha256sum] = "93c9766ae9864eeaeaee2b0a74f22cbca08df42c1a1bdb55b086f2528e380d38"
 
 # Especially helps compiling with clang which enable this as error when
 # using c++11
-- 
2.34.1


