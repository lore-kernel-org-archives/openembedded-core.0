Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5688DC5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 05:20:36 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.64541.1673241634651260930
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 21:20:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pY58kA7h;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673241633; i=@fujitsu.com;
	bh=YExUxh/2NS22h27FP/HTaapsyDMeW2IQwXwwIxIS3yM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=pY58kA7hW40FoKzH1VhiQskplzMtTbCAI0pVOlxGMB4JVzryCNNSFvHS4TsBCjZuH
	 cy33yJ5/pZxqpEmz6N12DTJG/4Pw4yJsisZdMfLl5snue39OEwUmVfq2DEZjp95yzF
	 tb9tXUnOm0QIUhtU5kw92XvANJzdILFIbp/twKljLLdDiDvwcCY3vKeOVXj1szZKu7
	 ldAmmy1vdmOAiMQefAld9D/ZlECnbtBlQAZoFRxH+KEgXh6xLorohRk+pDqKAN4iea
	 w0fLPVqZAr4Sb0oIb/eK+JRFuhsksiVknu4N65K1BhrUTSyCKiyqMpVNLNjL+iTrvP
	 4C2S87cQpYP+A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8OxWVdhye5
  kg69t/BZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bDnVvsBedEKmb/a2NsYOwU6mLk4hASeMAo
  MefBClYI5zKTxLq2aWwQzh5GidNXbwM5nBxsAlISN+7/B7I5OEQE9CSu/hMFCTMLqEi8+N3DD
  mILC9hLTJnZxgRiswDFz27vBrN5BZwk3p3azgJiSwgoSEx5+J4ZIi4ocXLmExaIORISB1+8YI
  aoUZSYfbkZqr5SovXDLyhbTeLquU3MExj5ZyFpn4WkfQEj0ypG0+LUorLUIl1zvaSizPSMktz
  EzBy9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzknBS9vNSSTYzAUEwpVrXYwbh+2R+9Q4yS
  HExKorwcVbuShfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwzl64O1lIsCg1PbUiLTMHGBcwaQkOH
  iURXq6ZQGne4oLE3OLMdIjUKUZFKXHe14uAEgIgiYzSPLg2WCxeYpSVEuZlZGBgEOIpSC3KzS
  xBlX/FKM7BqCTMKzEPaApPZl4J3PRXQIuZgBb/mLoTZHFJIkJKqoFpc2VP7iYDs+f8+naNpmx
  xQSt7jHxiT302N8xVz5GWfb5mC4dU88GAiGvfkp1M3Pq3GorULXt6cFOw164T6u/mXZzod7LZ
  Wou14V6xiX6amwjL0qg1OdOqWyK7Vl58lZQ8N5vjsLGvJv8xbbGGYz6Z02aKHc4skNixJ+YNx
  6Wg1X/2h1x61uhyQ2Pm5JYVqQ5772ewOvTKWTPY5XQ2PNqSd//LJRUGGaWWrAUsO/ZLL2l99O
  T7TJYvKyf4Kbbr/2IUia1d9fxVtcW6ylvW91hPbNgQbL2d6eLUd1IREtv7p8roBDNeEniRx85
  jfrf9lUj8U8MDHF9f+Nrm/Hm+cG5fOE+joZrcu+exDZfW2SixFGckGmoxFxUnAgAtpraWQAMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-571.messagelabs.com!1673241632!313772!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12015 invoked from network); 9 Jan 2023 05:20:32 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-21.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jan 2023 05:20:32 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id F086B150
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jan 2023 05:20:31 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id E4BBE73
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jan 2023 05:20:31 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 9 Jan 2023 05:20:30 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ncurses: upgrade 6.3+20220423 -> 6.4
Date: Mon, 9 Jan 2023 13:20:19 +0800
Message-ID: <1673241622-29031-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 05:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175663

From: Wang Mingyu <wangmy@fujitsu.com>

exit_prototype.patch
refreshed for new version.

Changelog:
==========
 regenerate llib-* files.
 correct PS vs PE names in bracketed+paste (report by Bram Moolenaar)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ncurses/files/exit_prototype.patch         | 18 ++++++++++++++----
 ...{ncurses_6.3+20220423.bb => ncurses_6.4.bb} |  2 +-
 2 files changed, 15 insertions(+), 5 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses_6.3+20220423.bb => ncurses_6.4.bb} (91%)

diff --git a/meta/recipes-core/ncurses/files/exit_prototype.patch b/meta/recipes-core/ncurses/files/exit_prototype.patch
index 791421a338..d1f194f0af 100644
--- a/meta/recipes-core/ncurses/files/exit_prototype.patch
+++ b/meta/recipes-core/ncurses/files/exit_prototype.patch
@@ -1,18 +1,28 @@
-Add needed headers for including mbstate_t and exit()
+From da6ab9f1eaf00a494d55454fcf3de563b084c04e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 30 Aug 2022 15:58:32 -0700
+Subject: [PATCH] Add needed headers for including mbstate_t and exit()
 
 Upstream-Status: Inappropriate [Reconfigure will solve it]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ configure | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure b/configure
+index f377f551..163f8899 100755
 --- a/configure
 +++ b/configure
-@@ -3422,6 +3422,7 @@ rm -f "conftest.$ac_objext" "conftest.$a
+@@ -3423,6 +3423,7 @@ rm -f "conftest.$ac_objext" "conftest.$ac_ext"
    cat >"conftest.$ac_ext" <<_ACEOF
- #line 3423 "configure"
+ #line 3424 "configure"
  #include "confdefs.h"
 +#include <stdlib.h>
  $ac_declaration
  int
  main (void)
-@@ -12997,6 +12998,7 @@ cat >"conftest.$ac_ext" <<_ACEOF
+@@ -13111,6 +13112,7 @@ cat >"conftest.$ac_ext" <<_ACEOF
  #include <stdlib.h>
  #include <stdarg.h>
  #include <stdio.h>
diff --git a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb b/meta/recipes-core/ncurses/ncurses_6.4.bb
similarity index 91%
rename from meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
rename to meta/recipes-core/ncurses/ncurses_6.4.bb
index fb8c11582b..20fd2dadda 100644
--- a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.4.bb
@@ -6,7 +6,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://exit_prototype.patch \
            "
 # commit id corresponds to the revision in package version
-SRCREV = "20db1fb41ec91cd8a1f528e770362092c5403378"
+SRCREV = "79b9071f2be20a24c7be031655a5638f6032f29f"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)$"
-- 
2.25.1


