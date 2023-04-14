Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0B1C77B6E
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 02:19:15 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.2916.1681438745431635531
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 19:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=d0+uBSHT;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681438743; i=@fujitsu.com;
	bh=p0h/NiORanEpXn3hnerWa64q6/nl/q3wj7b8YJsDgIg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=d0+uBSHTCiwFZ6TSMPY6A4bMN2lmNW/PQYNbMgS5Z3kPdx4JpDJf0zpicWa0wMzdh
	 S1/zXIQ4mVqG8sZ4Q8oiuAUfGaLg9ueBN9ALKOw+0HIUlj39Q2sUSBtMDt8jNlt2xt
	 LUNk2ZqzfKQhAWg8tDpjg4TNJu09B6vjn95rZf0nv1btV2LehL+UdfMgYk18r1ba+G
	 wVaNXaAXlEizKdS4ZeuiqtPCcYLHfaizJO+tURAGpWF9TKjFyyFT/qF8BjgrikTw79
	 uk3BUUKwjQl3xnzFxTbB9kDpZIqqc4mAQs/OF4X0j3dIoaKGvaeY3b8hof2EU4ahxd
	 lN+g6iHQyjDqg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8ORqCu2wyL
  F4MkNPos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWN78y+2gl9KFUtb9zE2MM6Q62Lk4hASeMwo
  cfrbe7YuRk4g5zqTxM/9VRCJvYwSzc+ns4Ik2ASkJG7c/w9UxMEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jASmLH6ZvMIDaLgKrEoxmnWUBsXgEniWmdW8HmSwgoSEx5+J4ZIi4ocXLmExaIORISB1
  +8YIaoUZSYfbmZBcKulGj98AvKVpO4em4T8wRG/llI2mchaV/AyLSK0aw4tagstUjXWC+pKDM
  9oyQ3MTNHL7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzAUU4oThXYwfuv9
  q3eIUZKDSUmU17XQPEWILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO+aLRYpQoJFqempFWmZOcC4g
  ElLcPAoifAWTQFK8xYXJOYWZ6ZDpE4x6nJs2td1gFmIJS8/L1VKnHfiRqAiAZCijNI8uBGwGL
  3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZhXcjvQFJ7MvBK4Ta+AjmACOqJaF+yIkkSElFQ
  DU8PuRllPX/mn217ln/74w3BuFZtCy5JARf8pZS9eSP6MKp3eKRNXbntr8Y7FLpt7vJIcvqrO
  YuAV7/ld4bxD68bsmdtMCswXRdwMjvB7HlSVOclg8cxnB81MY44f8pw09/G11uYrk3WZf7RUT
  9ZNObNQvWrh/imdswOXPBD0rmoQsHJ1MFpyr0xzzfdrb0s+fJQV7HRbeMTOl/WM4buu7LjknW
  Gsh89xrir492zT2f57bCuypU6oqAjyz/fmvpfH8uJw+8IlT1+dvnusdmmFif6PC8nzDziVLNT
  h677Heuys76rTcn/r1y+cKfJUssNqReTct00uskafXlg6r543M4qbMfdEnPv0u0WphtYlUkos
  xRmJhlrMRcWJAJzpXM9MAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-728.messagelabs.com!1681438741!15732!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3200 invoked from network); 14 Apr 2023 02:19:02 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Apr 2023 02:19:02 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A15EB10019D
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 03:19:01 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9471C10019C
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 03:19:01 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 14 Apr 2023 03:18:59 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] systemd: upgrade 253.1 -> 253.3
Date: Fri, 14 Apr 2023 10:18:45 +0800
Message-ID: <1681438725-24175-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 02:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179985

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/systemd/systemd-stable/blob/v253.3/NEWS

0025-systemctl-explicitly-cast-the-constants-to-uint64_t.patch
removed since it's included in 253.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...md-boot_253.1.bb => systemd-boot_253.3.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  3 +-
 ...citly-cast-the-constants-to-uint64_t.patch | 44 -------------------
 .../{systemd_253.1.bb => systemd_253.3.bb}    |  0
 4 files changed, 1 insertion(+), 46 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_253.1.bb => systemd-boot_253.3.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0025-systemctl-explicitly-cast-the-constants-to-uint64_t.patch
 rename meta/recipes-core/systemd/{systemd_253.1.bb => systemd_253.3.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_253.1.bb b/meta/recipes-core/systemd/systemd-boot_253.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_253.1.bb
rename to meta/recipes-core/systemd/systemd-boot_253.3.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 14608f9abc..d50f2c9cba 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,11 +14,10 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "6c327d74aa0d350482e82a247d7018559699798d"
+SRCREV = "ed18c2ab79e8b94182d5dcf31d58457763f3e3e1"
 SRCBRANCH = "v253-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
            file://0026-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch \
-           file://0025-systemctl-explicitly-cast-the-constants-to-uint64_t.patch \
            "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd/0025-systemctl-explicitly-cast-the-constants-to-uint64_t.patch b/meta/recipes-core/systemd/systemd/0025-systemctl-explicitly-cast-the-constants-to-uint64_t.patch
deleted file mode 100644
index d840de870f..0000000000
--- a/meta/recipes-core/systemd/systemd/0025-systemctl-explicitly-cast-the-constants-to-uint64_t.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From fad29ce1f5cc7b12bc13671d9ad80775771a67eb Mon Sep 17 00:00:00 2001
-From: Frantisek Sumsal <frantisek@sumsal.cz>
-Date: Fri, 3 Mar 2023 12:17:27 +0100
-Subject: [PATCH] systemctl: explicitly cast the constants to uint64_t
-
-Otherwise under certain conditions `va_arg()` might get garbage instead
-of the expected value, i.e.:
-
-$ sudo build-o0/systemctl disable asdfasfaf
-sd_bus_message_appendv: Got uint64_t: 0
-Failed to disable unit: Unit file asdfasfaf.service does not exist.
-
-$ sudo build-o1/systemctl disable asdfasfaf
-sd_bus_message_appendv: Got uint64_t: 7954875719681572864
-Failed to disable unit: Invalid argument
-
-(reproduced on an armv7hl machine)
-
-Resolves: #26568
-Follow-up to: bf1bea43f15
-Related issue: https://github.com/systemd/systemd/pull/14470#discussion_r362893735
-
-Upstream-Status: Backport [https://github.com/systemd/systemd/commit/c63bfd0884cf20e48befbee49d41f667660a8802]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/systemctl/systemctl-enable.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/systemctl/systemctl-enable.c b/src/systemctl/systemctl-enable.c
-index 86d9f602fa..f94a286122 100644
---- a/src/systemctl/systemctl-enable.c
-+++ b/src/systemctl/systemctl-enable.c
-@@ -211,7 +211,7 @@ int verb_enable(int argc, char *argv[], void *userdata) {
- 
-                 if (send_runtime) {
-                         if (streq(method, "DisableUnitFilesWithFlagsAndInstallInfo"))
--                                r = sd_bus_message_append(m, "t", arg_runtime ? UNIT_FILE_RUNTIME : 0);
-+                                r = sd_bus_message_append(m, "t", arg_runtime ? (uint64_t) UNIT_FILE_RUNTIME : UINT64_C(0));
-                         else
-                                 r = sd_bus_message_append(m, "b", arg_runtime);
-                         if (r < 0)
--- 
-2.39.2
-
diff --git a/meta/recipes-core/systemd/systemd_253.1.bb b/meta/recipes-core/systemd/systemd_253.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_253.1.bb
rename to meta/recipes-core/systemd/systemd_253.3.bb
-- 
2.34.1


