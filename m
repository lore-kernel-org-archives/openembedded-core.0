Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99DCC61DA4
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 08:05:25 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.5233.1678003517652495419
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Mar 2023 00:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aVKdfwuI;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678003515; i=@fujitsu.com;
	bh=cloF1edjBHTz/yNtsOB54DK42kXZqZPkPu2wtx4M8hs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=aVKdfwuIGxwbQnhCE+W/qUEUeU8SJq9ZUaBW21pUlcLxPG2dsNpTvbcX7Whwn+JoW
	 wFSctELnIFyHet6U8XdU19WP3CWGLsOXRt1pL9mije98i3FHg49s/5BqtwiVbTV9s7
	 EX4MjntkecfcDyQ57ZZSFDXnwbI6bjgR100gg9OyoAxjXDT1K2Y/ouMBPInB+VCFIe
	 1GWBTJduowg6yt9Av5Qj0owCG0ETYZLAdlN5iqB11VIp5JTmVkKdC5l9yS41znqzs8
	 yN3YowVeD3hS3fDNYmxi+GlhulorkpPMrA3rh6EYATZ3TpIoq+aWWRcalrR/vD4Lsu
	 UrGzasCE6U5Xg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxSdfSlyX
  FYM00E4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeN17y7Wgm7hinWbt7E3MH4U6GLk4hASeMwo
  sbLvKhuEc51JYn7LYnYIZw+jxImTUxm7GDk52ASkJG7c/w9UxcEhIqAncfWfKEiYWUBF4sXvH
  naQsLCAr8T+e2YgYRag8LNbTewgNq+Ak8TUcwuZQWwJAQWJKQ/fM0PEBSVOznzCAjFGQuLgix
  dQNYoSsy83s0DYlRKtH35B2WoSV89tYp7AyD8LSfssJO0LGJlWMZoVpxaVpRbpmuolFWWmZ5T
  kJmbm6CVW6SbqpZbq5uUXlWToGuollhfrpRYX6xVX5ibnpOjlpZZsYgSGYkpxMsMOxs6+v3qH
  GCU5mJREeQN/MacI8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuB96saSIiRYlJqeWpGWmQOMC5i0B
  AePkgjvQ0+gNG9xQWJucWY6ROoUo6KUOO8Wb6CEAEgiozQPrg0Wi5cYZaWEeRkZGBiEeApSi3
  IzS1DlXzGKczAqCfM6eQBN4cnMK4Gb/gpoMRPQYo3TDCCLSxIRUlINTC7zL52sefNV0yDm1x2
  d+0+SRSP3iVpVXtqroNIp36VyS3TK+3Uvy8WkOpaUPGn/mvHq8ZVtu6TLBDcK/lPq+pHy4VTG
  xa6opOjPk8/qXL20eP5T3dOlItZmHKUMRytYg8zWuUeVePcqxPxo3fG3m6UwSObFiy23T3tpv
  Ms3+eeSE54iL7P/VodLhNjtpil1d3OenhFLcrX0ERKddt9ai8O853JWE8vLi/LTkx7o//Faf6
  Nor33+Nt6tfy3cvhgU2l5j476fzB6q/iuruZ8xYvVmP+3dMy5Wz1ZpkNqycpbH6eoVCsmZZyO
  Wnfv6bBbb90nFleyub0/qNIa4xjMm/psUvbFbfqV6V5tUNWOaEktxRqKhFnNRcSIATxY1GEAD
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-732.messagelabs.com!1678003513!705458!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21417 invoked from network); 5 Mar 2023 08:05:13 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Mar 2023 08:05:13 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 47C881000E7
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:05:13 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3C30A1000D2
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:05:13 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 5 Mar 2023 08:05:11 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] autoconf-archive: upgrade 2022.09.03 -> 2023.02.20
Date: Sun, 5 Mar 2023 16:04:56 +0800
Message-ID: <1678003500-30452-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 08:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178028

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  ax_have_qt: bump serial number

  Merge pull request #262 from bastien-roucaries/fromdebian20200930
  Fix  AX_HAVE_QT

  ax_have_qt: bump serial number

  Merge pull request #266 from netfab/fix-ax_have_qt
  AX_HAVE_QT: remove qmake stash file before rmdir

  ax_python_devel: bump serial number

  Merge pull request #267 from bastien-roucaries/fromdebian20221118
  Fix ax_python_devel serial 32 fails with current python3

  ax_add_fortify_source: fix formatting

  ax_check_sign: bump serial number

  ax_cxx_compile_stdcxx: bump serial number

  ax_c_restrict: fix formatting

  Merge pull request #268 from omoerbeek/master
  ax_check_sign: Avoid an unused warning

  Merge pull request #269 from rurban/fortify3
  AX_ADD_FORTIFY_SOURCE: add -D_FORTIFY_SOURCE=3 check

  Merge pull request #270 from rurban/swig
  fix SWIG_LIB windows newline

  Merge pull request #271 from rurban/restrict
  Add ax_c_restrict

  Merge pull request #272 from ojwb/fix-AX_CXX_COMPILE_STDCXX-for-MSVC-C++17
  AX_CXX_COMPILE_STDCXX: Fix MSVC with C++17 or later

  Merge pull request #264 from thesamesam/clang-16
  Clang 16 fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...onf-archive_2022.09.03.bb => autoconf-archive_2023.02.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/autoconf-archive/{autoconf-archive_2022.09.03.bb => autoconf-archive_2023.02.20.bb} (85%)

diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.09.03.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2023.02.20.bb
similarity index 85%
rename from meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.09.03.bb
rename to meta/recipes-devtools/autoconf-archive/autoconf-archive_2023.02.20.bb
index 6595ac98ba..6ba7cdf3fe 100644
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.09.03.bb
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2023.02.20.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=11cc2d3ee574f9d6b7ee797bdce4d423 \
     file://COPYING.EXCEPTION;md5=fdef168ebff3bc2f13664c365a5fb515"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e07454f00d8cae7907bed42d0747798927809947684d94c37207a4d63a32f423"
+SRC_URI[sha256sum] = "71d4048479ae28f1f5794619c3d72df9c01df49b1c628ef85fde37596dc31a33"
 
 inherit autotools allarch texinfo
 
-- 
2.34.1


