Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FB7C5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 05:15:16 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.64538.1673241313292506739
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 21:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HYiask1M;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673241310; i=@fujitsu.com;
	bh=9ilDbWPoXpo/y8BeNsrrabYkdLsAuoOt75G0KWyIln4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=HYiask1MnbcoJulJBXezRRrl9cRbwneHDyMmavfKccx2ZG+7uT+YTp8C28k0AO1kA
	 T+eYPycszU8qFukaV6Av1ooVvrhnse0grckBg9ths4qFNXmum6QsFYnadzNfQ7n7hz
	 CBD3G5U7h+1rh3GenZq/OF54M387LnJQfxsvg0vynrgtCBtY1pHjaDvtZn84bbgOH9
	 xVgu7ZWzQ6YRvKEpEVaZaqE62Gv/nccY7z1cBpdmP4JP7t1dt8DWBuea58gQ8gA/15
	 0BPPYv+U3WlcTsEer7+hYlgI7CtKwsNhF9A6kchClFHLugRvnlT1knSdLQdeDRdk51
	 6Im4DgVWSsx3Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8OxWffeot3
  JBv+bWS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oxnqw4xF2zlqPj5dw9jA+Ml9i5GTg4hgQeM
  Eu0dYV2MXED2FSaJF3d/MEE4exglGvqns4BUsQlISdy4/5+ti5GDQ0RAT+LqP1GQMLOAisSL3
  z1gg4QFbCRObToAZrMAxQ/+3Alm8wo4STzfepcVxJYQUJCY8vA9M0RcUOLkzCcsEHMkJA6+eM
  EMUaMoMftyMwuEXSnR+uEXlK0mcfXcJuYJjPyzkLTPQtK+gJFpFaN5cWpRWWqRrqGpXlJRZnp
  GSW5iZo5eYpVuol5qqW5eflFJhq6hXmJ5sV5qcbFecWVuck6KXl5qySZGYDCmFCdw72B8tOyP
  3iFGSQ4mJVFejqpdyUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeGcv3J0sJFiUmp5akZaZA4wMm
  LQEB4+SCC/XTKA0b3FBYm5xZjpE6hSjopQ4by1InwBIIqM0D64NFo2XGGWlhHkZGRgYhHgKUo
  tyM0tQ5V8xinMwKgnzSswDmsKTmVcCN/0V0GImoMU/pu4EWVySiJCSamDyiZ/lY5KxWSvla1j
  j4u6Uogvb9ognqwjMljD6fXDOrepkB6GuafKfPX8nPVH/XmKuWvjxNt/r9ZO4jR/OeyJiLLBn
  W21V86knK6dLFh6L2vHjn/i9qoL9oZ5JrafqN/19F2C04krl5z3CcdN8pgc9q0q+HeHLsD3xZ
  FOp9JUu5k+ZYUvfZrf+cRQ3fSHBX2QkVPm4oSLgWiDH9rJlPXwq5blhS6ynNr7h3yhipdP/yY
  3d+Wn337XPBOsNn1o+KpP2ZVHLDL6lsYB9+l/bX1NqjjLFpq5LOvb06Cy32WEq1mVR8qeDXDb
  f+qH1S+LE6q0zYnq+siolyVXmHZFbNc/BwitOXF2WgfGIgW+7jxJLcUaioRZzUXEiAJMHpL5B
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-732.messagelabs.com!1673241309!309267!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25748 invoked from network); 9 Jan 2023 05:15:10 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jan 2023 05:15:10 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 887FD152
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jan 2023 05:15:09 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 7BE3B150
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jan 2023 05:15:09 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 9 Jan 2023 05:15:07 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsdl2: upgrade 2.26.1 -> 2.26.2
Date: Mon, 9 Jan 2023 13:14:54 +0800
Message-ID: <1673241297-28966-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 05:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175659

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl2/{libsdl2_2.26.1.bb => libsdl2_2.26.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.26.1.bb => libsdl2_2.26.2.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.26.1.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.26.2.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.26.1.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.26.2.bb
index 0b2231bc7a..17fc410f6c 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.26.1.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.26.2.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "02537cc7ebd74071631038b237ec4bfbb3f4830ba019e569434da33f42373e04"
+SRC_URI[sha256sum] = "95d39bc3de037fbdfa722623737340648de4f180a601b0afad27645d150b99e0"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.25.1


