Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85426C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 03:31:28 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.55625.1672716687168254806
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jan 2023 19:31:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VbEsu/6F;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672716685; i=@fujitsu.com;
	bh=QWcKGVK2oPj4sZCGcCrhEnWJJV5YklMaCTXZySYUh2E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=VbEsu/6FwcZ2tl8U+RsxznV25gWBwfR9gJCYzcdXxYP9FuaOM5vlBHMug7j16i4dY
	 2dtQLb/T5y2dTSPALRpgDtUAKXSHmOSdNiPlzV4IhDOCZpCtUZcBN8wyW2KJPGp8er
	 plAJEWCmnwL8LQP9KuiRphp1nURHhywdP9iJuRtXSy0CQOhUafDJemzp5snYlkOyY7
	 jWsNDJu61A2mcJPw2ukqo1o2YqVuE/i/dlZxm382nXLEA04NpMa8s1aI9EInyw8qLp
	 IUBoQs/dBawAKFFRkk5X8yerqpZ/6X6GzMI9Q1PC4ukp6j8sC2LCUOdHi44zpvu/TV
	 xKYof5Ck+D1Vg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8OxWbdn4eZ
  kg4bD6hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b1/ckFbbwVrfvmsDcwbubuYuTiEBJ4wChx
  /s0aFgjnMpPEidYfTBDObkaJ+ZP2MncxcnKwCUhJ3Lj/n62LkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAjcT01kssIDaLgKrEhoP3wOK8Ak4SUy//B4tLCChITHn4nhkiLihxcuYTFog5EhIHX7
  xghqhRlJh9uRmqvkJi1qw2JghbTeLquU3MExj5ZyFpn4WkfQEj0ypG8+LUorLUIl1DC72kosz
  0jJLcxMwcvcQq3US91FLdvPyikgxdQ73E8mK91OJiveLK3OScFL281JJNjMBgTClOCdjBuGnZ
  H71DjJIcTEqivOV7NyUL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuDlmb85WUiwKDU9tSItMwcYG
  TBpCQ4eJRHeQ/OA0rzFBYm5xZnpEKlTjMYcdxfu3cvMcfXKlb3MQix5+XmpUuK8InOBSgVASj
  NK8+AGwSL2EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3vkg9/Bk5pXA7XsFdAoT0ClJaza
  CnFKSiJCSamDSfahw8VW+tsfOTW/7nVxyTadX6kR7zM0o5REQnWp44WOqwfQ+s3c3Rc/UbIpe
  t5J/rQHXlV8KjkWaBx8ukTYu+93r4qyw11v+ivlVkymPnbuXXGf4/Fa4+u0WCz2TUzOmvnMrC
  9/9UiGqPvrIQ7VGbvaZhuxZDuHqFacrttQnnjbJWe8x87z2M/sj5k/bXzs/zOh6v73se2KCz2
  +pVrOPLJdznYsX774bFGv2MH+3+kLxZOb3Husl2998LmNe1s7e53h9r4Gru3Zeh/vysGeFyWs
  6tc0P32ybuO7gckmlGYtbZ/jxKJv2ptx3Or63SF9K8uQvl2MbDF4f/L2b69dOzVlbwtPjqpgc
  VTPbhJRYijMSDbWYi4oTASZRy8lTAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-728.messagelabs.com!1672716684!277428!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8723 invoked from network); 3 Jan 2023 03:31:24 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jan 2023 03:31:24 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 22A45151
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Jan 2023 03:31:24 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 1683A150
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Jan 2023 03:31:24 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 3 Jan 2023 03:31:22 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] btrfs-tools: upgrade 6.0.2 -> 6.1
Date: Thu, 29 Dec 2022 12:47:56 +0800
Message-ID: <1672289277-16171-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 03:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175331

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* filesystem df: add json output
* qgroup show: add json output
* new command: 'inspect-internal map-swapfile' to check swapfile and its
  swapfile_offset value used for hibernation
* corrupt-block: fix parsing of option --root argument
* experimental (interfaces not finalized):
   * new command 'inspect-internal list-chunks'
   * new group reflink, command clone
* other:
   * synchronize some files with kernel versions
   * docs updates
   * build: use gnu11

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../btrfs-tools/{btrfs-tools_6.0.2.bb => btrfs-tools_6.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.0.2.bb => btrfs-tools_6.1.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.bb
index aa48422080..44ec2e1f16 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.0.2.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;b
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            file://0001-Use-pread-pwrite-ftruncate-stat-instead-of-64bit-equ.patch \
            "
-SRCREV = "ff964ba6aef98bd1bafe8ff9b0088501b30bdd27"
+SRCREV = "cde5faa6787e6fa720c99d2f10caa187a493c13f"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.25.1


