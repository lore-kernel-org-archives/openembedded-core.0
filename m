Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F43E77189
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 23:57:15 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.116563.1733788629201018702
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 15:57:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Hk2eR9/1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733788630; x=1765324630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=yaAGGTu0tO+xMnzch0RuQn/z/zsXakr5U9zRHR/2PJ8=;
  b=Hk2eR9/1dOxujAswGYdVDDHIq4AKonSSz29SA4n8SwjLnOOl1EeIE0ba
   0uXaNgKj78Wn6ium1sLttPNMIb/LrTkbhNJxwHxDcfHrsuN4gSYIj8lOG
   UEhiy61jkFlaJM2nTh3XxPNInZQcUJuI/m9et16SUjY9zG88SgzIdwk4q
   stLrZ5owxLyHR3aZ2URFTzBDSQCWQJdeJW9nR2eCKm+ofkZfI1M5LPTqG
   c31Q/duqQOJ5qgQ5+YlmYHCCgIpL+KGfXum3VUKLDF7ms4l25JFE27YF6
   MWhdpfxTJr1LMfg0q7Uttgq/XFKqV6JJGjgR4UiWa50EC3L649AETk32V
   g==;
X-CSE-ConnectionGUID: 7pW+REgTRumb2K3ZR8ctqg==
X-CSE-MsgGUID: lihyvQGcSGu6/ObOBmFkMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="183178018"
X-IronPort-AV: E=Sophos;i="6.12,220,1728918000"; 
   d="scan'208";a="183178018"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:57:07 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D1162D4C3F
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:04 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F076D7480
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 336CA20076D0F
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:04 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D0C481A006C;
	Tue, 10 Dec 2024 07:57:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 09/20] kexec-tools: upgrade 2.0.29 -> 2.0.30
Date: Tue, 10 Dec 2024 07:56:41 +0800
Message-Id: <1733788612-20933-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
References: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28848.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28848.003
X-TMASE-Result: 10--9.148500-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yWY+xOrx57jWBGvINcfHqhcPdZmyx8xAa4nO
	/I/i7S2AGWJTWZYX2KYSuJRtSU84o39JXYBaBfzu/HTKStsDGMJHNQ8CqEKO2GA+B6CBXAIWvwU
	evDt+uW7rCDPw9MoAWMkWs0jYwiwkEXIhhl7oVxLum6Nvy6t3NgvafmSTCsGRxuXV3UE49jiZo9
	fAMb44dAP6HuDcBX9qvFX0TQ3c5d4372ax+5lazdtBZvBzWN5hIm2Js0m7E8J2nSUkeuXCTKPFj
	JEFr+olX8emX/Nw6OXkwjHXXC/4I+JGF26G8SWypfzLa08EuFDUPO8kFyib00WNDyyRnw8CYO2o
	hdh5UQoRUC3PmmFkTqq31eEgHAP+
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 23:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208507

From: Wang Mingyu <wangmy@cn.fujitsu.com>

0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
refreshed for 2.0.30

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...xec-disabled-check-if-kaslr-seed-dtb-propert.patch | 11 ++++-------
 ...-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch |  9 +++------
 .../{kexec-tools_2.0.29.bb => kexec-tools_2.0.30.bb}  |  2 +-
 3 files changed, 8 insertions(+), 14 deletions(-)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.29.bb => kexec-tools_2.0.30.bb} (97%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
index ddc1519126..ee731cea4b 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch
@@ -1,4 +1,4 @@
-From d48ec5e1a5fb7907520dee71b1d94045486a0c29 Mon Sep 17 00:00:00 2001
+From 9e95f8933bded10fdd664fc95492825347ec59a7 Mon Sep 17 00:00:00 2001
 From: Alexander Kamensky <alexander.kamensky42@gmail.com>
 Date: Thu, 12 Nov 2020 12:56:46 -0800
 Subject: [PATCH] arm64: kexec: disabled check if kaslr-seed dtb property was
@@ -34,10 +34,10 @@ Upstream-Status: Submitted [http://lists.infradead.org/pipermail/kexec/2020-Nove
  1 file changed, 1 insertion(+), 13 deletions(-)
 
 diff --git a/kexec/arch/arm64/kexec-arm64.c b/kexec/arch/arm64/kexec-arm64.c
-index ec6df4b..10238d9 100644
+index 9091f40..ea304f9 100644
 --- a/kexec/arch/arm64/kexec-arm64.c
 +++ b/kexec/arch/arm64/kexec-arm64.c
-@@ -503,7 +503,7 @@ static int setup_2nd_dtb(struct dtb *dtb, char *command_line, int on_crash)
+@@ -504,7 +504,7 @@ static int setup_2nd_dtb(struct dtb *dtb, char *command_line, int on_crash)
  	int len, range_len;
  	int nodeoffset;
  	int new_size;
@@ -46,7 +46,7 @@ index ec6df4b..10238d9 100644
  
  	result = fdt_check_header(dtb->buf);
  
-@@ -576,18 +576,6 @@ static int setup_2nd_dtb(struct dtb *dtb, char *command_line, int on_crash)
+@@ -577,18 +577,6 @@ static int setup_2nd_dtb(struct dtb *dtb, char *command_line, int on_crash)
  			return result;
  		}
  	} else {
@@ -65,6 +65,3 @@ index ec6df4b..10238d9 100644
  		/*
  		 * Invoke the getrandom system call with
  		 * GRND_NONBLOCK, to make sure we
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
index dc52981025..8dc5fed765 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch
@@ -1,4 +1,4 @@
-From a6a9e17dfeb5627f3e6f569b66f243f50f8a3645 Mon Sep 17 00:00:00 2001
+From 1a09bf71c2f541c2cfb44a00661051597bbd0b76 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 6 Aug 2024 21:42:43 -0700
 Subject: [PATCH] kexec.c: add MFD_NOEXEC_SEAL flag explicitly
@@ -18,7 +18,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/kexec/kexec.c b/kexec/kexec.c
-index 7c614b0..41d285d 100644
+index 4f51987..8f02595 100644
 --- a/kexec/kexec.c
 +++ b/kexec/kexec.c
 @@ -60,6 +60,10 @@
@@ -32,7 +32,7 @@ index 7c614b0..41d285d 100644
  unsigned long long mem_min = 0;
  unsigned long long mem_max = ULONG_MAX;
  unsigned long elfcorehdrsz = 0;
-@@ -655,7 +659,7 @@ static int copybuf_memfd(const char *kernel_buf, size_t size)
+@@ -657,7 +661,7 @@ static int copybuf_memfd(const char *kernel_buf, size_t size)
  {
  	int fd, count;
  
@@ -41,6 +41,3 @@ index 7c614b0..41d285d 100644
  	if (fd == -1)
  		return fd;
  
--- 
-2.25.1
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.30.bb
similarity index 97%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.30.bb
index 9f5eb6e8c1..6a67427888 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.29.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.30.bb
@@ -20,7 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch \
            "
 
-SRC_URI[sha256sum] = "0756dd54dab2f2a437e5d4df64b9760c3e6cf6a7d29fb296bdeeeb749f6ea28e"
+SRC_URI[sha256sum] = "bb6b39bbe00099219e95ab34b25ea4348e1a95964eefc45c1e6fe32362ac9021"
 
 inherit autotools update-rc.d systemd
 
-- 
2.34.1


