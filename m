Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E74C38A04
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:19 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web12.7532.1649245786679798382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 04:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=L3GBHNVa;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649245785; i=@fujitsu.com;
	bh=DbDNoXrN12TIc28SSW/vczfx98L8eHy1ielolDSMQ5s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=L3GBHNVaJwbMpmfCDSWDSm6KRegUmrTtCN0nFx556RCL4Ba+RYFtnavI9ZNFZ4lix
	 VMUq1YrGlLYL+kHomK7cERBy7gDI37/KF/9CKaqNJZVgchcWA/5FqjG6hLEyzWmbo+
	 S/Z4/Qe2vvbD+hGRxv+Sou1McuvER9AoqNSCuWItBUtR7mTaLpkx7bDtj3kC1Y9EeN
	 J1ohaszYoPH5Xt/YqNBTpmTPqcA9nrFYu0o4F5zfimVfckpKvSgl9M/W2JEH8m+6kM
	 HbddzFUZ5qLf92QnSZ+qMo2xMbtUJls/QjV03HbEillaWUrS42ERWJw6RaRK1vJica
	 7YfYpC0ywtGcg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8MxSTeizjf
  JoGGDvsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnHrSidrwVqhigm3kxoYH/J3MXJxCAk8ZpRY
  sqmNHcI5zyTx7MV/RghnN6PEs/nrgTKcHGwCahLTb91g7WLk4BAR0JO4+k8UJMwsoCLx4ncPW
  ImwgL3E8x2nGEFsFqD40ZeT2UBsXgEniTtb94HVSAgoSEx5+J4ZxOYUcJY4OuEEE4gtBFTTOG
  E6E0S9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu0Ji1qw2JghbTeLquU3MExgFZyFpn4WkfQE
  j0ypGu6SizPSMktzEzBxdQwMDXUNDU10zM11DCzO9xCrdRL3UUt3k1LySokSgtF5iebFeanGx
  XnFlbnJOil5easkmRmAopxQ77drBeLDvp94hRkkOJiVR3v3lvklCfEn5KZUZicUZ8UWlOanFh
  xhlODiUJHi3VAHlBItS01Mr0jJzgHEFk5bg4FES4dWqAUrzFhck5hZnpkOkTjHqcpxfd2kvsx
  BLXn5eqpQ470uQIgGQoozSPLgRsBi/xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY1wtkCk9
  mXgncpldARzABHfHujCfIESWJCCmpBqazh5r/XTzo+zNuf3jOjnD3Kplrv8PZ3S/UeM4Pz0qU
  FOWumtle/qvtk+/RZT43NnM5y1s7RNVdnhpp17dUkV9GRmmn74pV560Svyzw+uvz8YL36h9n7
  tt/jjma5XC3NvH+Jaavczd93VX3qEOsXm/et7YL67xDfjy13f/Hpnd9kXEln+61L3NdpFmPv1
  //oGunemCcgsohvQL9MzI1JUcuLrZ8Y8YcsMHvnzl3/oO5Ega/i04Z6uvcmV1ZUL5Yxu3OJ9N
  rmd4XZUNjTyj+WHPu6bses4qmh3mcurNtNOf9XfNY4cqCbQWXYnovXs9gbhL5ulJU4eTrO3GP
  Q6Rb/u1xWlpqYLQ+Wqo5cZf5AgElluKMREMt5qLiRACqzT7bbAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-528.messagelabs.com!1649245784!23572!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14728 invoked from network); 6 Apr 2022 11:49:44 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Apr 2022 11:49:44 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 4A738100461
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:49:44 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3D0CA100453
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:49:44 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 6 Apr 2022 12:49:22 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] fontconfig: upgrade 2.13.1 -> 2.14.0
Date: Mon, 4 Apr 2022 02:45:39 +0800
Message-ID: <1649011540-28857-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649011540-28857-1-git-send-email-wangmy@fujitsu.com>
References: <1649011540-28857-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164073

License-Update:
- COPYING:
 *  year updated
 *  the following files added:
     fontconfig/fc-case/CaseFolding.txt
     fontconfig/src/fcatomic.h
     fontconfig/src/fcfoundry.h
     fontconfig/src/fcmd5.h
     fontconfig/src/fcmutex.h
     fontconfig/src/ftglue.[ch]
- fcfreetype.c
 * description of Copyright removed
 * include files added
- fccache.c
 * description of Copyright removed
 * source code changed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{fontconfig_2.13.1.bb => fontconfig_2.14.0.bb}     | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.13.1.bb => fontconfig_2.14.0.bb} (87%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb
similarity index 87%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb
index 6dbfd32217..80f952a024 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb
@@ -12,9 +12,10 @@ HOMEPAGE = "http://www.fontconfig.org"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=fontconfig"
 
 LICENSE = "MIT & MIT & PD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7a0449e9bc5370402a94c00204beca3d \
-                    file://src/fcfreetype.c;endline=45;md5=5d9513e3196a1fbfdfa94051c09dfc84 \
-                    file://src/fccache.c;beginline=1671;endline=1686;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=00252fd272bf2e722925613ad74cb6c7 \
+                    file://src/fcfreetype.c;endline=45;md5=ce976b310a013a6ace6b60afa71851c1 \
+                    file://src/fccache.c;beginline=1671;endline=1686;md5=906c2f04b0c79a1bcc84ecfca4de5619 \
+                    "
 
 SECTION = "libs"
 
@@ -24,8 +25,7 @@ SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
            file://revert-static-pkgconfig.patch \
            "
 
-SRC_URI[md5sum] = "690c6cb840a92fa8908cdf462d19ec66"
-SRC_URI[sha256sum] = "9f0d852b39d75fc655f9f53850eb32555394f36104a044bb2b2fc9e66dbbfa7f"
+SRC_URI[sha256sum] = "b8f607d556e8257da2f3616b4d704be30fd73bd71e367355ca78963f9a7f0434"
 
 UPSTREAM_CHECK_REGEX = "fontconfig-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.25.1


