Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CEAC433FE
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 05:13:41 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.3261.1668575611083686498
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 21:13:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=x4k2fHEl;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668575609; i=@fujitsu.com;
	bh=0j0zmpFTki9SJwQOZ63qlITRVM5c5HwI8zzRRBEN4pY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=x4k2fHElSbh29mSTEAvBqo5OASU4d2s912w/oHe30PhhGNLO7xinNvOAdUfqlzsAM
	 cDzeHYMr2zHw+ZDoiQRkUc1/2r5bk3WoBPj0aDjWvIC61JXC1AGgM/EmQxRBmEU1sO
	 abS+umCyu/LXnT66lEpm8lmqshtuZiOtvn2HSzxryIw91GRoakvS65j97Fyf9AAxb7
	 42UD7heaj2c++AWnsrjQkshpW6N1eJAvSmVRa4sjrWo4yBrQE4gspEyUwgOSXhKdGJ
	 M75w3hoyVEZfBzLKrP2jENKubLXD97OzI+VYU1gSgeivHjl10Kz2eBuI8Ny51t9dnv
	 8K0K50PS+ln0A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRWlGSWpSXmKPExsViZ8ORqFtRWJJ
  sMO+6uMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrFr4VK2gk7eikVv/rA3MG7m7mLk4hASeMwo
  0THzK3MXIyeQc41J4vJiHwh7D6PEw8uCIDabgJTEjfv/2boYOThEBPQkrv4TBQkzC6hIvPjdw
  w5iCwvYSHy5fAtsDIuAqsTHi2dYQGxeAUeJoxfugcUlBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL1
  5A1ShKzL7czAJhV0jMmtXGBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVoWpxaVJZapGuol1SUmZ5
  RkpuYmaOXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KXl1qyiREYhinFqod2ML5a8kfv
  EKMkB5OSKC+HW3GyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQne3LlAOcGi1PTUirTMHGBMwKQlO
  HiURHjlGoDSvMUFibnFmekQqVOMuhwzv7YdYBZiycvPS5US5+UDmSEAUpRRmgc3AhaflxhlpY
  R5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ816eATSFJzOvBG7TK6AjmICOOOBXBHJESSJCSqqBqXE
  q94xn4VNPt+Y+iNwXWvC1So5z1Yl5R5ds0GGYN+ndlD//78YIrMgp3X1u75atyxQqG/oy5O+I
  6cueWRQjlhi1p9pz0gO9JfK6nS+Wzj3xcPk/x/kH7oQunCxZfNB9TszWV9+u6E6YsfpZ5YHp/
  9e+msP8ec0zTiZGIU1+7vN3JF6aWPxLuBmreEvFTu/m1Ic7+/QS39/jCtrJnBd8KfLcmdMqBx
  Ri25deip7WuIh/UQFP8TZjR38/pzSTm789ZDtnsKz+1T5TvzGeb1sO55Xzl3zKjnxKMn/2ffJ
  Hn57eRNc7Yd8FH6x/EMDMyfL7vcIKk4l5cpEtOxgVQ7Y3L/b+fv3a7nefyjakMmztEVqixFKc
  kWioxVxUnAgAwggoIEoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-571.messagelabs.com!1668575608!31129!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21871 invoked from network); 16 Nov 2022 05:13:28 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Nov 2022 05:13:28 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 1F7F110019A
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 05:13:28 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 13EB7100188
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 05:13:28 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 16 Nov 2022 05:13:26 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] btrfs-tools: upgrade 6.0 -> 6.0.1
Date: Wed, 16 Nov 2022 13:13:08 +0800
Message-ID: <1668575588-9102-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 05:13:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173375

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* send: minor speed up for v2 due to increased buffer size
* resize: invalid command line options fail with error code
* quota rescan:
   * add long options --status and --wait
   * new option to wait but don't start rescan
* qgroup show: print path by default, updated format
* qgroup: new subcommand clear-stale, remove qgroups without their subvolumes
* experimental:
   * add warnings to commands that have it enabled (mkfs, image, btrfstune)
* other:
   * documentation, help text, error message updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../btrfs-tools/{btrfs-tools_6.0.bb => btrfs-tools_6.0.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.0.bb => btrfs-tools_6.0.1.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb
index 887a530a52..7144087a11 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.1.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "3db756352685f38c1de0aa886d380c733e0f53e7"
+SRCREV = "441d01556873385d55fd4940f50ee7ae1fcfb13d"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.25.1


