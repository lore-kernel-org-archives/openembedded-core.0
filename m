Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A43EC433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 11:30:07 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.37237.1656675006067389822
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 04:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YSEQusy/;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656675004; i=@fujitsu.com;
	bh=6uBep1XR/oFI8fpyQXLNcGweYN0zeuCekp1+cd45Uwo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=YSEQusy/NZLTALg44X4wCLZkWPJeScjCLgDgM4jWE77N6t0PGeU8nzCKEBlpe81wt
	 aI1AqEEvJc93oHQmie/B9YcUM5HLVlQcBmqx+yw04zFV12sy8yDHSdRzXughuhxzwj
	 RXjrF3RDfrzR2Cz8X3+IFEDTfwneqb3rc6II/Sx42DVgjHn/MMQFNNkPhsvYBsH1i5
	 YYKcU6tCt38JaW8IV9kZA+UuHKZ1/F5v/h1bVRNO6gCrVrBKyboZMx4KNx0lFUsAjR
	 M8ZE9cpWlmHAWY05i/Tdjrf+1PH/B8UKT2R87VYfcASbHlw95mrg29LdWkA494j7bp
	 8cFcyK3Q/Twqw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8OxWXfPrX1
  JBudqLO78fMfuwOhxbuMKxgDGKNbMvKT8igTWjMnrswpecFa0fX7H0sDYzNnFyMUhJPCAUeL1
  z3ZmCOcSk8TZSY9ZIZzdjBLf1/xl62Lk5GATUJOYfusGUIKDQ0RAT+LqP1GQMLOAisSL3z3sI
  LawQLDEtIszGEFsFqD4kxszWEFsXgEniY93vjCD2BICChJTHr5nhogLSpyc+YQFYo6ExMEXL6
  BqFCVmX25mgbArJGbM2MYGYatJXD23iXkCI/8sJO2zkLQvYGRaxWidVJSZnlGSm5iZo2toYKB
  raGiqa2yia2RooZdYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZm5yTopeXWrKJERiSKcVKt3Yw
  blj1U+8QoyQHk5Io79Vr+5KE+JLyUyozEosz4otKc1KLDzHKcHAoSfDm3QTKCRalpqdWpGXmA
  OMDJi3BwaMkwtsPkuYtLkjMLc5Mh0idYtTlmPm17QCzEEtefl6qlDjv39NARQIgRRmleXAjYL
  F6iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw76brQFN4MvNK4Da9AjqCCeiIndP2gBxRkoi
  Qkmpgqq4QfNn/4YjKtPBLGQ9OsCZ1T99t0ct//xKHZ8xc4dyMwkNdia4rNq/sKZ14bJ/YinM9
  1lN0vAX6V+npWUbNyC/VtllrbihTdrh815v2lSyq6jpfOr3XHWO4tty+Uz/W2mBTeOEUd3bjV
  8dKXtVcP5V4dp/E302z5pxsmtDx72y14TzV0gkb5MrX33z2oPX4Uz0tjY9Vx6KW7mEsT2iQbs
  sXWzjdeeYb/YbkU1O6Hpf3/17DcEYlv+HS8/tpv2YLf4rh3LeW94pEVvUaxnOGz3zOvPuxOSU
  0ruDdv51+rHzuvR/231v186GMxoSehX8dQ9R0WFkmP3nzNOD0ioWHp/jOCDyTEPvkitBbSafT
  UkosxRmJhlrMRcWJAGEwUdhQAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-548.messagelabs.com!1656675003!26160!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22591 invoked from network); 1 Jul 2022 11:30:04 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Jul 2022 11:30:04 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id B1A9B142
	for <openembedded-core@lists.openembedded.org>;
 Fri,  1 Jul 2022 12:30:03 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id A4F9975
	for <openembedded-core@lists.openembedded.org>;
 Fri,  1 Jul 2022 12:30:03 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 1 Jul 2022 12:30:02 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 6/11] gstreamer1.0-plugins-good: upgrade 1.20.2 ->
 1.20.3
Date: Fri, 1 Jul 2022 19:29:45 +0800
Message-ID: <1656674989-20458-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 11:30:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167460

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-good_1.20.2.bb => gstreamer1.0-plugins-good_1.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.2.bb => gstreamer1.0-plugins-good_1.20.3.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb
index 6c52fb35b9..0235935a4a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.3.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[sha256sum] = "83589007bf002b8f9ef627718f308c16d83351905f0db8e85c3060f304143aae"
+SRC_URI[sha256sum] = "f8f3c206bf5cdabc00953920b47b3575af0ef15e9f871c0b6966f6d0aa5868b7"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.25.1


