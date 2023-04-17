Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8D1C77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 06:38:10 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.48257.1681713488130569153
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 23:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FhAQvcp8;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681713486; i=@fujitsu.com;
	bh=bhB5DhaOi7eFsLNCeGUqRdSoyUlU3AtF9XuTQ0Frgtw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=FhAQvcp8nBCQLJZ0lzOc+2SMrBsY37oTUT0RifRlvm3+BEP3xlgQgGEorsgp7xsCX
	 jNjMoouiCSc5zjNypR0IOXBRA9vQkFFpV/yT1J5nXZyWkkpaX+L8RNwpWXtnc1ItOu
	 N+gAhAVvtzGayGYxB8t5mOnDpgxx5DJ4t8isyhdUCtBNDITO0/ejKybbbRchF3slFv
	 8DTXtjPBYXt3i6n8YarlOjK6CzCk1N55fsxK1qMcqXKbbEFpeUxc8wF6AXEiPQh+BF
	 XajC1d6udRkYpoL/K47xrMBkwp2M3FDRha0EpKJR1QpWcZ0YMHjFc7j45d4HQkrbxS
	 G9iryD4N9b3IQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpOv70ib
  F4MAXA4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePFlxVsBde5Kx4ta2JpYNzF1cXIxSEk8IBR
  4vuLL2wQzmUmiVWT7zJCOHsZJZonHwdyODnYBKQkbtz/D1TFwSEioCdx9Z8oSJhZQEXixe8ed
  hBbWMBdYnf7bbByFgFViU3dB8FsXgEniS07PjKD2BICChJTHr4HszkFnCVW7FnMAmILAdUca3
  vIBlEvKHFy5hMWiPkSEgdfvIDqVZSYfbmZBcKulGj98AvKVpO4em4T8wRGwVlI2mchaV/AyLS
  K0aw4tagstUjX0EQvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzknRS8v
  tWQTIzB4U4pVXuxgfNb3V+8QoyQHk5Io74tU6xQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErwBz
  21ShASLUtNTK9Iyc4CRBJOW4OBREuE1fgaU5i0uSMwtzkyHSJ1iVJQS5xUCSQiAJDJK8+DaYN
  F7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwb+5joCk8mXklcNNfAS1mAlospwS2uCQRISX
  VwJTptGHZavNUHZMXkhuTN81d3DQj1Tnj8abXu5xjj0UfM9+r671yz/obKkczp836f75cVsAv
  wuW90AxVsfoDr3Im8B8LSd+/VVVzf8Sr+221erm6x+bUPplbpsX/Zvb/D47ezAHb+YvfmMrGf
  iiVXSRUzPk/6OzPzrt2SVOq7mZVcfz86W8goPabeX/J3BM/LlpdY3yh8NaZvdrRcSnnyUTmXb
  sn6TLO280dWHGiXjJVv/V0SrLsyk3cWv+T+RlW15q7ib+c7399TZXC6wYjlsm9OZyOjRIlfw2
  1v+8Ub22XlXNq9Ay62BrinFiVoGXw3bz98Ooziya1yZ0//VfIrv6Qaav40sQc/moN9cZFSizF
  GYmGWsxFxYkAxiCKU1kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-548.messagelabs.com!1681713485!288798!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17029 invoked from network); 17 Apr 2023 06:38:05 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 06:38:05 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 806701AC
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:38:05 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 747377B
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:38:05 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 07:38:04 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] openvpn: upgrade 2.6.2 -> 2.6.3
Date: Mon, 17 Apr 2023 14:37:38 +0800
Message-ID: <1681713459-18443-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681713459-18443-1-git-send-email-wangmy@fujitsu.com>
References: <1681713459-18443-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 06:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180124

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  GHA: remove Ubuntu 18.04 builds
  vcpkg: request "tools" feature of openssl for MSVC build
  doc: run rst2* with --strict to catch warnings
  Support of DNS domain for DHCP-less drivers
  Bug-fix: segfault in dco_get_peer_stats()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openvpn/{openvpn_2.6.2.bb => openvpn_2.6.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.2.bb => openvpn_2.6.3.bb} (97%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.2.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.3.bb
similarity index 97%
rename from meta-networking/recipes-support/openvpn/openvpn_2.6.2.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.6.3.bb
index 36ae8c96f..76bce7db5 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.2.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.3.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "42d561a9af150b21bc914e3b7aa09f88013d2ffa6d5ce75a025a3b34caa948d4"
+SRC_URI[sha256sum] = "13b207a376d8880507c74ff78aabc3778a9da47c89f1e247dcee3c7237138ff6"
 
 # CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not for openvpn.
 CVE_CHECK_IGNORE += "CVE-2020-7224 CVE-2020-27569"
-- 
2.34.1


