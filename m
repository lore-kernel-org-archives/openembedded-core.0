Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF01C77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:04:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.40711.1681117478595886820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hLvjNSCh;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117476; i=@fujitsu.com;
	bh=TQC4Ni8xh8CWhJ/uJgOPk2pUQSRgw8lpFJKvK21OO2s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hLvjNSChhFSp0grITNqrk/qvqLMiCUEkh+3jYPGnunt5FcZLw1k66gtuQQkChMOwQ
	 yQwTRUN7LGpGtIA1RsEgDspQNYZppFarVD9TkInkuwa8HPAgzyWYq8976ptOS0yJzB
	 GCf9WouKKvZjHmGXDfkvBNhcebynzMPiblXuCB2VUrqDRQsDk5ZshCKjuNBScXBoUP
	 8DQLTYgIWcHjwBrhkGeN6utfSv1d86D0GeSszNUHQIyN32rlwf65x6Ybwr9C5aJIXd
	 JNrNl6MrPa4I0X7xnU2kR00R5nEHbTv2dPN1rI/EMs5gbIUsxc5XfuFt0lenJpRkD9
	 pqGvWBI8w+9AQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqKty0Tj
  FYOVKYYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePgu3b2gomcFa3HNzE3MC7h6GLk4hASeMwo
  0fN5LiOEc41JYuuHjawQzh5GiQ+/PwBlODnYBKQkbtz/z9bFyMEhIqAncfWfKEiYWUBF4sXvH
  naQsLCAjcTcdhOQMIuAqsTuf89YQWxeASeJowu2gdkSAgoSUx6+ZwaxOQWcJY5f2M0OYgsB1X
  Qfuw9VLyhxcuYTFojxEhIHX7xghuhVlJh9uZkFwq6QaJx+iAnCVpO4em4T8wRGwVlI2mchaV/
  AyLSK0aw4tagstUjXWC+pKDM9oyQ3MTNHL7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbhYr7gyNzkn
  RS8vtWQTIzB0U4oThXYwfuv9q3eIUZKDSUmUt4vLOEWILyk/pTIjsTgjvqg0J7X4EKMMB4eSB
  K/BBaCcYFFqempFWmYOMI5g0hIcPEoivFnngdK8xQWJucWZ6RCpU4yKUuK8HCAJAZBERmkeXB
  ssdi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEubddhhoCk9mXgnc9FdAi5mAFnO5GIAsLkl
  ESEk1MIVaZjVXmBYtc3t67IJ2jAaP6H/vZzs39LytO1HediPwa9ntH+vT1SzM2WSZfj/Sm8Op
  dNrIRV+ZLaaz6ufNE3V7Lj5Mmp9Yqb3wcPx2O0tNjV/TNfiN/7j98O1YpLM38dZDz18pB1Xsb
  l50Spv23+v+5anxTfY3BRQqL9uwFzMxt3D+uXi4TtakWuz+yTpv4ebGHX0XHDYkC+24FCW3SU
  bx/0fBifqTrsvmyEqpTg320+Gye/Ql/olZ9ZoZN3y7/I+68gStyOBN3Pz6SO7U7Ju7FO9bRPG
  8rv0+e0v764XSTnf0+WoPrnz8xPR+j4xvcUJG2VruLEPu9YtijxUc8OU/wxL5QtXnoLC63t9b
  SizFGYmGWsxFxYkAhsZAO1gDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-732.messagelabs.com!1681117475!396033!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14349 invoked from network); 10 Apr 2023 09:04:36 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:04:36 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B3B14100230
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:04:35 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B201A100229
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:04:35 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:04:34 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sqlite3: upgrade 3.41.0 -> 3.41.2
Date: Mon, 10 Apr 2023 17:04:17 +0800
Message-ID: <1681117459-24898-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681117459-24898-1-git-send-email-wangmy@fujitsu.com>
References: <1681117459-24898-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179865

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sqlite/{sqlite3_3.41.0.bb => sqlite3_3.41.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.41.0.bb => sqlite3_3.41.2.bb} (86%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.41.0.bb b/meta/recipes-support/sqlite/sqlite3_3.41.2.bb
similarity index 86%
rename from meta/recipes-support/sqlite/sqlite3_3.41.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.41.2.bb
index f17c15e258..b09e8e7f55 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.41.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.41.2.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "49f77ac53fd9aa5d7395f2499cb816410e5621984a121b858ccca05310b05c70"
+SRC_URI[sha256sum] = "e98c100dd1da4e30fa460761dab7c0b91a50b785e167f8c57acc46514fae9499"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_IGNORE += "CVE-2019-19242"
-- 
2.34.1


