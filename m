Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7E8CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 06:22:25 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14118.1781072541451297581
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 23:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fyBDlsk7;
 spf=pass (domain: mvista.com, ip: 74.125.82.171, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3042a388168so3321466eec.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 23:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1781072541; x=1781677341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=345zqEcewvSIBvffzwunRam3noMsgafcC4LoWvbK2vw=;
        b=fyBDlsk7PzR8hnk3NgZWyxR/4OveowuMK+17Ymdxum1jFM4vCPM9QOVa8pETfYoebF
         3DLiHHR3jscFjlJl2Kzh3XCGXgWyUp/G2qNCT4BBZzY9Kd2HbFBLnDH7NpOdSXcHi6MG
         gMTwV9nmrNtJexXxVA3FhQc0DNGklKOiS/A1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781072541; x=1781677341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=345zqEcewvSIBvffzwunRam3noMsgafcC4LoWvbK2vw=;
        b=tWWv/OwfZ8EJqw/U2snmq4WaJ6l82iwYNQjciJG8icQ773NB4spPocINhhWQXfKjm8
         HAnUu4dzMV0bnp2gYitmjhIEI+oI7pF9TJ9nLdzFQGa5BQ4Bh4GeexgkahqkAHI9ixhm
         9IdGcYNkLzyRz2ZngFvgP19H24ucb2FNmWSsJ4r8W5AG3XQZ7pReNg3/U18gj2tR4SZH
         mZETAPYmgzYL1CIL39KfypA7nv4yuFomN1O3F9VXELnIzuK0HRh9ktOkxF7M09S2qiZT
         +bdePC/bBQs8gDPF+zH3c56EX/Bw7DfafieKg0YPyDmHW2UHgwJ+X6kLQBYbxYZueXVB
         oBqQ==
X-Gm-Message-State: AOJu0Yxh7qhvf3yIM1eaHyM+AothBa0g4jkrSCBCIlBnQAJFe6/EyopE
	6sJPydC8ZHmeQMDP8WD2o9ZFfJNOG1HdftB2c8iH9IItQP2SRewbeEHu4SQQMhiTp/8Yv48q90s
	FBTaUXrw=
X-Gm-Gg: Acq92OFgg1ZDTjmjIV2HzJhNB/H0fY//Q7jMM566wWqpsJSD61IbCjsULr/sAztMG2i
	5wLOx8X5wfRTZzuumzXAlvLIDZyGdyoP7IYDI6khbjnBQposmQ8jlwvJ2OUmtxCwhmrOR6XmBAp
	j6lQBbaZw4YjlUMyfujZIUKpdJ0A80Sy4k6Hw7N3RbfantcI95ge517I+p8L27C0Z1PG1M3a2f9
	5xmJEaxO7nt2lDJtWkHeeXV/J8R5nMhlltQZls7t6/HsTCHBmccMUArDlTSDhe1zYL/X3diuMxM
	SV5T0nbZpuB3o+/wggIIJNlklQPsnLBx+VoMhSqgBuYzMp5dcWNXBQvGeyF5WNEQ3cnfqf5f8Ww
	vTRtR4FVqJmrUr9vNQYNYxfXREC+YdDTMwc0VVU0m8C1vRvT0XbH4PvDvks+UyjhLpDSZAyNRaI
	1dwNoQnk/xcuxfhfWfpEMYRBLZipa1eG/C1XykOBXUCD4cOas=
X-Received: by 2002:a05:7300:a887:b0:304:ddc3:2c35 with SMTP id 5a478bee46e88-3077ffb4d52mr11501126eec.10.1781072540639;
        Tue, 09 Jun 2026 23:22:20 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcad34esm35663577eec.11.2026.06.09.23.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:22:20 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] libsoup: fix for CVE-2025-11021
Date: Wed, 10 Jun 2026 11:52:02 +0530
Message-ID: <20260610062202.104499-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 06:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238316

Pick patch from [1] also mentioned at Debian report in [2]

[1] https://gitlab.gnome.org/GNOME/libsoup/-/commit/9e1a427d2f047439d0320defe1593e6352595788
[2] https://security-tracker.debian.org/tracker/CVE-2025-11021

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libsoup-3.4.4/CVE-2025-11021.patch        | 57 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-11021.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-11021.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-11021.patch
new file mode 100644
index 0000000000..9bba0929b7
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-11021.patch
@@ -0,0 +1,57 @@
+From 9e1a427d2f047439d0320defe1593e6352595788 Mon Sep 17 00:00:00 2001
+From: Alynx Zhou <alynx.zhou@gmail.com>
+Date: Sat, 11 Oct 2025 15:52:47 +0800
+Subject: [PATCH] cookies: Avoid expires attribute if date is invalid
+
+According to CVE-2025-11021, we may get invalid on processing date
+string with timezone offset, this commit will ignore it.
+
+Closes #459
+
+CVE: CVE-2025-11021
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/9e1a427d2f047439d0320defe1593e6352595788]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libsoup/cookies/soup-cookie.c | 9 +++++----
+ libsoup/soup-date-utils.c     | 3 +++
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/libsoup/cookies/soup-cookie.c b/libsoup/cookies/soup-cookie.c
+index 7c41b1d..5af154d 100644
+--- a/libsoup/cookies/soup-cookie.c
++++ b/libsoup/cookies/soup-cookie.c
+@@ -726,12 +726,13 @@ serialize_cookie (SoupCookie *cookie, GString *header, gboolean set_cookie)
+ 
+ 	if (cookie->expires) {
+ 		char *timestamp;
+-
+-		g_string_append (header, "; expires=");
+ 		timestamp = soup_date_time_to_string (cookie->expires,
+ 						      SOUP_DATE_COOKIE);
+-		g_string_append (header, timestamp);
+-		g_free (timestamp);
++                if (timestamp) {
++                        g_string_append (header, "; expires=");
++                        g_string_append (header, timestamp);
++                        g_free (timestamp);
++                }
+ 	}
+ 	if (cookie->path) {
+ 		g_string_append (header, "; path=");
+diff --git a/libsoup/soup-date-utils.c b/libsoup/soup-date-utils.c
+index 34ca995..ae5504d 100644
+--- a/libsoup/soup-date-utils.c
++++ b/libsoup/soup-date-utils.c
+@@ -95,6 +95,9 @@ soup_date_time_to_string (GDateTime      *date,
+                 char *date_format;
+                 char *formatted_date;
+ 
++                if (!utcdate)
++                        return NULL;
++
+                 // We insert days/months ourselves to avoid locale specific formatting
+                 if (format == SOUP_DATE_HTTP) {
+ 			/* "Sun, 06 Nov 1994 08:49:37 GMT" */
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index fc4a286dcf..8fe3775e1e 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -51,6 +51,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32049-2.patch \
            file://CVE-2025-32049-3.patch \
            file://CVE-2025-32049-4.patch \
+           file://CVE-2025-11021.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.50.1


