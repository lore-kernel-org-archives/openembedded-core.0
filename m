Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA67EC77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 06:38:00 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.48252.1681713477706679581
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 23:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QND4wn/O;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681713475; i=@fujitsu.com;
	bh=hwjtO9xeGpiKZUj6EfdqT5kI1w/pu38tqrKXcXnVUo0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=QND4wn/OyqIUW82pwu9Fkeour5G5m38xSJqQtdhw+/OOJUBSOgIRo5m5a9NAZSa5T
	 l2yH/7GYjEt7AkRk9BhZzUZqp1yzXpEKsLtyRWir86raOErVEXCkGC4sz5gQOVWPZ8
	 FYT6VUODtgWYIbeQEIewv4TPsx62S7gZOZOYMn0LjRJ4QOQOlrAObpe8Pwe6V1k+So
	 Mlyr5QD7iWqjRISf1CV+TakMVpIyaG3qopBwPqWqc3UzskOTISkaCNoq2ihPCP07PE
	 Vj8qSGZp3MKdXJevi4YVrgkmvHK0b8udd8xfirkCHWer1IzLZ74R/77M/xr1Am9IvQ
	 iD00tVF2GmCow==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8OxWdf5pU2
  KweGpvBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8asPQ/ZCg5wVmy5fIWpgfEBRxcjF4eQwANG
  iXfXV7FBOFeYJC4/u8QC4exllOg+8oupi5GTg01ASuLG/f9AVRwcIgJ6Elf/iYKEmQVUJF787
  mEHsYUFnCUWPvnAAmKzCKhK/LixjgWknFfASWLiU0WQsISAgsSUh++ZQWxeAUGJkzOfsECMkZ
  A4+OIFM0SNosTsy80sEHalROuHX1C2msTVc5uYJzDyz0LSPgtJ+wJGplWM5sWpRWWpRbqGhnp
  JRZnpGSW5iZk5eolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWVuck5KXp5qSWbGIHBmFKcdnwH
  48u+v3qHGCU5mJREeV+kWqcI8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuANeG6TIiRYlJqeWpGWm
  QOMDJi0BAePkgiv8TOgNG9xQWJucWY6ROoUo6KUOK8QSEIAJJFRmgfXBovGS4yyUsK8jAwMDE
  I8BalFuZklqPKvGMU5GJWEeXMfA03hycwrgZv+CmgxE9BiOSWwxSWJCCmpBqYqdhfP/9J77gl
  +LHjrwXDrRmeGg9zxHhZzZV3/czvvRqjWRt5p/RPFmqvAt1emn1/uzdbGVRdsfW+cL882ZvHd
  FJ6owJwyN3D7nB7p28ahdgLL+BrfhOz1mmJ270eiTwNba0yUGZe8d6u3zT8RsXh1v/MW78/uq
  3TPe27EvdrO+IRDWvDB7ZreXBkiS8+lV4vUr/M5LxzCdCotWP5IxPFL6W1asxXqi26wzdb6v+
  O0utOG34tYvSdIXezX2Li++8fCRSm/f/148CesXNZHa7u9i2z/ar01x6W8+54fyE3735MUOTu
  iJNXwxzbOp3xfL/7j/3Zl3TRXK2fVd3uVzu+rWtz6YeEue5m7zG95lFiKMxINtZiLihMB0Etw
  v0EDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-732.messagelabs.com!1681713474!212400!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7986 invoked from network); 17 Apr 2023 06:37:55 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-6.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 06:37:55 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id A845A151
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:37:54 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 9CB37142
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:37:54 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 07:37:53 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] capnproto: upgrade 0.10.3 -> 0.10.4
Date: Mon, 17 Apr 2023 14:37:35 +0800
Message-ID: <1681713459-18443-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 06:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180121

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../capnproto/{capnproto_0.10.3.bb => capnproto_0.10.4.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/capnproto/{capnproto_0.10.3.bb => capnproto_0.10.4.bb} (90%)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_0.10.3.bb b/meta-oe/recipes-devtools/capnproto/capnproto_0.10.4.bb
similarity index 90%
rename from meta-oe/recipes-devtools/capnproto/capnproto_0.10.3.bb
rename to meta-oe/recipes-devtools/capnproto/capnproto_0.10.4.bb
index bf98d561e..bbdc3b597 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_0.10.3.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_0.10.4.bb
@@ -5,8 +5,8 @@ SECTION = "console/tools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=a05663ae6cca874123bf667a60dca8c9"
 
-SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-0.10.3;protocol=https"
-SRCREV = "a16468f296a9584f4068072efecdee8a9eb9c2ed"
+SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-0.10.4;protocol=https"
+SRCREV = "a91ec65323c2577732224d0cf6f5bf1e79d3a724"
 
 S = "${WORKDIR}/git/c++"
 
-- 
2.34.1


