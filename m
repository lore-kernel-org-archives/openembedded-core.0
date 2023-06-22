Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A0FC001B3
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 02:36:43 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.1265.1687401401270728111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 19:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=JD+Ue6qU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b6824141b4so1178215ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 19:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687401400; x=1689993400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CeER/rig++k3NrTPo3NzqmFNoCsz4zehWmNdCh5UbUw=;
        b=JD+Ue6qUlP9yOEt7OnGZ7kYSd6jcxIWxEtwZ+BMsgM9///Kgk8Uh+O2JR/s+5nJU8f
         SjGJXOJsb3u527DVDjYVsOtf7aYKRtwiuU+siv00ZgwHbmwusgJFkHZLe+5ZtdmK+sLw
         YAdVRO0oLa69RNPMYNB6wGCigKeHPVsgtS1sNQjq+M7sS+4tn1Y77W+9+QYcn8qU28Ay
         aQOEOa9msVq2Ukb4JUM+5xy9DVfaVuqVIMn7CCYEBRny9LRCoPFxtSJ9tD5fz1ujEljX
         tpkLqaKr3YiTwoyFxKeuF1W/uuvS9gzMAJUAj0DBY5KmnC+SQrZQqdtFFY8wT51mbVxr
         z8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687401400; x=1689993400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeER/rig++k3NrTPo3NzqmFNoCsz4zehWmNdCh5UbUw=;
        b=g1BHu1arIpCrBOZsOO0zdoBpeHti89eWIeW5XbEyo1spMYS491mhaN2+T1cyTlPMWe
         K4Hilx85ur9qjxQEvU0vWWpR2TZ76FgNdqnJgF6lhLSTor0EVrHHgtFyYcWJ8mDg2YHW
         cJ9+DRsPBzj94CoUwyrR7lr1n9EyVRmMvzWQS7+XJMPIwtgTdi1LS5D4JtPBekMMSygG
         ZSWDP5yXR/Bh+VjsRfNLLhDBEaOgJz9zp+7JZhdm9l72nWj2FYoO3/kc3nmzFi3F6Bji
         Uqdjl0TFQLfBa5J7XsPO3UiBeLTDNrZVBL7gIyvmNJxASsgxwuMxGmGCqTShAP9nTsUD
         xFmw==
X-Gm-Message-State: AC+VfDwMGfyGkZsJYIj+LoftgzXrZ2D9nJWbnxHhz4m3iKV8tBtplQfK
	KPeBLFHuyRYkYFmlJpgV8BCZD98StxhEaz4v+9A=
X-Google-Smtp-Source: ACHHUZ571yxjCG6gayUzf2DUSu1fnjbyirlxU25W6QNLFOFvRyWufycFmmZtaAVUjBd2r5gUuB+PmQ==
X-Received: by 2002:a17:902:e747:b0:1b6:a99b:cebb with SMTP id p7-20020a170902e74700b001b6a99bcebbmr1938083plf.33.1687401400321;
        Wed, 21 Jun 2023 19:36:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001b679ec20f2sm4143691plb.31.2023.06.21.19.36.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 19:36:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 19/23] dbus: upgrade 1.14.6 -> 1.14.8
Date: Wed, 21 Jun 2023 16:35:51 -1000
Message-Id: <c1f21ec27cc7ac54040457c8591fdfedf25440bf.1687401182.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687401182.git.steve@sakoman.com>
References: <cover.1687401182.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 02:36:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183219

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Update dbus to 1.14.8 to fix CVE-2023-34969 and serveral bugs

changes:
https://gitlab.freedesktop.org/dbus/dbus/-/blob/f90d4f16933ee5153fe02c405eb883c9cb8f0ad5/NEWS

commits:
55d11f57 doc/dbus-api-design: fix wrong closing tag
a96f417f CI: Run a detached pipeline for merge requests
9e0477fc CI: Only run for pushes to dbus
077f7e43 CI: Remove an obsolete workaround
07fe44f4 CI: Update Windows runners
ec708d55 CI: Avoid using a no-op download location that gives a 403 error
45e6e93e dbus_message_iter_get_signature: Fix two memory leaks on OOM
0bb1942e dbus-internals: use `_DBUS_FUNCTION_NAME` in `_dbus_verbose()`
8df1b8be dbus-sysdeps-win: do not log function name twice
5c3a4e81 dbus-spawn-win: use `_DBUS_FUNCTION_NAME` instead of `__FUNCTION__`
8e457296 Update NEWS
e1ffce17 Revert "CI: Remove an obsolete workaround"
40c0802f monitor test: Log the messages that we monitored
a70c8f2f bus: Assign a serial number for messages from the driver
39b5c617 monitor test: Reproduce #457
f99e5de1 Update NEWS
21414587 AUTHORS: Update
f90d4f16 Release v1.14.8

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/dbus/{dbus_1.14.6.bb => dbus_1.14.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/dbus/{dbus_1.14.6.bb => dbus_1.14.8.bb} (98%)

diff --git a/meta/recipes-core/dbus/dbus_1.14.6.bb b/meta/recipes-core/dbus/dbus_1.14.8.bb
similarity index 98%
rename from meta/recipes-core/dbus/dbus_1.14.6.bb
rename to meta/recipes-core/dbus/dbus_1.14.8.bb
index da25155773..b6c245d40b 100644
--- a/meta/recipes-core/dbus/dbus_1.14.6.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.8.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://dbus-1.init \
            "
 
-SRC_URI[sha256sum] = "fd2bdf1bb89dc365a46531bff631536f22b0d1c6d5ce2c5c5e59b55265b3d66b"
+SRC_URI[sha256sum] = "a6bd5bac5cf19f0c3c594bdae2565a095696980a683a0ef37cb6212e093bde35"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
-- 
2.34.1


