Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD8FC77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:04:51 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.47936.1681715089510664188
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GcIcGqqE;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681715087; i=@fujitsu.com;
	bh=V7htNflb82qx54jm5iw6dFPsdFh7jKUmVfeHX6DK0Nk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GcIcGqqEffEfMQSM9DaSlbs0Y+3ODoLWj4ro4/hPLdjvi806ybyh64zz6qWe0XL3u
	 54TKY0Ue4XtXiLu9UMtdtgX9RkKnPHGWZftGvTtT+WfhWN6E988VPfd7ZzFVkQfIkz
	 ox2+BioMVA/tKNeZDWGKfheU/giXJoGJZXuYaynNyKFaaUbjBoWOtKkiIfj0ScRKYt
	 W2/u5JARAYwfbEaHHv9MWKYEZxmo5qtg9ZOY33bLC3/ym4npHYDcGnMnLR6PmT0sxj
	 c6QVrB/sJ4+yZW1gUFc+j/HxwjQwXvOeRvbXmyab5NjHAaPR9U098JFdnT2ecGjbqF
	 pkbeSe78M5auQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8ORqNv33ib
  FYOVUC4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePo3S2MBft5K+bP3M3ewPiBu4uRk0NI4DGj
  xLU+ry5GLiD7OpPE0g2PWSCcvYwSj6ddYQGpYhOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhAU+JAwu+gNksAqoS754vA2vlFXCS+H9mO1hcQkBBYsrD98wQcUGJkzOfsEDMkZA4+O
  IFM0SNosTsy80sEHalROuHX1C2msTVc5uYJzDyz0LSPgtJ+wJGplWMZsWpRWWpRbpmeklFmek
  ZJbmJmTl6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgaGYUpzweAfjvL6/
  eocYJTmYlER5X6RapwjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4C18Z5MiJFiUmp5akZaZA4wLm
  LQEB4+SCK/xM6A0b3FBYm5xZjpE6hSjopQ4bzVInwBIIqM0D64NFouXGGWlhHkZGRgYhHgKUo
  tyM0tQ5V8xinMwKgnzXnsBNIUnM68EbvoroMVMQIvllMAWlyQipKQamE75pjM+v3Zw/eefCnO
  970z8uk19XqmQeZPlg8yPDJ1PPt2TyZ8o/02bb8fGYDcht4bXglF9P6wUNr5k5nlSM9N0/pRJ
  rNV910LYfoUtXL9qo/PN7DtPJm8LeslXphT/2GLLvyO7766JPfvlo946MSmfRxaq0hvUz9zSr
  pH+Fz//NpPkzIDAHy9dLu/YuyHr/orYazckmfg6a7g+JNQbPi/y1+kzvCgsZcT47MHerRMSbg
  c/eH1x9sOdNbL8Z94vzDW7oVn56emHroqQwul3BbI2hXNnJ/6+lbcxp/CsksxJ/guu4Y4mjbd
  Zr80L36/X2N2uJ6G1iNlV4uWmfOcTU5+KlT/69u/5LlNJjfAJh6uUWIozEg21mIuKEwHgUW3R
  QAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-732.messagelabs.com!1681715086!216016!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3940 invoked from network); 17 Apr 2023 07:04:46 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 07:04:46 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 5C4411001A9
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 08:04:46 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 4F6271001B1
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 08:04:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 08:04:44 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] tcpdump: upgrade 4.99.3 -> 4.99.4
Date: Mon, 17 Apr 2023 15:04:31 +0800
Message-ID: <1681715072-18848-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:04:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180141

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Source code:
----------------
  Fix spaces before tabs in indentation.
Updated printers:
-----------------
  LSP ping: Fix "Unused value" warnings from Coverity.
  CVE-2023-1801: Fix an out-of-bounds write in the SMB printer.
  DNS: sync resource types with IANA.
  ICMPv6: Update the output to show a RPL DAO field name.
  Geneve: Fix the Geneve UDP port test.
Building and testing:
----------------------
  Require at least autoconf 2.69.
  Don't check for strftime(), as it's in C90 and beyond.
  Update config.{guess,sub}, timestamps 2023-01-01,2023-01-21.
Documentation:
-------------
  man: Document TCP flag names better.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tcpdump/{tcpdump_4.99.3.bb => tcpdump_4.99.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.99.3.bb => tcpdump_4.99.4.bb} (93%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
similarity index 93%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
index 03f1b76f9..803a9bb5f 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.4.bb
@@ -26,7 +26,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "ad75a6ed3dc0d9732945b2e5483cb41dc8b4b528a169315e499c6861952e73b3"
+SRC_URI[sha256sum] = "0232231bb2f29d6bf2426e70a08a7e0c63a0d59a9b44863b7f5e2357a6e49fea"
 
 UPSTREAM_CHECK_REGEX = "tcpdump-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


