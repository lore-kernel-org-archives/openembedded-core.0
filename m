Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F711C678D4
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 00:39:16 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.3124.1677717555209057852
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 16:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cSWyPVuu;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677717553; i=@fujitsu.com;
	bh=eLpnMKuQGea4rk2zUIME+vGeR1teM5Awe6E/UoviO4U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=cSWyPVuu7hJ4/dlVz45nl2kBjfh/121j3dTBvB+00MCG2c4E27txuYWWdpXhM8sZ3
	 13lDI+Sa2Y0FaZQITPEVgWv+0vR2KIKora0OxJMG9eqIjlxU53SdtAZxgJs62sA6xQ
	 nuCQcSSFq+lqBGYMSCm/C3oAt6FUrOpdL0ZoohrVyGbtljW096NXbjAhsy1exSv4Fi
	 LJOrCkqC5I4FpDHx396FCh3VUR5NGwh5J3jK1Tk57RdWPFuH6wp2Iadg32EXU6jdJ3
	 pSVk33bRDv8zjHArRrJEronedGZPtdgbZOWfWV95y/XEYZY+Z/ghhgnh49IGU2ewuK
	 i0bWbkapMTZ9A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8ORqGvw4X+
  ywaONzBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8afVz/YC1p4K1Zd3cDSwLidu4uRk0NI4DGj
  xI8FvF2MXED2dSaJna3LmCGcPYwSF08tYgOpYhOQkrhx/z+QzcEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jARuL1vGOMIDYLUPzA00XMIDavgKPE75PLwGwJAQWJKQ/fQ8UFJU7OfMICMUdC4uCLF1
  A1ihKzLzezQNiVEq0ffkHZahJXz21insDIPwtJ+ywk7QsYmVYxmhanFpWlFuka6SUVZaZnlOQ
  mZuboJVbpJuqlluqWpxaXAGUSy4v1UouL9Yorc5NzUvTyUks2MQIDMaVYtX8H49rev3qHGCU5
  mJREeQPM/yUL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuDlAIa2kGBRanpqRVpmDjAqYNISHDxKI
  rw3bwGleYsLEnOLM9MhUqcYFaXEee+9A0oIgCQySvPg2mCReIlRVkqYl5GBgUGIpyC1KDezBF
  X+FaM4B6OSMO/dN0BTeDLzSuCmvwJazAS0uOHaH5DFJYkIKakGppAHn7/F2xg+O3JuQ9nacOP
  mX1VGXSVnXsZmLpBgmvP7ZuCntKf8Jx/cKKq8HGK7b8Zft4p3gtsdbnoqbOi+LFHWrmpTke3F
  k9HA7iio6PnVaJ/y2R2Rn3jFf/hE3tr18XdyyOt9V9fw/OfUf8BtrhP548ha5qZvrVfefXqxa
  mu+2v1ZtSetHK/wzZxTduL+91ID22i/q0oO2ktKN3PMvs3G8L36n2XG3b3t366+EDwqvSn4y8
  TdStxyq1L/fj1la3Wo4/CFzyzWs47Pqnuq0HA+9trTbyJ3RfUFll3SyVQ5e/Dhnvrr3z5tTv1
  Z8OmE/8oa2Xe8py4Xr8mTeb5lqlpF7K96/8Slmikbrbi/qCgpsRRnJBpqMRcVJwIAOmGdGT8D
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-565.messagelabs.com!1677717551!25086!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32694 invoked from network); 2 Mar 2023 00:39:12 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Mar 2023 00:39:12 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BD0B7100198
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Mar 2023 00:39:11 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id AFA3E100043
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Mar 2023 00:39:11 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 2 Mar 2023 00:39:10 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] btrfs-tools: upgrade 6.1.3 -> 6.2
Date: Thu, 2 Mar 2023 08:39:00 +0800
Message-ID: <1677717540-2052-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 00:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177952

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* receive: fix a corruption when decompressing zstd extents
* subvol sync: print total number and deletion progress
* accelerated hash algorithm implementations in fallback mode on x86_64
* fi mkswapfile: new option --uuid
* new global option --log=level to set the verbosity level directly
* other:
   * experimental: update checksum conversion (not usable yet)
   * build actually requires -std=gnu11
   * refactor help option formatting, auto wrap long lines

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../btrfs-tools/{btrfs-tools_6.1.3.bb => btrfs-tools_6.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.1.3.bb => btrfs-tools_6.2.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.bb
index b4dfc5b3f3..4e3d544fad 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;b
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            file://0001-Use-pread-pwrite-ftruncate-stat-instead-of-64bit-equ.patch \
            "
-SRCREV = "908b4b4450320e30fdef693f09b42f4eb93702c3"
+SRCREV = "6439e92cba81c068afca76f8e010fb7175620176"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.34.1


