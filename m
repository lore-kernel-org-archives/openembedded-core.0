Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22E1C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:58:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.39804.1681117124763292620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oqD+FmFi;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117122; i=@fujitsu.com;
	bh=cDda59aQEePsVlSGG8M6NgWGohviO3HIlYT0XliXArs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oqD+FmFibEU1f5rESJ5hP00ed4AisUplYf+sGjTM2P37SGehj8Q5Omqjh61mdkcuI
	 7kkRM9H5g805pejB8qOslGZb7YVA3S7ouT0eWLmzrKk8Suoz/v+5WJoQWfb7hO+StG
	 ntyPoKTdZM0xgUvKbiemimCU1EAgeIvs/t3r6JndzubkE19ANo8Xvz89giX88p019J
	 zh/LUQ5ezTnX+mFElyIw+mresk1KBM043fhgwhPrQUsTYuzQcHv84BE/b1fxVgP5WJ
	 5NN0Oy6T3NFbZDphrkvphRw4rPzkJnkpgoPcFBEL2Y1NgbrarsSZSZBVkFG8C5mG3o
	 38bGZHqah7MuA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqHvovHG
  KweM5ghZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bbTa6CDSIVvTOnsDYwfhDsYuTiEBJ4zCix
  sXEBO4RzjUni04PFrBDOHkaJpqMfWboYOTnYBKQkbtz/z9bFyMEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jASuJ26xQmEJtFQFXiwqldYHFeASeJvX+Pg9kSAgoSUx6+ZwaxOQWcJS71rQIbLwRUM2
  viHCaIekGJkzOfsEDMl5A4+OIFM0SvosTsy80sEHaFROP0Q0wQtprE1XObmCcwCs5C0j4LSfs
  CRqZVjObFqUVlqUW6hhZ6SUWZ6RkluYmZOXqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJ
  OSl6eaklmxiBwZtSnFi3g3FF31+9Q4ySHExKorxdXMYpQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR4Dc4C5QSLUtNTK9Iyc4CRBJOW4OBREuHNAkaTEG9xQWJucWY6ROoUo6KUOC8HSEIAJJFRmg
  fXBoveS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEebcdBprCk5lXAjf9FdBiJqDFXC4GIIt
  LEhFSUg1M3tPdqm7d/uIR9HT32kOBcSzaCyOW3p8x28R5nWrjzGN/7StfPahlVTFlEpm01/Rf
  oazXsZWruDY2Zy3ub/7mMfWLr1TYugVpV93fxb4703ZefoXj+t5/nHUb1Byfzu39Pr95Uuem5
  I3fub6vPfBpkfUsRpuL/i8jLRmsd+ZG5u6MunfP/KkD1z/dzfKf71mc+d9TZ+y4qqBu63bT1O
  frfp0623i1tIt/l8u79Vs77rgZvTd7tVd525GnRU0VR3g6rB9PePfv8J+Tv6U//J39fO7ChtJ
  Zft93/7N5ueBNx/x4uc4mJqO5DJPmcm8+np6q4N52e2lSdGmUhU3A/PlfPu3JPXZv73bDH7XH
  8v23VqkpsRRnJBpqMRcVJwIAm6BQmFkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-732.messagelabs.com!1681117121!396856!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32598 invoked from network); 10 Apr 2023 08:58:42 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:58:42 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B34E71001B8
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:58:41 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B11831001B5
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:58:41 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:58:40 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsoup: upgrade 3.2.2 -> 3.4.0
Date: Mon, 10 Apr 2023 16:58:19 +0800
Message-ID: <1681117100-24726-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681117100-24726-1-git-send-email-wangmy@fujitsu.com>
References: <1681117100-24726-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 08:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179851

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix possible crash in SoupContentSniffer
* Fix socket leak
* Add missing annotation to soup_header_g_string_append_param_quoted()
* Fix regression in 'SoupCookieJar' not handling valid Secure cookies
* Fix crash when skipping HTTP/1 response stream with chunked enconding
* Change Session to unqueue finished items earlier without an extra MainContext iteration
* Add 'SoupMessage::got-body-data' signal to monitor progress of reads
* Add 'soup_session_send_and_splice()' and 'soup_session_send_and_splice_async()' convenience APIs
* Add 'soup_message_set_force_http1()' and 'soup_message_get_force_http1()' APIs
* Change 'soup_cookie_copy()' to not retain default ports
* Ensure 'SoupServerMessage' socket is available in websocket handler
* Fix 'soup_message_new()' not erroring when URI has an empty host
* Fix thread-saftey issues in 'SoupConnectionAuth'
* Fix various connection leaks
* Fix the possibility of sending invalid empty 'Sec-WebSocket-Protocol' header
* Fix IO errors not being handled on 'CONNECT' messages
* Numerous improvements to cookies:
    * Add support for cookie prefixes ('__Secure-' and '__Host-')
    * Reject cookies with control characters in name or value
    * Reject 'SameSite=None' cookies without 'Secure'
    * Change 'soup_cookie_parse()' to be more strict about what is considered whitespace
    * Change default SameSite value to 'Lax'
    * Fix 'soup_cookie_equal()' with 'NULL' path

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsoup/{libsoup_3.2.2.bb => libsoup_3.4.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.2.2.bb => libsoup_3.4.0.bb} (94%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.2.2.bb b/meta/recipes-support/libsoup/libsoup_3.4.0.bb
similarity index 94%
rename from meta/recipes-support/libsoup/libsoup_3.2.2.bb
rename to meta/recipes-support/libsoup/libsoup_3.4.0.bb
index e16cd17705..d35e4f25c1 100644
--- a/meta/recipes-support/libsoup/libsoup_3.2.2.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.0.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "83673c685b910fb7d39f1f28eee5afbefb71c05798fc350ac3bf1b885e1efaa1"
+SRC_URI[sha256sum] = "23efff6ac70f2c1e873507dac52649eec032c1597a4ae951762ce3123789acc9"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
-- 
2.34.1


