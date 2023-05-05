Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC06FC7EE2C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:21:04 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.30251.1683300056930126237
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=favFSnj3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-643aad3bc41so566118b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300056; x=1685892056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ll0fTfMpGWpSi9m3Qyy+MbY/0DiQDB/8BFoQno9EtOw=;
        b=favFSnj35IByBzZxXZH5T4mwrH/NU4JTj6ICrMck9YKKujHkVRPRFjhK6YzG8aheKC
         BoZnMbEMpmBqTZZyxK99Eg/T0giiKO462Sor/IDQJxHf63VrZ4rV4FActaniBCU0eWNV
         93Ejph+IQtjmtr42Y1CSqiDYgikFnFpKuNd7LyCzVApOSEIbrQBZbJS00F/J49grGX7m
         p0SO9DokRB4g5jXTj31Lk9CRPZO4Qn22cMc82HAiq1KVCiE0RJikz+8weAJo3PlA/SBC
         v4kYMpnLAIvu7BBCX/TFU5bvTDQj9pAxcS8/DlQAcvlRmgkdAI+UqBC2TJaS8/o6OZwp
         OXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300056; x=1685892056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ll0fTfMpGWpSi9m3Qyy+MbY/0DiQDB/8BFoQno9EtOw=;
        b=V0cm/0IyDgdO1L+90s3f6CoTt315ZScXfSxNqZE2Co4ccUYVOS7PCtC327PBbiubEV
         /E3P1zShmW63zotvwTUazczPmQc8tigXKTRAJe1CxDFU/CFCjBh6kT28h/GzUw7sXRv3
         4fnzwDsbw/iJA3OnRrrupvdjP4Jb+0xP27Yt2FUi1xHaX4swUgd/S1VOaQIbL4TeJ9ID
         8Fd28q+OCI5ADxcdG5Gsrv65pJCH1jih1LXadlF/g0rU+Wa++Msx5hXLC8xwI/48PNds
         3m7Zl3ynhrHODKXcIeXB5ZPorCmLZ5oQKrYFDeOq1TmTKM/KXHZgw50oG9TmCGbNbBac
         FwhQ==
X-Gm-Message-State: AC+VfDz66wrlBxc5slky4Cwd3KIbiZIDXMM/6bDojc4rNEc7IU75qh29
	tWHX0RuPCnej3I014LrKUq/MbRoTW4fIzBzEycI=
X-Google-Smtp-Source: ACHHUZ7f2OlF05KduusNr07ihNfcD4VG/t+xdqp2QbnSH2aFSC4uKGwCx802A0ZDfeobgIbHdH3kvQ==
X-Received: by 2002:a05:6a00:2d25:b0:643:6b94:374b with SMTP id fa37-20020a056a002d2500b006436b94374bmr3204765pfb.1.1683300056009;
        Fri, 05 May 2023 08:20:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 26/35] libnotify: remove dependency dbus
Date: Fri,  5 May 2023 05:19:37 -1000
Message-Id: <c6702ecbb003199b746c2235ea4f900d912d4666.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180946

From: Kai Kang <kai.kang@windriver.com>

It ported to use GDBus in libnotify 0.7.0 [1]. So remove dbus from
DEPENDS. And GDBus is provided by glib-2.0.

[1]: https://gitlab.gnome.org/GNOME/libnotify/-/commit/f63e8ab

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 3e585e41f561aab73685290631f2263795f571b9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/libnotify/libnotify_0.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb b/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
index b1656fe0fe..08e9899d00 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
@@ -9,7 +9,7 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-DEPENDS = "dbus glib-2.0 glib-2.0-native gdk-pixbuf"
+DEPENDS = "glib-2.0 glib-2.0-native gdk-pixbuf"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,gtk+3"
-- 
2.34.1


