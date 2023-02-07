Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4378C636D3
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 10:20:40 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.80210.1675765232890366729
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 02:20:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=U9a7iG+c;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675765231; i=@fujitsu.com;
	bh=q1KGlSkxUh2CHAntKVO3aA7TUWBfj69gQcO8zx7VIZM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=U9a7iG+c7ZjsHooncVtCISCbP2J0Wk7eR3ohwj1poyfWxKO7DpYyuf9xY/08moZMs
	 Suc9Cf05Q/iwclQoWYbmkGE1MCXNvu9fdGyj+6HlUzIQDzUhoxbxYSUpaOQtMnclpF
	 8PaRSx07rF0uQLG48hGNUrx5I2t5RmvYXyyxhA4lVHtMVwJIlr9hpIcT+Q46yJGfk9
	 n5JnYTflswLWT8dqlLYl9NOE5Gz8oy0KKTngtzsSxzNXJoiOJfNfgSq6qt4Lar4NV7
	 8WCbOpkjz5xbN9lR6TksOY1y8YpPyeZM6px2Y5jrl1EUuBnlahBVA2U9Hb+oF71KRb
	 ELGjSro08ruWg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWfed6qN
  kg/dPzSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1owDv76zFjRzVrRcbWJsYFzC0cXIxSEk8IBR
  YlvHKhYI5wqTxPk/F5ggnD2MEkc+vWDuYuTkYBOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhASuJW/s62EBsFqD48v57jCA2r4CjxPf5L1lAbAkBBYkpD9+DjeQUcJJ4+XkjWL0QUM
  2x0zdYIOoFJU7OfMICMV9C4uALiBMkBBQlZl9uhppTKdH64ReUrSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo1lxalFZapGuoZFeUlFmekZJbmJmjl5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFlbnJO
  il5easkmRmDwphQzv9jB+KPvr94hRkkOJiVR3vXSj5KF+JLyUyozEosz4otKc1KLDzHKcHAoS
  fCyqADlBItS01Mr0jJzgJEEk5bg4FES4U0DSfMWFyTmFmemQ6ROMSpKifOKSwAlBEASGaV5cG
  2w6L3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZjXQwFoCk9mXgnc9FdAi5mAFoeoPgRZXJK
  IkJJqYOqa1qiWP/viPFZbfpepGXrvhQxEJx824jzlItQ7zfB+pd9DcVOpr0srV7Pb/LUJzD1a
  s0Xk5fuoleuuZhyZFrV8irKwpVzI3aUletliTx5sUVujtuB0mQhjuFQus8YTtWLh+qnJdu7Vk
  z8YfPFY0FVruKw2uyD14+2zXL5NG14Gt79k5PBzcUv++f3LhP7jAa5b50jcVr/xQLpB7kmgye
  yKlsc6z1buc2MIMWPQell9hWXu93ecv9c6v4+bHL0qK8VTLUGXIX9FhdA5JZYT98z6q3+ca+D
  01d2e3/rga2bzSeOA0LXNomfObonYVfs1ctOlqOf6B6q4XkSku/wQfFSiX9a5/uDhLga+X80h
  SizFGYmGWsxFxYkA1tUmuFkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-587.messagelabs.com!1675765230!95045!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10438 invoked from network); 7 Feb 2023 10:20:30 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Feb 2023 10:20:30 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 80F0F156
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Feb 2023 10:20:30 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 7553E155
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Feb 2023 10:20:30 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 7 Feb 2023 10:20:29 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] msmtp: upgrade 1.8.22 -> 1.8.23
Date: Tue, 7 Feb 2023 18:20:17 +0800
Message-ID: <1675765217-3462-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675765217-3462-1-git-send-email-wangmy@fujitsu.com>
References: <1675765217-3462-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 10:20:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176810

From: Wang Mingyu <wangmy@fujitsu.com>

The msmtpq script was updated.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/msmtp/{msmtp_1.8.22.bb => msmtp_1.8.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.22.bb => msmtp_1.8.23.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.22.bb b/meta/recipes-extended/msmtp/msmtp_1.8.23.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.22.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.23.bb
index d56af7346b..5e68a7ea92 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.22.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.23.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "1b04206286a5b82622335e4eb09e17074368b7288e53d134543cbbc6b79ea3e7"
+SRC_URI[sha256sum] = "cf04c16b099b3d414db4b5b93fc5ed9d46aad564c81a352aa107a33964c356b8"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.34.1


