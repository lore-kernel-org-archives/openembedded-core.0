Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51A3CCA480
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 11:28:57 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.36896.1656674933643275295
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 04:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tEAShWbp;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656674931; i=@fujitsu.com;
	bh=aOUTGSrsF2WXvz8zcjmtgzqltrsdMZ3/vzZ2PHMp5VU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=tEAShWbp8dVMYh/Vun7LXBYQJQVyuBWmYkjjdvTpFSeCTgtC5nsj40EKYW3eJQnbf
	 QfUtAAIl11tdU7YpIGbjo7aiGhW/Vc8IgC8DBWOi7dk1+OceHIVARfV4HZs1oCrKZP
	 GmftLiFJk+iADWswN9vL4qCuRTjpqlVCiP9Giwa/RJq/jdvyaWH3J6JJgjnc+E/YSn
	 HMrzPR3X+aWwj9dvZVY3/4P4DXv4fsWrR+ZldX4jju4603bzsbgF11c6BWqs/CA6ot
	 QskaFLoszoO/4vk3PwUvEdfiW+2Q38/YDUbDNOU0hpYg2DssofTXNUTDDQaYupq9em
	 1Gcc3g0mkgRcw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8ORpFt8a1+
  SwaUtzBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8blOVuZCvZxVhzb9Yy9gfEURxcjF4eQwANG
  iQW3dzNBOJeYJC5tbmODcHYzSjRs2cnexcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvf
  veAlQgLuElcfvySCcRmAYpfbOllBrF5BZwk1vftBLMlBBQkpjx8DxUXlDg58wkLxBwJiYMvXk
  DVKErMvtzMAmFXSMyYsY0NwlaTuHpuE/MERv5ZSNpnIWlfwMi0itE2qSgzPaMkNzEzR9fQwED
  X0NAUQlua6yVW6SbqpZbq5uUXlWToGuollhfrpRYX6xVX5ibnpOjlpZZsYgSGZkpxytEdjMf2
  /dI7xCjJwaQkynv12r4kIb6k/JTKjMTijPii0pzU4kOMMhwcShK8eTeBcoJFqempFWmZOcA4g
  UlLcPAoifD2g6R5iwsSc4sz0yFSpxh1OWZ+bTvALMSSl5+XKiXO+/c0UJEASFFGaR7cCFjMXm
  KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzLvpOtAUnsy8ErhNr4COYAI6Yue0PSBHlCQipKQ
  amPoLf2b5eHw73hIkdeBzUahO6vNAFRu2ZbfU7j/hnbv7Q6Ji1yHDlYqta/d4c9RnnNB8I3ic
  O2J5+5/jV1Ycmb5rUdA3tYxTb1plJomEyC/2rNq6OPRucYW3gIbRvJ4a3zWyVdvcXSNrf5du9
  Zc92X/77T3Fjxsmv4mZMeVlzp3fW9M3S7RsmsYu6l21Yib/hObZW5/nTotUjXu/YfvabyKLuF
  4+yNRetWdSU3O6e3LmkadHjzfd+beRxyp7XejVnYf+nmkR+XOe06bG8aAka5D+hO3zX85aNc1
  K4O2nj3P2yR2U3+Jq/75mYsH7ynL2n/ll1lbJ0r9jttsd0XKdGbt6vblEx5aWBzPVzfhOeW1S
  YinOSDTUYi4qTgQASGKGNVQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-745.messagelabs.com!1656674930!19158!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24000 invoked from network); 1 Jul 2022 11:28:51 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-23.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Jul 2022 11:28:51 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 6FE4B1AC
	for <openembedded-core@lists.openembedded.org>;
 Fri,  1 Jul 2022 12:28:50 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 64C037C
	for <openembedded-core@lists.openembedded.org>;
 Fri,  1 Jul 2022 12:28:50 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 1 Jul 2022 12:28:48 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 1/11] gst-devtools: upgrade 1.20.2 -> 1.20.3
Date: Fri, 1 Jul 2022 19:28:29 +0800
Message-ID: <1656674913-20419-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 11:28:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167455

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gst-devtools_1.20.2.bb => gst-devtools_1.20.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.2.bb => gst-devtools_1.20.3.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.20.3.bb
index 4819a34b26..c515e173c8 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "b28dba953a92532208b30467ff91076295e266f65364b1b3482b4c4372d44b2a"
+SRC_URI[sha256sum] = "bbbd45ead703367ea8f4be9b3c082d7b62bef47b240a39083f27844e28758c47"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.25.1


