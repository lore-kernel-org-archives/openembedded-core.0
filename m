Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F2DC677F1
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 05:21:17 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.134751.1673760072795055333
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 21:21:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QnPuET8i;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673760071; i=@fujitsu.com;
	bh=lEqD+drAqPyvr59LvKmoTHBQT22QPUqXQ0GwalKbWVk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=QnPuET8irW0Twnj+WGSI8kJNHF7FjTUmfq8iOq1rfoUvEslGvYYFf+EquWvINAmIz
	 4UHXZ3OKu0JEbwkM77bYaYSunmarYQBDuDe5A+sKcrWkCcQHGg/PXGDPwdtqgk7th3
	 rwudkiCMNGhblvjo5uL2zDS9UYxnmmxMrZiIszFiubkr6PVQGLS1Xllq8gwBMk32Ua
	 O3mKpKNvXgw7Q0rByQkhyXgePYxftGKnBMpMPyJ5NFQBqI3DZsqS2wsbUxGr7fFqXq
	 DyLOAmN1AG7TiFwUuU4Undrd0RuYQoS4vJA5qpX8Ml3QGc9LV26X5hx9uCpffvteVK
	 4O4jhz9cgSoGg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8MxSdet93C
  ywf+JghZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b8WavYCt5wViyeu5OlgfEJRxcjF4eQwGNG
  iTtnVzJBONeZJKY/OMQG4exllLg4+yZLFyMnB5uAlMSN+/+BEhwcIgJ6Elf/iYKEmQVUJF787
  mEHsYUFbCS6pi1gBbFZBFQlvv47BtbKK+AoMeHEQyYQW0JAQWLKw/fMEHFBiZMzn7BAzJGQOP
  jiBTNEjaLE7MvNLBB2pUTrh19QtprE1XObmCcw8s9C0j4LSfsCRqZVjKbFqUVlqUW65npJRZn
  pGSW5iZk5eolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgaGYUsyYu4Nx57I/
  eocYJTmYlER5I78dShbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwbuh8XCykGBRanpqRVpmDjAuY
  NISHDxKIrzaHUBp3uKCxNzizHSI1ClGXY6rV67sZRZiycvPS5US563sASoSACnKKM2DGwGL0U
  uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHkNQFbxZOaVwG16BXQEE9ARIfUHQY4oSURISTU
  wVd+cxjzn09r9a83jP3VdZ295aHyRN/v66okfGRyZPvuv+HXyT5+784LIUO8H1j9t3icKe61V
  S3ye89b//uSP5rGdqmUfmnd9Crh9MPii8V/RC0l/Zh/09HMv6JGQWCgwX6BQ09+aeVL42tamt
  7fjdKMu3Hth5vC4z/T/tziBpy2Zc5sLnhTdW3jORGqV8XrtzHseBiv75m6pLb+RI76w5VXgw3
  W7jT0Vmz49sjK2tmWqmcfcx7b5XNjsgJqY3DUHuVwTZH4cNGoX1FNizumYIzLdPiP+fkFdVc6
  8azv/Bwr+1bziEiAecKvixDTPFLNWoeNOXwW/hZ/eMeeuvGOdT1FJVENI4f6Dq+eXz1qkxFKc
  kWioxVxUnAgAqAQ11UwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-591.messagelabs.com!1673760070!232074!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23287 invoked from network); 15 Jan 2023 05:21:10 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jan 2023 05:21:10 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id DD8761000D2
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:21:09 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D13CA1000C1
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:21:09 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 15 Jan 2023 05:21:08 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] btrfs-tools: upgrade 6.1 -> 6.1.2
Date: Sun, 15 Jan 2023 13:20:51 +0800
Message-ID: <1673760055-2483-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175862

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 revert libbtrfs changes to v6.0.2, fix remaining build problems

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../btrfs-tools/{btrfs-tools_6.1.bb => btrfs-tools_6.1.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.1.bb => btrfs-tools_6.1.2.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb
index 44ec2e1f16..b10d7efdb5 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.2.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;b
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            file://0001-Use-pread-pwrite-ftruncate-stat-instead-of-64bit-equ.patch \
            "
-SRCREV = "cde5faa6787e6fa720c99d2f10caa187a493c13f"
+SRCREV = "660d10d3fb2e87909d379b0ea3c52934543455c7"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.25.1


